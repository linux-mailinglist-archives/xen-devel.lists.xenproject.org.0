Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7527649E6F8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 17:04:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261588.453074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7Ey-0006ig-DK; Thu, 27 Jan 2022 16:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261588.453074; Thu, 27 Jan 2022 16:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7Ey-0006fs-8s; Thu, 27 Jan 2022 16:03:16 +0000
Received: by outflank-mailman (input) for mailman id 261588;
 Thu, 27 Jan 2022 16:03:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTCZ=SL=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nD7Ew-0006fm-3z
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 16:03:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f63e1f8-7f8a-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 17:03:11 +0100 (CET)
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
X-Inumbo-ID: 9f63e1f8-7f8a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643299391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KbCHfnHqA60M4H/QqqoWBexkzzJXkf0J/g9Tmuc4ELU=;
  b=Pfw3BHyNLNCB4x0cNlgMHTw6uQtohm29jmyKOnC0/3uO862N4KQW5Cbk
   RovtnP2C+DRvJeBgazFHlcdb/thFm2OU+c55XDGyFVfGZcRJuO7YPb3nX
   j35IIaj+POWQa7pYx0ZVsj30pmcEebIDE6Btl0nZ9TCAd3h4QuClsod9t
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LHiybkVR/9FUluMSi4hQ/wgHk9COdq2en+gNS3RIN5zt2JUw2WCnTi373B+gSil6DGmd8WsycK
 CbMUgF4HO5vX1FCgswujxQQVRddo7iBsEjGbOIb8mx1tWt+wECNAD/Z/YGZ7s5LHt3loFq/Vku
 hqDfo+2Pl29qImsWBMtEpFIMi3Uq4ppVPt2F5xdDRyODRxykFLWHq8CgYs6v07fabxz/zo/Z8G
 qyeqnLB6bMudLfGVaENheW4xnvJEUBq1D7A5Vo8G1CiPpAH8Nw/KMMp2ocPVY+JL5yK221p/Gf
 6fLaeYd88QH4DWUYYZXurRCE
X-SBRS: 5.2
X-MesageID: 62826978
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BPcG7qk/uNBVmkN/myREmmzo5gzyIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOWj2EPf2IYWKgfo10O9jkpEsOupGGy4A2GlZpqiFjHiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29Q32YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NBrsrKZTRZzBYPjsckgdxYDLAp9F7ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBOviOo5Zn3hkxDXQC/sOSpHfWaTao9Rf2V/cg+gQR6aEO
 ZtGOVKDajz4bgERAUU9KKsGhaT2nGOgLzFZhRGK8P9fD2/7k1UqjemF3MDuUuKNQcJZj0OJv
 FXs9m7yAgwZHNGHwD/D+XWp7sfUhj/yUo8WELy+99ZpjUeVy2hVDwcZPXOxrOOlkEe4V5RaI
 lYN5ys1haEo8QqgSdyVdx61vn+C+AIdUtx4Eusm5QXLwa3Riy6bG25CSDdCYd4nscYeRDo22
 1vPlNTsbRRtv6eSUmm17aqPoHW5Pi19BX8PY2oIQBUI5/HnoZovlVTfQ9B7Cqm3g9bpXzbqz
 FiiriIzmrEShs4jzLig8BbMhDfEjprUSg844C3HU2Tj6Rl2DKa6Y6S45F6d6uxPRLt1VXHY4
 iJCwZLHqrlTU9fdz0RhXdnhApmswfGrGTnN22VBMLAMyhCioEGIfqpPtWQWyFhSDu4IfjrgY
 Un2sAxX5YNOMHbCUZKbc75dGOxxk/G+SI2NuuT8K4MXP8MvLFPvEDRGOBbIt10BhnTAhk3W1
 X2zVc+3RUgXBq18pNZdb7dMiOR7rszSKI66eHwa8/hF+efGDJJ2Ye1cWLdrUgzfxPnZyOky2
 40HX/ZmMz0FDIXDjtPr2YASN0sWCnMwGIr7rcdaHsbafFY9Qjp5UKGMme5wE2CAo0izvr2Wl
 p1achQAoGcTeFWdcVnaApydQO2HsWlDQYITYnV3YAfAN4kLaoez9qYPH6bbjpF8nNGPOcVcF
 qFfE+3ZW6wnYm2ep1w1MMehxKQ/KkXDrV/ebkKNPWlkF7Y9FlOhxzMRVla1nAEUEDGNvNczy
 5X5kFuzrWwrHVoyVa47qZuHkjuMgJTqsLsiBhSTeogKJhyEHUoDA3WZs8Lb6vokcX3rrgZ2H
 S7LafvBjeWS8YIz7vfTgqWI89WgH+dkRxIIFGjH97emcyLd+zP7k4NHVe+JexHbVX/1p/r+N
 bkEkamkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC94ACa7WEMc/oCnALIw8hYrjR3P0YgGCKv/80PF/79Gl8+7/eCRdeOByFiSp8KrppMdx6n
 bd96ZBOswHm00gkKNeLiCxQ5l+gFH1YXvV1rIweDa/qlhEvlgNIb6vDB3Kk+5qIcdhNbBUne
 2fGmKrYir1A7UPeaH5vR2PV1O9QiJlS6hBHyFgOewaAltbf36Jl2RRQ9XI8TxhPzwUB2OV2Y
 zA5O0pwLKSI3jFpmMkcADz8R1AfXEWUqh7r1l8EtGzFVE35BGXCIVo0NfuJ4E1EoXlXeSJW/
 e3AxWvoOdowkBodAsfmtZZZlsHe
IronPort-HdrOrdr: A9a23:UemA4Kv+Zcxsgti78EoITn4k7skDeNV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.88,321,1635220800"; 
   d="scan'208";a="62826978"
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
Subject: [PATCH 1/2] xen+tools: Report Interrupt Controller Virtualization capabilities on x86
Date: Thu, 27 Jan 2022 16:01:32 +0000
Message-ID: <20220127160133.11608-2-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220127160133.11608-1-jane.malalane@citrix.com>
References: <20220127160133.11608-1-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
and x2apic, on x86 hardware.
No such features are currently implemented on AMD hardware.

For that purpose, also add an arch-specific "capabilities" parameter
to struct xen_sysctl_physinfo.

Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
---
 tools/golang/xenlight/helpers.gen.go |  4 ++++
 tools/golang/xenlight/types.gen.go   |  6 ++++++
 tools/include/libxl.h                | 14 ++++++++++++++
 tools/libs/light/libxl.c             |  3 +++
 tools/libs/light/libxl_arch.h        |  4 ++++
 tools/libs/light/libxl_arm.c         |  4 ++++
 tools/libs/light/libxl_types.idl     |  2 ++
 tools/libs/light/libxl_x86.c         | 11 +++++++++++
 tools/ocaml/libs/xc/xenctrl.ml       |  5 +++++
 tools/ocaml/libs/xc/xenctrl.mli      |  5 +++++
 tools/xl/xl_info.c                   |  6 ++++--
 xen/arch/x86/hvm/vmx/vmcs.c          |  6 ++++++
 xen/arch/x86/include/asm/domain.h    |  4 ++++
 xen/arch/x86/sysctl.c                |  7 +++++++
 xen/include/public/arch-x86/xen.h    |  4 ++++
 xen/include/public/sysctl.h          |  1 +
 16 files changed, 84 insertions(+), 2 deletions(-)

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
index b1e84d5258..5f384b767c 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -389,6 +389,10 @@ RunHotplugScripts Defbool
 DriverDomain Defbool
 Passthrough Passthrough
 XendSuspendEvtchnCompat Defbool
+ArchX86 struct {
+AssistedXapic Defbool
+AssistedX2Apic Defbool
+}
 }
 
 type DomainRestoreParams struct {
@@ -1014,6 +1018,8 @@ CapVmtrace bool
 CapVpmu bool
 CapGnttabV1 bool
 CapGnttabV2 bool
+CapAssistedXApic bool
+CapAssistedX2apic bool
 }
 
 type Connectorinfo struct {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2bbbd21f0b..6d51e56704 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -528,6 +528,20 @@
 #define LIBXL_HAVE_MAX_GRANT_VERSION 1
 
 /*
+ * LIBXL_HAVE_PHYSINFO_ASSISTED_XAPIC indicates that libxl_physinfo has a
+ * cap_assisted_xapic field, which indicates the availability of xAPIC
+ * hardware assisted emulation.
+ */
+#define LIBXL_HAVE_PHYSINFO_ASSISTED_XAPIC 1
+
+/*
+ * LIBXL_HAVE_PHYSINFO_ASSISTED_X2APIC indicates that libxl_physinfo has a
+ * cap_assisted_x2apic field, which indicates the availability of x2APIC
+ * hardware assisted emulation.
+ */
+#define LIBXL_HAVE_PHYSINFO_ASSISTED_X2APIC 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index 667ae6409b..1588701d19 100644
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
 
+    libxl__arch_get_physinfo(physinfo, xcphysinfo);
+
     GC_FREE;
     return 0;
 }
diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index 1522ecb97f..00cc50394d 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -86,6 +86,10 @@ int libxl__arch_extra_memory(libxl__gc *gc,
                              uint64_t *out);
 
 _hidden
+void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
+                              xc_physinfo_t xcphysinfo);
+
+_hidden
 void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src);
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index eef1de0939..52f2545498 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1431,6 +1431,10 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
+void libxl__arch_get_physinfo(libxl_physinfo *physinfo, xc_physinfo_t xcphysinfo)
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
index 1feadebb18..33da51fe89 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -866,6 +866,17 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
+void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
+                              xc_physinfo_t xcphysinfo)
+{
+    physinfo->cap_assisted_xapic =
+        !!(xcphysinfo.arch_capabilities &
+           XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_XAPIC);
+    physinfo->cap_assisted_x2apic =
+        !!(xcphysinfo.arch_capabilities &
+           XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_X2APIC);
+}
+
 void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src)
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 7503031d8f..7ce832d605 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -127,6 +127,10 @@ type physinfo_cap_flag =
 	| CAP_Gnttab_v1
 	| CAP_Gnttab_v2
 
+type physinfo_cap_arch_flag =
+	| CAP_ARCH_ASSISTED_XAPIC
+	| CAP_ARCH_ASSISTED_X2APIC
+
 type physinfo =
 {
 	threads_per_core : int;
@@ -139,6 +143,7 @@ type physinfo =
 	scrub_pages      : nativeint;
 	(* XXX hw_cap *)
 	capabilities     : physinfo_cap_flag list;
+	arch_capabilities : physinfo_cap_arch_flag list;
 	max_nr_cpus      : int;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index d1d9c9247a..a2b15130ee 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -112,6 +112,10 @@ type physinfo_cap_flag =
   | CAP_Gnttab_v1
   | CAP_Gnttab_v2
 
+type physinfo_cap_arch_flag =
+  | CAP_ARCH_ASSISTED_XAPIC
+  | CAP_ARCH_ASSISTED_X2APIC
+
 type physinfo = {
   threads_per_core : int;
   cores_per_socket : int;
@@ -122,6 +126,7 @@ type physinfo = {
   free_pages       : nativeint;
   scrub_pages      : nativeint;
   capabilities     : physinfo_cap_flag list;
+  arch_capabilities : physinfo_cap_arch_flag list;
   max_nr_cpus      : int; (** compile-time max possible number of nr_cpus *)
 }
 type version = { major : int; minor : int; extra : string; }
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
index 7ab15e07a0..7691db0fdd 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -343,6 +343,12 @@ static int vmx_init_vmcs_config(bool bsp)
             MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
     }
 
+    /* Check whether hardware supports accelerated xapic and x2apic. */
+    assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
+    assisted_x2apic_available = cpu_has_vmx_virtualize_x2apic_mode &&
+                                cpu_has_vmx_apic_reg_virt &&
+                                cpu_has_vmx_virtual_intr_delivery;
+
     /* The IA32_VMX_EPT_VPID_CAP MSR exists only when EPT or VPID available */
     if ( _vmx_secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
                                         SECONDARY_EXEC_ENABLE_VPID) )
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index e62e109598..d6602795b4 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -756,6 +756,10 @@ static inline void pv_inject_sw_interrupt(unsigned int vector)
                       : is_pv_32bit_domain(d) ? PV32_VM_ASSIST_MASK \
                                               : PV64_VM_ASSIST_MASK)
 
+extern bool assisted_xapic_available;
+
+extern bool assisted_x2apic_available;
+
 #endif /* __ASM_DOMAIN_H__ */
 
 /*
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index aff52a13f3..d0acf1f584 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -69,6 +69,9 @@ struct l3_cache_info {
     unsigned long size;
 };
 
+bool __read_mostly assisted_xapic_available;
+bool __read_mostly assisted_x2apic_available;
+
 static void l3_cache_get(void *arg)
 {
     struct cpuid4_info info;
@@ -135,6 +138,10 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_hap;
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
+    if ( assisted_xapic_available )
+        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_XAPIC;
+    if ( assisted_x2apic_available )
+        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_X2APIC;
 }
 
 long arch_do_sysctl(
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index 7acd94c8eb..f7b17e0f98 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -326,6 +326,10 @@ struct xen_arch_domainconfig {
 
 /* GPE0 bit set during CPU hotplug */
 #define XEN_ACPI_GPE0_CPUHP_BIT      2
+
+#define XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_XAPIC  (1u << 0)
+#define XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_X2APIC (1u << 1)
+
 #endif
 
 /*
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 55252e97f2..16bdcab853 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -120,6 +120,7 @@ struct xen_sysctl_physinfo {
     uint32_t max_node_id; /* Largest possible node ID on this host */
     uint32_t cpu_khz;
     uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
+    uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_ARCH_ */
     uint64_aligned_t total_pages;
     uint64_aligned_t free_pages;
     uint64_aligned_t scrub_pages;
-- 
2.11.0


