Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F27729E9C
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 17:34:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546161.852818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7e7o-0002gF-V7; Fri, 09 Jun 2023 15:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546161.852818; Fri, 09 Jun 2023 15:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7e7o-0002dh-S7; Fri, 09 Jun 2023 15:34:04 +0000
Received: by outflank-mailman (input) for mailman id 546161;
 Fri, 09 Jun 2023 15:34:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H16Y=B5=citrix.com=prvs=5170a5cbe=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7e7o-0002db-0i
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 15:34:04 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e26d241-06db-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 17:34:02 +0200 (CEST)
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
X-Inumbo-ID: 0e26d241-06db-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686324842;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9g2HVasZifNxLi5ro/3MzuJQsziytjBtL1Bo+gVBQE8=;
  b=EAVEbRs5m5yqupLiHRVvRRsRvNOQPDqxkvwOHvNV8h1WNMCGYaMWey/Z
   fYLqMu1UOl1G1pl3P3Snzh48RYl08ZO8fDF3mYxq5sABcRwT6RASInlB0
   zgRR5S/MEtT0zL33mDAJuvWUhHNduC4uiQ0WPtdDE8HEaB17/574+X2VZ
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112245805
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:LT0OxqynkPCY4Zd/qqd6t+c3xirEfRIJ4+MujC+fZmUNrF6WrkVTy
 2JOW2CFOa7bNzD9Looia4jlpk9XscLTzNNlTgZqqCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPaET5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTp1+
 cUUDigEVDaG2eOE+amjQdgyr9t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwMxBzE+
 zKeogwVBDkbJNe002va4068ocLBljm4aKkKF6WRo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0X8dbGqs04QeGx67Q/i6QHG1CRTlEAOHKr+dvG2Zsj
 AXQ2Yq0W3o26ub9pW+hGqm89gi+ACQzNWY4QypaTDk8+MHokd8akUeaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKMN8N7n9hIx5JEVd443d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPawS465B6qOM4UVMvCdkTNrGwk0PCatM53FyhBwwcnTx
 7/GGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlnyaPU6lTCfNE98taQLeBt3VGYvY+G05B
 f4DbZrVo/ieOcWiChTqHXk7dAhVdCNjW8un86S6tIere2JbJY3oMNeJqZtJRmCvt/49ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:MAw2Wayy1tZEq+Zi1cfwKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-Talos-CUID: 9a23:K+Lps2Oc/bhuHu5DAxJrzUIyAskfVHiDzUXpOFezODhAV+jA
X-Talos-MUID: 9a23:ayPVuQklK3xoqu2pBHbrdnpjJMxD+fXxGXwdtrgIsNPHBQdoOC+02WE=
X-IronPort-AV: E=Sophos;i="6.00,229,1681185600"; 
   d="scan'208";a="112245805"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@cloud.com>, Christian Lindig <christian.lindig@citrix.com>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Rob Hoes
	<Rob.Hoes@citrix.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v2] tools/ocaml/xc: Fix xc_physinfo() bindings
Date: Fri, 9 Jun 2023 16:33:55 +0100
Message-ID: <20230609153355.2637469-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The original change doesn't compile on ARM:

  xenctrl_stubs.c: In function 'stub_xc_physinfo':
  xenctrl_stubs.c:821:16: error: unused variable 'arch_cap_flags_tag' [-Werror=unused-variable]
    821 |         int r, arch_cap_flags_tag;
        |                ^~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

but it was buggy too.

First, it tried storing an int in a pointer slot, causing heap corruption.

Next, it is not legitimate to exclude arm32 in the toolstack as it explicitly
can operate an arm64 toolstack and build arm64 domains.  That in turn means
that you can't stash a C uint32_t in an OCaml int.

Rewrite the arch_capabilities handling from scratch.  Break it out into a
separate function, and make the construction of arch_physinfo_cap_flags common
to prevent other indirection bugs.

Reintroduce arm_physinfo_caps with the fields broken out.

Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for Arm")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
CC: Luca Fancellu <luca.fancellu@arm.com>

v2:
 * CAMLreturn().

Tested on x86 locally.  Tested on arm64 with:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4447272476

and a tweaked form of my local ocaml smoke test for these kinds of things:

  # osmoke
  Xen version: 4.18-unstable
  Physinfo:
    threads_per_core 1
    SVE len: 0
  Starting GC.compact()
  Done

I didn't get this working for arm32, because that's all Yocto, but the arm64
test is good enough IMO.
---
 tools/ocaml/libs/xc/xenctrl.ml      |  7 +++-
 tools/ocaml/libs/xc/xenctrl.mli     |  7 +++-
 tools/ocaml/libs/xc/xenctrl_stubs.c | 52 ++++++++++++++++++++---------
 3 files changed, 48 insertions(+), 18 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index bf23ca50bb15..d6c6eb73db44 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -128,10 +128,15 @@ type physinfo_cap_flag =
   | CAP_Gnttab_v1
   | CAP_Gnttab_v2
 
+type arm_physinfo_caps =
+  {
+    sve_vl: int;
+  }
+
 type x86_physinfo_cap_flag
 
 type arch_physinfo_cap_flags =
-  | ARM of int
+  | ARM of arm_physinfo_caps
   | X86 of x86_physinfo_cap_flag list
 
 type physinfo =
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index ed1e28ea30a0..3bfc16edba96 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -113,10 +113,15 @@ type physinfo_cap_flag =
   | CAP_Gnttab_v1
   | CAP_Gnttab_v2
 
+type arm_physinfo_caps =
+  {
+    sve_vl: int;
+  }
+
 type x86_physinfo_cap_flag
 
 type arch_physinfo_cap_flags =
-  | ARM of int
+  | ARM of arm_physinfo_caps
   | X86 of x86_physinfo_cap_flag list
 
 type physinfo = {
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index a03da31f6f2c..e4d9070f2d00 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -812,13 +812,46 @@ CAMLprim value stub_xc_send_debug_keys(value xch_val, value keys)
 	CAMLreturn(Val_unit);
 }
 
+CAMLprim value physinfo_arch_caps(const xc_physinfo_t *info)
+{
+	CAMLparam0();
+	CAMLlocal2(arch_cap_flags, arch_obj);
+	int tag = -1;
+
+#if defined(__arm__) || defined(__aarch64__)
+
+	tag = 0; /* tag ARM */
+
+	arch_obj = caml_alloc_tuple(1);
+
+	Store_field(arch_obj, 0,
+		    Val_int(MASK_EXTR(info->arch_capabilities,
+				      XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK) * 128));
+
+#elif defined(__i386__) || defined(__x86_64__)
+
+	tag = 1; /* tag x86 */
+
+	arch_obj = Tag_cons;
+
+#endif
+
+	if ( tag < 0 )
+		caml_failwith("Unhandled architecture");
+
+	arch_cap_flags = caml_alloc_small(1, tag);
+	Store_field(arch_cap_flags, 0, arch_obj);
+
+	CAMLreturn(arch_cap_flags);
+}
+
 CAMLprim value stub_xc_physinfo(value xch_val)
 {
 	CAMLparam1(xch_val);
-	CAMLlocal4(physinfo, cap_list, arch_cap_flags, arch_cap_list);
+	CAMLlocal2(physinfo, cap_list);
 	xc_interface *xch = xch_of_val(xch_val);
 	xc_physinfo_t c_physinfo;
-	int r, arch_cap_flags_tag;
+	int r;
 
 	caml_enter_blocking_section();
 	r = xc_physinfo(xch, &c_physinfo);
@@ -846,20 +879,7 @@ CAMLprim value stub_xc_physinfo(value xch_val)
 	Store_field(physinfo, 7, caml_copy_nativeint(c_physinfo.scrub_pages));
 	Store_field(physinfo, 8, cap_list);
 	Store_field(physinfo, 9, Val_int(c_physinfo.max_cpu_id + 1));
-
-#if defined(__i386__) || defined(__x86_64__)
-	arch_cap_list = Tag_cons;
-
-	arch_cap_flags_tag = 1; /* tag x86 */
-
-	arch_cap_flags = caml_alloc_small(1, arch_cap_flags_tag);
-	Store_field(arch_cap_flags, 0, arch_cap_list);
-	Store_field(physinfo, 10, arch_cap_flags);
-#elif defined(__aarch64__)
-	Store_field(physinfo, 10, Val_int(c_physinfo.arch_capabilities));
-#else
-	caml_failwith("Unhandled architecture");
-#endif
+	Store_field(physinfo, 10, physinfo_arch_caps(&c_physinfo));
 
 	CAMLreturn(physinfo);
 }
-- 
2.30.2


