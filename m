Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B74334D026D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 16:06:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286169.485583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREwO-0003jU-4h; Mon, 07 Mar 2022 15:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286169.485583; Mon, 07 Mar 2022 15:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREwO-0003gl-0e; Mon, 07 Mar 2022 15:06:28 +0000
Received: by outflank-mailman (input) for mailman id 286169;
 Mon, 07 Mar 2022 15:06:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NixE=TS=citrix.com=prvs=05809d0ec=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nREwM-0003OR-Iy
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 15:06:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26793aa6-9e28-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 16:06:23 +0100 (CET)
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
X-Inumbo-ID: 26793aa6-9e28-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646665583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gzl4AlZfYu+Ry/lc9a2klVkao8TiQODPSjeG9hsX6p4=;
  b=GZgYjLJJ7NTLm/AAFbuVhnlNSzQN3jVbjvzSPj5iWTFZxz5V4rnSMoO5
   pXnhcHrCg9RqoMfjmFiSYIeJ+P5R0dN5P0VMb7xjwshfRrjhCm1o5J4wv
   sFM2knbgQW57o5Q8Gv4js+gKYu6okgs49gthPyCgKHiyeOeHR39xQNoe+
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65617982
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+I0pI6Cav313bBVW/73jw5YqxClBgxIJ4kV8jS/XYbTApGh21WQDy
 DEXWGmOb6nYYmDyc4gkb4W2/E8D6JfXz9NjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh8z
 fBfh42SWDsHZKDu391FQRBbQn1HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwBJc/meqYWvnhkxDfUJf0nXYrCU+PB4towMDIY2J0QRKmPN
 5BxhTxHYDjPJENDPHctBakhmMeChmL2UhsAkQfAzUYwyzeKl1EguFT3C/LrfdiNSdRQj1yvj
 GvM9GTkATkXLNWajzGC9xqEnfTTlCn2XIYTEryQ9fNwhlCXgGsJB3U+X1ahveOwjEL4XttFM
 lEV4QInt610/0uuJvH+UgO5pjiYvxcac9tWD+A+rgqKz8L84RufQG4NTTdDadkvnM4wWTEuk
 FSOmrvBBzN1t6aOYWmA7brSpjS3UQAFIGlHaSIaQA8t59j4vJp1nh/JVsxkEqO+kpvyAz6Y6
 zKAoTU6hr4TpdUWzKj99lfC6xquu5zIQwgd9gjRGGW/4WtRe4qNd4Gur1/B4p59wJ2xFwfb+
 iJewo7Hsb5IXcrleDGxrPslEbSM9cSUEizgrwRiPd4Yryak+C//RNUFiN1hH3tBPsEBcD7vR
 UbcvwJN+ZNeVEeXgb9Lj5GZUJpzk/W5fTjxfrWNN4cVPMAtHOOS1Hw2PSatM3bRfF/AeE3VE
 bOSao6SAHkTEsyLJxLmFr5GgdfHKs3TrF4/pKwXLTz6i9Jyh1bPEN/p1WdiichjsMu5TP39q
 Yo3Cidz40w3vBfCSifW65UPClsBMGI2A5v7w+QOKLLdf1s4QD56W6+NqV/ER2CCt/4J/tokA
 1nnAhMIoLYBrSevxfq2hoBLN+q0AMcXQYMTNi0wJ1e4s0XPkq70hJrzg6AfJOF9nMQ6lKYcZ
 6BcJ62oX6QeIhyaqm91RcSs8+RfmOGD2Fvm09yNO2NkIfaNhmXhp7fZQ+cY3HJWX3rv6JBn+
 OXIO8GyacNrejmOxf3+MJqHp25dd1BH8A6udyMk+uVuRXg=
IronPort-HdrOrdr: A9a23:1tJJ1KOfIHUGj8BcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65617982"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v5 1/2] xen+tools: Report Interrupt Controller Virtualization capabilities on x86
Date: Mon, 7 Mar 2022 15:06:08 +0000
Message-ID: <20220307150609.10662-2-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220307150609.10662-1-jane.malalane@citrix.com>
References: <20220307150609.10662-1-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
and x2apic, on x86 hardware.
No such features are currently implemented on AMD hardware.

HW assisted xAPIC virtualization will be reported if HW, at the
minimum, supports virtualize_apic_accesses as this feature alone means
that an access to the APIC page will cause an APIC-access VM exit. An
APIC-access VM exit provides a VMM with information about the access
causing the VM exit, unlike a regular EPT fault, thus simplifying some
internal handling.

HW assisted x2APIC virtualization will be reported if HW supports
virtualize_x2apic_mode and, at least, either apic_reg_virt or
virtual_intr_delivery. This is due to apic_reg_virt and
virtual_intr_delivery preventing a VM exit from occuring or at least
replacing a regular EPT fault VM-exit with an APIC-access VM-exit on
read and write APIC accesses, respectively. This also means that
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
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>

v5:
* Have assisted_xapic_available solely depend on
  cpu_has_vmx_virtualize_apic_accesses and assisted_x2apic_available
  depend on cpu_has_vmx_virtualize_x2apic_mode and
  cpu_has_vmx_apic_reg_virt OR cpu_has_vmx_virtual_intr_delivery.

v4:
 * Fallback to the original v2/v1 conditions for setting
   assisted_xapic_available and assisted_x2apic_available so that in
   the future APIC virtualization can be exposed on AMD hardware
   since fine-graining of "AVIC" is not supported, i.e., AMD solely
   uses "AVIC Enable". This also means that sysctl mimics what's
   exposed in CPUID.

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
 tools/libs/light/libxl.c             |  3 +++
 tools/libs/light/libxl_arch.h        |  4 ++++
 tools/libs/light/libxl_arm.c         |  5 +++++
 tools/libs/light/libxl_types.idl     |  2 ++
 tools/libs/light/libxl_x86.c         | 11 +++++++++++
 tools/ocaml/libs/xc/xenctrl.ml       |  5 +++++
 tools/ocaml/libs/xc/xenctrl.mli      |  5 +++++
 tools/ocaml/libs/xc/xenctrl_stubs.c  | 14 +++++++++++---
 tools/xl/xl_info.c                   |  6 ++++--
 xen/arch/x86/hvm/vmx/vmcs.c          |  9 +++++++++
 xen/arch/x86/include/asm/domain.h    |  3 +++
 xen/arch/x86/sysctl.c                |  7 +++++++
 xen/include/public/sysctl.h          | 11 ++++++++++-
 16 files changed, 92 insertions(+), 6 deletions(-)

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
index 51a9b6cfac..94e6355822 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -528,6 +528,13 @@
 #define LIBXL_HAVE_MAX_GRANT_VERSION 1
 
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
index 2a42da2f7d..42ac6c357b 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -1068,6 +1068,8 @@ libxl_physinfo = Struct("physinfo", [
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
index 7503031d8f..21783d3622 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -127,6 +127,10 @@ type physinfo_cap_flag =
 	| CAP_Gnttab_v1
 	| CAP_Gnttab_v2
 
+type physinfo_arch_cap_flag =
+	| CAP_X86_ASSISTED_XAPIC
+	| CAP_X86_ASSISTED_X2APIC
+
 type physinfo =
 {
 	threads_per_core : int;
@@ -139,6 +143,7 @@ type physinfo =
 	scrub_pages      : nativeint;
 	(* XXX hw_cap *)
 	capabilities     : physinfo_cap_flag list;
+	arch_capabilities : physinfo_arch_cap_flag list;
 	max_nr_cpus      : int;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index d1d9c9247a..af6ba3d1a0 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -112,6 +112,10 @@ type physinfo_cap_flag =
   | CAP_Gnttab_v1
   | CAP_Gnttab_v2
 
+type physinfo_arch_cap_flag =
+  | CAP_X86_ASSISTED_XAPIC
+  | CAP_X86_ASSISTED_X2APIC
+
 type physinfo = {
   threads_per_core : int;
   cores_per_socket : int;
@@ -122,6 +126,7 @@ type physinfo = {
   free_pages       : nativeint;
   scrub_pages      : nativeint;
   capabilities     : physinfo_cap_flag list;
+  arch_capabilities : physinfo_arch_cap_flag list;
   max_nr_cpus      : int; (** compile-time max possible number of nr_cpus *)
 }
 type version = { major : int; minor : int; extra : string; }
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 5b4fe72c8d..e0d49b18d2 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -712,7 +712,7 @@ CAMLprim value stub_xc_send_debug_keys(value xch, value keys)
 CAMLprim value stub_xc_physinfo(value xch)
 {
 	CAMLparam1(xch);
-	CAMLlocal2(physinfo, cap_list);
+	CAMLlocal3(physinfo, cap_list, arch_cap_list);
 	xc_physinfo_t c_physinfo;
 	int r;
 
@@ -730,8 +730,15 @@ CAMLprim value stub_xc_physinfo(value xch)
 		/* ! physinfo_cap_flag CAP_ lc */
 		/* ! XEN_SYSCTL_PHYSCAP_ XEN_SYSCTL_PHYSCAP_MAX max */
 		(c_physinfo.capabilities);
+	/*
+	 * arch_capabilities: physinfo_arch_cap_flag list;
+	 */
+	arch_cap_list = c_bitmap_to_ocaml_list
+		/* ! physinfo_arch_cap_flag CAP_ none */
+		/* ! XEN_SYSCTL_PHYSCAP_ XEN_SYSCTL_PHYSCAP_X86_MAX max */
+		(c_physinfo.arch_capabilities);
 
-	physinfo = caml_alloc_tuple(10);
+	physinfo = caml_alloc_tuple(11);
 	Store_field(physinfo, 0, Val_int(c_physinfo.threads_per_core));
 	Store_field(physinfo, 1, Val_int(c_physinfo.cores_per_socket));
 	Store_field(physinfo, 2, Val_int(c_physinfo.nr_cpus));
@@ -741,7 +748,8 @@ CAMLprim value stub_xc_physinfo(value xch)
 	Store_field(physinfo, 6, caml_copy_nativeint(c_physinfo.free_pages));
 	Store_field(physinfo, 7, caml_copy_nativeint(c_physinfo.scrub_pages));
 	Store_field(physinfo, 8, cap_list);
-	Store_field(physinfo, 9, Val_int(c_physinfo.max_cpu_id + 1));
+	Store_field(physinfo, 9, arch_cap_list);
+	Store_field(physinfo, 10, Val_int(c_physinfo.max_cpu_id + 1));
 
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
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index e1e1fa14e6..06831099ed 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -343,6 +343,15 @@ static int vmx_init_vmcs_config(bool bsp)
             MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
     }
 
+    /* Check whether hardware supports accelerated xapic and x2apic. */
+    if ( bsp )
+    {
+        assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
+        assisted_x2apic_available = (cpu_has_vmx_virtualize_x2apic_mode &&
+                                     (cpu_has_vmx_apic_reg_virt ||
+                                      cpu_has_vmx_virtual_intr_delivery));
+    }
+
     /* The IA32_VMX_EPT_VPID_CAP MSR exists only when EPT or VPID available */
     if ( _vmx_secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
                                         SECONDARY_EXEC_ENABLE_VPID) )
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index e62e109598..72431df26d 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -756,6 +756,9 @@ static inline void pv_inject_sw_interrupt(unsigned int vector)
                       : is_pv_32bit_domain(d) ? PV32_VM_ASSIST_MASK \
                                               : PV64_VM_ASSIST_MASK)
 
+extern bool assisted_xapic_available;
+extern bool assisted_x2apic_available;
+
 #endif /* __ASM_DOMAIN_H__ */
 
 /*
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index f82abc2488..ad95c86aef 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -69,6 +69,9 @@ struct l3_cache_info {
     unsigned long size;
 };
 
+bool __ro_after_init assisted_xapic_available;
+bool __ro_after_init assisted_x2apic_available;
+
 static void cf_check l3_cache_get(void *arg)
 {
     struct cpuid4_info info;
@@ -135,6 +138,10 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
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
index 55252e97f2..7fe05be0c9 100644
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
+/* Max XEN_SYSCTL_PHYSCAP_X86__* constant. Used for ABI checking. */
+#define XEN_SYSCTL_PHYSCAP_X86_MAX XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC
+
 struct xen_sysctl_physinfo {
     uint32_t threads_per_core;
     uint32_t cores_per_socket;
@@ -120,6 +127,8 @@ struct xen_sysctl_physinfo {
     uint32_t max_node_id; /* Largest possible node ID on this host */
     uint32_t cpu_khz;
     uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
+    uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_X86{ARM}_??? */
+    uint32_t pad;
     uint64_aligned_t total_pages;
     uint64_aligned_t free_pages;
     uint64_aligned_t scrub_pages;
-- 
2.11.0


