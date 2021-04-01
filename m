Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF5F35110A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:44:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104170.198916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsvz-00068k-4H; Thu, 01 Apr 2021 08:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104170.198916; Thu, 01 Apr 2021 08:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsvy-00068O-VY; Thu, 01 Apr 2021 08:44:10 +0000
Received: by outflank-mailman (input) for mailman id 104170;
 Thu, 01 Apr 2021 08:44:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRsvw-00068H-JW
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:44:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff23fd63-710c-46c3-8f90-b409ab186394;
 Thu, 01 Apr 2021 08:44:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF2A1AE86;
 Thu,  1 Apr 2021 08:44:06 +0000 (UTC)
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
X-Inumbo-ID: ff23fd63-710c-46c3-8f90-b409ab186394
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617266646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EVCTE1tfqI4iUXHiO5xFd7e8mHxtUGLrwEPBx00R958=;
	b=tyd7dgVvsLyTX3ldvHPf2mSEZI6d5TO41Hsq1IcgrXwSWoDsT1AxGciCXL8jP58OwmhL1V
	pSMqGtdvjSA2di/unGO4Oshs9ePmDFdgWkrB1Xb2x1phKR2Rpvk6dZtiNIsmrCyuFJKDzj
	JGwOHG9Qk22r6g95AxemrduZPxjqrPc=
Subject: [PATCH 1/6] VT-d: improve save/restore of registers across S3
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <157e4a65-6d0b-7ea8-1c23-cd393c8c0d7f@suse.com>
Message-ID: <2ff7ac44-5a67-55e5-758b-680e68ebacaa@suse.com>
Date: Thu, 1 Apr 2021 10:44:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <157e4a65-6d0b-7ea8-1c23-cd393c8c0d7f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The static allocation of the save space is not only very inefficient
(most of the array slots won't ever get used), but is also the sole
reason for a build-time upper bound on the number of IOMMUs. Introduce
a structure containing just the one needed field we can't (easily)
restore from other in-memory state, and allocate the respective
array dynamically.

Take the opportunity and make the FEUADDR write dependent upon
x2apic_enabled, like is already the case in dma_msi_set_affinity().

Also alter properties of nr_iommus: static, unsigned, and __initdata.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -57,7 +57,7 @@ bool __read_mostly iommu_qinval = true;
 bool __read_mostly iommu_snoop = true;
 #endif
 
-int nr_iommus;
+static unsigned int __initdata nr_iommus;
 
 static struct iommu_ops vtd_ops;
 static struct tasklet vtd_fault_tasklet;
@@ -1165,13 +1165,6 @@ int __init iommu_alloc(struct acpi_drhd_
     unsigned long sagaw, nr_dom;
     int agaw;
 
-    if ( nr_iommus >= MAX_IOMMUS )
-    {
-        dprintk(XENLOG_ERR VTDPREFIX,
-                "IOMMU: nr_iommus %d > MAX_IOMMUS\n", nr_iommus + 1);
-        return -ENOMEM;
-    }
-
     iommu = xzalloc(struct vtd_iommu);
     if ( iommu == NULL )
         return -ENOMEM;
@@ -2226,6 +2219,10 @@ static void __hwdom_init setup_hwdom_rmr
     pcidevs_unlock();
 }
 
+static struct iommu_state {
+    uint32_t fectl;
+} *__read_mostly iommu_state;
+
 static int __init vtd_setup(void)
 {
     struct acpi_drhd_unit *drhd;
@@ -2251,6 +2248,13 @@ static int __init vtd_setup(void)
         goto error;
     }
 
+    iommu_state = xmalloc_array(struct iommu_state, nr_iommus);
+    if ( !iommu_state )
+    {
+        ret = -ENOMEM;
+        goto error;
+    }
+
     /* We enable the following features only if they are supported by all VT-d
      * engines: Snoop Control, DMA passthrough, Queued Invalidation, Interrupt
      * Remapping, and Posted Interrupt
@@ -2508,8 +2512,6 @@ static int intel_iommu_group_id(u16 seg,
         return PCI_BDF2(bus, devfn);
 }
 
-static u32 iommu_state[MAX_IOMMUS][MAX_IOMMU_REGS];
-
 static int __must_check vtd_suspend(void)
 {
     struct acpi_drhd_unit *drhd;
@@ -2534,14 +2536,7 @@ static int __must_check vtd_suspend(void
         iommu = drhd->iommu;
         i = iommu->index;
 
-        iommu_state[i][DMAR_FECTL_REG] =
-            (u32) dmar_readl(iommu->reg, DMAR_FECTL_REG);
-        iommu_state[i][DMAR_FEDATA_REG] =
-            (u32) dmar_readl(iommu->reg, DMAR_FEDATA_REG);
-        iommu_state[i][DMAR_FEADDR_REG] =
-            (u32) dmar_readl(iommu->reg, DMAR_FEADDR_REG);
-        iommu_state[i][DMAR_FEUADDR_REG] =
-            (u32) dmar_readl(iommu->reg, DMAR_FEUADDR_REG);
+        iommu_state[i].fectl = dmar_readl(iommu->reg, DMAR_FECTL_REG);
 
         /* don't disable VT-d engine when force_iommu is set. */
         if ( force_iommu )
@@ -2594,15 +2589,13 @@ static void vtd_resume(void)
     for_each_drhd_unit ( drhd )
     {
         iommu = drhd->iommu;
-        i = iommu->index;
 
         spin_lock_irqsave(&iommu->register_lock, flags);
-        dmar_writel(iommu->reg, DMAR_FEDATA_REG,
-                    iommu_state[i][DMAR_FEDATA_REG]);
-        dmar_writel(iommu->reg, DMAR_FEADDR_REG,
-                    iommu_state[i][DMAR_FEADDR_REG]);
-        dmar_writel(iommu->reg, DMAR_FEUADDR_REG,
-                    iommu_state[i][DMAR_FEUADDR_REG]);
+        dmar_writel(iommu->reg, DMAR_FEDATA_REG, iommu->msi.msg.data);
+        dmar_writel(iommu->reg, DMAR_FEADDR_REG, iommu->msi.msg.address_lo);
+        if ( x2apic_enabled )
+            dmar_writel(iommu->reg, DMAR_FEUADDR_REG,
+                        iommu->msi.msg.address_hi);
         spin_unlock_irqrestore(&iommu->register_lock, flags);
     }
 
@@ -2615,8 +2608,7 @@ static void vtd_resume(void)
         i = iommu->index;
 
         spin_lock_irqsave(&iommu->register_lock, flags);
-        dmar_writel(iommu->reg, DMAR_FECTL_REG,
-                    (u32) iommu_state[i][DMAR_FECTL_REG]);
+        dmar_writel(iommu->reg, DMAR_FECTL_REG, iommu_state[i].fectl);
         spin_unlock_irqrestore(&iommu->register_lock, flags);
 
         iommu_enable_translation(drhd);
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -499,8 +499,6 @@ struct qinval_entry {
 #define VTD_PAGE_TABLE_LEVEL_3  3
 #define VTD_PAGE_TABLE_LEVEL_4  4
 
-#define MAX_IOMMU_REGS 0xc0
-
 extern struct list_head acpi_drhd_units;
 extern struct list_head acpi_rmrr_units;
 extern struct list_head acpi_ioapic_units;
--- a/xen/include/asm-x86/iommu.h
+++ b/xen/include/asm-x86/iommu.h
@@ -22,7 +22,6 @@
 #include <asm/hvm/vmx/vmcs.h>
 
 #define DEFAULT_DOMAIN_ADDRESS_WIDTH 48
-#define MAX_IOMMUS 32
 
 struct g2m_ioport {
     struct list_head list;


