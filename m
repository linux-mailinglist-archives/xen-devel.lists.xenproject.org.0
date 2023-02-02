Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC9B687B8B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 12:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488667.756924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXSN-0005EA-Ho; Thu, 02 Feb 2023 11:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488667.756924; Thu, 02 Feb 2023 11:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXSN-0005Az-BY; Thu, 02 Feb 2023 11:08:43 +0000
Received: by outflank-mailman (input) for mailman id 488667;
 Thu, 02 Feb 2023 11:08:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BK1=56=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pNXSL-0002sY-5V
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 11:08:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id f2312453-a2e9-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 12:08:39 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 952361042;
 Thu,  2 Feb 2023 03:09:21 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0B6F3F64C;
 Thu,  2 Feb 2023 03:08:37 -0800 (PST)
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
X-Inumbo-ID: f2312453-a2e9-11ed-933c-83870f6b2ba8
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
Subject: [PATCH 08/10] tools: add SVE capability and SVE vector length for physinfo
Date: Thu,  2 Feb 2023 11:08:14 +0000
Message-Id: <20230202110816.1252419-9-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202110816.1252419-1-luca.fancellu@arm.com>
References: <20230202110816.1252419-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent changes added in struct xen_sysctl_physinfo a new flag for
arch_capabilities to understand when the platform is SVE capable,
another field having the maximum SVE vector length in bits was
added as well, so update the tools to handle these new fields.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from RFC:
 - new patch
---
This patch is mostly dependent on the decisions we make in the previous, anyway
I touched some part of the toolstack where my knowledge is limited (ocaml) so
I might need a feedback for something I may have done wrong.
---
 tools/golang/xenlight/helpers.gen.go |  4 ++++
 tools/golang/xenlight/types.gen.go   |  2 ++
 tools/include/libxl.h                |  8 ++++++++
 tools/libs/light/libxl.c             |  3 +++
 tools/libs/light/libxl_types.idl     |  2 ++
 tools/ocaml/libs/xc/xenctrl.ml       |  4 +++-
 tools/ocaml/libs/xc/xenctrl.mli      |  4 +++-
 tools/ocaml/libs/xc/xenctrl_stubs.c  | 17 +++++++++++++----
 tools/python/xen/lowlevel/xc/xc.c    | 17 +++++++++++++++--
 tools/xl/xl_info.c                   | 10 ++++++++++
 10 files changed, 63 insertions(+), 8 deletions(-)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 3ac4938858f2..0e2c1b3acc74 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -3455,6 +3455,8 @@ x.CapVmtrace = bool(xc.cap_vmtrace)
 x.CapVpmu = bool(xc.cap_vpmu)
 x.CapGnttabV1 = bool(xc.cap_gnttab_v1)
 x.CapGnttabV2 = bool(xc.cap_gnttab_v2)
+x.CapArmSve = bool(xc.cap_arm_sve)
+x.ArmSveVlBits = uint16(xc.arm_sve_vl_bits)
 
  return nil}
 
@@ -3489,6 +3491,8 @@ xc.cap_vmtrace = C.bool(x.CapVmtrace)
 xc.cap_vpmu = C.bool(x.CapVpmu)
 xc.cap_gnttab_v1 = C.bool(x.CapGnttabV1)
 xc.cap_gnttab_v2 = C.bool(x.CapGnttabV2)
+xc.cap_arm_sve = C.bool(x.CapArmSve)
+xc.arm_sve_vl_bits = C.uint16(x.ArmSveVlBits)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 16ce879e3fb7..d4b67c97bb54 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -1051,6 +1051,8 @@ CapVmtrace bool
 CapVpmu bool
 CapGnttabV1 bool
 CapGnttabV2 bool
+CapArmSve bool
+ArmSveVlBits uint16
 }
 
 type Connectorinfo struct {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index d652895075a0..ce2997486953 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -520,6 +520,14 @@
  */
 #define LIBXL_HAVE_PHYSINFO_CAP_GNTTAB 1
 
+/*
+ * LIBXL_HAVE_PHYSINFO_CAP_ARM_SVE indicates that libxl_physinfo has a
+ * cap_arm_sve field, which indicates the availability of Arm SVE feature for
+ * guests and has arm_sve_vl_bits fields which indicates the supported maximum
+ * vector length for the platform.
+ */
+#define LIBXL_HAVE_PHYSINFO_CAP_ARM_SVE 1
+
 /*
  * LIBXL_HAVE_MAX_GRANT_VERSION indicates libxl_domain_build_info has a
  * max_grant_version field for setting the max grant table version per
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index a0bf7d186f69..ed9bd0ff520b 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -409,6 +409,9 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_gnttab_v1);
     physinfo->cap_gnttab_v2 =
         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_gnttab_v2);
+    physinfo->cap_arm_sve =
+        !!(xcphysinfo.arch_capabilities & XEN_SYSCTL_PHYSCAP_ARM_sve);
+    physinfo->arm_sve_vl_bits = xcphysinfo.arm_sve_vl_bits;
 
     GC_FREE;
     return 0;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 0cfad8508dbd..5bd44b37c74d 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -1106,6 +1106,8 @@ libxl_physinfo = Struct("physinfo", [
     ("cap_vpmu", bool),
     ("cap_gnttab_v1", bool),
     ("cap_gnttab_v2", bool),
+    ("cap_arm_sve", bool),
+    ("arm_sve_vl_bits", uint16),
     ], dir=DIR_OUT)
 
 libxl_connectorinfo = Struct("connectorinfo", [
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 7442bbbfc5e0..ce8ce2d1a663 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -128,7 +128,8 @@ type physinfo_cap_flag =
 	| CAP_Gnttab_v1
 	| CAP_Gnttab_v2
 
-type arm_physinfo_cap_flag
+type arm_physinfo_cap_flag =
+	| CAP_sve
 
 type x86_physinfo_cap_flag
 
@@ -150,6 +151,7 @@ type physinfo =
 	capabilities     : physinfo_cap_flag list;
 	max_nr_cpus      : int;
 	arch_capabilities : arch_physinfo_cap_flags;
+	arm_sve_vl_bits : int;
 }
 
 type version =
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 82def5a17cc2..ac479f44ddb2 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -113,7 +113,8 @@ type physinfo_cap_flag =
   | CAP_Gnttab_v1
   | CAP_Gnttab_v2
 
-type arm_physinfo_cap_flag
+type arm_physinfo_cap_flag =
+  | CAP_sve
 
 type x86_physinfo_cap_flag
 
@@ -133,6 +134,7 @@ type physinfo = {
   capabilities     : physinfo_cap_flag list;
   max_nr_cpus      : int; (** compile-time max possible number of nr_cpus *)
   arch_capabilities : arch_physinfo_cap_flags;
+  arm_sve_vl_bits : int;
 }
 type version = { major : int; minor : int; extra : string; }
 type compile_info = {
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 2fba9c5e94d6..d85e4a20e6d0 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -810,7 +810,7 @@ CAMLprim value stub_xc_physinfo(value xch)
 		/* ! XEN_SYSCTL_PHYSCAP_ XEN_SYSCTL_PHYSCAP_MAX max */
 		(c_physinfo.capabilities);
 
-	physinfo = caml_alloc_tuple(11);
+	physinfo = caml_alloc_tuple(12);
 	Store_field(physinfo, 0, Val_int(c_physinfo.threads_per_core));
 	Store_field(physinfo, 1, Val_int(c_physinfo.cores_per_socket));
 	Store_field(physinfo, 2, Val_int(c_physinfo.nr_cpus));
@@ -825,13 +825,22 @@ CAMLprim value stub_xc_physinfo(value xch)
 #if defined(__i386__) || defined(__x86_64__)
 	arch_cap_list = Tag_cons;
 
-	arch_cap_flags_tag = 1; /* tag x86 */
+	arch_cap_flags = caml_alloc_small(1, 1);
+	Store_field(arch_cap_flags, 0, arch_cap_list);
+	Store_field(physinfo, 11, Tag_cons);
+#elif defined (__arm__) || defined(__aarch64__)
+	/*
+	 * capabilities: arm_physinfo_cap_flag list;
+	 */
+	arch_cap_flags = c_bitmap_to_ocaml_list
+		/* ! arm_physinfo_cap_flag CAP_ lc */
+		/* ! XEN_SYSCTL_PHYSCAP_ARM_ XEN_SYSCTL_PHYSCAP_ARM_MAX max */
+		(c_physinfo.arch_capabilities);
+	Store_field(physinfo, 11, Val_int(c_physinfo.arm_sve_vl_bits));
 #else
 	caml_failwith("Unhandled architecture");
 #endif
 
-	arch_cap_flags = caml_alloc_small(1, arch_cap_flags_tag);
-	Store_field(arch_cap_flags, 0, arch_cap_list);
 	Store_field(physinfo, 10, arch_cap_flags);
 
 	CAMLreturn(physinfo);
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index fd008610329b..516fa57161a6 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -870,6 +870,11 @@ static PyObject *pyxc_physinfo(XcObject *self)
     const char *virtcap_names[] = { "hvm", "pv" };
     const unsigned virtcaps_bits[] = { XEN_SYSCTL_PHYSCAP_hvm,
                                        XEN_SYSCTL_PHYSCAP_pv };
+#if defined(__aarch64__)
+    const char py_buildval[] = "{s:i,s:i,s:i,s:i,s:l,s:l,s:l,s:i,s:s,s:s,s:i}";
+#else
+    const char py_buildval[] = "{s:i,s:i,s:i,s:i,s:l,s:l,s:l,s:i,s:s,s:s}";
+#endif
 
     if ( xc_physinfo(self->xc_handle, &pinfo) != 0 )
         return pyxc_error_to_exception(self->xc_handle);
@@ -893,10 +898,14 @@ static PyObject *pyxc_physinfo(XcObject *self)
         for ( i = 0; i < ARRAY_SIZE(virtcaps_bits); i++ )
             if ( pinfo.capabilities & virtcaps_bits[i] )
               p += sprintf(p, "%s_directio ", virtcap_names[i]);
+#if defined(__aarch64__)
+    if ( pinfo.arch_capabilities & XEN_SYSCTL_PHYSCAP_ARM_sve )
+        p += sprintf(p, "%s ", "arm_sve");
+#endif
     if ( p != virt_caps )
       *(p-1) = '\0';
 
-    return Py_BuildValue("{s:i,s:i,s:i,s:i,s:l,s:l,s:l,s:i,s:s,s:s}",
+    return Py_BuildValue(py_buildval,
                             "nr_nodes",         pinfo.nr_nodes,
                             "threads_per_core", pinfo.threads_per_core,
                             "cores_per_socket", pinfo.cores_per_socket,
@@ -906,7 +915,11 @@ static PyObject *pyxc_physinfo(XcObject *self)
                             "scrub_memory",     pages_to_kib(pinfo.scrub_pages),
                             "cpu_khz",          pinfo.cpu_khz,
                             "hw_caps",          cpu_cap,
-                            "virt_caps",        virt_caps);
+                            "virt_caps",        virt_caps
+#if defined(__aarch64__)
+                            , "arm_sve_vl_bits",  pinfo.arm_sve_vl_bits
+#endif
+                            );
 }
 
 static PyObject *pyxc_getcpuinfo(XcObject *self, PyObject *args, PyObject *kwds)
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 712b7638b013..44345d405873 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -210,7 +210,11 @@ static void output_physinfo(void)
          info.hw_cap[4], info.hw_cap[5], info.hw_cap[6], info.hw_cap[7]
         );
 
+#if defined(__aarch64__)
+    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s%s\n",
+#else
     maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s\n",
+#endif
          info.cap_pv ? " pv" : "",
          info.cap_hvm ? " hvm" : "",
          info.cap_hvm && info.cap_hvm_directio ? " hvm_directio" : "",
@@ -222,6 +226,9 @@ static void output_physinfo(void)
          info.cap_vpmu ? " vpmu" : "",
          info.cap_gnttab_v1 ? " gnttab-v1" : "",
          info.cap_gnttab_v2 ? " gnttab-v2" : ""
+#if defined(__aarch64__)
+         , info.cap_arm_sve ? " arm_sve" : ""
+#endif
         );
 
     vinfo = libxl_get_version_info(ctx);
@@ -240,6 +247,9 @@ static void output_physinfo(void)
         maybe_printf("free_cpus              : %d\n", n);
         free(cpumap.map);
     }
+#if defined(__aarch64__)
+    maybe_printf("arm_sve_max_vl_bits    : %d\n", info.arm_sve_vl_bits);
+#endif
     libxl_physinfo_dispose(&info);
     return;
 }
-- 
2.25.1


