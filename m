Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9923A37AE3F
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 20:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125963.237124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWz7-0000Em-Et; Tue, 11 May 2021 18:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125963.237124; Tue, 11 May 2021 18:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWz7-0000BV-AE; Tue, 11 May 2021 18:19:57 +0000
Received: by outflank-mailman (input) for mailman id 125963;
 Tue, 11 May 2021 18:19:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWz6-0007fz-5J
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:19:56 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 004134c6-8940-498b-b7f6-53c71747813c;
 Tue, 11 May 2021 18:19:52 +0000 (UTC)
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
X-Inumbo-ID: 004134c6-8940-498b-b7f6-53c71747813c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620757192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/QT5ezwDnkjXc3nVgBVAB8DaWEl/4FRFCADP++oYh28=;
  b=Jdu6ymxTEyir3Wpq1Vlje0oTSI8uvRDp3EyQ5XHU8GofqKnyO/4yfL/T
   tadaeJnDhPWPHVau6fdtmwh0bZEN92ikFEct1VuRWE+8T+4Bto5mRkjmo
   XhPMYX+n/3LKVu7pP4SrfkG0+/zf7153MPrjkTArPJkUgO2F6N1x6W1iT
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CKYOs+i1d3uxTBukfgQWpA1/0Q6N5xF4YW3jDwQw4XsDP1Yu/ygVFpSXvRJ3wFHVWtIMu3qyOX
 F9MHR0nLkK4Jyspb534EhqoXML/Esnp857rRv0rWlQ5smYpGBZDZx0sGM3p6785xDL2X7wBbEX
 Qb5pYN3pIQllJJ3iigpKUx5qV+7pSHODIad8Vvb/r5S/HNEiwr5l2rtW5DFqtLRrgjc6ygT9t2
 zkO4fJLvzYevOalpREIDVvSWqSfkDcLy1i2K+LfbAv9VRyHxi/RD7guWQCnoUkR43o9Ah/vROA
 G+8=
X-SBRS: 5.1
X-MesageID: 43676922
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jUJ+BaDEC34bMKflHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43676922"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [PATCH v2 15/17] tools/ocaml/xenstored: use gnttab instead of xenctrl's foreign_map_range
Date: Tue, 11 May 2021 19:05:28 +0100
Message-ID: <2e703b8a3e75370ed0208b2c1da9a3562df82a14.1620755943.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is an oxenstored port of the following C xenstored commit:
38eeb3864de40aa568c48f9f26271c141c62b50b tools/xenstored: Drop mapping of the ring via foreign map

Now only Xenctrl.domain_getinfo remains as the last use of unstable xenctrl interface
in oxenstored.

Depends on: tools/ocaml: safer Xenmmap interface
(without it the code would build but the wrong unmap function would get
 called on domain destruction)

CC: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/domains.ml   | 7 +++++--
 tools/ocaml/xenstored/xenstored.ml | 3 ++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/ocaml/xenstored/domains.ml b/tools/ocaml/xenstored/domains.ml
index 17fe2fa257..d9cb693751 100644
--- a/tools/ocaml/xenstored/domains.ml
+++ b/tools/ocaml/xenstored/domains.ml
@@ -22,6 +22,7 @@ let xc = Xenctrl.interface_open ()
 
 type domains = {
 	eventchn: Event.t;
+	gnttab: Gnt.Gnttab.interface;
 	table: (Xenctrl.domid, Domain.t) Hashtbl.t;
 
 	(* N.B. the Queue module is not thread-safe but oxenstored is single-threaded. *)
@@ -42,8 +43,9 @@ type domains = {
 	mutable n_penalised: int; (* Number of domains with less than maximum credit *)
 }
 
-let init eventchn on_first_conflict_pause = {
+let init eventchn gnttab on_first_conflict_pause = {
 	eventchn = eventchn;
+	gnttab;
 	table = Hashtbl.create 10;
 	doms_conflict_paused = Queue.create ();
 	doms_with_conflict_penalty = Queue.create ();
@@ -123,7 +125,8 @@ let resume _doms _domid =
 	()
 
 let create doms domid mfn port =
-	let interface = Xenctrl.map_foreign_range xc domid (Xenmmap.getpagesize()) mfn in
+	let mapping = Gnt.(Gnttab.map_exn doms.gnttab { domid; ref = xenstore} true) in
+	let interface = Gnt.Gnttab.Local_mapping.to_pages doms.gnttab mapping in
 	let dom = Domain.make domid mfn port interface doms.eventchn in
 	Hashtbl.add doms.table domid dom;
 	Domain.bind_interdomain dom;
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index a6b86b167c..75c35107d5 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -446,6 +446,7 @@ let main () =
 
 	let store = Store.create () in
 	let eventchn = Event.init () in
+	let gnttab = Gnt.Gnttab.interface_open () in
 	let next_frequent_ops = ref 0. in
 	let advance_next_frequent_ops () =
 		next_frequent_ops := (Unix.gettimeofday () +. !Define.conflict_max_history_seconds)
@@ -453,7 +454,7 @@ let main () =
 	let delay_next_frequent_ops_by duration =
 		next_frequent_ops := !next_frequent_ops +. duration
 	in
-	let domains = Domains.init eventchn advance_next_frequent_ops in
+	let domains = Domains.init eventchn gnttab advance_next_frequent_ops in
 
 	(* For things that need to be done periodically but more often
 	 * than the periodic_ops function *)
-- 
2.25.1


