Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FF937ADCD
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 20:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125898.236981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWmV-0000lH-7L; Tue, 11 May 2021 18:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125898.236981; Tue, 11 May 2021 18:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWmV-0000hs-3N; Tue, 11 May 2021 18:06:55 +0000
Received: by outflank-mailman (input) for mailman id 125898;
 Tue, 11 May 2021 18:06:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWmT-0000hb-Qp
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:06:53 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 030b699d-ba57-4ff2-92aa-1b1c49c25836;
 Tue, 11 May 2021 18:06:52 +0000 (UTC)
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
X-Inumbo-ID: 030b699d-ba57-4ff2-92aa-1b1c49c25836
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620756412;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LJybmG+tBz4IHj5Tv2R6AGzuVV3gHz/bSFDawWJReUw=;
  b=Hnnvl/WIu49Q1HX5O/aKBIEfWdKtoAt7mEYDZvtniN6G3BnePUKKK1PY
   9rvhEQQdDQBfleGYU5VP4407exUB0fSLugsxUN3j+NYE40PQvbPLVUphE
   EDq4BiXLw2XEfNud2dQTY9jJXPg4KvR7ZXNOruBNG0o8u7C7GEgO0G7FO
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2XBnpXDrfeAUsHExPzOU4DUtdbP3NkWpMxhDt2/N9KZXxZrAf8DE0E5VECDQoJdKOe+eVTcUNF
 Wnmairsgd8GscxkAymYmA3YauKCpr1MTQ2uil240NVafuLPpsq9xQngdpRpUsBhX7Ohp+OMTXA
 PXGdzw8acPYvfu9axqxRLUENFfoSAVc5Pz+jYARskbiOkPiC/jlNwiX6jUB2tomNkcjxCk8hOc
 xZEN8fdlRy8TbvcSYyGEdqIOjuIuflsOuaJR/gDe/FuEkYMYl1gDEGsi23CBbnmVQaX6d6nnvd
 m34=
X-SBRS: 5.1
X-MesageID: 43675314
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:S4LKvq39hDQLwVEJvbUAtwqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43675314"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 05/17] tools/ocaml/xenstored: add binary dump format support
Date: Tue, 11 May 2021 19:05:18 +0100
Message-ID: <f454c3c6c5d33049ba72ac7ca75c8bbe684676bc.1620755942.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Do not dump -1, it'll trigger an assertion, use 0xFF.. instead.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/connection.ml | 63 +++++++++++++++++++++--------
 tools/ocaml/xenstored/disk.ml       |  3 +-
 2 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/tools/ocaml/xenstored/connection.ml b/tools/ocaml/xenstored/connection.ml
index 65f99ea6f2..7a894a2eb1 100644
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
@@ -278,6 +283,9 @@ let end_transaction con tid commit =
 let get_transaction con tid =
 	Hashtbl.find con.transactions tid
 
+let iter_transactions con f =
+	Hashtbl.iter f con.transactions
+
 let do_input con = Xenbus.Xb.input con.xb
 let has_input con = Xenbus.Xb.has_in_packet con.xb
 let has_partial_input con = match con.xb.Xenbus.Xb.partial_in with
@@ -336,22 +344,45 @@ let incr_ops con = con.stat_nb_ops <- con.stat_nb_ops + 1
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
diff --git a/tools/ocaml/xenstored/disk.ml b/tools/ocaml/xenstored/disk.ml
index 595fdab54a..59794324e1 100644
--- a/tools/ocaml/xenstored/disk.ml
+++ b/tools/ocaml/xenstored/disk.ml
@@ -292,7 +292,8 @@ module LiveRecord = struct
 	let write_global_data t ~rw_sock =
 		write_record t Type.global_data 8 @@ fun b ->
 		O.w32 b (FD.to_int rw_sock);
-		O.w32 b (-1)
+                (* TODO: this needs a unit test/live update test too! *)
+		O.w32 b 0xFFFF_FFFF
 
 	let read_global_data t ~len f =
 		read_expect t "global_data" 8 len;
-- 
2.25.1


