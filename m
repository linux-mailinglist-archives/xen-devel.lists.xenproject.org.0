Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE1B281771
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 18:07:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2251.6684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kONaF-0001g6-CX; Fri, 02 Oct 2020 16:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2251.6684; Fri, 02 Oct 2020 16:06:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kONaF-0001fh-9A; Fri, 02 Oct 2020 16:06:59 +0000
Received: by outflank-mailman (input) for mailman id 2251;
 Fri, 02 Oct 2020 16:06:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=17n0=DJ=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kONaC-0001fb-Tm
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 16:06:56 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67ec1aad-eedb-4650-b28c-667b475d21ed;
 Fri, 02 Oct 2020 16:06:55 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=17n0=DJ=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
	id 1kONaC-0001fb-Tm
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 16:06:56 +0000
X-Inumbo-ID: 67ec1aad-eedb-4650-b28c-667b475d21ed
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 67ec1aad-eedb-4650-b28c-667b475d21ed;
	Fri, 02 Oct 2020 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601654815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kWlD97+J77zfqraf9mQurnjq4WYZN4aMKHgQBs/w+3g=;
  b=L9KoOo44yexTKWWhspGx3mWDy5U9kR7PLBi/YL2esN66A2m/axn/DtNb
   BmGHwAcZvlTDB3+1PomwLlHoD+1wki1RS9Odyf0ta+aMiMKKVEvVXY4Wq
   2dUo9w2E3QhHo6c6h2sKZzuGLNYegqKmrVZP0wCjvzFWSEjOuaS5XX+QW
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9DTmAvoikkF1lSy5cgeBhWYvScaBL9pRd6NMkUNF6NQJ5LGerhEoKwSwPDX9GUeSnVgZxIlmTG
 CoQg4Duw0oDF4o7zGAUtNdbkaHZUSBYAXGBWJWMviJJXfBZ+4qqOJD5sAG1oj/AIzh2WH6vkh8
 ztNg4/Y7PE2LcgZRKO7eTBlsBD/GgbhSj4t3tcmq+kfWxA/M9GvgsBa648ZpRGW2vaPbeDucdz
 5ydJQMxcoyYduMp7B25mXxxn+VzC3Qmx4txheLHmL+S+LTgvo/dtxmiUMHxowq/k5PwtGb5Xx7
 W0Q=
X-SBRS: None
X-MesageID: 28442812
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,328,1596513600"; 
   d="scan'208";a="28442812"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 1/1] tools/ocaml/xenstored: drop the creation of the RO socket
Date: Fri, 2 Oct 2020 17:06:32 +0100
Message-ID: <0cc19ced022e2a302fccf42bf9521c61dd0dca8a.1601654648.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1601654648.git.edvin.torok@citrix.com>
References: <cover.1601654648.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The readonly flag was propagated but ignored, so this was essentially
equivalent to a RW socket.

C xenstored is dropping the RO socket too, so drop it from oxenstored too.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/connections.ml |  2 +-
 tools/ocaml/xenstored/define.ml      |  1 -
 tools/ocaml/xenstored/xenstored.ml   | 15 ++++++---------
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/tools/ocaml/xenstored/connections.ml b/tools/ocaml/xenstored/connections.ml
index f02ef6b526..f2c4318c88 100644
--- a/tools/ocaml/xenstored/connections.ml
+++ b/tools/ocaml/xenstored/connections.ml
@@ -31,7 +31,7 @@ let create () = {
 	watches = Trie.create ()
 }
 
-let add_anonymous cons fd _can_write =
+let add_anonymous cons fd =
 	let xbcon = Xenbus.Xb.open_fd fd in
 	let con = Connection.create xbcon None in
 	Hashtbl.add cons.anonymous (Xenbus.Xb.get_fd xbcon) con
diff --git a/tools/ocaml/xenstored/define.ml b/tools/ocaml/xenstored/define.ml
index 2965c08534..ea9e1b7620 100644
--- a/tools/ocaml/xenstored/define.ml
+++ b/tools/ocaml/xenstored/define.ml
@@ -18,7 +18,6 @@ let xenstored_major = 1
 let xenstored_minor = 0
 
 let xs_daemon_socket = Paths.xen_run_stored ^ "/socket"
-let xs_daemon_socket_ro = Paths.xen_run_stored ^ "/socket_ro"
 
 let default_config_dir = Paths.xen_config_dir
 
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 5b96f1852a..7e7824761b 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -242,12 +242,11 @@ let _ =
 		()
 	);
 
-	let rw_sock, ro_sock =
+	let rw_sock =
 		if cf.disable_socket then
-			None, None
+			None
 		else
-			Some (Unix.handle_unix_error Utils.create_unix_socket Define.xs_daemon_socket),
-			Some (Unix.handle_unix_error Utils.create_unix_socket Define.xs_daemon_socket_ro)
+			Some (Unix.handle_unix_error Utils.create_unix_socket Define.xs_daemon_socket)
 		in
 
 	if cf.daemonize then
@@ -320,15 +319,14 @@ let _ =
 
 	let spec_fds =
 		(match rw_sock with None -> [] | Some x -> [ x ]) @
-		(match ro_sock with None -> [] | Some x -> [ x ]) @
 		(if cf.domain_init then [ Event.fd eventchn ] else [])
 		in
 
 	let process_special_fds rset =
-		let accept_connection can_write fd =
+		let accept_connection fd =
 			let (cfd, _addr) = Unix.accept fd in
 			debug "new connection through socket";
-			Connections.add_anonymous cons cfd can_write
+			Connections.add_anonymous cons cfd
 		and handle_eventchn _fd =
 			let port = Event.pending eventchn in
 			debug "pending port %d" (Xeneventchn.to_int port);
@@ -348,8 +346,7 @@ let _ =
 			if List.mem fd set then
 				fct fd in
 
-		maybe (fun fd -> do_if_set fd rset (accept_connection true)) rw_sock;
-		maybe (fun fd -> do_if_set fd rset (accept_connection false)) ro_sock;
+		maybe (fun fd -> do_if_set fd rset accept_connection) rw_sock;
 		do_if_set (Event.fd eventchn) rset (handle_eventchn)
 	in
 
-- 
2.25.1


