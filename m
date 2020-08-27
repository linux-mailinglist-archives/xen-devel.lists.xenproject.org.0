Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6B5254C4E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 19:37:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBLpf-0005T0-PN; Thu, 27 Aug 2020 17:37:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCk+=CF=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kBLpf-00056c-0Z
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 17:37:03 +0000
X-Inumbo-ID: 58cd58d3-002f-4098-8de4-8e7ab9599afa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58cd58d3-002f-4098-8de4-8e7ab9599afa;
 Thu, 27 Aug 2020 17:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598549797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VyzP4RE2EFaru7b42vYxbJ6bvMwwB7LIIwstags4Qbg=;
 b=dgGght51XgC1/vR12FYrMO6Acaii0SrtHAVBqesuquIJcevibmN+tf2R
 7jR/3SwpyQ36om1HrjkdsOGBsY4YTkxs/tDj8da/7dkIB050QSopBiOug
 JALvehuPbVmjT6bjPAjh81DrEozdq0gHZuR9UzNP5cN1woB8s4Wjo4qxJ U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: BELEP7zOoNqOqGTxOXNCRHluZrhHnLuPRXsfTI5Cn3m1swmjv5IrvyQ+R/WCq23uJLuo4mF/Ry
 4nKV5AM7L1VZ73yDWX6JIA+UXnyB+qZCaF8cdJhETWDw4HDXvZt3WC6iOYPPTuXD2ceZ2m82TT
 3UAm9uJObUmXH0dqsTA2HSlfN5JlAv1KubDeBQhgk2hvW7NtxcvSniLL0ylepA2o6RDuJBVdAu
 +mKDuaj9M+y6NE5RgsjHC8ucF2MdN9AgZe5YnmxpqVMe+tfJz7Fgs422r/KT6CJ5chtT2F0w+D
 muk=
X-SBRS: 2.7
X-MesageID: 25758545
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,360,1592884800"; d="scan'208";a="25758545"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Subject: [PATCH v1 6/9] tools/ocaml/xenstored: use gnttab instead of xenctrl's
 foreign_map_range
Date: Thu, 27 Aug 2020 18:35:57 +0100
Message-ID: <1e2416bed8f6cf2af2b0a6721278fcbf98628543.1598548832.git.edvin.torok@citrix.com>
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
index f3e4697dea..a232e4c616 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -265,6 +265,7 @@ let _ =
 
 	let store = Store.create () in
 	let eventchn = Event.init () in
+	let gnttab = Gnt.Gnttab.interface_open () in
 	let next_frequent_ops = ref 0. in
 	let advance_next_frequent_ops () =
 		next_frequent_ops := (Unix.gettimeofday () +. !Define.conflict_max_history_seconds)
@@ -272,7 +273,7 @@ let _ =
 	let delay_next_frequent_ops_by duration =
 		next_frequent_ops := !next_frequent_ops +. duration
 	in
-	let domains = Domains.init eventchn advance_next_frequent_ops in
+	let domains = Domains.init eventchn gnttab advance_next_frequent_ops in
 
 	(* For things that need to be done periodically but more often
 	 * than the periodic_ops function *)
-- 
2.25.1


