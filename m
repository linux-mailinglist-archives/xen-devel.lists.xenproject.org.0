Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8546056BB4E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 15:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363433.593955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9oT6-0003fL-Lt; Fri, 08 Jul 2022 13:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363433.593955; Fri, 08 Jul 2022 13:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9oT6-0003ck-Iz; Fri, 08 Jul 2022 13:56:28 +0000
Received: by outflank-mailman (input) for mailman id 363433;
 Fri, 08 Jul 2022 13:56:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8CmV=XN=citrix.com=prvs=1817bcba8=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1o9oT4-0003ce-LP
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 13:56:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf819d64-fec5-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 15:56:23 +0200 (CEST)
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
X-Inumbo-ID: bf819d64-fec5-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657288584;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s9DhedBEfAv/jul8K51L5AsUtOyMkxy6HPD4OGui4uw=;
  b=XaIKrwMMsclZW425wDD5jmL7u7CNQ1KgCutra12aTFjEr++mBbrgDF7u
   BFlsxDJUpCO76EsDYer4aQ51rXJDqqJMmaXdynHnOE7B6+TfJvX6sReY7
   rZb7L6yz7ae/J9ZW8fnZwwmKim2WBkRMju9gIVc6sPrMsJUlupUsdTuxd
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75372839
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Nc/ZTK/c3NQ8yty3Cca/DrUDaX6TJUtcMsCJ2f8bNWPcYEJGY0x3x
 zFNDW+BOKmNM2H1fosiO9y/8BtSvZeGy9QxSQA+qCo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw3oDpW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnY2WeV8COavzpLUiV0NiTjFGLalE5paSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKEWvHwm6DjdBPIvR53rSKTW/95Imjw3g6iiGN6BO
 pFGM2o0PXwsZTUVZnE5Jp0GzN6S3FXuTmJ6lnCkiu04tj27IAtZj+G2bYu9lsaxbcdahEGDv
 Urd4n/0RBodMbS3yzCI73atje/nhj7gVcQZE7jQ3vJjnlC73GEYDxwSE1yhrpGRiUOgWtQZN
 00d/AIvq7Q/8AqgSdyVdx+lpjiCtx0VWdtVGsU77h2Azuzf5APxLnIDVTRbb9slsuc5QDUr0
 hmCmNaBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kbkRbnXttlVqmvgbXdAirsy
 jqHqCw/gbQ7jsMR0ai/u1fdjFqEpIXNTwMzzhXaWCSi9AwRWWK+T9X2sx6Bt68GddvHCAna1
 JQZpySAxPEoPcmmkyqyfLQyGOuTuua9IDnen3c6SvHN6A+RF26fkZF4uW8jex0wbplUJVcFc
 2eI51oPucY70G+CKPYuPtnvU5lCIb3IT4yNaxzCUjZZjnGdniej9TomW0Of1nuFfKMEwfBmY
 sfznSpB4B8n5UVbINmeHb51PUcDnHxW+I8qbcmTI+6b+bSffmWJbrwOLUGDaOs0hIvd/liKq
 Y8PaJvQlU8POAEbXsUx2ddCRbztBSFiba0aVuQNLrLTSuaYMDtJ5wDtLUMJJNU+wvU9ehbg9
 XChQE5IoGfCaYn8AVzSMBhLMeq3Nb4m9C5TFXF8bD6Ahil4Ca7yvfh3SnfCVeR+nACV5aUvF
 KdtlgTpKqkndwkrDBxGMsKl89w6KEXy7e9MVgL8CAUCk1dbb1Sh0rfZksHHrkHi0gLfWRMCn
 oCd
IronPort-HdrOrdr: A9a23:cpBuIayf4+SdTZB0fYEBKrPwIr1zdoMgy1knxilNoRw8SK2lfq
 eV7ZImPH7P+VEssR4b6LO90cW7Lk80lqQFhbX5X43SPjUO0VHAROoJgOffKlXbalTDH4VmtZ
 uIHZIRNDSJNykesfrH
X-IronPort-AV: E=Sophos;i="5.92,255,1650945600"; 
   d="scan'208";a="75372839"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>, "David
 Scott" <dave@recoil.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH v11 1/2] xen+tools: Report Interrupt Controller Virtualization capabilities on x86
Date: Fri, 8 Jul 2022 14:55:59 +0100
Message-ID: <20220708135559.30719-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC and
XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC to report accelerated xAPIC and
x2APIC, on x86 hardware. This is so that xAPIC and x2APIC virtualization
can subsequently be enabled on a per-domain basis.
No such features are currently implemented on AMD hardware.

HW assisted xAPIC virtualization will be reported if HW, at the
minimum, supports virtualize_apic_accesses as this feature alone means
that an access to the APIC page will cause an APIC-access VM exit. An
APIC-access VM exit provides a VMM with information about the access
causing the VM exit, unlike a regular EPT fault, thus simplifying some
internal handling.

HW assisted x2APIC virtualization will be reported if HW supports
virtualize_x2apic_mode and, at least, either apic_reg_virt or
virtual_intr_delivery. This also means that
sysctl follows the conditionals in vmx_vlapic_msr_changed().

For that purpose, also add an arch-specific "capabilities" parameter
to struct xen_sysctl_physinfo.

Note that this interface is intended to be compatible with AMD so that
AVIC support can be introduced in a future patch. Unlike Intel that
has multiple controls for APIC Virtualization, AMD has one global
'AVIC Enable' control bit, so fine-graining of APIC virtualization
control cannot be done on a common interface.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
Reviewed-by: "Roger Pau Monné" <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: George Dunlap <george.dunlap@citrix.com>
---
CC: George Dunlap <george.dunlap@citrix.com>
CC: Nick Rosbrook <rosbrookn@gmail.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Juergen Gross <jgross@suse.com>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>

v11:
 * explicity define arch_cap_list in stub_xc_physinfo for non-x86 arch

v10:
 * Make assisted_x{2}apic_available conditional upon _vmx_cpu_up()

v9:
 * Move assisted_x{2}apic_available to vmx_vmcs_init() so they get
   declared at boot time, after vmx_secondary_exec_control is set

v8:
 * Improve commit message

v7:
 * Make sure assisted_x{2}apic_available evaluates to false, to ensure
   Xen builds, when !CONFIG_HVM
 * Fix coding style issues

v6:
 * Limit abi check to x86
 * Fix coding style issue

v5:
 * Have assisted_xapic_available solely depend on
   cpu_has_vmx_virtualize_apic_accesses and assisted_x2apic_available
   depend on cpu_has_vmx_virtualize_x2apic_mode and
   cpu_has_vmx_apic_reg_virt OR cpu_has_vmx_virtual_intr_delivery

v4:
 * Fallback to the original v2/v1 conditions for setting
   assisted_xapic_available and assisted_x2apic_available so that in
   the future APIC virtualization can be exposed on AMD hardware
   since fine-graining of "AVIC" is not supported, i.e., AMD solely
   uses "AVIC Enable". This also means that sysctl mimics what's
   exposed in CPUID

v3:
 * Define XEN_SYSCTL_PHYSCAP_ARCH_MAX for ABI checking and actually
   set "arch_capbilities", via a call to c_bitmap_to_ocaml_list()
 * Have assisted_x2apic_available only depend on
   cpu_has_vmx_virtualize_x2apic_mode

v2:
 * Use one macro LIBXL_HAVE_PHYSINFO_ASSISTED_APIC instead of two
 * Pass xcpyshinfo as a pointer in libxl__arch_get_physinfo
 * Set assisted_x{2}apic_available to be conditional upon "bsp" and
   annotate it with __ro_after_init
 * Change XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_X{2}APIC to
   _X86_ASSISTED_X{2}APIC
 * Keep XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X{2}APIC contained within
   sysctl.h
 * Fix padding introduced in struct xen_sysctl_physinfo and bump
   XEN_SYSCTL_INTERFACE_VERSION
---
 tools/golang/xenlight/helpers.gen.go |  4 ++++
 tools/golang/xenlight/types.gen.go   |  2 ++
 tools/include/libxl.h                |  7 +++++++
 tools/libs/gnttab/st8ojiU6           |  0
 tools/libs/light/libxl.c             |  3 +++
 tools/libs/light/libxl_arch.h        |  4 ++++
 tools/libs/light/libxl_arm.c         |  5 +++++
 tools/libs/light/libxl_types.idl     |  2 ++
 tools/libs/light/libxl_x86.c         | 11 +++++++++++
 tools/ocaml/libs/xc/xenctrl.ml       |  9 +++++++++
 tools/ocaml/libs/xc/xenctrl.mli      |  8 ++++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c  | 18 ++++++++++++++++--
 tools/xl/xl_info.c                   |  6 ++++--
 xen/arch/x86/hvm/hvm.c               |  3 +++
 xen/arch/x86/hvm/vmx/vmcs.c          |  7 +++++++
 xen/arch/x86/include/asm/hvm/hvm.h   |  5 +++++
 xen/arch/x86/sysctl.c                |  4 ++++
 xen/include/public/sysctl.h          | 11 ++++++++++-
 18 files changed, 104 insertions(+), 5 deletions(-)
 create mode 100644 tools/libs/gnttab/st8ojiU6

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index b746ff1081..dd4e6c9f14 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -3373,6 +3373,8 @@ x.CapVmtrace = bool(xc.cap_vmtrace)
 x.CapVpmu = bool(xc.cap_vpmu)
 x.CapGnttabV1 = bool(xc.cap_gnttab_v1)
 x.CapGnttabV2 = bool(xc.cap_gnttab_v2)
+x.CapAssistedXapic = bool(xc.cap_assisted_xapic)
+x.CapAssistedX2Apic = bool(xc.cap_assisted_x2apic)
 
  return nil}
 
@@ -3407,6 +3409,8 @@ xc.cap_vmtrace = C.bool(x.CapVmtrace)
 xc.cap_vpmu = C.bool(x.CapVpmu)
 xc.cap_gnttab_v1 = C.bool(x.CapGnttabV1)
 xc.cap_gnttab_v2 = C.bool(x.CapGnttabV2)
+xc.cap_assisted_xapic = C.bool(x.CapAssistedXapic)
+xc.cap_assisted_x2apic = C.bool(x.CapAssistedX2Apic)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index b1e84d5258..87be46c745 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -1014,6 +1014,8 @@ CapVmtrace bool
 CapVpmu bool
 CapGnttabV1 bool
 CapGnttabV2 bool
+CapAssistedXapic bool
+CapAssistedX2Apic bool
 }
 
 type Connectorinfo struct {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 835dfabc50..3a68e1b55a 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -536,6 +536,13 @@
 #define LIBXL_HAVE_NIC_TRUSTED 1
 
 /*
+ * LIBXL_HAVE_PHYSINFO_ASSISTED_APIC indicates that libxl_physinfo has
+ * cap_assisted_xapic and cap_assisted_x2apic fields, which indicates
+ * the availability of x{2}APIC hardware assisted virtualization.
+ */
+#define LIBXL_HAVE_PHYSINFO_ASSISTED_APIC 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/gnttab/st8ojiU6 b/tools/libs/gnttab/st8ojiU6
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index a0bf7d186f..6d699951e2 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -15,6 +15,7 @@
 #include "libxl_osdeps.h"
 
 #include "libxl_internal.h"
+#include "libxl_arch.h"
 
 int libxl_ctx_alloc(libxl_ctx **pctx, int version,
                     unsigned flags, xentoollog_logger * lg)
@@ -410,6 +411,8 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
     physinfo->cap_gnttab_v2 =
         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_gnttab_v2);
 
+    libxl__arch_get_physinfo(physinfo, &xcphysinfo);
+
     GC_FREE;
     return 0;
 }
diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index 1522ecb97f..207ceac6a1 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -86,6 +86,10 @@ int libxl__arch_extra_memory(libxl__gc *gc,
                              uint64_t *out);
 
 _hidden
+void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
+                              const xc_physinfo_t *xcphysinfo);
+
+_hidden
 void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src);
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index eef1de0939..39fdca1b49 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1431,6 +1431,11 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
+void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
+                              const xc_physinfo_t *xcphysinfo)
+{
+}
+
 void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src)
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 89962218b4..47f6a30cde 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -1070,6 +1070,8 @@ libxl_physinfo = Struct("physinfo", [
     ("cap_vpmu", bool),
     ("cap_gnttab_v1", bool),
     ("cap_gnttab_v2", bool),
+    ("cap_assisted_xapic", bool),
+    ("cap_assisted_x2apic", bool),
     ], dir=DIR_OUT)
 
 libxl_connectorinfo = Struct("connectorinfo", [
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 1feadebb18..e0a06ecfe3 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -866,6 +866,17 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
+void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
+                              const xc_physinfo_t *xcphysinfo)
+{
+    physinfo->cap_assisted_xapic =
+        !!(xcphysinfo->arch_capabilities &
+           XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC);
+    physinfo->cap_assisted_x2apic =
+        !!(xcphysinfo->arch_capabilities &
+           XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC);
+}
+
 void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src)
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 8eab6f60eb..6fa30ddb56 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -128,6 +128,14 @@ type physinfo_cap_flag =
 	| CAP_Gnttab_v1
 	| CAP_Gnttab_v2
 
+
+type x86_physinfo_arch_cap_flag =
+	| CAP_X86_ASSISTED_XAPIC
+	| CAP_X86_ASSISTED_X2APIC
+
+type physinfo_arch_cap_flag =
+	| X86 of x86_physinfo_arch_cap_flag
+
 type physinfo =
 {
 	threads_per_core : int;
@@ -141,6 +149,7 @@ type physinfo =
 	(* XXX hw_cap *)
 	capabilities     : physinfo_cap_flag list;
 	max_nr_cpus      : int;
+	arch_capabilities : physinfo_arch_cap_flag list;
 }
 
 type version =
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index d3014a2708..01774da768 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -113,6 +113,13 @@ type physinfo_cap_flag =
   | CAP_Gnttab_v1
   | CAP_Gnttab_v2
 
+type x86_physinfo_arch_cap_flag =
+  | CAP_X86_ASSISTED_XAPIC
+  | CAP_X86_ASSISTED_X2APIC
+
+type physinfo_arch_cap_flag =
+  | X86 of x86_physinfo_arch_cap_flag
+
 type physinfo = {
   threads_per_core : int;
   cores_per_socket : int;
@@ -124,6 +131,7 @@ type physinfo = {
   scrub_pages      : nativeint;
   capabilities     : physinfo_cap_flag list;
   max_nr_cpus      : int; (** compile-time max possible number of nr_cpus *)
+  arch_capabilities : physinfo_arch_cap_flag list;
 }
 type version = { major : int; minor : int; extra : string; }
 type compile_info = {
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 513ee142d2..42c2bcd333 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -718,7 +718,7 @@ CAMLprim value stub_xc_send_debug_keys(value xch, value keys)
 CAMLprim value stub_xc_physinfo(value xch)
 {
 	CAMLparam1(xch);
-	CAMLlocal2(physinfo, cap_list);
+	CAMLlocal4(physinfo, cap_list, x86_arch_cap_list, arch_cap_list);
 	xc_physinfo_t c_physinfo;
 	int r;
 
@@ -737,7 +737,7 @@ CAMLprim value stub_xc_physinfo(value xch)
 		/* ! XEN_SYSCTL_PHYSCAP_ XEN_SYSCTL_PHYSCAP_MAX max */
 		(c_physinfo.capabilities);
 
-	physinfo = caml_alloc_tuple(10);
+	physinfo = caml_alloc_tuple(11);
 	Store_field(physinfo, 0, Val_int(c_physinfo.threads_per_core));
 	Store_field(physinfo, 1, Val_int(c_physinfo.cores_per_socket));
 	Store_field(physinfo, 2, Val_int(c_physinfo.nr_cpus));
@@ -749,6 +749,20 @@ CAMLprim value stub_xc_physinfo(value xch)
 	Store_field(physinfo, 8, cap_list);
 	Store_field(physinfo, 9, Val_int(c_physinfo.max_cpu_id + 1));
 
+#if defined(__i386__) || defined(__x86_64__)
+	x86_arch_cap_list = c_bitmap_to_ocaml_list
+		/* ! x86_physinfo_arch_cap_flag CAP_X86_ none */
+		/* ! XEN_SYSCTL_PHYSCAP_X86_ XEN_SYSCTL_PHYSCAP_X86_MAX max */
+		(c_physinfo.arch_capabilities);
+	/*
+	 * arch_capabilities: physinfo_arch_cap_flag list;
+	 */
+	arch_cap_list = x86_arch_cap_list;
+#else
+	arch_cap_list = Val_emptylist;
+#endif
+	Store_field(physinfo, 10, arch_cap_list);
+
 	CAMLreturn(physinfo);
 }
 
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 712b7638b0..3205270754 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -210,7 +210,7 @@ static void output_physinfo(void)
          info.hw_cap[4], info.hw_cap[5], info.hw_cap[6], info.hw_cap[7]
         );
 
-    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s\n",
+    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
          info.cap_pv ? " pv" : "",
          info.cap_hvm ? " hvm" : "",
          info.cap_hvm && info.cap_hvm_directio ? " hvm_directio" : "",
@@ -221,7 +221,9 @@ static void output_physinfo(void)
          info.cap_vmtrace ? " vmtrace" : "",
          info.cap_vpmu ? " vpmu" : "",
          info.cap_gnttab_v1 ? " gnttab-v1" : "",
-         info.cap_gnttab_v2 ? " gnttab-v2" : ""
+         info.cap_gnttab_v2 ? " gnttab-v2" : "",
+         info.cap_assisted_xapic ? " assisted_xapic" : "",
+         info.cap_assisted_x2apic ? " assisted_x2apic" : ""
         );
 
     vinfo = libxl_get_version_info(ctx);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5b16fb4cd8..0a32a948db 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -117,6 +117,9 @@ static const char __initconst warning_hvm_fep[] =
 static bool_t __initdata opt_altp2m_enabled = 0;
 boolean_param("altp2m", opt_altp2m_enabled);
 
+bool __ro_after_init assisted_xapic_available;
+bool __ro_after_init assisted_x2apic_available;
+
 static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 56fed2db03..7329622dd4 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -2146,7 +2146,14 @@ int __init vmx_vmcs_init(void)
     ret = _vmx_cpu_up(true);
 
     if ( !ret )
+    {
+        /* Check whether hardware supports accelerated xapic and x2apic. */
+        assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
+        assisted_x2apic_available = cpu_has_vmx_virtualize_x2apic_mode &&
+                                    (cpu_has_vmx_apic_reg_virt ||
+                                     cpu_has_vmx_virtual_intr_delivery);
         register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
+    }
 
     return ret;
 }
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index caaeacabc7..8d162b2c99 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -388,6 +388,9 @@ int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
 #define hvm_tsc_scaling_ratio(d) \
     ((d)->arch.hvm.tsc_scaling_ratio)
 
+extern bool assisted_xapic_available;
+extern bool assisted_x2apic_available;
+
 #define hvm_get_guest_time(v) hvm_get_guest_time_fixed(v, 0)
 
 #define hvm_paging_enabled(v) \
@@ -901,6 +904,8 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 #define hvm_tsc_scaling_supported false
 #define hap_has_1gb false
 #define hap_has_2mb false
+#define assisted_xapic_available false
+#define assisted_x2apic_available false
 
 #define hvm_paging_enabled(v) ((void)(v), false)
 #define hvm_wp_enabled(v) ((void)(v), false)
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index f82abc2488..716525f72f 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -135,6 +135,10 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_hap;
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
+    if ( assisted_xapic_available )
+        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC;
+    if ( assisted_x2apic_available )
+        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC;
 }
 
 long arch_do_sysctl(
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 60c8711483..5672906729 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -35,7 +35,7 @@
 #include "domctl.h"
 #include "physdev.h"
 
-#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014
+#define XEN_SYSCTL_INTERFACE_VERSION 0x00000015
 
 /*
  * Read console content from Xen buffer ring.
@@ -111,6 +111,13 @@ struct xen_sysctl_tbuf_op {
 /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
 #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
 
+/* The platform supports x{2}apic hardware assisted emulation. */
+#define XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC  (1u << 0)
+#define XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC (1u << 1)
+
+/* Max XEN_SYSCTL_PHYSCAP_X86_* constant. Used for ABI checking. */
+#define XEN_SYSCTL_PHYSCAP_X86_MAX XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC
+
 struct xen_sysctl_physinfo {
     uint32_t threads_per_core;
     uint32_t cores_per_socket;
@@ -120,6 +127,8 @@ struct xen_sysctl_physinfo {
     uint32_t max_node_id; /* Largest possible node ID on this host */
     uint32_t cpu_khz;
     uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
+    uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_{X86,ARM,...}_??? */
+    uint32_t pad;
     uint64_aligned_t total_pages;
     uint64_aligned_t free_pages;
     uint64_aligned_t scrub_pages;
-- 
2.11.0


