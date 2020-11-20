Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F40FA2BAB0D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 14:25:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32189.63203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg6PE-0001qC-F1; Fri, 20 Nov 2020 13:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32189.63203; Fri, 20 Nov 2020 13:24:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg6PE-0001pL-58; Fri, 20 Nov 2020 13:24:52 +0000
Received: by outflank-mailman (input) for mailman id 32189;
 Fri, 20 Nov 2020 13:24:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kg6PC-0001mN-BT
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 13:24:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg6PB-0007DE-0t; Fri, 20 Nov 2020 13:24:49 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg6PA-00028m-PL; Fri, 20 Nov 2020 13:24:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6PC-0001mN-BT
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 13:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=XCBmmmfKMZU4rLhu9vkKTLYVmgviUAD04twlLuMkZm8=; b=kQ3E56mMg/Nd6NDs/u8XlDGtGh
	kqZIU0SX2eIxBcZ26vYDPdzJfAmcMTlgfrwnQPT+BZ1xYY1NjrtoMHg3geqFCS31JxmhuUaO6wkVo
	EBUlhNHH30LY+1izMEA/lkQes7INvi8hNHuEtBF4WrMsmVKN1FT9QLmGJ3hLNYry9MmE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6PB-0007DE-0t; Fri, 20 Nov 2020 13:24:49 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6PA-00028m-PL; Fri, 20 Nov 2020 13:24:48 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v10 4/7] iommu: stop calling IOMMU page tables 'p2m tables'
Date: Fri, 20 Nov 2020 13:24:37 +0000
Message-Id: <20201120132440.1141-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201120132440.1141-1-paul@xen.org>
References: <20201120132440.1141-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>

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
index 64c1fca7b5b6..42b5a5a9bec4 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -494,8 +494,8 @@ static int amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 
 #include <asm/io_apic.h>
 
-static void amd_dump_p2m_table_level(struct page_info* pg, int level, 
-                                     paddr_t gpa, int indent)
+static void amd_dump_page_table_level(struct page_info *pg, int level,
+                                      paddr_t gpa, int indent)
 {
     paddr_t address;
     const union amd_iommu_pte *table_vaddr;
@@ -507,7 +507,7 @@ static void amd_dump_p2m_table_level(struct page_info* pg, int level,
     table_vaddr = __map_domain_page(pg);
     if ( table_vaddr == NULL )
     {
-        printk("Failed to map IOMMU domain page %"PRIpaddr"\n", 
+        printk("AMD IOMMU failed to map domain page %"PRIpaddr"\n",
                 page_to_maddr(pg));
         return;
     }
@@ -524,7 +524,7 @@ static void amd_dump_p2m_table_level(struct page_info* pg, int level,
 
         if ( pde->next_level && (pde->next_level != (level - 1)) )
         {
-            printk("IOMMU p2m table error. next_level = %d, expected %d\n",
+            printk("AMD IOMMU table error. next_level = %d, expected %d\n",
                    pde->next_level, level - 1);
 
             continue;
@@ -532,7 +532,7 @@ static void amd_dump_p2m_table_level(struct page_info* pg, int level,
 
         address = gpa + amd_offset_level_address(index, level);
         if ( pde->next_level >= 1 )
-            amd_dump_p2m_table_level(
+            amd_dump_page_table_level(
                 mfn_to_page(_mfn(pde->mfn)), pde->next_level,
                 address, indent + 1);
         else
@@ -545,16 +545,16 @@ static void amd_dump_p2m_table_level(struct page_info* pg, int level,
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
@@ -580,7 +580,7 @@ static const struct iommu_ops __initconstrel _iommu_ops = {
     .suspend = amd_iommu_suspend,
     .resume = amd_iommu_resume,
     .crash_shutdown = amd_iommu_crash_shutdown,
-    .dump_p2m_table = amd_dump_p2m_table,
+    .dump_page_tables = amd_dump_page_tables,
 };
 
 static const struct iommu_init_ops __initconstrel _iommu_init_ops = {
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 90748062e5bd..8fae77b59375 100644
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
index a76e60c99a58..d136fe36883b 100644
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
@@ -2733,7 +2737,7 @@ static struct iommu_ops __initdata vtd_ops = {
     .iotlb_flush = iommu_flush_iotlb_pages,
     .iotlb_flush_all = iommu_flush_iotlb_all,
     .get_reserved_device_memory = intel_iommu_get_reserved_device_memory,
-    .dump_p2m_table = vtd_dump_p2m_table,
+    .dump_page_tables = vtd_dump_page_tables,
 };
 
 const struct iommu_init_ops __initconstrel intel_iommu_init_ops = {
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 236c55af8921..1a369c97c956 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -275,7 +275,7 @@ struct iommu_ops {
                                     unsigned int flush_flags);
     int __must_check (*iotlb_flush_all)(struct domain *d);
     int (*get_reserved_device_memory)(iommu_grdm_t *, void *);
-    void (*dump_p2m_table)(struct domain *d);
+    void (*dump_page_tables)(struct domain *d);
 
 #ifdef CONFIG_HAS_DEVICE_TREE
     /*
-- 
2.20.1


