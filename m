Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D91936C5BD
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 14:05:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118363.224461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbMTF-0006DK-Jx; Tue, 27 Apr 2021 12:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118363.224461; Tue, 27 Apr 2021 12:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbMTF-0006Ch-Fj; Tue, 27 Apr 2021 12:05:41 +0000
Received: by outflank-mailman (input) for mailman id 118363;
 Tue, 27 Apr 2021 12:05:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HmyD=JY=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lbMTD-00062t-UE
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 12:05:39 +0000
Received: from mx.upb.ro (unknown [141.85.13.210])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 034b139a-45ed-4413-939d-90671de231b2;
 Tue, 27 Apr 2021 12:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 019FFB5600BB;
 Tue, 27 Apr 2021 15:05:30 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id sFRqpkv4cXg7; Tue, 27 Apr 2021 15:05:27 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 41889B5600B6;
 Tue, 27 Apr 2021 15:05:27 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2eqPK_g_p6EI; Tue, 27 Apr 2021 15:05:27 +0300 (EEST)
Received: from localhost.localdomain (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 71557B560069;
 Tue, 27 Apr 2021 15:05:26 +0300 (EEST)
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
X-Inumbo-ID: 034b139a-45ed-4413-939d-90671de231b2
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 5/5] tools/ocaml: Fix redefinition errors
Date: Tue, 27 Apr 2021 15:05:20 +0300
Message-Id: <91dc6057e7c58c2acf8d3f6f6201d9f70a84fb3d.1619524463.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619524463.git.costin.lupu@cs.pub.ro>
References: <cover.1619524463.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If PAGE_SIZE is already defined in the system (e.g. in
/usr/include/limits.h header) then gcc will trigger a redefinition error
because of -Werror. This commit also protects PAGE_SHIFT and PAGE_MASK
definitions for keeping consistency.

Same issue applies for redefinitions of Val_none and Some_val macros whic=
h
can be already define in the OCaml system headers (e.g.
/usr/lib/ocaml/caml/mlvalues.h).

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 tools/ocaml/libs/xc/xenctrl_stubs.c            | 8 ++++++++
 tools/ocaml/libs/xentoollog/xentoollog_stubs.c | 4 ++++
 tools/ocaml/libs/xl/xenlight_stubs.c           | 4 ++++
 3 files changed, 16 insertions(+)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xe=
nctrl_stubs.c
index d05d7bb30e..1c82e76b19 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -36,14 +36,22 @@
=20
 #include "mmap_stubs.h"
=20
+#ifndef PAGE_SHIFT
 #define PAGE_SHIFT		12
+#endif
+#ifndef PAGE_SIZE
 #define PAGE_SIZE               (1UL << PAGE_SHIFT)
+#endif
+#ifndef PAGE_MASK
 #define PAGE_MASK               (~(PAGE_SIZE-1))
+#endif
=20
 #define _H(__h) ((xc_interface *)(__h))
 #define _D(__d) ((uint32_t)Int_val(__d))
=20
+#ifndef Val_none
 #define Val_none (Val_int(0))
+#endif
=20
 #define string_of_option_array(array, index) \
 	((Field(array, index) =3D=3D Val_none) ? NULL : String_val(Field(Field(=
array, index), 0)))
diff --git a/tools/ocaml/libs/xentoollog/xentoollog_stubs.c b/tools/ocaml=
/libs/xentoollog/xentoollog_stubs.c
index bf64b211c2..e4306a0c2f 100644
--- a/tools/ocaml/libs/xentoollog/xentoollog_stubs.c
+++ b/tools/ocaml/libs/xentoollog/xentoollog_stubs.c
@@ -53,8 +53,12 @@ static char * dup_String_val(value s)
 #include "_xtl_levels.inc"
=20
 /* Option type support as per http://www.linux-nantes.org/~fmonnier/ocam=
l/ocaml-wrapping-c.php */
+#ifndef Val_none
 #define Val_none Val_int(0)
+#endif
+#ifndef Some_val
 #define Some_val(v) Field(v,0)
+#endif
=20
 static value Val_some(value v)
 {
diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/x=
enlight_stubs.c
index 352a00134d..45b8af61c7 100644
--- a/tools/ocaml/libs/xl/xenlight_stubs.c
+++ b/tools/ocaml/libs/xl/xenlight_stubs.c
@@ -227,8 +227,12 @@ static value Val_string_list(libxl_string_list *c_va=
l)
 }
=20
 /* Option type support as per http://www.linux-nantes.org/~fmonnier/ocam=
l/ocaml-wrapping-c.php */
+#ifndef Val_none
 #define Val_none Val_int(0)
+#endif
+#ifndef Some_val
 #define Some_val(v) Field(v,0)
+#endif
=20
 static value Val_some(value v)
 {
--=20
2.20.1


