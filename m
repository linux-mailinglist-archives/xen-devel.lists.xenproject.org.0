Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1C6254C46
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 19:36:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBLpG-00059z-2a; Thu, 27 Aug 2020 17:36:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCk+=CF=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kBLpE-00059U-FW
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 17:36:36 +0000
X-Inumbo-ID: 9e99c8a3-de53-48ad-9062-16ee83d21763
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e99c8a3-de53-48ad-9062-16ee83d21763;
 Thu, 27 Aug 2020 17:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598549795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ddwzCu/Z0nRYb/kzN7KiptJMnIO08PPDszupxwwzGJ0=;
 b=MYPxWbL9by2C0o6wCurCVCqTxiwyhkA6GU6l4bwL+EEoRqG3mo5SbNzS
 fak4drgIddv5K+cs+js95EfYluJmEzLhUY1UTo/HMweEqkbLXMwq8XYYA
 4Lce/FD7Eq7aDyQFlqgJBQRiphxrpgpc6a2gLhBJ/uC/wjZgZMqyYFt2k A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: DXlfC3haA2AR6pJN/KQ4TpOc7Gsgk4d42vnFnC6LVgALQF4cvWIrTOhddyJW7aiZiytaxQdvdZ
 rl903DhukmgxW6Xtl9d9dnf7jA4iJnFM2evnmJxaIbarvAeP8vDi0+WwKybb8Rc4fJThUt0uFE
 2xfs3OUo78NU+ybe89yi82lv928HGkkgN/Sjulscg7wH5K/sCe9i9Ej3wdl1tE6rnmAdrhe6Dj
 lDO8uWRRsLfFa7zBbdKgylIOj/0aisWBNussW1a176aQriRp6iXpXaVcVf8yLeBgzqQ15bI0gq
 U3A=
X-SBRS: 2.7
X-MesageID: 25446295
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,360,1592884800"; d="scan'208";a="25446295"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, "Signed-off-by :
 Juergen Gross" <jgross@suse.com>
Subject: [PATCH v1 7/9] tools/ocaml/xenstored: don't store domU's mfn of ring
 page
Date: Thu, 27 Aug 2020 18:35:58 +0100
Message-ID: <fea0aefcb9fc8fb8133bbf6146e43e5c964b63d6.1598548832.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1598548832.git.edvin.torok@citrix.com>
References: <cover.1598548832.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a port of the following C xenstored commit
122b52230aa5b79d65e18b8b77094027faa2f8e2 tools/xenstore: don't store domU's mfn of ring page in xenstored

Backwards compat: accept a domain dump both with and without MFN.

CC: Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/domain.ml    |  7 ++-----
 tools/ocaml/xenstored/domains.ml   |  6 +++---
 tools/ocaml/xenstored/process.ml   | 16 +++++-----------
 tools/ocaml/xenstored/xenstored.ml |  8 ++++----
 4 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/tools/ocaml/xenstored/domain.ml b/tools/ocaml/xenstored/domain.ml
index 2d9c1f5d09..b11a2f39f5 100644
--- a/tools/ocaml/xenstored/domain.ml
+++ b/tools/ocaml/xenstored/domain.ml
@@ -22,7 +22,6 @@ let warn  fmt = Logging.warn  "domain" fmt
 type t =
 {
 	id: Xenctrl.domid;
-	mfn: nativeint;
 	interface: Xenmmap.t;
 	eventchn: Event.t;
 	mutable remote_port: int;
@@ -41,7 +40,6 @@ let is_dom0 d = d.id = 0
 let get_path dom = "/local/domain/" ^ (sprintf "%u" dom.id)
 let get_id domain = domain.id
 let get_interface d = d.interface
-let get_mfn d = d.mfn
 let get_remote_port d = d.remote_port
 let get_port d = d.port
 
@@ -62,7 +60,7 @@ let string_of_port = function
 | Some x -> string_of_int (Xeneventchn.to_int x)
 
 let dump d chan =
-	fprintf chan "dom,%d,%nd,%d\n" d.id d.mfn d.remote_port
+	fprintf chan "dom,%d,%d\n" d.id d.remote_port
 
 let notify dom = match dom.port with
 | None ->
@@ -88,9 +86,8 @@ let close dom =
 	Xenmmap.unmap dom.interface;
 	()
 
-let make id mfn remote_port interface eventchn = {
+let make id remote_port interface eventchn = {
 	id = id;
-	mfn = mfn;
 	remote_port = remote_port;
 	interface = interface;
 	eventchn = eventchn;
diff --git a/tools/ocaml/xenstored/domains.ml b/tools/ocaml/xenstored/domains.ml
index d9cb693751..0dfeed193a 100644
--- a/tools/ocaml/xenstored/domains.ml
+++ b/tools/ocaml/xenstored/domains.ml
@@ -124,10 +124,10 @@ let cleanup doms =
 let resume _doms _domid =
 	()
 
-let create doms domid mfn port =
+let create doms domid port =
 	let mapping = Gnt.(Gnttab.map_exn doms.gnttab { domid; ref = xenstore} true) in
 	let interface = Gnt.Gnttab.Local_mapping.to_pages doms.gnttab mapping in
-	let dom = Domain.make domid mfn port interface doms.eventchn in
+	let dom = Domain.make domid port interface doms.eventchn in
 	Hashtbl.add doms.table domid dom;
 	Domain.bind_interdomain dom;
 	dom
@@ -147,7 +147,7 @@ let create0 doms =
 			port, interface
 		)
 		in
-	let dom = Domain.make 0 Nativeint.zero port interface doms.eventchn in
+	let dom = Domain.make 0 port interface doms.eventchn in
 	Hashtbl.add doms.table 0 dom;
 	Domain.bind_interdomain dom;
 	Domain.notify dom;
diff --git a/tools/ocaml/xenstored/process.ml b/tools/ocaml/xenstored/process.ml
index ff5c9484fc..73d7411e59 100644
--- a/tools/ocaml/xenstored/process.ml
+++ b/tools/ocaml/xenstored/process.ml
@@ -97,10 +97,6 @@ let do_debug con t _domains cons data =
 	| "watches" :: _ ->
 		let watches = Connections.debug cons in
 		Some (watches ^ "\000")
-	| "mfn" :: domid :: _ ->
-		let domid = int_of_string domid in
-		let con = Connections.find_domain cons domid in
-		may (fun dom -> Printf.sprintf "%nd\000" (Domain.get_mfn dom)) (Connection.get_domain con)
 	| _ -> None
 	with _ -> None
 
@@ -409,20 +405,18 @@ let do_introduce con _t domains cons data =
 	let dom =
 		if Domains.exist domains domid then
 			let edom = Domains.find domains domid in
-			if (Domain.get_mfn edom) = mfn && (Connections.find_domain cons domid) != con then begin
-				(* Use XS_INTRODUCE for recreating the xenbus event-channel. *)
-				edom.remote_port <- port;
-				Domain.bind_interdomain edom;
-			end;
+			(* Use XS_INTRODUCE for recreating the xenbus event-channel. *)
+			edom.remote_port <- port;
+			Domain.bind_interdomain edom;
 			edom
 		else try
-			let ndom = Domains.create domains domid mfn port in
+			let ndom = Domains.create domains domid port in
 			Connections.add_domain cons ndom;
 			Connections.fire_spec_watches cons "@introduceDomain";
 			ndom
 		with _ -> raise Invalid_Cmd_Args
 	in
-	if (Domain.get_remote_port dom) <> port || (Domain.get_mfn dom) <> mfn then
+	if (Domain.get_remote_port dom) <> port then
 		raise Domain_not_match
 
 let do_release con _t domains cons data =
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index a232e4c616..0e23bec69d 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -152,9 +152,9 @@ let from_channel_f chan domain_f watch_f store_f =
 			let l = String.split ',' line in
 			try
 				match l with
-				| "dom" :: domid :: mfn :: port :: []->
+				| "dom" :: domid :: _ :: port :: []
+				| "dom" :: domid :: port :: [] ->
 					domain_f (int_of_string domid)
-					         (Nativeint.of_string mfn)
 					         (int_of_string port)
 				| "watch" :: domid :: path :: token :: [] ->
 					watch_f (int_of_string domid)
@@ -178,10 +178,10 @@ let from_channel store cons doms chan =
 	(* don't let the permission get on our way, full perm ! *)
 	let op = Store.get_ops store Perms.Connection.full_rights in
 
-	let domain_f domid mfn port =
+	let domain_f domid port =
 		let ndom =
 			if domid > 0 then
-				Domains.create doms domid mfn port
+				Domains.create doms domid port
 			else
 				Domains.create0 doms
 			in
-- 
2.25.1


