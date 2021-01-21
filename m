Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F30142FF733
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 22:28:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72428.130452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUi-0005LM-0B; Thu, 21 Jan 2021 21:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72428.130452; Thu, 21 Jan 2021 21:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUh-0005K7-On; Thu, 21 Jan 2021 21:27:55 +0000
Received: by outflank-mailman (input) for mailman id 72428;
 Thu, 21 Jan 2021 21:27:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOiS=GY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2hUg-0004xj-Da
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 21:27:54 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 984b4494-49c2-40d8-8eae-e5d0fa3ebcc4;
 Thu, 21 Jan 2021 21:27:40 +0000 (UTC)
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
X-Inumbo-ID: 984b4494-49c2-40d8-8eae-e5d0fa3ebcc4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611264460;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DUfVqLjeYl5aZeWE9Zcryu0zAb2yVRHiyW3ZELnMKNk=;
  b=dKkCllxBpb+H+Ku29A+OknXip0bIWGIRCI3WOg0U4mHJB25MJmhsWdRV
   MbJIWcZk+NT8yaSc97AXZ+l2eglaMnlcZOOPKgxNZo5NhKPx9FmMg9+Ea
   xPwbeqVgW8D2d507b/KTbmu5VtpWx4AdEpCUyz9EMzXSX2HG/NGili00n
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: y4ySfdYP34dqIynXJrVxHMLo1FMFKJypHttOqgSJkAZCR0/Nlf183JlInpPczur3oiOfygKG9F
 fEqVI3EBLqQ11Gl2CvMfN/id32xax8Zphx/AzutyQ2spBhHA5+KyFrslpyvpfh0fj1C5s5w7yA
 +3b3nCM7sLpkglZVVFX5STZlImpH+acbW+aCMoxvcP5MSGM2fC1k3apZCMhn+p5mJ7uXCov9fk
 GoR++NTeulvtJI8C6LfaDfnXV+rYQbmOKCRObhJXsRoQRYfFhjDD1ojdB3WePy1W3dyiqPH+IO
 OZE=
X-SBRS: 5.1
X-MesageID: 35977343
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,365,1602561600"; 
   d="scan'208";a="35977343"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?=
	<michal.leszczynski@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v7 01/10] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vmtrace
Date: Thu, 21 Jan 2021 21:27:09 +0000
Message-ID: <20210121212718.2441-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210121212718.2441-1-andrew.cooper3@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We're about to introduce support for Intel Processor Trace, but similar
functionality exists in other platforms.

Aspects of vmtrace can reasonably can be common, so start with
XEN_SYSCTL_PHYSCAP_vmtrace and plumb the signal from Xen all the way down into
`xl info`.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v7:
 * New
---
 tools/golang/xenlight/helpers.gen.go | 2 ++
 tools/golang/xenlight/types.gen.go   | 1 +
 tools/include/libxl.h                | 7 +++++++
 tools/libs/light/libxl.c             | 2 ++
 tools/libs/light/libxl_types.idl     | 1 +
 tools/xl/xl_info.c                   | 5 +++--
 xen/common/domain.c                  | 2 ++
 xen/common/sysctl.c                  | 2 ++
 xen/include/public/sysctl.h          | 1 +
 xen/include/xen/domain.h             | 2 ++
 10 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index c8605994e7..62fb98ba30 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -3345,6 +3345,7 @@ x.CapHvmDirectio = bool(xc.cap_hvm_directio)
 x.CapHap = bool(xc.cap_hap)
 x.CapShadow = bool(xc.cap_shadow)
 x.CapIommuHapPtShare = bool(xc.cap_iommu_hap_pt_share)
+x.CapVmtrace = bool(xc.cap_vmtrace)
 
  return nil}
 
@@ -3375,6 +3376,7 @@ xc.cap_hvm_directio = C.bool(x.CapHvmDirectio)
 xc.cap_hap = C.bool(x.CapHap)
 xc.cap_shadow = C.bool(x.CapShadow)
 xc.cap_iommu_hap_pt_share = C.bool(x.CapIommuHapPtShare)
+xc.cap_vmtrace = C.bool(x.CapVmtrace)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index b4c5df0f2c..369da6dd1e 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -998,6 +998,7 @@ CapHvmDirectio bool
 CapHap bool
 CapShadow bool
 CapIommuHapPtShare bool
+CapVmtrace bool
 }
 
 type Connectorinfo struct {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 3433c950f9..c4d920f1e5 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -464,6 +464,13 @@
 #define LIBXL_HAVE_DEVICE_PCI_ASSIGNABLE_LIST_FREE 1
 
 /*
+ * LIBXL_HAVE_PHYSINFO_CAP_VMTRACE indicates that libxl_physinfo has a
+ * cap_vmtrace field, which indicates the availability of platform tracing
+ * functionality.
+ */
+#define LIBXL_HAVE_PHYSINFO_CAP_VMTRACE 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index d2a87157a2..204eb0be2d 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -402,6 +402,8 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_shadow);
     physinfo->cap_iommu_hap_pt_share =
         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share);
+    physinfo->cap_vmtrace =
+        !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_vmtrace);
 
     GC_FREE;
     return 0;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 05324736b7..b43d5f1265 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -1050,6 +1050,7 @@ libxl_physinfo = Struct("physinfo", [
     ("cap_hap", bool),
     ("cap_shadow", bool),
     ("cap_iommu_hap_pt_share", bool),
+    ("cap_vmtrace", bool),
     ], dir=DIR_OUT)
 
 libxl_connectorinfo = Struct("connectorinfo", [
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index ca417df8e8..8383e4a6df 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -210,14 +210,15 @@ static void output_physinfo(void)
          info.hw_cap[4], info.hw_cap[5], info.hw_cap[6], info.hw_cap[7]
         );
 
-    maybe_printf("virt_caps              :%s%s%s%s%s%s%s\n",
+    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s\n",
          info.cap_pv ? " pv" : "",
          info.cap_hvm ? " hvm" : "",
          info.cap_hvm && info.cap_hvm_directio ? " hvm_directio" : "",
          info.cap_pv && info.cap_hvm_directio ? " pv_directio" : "",
          info.cap_hap ? " hap" : "",
          info.cap_shadow ? " shadow" : "",
-         info.cap_iommu_hap_pt_share ? " iommu_hap_pt_share" : ""
+         info.cap_iommu_hap_pt_share ? " iommu_hap_pt_share" : "",
+         info.cap_vmtrace ? " vmtrace" : ""
         );
 
     vinfo = libxl_get_version_info(ctx);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 2b461655c3..d1e94d88cf 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -82,6 +82,8 @@ struct vcpu *idle_vcpu[NR_CPUS] __read_mostly;
 
 vcpu_info_t dummy_vcpu_info;
 
+bool __read_mostly vmtrace_available;
+
 static void __domain_finalise_shutdown(struct domain *d)
 {
     struct vcpu *v;
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index ec916424e5..3558641cd9 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -277,6 +277,8 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
             if ( iommu_hap_pt_share )
                 pi->capabilities |= XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share;
         }
+        if ( vmtrace_available )
+            pi->capabilities |= XEN_SYSCTL_PHYSCAP_vmtrace;
 
         if ( copy_to_guest(u_sysctl, op, 1) )
             ret = -EFAULT;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index a073647117..d4453d2eab 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -100,6 +100,7 @@ struct xen_sysctl_tbuf_op {
 #define _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share 5
 #define XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share  \
     (1u << _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share)
+#define XEN_SYSCTL_PHYSCAP_vmtrace       (1 << 6)
 
 /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
 #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index cde0d9c7fe..1708c36964 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -131,4 +131,6 @@ void vnuma_destroy(struct vnuma_info *vnuma);
 static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }
 #endif
 
+extern bool vmtrace_available;
+
 #endif /* __XEN_DOMAIN_H__ */
-- 
2.11.0


