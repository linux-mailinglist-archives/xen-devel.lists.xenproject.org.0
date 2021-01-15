Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6382F88E2
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:52:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68726.123131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XxT-0001ly-Do; Fri, 15 Jan 2021 22:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68726.123131; Fri, 15 Jan 2021 22:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XxT-0001kz-8l; Fri, 15 Jan 2021 22:52:43 +0000
Received: by outflank-mailman (input) for mailman id 68726;
 Fri, 15 Jan 2021 22:52:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0XxR-0001jt-Kb
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:52:41 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 112507ef-6449-4931-bcc5-a9048cea50c8;
 Fri, 15 Jan 2021 22:52:39 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 112507ef-6449-4931-bcc5-a9048cea50c8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=augisCiDAmdzwz8nZWWTgE5LegS6N8R0zEPLsBzdOTA=;
  b=QU82e0qSt4lI3Ao8lVEuiiPLnqwWAyZVE+kGvSHmjVhtUi8iOZTOEUD8
   FmZE8afXaiKiOnVQMhvoZFAg/bwM9TMWTTyAJCi4aG8mTm6XYjD9xF+6i
   k7kYbpx9Pg6G6IZpZxJhSIpNhbdjMsELUy1rhqABmpDGna9wonCnS81jo
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9jlr/S+Fg0jA0mFFaWVtVhO82mWeFmb6c+xVOZz+81qBhs4FkeJTYRq6spJHCsiWM1cK55DYHL
 WRSoJgQMfx11TpkCHZSPiFdSzsmotWCTXbVaavv60by8Rvav/4guc9rGgJmseVkUomN9iGQKSS
 blw9ALxKH5V2Uh4jKQ14AVEfhkzg/6+J9ivkDpBYUs23WTwSWRPW54IvvjTacDdTMXdKh4ET+8
 YVN/ZYJKYdyb+4DqlIFZpkhnV14y8xW2CRItXbVGE8wJGBXue775uCwBSgNmOktwnMvdzakZ49
 6LA=
X-SBRS: 5.1
X-MesageID: 35591688
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35591688"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Pau Ruiz Safont
	<pau.safont@citrix.com>
Subject: [PATCH v2 7/8] tools/ocaml/xenstored: start live update process
Date: Fri, 15 Jan 2021 22:28:49 +0000
Message-ID: <4164cb728313c3b9fc38cf5e9ecb790ac93a9600.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Reviewed-by: Pau Ruiz Safont <pau.safont@citrix.com>
Reviewed-by: Christian Lindig <christian.lindig@citrix.com>

---
Changed since V1:
* post publicly now that the XSA is out
---
 tools/ocaml/xenstored/logging.ml   |  3 +++
 tools/ocaml/xenstored/process.ml   |  8 +++++---
 tools/ocaml/xenstored/xenstored.ml | 29 ++++++++++++++++++++++-------
 3 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/tools/ocaml/xenstored/logging.ml b/tools/ocaml/xenstored/logging.ml
index 1ede131329..39c3036155 100644
--- a/tools/ocaml/xenstored/logging.ml
+++ b/tools/ocaml/xenstored/logging.ml
@@ -327,6 +327,9 @@ let end_transaction ~tid ~con =
 	if !access_log_transaction_ops && tid <> 0
 	then access_logging ~tid ~con (XbOp Xenbus.Xb.Op.Transaction_end) ~level:Debug
 
+let live_update () =
+	xb_op ~tid:0 ~con:"" ~ty:Xenbus.Xb.Op.Debug "Live update begin"
+
 let xb_answer ~tid ~con ~ty data =
 	let print, level = match ty with
 		| Xenbus.Xb.Op.Error when String.startswith "ENOENT" data -> !access_log_read_ops , Warn
diff --git a/tools/ocaml/xenstored/process.ml b/tools/ocaml/xenstored/process.ml
index c3c5dc58c0..3174d8ede5 100644
--- a/tools/ocaml/xenstored/process.ml
+++ b/tools/ocaml/xenstored/process.ml
@@ -112,6 +112,7 @@ let string_of_t t =
 let launch_exn t =
 	let executable, rest = args_of_t t in
 	let args = Array.of_list (executable :: rest) in
+	info "Launching %s, args: %s" executable (String.concat " " rest);
 	Unix.execv args.(0) args
 
 let validate_exn t =
@@ -151,7 +152,7 @@ let parse_live_update args =
 		| "-s" :: _ ->
 			let timeout = ref 60 in
 			let force = ref false in
-			Arg.parse_argv ~current:(ref 1) (Array.of_list args)
+			Arg.parse_argv ~current:(ref 0) (Array.of_list args)
 				[ ( "-t"
 				, Arg.Set_int timeout
 				, "timeout in seconds to wait for active transactions to finish"
@@ -166,7 +167,7 @@ let parse_live_update args =
 				{!state with deadline = Unix.gettimeofday () +. float !timeout
 				; force= !force; pending= true}
 		| _ ->
-			invalid_arg ("Unknown arguments: " ^ String.concat " " args)) ;
+			invalid_arg ("Unknown arguments: " ^ String.concat "," args)) ;
 	None
 	with
 	| Arg.Bad s | Arg.Help s | Invalid_argument s ->
@@ -200,7 +201,8 @@ let do_debug con t _domains cons data =
 	then None
 	else try match split None '\000' data with
 	| "live-update" :: params ->
-		LiveUpdate.parse_live_update params
+		let dropped_trailing_nul = params |> List.rev |> List.tl |> List.rev in
+		LiveUpdate.parse_live_update dropped_trailing_nul
 	| "print" :: msg :: _ ->
 		Logging.xb_op ~tid:0 ~ty:Xenbus.Xb.Op.Debug ~con:"=======>" msg;
 		None
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 500d96753b..22413271fb 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -311,6 +311,11 @@ let _ =
 		);
 	);
 
+	(* required for xenstore-control to detect availability of live-update *)
+	Store.mkdir store Perms.Connection.full_rights (Store.Path.of_string "/tool");
+	Store.write store Perms.Connection.full_rights
+		(Store.Path.of_string "/tool/xenstored") Sys.executable_name;
+
 	Sys.set_signal Sys.sighup (Sys.Signal_handle sighup_handler);
 	Sys.set_signal Sys.sigterm (Sys.Signal_handle (fun _ ->
 		 info "Received SIGTERM";
@@ -483,18 +488,28 @@ let _ =
 		in
 
 	Systemd.sd_notify_ready ();
+	let live_update = ref false in
 	while not (!quit && Connections.prevents_quit cons = [])
 	do
 		try
-			main_loop ()
+			main_loop ();
+			live_update := Process.LiveUpdate.should_run cons;
+			if !live_update || !quit then begin
+				(* don't initiate live update if saving state fails *)
+				DB.to_file store cons Disk.xs_daemon_database;
+				quit := true;
+			end
 		with exc ->
-			error "caught exception %s" (Printexc.to_string exc);
+			let bt = Printexc.get_backtrace () in
+			error "caught exception %s: %s" (Printexc.to_string exc) bt;
 			if cf.reraise_top_level then
 				raise exc
 	done;
 	info "stopping xenstored";
-		DB.to_file store cons Disk.xs_daemon_database;
-		(* unlink pidfile so that launch-xenstore works again *)
-		Unixext.unlink_safe pidfile;
-		(match cf.pidfile with Some pidfile -> Unixext.unlink_safe pidfile | None -> ());
-	()
+	(* unlink pidfile so that launch-xenstore works again *)
+	Unixext.unlink_safe pidfile;
+	(match cf.pidfile with Some pidfile -> Unixext.unlink_safe pidfile | None -> ());
+	if !live_update then begin
+		 Logging.live_update ();
+		 Process.LiveUpdate.launch_exn !Process.LiveUpdate.state
+	end
-- 
2.29.2


