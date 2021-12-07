# https://developer.gnome.org/gtk3/stable/ch01s03.html
# builder.nim -- application style example using builder/glade xml file for user interface
# nim c builder.nim
import gintro/[gtk, glib, gobject, gio]

proc quitApp(b: Button; app: Application) =
  echo "Bye"
  quit(app)

proc appActivate(app: Application) =
  let builder = newBuilder()
  discard builder.addFromFile("builder.ui")
  let window = builder.getApplicationWindow("window")
  window.setApplication(app)
  #showAll(window)

proc main =
  let app = newApplication("org.gtk.example")
  connect(app, "activate", appActivate)
  discard run(app)

main()