Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E91523382
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 14:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326806.549465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nolv5-0002ka-0h; Wed, 11 May 2022 12:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326806.549465; Wed, 11 May 2022 12:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nolv4-0002ia-TO; Wed, 11 May 2022 12:58:22 +0000
Received: by outflank-mailman (input) for mailman id 326806;
 Wed, 11 May 2022 12:58:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I4DC=VT=bombadil.srs.infradead.org=BATV+bd3371fd9649de263009+6835+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nolv3-0002DF-E7
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 12:58:21 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 083730a7-d12a-11ec-a406-831a346695d4;
 Wed, 11 May 2022 14:58:20 +0200 (CEST)
Received: from [2001:4bb8:184:7881:740a:25f7:2c13:ef7a] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noluy-006red-V1; Wed, 11 May 2022 12:58:17 +0000
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
X-Inumbo-ID: 083730a7-d12a-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=toUCmk68b0VIqulfilEOK3I3y91LJ0y0OH/f7d0EES0=; b=GGIU1i8lkayqDGAplfrTSrhaor
	BLksm6LWRMLoDZZbshdWfl1zTZJw7+5EApQCx/OIN5M0EU1RtOm2OP3lgcCxN0zEnNoGvF+GODe3G
	ofQic3DC0LKOfP7Fkx2AeGIxyEVZb/kbjHRCDleY4wfI1k9Lp2EjpIw2epikU2kUn3o/FWk+ND78J
	W6sXXNB9s8fIRSBTPGBi4SnVmC8afXImzQtCfps0xo0YrB6WG5ivAudedbhd+z0axlhNGkH7zCTqI
	iY5Bf3S8J4EU/B25UhLHUqveOZLR1f11oopGMGBSmVNXdElnUxTs231jO3i0K+ajnFFfdiXi2/Hf5
	siB5FhhA==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Conor.Dooley@microchip.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH 3/3] swiotlb: use the right nslabs-derived sizes in swiotlb_init_late
Date: Wed, 11 May 2022 14:58:05 +0200
Message-Id: <20220511125805.1377025-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220511125805.1377025-1-hch@lst.de>
References: <20220511125805.1377025-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

nslabs can shrink when allocations or the remap don't succeed, so make
sure to use it for all sizing.  For that remove the bytes value that
can get stale and replace it with local calculations and a boolean to
indicate if the originally requested size could not be allocated.

Fixes: 6424e31b1c05 ("swiotlb: remove swiotlb_init_with_tbl and swiotlb_init_late_with_tbl")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 113e1e8aaca37..d6e62a6a42ceb 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -297,9 +297,9 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 {
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
-	unsigned long bytes;
 	unsigned char *vstart = NULL;
 	unsigned int order;
+	bool retried = false;
 	int rc = 0;
 
 	if (swiotlb_force_disable)
@@ -308,7 +308,6 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 retry:
 	order = get_order(nslabs << IO_TLB_SHIFT);
 	nslabs = SLABS_PER_PAGE << order;
-	bytes = nslabs << IO_TLB_SHIFT;
 
 	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
 		vstart = (void *)__get_free_pages(gfp_mask | __GFP_NOWARN,
@@ -316,16 +315,13 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		if (vstart)
 			break;
 		order--;
+		nslabs = SLABS_PER_PAGE << order;
+		retried = true;
 	}
 
 	if (!vstart)
 		return -ENOMEM;
 
-	if (order != get_order(bytes)) {
-		pr_warn("only able to allocate %ld MB\n",
-			(PAGE_SIZE << order) >> 20);
-		nslabs = SLABS_PER_PAGE << order;
-	}
 	if (remap)
 		rc = remap(vstart, nslabs);
 	if (rc) {
@@ -334,9 +330,15 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
 		if (nslabs < IO_TLB_MIN_SLABS)
 			return rc;
+		retried = true;
 		goto retry;
 	}
 
+	if (retried) {
+		pr_warn("only able to allocate %ld MB\n",
+			(PAGE_SIZE << order) >> 20);
+	}
+
 	mem->slots = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
 		get_order(array_size(sizeof(*mem->slots), nslabs)));
 	if (!mem->slots) {
@@ -344,7 +346,8 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		return -ENOMEM;
 	}
 
-	set_memory_decrypted((unsigned long)vstart, bytes >> PAGE_SHIFT);
+	set_memory_decrypted((unsigned long)vstart,
+			     (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
 	swiotlb_init_io_tlb_mem(mem, virt_to_phys(vstart), nslabs, true);
 
 	swiotlb_print_info();
-- 
2.30.2


