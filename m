Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D966E5854CD
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 19:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377699.611055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBz-0000hS-L3; Fri, 29 Jul 2022 17:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377699.611055; Fri, 29 Jul 2022 17:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBz-0000dk-Fp; Fri, 29 Jul 2022 17:54:31 +0000
Received: by outflank-mailman (input) for mailman id 377699;
 Fri, 29 Jul 2022 17:54:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UihI=YC=citrix.com=prvs=202bfa127=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oHUBx-0006Zx-2b
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 17:54:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cbaafe1-0f67-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 19:54:27 +0200 (CEST)
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
X-Inumbo-ID: 7cbaafe1-0f67-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659117266;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Az58JwMLVZkj1Ei7e6Y6lR0AqnGVV5NLUNwkk9VU3V0=;
  b=Jlhn8u6gWPEbFHlsvTO0RPvDzp6QNPXdL6zm6eZwk0J5ottiP1UHxeQn
   kjmwQawzfVOWBHL+VmJg9PtADKFPrCZFZoo8mgystQDt9sNgeA0Ge3Ilo
   KLBduMmrFMfeuQCr8nLLVH4C7aNZqtSyWCYzrZfBYO/rls3Wt+tQJCDzj
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79518996
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:S8MQZ6No38QbSrbvrR3Gl8FynXyQoLVcMsEvi/4bfWQNrUol0TYEz
 mZOWGmDPfaJNGb2fNp2OoXk9EMB6p7Rx9M1SQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMtPjS8EkHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPH//RTMGMJPbER/8BlIkNB9
 uQmLBASO0Xra+KemNpXS8Fpj8UnasLqIJkeqjdryjSx4fQOGM6ZBf+QvJkBgWl21psm8fX2P
 qL1bRJiYArBZVtTPU0QC7o1nfuyh2m5eDpdwL6QjfVmvjGDnV0vuFTrGOrIX/KQReJbp2K//
 Gb432HWAg0aDMPKnFJp9Vrz37SSzEsXQrk6C7mQ5vNsxlqJyQQ7BBQIWHOhrPK+i0r4XMhQQ
 2QE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt/jVBAFTkoKVdXuY0KW3jzyxIRYRDXBXMEfoUjA5D8nfTJAb10ySH44+QfPt37UZChmrn
 WnU8XFWa6E7yJdSiv7lpQ2vbyeE/MChc+Ij2unAsotJBCtdbZXtWYGn4EOzAR1ofNfAFQnpU
 JTpdqGjAAEy4XKlznXlrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJtVIWSyO
 x+P5lkOjHO2AJdNRfYtC79d9uxwlfSwfTgbfqu8giVyjmhZK1bcoXAGib+41GHxikk8+ZwC1
 WOgWZ/1VR4yVPU4pAdass9HjtfHMAhimj6ILX06pjz7uYejiIm9E+tcaQvWNbxkhE5GyS2Mm
 +ti2wKx4003eIXDjuP/reb/8XhiwaAHOK3L
IronPort-HdrOrdr: A9a23:oHPZ1qC5ABWX6+DlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.93,201,1654574400"; 
   d="scan'208";a="79518996"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 5/7] tools/ocaml: fix compiler warnings
Date: Fri, 29 Jul 2022 18:53:28 +0100
Message-ID: <23dcc916bff25d0545c167833d99aa73b8a4c8da.1659116941.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1659116941.git.edvin.torok@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fix compiler warning about:
* unused value
* ambiguous documentation comment
* non-principal type inference (compiler version dependent)

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/connection.ml | 2 +-
 tools/ocaml/xenstored/process.ml    | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/ocaml/xenstored/connection.ml b/tools/ocaml/xenstored/connection.ml
index 65f99ea6f2..a94d47cdc2 100644
--- a/tools/ocaml/xenstored/connection.ml
+++ b/tools/ocaml/xenstored/connection.ml
@@ -313,7 +313,7 @@ let is_bad con = match con.dom with None -> false | Some dom -> Domain.is_bad_do
 let has_extra_connection_data con =
 	let has_in = has_input con || has_partial_input con in
 	let has_out = has_output con in
-	let has_socket = con.dom = None in
+	let _has_socket = con.dom = None in
 	let has_nondefault_perms = make_perm con.dom <> con.perm in
 	has_in || has_out
 	(* TODO: what about SIGTERM, should use systemd to store FDS
diff --git a/tools/ocaml/xenstored/process.ml b/tools/ocaml/xenstored/process.ml
index 27790d4a5c..86eed02413 100644
--- a/tools/ocaml/xenstored/process.ml
+++ b/tools/ocaml/xenstored/process.ml
@@ -59,7 +59,7 @@ let split_one_path data con =
 
 let process_watch t cons =
 	let oldroot = t.Transaction.oldroot in
-	let newroot = Store.get_root t.store in
+	let newroot = Store.get_root t.Transaction.store in
 	let ops = Transaction.get_paths t |> List.rev in
 	let do_op_watch op cons =
 		let recurse, oldroot, root = match (fst op) with
@@ -491,7 +491,7 @@ let transaction_replay c t doms cons =
 			ignore @@ Connection.end_transaction c tid None
 		)
 
-let do_watch con t _domains cons data =
+let do_watch con _t _domains cons data =
 	let (node, token) =
 		match (split None '\000' data) with
 		| [node; token; ""]   -> node, token
@@ -651,6 +651,7 @@ let maybe_ignore_transaction = function
 
 
 let () = Printexc.record_backtrace true
+
 (**
  * Nothrow guarantee.
  *)
-- 
2.34.1


