Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0020023BBC9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 16:10:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2xdZ-0002sl-SR; Tue, 04 Aug 2020 14:09:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hzL0=BO=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k2xdY-0002sb-8N
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 14:09:52 +0000
X-Inumbo-ID: 3063303c-812f-4369-bd1a-e5783ee241cb
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3063303c-812f-4369-bd1a-e5783ee241cb;
 Tue, 04 Aug 2020 14:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AKVB45EUCXOkdgrC6CNoKokTirVUG6f1cqctimQSqX0=; b=I9AuG1SkfAZr8sUbD0vACgKtuq
 3oaXtPm1URuBFWqFxWbPZ39rnNv/6tJv8ms1v/iBhmORl++Dr/10waHWR/XtmTIIq8My4UENUr+1T
 NS52tIJkDUPvobIlEofy5gQPNFrF+c7dnZVDa/RxcF9AU2j2Lhiudv1sxH1SAjtI0Bi8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2xdW-0000Nb-Dl; Tue, 04 Aug 2020 14:09:50 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2xD3-0003ag-8F; Tue, 04 Aug 2020 13:42:29 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 13/14] vtd: use a bit field for context_entry
Date: Tue,  4 Aug 2020 14:42:08 +0100
Message-Id: <20200804134209.8717-14-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200804134209.8717-1-paul@xen.org>
References: <20200804134209.8717-1-paul@xen.org>
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
Cc: Paul Durrant <pdurrant@amazon.com>, Kevin Tian <kevin.tian@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

This removes the need for much shifting, masking and several magic numbers.
On the whole it makes the code quite a bit more readable.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Kevin Tian <kevin.tian@intel.com>

v4:
 - New in v4
---
 xen/drivers/passthrough/vtd/iommu.c   |  8 ++--
 xen/drivers/passthrough/vtd/iommu.h   | 65 +++++++++++++++++----------
 xen/drivers/passthrough/vtd/utils.c   |  6 +--
 xen/drivers/passthrough/vtd/x86/ats.c |  2 +-
 4 files changed, 49 insertions(+), 32 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 76025f6ccd..766d33058e 100644
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
@@ -121,7 +119,7 @@ static int context_set_domain_id(struct context_entry *context,
     }
 
     set_bit(i, iommu->domid_bitmap);
-    context->hi |= (i & ((1 << DID_FIELD_WIDTH) - 1)) << DID_HIGH_OFFSET;
+    context_set_did(*context, i);
     return 0;
 }
 
@@ -135,7 +133,7 @@ static int context_get_domain_id(struct context_entry *context,
     {
         nr_dom = cap_ndoms(iommu->cap);
 
-        dom_index = context_domain_id(*context);
+        dom_index = context_did(*context);
 
         if ( dom_index < nr_dom && iommu->domid_map )
             domid = iommu->domid_map[dom_index];
@@ -1396,7 +1394,7 @@ int domain_context_mapping_one(
             return -ENOMEM;
         }
 
-        context_set_address_root(*context, pgd_maddr);
+        context_set_slptp(*context, pgd_maddr);
         if ( ats_enabled && ecap_dev_iotlb(iommu->ecap) )
             context_set_translation_type(*context, CONTEXT_TT_DEV_IOTLB);
         else
diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/vtd/iommu.h
index 031ac5f66c..509d13918a 100644
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -199,6 +199,7 @@ struct root_entry {
         };
     };
 };
+#define ROOT_ENTRY_NR (PAGE_SIZE_4K / sizeof(struct root_entry))
 
 #define root_present(r) (r).p
 #define set_root_present(r) do { (r).p = 1; } while (0)
@@ -208,35 +209,53 @@ struct root_entry {
     do { (r).ctp = ((val) >> PAGE_SHIFT_4K); } while (0)
 
 struct context_entry {
-    u64 lo;
-    u64 hi;
+    union {
+        __uint128_t val;
+        struct { uint64_t lo, hi; };
+        struct {
+            /* 0 - 63 */
+            uint64_t p:1;
+            uint64_t fpd:1;
+            uint64_t tt:2;
+            uint64_t reserved0:8;
+            uint64_t slptp:52;
+
+            /* 64 - 127 */
+            uint64_t aw:3;
+            uint64_t ignored:4;
+            uint64_t reserved1:1;
+            uint64_t did:16;
+            uint64_t reserved2:40;
+        };
+    };
 };
-#define ROOT_ENTRY_NR (PAGE_SIZE_4K/sizeof(struct root_entry))
-#define context_present(c) ((c).lo & 1)
-#define context_fault_disable(c) (((c).lo >> 1) & 1)
-#define context_translation_type(c) (((c).lo >> 2) & 3)
-#define context_address_root(c) ((c).lo & PAGE_MASK_4K)
-#define context_address_width(c) ((c).hi &  7)
-#define context_domain_id(c) (((c).hi >> 8) & ((1 << 16) - 1))
-
-#define context_set_present(c) do {(c).lo |= 1;} while(0)
-#define context_clear_present(c) do {(c).lo &= ~1;} while(0)
-#define context_set_fault_enable(c) \
-    do {(c).lo &= (((u64)-1) << 2) | 1;} while(0)
-
-#define context_set_translation_type(c, val) do { \
-        (c).lo &= (((u64)-1) << 4) | 3; \
-        (c).lo |= (val & 3) << 2; \
-    } while(0)
+
+#define context_present(c) (c).p
+#define context_set_present(c) do { (c).p = 1; } while (0)
+#define context_clear_present(c) do { (c).p = 0; } while (0)
+
+#define context_fault_disable(c) (c).fpd
+#define context_set_fault_enable(c) do { (c).fpd = 1; } while (0)
+
+#define context_translation_type(c) (c).tt
+#define context_set_translation_type(c, val) do { (c).tt = val; } while (0)
 #define CONTEXT_TT_MULTI_LEVEL 0
 #define CONTEXT_TT_DEV_IOTLB   1
 #define CONTEXT_TT_PASS_THRU   2
 
-#define context_set_address_root(c, val) \
-    do {(c).lo &= 0xfff; (c).lo |= (val) & PAGE_MASK_4K ;} while(0)
+#define context_slptp(c) ((c).slptp << PAGE_SHIFT_4K)
+#define context_set_slptp(c, val) \
+    do { (c).slptp = (val) >> PAGE_SHIFT_4K; } while (0)
+
+#define context_address_width(c) (c).aw
 #define context_set_address_width(c, val) \
-    do {(c).hi &= 0xfffffff8; (c).hi |= (val) & 7;} while(0)
-#define context_clear_entry(c) do {(c).lo = 0; (c).hi = 0;} while(0)
+    do { (c).aw = (val); } while (0)
+
+#define context_did(c) (c).did
+#define context_set_did(c, val) \
+    do { (c).did = (val); } while (0)
+
+#define context_clear_entry(c) do { (c).val = 0; } while (0)
 
 /* page table handling */
 #define LEVEL_STRIDE       (9)
diff --git a/xen/drivers/passthrough/vtd/utils.c b/xen/drivers/passthrough/vtd/utils.c
index 4c85242894..eae0c43269 100644
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -129,9 +129,8 @@ void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn)
         return;
     }
 
-    val = ctxt_entry[devfn].lo;
-    printk("    context[%02x] = %"PRIx64"_%"PRIx64"\n",
-           devfn, ctxt_entry[devfn].hi, val);
+    printk("    context[%02x] = %"PRIx64"_%"PRIx64"\n", devfn,
+           ctxt_entry[devfn].hi, ctxt_entry[devfn].lo);
     if ( !context_present(ctxt_entry[devfn]) )
     {
         unmap_vtd_domain_page(ctxt_entry);
@@ -140,6 +139,7 @@ void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn)
     }
 
     level = agaw_to_level(context_address_width(ctxt_entry[devfn]));
+    val = context_slptp(ctxt_entry[devfn]);
     unmap_vtd_domain_page(ctxt_entry);
     if ( level != VTD_PAGE_TABLE_LEVEL_3 &&
          level != VTD_PAGE_TABLE_LEVEL_4)
diff --git a/xen/drivers/passthrough/vtd/x86/ats.c b/xen/drivers/passthrough/vtd/x86/ats.c
index 8369415dcc..a7bbd3198a 100644
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -92,7 +92,7 @@ static bool device_in_domain(const struct vtd_iommu *iommu,
 
     context_entries = map_vtd_domain_page(root_ctp(*root_entry));
     context_entry = &context_entries[pdev->devfn];
-    if ( context_domain_id(*context_entry) != did )
+    if ( context_did(*context_entry) != did )
         goto out;
 
     tt = context_translation_type(*context_entry);
-- 
2.20.1


