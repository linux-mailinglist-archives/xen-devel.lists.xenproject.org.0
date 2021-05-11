Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC41437AE40
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 20:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125960.237095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWyy-0007ny-TB; Tue, 11 May 2021 18:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125960.237095; Tue, 11 May 2021 18:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWyy-0007iS-Nd; Tue, 11 May 2021 18:19:48 +0000
Received: by outflank-mailman (input) for mailman id 125960;
 Tue, 11 May 2021 18:19:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWyx-0007g6-HP
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:19:47 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b63d9b5-d94b-41d2-920f-8f6312662347;
 Tue, 11 May 2021 18:19:46 +0000 (UTC)
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
X-Inumbo-ID: 0b63d9b5-d94b-41d2-920f-8f6312662347
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620757186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SU7cgAQhk8vsTkLv/y2uGvNvL2Atz9xPDkxcsiAL/Ik=;
  b=DF2iR63RcPxEEgp5BdlmahraON9RvtLSzlhmj8WPmXh0+MnIZRjIrdP+
   kvuXgjybqV6Rle9uoS7KhyILgYDjXzvrkLTS/S1rNKf5fdLt1HRyP4U0R
   YeXUsr2WToNHrUp00vq5gxznRf03UfQjiuGWtso8h194dTKBdCBPR9i2m
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Js8J1Ottk9+P26tbK96orEpViIabgTRWSOozgof7eDuwY7XKgwVCvGH0wBVhvtSCELEnFH6OJ0
 fBp22c5JAdwR7wDAGrXyMhkeEsMspYxwUf93ZrkIutqa4FMP7EGaPEZJAL3D8gqS9yq/c+jxDZ
 Il+RjeVW592GORgriTnu20gCMwlO175x/506AASueEQwnhscllpB1n1TqbbMz94191Y6RGxQjH
 YTxsahTYWhchKTcXO5fsX5eaVAaRvofo9uNw5FDs6chwZVMmWlqb9+y7Dd4odwuOeQGR4oRAZf
 j3E=
X-SBRS: 5.1
X-MesageID: 43955845
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7A/JIa6E+2oilrlqOQPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43955845"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH v2 16/17] tools/ocaml/xenstored: don't store domU's mfn of ring page
Date: Tue, 11 May 2021 19:05:29 +0100
Message-ID: <49200c1e5de78257fc43e26f545651484dbe4ff0.1620755943.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is a port of the following C xenstored commit
122b52230aa5b79d65e18b8b77094027faa2f8e2 tools/xenstore: don't store domU's mfn of ring page in xenstored

Backwards compat: accept a domain dump both with and without MFN.

CC: Juergen Gross <jgross@suse.com>
Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/domain.ml  |  7 ++-----
 tools/ocaml/xenstored/domains.ml |  6 +++---
 tools/ocaml/xenstored/process.ml | 16 +++++-----------
 3 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/tools/ocaml/xenstored/domain.ml b/tools/ocaml/xenstored/domain.ml
index 82d7b1a7ef..960ebef218 100644
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
@@ -40,7 +39,6 @@ type t =
 let is_dom0 d = d.id = 0
 let get_id domain = domain.id
 let get_interface d = d.interface
-let get_mfn d = d.mfn
 let get_remote_port d = d.remote_port
 let get_port d = d.port
 
@@ -61,7 +59,7 @@ let string_of_port = function
 | Some x -> string_of_int (Xeneventchn.to_int x)
 
 let dump d chan =
-	fprintf chan "dom,%d,%nd,%d\n" d.id d.mfn d.remote_port
+	fprintf chan "dom,%d,%d\n" d.id d.remote_port
 
 let notify dom = match dom.port with
 | None ->
@@ -87,9 +85,8 @@ let close dom =
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
index 13b7153536..890970b8c5 100644
--- a/tools/ocaml/xenstored/process.ml
+++ b/tools/ocaml/xenstored/process.ml
@@ -235,10 +235,6 @@ let do_debug con t _domains cons data =
 	| "watches" :: _ ->
 		let watches = Connections.debug cons in
 		Some (watches ^ "\000")
-	| "mfn" :: domid :: _ ->
-		let domid = int_of_string domid in
-		let con = Connections.find_domain cons domid in
-		may (fun dom -> Printf.sprintf "%nd\000" (Domain.get_mfn dom)) (Connection.get_domain con)
 	| _ -> None
 	with _ -> None
 
@@ -554,15 +550,13 @@ let do_introduce con t domains cons data =
 	let dom =
 		if Domains.exist domains domid then begin
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
 		end
 		else try
-			let ndom = Domains.create domains domid mfn port in
+			let ndom = Domains.create domains domid port in
 			Connections.add_domain cons ndom;
 			Connections.fire_spec_watches (Transaction.get_root t) cons Store.Path.introduce_domain;
 			ndom
@@ -571,7 +565,7 @@ let do_introduce con t domains cons data =
 			 Logging.debug "process" "do_introduce: %s (%s)" (Printexc.to_string e) bt;
 			 raise Invalid_Cmd_Args
 	in
-	if (Domain.get_remote_port dom) <> port || (Domain.get_mfn dom) <> mfn then
+	if (Domain.get_remote_port dom) <> port then
 		raise Domain_not_match
 
 let do_release con t domains cons data =
-- 
2.25.1


