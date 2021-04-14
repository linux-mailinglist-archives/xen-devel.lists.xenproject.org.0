Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59B035EF36
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 10:23:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110353.210617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWanX-0003cO-5B; Wed, 14 Apr 2021 08:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110353.210617; Wed, 14 Apr 2021 08:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWanX-0003bz-1o; Wed, 14 Apr 2021 08:22:55 +0000
Received: by outflank-mailman (input) for mailman id 110353;
 Wed, 14 Apr 2021 08:22:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQnP=JL=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1lWanV-0003bu-Me
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 08:22:53 +0000
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9bee840-1f62-4592-8592-b75c6df97c02;
 Wed, 14 Apr 2021 08:22:50 +0000 (UTC)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 01:22:49 -0700
Received: from unknown (HELO hyperv-sh4.sh.intel.com) ([10.239.48.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 01:22:46 -0700
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
X-Inumbo-ID: a9bee840-1f62-4592-8592-b75c6df97c02
IronPort-SDR: pvkxHMBbtyE44qGu8d6Nhbc0mArhfvwKoXxtl9X1sd45oADEFoW3yhZTgsB5bTONii4SY1pPNZ
 V67DAbxloVrQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="181715370"
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; 
   d="scan'208";a="181715370"
IronPort-SDR: dI9AmB6jIeR57Bskm5ThJiCmxAseeWAVFROpB20vOGLjevnoTZoWNckk1rcXLa0T2DQP5TGnwC
 xaUxAwHaArLA==
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; 
   d="scan'208";a="418232839"
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Chao Gao <chao.gao@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [RFC PATCH] VT-d: Don't assume register-based invalidation is always supported
Date: Wed, 14 Apr 2021 08:55:26 +0800
Message-Id: <20210414005526.36760-1-chao.gao@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to Intel VT-d SPEC rev3.3 Section 6.5, Register-based Invalidation
isn't supported by Intel VT-d version 6 and beyond.

This hardware change impacts following two scenarios: admin can disable
queued invalidation via 'qinval' cmdline and use register-based interface;
VT-d switches to register-based invalidation when queued invalidation needs
to be disabled, for example, during disabling x2apic or during system
suspension.

To deal with this hardware change, if register-based invalidation isn't
supported, queued invalidation cannot be disabled through Xen cmdline; and
if queued invalidation has to be disabled temporarily in some scenarios,
VT-d won't switch to register-based interface but use some dummy functions
to catch errors in case there is any invalidation request issued when queued
invalidation is disabled.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
I only tested Xen boot with qinval/no-qinval. I also want to do system
suspension and resumption to see if any unexpected error. But I don't
know how to trigger them. Any recommendation?
---
 docs/misc/xen-command-line.pandoc    |  4 ++-
 xen/drivers/passthrough/vtd/iommu.c  | 40 +++++++++++++++++++++++++---
 xen/drivers/passthrough/vtd/iommu.h  |  7 +++++
 xen/drivers/passthrough/vtd/qinval.c | 33 +++++++++++++++++++++--
 4 files changed, 77 insertions(+), 7 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index deef6d0b4c..4ff4a87844 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1442,7 +1442,9 @@ The following options are specific to Intel VT-d hardware:
 *   The `qinval` boolean controls the Queued Invalidation sub-feature, and is
     active by default on compatible hardware.  Queued Invalidation is a
     feature in second-generation IOMMUs and is a functional prerequisite for
-    Interrupt Remapping.
+    Interrupt Remapping. Note that Xen disregards this setting for Intel VT-d
+    version 6 and greater as Registered-Based Invalidation isn't supported
+    by them.
 
 *   The `igfx` boolean is active by default, and controls whether the IOMMU in
     front of an Intel Graphics Device is enabled or not.
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 6428c8fe3e..e738d04543 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1193,6 +1193,14 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
 
     iommu->cap = dmar_readq(iommu->reg, DMAR_CAP_REG);
     iommu->ecap = dmar_readq(iommu->reg, DMAR_ECAP_REG);
+    iommu->version = dmar_readl(iommu->reg, DMAR_VER_REG);
+
+    if ( !iommu_qinval && !has_register_based_invalidation(iommu) )
+    {
+        printk(XENLOG_WARNING VTDPREFIX "IOMMU %d: cannot disable Queued Invalidation.\n",
+               iommu->index);
+        iommu_qinval = true;
+    }
 
     if ( iommu_verbose )
     {
@@ -2231,6 +2239,8 @@ static int __init vtd_setup(void)
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
     int ret;
+    bool queued_inval_supported = true;
+    bool reg_inval_supported = true;
 
     if ( list_empty(&acpi_drhd_units) )
     {
@@ -2252,8 +2262,8 @@ static int __init vtd_setup(void)
     }
 
     /* We enable the following features only if they are supported by all VT-d
-     * engines: Snoop Control, DMA passthrough, Queued Invalidation, Interrupt
-     * Remapping, and Posted Interrupt
+     * engines: Snoop Control, DMA passthrough, Register-based Invalidation,
+     * Queued Invalidation, Interrupt Remapping, and Posted Interrupt.
      */
     for_each_drhd_unit ( drhd )
     {
@@ -2272,8 +2282,11 @@ static int __init vtd_setup(void)
         if ( iommu_hwdom_passthrough && !ecap_pass_thru(iommu->ecap) )
             iommu_hwdom_passthrough = false;
 
-        if ( iommu_qinval && !ecap_queued_inval(iommu->ecap) )
-            iommu_qinval = 0;
+        if ( reg_inval_supported && !has_register_based_invalidation(iommu) )
+            reg_inval_supported = false;
+
+        if ( queued_inval_supported && !ecap_queued_inval(iommu->ecap) )
+            queued_inval_supported = false;
 
         if ( iommu_intremap && !ecap_intr_remap(iommu->ecap) )
             iommu_intremap = iommu_intremap_off;
@@ -2301,6 +2314,25 @@ static int __init vtd_setup(void)
 
     softirq_tasklet_init(&vtd_fault_tasklet, do_iommu_page_fault, NULL);
 
+    if ( !queued_inval_supported && !reg_inval_supported )
+    {
+        dprintk(XENLOG_ERR VTDPREFIX, "No available invalidation interface.\n");
+        ret = -ENODEV;
+        goto error;
+    }
+
+    /*
+     * We cannot have !iommu_qinval && !reg_inval_supported here since
+     * iommu_qinval is set in iommu_alloc() if any iommu doesn't support
+     * Register-based Invalidation.
+     */
+    if ( iommu_qinval && !queued_inval_supported )
+    {
+        dprintk(XENLOG_WARNING VTDPREFIX, "Disable Queued Invalidation as "
+                "it isn't supported.\n");
+        iommu_qinval = false;
+    }
+
     if ( !iommu_qinval && iommu_intremap )
     {
         iommu_intremap = iommu_intremap_off;
diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/vtd/iommu.h
index 216791b3d6..644224051a 100644
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -540,6 +540,7 @@ struct vtd_iommu {
     struct list_head ats_devices;
     unsigned long *domid_bitmap;  /* domain id bitmap */
     u16 *domid_map;               /* domain id mapping array */
+    u32 version;
 };
 
 #define INTEL_IOMMU_DEBUG(fmt, args...) \
@@ -549,4 +550,10 @@ struct vtd_iommu {
             dprintk(XENLOG_WARNING VTDPREFIX, fmt, ## args);    \
     } while(0)
 
+/* Register-based invalidation isn't supported by VT-d version 6 and beyond. */
+static inline bool has_register_based_invalidation(struct vtd_iommu *iommu)
+{
+    return VER_MAJOR(iommu->version) < 6;
+}
+
 #endif
diff --git a/xen/drivers/passthrough/vtd/qinval.c b/xen/drivers/passthrough/vtd/qinval.c
index 764ef9f0fc..1e90f50ff8 100644
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -442,6 +442,23 @@ int enable_qinval(struct vtd_iommu *iommu)
     return 0;
 }
 
+static int vtd_flush_context_noop(struct vtd_iommu *iommu, uint16_t did,
+                                  uint16_t source_id, uint8_t function_mask,
+                                  uint64_t type, bool flush_non_present_entry)
+{
+    dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: Cannot flush CONTEXT.\n");
+    return -EIO;
+}
+
+static int vtd_flush_iotlb_noop(struct vtd_iommu *iommu, uint16_t did,
+                                uint64_t addr, unsigned int size_order,
+                                uint64_t type, bool flush_non_present_entry,
+                                bool flush_dev_iotlb)
+{
+    dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: Cannot flush IOTLB.\n");
+    return -EIO;
+}
+
 void disable_qinval(struct vtd_iommu *iommu)
 {
     u32 sts;
@@ -463,6 +480,18 @@ void disable_qinval(struct vtd_iommu *iommu)
 out:
     spin_unlock_irqrestore(&iommu->register_lock, flags);
 
-    iommu->flush.context = vtd_flush_context_reg;
-    iommu->flush.iotlb   = vtd_flush_iotlb_reg;
+    /*
+     * Assign callbacks to noop to catch errors if register-based invalidation
+     * isn't supported.
+     */
+    if ( has_register_based_invalidation(iommu) )
+    {
+        iommu->flush.context = vtd_flush_context_reg;
+        iommu->flush.iotlb   = vtd_flush_iotlb_reg;
+    }
+    else
+    {
+        iommu->flush.context = vtd_flush_context_noop;
+        iommu->flush.iotlb = vtd_flush_iotlb_noop;
+    }
 }
-- 
2.25.1


