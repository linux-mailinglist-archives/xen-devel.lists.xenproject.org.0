Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDD12F88E6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:52:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68733.123168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Xxc-00020f-KF; Fri, 15 Jan 2021 22:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68733.123168; Fri, 15 Jan 2021 22:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Xxc-0001ze-Fh; Fri, 15 Jan 2021 22:52:52 +0000
Received: by outflank-mailman (input) for mailman id 68733;
 Fri, 15 Jan 2021 22:52:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0Xxb-0001jt-JO
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:52:51 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d891335-8e82-4711-b386-0ce786eecc66;
 Fri, 15 Jan 2021 22:52:43 +0000 (UTC)
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
X-Inumbo-ID: 4d891335-8e82-4711-b386-0ce786eecc66
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PHd8ibAmz3y4d18ZBR6evC+akkeyLiBTovT6aCSEtlo=;
  b=aI+l2DuIzvIgz0JThekgEnOFfKK8WYs8zPbA3gMNEhPK9bPafN85zvax
   Fk+G5ilt4WI7LDHqz6amtDQhlH/n9a5J+unxMxgxV25M+V5f0GvCUVuHq
   XCqgB35wVUDT6yejl9K0RNjyghwx6DVPw7SHrcaa+y7B/As5F0K5iAEqo
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MoOL9HgsoRlZpHvVYMwVg76P/8QHGE+y3iOBZGBMrY+r4560E3TbKuWHW9LEaFqBNuY6ooGuXA
 +VzD4cDRrWYhZV19DGyaRnbfeR5RyzKMin87dONsdRaEVvxEw7J70DDm+2QxK7xczOj6Dh0Vqi
 o5nZtjwdAz6Xi9gRHsTqz9CmgF9S36d7vxiIqFiAg4emNrMkI+Bhtd6js4M5rV6VypuXCw3L8V
 WBD623jxKxNa/M+A9Y4M3L4XqjM1aXWA2pbWI1YROUtVdJ3AiknRjTggvbwomTBHTWiQ+fKQsY
 3/A=
X-SBRS: 5.1
X-MesageID: 36512267
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="36512267"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 3/5] tools/ocaml/xenstored: add binary dump format support
Date: Fri, 15 Jan 2021 22:29:02 +0000
Message-ID: <4142c4a8c0859cace45473780a2ac63823e6af36.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/connection.ml | 63 +++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 16 deletions(-)

diff --git a/tools/ocaml/xenstored/connection.ml b/tools/ocaml/xenstored/connection.ml
index 51041dde8e..1f9fe9e3b2 100644
--- a/tools/ocaml/xenstored/connection.ml
+++ b/tools/ocaml/xenstored/connection.ml
@@ -17,6 +17,7 @@
 exception End_of_file
 
 open Stdext
+module LR = Disk.LiveRecord
 
 let xenstore_payload_max = 4096 (* xen/include/public/io/xs_wire.h *)
 
@@ -77,6 +78,10 @@ let number_of_transactions con =
 
 let get_domain con = con.dom
 
+let get_id con = match con.dom with
+| None -> 2*LR.domid_invalid + con.anonid
+| Some dom -> 1 + Domain.get_id dom
+
 let anon_id_next = ref 1
 
 let get_domstr con =
@@ -279,6 +284,9 @@ let end_transaction con tid commit =
 let get_transaction con tid =
 	Hashtbl.find con.transactions tid
 
+let iter_transactions con f =
+	Hashtbl.iter f con.transactions
+
 let do_input con = Xenbus.Xb.input con.xb
 let has_input con = Xenbus.Xb.has_in_packet con.xb
 let has_partial_input con = match con.xb.Xenbus.Xb.partial_in with
@@ -337,22 +345,45 @@ let incr_ops con = con.stat_nb_ops <- con.stat_nb_ops + 1
 let stats con =
 	Hashtbl.length con.watches, con.stat_nb_ops
 
-let dump con chan =
-	let id = match con.dom with
-	| Some dom ->
-		let domid = Domain.get_id dom in
-		(* dump domain *)
-		Domain.dump dom chan;
-		domid
-	| None ->
-		let fd = con |> get_fd |> Utils.FD.to_int in
-		Printf.fprintf chan "socket,%d\n" fd;
-		-fd
-	in
-	(* dump watches *)
-	List.iter (fun (path, token) ->
-		Printf.fprintf chan "watch,%d,%s,%s\n" id (Utils.hexify path) (Utils.hexify token)
-		) (list_watches con)
+let serialize_pkt_in buf xb =
+	let open Xenbus.Xb in
+	Queue.iter (fun p -> Buffer.add_string buf (Packet.to_string p)) xb.pkt_in;
+	match xb.partial_in with
+	| NoHdr (to_read, hdrb) ->
+		(* see Xb.input *)
+		let used = Xenbus.Partial.header_size () - to_read in
+		Buffer.add_subbytes buf hdrb 0 used
+	| HaveHdr p ->
+		p |> Packet.of_partialpkt |> Packet.to_string |> Buffer.add_string buf
+
+let serialize_pkt_out buf xb =
+	let open Xenbus.Xb in
+	Buffer.add_string buf xb.partial_out;
+	Queue.iter (fun p -> Buffer.add_string buf (Packet.to_string p)) xb.pkt_out
+
+let dump con store chan =
+	let conid = get_id con in
+	let conn = match con.dom with
+	| None -> LR.Socket (get_fd con)
+	| Some dom -> LR.Domain {
+		id = Domain.get_id dom;
+		target = LR.domid_invalid;  (* TODO: we do not store this info *)
+		remote_port = Domain.get_remote_port dom
+	} in
+	let pkt_in = Buffer.create 4096 in
+	let pkt_out = Buffer.create 4096 in
+	serialize_pkt_in pkt_in con.xb;
+	serialize_pkt_out pkt_out con.xb;
+	LR.write_connection_data chan ~conid ~conn  pkt_in con.xb.partial_out pkt_out;
+
+	con |> list_watches
+	|> List.rev (* preserve order in dump/reload *)
+	|> List.iter (fun (wpath, token) ->
+		LR.write_watch_data chan ~conid ~wpath ~token
+	);
+	let conpath = get_path con in
+	iter_transactions con (fun _ txn ->
+		 Transaction.dump store conpath ~conid txn chan)
 
 let debug con =
 	let domid = get_domstr con in
-- 
2.29.2


