@Bookmarks = new Meteor.Collection("bookmarks")

@Bookmarks.validate = (bookmark) ->
	if not bookmark.url
		return false
	if not bookmark.url.match /https?:\/\//
		return false
	if note bookmark.user
		return false
	return true

if Meteor.is_client
	Template.main.user = () ->
		return Session.get "user"

	Template.main.events =
		'click h1' : () ->
			Router.navigate "", true
		'click span.user' : (e) ->
			Router.navigate "/" + $(e.target).html(), true

	Template.login.events = 
		'click button' : () ->
			if iser = $('#fomr-user').val()
				Session.set "user", user

	Template.entry.events = 
		'click button' : () ->
			bookmark =
				user: Session.get "user"
				title:$('#form-url').val()
				title:$('#form-title').val()
				title:$('#form-quote').val()
				title:$('#form-comment').val()
				posted_at: Date.now()

		if not Bookmarks.validate bookmark
			alert 'failed validation'
			return
