Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E042EEA87
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 01:48:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63148.112129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxfvy-0003BL-Cz; Fri, 08 Jan 2021 00:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63148.112129; Fri, 08 Jan 2021 00:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxfvy-0003Aw-9A; Fri, 08 Jan 2021 00:47:18 +0000
Received: by outflank-mailman (input) for mailman id 63148;
 Fri, 08 Jan 2021 00:47:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1BSv=GL=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kxfvw-0003Ar-Ib
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 00:47:16 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7869df95-db25-470f-bfbf-4ea62f9ea9f1;
 Fri, 08 Jan 2021 00:47:14 +0000 (UTC)
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
X-Inumbo-ID: 7869df95-db25-470f-bfbf-4ea62f9ea9f1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610066834;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=DhagZe3FUKNmQkCfV2aS126g9ne70TITatIXvo0P88Q=;
  b=OXmX9Dd46ZIlM3RjcQg5bo7XTTOsTD1ZXetH+o0D5H53ZuxfDazqqhzh
   Dz3BzutLGuCQSUC9zPGAwokLBtjwKQE2pOguFJYgcXzpW0i+TOKy1a3MC
   Yw0U+9WzjxRIBjcCi+jq8LTfx0OKL7fUikNOdD5TviTFyrYDUtG0dxjGe
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xG38NNKQICbni7WDPveOQyTvt2m4i0KjekVxjjo+7aLZho7gFCO212LBVBi1/aRezh2+iO3TsQ
 C7jh6CRNIeuwel25cS+t+AJ8a9DRCwo0X0x9gx5HZpX78WhGLcYo+M0FkWzLBoPaCLvKBJWVKn
 GFxeBTRck5cThbBejpu8baoO28u1Yik6E6SCyWPmkdovsLkW6G3A7FtKdqjdMxTkD+d5z0tPP6
 kQTyBzoo0RZUHxuhZnQC33Tc0crM9VWPIEdLRnTn//41wDORUWjJ8yzAFlushuZZ1gGm2dkI4q
 Lvw=
X-SBRS: 5.2
X-MesageID: 34863485
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,330,1602561600"; 
   d="scan'208";a="34863485"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <paul@xen.org>, <wl@xen.org>, <iwj@xenproject.org>,
	<anthony.perard@citrix.com>, <andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>, <jbeulich@suse.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <roger.pau@citrix.com>, Igor Druzhinin
	<igor.druzhinin@citrix.com>
Subject: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
Date: Fri, 8 Jan 2021 00:46:35 +0000
Message-ID: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

TLFS 7.8.1 stipulates that "a virtual processor index must be less than
the maximum number of virtual processors per partition" that "can be obtained
through CPUID leaf 0x40000005". Furthermore, "Requirements for Implementing
the Microsoft Hypervisor Interface" defines that starting from Windows Server
2012, which allowed more than 64 CPUs to be brought up, this leaf can now
contain a value -1 basically assuming the hypervisor has no restriction while
0 (that we currently expose) means the default restriction is still present.

Along with previous changes exposing ExProcessorMasks this allows a recent
Windows VM with Viridian extension enabled to have more than 64 vCPUs without
going into immediate BSOD.

Since we didn't expose the leaf before and to keep CPUID data consistent for
incoming streams from previous Xen versions - let's keep it behind an option.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 tools/libs/light/libxl_x86.c         |  2 +-
 xen/arch/x86/hvm/viridian/viridian.c | 23 +++++++++++++++++++++++
 xen/include/public/hvm/params.h      |  7 ++++++-
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 86d2729..96c8bf1 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -336,7 +336,7 @@ static int hvm_set_viridian_features(libxl__gc *gc, uint32_t domid,
         LOG(DETAIL, "%s group enabled", libxl_viridian_enlightenment_to_string(v));
 
     if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_BASE)) {
-        mask |= HVMPV_base_freq;
+        mask |= HVMPV_base_freq | HVMPV_no_vp_limit;
 
         if (!libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_FREQ))
             mask |= HVMPV_no_freq;
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index ed97804..ae1ea86 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -209,6 +209,29 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
         res->b = viridian_spinlock_retry_count;
         break;
 
+    case 5:
+        /*
+         * From "Requirements for Implementing the Microsoft Hypervisor
+         *  Interface":
+         *
+         * "On Windows operating systems versions through Windows Server
+         * 2008 R2, reporting the HV#1 hypervisor interface limits
+         * the Windows virtual machine to a maximum of 64 VPs, regardless of
+         * what is reported via CPUID.40000005.EAX.
+         *
+         * Starting with Windows Server 2012 and Windows 8, if
+         * CPUID.40000005.EAX containsa value of -1, Windows assumes that
+         * the hypervisor imposes no specific limit to the number of VPs.
+         * In this case, Windows Server 2012 guest VMs may use more than 64
+         * VPs, up to the maximum supported number of processors applicable
+         * to the specific Windows version being used."
+         *
+         * For compatibility we hide it behind an option.
+         */
+        if ( viridian_feature_mask(d) & HVMPV_no_vp_limit )
+            res->a = -1;
+        break;
+
     case 6:
         /* Detected and in use hardware features. */
         if ( cpu_has_vmx_virtualize_apic_accesses )
diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
index 3b0a0f4..805f4ca 100644
--- a/xen/include/public/hvm/params.h
+++ b/xen/include/public/hvm/params.h
@@ -168,6 +168,10 @@
 #define _HVMPV_ex_processor_masks 10
 #define HVMPV_ex_processor_masks (1 << _HVMPV_ex_processor_masks)
 
+/* Allow more than 64 VPs */
+#define _HVMPV_no_vp_limit 11
+#define HVMPV_no_vp_limit (1 << _HVMPV_no_vp_limit)
+
 #define HVMPV_feature_mask \
         (HVMPV_base_freq | \
          HVMPV_no_freq | \
@@ -179,7 +183,8 @@
          HVMPV_synic | \
          HVMPV_stimer | \
          HVMPV_hcall_ipi | \
-         HVMPV_ex_processor_masks)
+         HVMPV_ex_processor_masks | \
+         HVMPV_no_vp_limit)
 
 #endif
 
-- 
2.7.4


