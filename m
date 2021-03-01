Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DAE32786A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 08:45:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91260.172410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdF5-0002cc-H2; Mon, 01 Mar 2021 07:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91260.172410; Mon, 01 Mar 2021 07:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdF5-0002bt-D5; Mon, 01 Mar 2021 07:45:23 +0000
Received: by outflank-mailman (input) for mailman id 91260;
 Mon, 01 Mar 2021 07:45:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LLJP=H7=casper.srs.infradead.org=batv+bce9324c41c3486454c7+6399+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lGdF4-0002U2-96
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 07:45:22 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9697837-920a-42cb-a2bc-a6e2cf0c2a7c;
 Mon, 01 Mar 2021 07:45:19 +0000 (UTC)
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdEq-00FRBJ-Uh; Mon, 01 Mar 2021 07:45:10 +0000
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
X-Inumbo-ID: e9697837-920a-42cb-a2bc-a6e2cf0c2a7c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ds/ACDNRu58btmZG/NqJ4lBgbf4+MYCDj5+pQ+XVzpM=; b=Woztf5KlRadzF1qDJdsaN2b6jM
	F8qWgj/k/tKZ4TYWm/AYmy26ne94IWhyXBXotmr6ZMC2165WaVQ0HTcxuOZlbeVPRgeaDbU9tPbk6
	b1+viMTPj3CMaTXoXiKCSmZ7osK63GGeshw5QNx/sYvqsaDd+dXbdEpaqbUF7xUXVaqz1aTIQ+sXB
	NgnUGMgUWy//zxAqn8O6EvVL4sb4zQrrgB8TYz0XC/mJGicpRKi4j6KyFM7g0lV1wMwCAPkPNUjoK
	59SY3DMBp5chNynkNLgir+OXDa4hEDqhRh8xvDXl/lPGZGPo5vMoG0sUo/Zfva4X8S0ufaB4hAII9
	2/ISnCMw==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 03/14] swiotlb: move orig addr and size validation into swiotlb_bounce
Date: Mon,  1 Mar 2021 08:44:25 +0100
Message-Id: <20210301074436.919889-4-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301074436.919889-1-hch@lst.de>
References: <20210301074436.919889-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Move the code to find and validate the original buffer address and size
from the callers into swiotlb_bounce.  This means a tiny bit of extra
work in the swiotlb_map path, but avoids code duplication and a leads to
a better code structure.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 59 +++++++++++++++++---------------------------
 1 file changed, 23 insertions(+), 36 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 03aa614565e417..a9063092f6f566 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -460,12 +460,25 @@ void __init swiotlb_exit(void)
 /*
  * Bounce: copy the swiotlb buffer from or back to the original dma location
  */
-static void swiotlb_bounce(phys_addr_t orig_addr, phys_addr_t tlb_addr,
-			   size_t size, enum dma_data_direction dir)
+static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size,
+		enum dma_data_direction dir)
 {
+	int index = (tlb_addr - io_tlb_start) >> IO_TLB_SHIFT;
+	size_t alloc_size = io_tlb_alloc_size[index];
+	phys_addr_t orig_addr = io_tlb_orig_addr[index];
 	unsigned long pfn = PFN_DOWN(orig_addr);
 	unsigned char *vaddr = phys_to_virt(tlb_addr);
 
+	if (orig_addr == INVALID_PHYS_ADDR)
+		return;
+
+	if (size > alloc_size) {
+		dev_WARN_ONCE(dev, 1,
+			"Buffer overflow detected. Allocation size: %zu. Mapping size: %zu.\n",
+			alloc_size, size);
+		size = alloc_size;
+	}
+
 	if (PageHighMem(pfn_to_page(pfn))) {
 		/* The buffer does not have a mapping.  Map it in and copy */
 		unsigned int offset = orig_addr & ~PAGE_MASK;
@@ -644,21 +657,10 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	tlb_addr = slot_addr(io_tlb_start, index) + offset;
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
-		swiotlb_bounce(orig_addr, tlb_addr, mapping_size, DMA_TO_DEVICE);
+		swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_TO_DEVICE);
 	return tlb_addr;
 }
 
-static void validate_sync_size_and_truncate(struct device *hwdev, size_t alloc_size, size_t *size)
-{
-	if (*size > alloc_size) {
-		/* Warn and truncate mapping_size */
-		dev_WARN_ONCE(hwdev, 1,
-			"Attempt for buffer overflow. Original size: %zu. Mapping size: %zu.\n",
-			alloc_size, *size);
-		*size = alloc_size;
-	}
-}
-
 /*
  * tlb_addr is the physical address of the bounce buffer to unmap.
  */
@@ -669,19 +671,15 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	unsigned long flags;
 	unsigned int offset = swiotlb_align_offset(hwdev, tlb_addr);
 	int index = (tlb_addr - offset - io_tlb_start) >> IO_TLB_SHIFT;
-	phys_addr_t orig_addr = io_tlb_orig_addr[index];
-	size_t alloc_size = io_tlb_alloc_size[index];
-	int i, count, nslots = nr_slots(alloc_size + offset);
-
-	validate_sync_size_and_truncate(hwdev, alloc_size, &mapping_size);
+	int nslots = nr_slots(io_tlb_alloc_size[index] + offset);
+	int count, i;
 
 	/*
 	 * First, sync the memory before unmapping the entry
 	 */
-	if (orig_addr != INVALID_PHYS_ADDR &&
-	    !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
-	    ((dir == DMA_FROM_DEVICE) || (dir == DMA_BIDIRECTIONAL)))
-		swiotlb_bounce(orig_addr, tlb_addr, mapping_size, DMA_FROM_DEVICE);
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
+	    (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL))
+		swiotlb_bounce(hwdev, tlb_addr, mapping_size, DMA_FROM_DEVICE);
 
 	/*
 	 * Return the buffer to the free list by setting the corresponding
@@ -721,27 +719,16 @@ void swiotlb_tbl_sync_single(struct device *hwdev, phys_addr_t tlb_addr,
 			     size_t size, enum dma_data_direction dir,
 			     enum dma_sync_target target)
 {
-	int index = (tlb_addr - io_tlb_start) >> IO_TLB_SHIFT;
-	size_t alloc_size = io_tlb_alloc_size[index];
-	phys_addr_t orig_addr = io_tlb_orig_addr[index];
-
-	if (orig_addr == INVALID_PHYS_ADDR)
-		return;
-
-	validate_sync_size_and_truncate(hwdev, alloc_size, &size);
-
 	switch (target) {
 	case SYNC_FOR_CPU:
 		if (likely(dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL))
-			swiotlb_bounce(orig_addr, tlb_addr,
-				       size, DMA_FROM_DEVICE);
+			swiotlb_bounce(hwdev, tlb_addr, size, DMA_FROM_DEVICE);
 		else
 			BUG_ON(dir != DMA_TO_DEVICE);
 		break;
 	case SYNC_FOR_DEVICE:
 		if (likely(dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
-			swiotlb_bounce(orig_addr, tlb_addr,
-				       size, DMA_TO_DEVICE);
+			swiotlb_bounce(hwdev, tlb_addr, size, DMA_TO_DEVICE);
 		else
 			BUG_ON(dir != DMA_FROM_DEVICE);
 		break;
-- 
2.29.2


