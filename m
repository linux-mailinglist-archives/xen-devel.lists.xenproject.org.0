Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4D52BAB08
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 14:25:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32190.63213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg6PF-0001rw-7E; Fri, 20 Nov 2020 13:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32190.63213; Fri, 20 Nov 2020 13:24:53 +0000
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
	id 1kg6PE-0001qB-Oh; Fri, 20 Nov 2020 13:24:52 +0000
Received: by outflank-mailman (input) for mailman id 32190;
 Fri, 20 Nov 2020 13:24:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kg6PD-0001nz-6n
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 13:24:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg6PB-0007DL-Qk; Fri, 20 Nov 2020 13:24:49 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg6PB-00028m-J9; Fri, 20 Nov 2020 13:24:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6PD-0001nz-6n
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 13:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=ot0EG7c7zJPZbN0sn3F+EUwxX2ndYclESdsFvCm5FbA=; b=n/nhi0UcrYGr5J0hwUOdprtcQ+
	gt77c4QRRa+jPxO/Wl3xhDTvzujADk7/SZOX1OWQlKEMpb0Hqcx7wybCXD7Lo6GpwCXJJpR7XdvOt
	pWVAbA88UKbbLKORG/g8wV0cft+H7Uiekh7e1as86tNm+6QR/bLgQnNIaABAntFJ2QKc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6PB-0007DL-Qk; Fri, 20 Nov 2020 13:24:49 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6PB-00028m-J9; Fri, 20 Nov 2020 13:24:49 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v10 5/7] vtd: use a bit field for root_entry
Date: Fri, 20 Nov 2020 13:24:38 +0000
Message-Id: <20201120132440.1141-6-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201120132440.1141-1-paul@xen.org>
References: <20201120132440.1141-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

This makes the code a little easier to read and also makes it more consistent
with iremap_entry.

Also take the opportunity to tidy up the implementation of device_in_domain().

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Kevin Tian <kevin.tian@intel.com>

v10:
 - Small tweaks requested by Jan
 - Remove macros in favour of direct field access
 - Add missing barrier

v4:
 - New in v4
---
 xen/drivers/passthrough/vtd/iommu.c   |  9 +++++----
 xen/drivers/passthrough/vtd/iommu.h   | 25 ++++++++++++-------------
 xen/drivers/passthrough/vtd/utils.c   |  6 +++---
 xen/drivers/passthrough/vtd/x86/ats.c | 27 +++++++++++++++------------
 4 files changed, 35 insertions(+), 32 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index d136fe36883b..1a038541f0a3 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -237,7 +237,7 @@ static u64 bus_to_context_maddr(struct vtd_iommu *iommu, u8 bus)
     ASSERT(spin_is_locked(&iommu->lock));
     root_entries = (struct root_entry *)map_vtd_domain_page(iommu->root_maddr);
     root = &root_entries[bus];
-    if ( !root_present(*root) )
+    if ( !root->p )
     {
         maddr = alloc_pgtable_maddr(1, iommu->node);
         if ( maddr == 0 )
@@ -245,11 +245,12 @@ static u64 bus_to_context_maddr(struct vtd_iommu *iommu, u8 bus)
             unmap_vtd_domain_page(root_entries);
             return 0;
         }
-        set_root_value(*root, maddr);
-        set_root_present(*root);
+        root->ctp = paddr_to_pfn(maddr);
+        smp_wmb();
+        root->p = true;
         iommu_sync_cache(root, sizeof(struct root_entry));
     }
-    maddr = (u64) get_context_addr(*root);
+    maddr = pfn_to_paddr(root->ctp);
     unmap_vtd_domain_page(root_entries);
     return maddr;
 }
diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/vtd/iommu.h
index 216791b3d634..b14628eec260 100644
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -184,21 +184,20 @@
 #define dma_frcd_source_id(c) (c & 0xffff)
 #define dma_frcd_page_addr(d) (d & (((u64)-1) << 12)) /* low 64 bit */
 
-/*
- * 0: Present
- * 1-11: Reserved
- * 12-63: Context Ptr (12 - (haw-1))
- * 64-127: Reserved
- */
 struct root_entry {
-    u64    val;
-    u64    rsvd1;
+    union {
+        struct { uint64_t lo, hi; };
+        struct {
+            /* 0 - 63 */
+            bool p:1;
+            unsigned int reserved0:11;
+            uint64_t ctp:52;
+
+            /* 64 - 127 */
+            uint64_t reserved1;
+        };
+    };
 };
-#define root_present(root)    ((root).val & 1)
-#define set_root_present(root) do {(root).val |= 1;} while(0)
-#define get_context_addr(root) ((root).val & PAGE_MASK_4K)
-#define set_root_value(root, value) \
-    do {(root).val |= ((value) & PAGE_MASK_4K);} while(0)
 
 struct context_entry {
     u64 lo;
diff --git a/xen/drivers/passthrough/vtd/utils.c b/xen/drivers/passthrough/vtd/utils.c
index 4febcf506d8a..5f25a86a535c 100644
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -112,15 +112,15 @@ void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn)
         return;
     }
 
-    printk("    root_entry[%02x] = %"PRIx64"\n", bus, root_entry[bus].val);
-    if ( !root_present(root_entry[bus]) )
+    printk("    root_entry[%02x] = %"PRIx64"\n", bus, root_entry[bus].lo);
+    if ( !root_entry[bus].p )
     {
         unmap_vtd_domain_page(root_entry);
         printk("    root_entry[%02x] not present\n", bus);
         return;
     }
 
-    val = root_entry[bus].val;
+    val = pfn_to_paddr(root_entry[bus].ctp);
     unmap_vtd_domain_page(root_entry);
     ctxt_entry = map_vtd_domain_page(val);
     if ( ctxt_entry == NULL )
diff --git a/xen/drivers/passthrough/vtd/x86/ats.c b/xen/drivers/passthrough/vtd/x86/ats.c
index 04d702b1d6b1..fec969ef75bb 100644
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -74,8 +74,8 @@ int ats_device(const struct pci_dev *pdev, const struct acpi_drhd_unit *drhd)
 static bool device_in_domain(const struct vtd_iommu *iommu,
                              const struct pci_dev *pdev, uint16_t did)
 {
-    struct root_entry *root_entry;
-    struct context_entry *ctxt_entry = NULL;
+    struct root_entry *root_entry, *root_entries;
+    struct context_entry *context_entry, *context_entries = NULL;
     unsigned int tt;
     bool found = false;
 
@@ -85,25 +85,28 @@ static bool device_in_domain(const struct vtd_iommu *iommu,
         return false;
     }
 
-    root_entry = map_vtd_domain_page(iommu->root_maddr);
-    if ( !root_present(root_entry[pdev->bus]) )
+    root_entries = (struct root_entry *)map_vtd_domain_page(iommu->root_maddr);
+    root_entry = &root_entries[pdev->bus];
+    if ( !root_entry->p )
         goto out;
 
-    ctxt_entry = map_vtd_domain_page(root_entry[pdev->bus].val);
-    if ( context_domain_id(ctxt_entry[pdev->devfn]) != did )
+    context_entries = map_vtd_domain_page(root_entry->ctp);
+    context_entry = &context_entries[pdev->devfn];
+    if ( context_domain_id(*context_entry) != did )
         goto out;
 
-    tt = context_translation_type(ctxt_entry[pdev->devfn]);
+    tt = context_translation_type(*context_entry);
     if ( tt != CONTEXT_TT_DEV_IOTLB )
         goto out;
 
     found = true;
-out:
-    if ( root_entry )
-        unmap_vtd_domain_page(root_entry);
 
-    if ( ctxt_entry )
-        unmap_vtd_domain_page(ctxt_entry);
+ out:
+    if ( root_entries )
+        unmap_vtd_domain_page(root_entries);
+
+    if ( context_entries )
+        unmap_vtd_domain_page(context_entries);
 
     return found;
 }
-- 
2.20.1


