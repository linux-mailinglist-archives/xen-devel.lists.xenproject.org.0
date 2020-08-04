Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCFC23BBCB
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 16:10:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2xda-0002sr-4f; Tue, 04 Aug 2020 14:09:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hzL0=BO=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k2xdY-0002sc-EL
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 14:09:52 +0000
X-Inumbo-ID: e6d1172f-13ce-442e-96b2-c2dfa8c30830
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6d1172f-13ce-442e-96b2-c2dfa8c30830;
 Tue, 04 Aug 2020 14:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IHm3gqKYAGKodBfFZkdVX7R/Bh2xcC6ZnjwhNY8umHs=; b=Ll5cp1FeUPCVrAHmjsFlUQiFRO
 8kbu9ol7KHkfVTGYi7UlsiYBPMnaZiiN2LKx9bqD+t+RoK/U7Lk8tY/pQ9n82DLDsr8rzndNldLax
 FXOeY2mjGGM0DNyJeplH1w3cDVPWb3Ec6nhARC8NauYN54qcCUcww31WRP8+yH5TNYKk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2xdW-0000NV-3W; Tue, 04 Aug 2020 14:09:50 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2xD4-0003ag-1m; Tue, 04 Aug 2020 13:42:30 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 14/14] vtd: use a bit field for dma_pte
Date: Tue,  4 Aug 2020 14:42:09 +0100
Message-Id: <20200804134209.8717-15-paul@xen.org>
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

As with a prior patch for context_entry, this removes the need for much
shifting, masking and several magic numbers.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Kevin Tian <kevin.tian@intel.com>

v4:
 - New in v4
---
 xen/drivers/passthrough/vtd/iommu.c |  9 ++---
 xen/drivers/passthrough/vtd/iommu.h | 55 +++++++++++++++++------------
 2 files changed, 38 insertions(+), 26 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 766d33058e..2d60cebe67 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1772,13 +1772,14 @@ static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
     old = *pte;
 
     dma_set_pte_addr(new, mfn_to_maddr(mfn));
-    dma_set_pte_prot(new,
-                     ((flags & IOMMUF_readable) ? DMA_PTE_READ  : 0) |
-                     ((flags & IOMMUF_writable) ? DMA_PTE_WRITE : 0));
+    if ( flags & IOMMUF_readable )
+        dma_set_pte_readable(new);
+    if ( flags & IOMMUF_writable )
+        dma_set_pte_writable(new);
 
     /* Set the SNP on leaf page table if Snoop Control available */
     if ( iommu_snoop )
-        dma_set_pte_snp(new);
+        dma_set_pte_snoop(new);
 
     if ( old.val == new.val )
     {
diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/vtd/iommu.h
index 509d13918a..017286b0e1 100644
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -283,29 +283,40 @@ struct context_entry {
  * 12-63: Host physcial address
  */
 struct dma_pte {
-    u64 val;
+    union {
+        uint64_t val;
+        struct {
+            uint64_t r:1;
+            uint64_t w:1;
+            uint64_t reserved0:1;
+            uint64_t ignored0:4;
+            uint64_t ps:1;
+            uint64_t ignored1:3;
+            uint64_t snp:1;
+            uint64_t addr:52;
+        };
+    };
 };
-#define DMA_PTE_READ (1)
-#define DMA_PTE_WRITE (2)
-#define DMA_PTE_PROT (DMA_PTE_READ | DMA_PTE_WRITE)
-#define DMA_PTE_SP   (1 << 7)
-#define DMA_PTE_SNP  (1 << 11)
-#define dma_clear_pte(p)    do {(p).val = 0;} while(0)
-#define dma_set_pte_readable(p) do {(p).val |= DMA_PTE_READ;} while(0)
-#define dma_set_pte_writable(p) do {(p).val |= DMA_PTE_WRITE;} while(0)
-#define dma_set_pte_superpage(p) do {(p).val |= DMA_PTE_SP;} while(0)
-#define dma_set_pte_snp(p)  do {(p).val |= DMA_PTE_SNP;} while(0)
-#define dma_set_pte_prot(p, prot) do { \
-        (p).val = ((p).val & ~DMA_PTE_PROT) | ((prot) & DMA_PTE_PROT); \
-    } while (0)
-#define dma_pte_prot(p) ((p).val & DMA_PTE_PROT)
-#define dma_pte_read(p) (dma_pte_prot(p) & DMA_PTE_READ)
-#define dma_pte_write(p) (dma_pte_prot(p) & DMA_PTE_WRITE)
-#define dma_pte_addr(p) ((p).val & PADDR_MASK & PAGE_MASK_4K)
-#define dma_set_pte_addr(p, addr) do {\
-            (p).val |= ((addr) & PAGE_MASK_4K); } while (0)
-#define dma_pte_present(p) (((p).val & DMA_PTE_PROT) != 0)
-#define dma_pte_superpage(p) (((p).val & DMA_PTE_SP) != 0)
+
+#define dma_pte_read(p) ((p).r)
+#define dma_set_pte_readable(p) do { (p).r = 1; } while (0)
+
+#define dma_pte_write(p) ((p).w)
+#define dma_set_pte_writable(p) do { (p).w = 1; } while (0)
+
+#define dma_pte_addr(p) ((p).addr << PAGE_SHIFT_4K)
+#define dma_set_pte_addr(p, val) \
+    do { (p).addr =  (val) >> PAGE_SHIFT_4K; } while (0)
+
+#define dma_pte_present(p) ((p).r || (p).w)
+
+#define dma_pte_superpage(p) ((p).ps)
+#define dma_set_pte_superpage(p) do { (p).ps = 1; } while (0)
+
+#define dma_pte_snoop(p) ((p).snp)
+#define dma_set_pte_snoop(p)  do { (p).snp = 1; } while (0)
+
+#define dma_clear_pte(p) do { (p).val = 0; } while (0)
 
 /* interrupt remap entry */
 struct iremap_entry {
-- 
2.20.1


