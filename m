Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A2D523383
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 14:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326807.549477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nolv6-00031S-BP; Wed, 11 May 2022 12:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326807.549477; Wed, 11 May 2022 12:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nolv6-0002yf-7h; Wed, 11 May 2022 12:58:24 +0000
Received: by outflank-mailman (input) for mailman id 326807;
 Wed, 11 May 2022 12:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I4DC=VT=bombadil.srs.infradead.org=BATV+bd3371fd9649de263009+6835+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nolv4-0002cJ-PT
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 12:58:22 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06e89449-d12a-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 14:58:20 +0200 (CEST)
Received: from [2001:4bb8:184:7881:740a:25f7:2c13:ef7a] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noluw-006reJ-8R; Wed, 11 May 2022 12:58:14 +0000
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
X-Inumbo-ID: 06e89449-d12a-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=PuV44d9nkyau+qsF4HjXIzIFX/Iz+fNa7YzgjXIuJ3M=; b=KQeqn6zw5+tBwQhIwYbD033l7U
	Bmwb6MGWYXuK/LkzlngzGC5Qubu/BMK8ESaRHloaJRhzEWk2cFZ1/V/l4O8B2vq2MzumWvrZwnZyr
	43YpFbXIsyoZJQy96aaO4hEVBhMn/WC+lJu9Jachezx9QLwtVxUwduoKFfDF9UeSfgMQ0fx1hRZPt
	0LdWe9KjdTrTGyLfYx27s5kfHuPEf7J0GvFg765OJZ9W+F+cSaDYoHAsubZYbwp7D1ACiauoX1v40
	kA0XO3cMZuMkKnKm1x7RM+oVv6dCiF4gS3wqNXal5uhZKXl0X7LATlX/cCqQQx1QPxg0OGZS0cmVF
	GL+aA81w==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Conor.Dooley@microchip.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/3] swiotlb: use the right nslabs value in swiotlb_init_remap
Date: Wed, 11 May 2022 14:58:04 +0200
Message-Id: <20220511125805.1377025-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220511125805.1377025-1-hch@lst.de>
References: <20220511125805.1377025-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

default_nslabs should only be used to initialize nslabs, after that we
need to use the local variable that can shrink when allocations or the
remap don't succeed.

Fixes: 6424e31b1c05 ("swiotlb: remove swiotlb_init_with_tbl and swiotlb_init_late_with_tbl")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 3e992a308c8a1..113e1e8aaca37 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -234,7 +234,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 {
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long nslabs = default_nslabs;
-	size_t alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
+	size_t alloc_size;
 	size_t bytes;
 	void *tlb;
 
@@ -249,7 +249,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 	 * memory encryption.
 	 */
 retry:
-	bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
+	bytes = PAGE_ALIGN(nslabs << IO_TLB_SHIFT);
 	if (flags & SWIOTLB_ANY)
 		tlb = memblock_alloc(bytes, PAGE_SIZE);
 	else
@@ -269,12 +269,13 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		goto retry;
 	}
 
+	alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
 	mem->slots = memblock_alloc(alloc_size, PAGE_SIZE);
 	if (!mem->slots)
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	swiotlb_init_io_tlb_mem(mem, __pa(tlb), default_nslabs, false);
+	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
 	mem->force_bounce = flags & SWIOTLB_FORCE;
 
 	if (flags & SWIOTLB_VERBOSE)
-- 
2.30.2


