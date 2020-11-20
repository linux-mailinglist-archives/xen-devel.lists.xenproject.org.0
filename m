Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25BB2BAB0C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 14:25:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32191.63223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg6PG-0001uc-1M; Fri, 20 Nov 2020 13:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32191.63223; Fri, 20 Nov 2020 13:24:53 +0000
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
	id 1kg6PF-0001sk-OT; Fri, 20 Nov 2020 13:24:53 +0000
Received: by outflank-mailman (input) for mailman id 32191;
 Fri, 20 Nov 2020 13:24:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kg6PE-0001pm-3O
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 13:24:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg6PC-0007DU-Ki; Fri, 20 Nov 2020 13:24:50 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg6PC-00028m-D4; Fri, 20 Nov 2020 13:24:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6PE-0001pm-3O
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 13:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=m/FA9f+1NMog7KtW7VWghtLgO7OJlubNnvmswOBT8GE=; b=KNufUPXE/aiJSp3zDmY1xVcVhO
	5Tx3Oo7U0YZNC3A6EzoDlIfdJAD2iepFY1bwqZJJ+EEaYyGciqS0aUwB+6Mbd3wONHciGrAp5IMRt
	qoGjnjnQXlUEIhNB4su0r/nDuYYGcPhS4/9nDqvj2xkuneJTyFwsH9uAF7mvPXf8I5Jg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6PC-0007DU-Ki; Fri, 20 Nov 2020 13:24:50 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6PC-00028m-D4; Fri, 20 Nov 2020 13:24:50 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v10 6/7] vtd: use a bit field for context_entry
Date: Fri, 20 Nov 2020 13:24:39 +0000
Message-Id: <20201120132440.1141-7-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201120132440.1141-1-paul@xen.org>
References: <20201120132440.1141-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

This removes the need for much shifting, masking and several magic numbers.
On the whole it makes the code quite a bit more readable.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Kevin Tian <kevin.tian@intel.com>

v10:
 - Remove macros in favour of direct field access
 - Adjust field types
 - Add missing barriers

v4:
 - New in v4
---
 xen/drivers/passthrough/vtd/iommu.c   | 36 +++++++++++----------
 xen/drivers/passthrough/vtd/iommu.h   | 45 +++++++++++++--------------
 xen/drivers/passthrough/vtd/utils.c   | 10 +++---
 xen/drivers/passthrough/vtd/x86/ats.c |  6 ++--
 4 files changed, 47 insertions(+), 50 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 1a038541f0a3..fdb472ad6515 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -86,8 +86,6 @@ static int domain_iommu_domid(struct domain *d,
     return -1;
 }
 
-#define DID_FIELD_WIDTH 16
-#define DID_HIGH_OFFSET 8
 static int context_set_domain_id(struct context_entry *context,
                                  struct domain *d,
                                  struct vtd_iommu *iommu)
@@ -121,21 +119,22 @@ static int context_set_domain_id(struct context_entry *context,
     }
 
     set_bit(i, iommu->domid_bitmap);
-    context->hi |= (i & ((1 << DID_FIELD_WIDTH) - 1)) << DID_HIGH_OFFSET;
+    context->did = i;
+
     return 0;
 }
 
 static int context_get_domain_id(struct context_entry *context,
                                  struct vtd_iommu *iommu)
 {
-    unsigned long dom_index, nr_dom;
     int domid = -1;
 
     if (iommu && context)
     {
-        nr_dom = cap_ndoms(iommu->cap);
+        unsigned long dom_index, nr_dom;
 
-        dom_index = context_domain_id(*context);
+        nr_dom = cap_ndoms(iommu->cap);
+        dom_index = context->did;
 
         if ( dom_index < nr_dom && iommu->domid_map )
             domid = iommu->domid_map[dom_index];
@@ -1338,7 +1337,7 @@ int domain_context_mapping_one(
     context_entries = (struct context_entry *)map_vtd_domain_page(maddr);
     context = &context_entries[devfn];
 
-    if ( context_present(*context) )
+    if ( context->p )
     {
         int res = 0;
 
@@ -1382,7 +1381,7 @@ int domain_context_mapping_one(
 
     if ( iommu_hwdom_passthrough && is_hardware_domain(domain) )
     {
-        context_set_translation_type(*context, CONTEXT_TT_PASS_THRU);
+        context->tt = CONTEXT_TT_PASS_THRU;
     }
     else
     {
@@ -1397,11 +1396,11 @@ int domain_context_mapping_one(
             return -ENOMEM;
         }
 
-        context_set_address_root(*context, pgd_maddr);
+        context->slptptr = paddr_to_pfn(pgd_maddr);
         if ( ats_enabled && ecap_dev_iotlb(iommu->ecap) )
-            context_set_translation_type(*context, CONTEXT_TT_DEV_IOTLB);
+            context->tt = CONTEXT_TT_DEV_IOTLB;
         else
-            context_set_translation_type(*context, CONTEXT_TT_MULTI_LEVEL);
+            context->tt = CONTEXT_TT_MULTI_LEVEL;
 
         spin_unlock(&hd->arch.mapping_lock);
     }
@@ -1413,9 +1412,10 @@ int domain_context_mapping_one(
         return -EFAULT;
     }
 
-    context_set_address_width(*context, level_to_agaw(iommu->nr_pt_levels));
-    context_set_fault_enable(*context);
-    context_set_present(*context);
+    context->aw = level_to_agaw(iommu->nr_pt_levels);
+    context->fpd = false;
+    smp_wmb();
+    context->p = true;
     iommu_sync_cache(context, sizeof(struct context_entry));
     spin_unlock(&iommu->lock);
 
@@ -1567,17 +1567,19 @@ int domain_context_unmap_one(
     context_entries = (struct context_entry *)map_vtd_domain_page(maddr);
     context = &context_entries[devfn];
 
-    if ( !context_present(*context) )
+    if ( !context->p )
     {
         spin_unlock(&iommu->lock);
         unmap_vtd_domain_page(context_entries);
         return 0;
     }
 
-    context_clear_present(*context);
-    context_clear_entry(*context);
+    context->p = false;
+    smp_wmb();
     iommu_sync_cache(context, sizeof(struct context_entry));
 
+    context->val = 0; /* No need to sync; present bit is already cleared */
+
     iommu_domid= domain_iommu_domid(domain, iommu);
     if ( iommu_domid == -1 )
     {
diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/vtd/iommu.h
index b14628eec260..33b1abf98526 100644
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -198,37 +198,34 @@ struct root_entry {
         };
     };
 };
+#define ROOT_ENTRY_NR (PAGE_SIZE_4K / sizeof(struct root_entry))
 
 struct context_entry {
-    u64 lo;
-    u64 hi;
-};
-#define ROOT_ENTRY_NR (PAGE_SIZE_4K/sizeof(struct root_entry))
-#define context_present(c) ((c).lo & 1)
-#define context_fault_disable(c) (((c).lo >> 1) & 1)
-#define context_translation_type(c) (((c).lo >> 2) & 3)
-#define context_address_root(c) ((c).lo & PAGE_MASK_4K)
-#define context_address_width(c) ((c).hi &  7)
-#define context_domain_id(c) (((c).hi >> 8) & ((1 << 16) - 1))
+    union {
+        __uint128_t val;
+        struct { uint64_t lo, hi; };
+        struct {
+            /* 0 - 63 */
+            bool p:1;
+            bool fpd:1;
+            uint64_t tt:2;
 
-#define context_set_present(c) do {(c).lo |= 1;} while(0)
-#define context_clear_present(c) do {(c).lo &= ~1;} while(0)
-#define context_set_fault_enable(c) \
-    do {(c).lo &= (((u64)-1) << 2) | 1;} while(0)
-
-#define context_set_translation_type(c, val) do { \
-        (c).lo &= (((u64)-1) << 4) | 3; \
-        (c).lo |= (val & 3) << 2; \
-    } while(0)
 #define CONTEXT_TT_MULTI_LEVEL 0
 #define CONTEXT_TT_DEV_IOTLB   1
 #define CONTEXT_TT_PASS_THRU   2
 
-#define context_set_address_root(c, val) \
-    do {(c).lo &= 0xfff; (c).lo |= (val) & PAGE_MASK_4K ;} while(0)
-#define context_set_address_width(c, val) \
-    do {(c).hi &= 0xfffffff8; (c).hi |= (val) & 7;} while(0)
-#define context_clear_entry(c) do {(c).lo = 0; (c).hi = 0;} while(0)
+            unsigned int reserved0:8;
+            uint64_t slptptr:52;
+
+            /* 64 - 127 */
+            unsigned int aw:3;
+            unsigned int ignored:4;
+            unsigned int reserved1:1;
+            unsigned int did:16;
+            uint64_t reserved2:40;
+        };
+    };
+};
 
 /* page table handling */
 #define LEVEL_STRIDE       (9)
diff --git a/xen/drivers/passthrough/vtd/utils.c b/xen/drivers/passthrough/vtd/utils.c
index 5f25a86a535c..4bca160bc663 100644
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -129,17 +129,17 @@ void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn)
         return;
     }
 
-    val = ctxt_entry[devfn].lo;
-    printk("    context[%02x] = %"PRIx64"_%"PRIx64"\n",
-           devfn, ctxt_entry[devfn].hi, val);
-    if ( !context_present(ctxt_entry[devfn]) )
+    printk("    context[%02x] = %"PRIx64"_%"PRIx64"\n", devfn,
+           ctxt_entry[devfn].hi, ctxt_entry[devfn].lo);
+    if ( !ctxt_entry[devfn].p )
     {
         unmap_vtd_domain_page(ctxt_entry);
         printk("    ctxt_entry[%02x] not present\n", devfn);
         return;
     }
 
-    level = agaw_to_level(context_address_width(ctxt_entry[devfn]));
+    level = agaw_to_level(ctxt_entry[devfn].aw);
+    val = pfn_to_paddr(ctxt_entry[devfn].slptptr);
     unmap_vtd_domain_page(ctxt_entry);
     if ( level != VTD_PAGE_TABLE_LEVEL_3 &&
          level != VTD_PAGE_TABLE_LEVEL_4)
diff --git a/xen/drivers/passthrough/vtd/x86/ats.c b/xen/drivers/passthrough/vtd/x86/ats.c
index fec969ef75bb..cb057ced3cf7 100644
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -76,7 +76,6 @@ static bool device_in_domain(const struct vtd_iommu *iommu,
 {
     struct root_entry *root_entry, *root_entries;
     struct context_entry *context_entry, *context_entries = NULL;
-    unsigned int tt;
     bool found = false;
 
     if ( unlikely(!iommu->root_maddr) )
@@ -92,11 +91,10 @@ static bool device_in_domain(const struct vtd_iommu *iommu,
 
     context_entries = map_vtd_domain_page(root_entry->ctp);
     context_entry = &context_entries[pdev->devfn];
-    if ( context_domain_id(*context_entry) != did )
+    if ( context_entry->did != did )
         goto out;
 
-    tt = context_translation_type(*context_entry);
-    if ( tt != CONTEXT_TT_DEV_IOTLB )
+    if ( context_entry->tt != CONTEXT_TT_DEV_IOTLB )
         goto out;
 
     found = true;
-- 
2.20.1


