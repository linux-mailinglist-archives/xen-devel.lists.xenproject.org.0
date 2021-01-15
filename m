Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A782F886F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:30:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68662.122976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XbU-0006D9-7w; Fri, 15 Jan 2021 22:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68662.122976; Fri, 15 Jan 2021 22:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XbU-0006CP-0r; Fri, 15 Jan 2021 22:30:00 +0000
Received: by outflank-mailman (input) for mailman id 68662;
 Fri, 15 Jan 2021 22:29:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0XbT-00061Y-5d
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:29:59 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3aabfd2-998e-4de8-9ee5-2441aabbaaf3;
 Fri, 15 Jan 2021 22:29:50 +0000 (UTC)
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
X-Inumbo-ID: d3aabfd2-998e-4de8-9ee5-2441aabbaaf3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610749790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6dNoOpxPMfbkvAFQKGVZg+g4DArUnz6wcJHSzYnlKes=;
  b=gms080TbWYlCG2O3cgCyEhdn2zxvN8BlmqiDjZVJd79c+b5VKVGEZYLN
   Iw0gCpkFNQWL8xbmgIBO2AxvWYmwXHDjuhkCHExbN9+CWUEI2LV/c1L1i
   uOoGfNs/0p12R+cfpz07XZ3PdezQ7212siISe55V4zGcqcD08aftMy9cm
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8JIRRQ/vTnM8hZE8q0nckRqCFDUqGtRyZFzsPEFzkfGMNg4c5LceWHyUP9Jxq7zq2wErry/YY6
 p8azCp7mDxtfmHPk5pnN0E8LDinNV9HZm7OYn6Nn1wfrJiWO8n4HQMpkv3v6JsML2mAC/G/nkF
 R7HdRGjbgRQV46p7co/hjVDRB/mieTIbLw2y/Q7LIRfsOmMwVCRzSS8cl9P8ZheLCpbdcU1orK
 Vp8BlpFnAS9hMgrqkDIaa+gTHCb07n3Ot13bPjyGuR4SfgwmnyX8ZWFg2/XvL5M8zqeHQIJOdE
 his=
X-SBRS: 5.1
X-MesageID: 36511519
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="36511519"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Pau Ruiz Safont
	<pau.safont@citrix.com>
Subject: [PATCH v2 5/8] tools/ocaml/xenstored: Automatically resume when possible
Date: Fri, 15 Jan 2021 22:28:47 +0000
Message-ID: <d2685b9283b7658d6b0454beb35e8348d00c9ec9.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When a `db` file exists use it to resume oxenstored.
It will contains a xenstore tree, domain reconnection info, and watches.

It is currently missing data about all active socket connections,
so a toolstack should ideally be stopped and restarted too.

Tell systemd about oxenstored's PID and allow it to restart on success.

This should make updating oxenstored as easy as:
`systemctl stop -s SIGTERM xenstored` on a suitable xenstored version.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Reviewed-by: Pau Ruiz Safont <pau.safont@citrix.com>
Reviewed-by: Christian Lindig <christian.lindig@citrix.com>

---
Changed since V1:
* post publicly now that the XSA is out
---
 tools/ocaml/xenstored/xenstored.ml | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 6b5381962b..500d96753b 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -292,9 +292,8 @@ let _ =
 	List.iter (fun path ->
 		Store.write store Perms.Connection.full_rights path "") Store.Path.specials;
 
-	let filename = Paths.xen_run_stored ^ "/db" in
-	if cf.restart && Sys.file_exists filename then (
-		DB.from_file store domains cons filename;
+	if cf.restart && Sys.file_exists Disk.xs_daemon_database then (
+		DB.from_file store domains cons Disk.xs_daemon_database;
 		Event.bind_dom_exc_virq eventchn
 	) else (
 		if !Disk.enable then (
@@ -320,7 +319,7 @@ let _ =
 	Sys.set_signal Sys.sigpipe Sys.Signal_ignore;
 
 	if cf.activate_access_log then begin
-		let post_rotate () = DB.to_file store cons (Paths.xen_run_stored ^ "/db") in
+		let post_rotate () = DB.to_file store cons Disk.xs_daemon_database in
 		Logging.init_access_log post_rotate
 	end;
 
@@ -494,5 +493,8 @@ let _ =
 				raise exc
 	done;
 	info "stopping xenstored";
-	DB.to_file store cons (Paths.xen_run_stored ^ "/db");
+		DB.to_file store cons Disk.xs_daemon_database;
+		(* unlink pidfile so that launch-xenstore works again *)
+		Unixext.unlink_safe pidfile;
+		(match cf.pidfile with Some pidfile -> Unixext.unlink_safe pidfile | None -> ());
 	()
-- 
2.29.2


