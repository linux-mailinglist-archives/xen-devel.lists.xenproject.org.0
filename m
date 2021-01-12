Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2382F26F1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 05:18:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65466.115992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzB80-00061L-HR; Tue, 12 Jan 2021 04:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65466.115992; Tue, 12 Jan 2021 04:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzB80-00060w-Dw; Tue, 12 Jan 2021 04:17:56 +0000
Received: by outflank-mailman (input) for mailman id 65466;
 Tue, 12 Jan 2021 04:17:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPAB=GP=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kzB7z-00060r-By
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 04:17:55 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 481c3e61-bb27-479a-a0ed-24674c65fff9;
 Tue, 12 Jan 2021 04:17:53 +0000 (UTC)
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
X-Inumbo-ID: 481c3e61-bb27-479a-a0ed-24674c65fff9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610425073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=E4vcRqGLZxmNei2A6V4OkvPIrghH0yY+J4MwHSgiLlc=;
  b=M6KicNHCMDBLByNjiV1JQAvZhfcOFgYKNpnbmVHYjtSLd7dRYcvsrp2r
   j1moHGRE7xlL41Jt1SSDPS58jWCsQu7rw/7QTSZJbC9otUX6bTppvikJT
   vfVlemRZvKyNU40T4DhSMrRwo+w9AP1xsApVEkhfavBKowaOLdzeNCsgb
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GXGFgKzyC1H9wbrWn+bvRYR1nWQCy4t8ZJ521wLBKDsifG0YYQhbVxRZJLWB82XWNnlcdGs5dL
 XgXtFFk8qyXWFlQSRmLJm4MCBzyxEf74yTMJXqCKZAMJcTmQe1v64NUMOxPQCog1x1JvP6Oxrr
 z2OSVIYbotB8EZ0i/WPLdu232B6Q9Xtmk2zca8x6RvmLAO5E0URgPr7IhMAnkmqP/2vUwsiVGO
 qmagfvAlzJK15JrH3CzOtwHIVNqjm/u/3fmsAOaokgCgvx8N3fRMYa9TSTifl8028IH9B9F3bK
 g1A=
X-SBRS: 5.2
X-MesageID: 35099490
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,340,1602561600"; 
   d="scan'208";a="35099490"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <iwj@xenproject.org>, <wl@xen.org>, <andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>, <jbeulich@suse.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <anthony.perard@citrix.com>, <paul@xen.org>,
	<roger.pau@citrix.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH v2 2/2] viridian: allow vCPU hotplug for Windows VMs
Date: Tue, 12 Jan 2021 04:17:28 +0000
Message-ID: <1610425048-990-2-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610425048-990-1-git-send-email-igor.druzhinin@citrix.com>
References: <1610425048-990-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

If Viridian extensions are enabled, Windows wouldn't currently allow
a hotplugged vCPU to be brought up dynamically. We need to expose a special
bit to let the guest know we allow it. Hide it behind an option to stay
on the safe side regarding compatibility with existing guests but
nevertheless set the option on by default.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
Changes on v2:
- hide the bit under an option and expose it in libxl
---
 docs/man/xl.cfg.5.pod.in             | 7 ++++++-
 tools/include/libxl.h                | 6 ++++++
 tools/libs/light/libxl_types.idl     | 1 +
 tools/libs/light/libxl_x86.c         | 4 ++++
 xen/arch/x86/hvm/viridian/viridian.c | 5 ++++-
 xen/include/public/hvm/params.h      | 7 ++++++-
 6 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 3467eae..7cdb859 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2267,11 +2267,16 @@ explicitly have any limits on the number of Virtual processors a guest
 is allowed to bring up. It is strongly recommended to keep this enabled
 for guests with more than 64 vCPUs.
 
+=item B<cpu_hotplug>
+
+This set enables dynamic changes to Virtual processor states in Windows
+guests effectively allowing vCPU hotplug.
+
 =item B<defaults>
 
 This is a special value that enables the default set of groups, which
 is currently the B<base>, B<freq>, B<time_ref_count>, B<apic_assist>,
-B<crash_ctl>, B<stimer> and B<no_vp_limit> groups.
+B<crash_ctl>, B<stimer>, B<no_vp_limit> and B<cpu_hotplug> groups.
 
 =item B<all>
 
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index be1e288..7c7c541 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -458,6 +458,12 @@
 #define LIBXL_HAVE_VIRIDIAN_NO_VP_LIMIT 1
 
 /*
+ * LIBXL_HAVE_VIRIDIAN_CPU_HOTPLUG indicates that the 'cpu_hotplug' value
+ * is present in the viridian enlightenment enumeration.
+ */
+#define LIBXL_HAVE_VIRIDIAN_CPU_HOTPLUG 1
+
+/*
  * LIBXL_HAVE_DEVICE_PCI_LIST_FREE indicates that the
  * libxl_device_pci_list_free() function is defined.
  */
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 8502b29..00a8e68 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -240,6 +240,7 @@ libxl_viridian_enlightenment = Enumeration("viridian_enlightenment", [
     (9, "hcall_ipi"),
     (10, "ex_processor_masks"),
     (11, "no_vp_limit"),
+    (12, "cpu_hotplug"),
     ])
 
 libxl_hdtype = Enumeration("hdtype", [
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 5c4c194..91a9fc7 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -310,6 +310,7 @@ static int hvm_set_viridian_features(libxl__gc *gc, uint32_t domid,
         libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_APIC_ASSIST);
         libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CRASH_CTL);
         libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_NO_VP_LIMIT);
+        libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CPU_HOTPLUG);
     }
 
     libxl_for_each_set_bit(v, info->u.hvm.viridian_enable) {
@@ -373,6 +374,9 @@ static int hvm_set_viridian_features(libxl__gc *gc, uint32_t domid,
     if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_NO_VP_LIMIT))
         mask |= HVMPV_no_vp_limit;
 
+    if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CPU_HOTPLUG))
+        mask |= HVMPV_cpu_hotplug;
+
     if (mask != 0 &&
         xc_hvm_param_set(CTX->xch,
                          domid,
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index ae1ea86..b906f7b 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -76,6 +76,7 @@ typedef union _HV_CRASH_CTL_REG_CONTENTS
 } HV_CRASH_CTL_REG_CONTENTS;
 
 /* Viridian CPUID leaf 3, Hypervisor Feature Indication */
+#define CPUID3D_CPU_DYNAMIC_PARTITIONING (1 << 3)
 #define CPUID3D_CRASH_MSRS (1 << 10)
 #define CPUID3D_SINT_POLLING (1 << 17)
 
@@ -179,8 +180,10 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
         res->a = u.lo;
         res->b = u.hi;
 
+        if ( viridian_feature_mask(d) & HVMPV_cpu_hotplug )
+           res->d = CPUID3D_CPU_DYNAMIC_PARTITIONING;
         if ( viridian_feature_mask(d) & HVMPV_crash_ctl )
-            res->d = CPUID3D_CRASH_MSRS;
+            res->d |= CPUID3D_CRASH_MSRS;
         if ( viridian_feature_mask(d) & HVMPV_synic )
             res->d |= CPUID3D_SINT_POLLING;
 
diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
index 805f4ca..c9d6e70 100644
--- a/xen/include/public/hvm/params.h
+++ b/xen/include/public/hvm/params.h
@@ -172,6 +172,10 @@
 #define _HVMPV_no_vp_limit 11
 #define HVMPV_no_vp_limit (1 << _HVMPV_no_vp_limit)
 
+/* Enable vCPU hotplug */
+#define _HVMPV_cpu_hotplug 12
+#define HVMPV_cpu_hotplug (1 << _HVMPV_cpu_hotplug)
+
 #define HVMPV_feature_mask \
         (HVMPV_base_freq | \
          HVMPV_no_freq | \
@@ -184,7 +188,8 @@
          HVMPV_stimer | \
          HVMPV_hcall_ipi | \
          HVMPV_ex_processor_masks | \
-         HVMPV_no_vp_limit)
+         HVMPV_no_vp_limit | \
+         HVMPV_cpu_hotplug)
 
 #endif
 
-- 
2.7.4


