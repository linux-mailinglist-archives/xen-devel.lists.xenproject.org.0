Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D23844015A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 19:39:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218608.379130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgVq2-0007ba-87; Fri, 29 Oct 2021 17:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218608.379130; Fri, 29 Oct 2021 17:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgVq2-0007Ye-57; Fri, 29 Oct 2021 17:38:46 +0000
Received: by outflank-mailman (input) for mailman id 218608;
 Fri, 29 Oct 2021 17:38:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3mb=PR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mgVq1-0007YL-1h
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 17:38:45 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 560e8e6d-cbc0-4997-9aa0-5f43e99506a1;
 Fri, 29 Oct 2021 17:38:43 +0000 (UTC)
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
X-Inumbo-ID: 560e8e6d-cbc0-4997-9aa0-5f43e99506a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635529123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jFlSvSoQXHYlF/J2XH+U0cwgBpmb5I4sZztqFOa4CiA=;
  b=iZ0B98LGaWPbfmhZ+rTLy3jQm6iWX7+IKuGHQnFjLfdkb3E3zYP8zvZJ
   KVyuTUAGIX2r5YxvK/S4Dxs+GqLHxOoTUCdZ4ExDUuJG7Jdx8+bD5DrgI
   IKCxOUA9i2RN3DkI2kVbBAHiW6f7a9U6Vh0NiWCy1cu23Ew0btWHLnkKb
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xWwwCLD4g4P0l1g4+8F8+NU98v8gunFd/joSk8S0cKcxzyMPbV5N5jyuOqdPx7v/H2U6mXK2JD
 D9xSfgK+2TqZQoa3RCdSiVMeGAsPUoD3hZhy1+eT9788UuPQr4qmZTewAQyZFrSiPRDR21EMbe
 F9ZmSFgC52MFQbl0tz9tObT5vqObBI2+pCuDsgVRCpPpydd3+a+dRy8Tb9ES4B7to33KzdWDcs
 C2+3whd/Hc+jnLubX46+gb83dRvhlVD62Wq38l2qafA44rvwJ9hpyx37V9g3SmCW2fBSXCViPL
 JaV41aC35wXdHIP90nzQsLSV
X-SBRS: 5.1
X-MesageID: 56651988
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QFcxyq59/IOlZxjHISPLLgxRtLXAchMFZxGqfqrLsTDasY5as4F+v
 mZLDWzQPPiJMDH9L9lzaYy0/BwDupPTxtRlHQdkrCkyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdh2N8w27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zy
 vhTpcWPeDwVb+79iN4SfhlDK35bBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTQ6iDP
 ptJOVKDajz7YjlBI0UuUqkXxr6wgELbdC8ArXSa8P9fD2/7k1UqjemF3MDuUseRWcxfk0Kcp
 2TH12f0GBcXMJqY0zXt2m2orv/Cm2X8Qo16PL+l8v9nhnWDy2pVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslh8DWfJAHusi8gaPx6HIpQGDCQAsbBRMddgnv88eXiEx2
 xmCmNaBONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZQko/cm6n7AIskOMf8ZZH4O1leWqPAill
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn6tl0hNeZJc6TtsAKBta8Rc+51W3HY5
 CBc8/Vy+tziGn1keMale+4KAK2yr8iMNDnRkDaD9LFwqmzzpRZPkW1WiQySxXuF0O5YJlcFg
 2eJ4Gu9AaO/2lPwMMebhKrqUqwXIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8zGLZryUCtKUPw9pNZTewv7+eV2rszZ7TiKLa0XMjz9iebODJJrYe5dWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDjtr/quYuwaQxBSFjX/je8pUPHsbae1YOMDxxWpf5nOJ6E6Q4zvs9qws91
 izkMqOu4AGk3iOvxMTjQi0LVY4Dqr4m9i9mZnNwZQ7ANrpKSd/H0ZrzvqAfJdEPnNGPB9YtJ
 xXcU8nfUPlJVBrd/DERMcv0oIB4LUz5jgOSJSu1JjM4esc4FQDO/9bleCrp9TUPUXXr5Zdv/
 eX421OJW4cHSiRjEN3SNKClwWSusCVPg+l1RUbJfIVeIR2+7IhwJiXtpfYrOMVQew7bzz6X2
 l/OUxcVrOXAuaEv99zNifzWpoulCbImTEFbA3Pa/fC9MiyDpjivxopJUeCpezHBVTyrpPX+N
 LsNl/ylaa8JhldHtYZ4Ao1H96Nm6ou9vaJewyRlAG7PMwahBIR/LyTUxsJIrKBMmONU4FPkR
 kKV99BGEryVI8e5QkUJLQ8oY+nfh/EZnj7esaY8LEngvXIl+bOGVQNZPgWWiTwbJ7xwadt3z
 eAksc8Qygq+lht1bYrW0nEKrzyBfi4aTqEqlpAGG4u62AMkx2ZLbYHYFiKrsoqEbM9BMxVyL
 zKZ7EYYa2+wGqYWn6IPKEXw
IronPort-HdrOrdr: A9a23:fADSG6AlDFmXxhrlHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.87,193,1631592000"; 
   d="scan'208";a="56651988"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>
Subject: [PATCH for-4.16 2/2] xen: Report grant table v1/v2 capabilities to the toolstack
Date: Fri, 29 Oct 2021 18:38:13 +0100
Message-ID: <20211029173813.23002-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
References: <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In order to let the toolstack be able to set the gnttab version on a
per-domain basis, it needs to know which ABIs Xen supports.  Introduce
XEN_SYSCTL_PHYSCAP_gnttab_v{1,2} for the purpose, and plumb in down into
userspace.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Edwin Török <edvin.torok@citrix.com>

For 4.16.  This is useful information:

  xl info virt_caps | grep -q gnttab-v2

is far more coherent for the admin than having to root around in the Xen build
time configuraiton, or command line settings.

Furthermore, it is information necessary for the toolstack to be able to
choose the gnttab version on a per-domain basis (a feature under consideration
for 4.16).

Risks are largely at build time, but adding new PHYSCAPs is formulaic.  In
this case, just using 2 bits in an already existing hypercall.  golang was
generated automatically, while Ocaml has build time ABI checks issues.
---
 tools/golang/xenlight/helpers.gen.go | 4 ++++
 tools/golang/xenlight/types.gen.go   | 2 ++
 tools/include/libxl.h                | 6 ++++++
 tools/libs/light/libxl.c             | 4 ++++
 tools/libs/light/libxl_types.idl     | 2 ++
 tools/ocaml/libs/xc/xenctrl.ml       | 2 ++
 tools/ocaml/libs/xc/xenctrl.mli      | 2 ++
 tools/xl/xl_info.c                   | 6 ++++--
 xen/common/grant_table.c             | 2 +-
 xen/common/sysctl.c                  | 6 ++++++
 xen/include/public/sysctl.h          | 6 +++++-
 xen/include/xen/grant_table.h        | 2 ++
 12 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index c010f2d3a47f..afa44a857a6c 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -3369,6 +3369,8 @@ x.CapShadow = bool(xc.cap_shadow)
 x.CapIommuHapPtShare = bool(xc.cap_iommu_hap_pt_share)
 x.CapVmtrace = bool(xc.cap_vmtrace)
 x.CapVpmu = bool(xc.cap_vpmu)
+x.CapGnttabV1 = bool(xc.cap_gnttab_v1)
+x.CapGnttabV2 = bool(xc.cap_gnttab_v2)
 
  return nil}
 
@@ -3401,6 +3403,8 @@ xc.cap_shadow = C.bool(x.CapShadow)
 xc.cap_iommu_hap_pt_share = C.bool(x.CapIommuHapPtShare)
 xc.cap_vmtrace = C.bool(x.CapVmtrace)
 xc.cap_vpmu = C.bool(x.CapVpmu)
+xc.cap_gnttab_v1 = C.bool(x.CapGnttabV1)
+xc.cap_gnttab_v2 = C.bool(x.CapGnttabV2)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 8c8c481b86f6..31b5af0777d5 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -1011,6 +1011,8 @@ CapShadow bool
 CapIommuHapPtShare bool
 CapVmtrace bool
 CapVpmu bool
+CapGnttabV1 bool
+CapGnttabV2 bool
 }
 
 type Connectorinfo struct {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2e8679dbcb21..54c10f6efe23 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -515,6 +515,12 @@
 #define LIBXL_HAVE_VPMU 1
 
 /*
+ * LIBXL_HAVE_PHYSINFO_CAP_GNTTAB indicates that libxl_physinfo has a
+ * cap_gnttab_v1/2 fields, which indicates the available grant table ABIs.
+ */
+#define LIBXL_HAVE_PHYSINFO_CAP_GNTTAB 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index a032723fdecb..a77aa856fdd6 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -405,6 +405,10 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
     physinfo->cap_vmtrace =
         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_vmtrace);
     physinfo->cap_vpmu = !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_vpmu);
+    physinfo->cap_gnttab_v1 =
+        !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_gnttab_v1);
+    physinfo->cap_gnttab_v2 =
+        !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_gnttab_v2);
 
     GC_FREE;
     return 0;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 608d55a4568d..573bba68ee3a 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -1065,6 +1065,8 @@ libxl_physinfo = Struct("physinfo", [
     ("cap_iommu_hap_pt_share", bool),
     ("cap_vmtrace", bool),
     ("cap_vpmu", bool),
+    ("cap_gnttab_v1", bool),
+    ("cap_gnttab_v2", bool),
     ], dir=DIR_OUT)
 
 libxl_connectorinfo = Struct("connectorinfo", [
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index addcf4cc593d..ed2924a2b34a 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -123,6 +123,8 @@ type physinfo_cap_flag =
 	| CAP_IOMMU_HAP_PT_SHARE
 	| CAP_Vmtrace
 	| CAP_Vpmu
+	| CAP_Gnttab_v1
+	| CAP_Gnttab_v2
 
 type physinfo =
 {
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 0a5ce529e951..d20dc0108dce 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -108,6 +108,8 @@ type physinfo_cap_flag =
   | CAP_IOMMU_HAP_PT_SHARE
   | CAP_Vmtrace
   | CAP_Vpmu
+  | CAP_Gnttab_v1
+  | CAP_Gnttab_v2
 
 type physinfo = {
   threads_per_core : int;
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 2c86b317b702..712b7638b013 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -210,7 +210,7 @@ static void output_physinfo(void)
          info.hw_cap[4], info.hw_cap[5], info.hw_cap[6], info.hw_cap[7]
         );
 
-    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s\n",
+    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s\n",
          info.cap_pv ? " pv" : "",
          info.cap_hvm ? " hvm" : "",
          info.cap_hvm && info.cap_hvm_directio ? " hvm_directio" : "",
@@ -219,7 +219,9 @@ static void output_physinfo(void)
          info.cap_shadow ? " shadow" : "",
          info.cap_iommu_hap_pt_share ? " iommu_hap_pt_share" : "",
          info.cap_vmtrace ? " vmtrace" : "",
-         info.cap_vpmu ? " vpmu" : ""
+         info.cap_vpmu ? " vpmu" : "",
+         info.cap_gnttab_v1 ? " gnttab-v1" : "",
+         info.cap_gnttab_v2 ? " gnttab-v2" : ""
         );
 
     vinfo = libxl_get_version_info(ctx);
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index e510395d088e..a20319b22abc 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -178,7 +178,7 @@ static int parse_gnttab_max_maptrack_frames(const char *arg)
 #define GNTTAB_MAX_VERSION 2
 #endif
 
-static unsigned int __read_mostly opt_gnttab_max_version = GNTTAB_MAX_VERSION;
+unsigned int __read_mostly opt_gnttab_max_version = GNTTAB_MAX_VERSION;
 static bool __read_mostly opt_transitive_grants = true;
 
 static int __init parse_gnttab(const char *s)
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index f2dab722b683..1ad3c29351db 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -12,6 +12,7 @@
 #include <xen/sched.h>
 #include <xen/domain.h>
 #include <xen/event.h>
+#include <xen/grant_table.h>
 #include <xen/domain_page.h>
 #include <xen/trace.h>
 #include <xen/console.h>
@@ -283,6 +284,11 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         if ( vpmu_is_available )
             pi->capabilities |= XEN_SYSCTL_PHYSCAP_vpmu;
 
+        if ( opt_gnttab_max_version >= 1 )
+            pi->capabilities |= XEN_SYSCTL_PHYSCAP_gnttab_v1;
+        if ( opt_gnttab_max_version >= 2 )
+            pi->capabilities |= XEN_SYSCTL_PHYSCAP_gnttab_v2;
+
         if ( copy_to_guest(u_sysctl, op, 1) )
             ret = -EFAULT;
     }
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 3e53681b4368..55252e97f230 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -104,8 +104,12 @@ struct xen_sysctl_tbuf_op {
 /* The platform supports vPMU. */
 #define XEN_SYSCTL_PHYSCAP_vpmu          (1u << 7)
 
+/* Xen supports the Grant v1 and/or v2 ABIs. */
+#define XEN_SYSCTL_PHYSCAP_gnttab_v1     (1u << 8)
+#define XEN_SYSCTL_PHYSCAP_gnttab_v2     (1u << 9)
+
 /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
-#define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_vpmu
+#define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
 
 struct xen_sysctl_physinfo {
     uint32_t threads_per_core;
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 41713e2726e9..9ee830cfd0ab 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -32,6 +32,7 @@ struct grant_table;
 
 #ifdef CONFIG_GRANT_TABLE
 
+extern unsigned int opt_gnttab_max_version;
 extern unsigned int opt_max_grant_frames;
 
 /* Create/destroy per-domain grant table context. */
@@ -63,6 +64,7 @@ int gnttab_acquire_resource(
 
 #else
 
+#define opt_gnttab_max_version 0
 #define opt_max_grant_frames 0
 
 static inline int grant_table_init(struct domain *d,
-- 
2.11.0


