Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F5C23A59C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 14:40:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2Zkw-0000nH-Nu; Mon, 03 Aug 2020 12:39:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rQjY=BN=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k2Zkv-0000nC-6m
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 12:39:53 +0000
X-Inumbo-ID: 6cf15a90-d586-11ea-af2a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6cf15a90-d586-11ea-af2a-12813bfff9fa;
 Mon, 03 Aug 2020 12:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zIlKdkXsPhIQfdArjrBSxAJXwBuXmUMve699NvtwDOs=; b=6Na79cBn+4zynf6IKqEcHmKPa0
 zN4K+x1W/BcDu3R841FiDdznkQLjJG3FY19r10fSkT0SZyUotyxyetz8bbvlnFGNJFvPUnKUNsbWa
 exwKFLLFcJXhKMsvM8X636ZP3wkDrCtkH+8uyM1GY2d5XFC1GYRqKMYPSssSw+xjCRbk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2Zks-0000ix-3i; Mon, 03 Aug 2020 12:39:50 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2Zar-0000zk-3z; Mon, 03 Aug 2020 12:29:29 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 11/11] iommu: stop calling IOMMU page tables 'p2m tables'
Date: Mon,  3 Aug 2020 13:29:14 +0100
Message-Id: <20200803122914.2259-12-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200803122914.2259-1-paul@xen.org>
References: <20200803122914.2259-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

It's confusing and not consistent with the terminology introduced with 'dfn_t'.
Just call them IOMMU page tables.

Also remove a pointless check of the 'acpi_drhd_units' list in
vtd_dump_page_table_level(). If the list is empty then IOMMU mappings would
not have been enabled for the domain in the first place.

NOTE: All calls to printk() have also been removed from
      iommu_dump_page_tables(); the implementation specific code is now
      responsible for all output.
      The check for the global 'iommu_enabled' has also been replaced by an
      ASSERT since iommu_dump_page_tables() is not registered as a key handler
      unless IOMMU mappings are enabled.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>

v2:
 - Moved all output into implementation specific code
---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 16 ++++++-------
 xen/drivers/passthrough/iommu.c             | 21 ++++-------------
 xen/drivers/passthrough/vtd/iommu.c         | 26 +++++++++++----------
 xen/include/xen/iommu.h                     |  2 +-
 4 files changed, 28 insertions(+), 37 deletions(-)

diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index d79668f948..b3e95cf18e 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -491,8 +491,8 @@ static int amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 
 #include <asm/io_apic.h>
 
-static void amd_dump_p2m_table_level(struct page_info* pg, int level, 
-                                     paddr_t gpa, int indent)
+static void amd_dump_page_table_level(struct page_info* pg, int level,
+                                      paddr_t gpa, int indent)
 {
     paddr_t address;
     struct amd_iommu_pte *table_vaddr;
@@ -529,7 +529,7 @@ static void amd_dump_p2m_table_level(struct page_info* pg, int level,
 
         address = gpa + amd_offset_level_address(index, level);
         if ( pde->next_level >= 1 )
-            amd_dump_p2m_table_level(
+            amd_dump_page_table_level(
                 mfn_to_page(_mfn(pde->mfn)), pde->next_level,
                 address, indent + 1);
         else
@@ -542,16 +542,16 @@ static void amd_dump_p2m_table_level(struct page_info* pg, int level,
     unmap_domain_page(table_vaddr);
 }
 
-static void amd_dump_p2m_table(struct domain *d)
+static void amd_dump_page_tables(struct domain *d)
 {
     const struct domain_iommu *hd = dom_iommu(d);
 
     if ( !hd->arch.amd.root_table )
         return;
 
-    printk("p2m table has %d levels\n", hd->arch.amd.paging_mode);
-    amd_dump_p2m_table_level(hd->arch.amd.root_table,
-                             hd->arch.amd.paging_mode, 0, 0);
+    printk("AMD IOMMU table has %d levels\n", hd->arch.amd.paging_mode);
+    amd_dump_page_table_level(hd->arch.amd.root_table,
+                              hd->arch.amd.paging_mode, 0, 0);
 }
 
 static const struct iommu_ops __initconstrel _iommu_ops = {
@@ -578,7 +578,7 @@ static const struct iommu_ops __initconstrel _iommu_ops = {
     .suspend = amd_iommu_suspend,
     .resume = amd_iommu_resume,
     .crash_shutdown = amd_iommu_crash_shutdown,
-    .dump_p2m_table = amd_dump_p2m_table,
+    .dump_page_tables = amd_dump_page_tables,
 };
 
 static const struct iommu_init_ops __initconstrel _iommu_init_ops = {
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 7464f10d1c..0f468379e1 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -22,7 +22,7 @@
 #include <xen/keyhandler.h>
 #include <xsm/xsm.h>
 
-static void iommu_dump_p2m_table(unsigned char key);
+static void iommu_dump_page_tables(unsigned char key);
 
 unsigned int __read_mostly iommu_dev_iotlb_timeout = 1000;
 integer_param("iommu_dev_iotlb_timeout", iommu_dev_iotlb_timeout);
@@ -212,7 +212,7 @@ void __hwdom_init iommu_hwdom_init(struct domain *d)
     if ( !is_iommu_enabled(d) )
         return;
 
-    register_keyhandler('o', &iommu_dump_p2m_table, "dump iommu p2m table", 0);
+    register_keyhandler('o', &iommu_dump_page_tables, "dump iommu page tables", 0);
 
     hd->platform_ops->hwdom_init(d);
 }
@@ -533,16 +533,12 @@ bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
     return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features);
 }
 
-static void iommu_dump_p2m_table(unsigned char key)
+static void iommu_dump_page_tables(unsigned char key)
 {
     struct domain *d;
     const struct iommu_ops *ops;
 
-    if ( !iommu_enabled )
-    {
-        printk("IOMMU not enabled!\n");
-        return;
-    }
+    ASSERT(iommu_enabled);
 
     ops = iommu_get_ops();
 
@@ -553,14 +549,7 @@ static void iommu_dump_p2m_table(unsigned char key)
         if ( is_hardware_domain(d) || !is_iommu_enabled(d) )
             continue;
 
-        if ( iommu_use_hap_pt(d) )
-        {
-            printk("\ndomain%d IOMMU p2m table shared with MMU: \n", d->domain_id);
-            continue;
-        }
-
-        printk("\ndomain%d IOMMU p2m table: \n", d->domain_id);
-        ops->dump_p2m_table(d);
+        ops->dump_page_tables(d);
     }
 
     rcu_read_unlock(&domlist_read_lock);
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index a532d9e88c..f8da4fe0e7 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2582,8 +2582,8 @@ static void vtd_resume(void)
     }
 }
 
-static void vtd_dump_p2m_table_level(paddr_t pt_maddr, int level, paddr_t gpa, 
-                                     int indent)
+static void vtd_dump_page_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
+                                      int indent)
 {
     paddr_t address;
     int i;
@@ -2612,8 +2612,8 @@ static void vtd_dump_p2m_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
 
         address = gpa + offset_level_address(i, level);
         if ( next_level >= 1 ) 
-            vtd_dump_p2m_table_level(dma_pte_addr(*pte), next_level, 
-                                     address, indent + 1);
+            vtd_dump_page_table_level(dma_pte_addr(*pte), next_level,
+                                      address, indent + 1);
         else
             printk("%*sdfn: %08lx mfn: %08lx\n",
                    indent, "",
@@ -2624,17 +2624,19 @@ static void vtd_dump_p2m_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
     unmap_vtd_domain_page(pt_vaddr);
 }
 
-static void vtd_dump_p2m_table(struct domain *d)
+static void vtd_dump_page_tables(struct domain *d)
 {
-    const struct domain_iommu *hd;
+    const struct domain_iommu *hd = dom_iommu(d);
 
-    if ( list_empty(&acpi_drhd_units) )
+    if ( iommu_use_hap_pt(d) )
+    {
+        printk("VT-D sharing EPT table\n");
         return;
+    }
 
-    hd = dom_iommu(d);
-    printk("p2m table has %d levels\n", agaw_to_level(hd->arch.vtd.agaw));
-    vtd_dump_p2m_table_level(hd->arch.vtd.pgd_maddr,
-                             agaw_to_level(hd->arch.vtd.agaw), 0, 0);
+    printk("VT-D table has %d levels\n", agaw_to_level(hd->arch.vtd.agaw));
+    vtd_dump_page_table_level(hd->arch.vtd.pgd_maddr,
+                              agaw_to_level(hd->arch.vtd.agaw), 0, 0);
 }
 
 static int __init intel_iommu_quarantine_init(struct domain *d)
@@ -2734,7 +2736,7 @@ static struct iommu_ops __initdata vtd_ops = {
     .iotlb_flush = iommu_flush_iotlb_pages,
     .iotlb_flush_all = iommu_flush_iotlb_all,
     .get_reserved_device_memory = intel_iommu_get_reserved_device_memory,
-    .dump_p2m_table = vtd_dump_p2m_table,
+    .dump_page_tables = vtd_dump_page_tables,
 };
 
 const struct iommu_init_ops __initconstrel intel_iommu_init_ops = {
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 1f25d2082f..23e884f54b 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -277,7 +277,7 @@ struct iommu_ops {
                                     unsigned int flush_flags);
     int __must_check (*iotlb_flush_all)(struct domain *d);
     int (*get_reserved_device_memory)(iommu_grdm_t *, void *);
-    void (*dump_p2m_table)(struct domain *d);
+    void (*dump_page_tables)(struct domain *d);
 
 #ifdef CONFIG_HAS_DEVICE_TREE
     /*
-- 
2.20.1


