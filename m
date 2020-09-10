Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B707264852
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:50:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGNuE-0007Vj-Sx; Thu, 10 Sep 2020 14:50:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S6nR=CT=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kGNuD-0007KI-Pz
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:50:33 +0000
X-Inumbo-ID: adf4f5d7-efb5-4b42-a63d-5a8bdfde00cb
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adf4f5d7-efb5-4b42-a63d-5a8bdfde00cb;
 Thu, 10 Sep 2020 14:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=qMHeI4q73tq3sYLBSsNp46ZTjB9OMw3BVboj3MRPDVE=; b=4/d15mka/x2XRDGPtk4J1kma81
 c2pRbr51/IA+FUC55VDm8rx2rQ8+PNSbafw1AgrkrhSIkA7BUgV8E1bm4NaU3njLoVDok4c77p6WF
 R904l3MqbD0MY9asZ5R+5rY53AlP7dh2gJHIWMILrJB6zw0wQKRfgDIapsUSUKG6OgR0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kGNu0-0006vR-4Y; Thu, 10 Sep 2020 14:50:20 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kGNtz-0004ZM-Su; Thu, 10 Sep 2020 14:50:20 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v6 8/8] iommu: stop calling IOMMU page tables 'p2m tables'
Date: Thu, 10 Sep 2020 15:50:07 +0100
Message-Id: <20200910145007.14107-9-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200910145007.14107-1-paul@xen.org>
References: <20200910145007.14107-1-paul@xen.org>
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
      Error messages are now prefixed with the name of the function.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>

v6:
 - Cosmetic adjustment
 - Drop use of __func__

v5:
 - Make sure domain id is in the output
 - Use VTDPREFIX in output for consistency

v2:
 - Moved all output into implementation specific code
---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 20 +++++++-------
 xen/drivers/passthrough/iommu.c             | 21 ++++-----------
 xen/drivers/passthrough/vtd/iommu.c         | 30 ++++++++++++---------
 xen/include/xen/iommu.h                     |  2 +-
 4 files changed, 33 insertions(+), 40 deletions(-)

diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 3390c22cf3..5fe9dc849d 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -491,8 +491,8 @@ static int amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 
 #include <asm/io_apic.h>
 
-static void amd_dump_p2m_table_level(struct page_info* pg, int level, 
-                                     paddr_t gpa, int indent)
+static void amd_dump_page_table_level(struct page_info *pg, int level,
+                                      paddr_t gpa, int indent)
 {
     paddr_t address;
     struct amd_iommu_pte *table_vaddr;
@@ -504,7 +504,7 @@ static void amd_dump_p2m_table_level(struct page_info* pg, int level,
     table_vaddr = __map_domain_page(pg);
     if ( table_vaddr == NULL )
     {
-        printk("Failed to map IOMMU domain page %"PRIpaddr"\n", 
+        printk("AMD IOMMU failed to map domain page %"PRIpaddr"\n",
                 page_to_maddr(pg));
         return;
     }
@@ -521,7 +521,7 @@ static void amd_dump_p2m_table_level(struct page_info* pg, int level,
 
         if ( pde->next_level && (pde->next_level != (level - 1)) )
         {
-            printk("IOMMU p2m table error. next_level = %d, expected %d\n",
+            printk("AMD IOMMU table error. next_level = %d, expected %d\n",
                    pde->next_level, level - 1);
 
             continue;
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
 
-    printk("p2m table has %u levels\n", hd->arch.amd.paging_mode);
-    amd_dump_p2m_table_level(hd->arch.amd.root_table,
-                             hd->arch.amd.paging_mode, 0, 0);
+    printk("AMD IOMMU %pd table has %u levels\n", d, hd->arch.amd.paging_mode);
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
index e9b6c9a1ec..f5cd04fb3e 100644
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
@@ -535,16 +535,12 @@ bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
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
 
@@ -555,14 +551,7 @@ static void iommu_dump_p2m_table(unsigned char key)
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
index 58d4550a4c..faf258e699 100644
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
@@ -2596,7 +2596,8 @@ static void vtd_dump_p2m_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
     pt_vaddr = map_vtd_domain_page(pt_maddr);
     if ( pt_vaddr == NULL )
     {
-        printk("Failed to map VT-D domain page %"PRIpaddr"\n", pt_maddr);
+        printk(VTDPREFIX " failed to map domain page %"PRIpaddr"\n",
+               pt_maddr);
         return;
     }
 
@@ -2612,8 +2613,8 @@ static void vtd_dump_p2m_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
 
         address = gpa + offset_level_address(i, level);
         if ( next_level >= 1 ) 
-            vtd_dump_p2m_table_level(dma_pte_addr(*pte), next_level, 
-                                     address, indent + 1);
+            vtd_dump_page_table_level(dma_pte_addr(*pte), next_level,
+                                      address, indent + 1);
         else
             printk("%*sdfn: %08lx mfn: %08lx\n",
                    indent, "",
@@ -2624,17 +2625,20 @@ static void vtd_dump_p2m_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
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
+        printk(VTDPREFIX " %pd sharing EPT table\n", d);
         return;
+    }
 
-    hd = dom_iommu(d);
-    printk("p2m table has %d levels\n", agaw_to_level(hd->arch.vtd.agaw));
-    vtd_dump_p2m_table_level(hd->arch.vtd.pgd_maddr,
-                             agaw_to_level(hd->arch.vtd.agaw), 0, 0);
+    printk(VTDPREFIX" %pd table has %d levels\n", d,
+           agaw_to_level(hd->arch.vtd.agaw));
+    vtd_dump_page_table_level(hd->arch.vtd.pgd_maddr,
+                              agaw_to_level(hd->arch.vtd.agaw), 0, 0);
 }
 
 static int __init intel_iommu_quarantine_init(struct domain *d)
@@ -2734,7 +2738,7 @@ static struct iommu_ops __initdata vtd_ops = {
     .iotlb_flush = iommu_flush_iotlb_pages,
     .iotlb_flush_all = iommu_flush_iotlb_all,
     .get_reserved_device_memory = intel_iommu_get_reserved_device_memory,
-    .dump_p2m_table = vtd_dump_p2m_table,
+    .dump_page_tables = vtd_dump_page_tables,
 };
 
 const struct iommu_init_ops __initconstrel intel_iommu_init_ops = {
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 373145266f..7a539522b1 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -276,7 +276,7 @@ struct iommu_ops {
                                     unsigned int flush_flags);
     int __must_check (*iotlb_flush_all)(struct domain *d);
     int (*get_reserved_device_memory)(iommu_grdm_t *, void *);
-    void (*dump_p2m_table)(struct domain *d);
+    void (*dump_page_tables)(struct domain *d);
 
 #ifdef CONFIG_HAS_DEVICE_TREE
     /*
-- 
2.20.1


