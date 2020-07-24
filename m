Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102A522CB65
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 18:46:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz0qJ-0001C6-K4; Fri, 24 Jul 2020 16:46:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yL+a=BD=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jz0qH-00015t-SI
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 16:46:41 +0000
X-Inumbo-ID: 3bc132a8-cdcd-11ea-8855-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bc132a8-cdcd-11ea-8855-bc764e2007e4;
 Fri, 24 Jul 2020 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H2uqJkwBIHNcPC9n5mPbNITBzlMI1bcGzPfXQlHr/2Q=; b=myW6af7AGCR6JlaXt0pQ5VLzmL
 iSGR873513AZ/o71AaEhr3uit+/VpAo1rgTSVd2aVTmL3LTPyXDV4OlxDasbHwGuLFgNuUo/Sp5xT
 4sIbY3Jv5b4X+ez57kz+SDnWecTLi6aouKDiWKLYmx8CNgbi9vCNJgo573SoB9Z+WJ3s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jz0q9-00054p-8e; Fri, 24 Jul 2020 16:46:33 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jz0q9-0006WL-11; Fri, 24 Jul 2020 16:46:33 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 6/6] iommu: stop calling IOMMU page tables 'p2m tables'
Date: Fri, 24 Jul 2020 17:46:19 +0100
Message-Id: <20200724164619.1245-7-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724164619.1245-1-paul@xen.org>
References: <20200724164619.1245-1-paul@xen.org>
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

NOTE: There's also a bit of cosmetic clean-up in iommu_dump_page_tables()
      to make use of %pd.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>
---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 16 +++++++-------
 xen/drivers/passthrough/iommu.c             | 12 +++++------
 xen/drivers/passthrough/vtd/iommu.c         | 24 +++++++++------------
 xen/include/xen/iommu.h                     |  2 +-
 4 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index fd9b1e7bd5..112bd3eb37 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -499,8 +499,8 @@ static int amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 
 #include <asm/io_apic.h>
 
-static void amd_dump_p2m_table_level(struct page_info* pg, int level, 
-                                     paddr_t gpa, int indent)
+static void amd_dump_page_table_level(struct page_info* pg, int level,
+                                      paddr_t gpa, int indent)
 {
     paddr_t address;
     struct amd_iommu_pte *table_vaddr;
@@ -537,7 +537,7 @@ static void amd_dump_p2m_table_level(struct page_info* pg, int level,
 
         address = gpa + amd_offset_level_address(index, level);
         if ( pde->next_level >= 1 )
-            amd_dump_p2m_table_level(
+            amd_dump_page_table_level(
                 mfn_to_page(_mfn(pde->mfn)), pde->next_level,
                 address, indent + 1);
         else
@@ -550,16 +550,16 @@ static void amd_dump_p2m_table_level(struct page_info* pg, int level,
     unmap_domain_page(table_vaddr);
 }
 
-static void amd_dump_p2m_table(struct domain *d)
+static void amd_dump_page_tables(struct domain *d)
 {
     const struct domain_iommu *hd = dom_iommu(d);
 
     if ( !hd->arch.amd_iommu.root_table )
         return;
 
-    printk("p2m table has %d levels\n", hd->arch.amd_iommu.paging_mode);
-    amd_dump_p2m_table_level(hd->arch.amd_iommu.root_table,
-                             hd->arch.amd_iommu.paging_mode, 0, 0);
+    printk("table has %d levels\n", hd->arch.amd_iommu.paging_mode);
+    amd_dump_page_table_level(hd->arch.amd_iommu.root_table,
+                              hd->arch.amd_iommu.paging_mode, 0, 0);
 }
 
 static const struct iommu_ops __initconstrel _iommu_ops = {
@@ -586,7 +586,7 @@ static const struct iommu_ops __initconstrel _iommu_ops = {
     .suspend = amd_iommu_suspend,
     .resume = amd_iommu_resume,
     .crash_shutdown = amd_iommu_crash_shutdown,
-    .dump_p2m_table = amd_dump_p2m_table,
+    .dump_page_tables = amd_dump_page_tables,
 };
 
 static const struct iommu_init_ops __initconstrel _iommu_init_ops = {
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 6a3803ff2c..5bc190bf98 100644
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
@@ -513,7 +513,7 @@ bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
     return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features);
 }
 
-static void iommu_dump_p2m_table(unsigned char key)
+static void iommu_dump_page_tables(unsigned char key)
 {
     struct domain *d;
     const struct iommu_ops *ops;
@@ -535,12 +535,12 @@ static void iommu_dump_p2m_table(unsigned char key)
 
         if ( iommu_use_hap_pt(d) )
         {
-            printk("\ndomain%d IOMMU p2m table shared with MMU: \n", d->domain_id);
+            printk("%pd: IOMMU page tables shared with MMU\n", d);
             continue;
         }
 
-        printk("\ndomain%d IOMMU p2m table: \n", d->domain_id);
-        ops->dump_p2m_table(d);
+        printk("%pd: IOMMU page tables: \n", d);
+        ops->dump_page_tables(d);
     }
 
     rcu_read_unlock(&domlist_read_lock);
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index d09ca3fb3d..82d7eb6224 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2545,8 +2545,8 @@ static void vtd_resume(void)
     }
 }
 
-static void vtd_dump_p2m_table_level(paddr_t pt_maddr, int level, paddr_t gpa, 
-                                     int indent)
+static void vtd_dump_page_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
+                                      int indent)
 {
     paddr_t address;
     int i;
@@ -2575,8 +2575,8 @@ static void vtd_dump_p2m_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
 
         address = gpa + offset_level_address(i, level);
         if ( next_level >= 1 ) 
-            vtd_dump_p2m_table_level(dma_pte_addr(*pte), next_level, 
-                                     address, indent + 1);
+            vtd_dump_page_table_level(dma_pte_addr(*pte), next_level,
+                                      address, indent + 1);
         else
             printk("%*sdfn: %08lx mfn: %08lx\n",
                    indent, "",
@@ -2587,17 +2587,13 @@ static void vtd_dump_p2m_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
     unmap_vtd_domain_page(pt_vaddr);
 }
 
-static void vtd_dump_p2m_table(struct domain *d)
+static void vtd_dump_page_tables(struct domain *d)
 {
-    const struct domain_iommu *hd;
+    const struct domain_iommu *hd = dom_iommu(d);
 
-    if ( list_empty(&acpi_drhd_units) )
-        return;
-
-    hd = dom_iommu(d);
-    printk("p2m table has %d levels\n", agaw_to_level(hd->arch.vtd.agaw));
-    vtd_dump_p2m_table_level(hd->arch.vtd.pgd_maddr,
-                             agaw_to_level(hd->arch.vtd.agaw), 0, 0);
+    printk("table has %d levels\n", agaw_to_level(hd->arch.vtd.agaw));
+    vtd_dump_page_table_level(hd->arch.vtd.pgd_maddr,
+                              agaw_to_level(hd->arch.vtd.agaw), 0, 0);
 }
 
 static int __init intel_iommu_quarantine_init(struct domain *d)
@@ -2686,7 +2682,7 @@ static struct iommu_ops __initdata vtd_ops = {
     .iotlb_flush = iommu_flush_iotlb_pages,
     .iotlb_flush_all = iommu_flush_iotlb_all,
     .get_reserved_device_memory = intel_iommu_get_reserved_device_memory,
-    .dump_p2m_table = vtd_dump_p2m_table,
+    .dump_page_tables = vtd_dump_page_tables,
 };
 
 const struct iommu_init_ops __initconstrel intel_iommu_init_ops = {
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index cc122fd10b..804b283c1b 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -272,7 +272,7 @@ struct iommu_ops {
                                     unsigned int flush_flags);
     int __must_check (*iotlb_flush_all)(struct domain *d);
     int (*get_reserved_device_memory)(iommu_grdm_t *, void *);
-    void (*dump_p2m_table)(struct domain *d);
+    void (*dump_page_tables)(struct domain *d);
 
 #ifdef CONFIG_HAS_DEVICE_TREE
     /*
-- 
2.20.1


