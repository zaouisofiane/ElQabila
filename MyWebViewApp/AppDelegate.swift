import UIKit
import OneSignalFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var server: WebServer!
    var serverPort: UInt16 = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Démarrage du serveur local (nécessaire pour ce projet spécifique)
        server = WebServer()
        server.run()
        serverPort = server.listeningPort
        
        // --- INITIALISATION ONESIGNAL ---
        // Remplace l'ID ci-dessous par ton App ID OneSignal
        OneSignal.initialize("TON_ID_APP_ONESIGNAL", withLaunchOptions: launchOptions)
        
        // Demande de permission pour les notifications
        OneSignal.Notifications.requestPermission({ accepted in
            print("L'utilisateur a accepté les notifications: \(accepted)")
        }, fallbackToSettings: true)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}
}
