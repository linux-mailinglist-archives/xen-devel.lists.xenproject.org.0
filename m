Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F08F76DF0FE
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 11:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520098.807425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmX78-0007Y9-9y; Wed, 12 Apr 2023 09:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520098.807425; Wed, 12 Apr 2023 09:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmX77-0007RI-Vf; Wed, 12 Apr 2023 09:50:05 +0000
Received: by outflank-mailman (input) for mailman id 520098;
 Wed, 12 Apr 2023 09:50:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eFOG=AD=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pmX75-0004lU-TV
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 09:50:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6570b679-d917-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 11:50:03 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE35D1684;
 Wed, 12 Apr 2023 02:50:46 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B57853F587;
 Wed, 12 Apr 2023 02:50:00 -0700 (PDT)
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
X-Inumbo-ID: 6570b679-d917-11ed-b21e-6b7b168915f2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v5 09/12] tools: add physinfo arch_capabilities handling for Arm
Date: Wed, 12 Apr 2023 10:49:35 +0100
Message-Id: <20230412094938.2693890-10-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412094938.2693890-1-luca.fancellu@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Arm, the SVE vector length is encoded in arch_capabilities field
of struct xen_sysctl_physinfo, make use of this field in the tools
when building for arm.

Create header arm-arch-capabilities.h to handle the arch_capabilities
field of physinfo for Arm.

Removed include for xen-tools/common-macros.h in
python/xen/lowlevel/xc/xc.c because it is already included by the
arm-arch-capabilities.h header.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: George Dunlap <george.dunlap@citrix.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
---
Changes from v4:
 - Move arm-arch-capabilities.h into xen-tools/, add LIBXL_HAVE_,
   fixed python return type to I instead of i. (Anthony)
Changes from v3:
 - add Ack-by for the Golang bits (George)
 - add Ack-by for the OCaml tools (Christian)
 - now xen-tools/libs.h is named xen-tools/common-macros.h
 - changed commit message to explain why the header modification
   in python/xen/lowlevel/xc/xc.c
Changes from v2:
 - rename arm_arch_capabilities.h in arm-arch-capabilities.h, use
   MASK_EXTR.
 - Now arm-arch-capabilities.h needs MASK_EXTR macro, but it is
   defined in libxl_internal.h, it doesn't feel right to include
   that header so move MASK_EXTR into xen-tools/libs.h that is also
   included in libxl_internal.h
Changes from v1:
 - now SVE VL is encoded in arch_capabilities on Arm
Changes from RFC:
 - new patch
---
 tools/golang/xenlight/helpers.gen.go          |  2 ++
 tools/golang/xenlight/types.gen.go            |  1 +
 tools/include/libxl.h                         |  6 ++++
 .../include/xen-tools/arm-arch-capabilities.h | 28 +++++++++++++++++++
 tools/include/xen-tools/common-macros.h       |  2 ++
 tools/libs/light/libxl.c                      |  1 +
 tools/libs/light/libxl_internal.h             |  1 -
 tools/libs/light/libxl_types.idl              |  1 +
 tools/ocaml/libs/xc/xenctrl.ml                |  4 +--
 tools/ocaml/libs/xc/xenctrl.mli               |  4 +--
 tools/ocaml/libs/xc/xenctrl_stubs.c           |  8 ++++--
 tools/python/xen/lowlevel/xc/xc.c             |  8 ++++--
 tools/xl/xl_info.c                            |  8 ++++++
 13 files changed, 62 insertions(+), 12 deletions(-)
 create mode 100644 tools/include/xen-tools/arm-arch-capabilities.h

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 0a203d22321f..35397be2f9e2 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -3506,6 +3506,7 @@ x.CapVmtrace = bool(xc.cap_vmtrace)
 x.CapVpmu = bool(xc.cap_vpmu)
 x.CapGnttabV1 = bool(xc.cap_gnttab_v1)
 x.CapGnttabV2 = bool(xc.cap_gnttab_v2)
+x.ArchCapabilities = uint32(xc.arch_capabilities)
 
  return nil}
 
@@ -3540,6 +3541,7 @@ xc.cap_vmtrace = C.bool(x.CapVmtrace)
 xc.cap_vpmu = C.bool(x.CapVpmu)
 xc.cap_gnttab_v1 = C.bool(x.CapGnttabV1)
 xc.cap_gnttab_v2 = C.bool(x.CapGnttabV2)
+xc.arch_capabilities = C.uint32_t(x.ArchCapabilities)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index a7c17699f80e..3d968a496744 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -1079,6 +1079,7 @@ CapVmtrace bool
 CapVpmu bool
 CapGnttabV1 bool
 CapGnttabV2 bool
+ArchCapabilities uint32
 }
 
 type Connectorinfo struct {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index cfa1a191318c..4fa09ff7635a 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -525,6 +525,12 @@
  */
 #define LIBXL_HAVE_PHYSINFO_CAP_GNTTAB 1
 
+/*
+ * LIBXL_HAVE_PHYSINFO_ARCH_CAPABILITIES indicates that libxl_physinfo has a
+ * arch_capabilities field.
+ */
+#define LIBXL_HAVE_PHYSINFO_ARCH_CAPABILITIES 1
+
 /*
  * LIBXL_HAVE_MAX_GRANT_VERSION indicates libxl_domain_build_info has a
  * max_grant_version field for setting the max grant table version per
diff --git a/tools/include/xen-tools/arm-arch-capabilities.h b/tools/include/xen-tools/arm-arch-capabilities.h
new file mode 100644
index 000000000000..ac44c8b14344
--- /dev/null
+++ b/tools/include/xen-tools/arm-arch-capabilities.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 ARM Ltd.
+ */
+
+#ifndef ARM_ARCH_CAPABILITIES_H
+#define ARM_ARCH_CAPABILITIES_H
+
+#include <stdint.h>
+#include <xen/sysctl.h>
+
+#include <xen-tools/common-macros.h>
+
+static inline
+unsigned int arch_capabilities_arm_sve(unsigned int arch_capabilities)
+{
+#if defined(__aarch64__)
+    unsigned int sve_vl = MASK_EXTR(arch_capabilities,
+                                    XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
+
+    /* Vector length is divided by 128 before storing it in arch_capabilities */
+    return sve_vl * 128U;
+#else
+    return 0;
+#endif
+}
+
+#endif /* ARM_ARCH_CAPABILITIES_H */
diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 76b55bf62085..d53b88182560 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -72,6 +72,8 @@
 #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
 #endif
 
+#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
+
 #ifndef __must_check
 #define __must_check __attribute__((__warn_unused_result__))
 #endif
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index a0bf7d186f69..175d6dde0b80 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -409,6 +409,7 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_gnttab_v1);
     physinfo->cap_gnttab_v2 =
         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_gnttab_v2);
+    physinfo->arch_capabilities = xcphysinfo.arch_capabilities;
 
     GC_FREE;
     return 0;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 5244fde6239a..8aba3e138909 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -132,7 +132,6 @@
 
 #define DIV_ROUNDUP(n, d) (((n) + (d) - 1) / (d))
 
-#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
 #define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
 
 #define LIBXL__LOGGING_ENABLED
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index c10292e0d7e3..fd31dacf7d5a 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -1133,6 +1133,7 @@ libxl_physinfo = Struct("physinfo", [
     ("cap_vpmu", bool),
     ("cap_gnttab_v1", bool),
     ("cap_gnttab_v2", bool),
+    ("arch_capabilities", uint32),
     ], dir=DIR_OUT)
 
 libxl_connectorinfo = Struct("connectorinfo", [
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index e4096bf92c1d..bf23ca50bb15 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -128,12 +128,10 @@ type physinfo_cap_flag =
   | CAP_Gnttab_v1
   | CAP_Gnttab_v2
 
-type arm_physinfo_cap_flag
-
 type x86_physinfo_cap_flag
 
 type arch_physinfo_cap_flags =
-  | ARM of arm_physinfo_cap_flag list
+  | ARM of int
   | X86 of x86_physinfo_cap_flag list
 
 type physinfo =
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index ef2254537430..ed1e28ea30a0 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -113,12 +113,10 @@ type physinfo_cap_flag =
   | CAP_Gnttab_v1
   | CAP_Gnttab_v2
 
-type arm_physinfo_cap_flag
-
 type x86_physinfo_cap_flag
 
 type arch_physinfo_cap_flags =
-  | ARM of arm_physinfo_cap_flag list
+  | ARM of int
   | X86 of x86_physinfo_cap_flag list
 
 type physinfo = {
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 6ec9ed6d1e6f..526a3610fa42 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -853,13 +853,15 @@ CAMLprim value stub_xc_physinfo(value xch_val)
 	arch_cap_list = Tag_cons;
 
 	arch_cap_flags_tag = 1; /* tag x86 */
-#else
-	caml_failwith("Unhandled architecture");
-#endif
 
 	arch_cap_flags = caml_alloc_small(1, arch_cap_flags_tag);
 	Store_field(arch_cap_flags, 0, arch_cap_list);
 	Store_field(physinfo, 10, arch_cap_flags);
+#elif defined(__aarch64__)
+	Store_field(physinfo, 10, Val_int(c_physinfo.arch_capabilities));
+#else
+	caml_failwith("Unhandled architecture");
+#endif
 
 	CAMLreturn(physinfo);
 }
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index 35901c2d63b6..94b0354cf52f 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -22,6 +22,7 @@
 #include <xen/hvm/hvm_info_table.h>
 #include <xen/hvm/params.h>
 
+#include <xen-tools/arm-arch-capabilities.h>
 #include <xen-tools/common-macros.h>
 
 /* Needed for Python versions earlier than 2.3. */
@@ -897,7 +898,7 @@ static PyObject *pyxc_physinfo(XcObject *self)
     if ( p != virt_caps )
       *(p-1) = '\0';
 
-    return Py_BuildValue("{s:i,s:i,s:i,s:i,s:l,s:l,s:l,s:i,s:s,s:s}",
+    return Py_BuildValue("{s:i,s:i,s:i,s:i,s:l,s:l,s:l,s:i,s:s,s:s,s:I}",
                             "nr_nodes",         pinfo.nr_nodes,
                             "threads_per_core", pinfo.threads_per_core,
                             "cores_per_socket", pinfo.cores_per_socket,
@@ -907,7 +908,10 @@ static PyObject *pyxc_physinfo(XcObject *self)
                             "scrub_memory",     pages_to_kib(pinfo.scrub_pages),
                             "cpu_khz",          pinfo.cpu_khz,
                             "hw_caps",          cpu_cap,
-                            "virt_caps",        virt_caps);
+                            "virt_caps",        virt_caps,
+                            "arm_sve_vl",
+                              arch_capabilities_arm_sve(pinfo.arch_capabilities)
+                        );
 }
 
 static PyObject *pyxc_getcpuinfo(XcObject *self, PyObject *args, PyObject *kwds)
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 712b7638b013..ddc42f96b979 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -27,6 +27,7 @@
 #include <libxl_json.h>
 #include <libxl_utils.h>
 #include <libxlutil.h>
+#include <xen-tools/arm-arch-capabilities.h>
 
 #include "xl.h"
 #include "xl_utils.h"
@@ -224,6 +225,13 @@ static void output_physinfo(void)
          info.cap_gnttab_v2 ? " gnttab-v2" : ""
         );
 
+    /* Print arm SVE vector length only on ARM platforms */
+#if defined(__aarch64__)
+    maybe_printf("arm_sve_vector_length  : %u\n",
+         arch_capabilities_arm_sve(info.arch_capabilities)
+        );
+#endif
+
     vinfo = libxl_get_version_info(ctx);
     if (vinfo) {
         i = (1 << 20) / vinfo->pagesize;
-- 
2.34.1


