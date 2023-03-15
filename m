Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FE76BAB90
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 10:06:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509943.786789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcN5W-0007aY-IX; Wed, 15 Mar 2023 09:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509943.786789; Wed, 15 Mar 2023 09:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcN5W-0007X7-AR; Wed, 15 Mar 2023 09:06:26 +0000
Received: by outflank-mailman (input) for mailman id 509943;
 Wed, 15 Mar 2023 09:06:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsHm=7H=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pcN5U-0005Kr-1J
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 09:06:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a7abadfb-c310-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 10:06:22 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 280B12F4;
 Wed, 15 Mar 2023 02:07:05 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3A653F8C6;
 Wed, 15 Mar 2023 02:06:19 -0700 (PDT)
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
X-Inumbo-ID: a7abadfb-c310-11ed-b464-930f4c7d94ae
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
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 08/10] tools: add physinfo arch_capabilities handling for Arm
Date: Wed, 15 Mar 2023 09:05:56 +0000
Message-Id: <20230315090558.731029-9-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315090558.731029-1-luca.fancellu@arm.com>
References: <20230315090558.731029-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Arm, the SVE vector length is encoded in arch_capabilities field
of struct xen_sysctl_physinfo, make use of this field in the tools
when building for arm.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v1:
 - now SVE VL is encoded in arch_capabilities on Arm
Changes from RFC:
 - new patch
---
 tools/golang/xenlight/helpers.gen.go  |  2 ++
 tools/golang/xenlight/types.gen.go    |  1 +
 tools/include/arm_arch_capabilities.h | 32 +++++++++++++++++++++++++++
 tools/libs/light/libxl.c              |  1 +
 tools/libs/light/libxl_types.idl      |  1 +
 tools/ocaml/libs/xc/xenctrl.ml        |  4 +---
 tools/ocaml/libs/xc/xenctrl.mli       |  4 +---
 tools/ocaml/libs/xc/xenctrl_stubs.c   |  8 ++++---
 tools/python/xen/lowlevel/xc/xc.c     |  8 +++++--
 tools/xl/xl_info.c                    |  8 +++++++
 10 files changed, 58 insertions(+), 11 deletions(-)
 create mode 100644 tools/include/arm_arch_capabilities.h

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 3ac4938858f2..aad9645222a1 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -3455,6 +3455,7 @@ x.CapVmtrace = bool(xc.cap_vmtrace)
 x.CapVpmu = bool(xc.cap_vpmu)
 x.CapGnttabV1 = bool(xc.cap_gnttab_v1)
 x.CapGnttabV2 = bool(xc.cap_gnttab_v2)
+x.ArchCapabilities = uint32(xc.arch_capabilities)
 
  return nil}
 
@@ -3489,6 +3490,7 @@ xc.cap_vmtrace = C.bool(x.CapVmtrace)
 xc.cap_vpmu = C.bool(x.CapVpmu)
 xc.cap_gnttab_v1 = C.bool(x.CapGnttabV1)
 xc.cap_gnttab_v2 = C.bool(x.CapGnttabV2)
+xc.arch_capabilities = C.uint32_t(x.ArchCapabilities)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 16ce879e3fb7..88ec0260404f 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -1051,6 +1051,7 @@ CapVmtrace bool
 CapVpmu bool
 CapGnttabV1 bool
 CapGnttabV2 bool
+ArchCapabilities uint32
 }
 
 type Connectorinfo struct {
diff --git a/tools/include/arm_arch_capabilities.h b/tools/include/arm_arch_capabilities.h
new file mode 100644
index 000000000000..61918e9bb497
--- /dev/null
+++ b/tools/include/arm_arch_capabilities.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 ARM Ltd.
+ */
+
+#ifndef ARM_ARCH_CAPABILITIES_H
+#define ARM_ARCH_CAPABILITIES_H
+
+/* Tell the Xen public headers we are a user-space tools build. */
+#ifndef __XEN_TOOLS__
+#define __XEN_TOOLS__ 1
+#endif
+
+#include <stdint.h>
+#include <xen/sysctl.h>
+
+static inline
+unsigned int arch_capabilities_arm_sve(unsigned int arch_capabilities)
+{
+#if defined(__aarch64__)
+    unsigned int sve_vl =
+        ((arch_capabilities >> XEN_SYSCTL_PHYSCAP_ARM_SVE_SHFT) &
+        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
+
+    /* Vector length is divided by 128 before storing it in arch_capabilities */
+    return sve_vl * 128U;
+#else
+    return 0;
+#endif
+}
+
+#endif /* ARM_ARCH_CAPABILITIES_H */
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
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 0cfad8508dbd..0e90b6b408ec 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -1106,6 +1106,7 @@ libxl_physinfo = Struct("physinfo", [
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
index ed1cbafdb488..2036fd290339 100644
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
index cfb2734a992b..281e3b198104 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -7,6 +7,7 @@
 #define PY_SSIZE_T_CLEAN
 #include <Python.h>
 #define XC_WANT_COMPAT_MAP_FOREIGN_API
+#include <arm_arch_capabilities.h>
 #include <xenctrl.h>
 #include <xenguest.h>
 #include <fcntl.h>
@@ -897,7 +898,7 @@ static PyObject *pyxc_physinfo(XcObject *self)
     if ( p != virt_caps )
       *(p-1) = '\0';
 
-    return Py_BuildValue("{s:i,s:i,s:i,s:i,s:l,s:l,s:l,s:i,s:s,s:s}",
+    return Py_BuildValue("{s:i,s:i,s:i,s:i,s:l,s:l,s:l,s:i,s:s,s:s,s:i}",
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
index 712b7638b013..e161da7e8952 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -14,6 +14,7 @@
 
 #define _GNU_SOURCE
 
+#include <arm_arch_capabilities.h>
 #include <fcntl.h>
 #include <inttypes.h>
 #include <stdlib.h>
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


