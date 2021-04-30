Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471F536F955
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 13:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120476.227878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcRK4-0001Fq-5Y; Fri, 30 Apr 2021 11:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120476.227878; Fri, 30 Apr 2021 11:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcRK4-0001Eu-0m; Fri, 30 Apr 2021 11:28:40 +0000
Received: by outflank-mailman (input) for mailman id 120476;
 Fri, 30 Apr 2021 11:28:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ll2C=J3=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lcRK2-00011a-FB
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 11:28:38 +0000
Received: from mx.upb.ro (unknown [141.85.13.230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb8a72c0-9212-4ddc-9666-b8cc43055019;
 Fri, 30 Apr 2021 11:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 1E14DB56011F;
 Fri, 30 Apr 2021 14:28:23 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bSylNCdeoEZB; Fri, 30 Apr 2021 14:28:20 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 8E727B560118;
 Fri, 30 Apr 2021 14:28:20 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9hLohrSlnp5b; Fri, 30 Apr 2021 14:28:20 +0300 (EEST)
Received: from localhost.localdomain (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 0F0BAB560113;
 Fri, 30 Apr 2021 14:28:19 +0300 (EEST)
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
X-Inumbo-ID: bb8a72c0-9212-4ddc-9666-b8cc43055019
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 5/5] tools/ocaml: Fix redefinition errors
Date: Fri, 30 Apr 2021 14:28:11 +0300
Message-Id: <1a8ff6dcdd70fef83828dce47e79eb846860cbe8.1619781564.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619781564.git.costin.lupu@cs.pub.ro>
References: <cover.1619781564.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If PAGE_SIZE is already defined in the system (e.g. in /usr/include/limit=
s.h
header) then gcc will trigger a redefinition error because of -Werror. Th=
is
patch replaces usage of PAGE_* macros with XC_PAGE_* macros in order to a=
void
confusion between control domain page granularity (PAGE_* definitions) an=
d
guest domain page granularity (which is what we are dealing with here).

Same issue applies for redefinitions of Val_none and Some_val macros whic=
h
can be already defined in the OCaml system headers (e.g.
/usr/lib/ocaml/caml/mlvalues.h).

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 tools/ocaml/libs/xc/xenctrl_stubs.c            | 10 ++++------
 tools/ocaml/libs/xentoollog/xentoollog_stubs.c |  4 ++++
 tools/ocaml/libs/xl/xenlight_stubs.c           |  4 ++++
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xe=
nctrl_stubs.c
index d05d7bb30e..f9e33e599a 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -36,14 +36,12 @@
=20
 #include "mmap_stubs.h"
=20
-#define PAGE_SHIFT		12
-#define PAGE_SIZE               (1UL << PAGE_SHIFT)
-#define PAGE_MASK               (~(PAGE_SIZE-1))
-
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
@@ -818,7 +816,7 @@ CAMLprim value stub_xc_domain_memory_increase_reserva=
tion(value xch,
 	CAMLparam3(xch, domid, mem_kb);
 	int retval;
=20
-	unsigned long nr_extents =3D ((unsigned long)(Int64_val(mem_kb))) >> (P=
AGE_SHIFT - 10);
+	unsigned long nr_extents =3D ((unsigned long)(Int64_val(mem_kb))) >> (X=
C_PAGE_SHIFT - 10);
=20
 	uint32_t c_domid =3D _D(domid);
 	caml_enter_blocking_section();
@@ -924,7 +922,7 @@ CAMLprim value stub_pages_to_kib(value pages)
 {
 	CAMLparam1(pages);
=20
-	CAMLreturn(caml_copy_int64(Int64_val(pages) << (PAGE_SHIFT - 10)));
+	CAMLreturn(caml_copy_int64(Int64_val(pages) << (XC_PAGE_SHIFT - 10)));
 }
=20
=20
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


