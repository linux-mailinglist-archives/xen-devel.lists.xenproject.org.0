Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4890077BDB9
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 18:15:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583748.914048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVaDy-0008Vx-Ij; Mon, 14 Aug 2023 16:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583748.914048; Mon, 14 Aug 2023 16:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVaDy-0008U3-EJ; Mon, 14 Aug 2023 16:15:22 +0000
Received: by outflank-mailman (input) for mailman id 583748;
 Mon, 14 Aug 2023 16:15:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/QH=D7=amazon.co.uk=prvs=583beea50=hakor@srs-se1.protection.inumbo.net>)
 id 1qVaDw-0008Tx-Tb
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 16:15:20 +0000
Received: from smtp-fw-52003.amazon.com (smtp-fw-52003.amazon.com
 [52.119.213.152]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c206824e-3abd-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 18:15:18 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-bbc6e425.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-52003.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 16:15:16 +0000
Received: from EX19D017EUA002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1a-m6i4x-bbc6e425.us-east-1.amazon.com (Postfix)
 with ESMTPS id 3D3748048C; Mon, 14 Aug 2023 16:15:14 +0000 (UTC)
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D017EUA002.ant.amazon.com (10.252.50.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 14 Aug 2023 16:15:13 +0000
Received: from dev-dsk-hakor-1a-9589d7a9.eu-west-1.amazon.com (172.19.124.154)
 by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP Server
 id
 15.2.1118.30 via Frontend Transport; Mon, 14 Aug 2023 16:15:11 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c206824e-3abd-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1692029719; x=1723565719;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2SdF+oaPyEI3IdiS2ivOLJcGT7YZznHgotV+6Qx3WJg=;
  b=psv494HE/d8aBX2VPmHD0f2S0DTbpM+eLMy3Lqf22vU2GtQ3YZT4GdmH
   JBy4Er71tIc+F1LvmvUj3uArtDSqEJ49dOHxlwS2iJUmjXAURPUKDT8UT
   9i7OAfH9G6qpF0jXZixUPUqpPb/AaTfWUowx7rbFAxfiwFnp57KRlbhIg
   M=;
X-IronPort-AV: E=Sophos;i="6.01,173,1684800000"; 
   d="scan'208";a="601888521"
From: Ruben Hakobyan <hakor@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Ruben Hakobyan <hakor@amazon.com>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2] x86/msi: dynamically map pages for MSI-X tables
Date: Mon, 14 Aug 2023 16:15:02 +0000
Message-ID: <20230814161502.88394-1-hakor@amazon.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

Xen reserves a constant number of pages that can be used for mapping
MSI-X tables. This limit is defined by FIX_MSIX_MAX_PAGES in fixmap.h.

Reserving a fixed number of pages could result in an -ENOMEM if a
device requests a new page when the fixmap limit is exhausted and will
necessitate manually adjusting the limit before compilation.

To avoid the issues with the current fixmap implementation, we modify
the MSI-X page mapping logic to instead dynamically map new pages when
they are needed by making use of ioremap().

Note that this approach is not suitable for 32-bit architectures, where
the virtual address space is considerably smaller.

Signed-off-by: Ruben Hakobyan <hakor@amazon.com>
---
Changelog:
 * v2:
  - Updated the commit message to talk about the potential use on 32-bit architectures
  - Addressed the various comments for improving the code
---
 xen/arch/x86/include/asm/fixmap.h |  2 -
 xen/arch/x86/include/asm/msi.h    |  5 +--
 xen/arch/x86/msi.c                | 69 ++++++++-----------------------
 3 files changed, 18 insertions(+), 58 deletions(-)

diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index 516ec3fa6c..139c3e2dcc 100644
--- a/xen/arch/x86/include/asm/fixmap.h
+++ b/xen/arch/x86/include/asm/fixmap.h
@@ -61,8 +61,6 @@ enum fixed_addresses {
     FIX_ACPI_END = FIX_ACPI_BEGIN + NUM_FIXMAP_ACPI_PAGES - 1,
     FIX_HPET_BASE,
     FIX_TBOOT_SHARED_BASE,
-    FIX_MSIX_IO_RESERV_BASE,
-    FIX_MSIX_IO_RESERV_END = FIX_MSIX_IO_RESERV_BASE + FIX_MSIX_MAX_PAGES -1,
     FIX_TBOOT_MAP_ADDRESS,
     FIX_APEI_RANGE_BASE,
     FIX_APEI_RANGE_END = FIX_APEI_RANGE_BASE + FIX_APEI_RANGE_MAX -1,
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index a53ade95c9..16c80c9883 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -55,9 +55,6 @@
 #define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
 #define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MSI_ADDR_DEST_ID_MASK)
 
-/* MAX fixed pages reserved for mapping MSIX tables. */
-#define FIX_MSIX_MAX_PAGES              512
-
 struct msi_info {
     pci_sbdf_t sbdf;
     int irq;
@@ -213,7 +210,7 @@ struct arch_msix {
         unsigned long first, last;
     } table, pba;
     int table_refcnt[MAX_MSIX_TABLE_PAGES];
-    int table_idx[MAX_MSIX_TABLE_PAGES];
+    void __iomem *table_va[MAX_MSIX_TABLE_PAGES];
     spinlock_t table_lock;
     bool host_maskall, guest_maskall;
     domid_t warned;
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index d0bf63df1d..57a84b394a 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -24,7 +24,6 @@
 #include <asm/smp.h>
 #include <asm/desc.h>
 #include <asm/msi.h>
-#include <asm/fixmap.h>
 #include <asm/p2m.h>
 #include <mach_apic.h>
 #include <io_ports.h>
@@ -39,75 +38,45 @@ boolean_param("msi", use_msi);
 
 static void __pci_disable_msix(struct msi_desc *);
 
-/* bitmap indicate which fixed map is free */
-static DEFINE_SPINLOCK(msix_fixmap_lock);
-static DECLARE_BITMAP(msix_fixmap_pages, FIX_MSIX_MAX_PAGES);
-
-static int msix_fixmap_alloc(void)
-{
-    int i, rc = -ENOMEM;
-
-    spin_lock(&msix_fixmap_lock);
-    for ( i = 0; i < FIX_MSIX_MAX_PAGES; i++ )
-        if ( !test_bit(i, &msix_fixmap_pages) )
-            break;
-    if ( i == FIX_MSIX_MAX_PAGES )
-        goto out;
-    rc = FIX_MSIX_IO_RESERV_BASE + i;
-    set_bit(i, &msix_fixmap_pages);
-
- out:
-    spin_unlock(&msix_fixmap_lock);
-    return rc;
-}
-
-static void msix_fixmap_free(int idx)
-{
-    spin_lock(&msix_fixmap_lock);
-    if ( idx >= FIX_MSIX_IO_RESERV_BASE )
-        clear_bit(idx - FIX_MSIX_IO_RESERV_BASE, &msix_fixmap_pages);
-    spin_unlock(&msix_fixmap_lock);
-}
-
-static int msix_get_fixmap(struct arch_msix *msix, u64 table_paddr,
+static void __iomem *msix_get_entry(struct arch_msix *msix, u64 table_paddr,
                            u64 entry_paddr)
 {
     long nr_page;
-    int idx;
+    void __iomem *va = NULL;
 
     nr_page = (entry_paddr >> PAGE_SHIFT) - (table_paddr >> PAGE_SHIFT);
 
     if ( nr_page < 0 || nr_page >= MAX_MSIX_TABLE_PAGES )
-        return -EINVAL;
+        return NULL;
 
     spin_lock(&msix->table_lock);
     if ( msix->table_refcnt[nr_page]++ == 0 )
     {
-        idx = msix_fixmap_alloc();
-        if ( idx < 0 )
+        va = ioremap(round_pgdown(entry_paddr), PAGE_SIZE);
+        if ( va == NULL )
         {
             msix->table_refcnt[nr_page]--;
             goto out;
         }
-        set_fixmap_nocache(idx, entry_paddr);
-        msix->table_idx[nr_page] = idx;
+        msix->table_va[nr_page] = va;
     }
     else
-        idx = msix->table_idx[nr_page];
+        va = msix->table_va[nr_page];
 
  out:
     spin_unlock(&msix->table_lock);
-    return idx;
+    return va + (entry_paddr & ~PAGE_MASK);
 }
 
-static void msix_put_fixmap(struct arch_msix *msix, int idx)
+static void msix_put_entry(struct arch_msix *msix, const void __iomem *entry_va)
 {
     int i;
+    void __iomem *va = (void*)round_pgdown((unsigned long)entry_va);
 
     spin_lock(&msix->table_lock);
     for ( i = 0; i < MAX_MSIX_TABLE_PAGES; i++ )
     {
-        if ( msix->table_idx[i] == idx )
+        if ( msix->table_va[i] == va )
             break;
     }
     if ( i == MAX_MSIX_TABLE_PAGES )
@@ -115,9 +84,8 @@ static void msix_put_fixmap(struct arch_msix *msix, int idx)
 
     if ( --msix->table_refcnt[i] == 0 )
     {
-        clear_fixmap(idx);
-        msix_fixmap_free(idx);
-        msix->table_idx[i] = 0;
+        iounmap(va);
+        msix->table_va[i] = NULL;
     }
 
  out:
@@ -568,8 +536,7 @@ int msi_free_irq(struct msi_desc *entry)
     }
 
     if ( entry->msi_attrib.type == PCI_CAP_ID_MSIX )
-        msix_put_fixmap(entry->dev->msix,
-                        virt_to_fix((unsigned long)entry->mask_base));
+        msix_put_entry(entry->dev->msix, entry->mask_base);
 
     list_del(&entry->list);
     xfree(entry);
@@ -892,10 +859,9 @@ static int msix_capability_init(struct pci_dev *dev,
     {
         /* Map MSI-X table region */
         u64 entry_paddr = table_paddr + msi->entry_nr * PCI_MSIX_ENTRY_SIZE;
-        int idx = msix_get_fixmap(msix, table_paddr, entry_paddr);
-        void __iomem *base;
+        void __iomem *base = msix_get_entry(msix, table_paddr, entry_paddr);
 
-        if ( idx < 0 )
+        if ( base == NULL )
         {
             if ( zap_on_error )
             {
@@ -907,9 +873,8 @@ static int msix_capability_init(struct pci_dev *dev,
 
             pci_conf_write16(dev->sbdf, msix_control_reg(pos), control);
             xfree(entry);
-            return idx;
+            return -ENOMEM;
         }
-        base = fix_to_virt(idx) + (entry_paddr & (PAGE_SIZE - 1));
 
         /* Mask interrupt here */
         writel(1, base + PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET);
-- 
2.40.1


