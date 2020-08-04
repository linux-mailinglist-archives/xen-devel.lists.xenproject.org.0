Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3243223BBCD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 16:10:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2xde-0002tR-Mj; Tue, 04 Aug 2020 14:09:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hzL0=BO=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k2xdd-0002sc-A8
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 14:09:57 +0000
X-Inumbo-ID: 90780af9-081f-42d5-b893-424c160e7350
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90780af9-081f-42d5-b893-424c160e7350;
 Tue, 04 Aug 2020 14:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vAf8F1azmxpSkAU8hG593+fhhZfmNP3RoDkUnJJss0w=; b=prve2la1ewe4a9OxTHH6gPrFEH
 B8TkYPdb3iFIQ0Coz6PZg3AyB6HjvJicebvoBR2FVNF5sppLB4XJAi6sDhatxMD481BMYm6q7fxSU
 2gYS9iPcBoiB7BgdzLp1yhooNMLSDRqU/3UQxHE7R+AXPdtX5ofGA+VhRA/Q9nZRhkSY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2xdW-0000NZ-Bq; Tue, 04 Aug 2020 14:09:50 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2xD2-0003ag-Eg; Tue, 04 Aug 2020 13:42:28 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 12/14] vtd: use a bit field for root_entry
Date: Tue,  4 Aug 2020 14:42:07 +0100
Message-Id: <20200804134209.8717-13-paul@xen.org>
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

This makes the code a little easier to read and also makes it more consistent
with iremap_entry.

Also take the opportunity to tidy up the implementation of device_in_domain().

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Kevin Tian <kevin.tian@intel.com>

v4:
 - New in v4
---
 xen/drivers/passthrough/vtd/iommu.c   |  4 ++--
 xen/drivers/passthrough/vtd/iommu.h   | 33 ++++++++++++++++-----------
 xen/drivers/passthrough/vtd/utils.c   |  4 ++--
 xen/drivers/passthrough/vtd/x86/ats.c | 27 ++++++++++++----------
 4 files changed, 39 insertions(+), 29 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index f8da4fe0e7..76025f6ccd 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -245,11 +245,11 @@ static u64 bus_to_context_maddr(struct vtd_iommu *iommu, u8 bus)
             unmap_vtd_domain_page(root_entries);
             return 0;
         }
-        set_root_value(*root, maddr);
+        set_root_ctp(*root, maddr);
         set_root_present(*root);
         iommu_sync_cache(root, sizeof(struct root_entry));
     }
-    maddr = (u64) get_context_addr(*root);
+    maddr = root_ctp(*root);
     unmap_vtd_domain_page(root_entries);
     return maddr;
 }
diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/vtd/iommu.h
index 216791b3d6..031ac5f66c 100644
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -184,21 +184,28 @@
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
+        __uint128_t val;
+        struct { uint64_t lo, hi; };
+        struct {
+            /* 0 - 63 */
+            uint64_t p:1;
+            uint64_t reserved0:11;
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
+
+#define root_present(r) (r).p
+#define set_root_present(r) do { (r).p = 1; } while (0)
+
+#define root_ctp(r) ((r).ctp << PAGE_SHIFT_4K)
+#define set_root_ctp(r, val) \
+    do { (r).ctp = ((val) >> PAGE_SHIFT_4K); } while (0)
 
 struct context_entry {
     u64 lo;
diff --git a/xen/drivers/passthrough/vtd/utils.c b/xen/drivers/passthrough/vtd/utils.c
index 4febcf506d..4c85242894 100644
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -112,7 +112,7 @@ void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn)
         return;
     }
 
-    printk("    root_entry[%02x] = %"PRIx64"\n", bus, root_entry[bus].val);
+    printk("    root_entry[%02x] = %"PRIx64"\n", bus, root_entry[bus].lo);
     if ( !root_present(root_entry[bus]) )
     {
         unmap_vtd_domain_page(root_entry);
@@ -120,7 +120,7 @@ void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn)
         return;
     }
 
-    val = root_entry[bus].val;
+    val = root_ctp(root_entry[bus]);
     unmap_vtd_domain_page(root_entry);
     ctxt_entry = map_vtd_domain_page(val);
     if ( ctxt_entry == NULL )
diff --git a/xen/drivers/passthrough/vtd/x86/ats.c b/xen/drivers/passthrough/vtd/x86/ats.c
index 04d702b1d6..8369415dcc 100644
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -74,8 +74,8 @@ int ats_device(const struct pci_dev *pdev, const struct acpi_drhd_unit *drhd)
 static bool device_in_domain(const struct vtd_iommu *iommu,
                              const struct pci_dev *pdev, uint16_t did)
 {
-    struct root_entry *root_entry;
-    struct context_entry *ctxt_entry = NULL;
+    struct root_entry *root_entry, *root_entries = NULL;
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
+    if ( !root_present(*root_entry) )
         goto out;
 
-    ctxt_entry = map_vtd_domain_page(root_entry[pdev->bus].val);
-    if ( context_domain_id(ctxt_entry[pdev->devfn]) != did )
+    context_entries = map_vtd_domain_page(root_ctp(*root_entry));
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


