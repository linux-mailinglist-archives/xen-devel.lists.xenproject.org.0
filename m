Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C591125F435
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 09:41:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFBlo-0003R9-H6; Mon, 07 Sep 2020 07:40:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9LpL=CQ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kFBlm-0003Af-HW
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 07:40:54 +0000
X-Inumbo-ID: d15b86b1-2d95-4126-b538-e18a7f9fb3f8
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d15b86b1-2d95-4126-b538-e18a7f9fb3f8;
 Mon, 07 Sep 2020 07:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=R7EKKqxVe3Uwn2q9EqcCnyaZ3j4WZg/S/Q/cBwWBG18=; b=6K6baQKbTEiq80QLfGFCiP47d7
 iwDmd6WXeXoIoI/GfCi0J2cJm4RrFoOvytQTdz7oO3F5McDxp27ITr+jDm+wXm2U2BGY/+eeE+0kR
 IXvcGkAeu7pnWoK3uA6Qv8eC3Kq221sc7WXnQfl3mBSvDopXQqskDZ9WnBLPWsbZpCCc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kFBlU-0000sd-Cp; Mon, 07 Sep 2020 07:40:36 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kFBlU-0008Cf-52; Mon, 07 Sep 2020 07:40:36 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v5 8/8] iommu: stop calling IOMMU page tables 'p2m tables'
Date: Mon,  7 Sep 2020 08:40:23 +0100
Message-Id: <20200907074023.1392-9-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200907074023.1392-1-paul@xen.org>
References: <20200907074023.1392-1-paul@xen.org>
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
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>

v5:
 - Make sure domain id is in the output
 - Use VTDPREFIX in output for consistency

v2:
 - Moved all output into implementation specific code
---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 22 +++++++--------
 xen/drivers/passthrough/iommu.c             | 21 ++++-----------
 xen/drivers/passthrough/vtd/iommu.c         | 30 ++++++++++++---------
 xen/include/xen/iommu.h                     |  2 +-
 4 files changed, 34 insertions(+), 41 deletions(-)

diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 3390c22cf3..80b0f58f88 100644
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
@@ -504,7 +504,7 @@ static void amd_dump_p2m_table_level(struct page_info* pg, int level,
     table_vaddr = __map_domain_page(pg);
     if ( table_vaddr == NULL )
     {
-        printk("Failed to map IOMMU domain page %"PRIpaddr"\n", 
+        printk("%s: failed to map domain page %"PRIpaddr"\n", __func__,
                 page_to_maddr(pg));
         return;
     }
@@ -521,15 +521,15 @@ static void amd_dump_p2m_table_level(struct page_info* pg, int level,
 
         if ( pde->next_level && (pde->next_level != (level - 1)) )
         {
-            printk("IOMMU p2m table error. next_level = %d, expected %d\n",
-                   pde->next_level, level - 1);
+            printk("%s: table error. next_level = %d, expected %d\n",
+                   __func__, pde->next_level, level - 1);
 
             continue;
         }
 
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
index 2ced3a5fa5..d84c000a8e 100644
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
+        printk("%s: failed to map domain page %"PRIpaddr"\n", __func__,
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


