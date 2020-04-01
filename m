Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FB8365788
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 13:25:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113542.216399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYoUL-0000Et-1X; Tue, 20 Apr 2021 11:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113542.216399; Tue, 20 Apr 2021 11:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYoUK-0000EU-Ug; Tue, 20 Apr 2021 11:24:16 +0000
Received: by outflank-mailman (input) for mailman id 113542;
 Tue, 20 Apr 2021 11:24:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yMJ0=JR=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1lYoUJ-0000EP-F8
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 11:24:15 +0000
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06e7b8f9-5c9f-4d61-917e-4e114251e99a;
 Tue, 20 Apr 2021 11:24:11 +0000 (UTC)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 04:24:09 -0700
Received: from unknown (HELO hyperv-sh4.sh.intel.com) ([10.239.48.4])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 04:24:06 -0700
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
X-Inumbo-ID: 06e7b8f9-5c9f-4d61-917e-4e114251e99a
IronPort-SDR: nfxf8grSGS+y1g/Dkv2K7o8KUzxNmEysMGrFRHbW8o+Xhvah1jD+LCBvIW5DsPatJYESgBixQA
 c9FAWa8rGoLA==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="195602879"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="195602879"
IronPort-SDR: NFvZiueHB7EhKG5h4td+Dv1fsHhgtscf2mOqmw1v8akSyO9f0pTd3eQF/IAUpvFaG4cTURYLSP
 abUMsPfEmARQ==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="426886743"
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
Subject: [PATCH v2] VT-d: Don't assume register-based invalidation is always supported
Date: Thu,  2 Apr 2020 04:06:06 +0800
Message-Id: <20200401200606.48752-1-chao.gao@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to Intel VT-d SPEC rev3.3 Section 6.5, Register-based Invalidation
isn't supported by Intel VT-d version 6 and beyond.

This hardware change impacts following two scenarios: admin can disable
queued invalidation via 'qinval' cmdline and use register-based interface;
VT-d switches to register-based invalidation when queued invalidation needs
to be disabled, for example, during disabling x2apic or during system
suspension or after enabling queued invalidation fails.

To deal with this hardware change, if register-based invalidation isn't
supported, queued invalidation cannot be disabled through Xen cmdline; and
if queued invalidation has to be disabled temporarily in some scenarios,
VT-d won't switch to register-based interface but use some dummy functions
to catch errors in case there is any invalidation request issued when queued
invalidation is disabled.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
Changes in v2:
 - verify system suspension and resumption with this patch applied
 - don't fall back to register-based interface if enabling qinval failed.
   see the change in init_vtd_hw().
 - remove unnecessary "queued_inval_supported" variable
 - constify the "struct vtd_iommu *" of has_register_based_invalidation()
 - coding-style changes
---
 docs/misc/xen-command-line.pandoc    |  4 +++-
 xen/drivers/passthrough/vtd/iommu.c  | 27 +++++++++++++++++++++--
 xen/drivers/passthrough/vtd/iommu.h  |  7 ++++++
 xen/drivers/passthrough/vtd/qinval.c | 33 ++++++++++++++++++++++++++--
 4 files changed, 66 insertions(+), 5 deletions(-)

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
index 6428c8fe3e..94d1372903 100644
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
@@ -2141,6 +2149,10 @@ static int __must_check init_vtd_hw(bool resume)
          */
         if ( enable_qinval(iommu) != 0 )
         {
+            /* Ensure register-based invalidation is available */
+            if ( !has_register_based_invalidation(iommu) )
+                return -EIO;
+
             iommu->flush.context = vtd_flush_context_reg;
             iommu->flush.iotlb   = vtd_flush_iotlb_reg;
         }
@@ -2231,6 +2243,7 @@ static int __init vtd_setup(void)
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
     int ret;
+    bool reg_inval_supported = true;
 
     if ( list_empty(&acpi_drhd_units) )
     {
@@ -2252,8 +2265,8 @@ static int __init vtd_setup(void)
     }
 
     /* We enable the following features only if they are supported by all VT-d
-     * engines: Snoop Control, DMA passthrough, Queued Invalidation, Interrupt
-     * Remapping, and Posted Interrupt
+     * engines: Snoop Control, DMA passthrough, Register-based Invalidation,
+     * Queued Invalidation, Interrupt Remapping, and Posted Interrupt.
      */
     for_each_drhd_unit ( drhd )
     {
@@ -2275,6 +2288,9 @@ static int __init vtd_setup(void)
         if ( iommu_qinval && !ecap_queued_inval(iommu->ecap) )
             iommu_qinval = 0;
 
+        if ( !has_register_based_invalidation(iommu) )
+            reg_inval_supported = false;
+
         if ( iommu_intremap && !ecap_intr_remap(iommu->ecap) )
             iommu_intremap = iommu_intremap_off;
 
@@ -2301,6 +2317,13 @@ static int __init vtd_setup(void)
 
     softirq_tasklet_init(&vtd_fault_tasklet, do_iommu_page_fault, NULL);
 
+    if ( !iommu_qinval && !reg_inval_supported )
+    {
+        dprintk(XENLOG_ERR VTDPREFIX, "No available invalidation interface.\n");
+        ret = -ENODEV;
+        goto error;
+    }
+
     if ( !iommu_qinval && iommu_intremap )
     {
         iommu_intremap = iommu_intremap_off;
diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/vtd/iommu.h
index 216791b3d6..57737b1a4a 100644
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -540,6 +540,7 @@ struct vtd_iommu {
     struct list_head ats_devices;
     unsigned long *domid_bitmap;  /* domain id bitmap */
     u16 *domid_map;               /* domain id mapping array */
+    uint32_t version;
 };
 
 #define INTEL_IOMMU_DEBUG(fmt, args...) \
@@ -549,4 +550,10 @@ struct vtd_iommu {
             dprintk(XENLOG_WARNING VTDPREFIX, fmt, ## args);    \
     } while(0)
 
+/* Register-based invalidation isn't supported by VT-d version 6 and beyond. */
+static inline bool has_register_based_invalidation(const struct vtd_iommu *vtd)
+{
+    return VER_MAJOR(vtd->version) < 6;
+}
+
 #endif
diff --git a/xen/drivers/passthrough/vtd/qinval.c b/xen/drivers/passthrough/vtd/qinval.c
index 764ef9f0fc..166c754b21 100644
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
+        iommu->flush.iotlb   = vtd_flush_iotlb_noop;
+    }
 }
-- 
2.25.1


