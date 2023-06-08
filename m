Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECA57288AA
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 21:34:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545421.851842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7LO0-0002Gk-7G; Thu, 08 Jun 2023 19:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545421.851842; Thu, 08 Jun 2023 19:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7LO0-0002Dd-3y; Thu, 08 Jun 2023 19:33:32 +0000
Received: by outflank-mailman (input) for mailman id 545421;
 Thu, 08 Jun 2023 19:33:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydti=B4=citrix.com=prvs=5162bf623=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7LNz-0002DU-4q
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 19:33:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56c6c53b-0633-11ee-b232-6b7b168915f2;
 Thu, 08 Jun 2023 21:33:28 +0200 (CEST)
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
X-Inumbo-ID: 56c6c53b-0633-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686252808;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=klSREHJNAcrzUx91QfjCn18YHLc5p2l+4cu9MJNosAQ=;
  b=Sql3ma5tgvnFEYJFbSsZKce+B3XDwGRzUQzW+E13HPoTuyt4N0berURN
   6dAd5xi4VA7kXW85LWkYGwqMCOCzpnBBPC+I4N+tMCc59/m7oZ2AuM1D3
   HA4VOlCMuP13wg0y8/7CpZu9ZOXjEVXObe5939++px6IrB6wjIRcC2uq6
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 114631615
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:6QSR0K3+O7icrrqZD/bD5dNxkn2cJEfYwER7XKvMYLTBsI5bpzdWz
 DFMD22GafmPM2Xzc9t0aI/g9xwEvcWBzoM2GQZvpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJmNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfGmIfr
 cEHBSkxQzub1vjsnu29YLhimZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJwJwB3B+
 Dubl4j/KjE8C9HF1TuPySKtuffVnH/bBqIWJJTto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYYRtFZVeMz7gqAzq7Jyw+DAy4PSTspVTA9nJZoH3pwj
 AbPxo63Q2U169V5VE5x6J+PrmLqBDc4NFMvTjdVV1FbvN/J8Y8s20enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNPdTA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43Nzgbb1HRcNJG9GRF5mLI+htDMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/i+T4i0DKqJMYEeCnSUSONg1Hs3DXN8Iki3yBR8+U3BE
 crznTmQ4YYyVv08kWveqxY12r433CEurV4/triipylLJYG2PSbPIZ9caQvmUwzMxP/cyOkj2
 4oFZpTiJtQ2eLGWXxQ7BqZJcQlQdSVqW8iqwyGVH8baSjdb9KgaI6e56dscl0ZNxcy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:oSpN56CCVPY5jTXlHemp55DYdb4zR+YMi2TDtnoBLyC9F/byqy
 nApoV+6faZslYssRIb6Le90cu7LE80nKQdieMs1NGZLWrbUQCTXeRfBOXZsl/d8hrFmtK1BJ
 0AT0AuYOefMbAl5fyU3DWF
X-Talos-CUID: 9a23:H0BCqGCBuMpWiNH6EzJkpRYpBe08TlD21CbKeRHnD0w4RqLAHA==
X-Talos-MUID: 9a23:b/rgIgUyTMbL/Sfq/B/Kuzw4KMZi2PSvN1gXkMkm5emABQUlbg==
X-IronPort-AV: E=Sophos;i="6.00,227,1681185600"; 
   d="scan'208";a="114631615"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edwin.torok@cloud.com>, Rob Hoes <Rob.Hoes@citrix.com>, Luca Fancellu
	<luca.fancellu@arm.com>
Subject: [PATCH] tools/ocaml/xc: Fix xc_physinfo() bindings
Date: Thu, 8 Jun 2023 20:33:12 +0100
Message-ID: <20230608193312.2520222-1-andrew.cooper3@citrix.com>
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
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
CC: Luca Fancellu <luca.fancellu@arm.com>

RFC - untested because I'm failing at cross-compiling ARM Ocaml, but staging
has been broken too long...
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
index a03da31f6f2c..6b2869af04ef 100644
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
+	return arch_cap_flags;
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

base-commit: 6915a120641b5d232762af7882266048cf039ca0
prerequisite-patch-id: 85ffb6cbe1ddfdec0afb2ac5c2cfd8910ddfd783
-- 
2.30.2


