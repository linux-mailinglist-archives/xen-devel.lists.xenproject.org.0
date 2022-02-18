Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 970BB4BBE70
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 18:30:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275590.471565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL75G-0006wC-IR; Fri, 18 Feb 2022 17:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275590.471565; Fri, 18 Feb 2022 17:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL75G-0006tU-EG; Fri, 18 Feb 2022 17:30:18 +0000
Received: by outflank-mailman (input) for mailman id 275590;
 Fri, 18 Feb 2022 17:30:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nO3j=TB=citrix.com=prvs=0411eaaf8=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nL75E-0006rZ-6N
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 17:30:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c8f5e0e-90e0-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 18:30:13 +0100 (CET)
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
X-Inumbo-ID: 6c8f5e0e-90e0-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645205411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/ZduhxfybYUOigZ7XcderhnCORrUGSi1ysw6fK2cCVc=;
  b=ayRwRR6nomJZdEZRxYCfRTieV2DWAILXrLW0Uw0qMgnV9J7IFuCjdXi7
   Thh3gz7NZP1mnzh0bN14rJDPmtUNui/iI5FBC4MOw8ai4Dd84nWI8IfQM
   LtA4oSfEnzvI/B2o4U9Lu9NY3vD9/rJ+GQLriMJ+lu5mEWA+nY9VWNPt5
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64941224
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:M/XMp6DFzVVfkhVW/8njw5YqxClBgxIJ4kV8jS/XYbTApGwh1jBSz
 GBKWTiGafuMM2v3ftxwadyy90xV65fXnNBiQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg0tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh9y
 o126Y6sZTsCO5+Qw/wYeRRySS1haPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwBJc/meqYWvnhkxDfUJf0nXYrCU+PB4towMDIY2JwfQa+EP
 ZZxhTxHaBLjZhhWE0ktJbkDob6TuyXxcBNztwfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKH73ati+nnjS79HoUIG9WQyPluh1GCw30JPzcfX1C7vPqRh1a3XpRUL
 El80iYns6Ua7kGgSdj5GRqirxasvBEGXMFLO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqTS0OQBYB4tLjiJoulR+JRdFmeJNZlfWsR2u2m
 WrT6nFj2fND1qbnyplX43jLgWqX+orVYjIe4zeLBXqgxA5TPoK6MtnABUfg0d5MK4OQT1+kt
 XcCmtSD4O1mMaxhhBBhU81WQuj3uq/t3Cn0xAc2QsJ/r2jFF2uLINgIiAySMnuFJSrtldXBR
 EbI8T1c65ZIVJdBRf8mOtnhYyjGIEWJKDgEahw2RoYfCnSSXFXelM2LWaJ29zm8+KTLuftiU
 ap3ie72UR4n5V1PlVJavds1374x3TwZzmjOX539xBnP+ePAOCPME+tdYQfQN7pRAEa4TOP9q
 oc32yyikUg3bQEDSnOPrd57wa4idhDX+qwaW+QIL7Xec2KK6UkqCuPLwKNJRmCWt/89qws8x
 VnkAhUw4AOm3RXvcFzWAlg+OOKHdcsu9hoTYH1zVWtELlB+OO5DGo9ELMBpFVTmncQ+pcNJo
 w4tIZvYWa0XEmydk9nfBLGkxLFfmN2QrVrmF0KYjPIXJvaMmyShFgfYQzbS
IronPort-HdrOrdr: A9a23:OHNv1qEFBgkALBQopLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,379,1635220800"; 
   d="scan'208";a="64941224"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 2/2] x86/xen: Allow per-domain usage of hardware virtualized APIC
Date: Fri, 18 Feb 2022 17:29:43 +0000
Message-ID: <20220218172943.12182-3-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220218172943.12182-1-jane.malalane@citrix.com>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Introduce a new per-domain creation x86 specific flag to
select whether hardware assisted virtualization should be used for
x{2}APIC.

A per-domain option is added to xl in order to select the usage of
x{2}APIC hardware assisted vitualization, as well as a global
configuration option.

Having all APIC interaction exit to Xen for emulation is slow and can
induce much overhead. Hardware can speed up x{2}APIC by decoding the
APIC access and providing a VM exit with a more specific exit reason
than a regular EPT fault or by altogether avoiding a VM exit.

On the other hand, being able to disable x{2}APIC hardware assisted
vitualization can be useful for testing and debugging purposes.

Note: vmx_install_vlapic_mapping doesn't require modifications
regardless of whether the guest has virtualize_apic_accesses enabled
or not, i.e., setting the the APIC_ACCESS_ADDR VMCS field is fine so
long as virtualize_apic_accesses is supported by the CPU.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>

v3:
 * Change info in xl.cfg to better express reality and fix
   capitalization of x{2}apic
 * Move "physinfo" variable definition to the beggining of
   libxl__domain_build_info_setdefault()
 * Reposition brackets in if statement to match libxl coding style
 * Shorten logic in libxl__arch_domain_build_info_setdefault()
 * Correct dprintk message in arch_sanitise_domain_config()
 * Make appropriate changes in vmx_vlapic_msr_changed() and
   cpuid_hypervisor_leaves() for amended "assisted_x2apic" bit
 * Remove unneeded parantheses

v2:
 * Add a LIBXL_HAVE_ASSISTED_APIC macro
 * Pass xcpyshinfo as a pointer in libxl__arch_get_physinfo
 * Add a return statement in now "int"
   libxl__arch_domain_build_info_setdefault()
 * Preserve libxl__arch_domain_build_info_setdefault 's location in
   libxl_create.c
 * Correct x{2}apic default setting logic in
   libxl__arch_domain_prepare_config()
 * Correct logic for parsing assisted_x{2}apic host/guest options in
   xl_parse.c and initialize them to -1 in xl.c
 * Use guest options directly in vmx_vlapic_msr_changed
 * Fix indentation of bool assisted_x{2}apic in struct hvm_domain
 * Add a change in xenctrl_stubs.c to pass xenctrl ABI checks
---
 docs/man/xl.cfg.5.pod.in              | 19 +++++++++++++++++++
 docs/man/xl.conf.5.pod.in             | 12 ++++++++++++
 tools/golang/xenlight/helpers.gen.go  | 12 ++++++++++++
 tools/golang/xenlight/types.gen.go    |  2 ++
 tools/include/libxl.h                 |  7 +++++++
 tools/libs/light/libxl_arch.h         |  5 +++--
 tools/libs/light/libxl_arm.c          |  7 +++++--
 tools/libs/light/libxl_create.c       | 22 +++++++++++++---------
 tools/libs/light/libxl_types.idl      |  2 ++
 tools/libs/light/libxl_x86.c          | 28 ++++++++++++++++++++++++++--
 tools/ocaml/libs/xc/xenctrl.ml        |  2 ++
 tools/ocaml/libs/xc/xenctrl.mli       |  2 ++
 tools/ocaml/libs/xc/xenctrl_stubs.c   |  2 +-
 tools/xl/xl.c                         |  8 ++++++++
 tools/xl/xl.h                         |  2 ++
 tools/xl/xl_parse.c                   | 16 ++++++++++++++++
 xen/arch/x86/domain.c                 | 28 +++++++++++++++++++++++++++-
 xen/arch/x86/hvm/vmx/vmcs.c           |  4 ++++
 xen/arch/x86/hvm/vmx/vmx.c            |  8 ++++----
 xen/arch/x86/include/asm/hvm/domain.h |  6 ++++++
 xen/arch/x86/traps.c                  |  8 ++++----
 xen/include/public/arch-x86/xen.h     |  2 ++
 22 files changed, 179 insertions(+), 25 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index b98d161398..dcca564a23 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1862,6 +1862,25 @@ firmware tables when using certain older guest Operating
 Systems. These tables have been superseded by newer constructs within
 the ACPI tables.
 
+=item B<assisted_xapic=BOOLEAN>
+
+B<(x86 only)> Enables or disables hardware assisted virtualization for
+xAPIC. With this option enabled, a memory-mapped APIC access will be
+decoded by hardware and either issue a more specific VM exit than just
+an EPT fault, or altogether avoid a VM exit. Notice full
+virtualization for xAPIC can only be achieved if hardware supports
+“APIC-register virtualization” and “virtual-interrupt delivery”. The
+default is settable via L<xl.conf(5)>.
+
+=item B<assisted_x2apic=BOOLEAN>
+
+B<(x86 only)> Enables or disables hardware assisted virtualization for
+x2APIC. With this option enabled, an MSR-Based APIC access will
+either issue a VM exit or altogether avoid one. Notice full
+virtualization for x2APIC can only be achieved if hardware supports
+“APIC-register virtualization” and “virtual-interrupt delivery”. The
+default is settable via L<xl.conf(5)>.
+
 =item B<nx=BOOLEAN>
 
 B<(x86 only)> Hides or exposes the No-eXecute capability. This allows a guest
diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
index df20c08137..95d136d1ea 100644
--- a/docs/man/xl.conf.5.pod.in
+++ b/docs/man/xl.conf.5.pod.in
@@ -107,6 +107,18 @@ Sets the default value for the C<max_grant_version> domain config value.
 
 Default: maximum grant version supported by the hypervisor.
 
+=item B<assisted_xapic=BOOLEAN>
+
+If enabled, domains will use xAPIC hardware assisted virtualization by default.
+
+Default: enabled if supported.
+
+=item B<assisted_x2apic=BOOLEAN>
+
+If enabled, domains will use x2APIC hardware assisted virtualization by default.
+
+Default: enabled if supported.
+
 =item B<vif.default.script="PATH">
 
 Configures the default hotplug script used by virtual network devices.
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index dd4e6c9f14..dece545ee0 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1120,6 +1120,12 @@ x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
 if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
+if err := x.ArchX86.AssistedXapic.fromC(&xc.arch_x86.assisted_xapic);err != nil {
+return fmt.Errorf("converting field ArchX86.AssistedXapic: %v", err)
+}
+if err := x.ArchX86.AssistedX2Apic.fromC(&xc.arch_x86.assisted_x2apic);err != nil {
+return fmt.Errorf("converting field ArchX86.AssistedX2Apic: %v", err)
+}
 x.Altp2M = Altp2MMode(xc.altp2m)
 x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
 if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
@@ -1605,6 +1611,12 @@ xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
 if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
+if err := x.ArchX86.AssistedXapic.toC(&xc.arch_x86.assisted_xapic); err != nil {
+return fmt.Errorf("converting field ArchX86.AssistedXapic: %v", err)
+}
+if err := x.ArchX86.AssistedX2Apic.toC(&xc.arch_x86.assisted_x2apic); err != nil {
+return fmt.Errorf("converting field ArchX86.AssistedX2Apic: %v", err)
+}
 xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
 xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
 if err := x.Vpmu.toC(&xc.vpmu); err != nil {
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 87be46c745..253c9ad93d 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -520,6 +520,8 @@ Vuart VuartType
 }
 ArchX86 struct {
 MsrRelaxed Defbool
+AssistedXapic Defbool
+AssistedX2Apic Defbool
 }
 Altp2M Altp2MMode
 VmtraceBufKb int
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 333ffad38d..1c83cae711 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -535,6 +535,13 @@
 #define LIBXL_HAVE_PHYSINFO_ASSISTED_APIC 1
 
 /*
+ * LIBXL_HAVE_ASSISTED_APIC indicates that libxl_domain_build_info has
+ * assisted_x{2}apic fields, for enabling hardware assisted virtualization for
+ * x{2}apic per domain.
+ */
+#define LIBXL_HAVE_ASSISTED_APIC 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index 207ceac6a1..03b89929e6 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -71,8 +71,9 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
                                                libxl_domain_create_info *c_info);
 
 _hidden
-void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
-                                              libxl_domain_build_info *b_info);
+int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
+                                             libxl_domain_build_info *b_info,
+                                             const libxl_physinfo *physinfo);
 
 _hidden
 int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 39fdca1b49..ba5b8f433f 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1384,8 +1384,9 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
     }
 }
 
-void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
-                                              libxl_domain_build_info *b_info)
+int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
+                                             libxl_domain_build_info *b_info,
+                                             const libxl_physinfo *physinfo)
 {
     /* ACPI is disabled by default */
     libxl_defbool_setdefault(&b_info->acpi, false);
@@ -1399,6 +1400,8 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
     memset(&b_info->u, '\0', sizeof(b_info->u));
     b_info->type = LIBXL_DOMAIN_TYPE_INVALID;
     libxl_domain_build_info_init_type(b_info, LIBXL_DOMAIN_TYPE_PVH);
+
+    return 0;
 }
 
 int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index d7a40d7550..4043bc682f 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -75,6 +75,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
                                         libxl_domain_build_info *b_info)
 {
     int i, rc;
+    libxl_physinfo info;
 
     if (b_info->type != LIBXL_DOMAIN_TYPE_HVM &&
         b_info->type != LIBXL_DOMAIN_TYPE_PV &&
@@ -264,7 +265,18 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
     if (!b_info->event_channels)
         b_info->event_channels = 1023;
 
-    libxl__arch_domain_build_info_setdefault(gc, b_info);
+    rc = libxl_get_physinfo(CTX, &info);
+    if (rc) {
+        LOG(ERROR, "failed to get hypervisor info");
+        return rc;
+    }
+
+    rc = libxl__arch_domain_build_info_setdefault(gc, b_info, &info);
+    if (rc) {
+        LOG(ERROR, "unable to set domain arch build info defaults");
+        return rc;
+    }
+
     libxl_defbool_setdefault(&b_info->dm_restrict, false);
 
     if (b_info->iommu_memkb == LIBXL_MEMKB_DEFAULT)
@@ -457,14 +469,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
     }
 
     if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
-        libxl_physinfo info;
-
-        rc = libxl_get_physinfo(CTX, &info);
-        if (rc) {
-            LOG(ERROR, "failed to get hypervisor info");
-            return rc;
-        }
-
         if (info.cap_gnttab_v2)
             b_info->max_grant_version = 2;
         else if (info.cap_gnttab_v1)
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 42ac6c357b..db5eb0a0b3 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -648,6 +648,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                ("vuart", libxl_vuart_type),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
+                               ("assisted_xapic", libxl_defbool),
+                               ("assisted_x2apic", libxl_defbool),
                               ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index e0a06ecfe3..c377d13b19 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -23,6 +23,14 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
         config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
 
+    if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV)
+    {
+        if (libxl_defbool_val(d_config->b_info.arch_x86.assisted_xapic))
+            config->arch.misc_flags |= XEN_X86_ASSISTED_XAPIC;
+
+        if (libxl_defbool_val(d_config->b_info.arch_x86.assisted_x2apic))
+            config->arch.misc_flags |= XEN_X86_ASSISTED_X2APIC;
+    }
     return 0;
 }
 
@@ -819,11 +827,27 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
 {
 }
 
-void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
-                                              libxl_domain_build_info *b_info)
+int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
+                                             libxl_domain_build_info *b_info,
+                                             const libxl_physinfo *physinfo)
 {
     libxl_defbool_setdefault(&b_info->acpi, true);
     libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
+
+    if (b_info->type != LIBXL_DOMAIN_TYPE_PV) {
+        libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic,
+                             physinfo->cap_assisted_xapic);
+        libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic,
+                             physinfo->cap_assisted_x2apic);
+    }
+
+    else if (!libxl_defbool_is_default(b_info->arch_x86.assisted_xapic) ||
+             !libxl_defbool_is_default(b_info->arch_x86.assisted_x2apic)) {
+        LOG(ERROR, "Interrupt Controller Virtualization not supported for PV");
+        return ERROR_INVAL;
+    }
+
+    return 0;
 }
 
 int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 21783d3622..672a11ceb6 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -50,6 +50,8 @@ type x86_arch_emulation_flags =
 
 type x86_arch_misc_flags =
 	| X86_MSR_RELAXED
+	| X86_ASSISTED_XAPIC
+	| X86_ASSISTED_X2APIC
 
 type xen_x86_arch_domainconfig =
 {
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index af6ba3d1a0..f9a6aa3a0f 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -44,6 +44,8 @@ type x86_arch_emulation_flags =
 
 type x86_arch_misc_flags =
   | X86_MSR_RELAXED
+  | X86_ASSISTED_XAPIC
+  | X86_ASSISTED_X2APIC
 
 type xen_x86_arch_domainconfig = {
   emulation_flags: x86_arch_emulation_flags list;
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 1fa5453043..c0ef57d6b7 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -239,7 +239,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 
 		cfg.arch.misc_flags = ocaml_list_to_c_bitmap
 			/* ! x86_arch_misc_flags X86_ none */
-			/* ! XEN_X86_ XEN_X86_MSR_RELAXED all */
+			/* ! XEN_X86_ XEN_X86_ASSISTED_X2APIC max */
 			(VAL_MISC_FLAGS);
 
 #undef VAL_MISC_FLAGS
diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 2d1ec18ea3..31eb223309 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -57,6 +57,8 @@ int max_grant_frames = -1;
 int max_maptrack_frames = -1;
 int max_grant_version = LIBXL_MAX_GRANT_DEFAULT;
 libxl_domid domid_policy = INVALID_DOMID;
+int assisted_xapic = -1;
+int assisted_x2apic = -1;
 
 xentoollog_level minmsglevel = minmsglevel_default;
 
@@ -201,6 +203,12 @@ static void parse_global_config(const char *configfile,
     if (!xlu_cfg_get_long (config, "claim_mode", &l, 0))
         claim_mode = l;
 
+    if (!xlu_cfg_get_long (config, "assisted_xapic", &l, 0))
+        assisted_xapic = l;
+
+    if (!xlu_cfg_get_long (config, "assisted_x2apic", &l, 0))
+        assisted_x2apic = l;
+
     xlu_cfg_replace_string (config, "remus.default.netbufscript",
         &default_remus_netbufscript, 0);
     xlu_cfg_replace_string (config, "colo.default.proxyscript",
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index c5c4bedbdd..528deb3feb 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -286,6 +286,8 @@ extern libxl_bitmap global_vm_affinity_mask;
 extern libxl_bitmap global_hvm_affinity_mask;
 extern libxl_bitmap global_pv_affinity_mask;
 extern libxl_domid domid_policy;
+extern int assisted_xapic;
+extern int assisted_x2apic;
 
 enum output_format {
     OUTPUT_FORMAT_JSON,
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 117fcdcb2b..0ab9b145fe 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1681,6 +1681,22 @@ void parse_config_data(const char *config_source,
         xlu_cfg_get_defbool(config, "vpt_align", &b_info->u.hvm.vpt_align, 0);
         xlu_cfg_get_defbool(config, "apic", &b_info->apic, 0);
 
+        e = xlu_cfg_get_long(config, "assisted_xapic", &l , 0);
+        if ((e == ESRCH && assisted_xapic != -1)) /* use global default if present */
+            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, assisted_xapic);
+        else if (!e)
+            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, l);
+        else
+            exit(1);
+
+        e = xlu_cfg_get_long(config, "assisted_x2apic", &l, 0);
+        if ((e == ESRCH && assisted_x2apic != -1)) /* use global default if present */
+            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, assisted_x2apic);
+        else if (!e)
+            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, l);
+        else
+            exit(1);
+
         switch (xlu_cfg_get_list(config, "viridian",
                                  &viridian, &num_viridian, 1))
         {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 9835f90ea0..c239e55f12 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -619,6 +619,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
+    bool assisted_xapic = config->arch.misc_flags & XEN_X86_ASSISTED_XAPIC;
+    bool assisted_x2apic = config->arch.misc_flags & XEN_X86_ASSISTED_X2APIC;
     unsigned int max_vcpus;
 
     if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
@@ -685,13 +687,31 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         }
     }
 
-    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
+    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED |
+                                     XEN_X86_ASSISTED_XAPIC |
+                                     XEN_X86_ASSISTED_X2APIC) )
     {
         dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
                 config->arch.misc_flags);
         return -EINVAL;
     }
 
+    if ( (assisted_xapic || assisted_x2apic) && !hvm )
+    {
+        dprintk(XENLOG_INFO,
+                "Interrupt Controller Virtualization not supported for PV\n");
+        return -EINVAL;
+    }
+
+    if ( (assisted_xapic && !assisted_xapic_available) ||
+         (assisted_x2apic && !assisted_x2apic_available) )
+    {
+        dprintk(XENLOG_INFO,
+                "Hardware assisted x%sAPIC requested but not available\n",
+                assisted_xapic && !assisted_xapic_available ? "" : "2");
+        return -EINVAL;
+    }
+
     return 0;
 }
 
@@ -864,6 +884,12 @@ int arch_domain_create(struct domain *d,
 
     d->arch.msr_relaxed = config->arch.misc_flags & XEN_X86_MSR_RELAXED;
 
+    d->arch.hvm.assisted_xapic =
+        config->arch.misc_flags & XEN_X86_ASSISTED_XAPIC;
+
+    d->arch.hvm.assisted_x2apic =
+        config->arch.misc_flags & XEN_X86_ASSISTED_X2APIC;
+
     return 0;
 
  fail:
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index be981e11bc..862b1d2126 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1155,6 +1155,10 @@ static int construct_vmcs(struct vcpu *v)
         __vmwrite(PLE_WINDOW, ple_window);
     }
 
+    if ( !v->domain->arch.hvm.assisted_xapic )
+        v->arch.hvm.vmx.secondary_exec_control &=
+            ~SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
+
     if ( cpu_has_vmx_secondary_exec_control )
         __vmwrite(SECONDARY_VM_EXEC_CONTROL,
                   v->arch.hvm.vmx.secondary_exec_control);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 36c8a12cfe..2a0851c960 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3333,15 +3333,15 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
 
 void vmx_vlapic_msr_changed(struct vcpu *v)
 {
-    int virtualize_x2apic_mode;
+    bool virtualize_x2apic_mode;
     struct vlapic *vlapic = vcpu_vlapic(v);
     unsigned int msr;
 
     virtualize_x2apic_mode = ( (cpu_has_vmx_apic_reg_virt ||
                                 cpu_has_vmx_virtual_intr_delivery) &&
-                               cpu_has_vmx_virtualize_x2apic_mode );
+                               v->domain->arch.hvm.assisted_x2apic );
 
-    if ( !cpu_has_vmx_virtualize_apic_accesses &&
+    if ( !v->domain->arch.hvm.assisted_xapic &&
          !virtualize_x2apic_mode )
         return;
 
@@ -3373,7 +3373,7 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
                 vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, VMX_MSR_W);
             }
         }
-        else
+        else if ( v->domain->arch.hvm.assisted_xapic )
             v->arch.hvm.vmx.secondary_exec_control |=
                 SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
     }
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 698455444e..92bf53483c 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -117,6 +117,12 @@ struct hvm_domain {
 
     bool                   is_s3_suspended;
 
+    /* xAPIC hardware assisted virtualization. */
+    bool                   assisted_xapic;
+
+    /* x2APIC hardware assisted virtualization. */
+    bool                   assisted_x2apic;
+
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 485bd66971..8f1c5efef7 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1115,7 +1115,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         if ( !is_hvm_domain(d) || subleaf != 0 )
             break;
 
-        if ( cpu_has_vmx_apic_reg_virt )
+        if ( cpu_has_vmx_apic_reg_virt &&
+             v->domain->arch.hvm.assisted_xapic )
             res->a |= XEN_HVM_CPUID_APIC_ACCESS_VIRT;
 
         /*
@@ -1124,9 +1125,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
          * and wrmsr in the guest will run without VMEXITs (see
          * vmx_vlapic_msr_changed()).
          */
-        if ( cpu_has_vmx_virtualize_x2apic_mode &&
-             cpu_has_vmx_apic_reg_virt &&
-             cpu_has_vmx_virtual_intr_delivery )
+        if ( cpu_has_vmx_apic_reg_virt && cpu_has_vmx_virtual_intr_delivery &&
+             v->domain->arch.hvm.assisted_x2apic )
             res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
 
         /*
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index 7acd94c8eb..9da32c6239 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -317,6 +317,8 @@ struct xen_arch_domainconfig {
  * doesn't allow the guest to read or write to the underlying MSR.
  */
 #define XEN_X86_MSR_RELAXED (1u << 0)
+#define XEN_X86_ASSISTED_XAPIC (1u << 1)
+#define XEN_X86_ASSISTED_X2APIC (1u << 2)
     uint32_t misc_flags;
 };
 
-- 
2.11.0


