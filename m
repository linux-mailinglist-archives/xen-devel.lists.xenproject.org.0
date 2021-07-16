Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E54593CB553
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 11:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157123.290000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4KGE-0004Gp-Jk; Fri, 16 Jul 2021 09:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157123.290000; Fri, 16 Jul 2021 09:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4KGE-0004EW-Fz; Fri, 16 Jul 2021 09:35:58 +0000
Received: by outflank-mailman (input) for mailman id 157123;
 Fri, 16 Jul 2021 09:35:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=acOe=MI=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1m4KGC-0004EQ-MV
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 09:35:56 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bbe8157-d630-49de-b71d-1def18dcc65f;
 Fri, 16 Jul 2021 09:35:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2D76067373; Fri, 16 Jul 2021 11:35:52 +0200 (CEST)
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
X-Inumbo-ID: 3bbe8157-d630-49de-b71d-1def18dcc65f
Date: Fri, 16 Jul 2021 11:35:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Roman Skakun <rm.skakun@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Andrii Anisov <andrii_anisov@epam.com>,
	Roman Skakun <Roman_Skakun@epam.com>
Subject: Re: [PATCH v2] dma-mapping: use vmalloc_to_page for vmalloc
 addresses
Message-ID: <20210716093551.GA17981@lst.de>
References: <20210715170011.GA17324@lst.de> <20210716083934.154992-1-rm.skakun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716083934.154992-1-rm.skakun@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Technically this looks good.  But given that exposing a helper
that does either vmalloc_to_page or virt_to_page is one of the
never ending MM discussions I don't want to get into that discussion
and just keep it local in the DMA code.

Are you fine with me applying this version?

---
From 40ac971eab89330d6153e7721e88acd2d98833f9 Mon Sep 17 00:00:00 2001
From: Roman Skakun <Roman_Skakun@epam.com>
Date: Fri, 16 Jul 2021 11:39:34 +0300
Subject: dma-mapping: handle vmalloc addresses in
 dma_common_{mmap,get_sgtable}

xen-swiotlb can use vmalloc backed addresses for dma coherent allocations
and uses the common helpers.  Properly handle them to unbreak Xen on
ARM platforms.

Fixes: 1b65c4e5a9af ("swiotlb-xen: use xen_alloc/free_coherent_pages")
Signed-off-by: Roman Skakun <roman_skakun@epam.com>
Reviewed-by: Andrii Anisov <andrii_anisov@epam.com>
[hch: split the patch, renamed the helpers]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/ops_helpers.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
index 910ae69cae77..af4a6ef48ce0 100644
--- a/kernel/dma/ops_helpers.c
+++ b/kernel/dma/ops_helpers.c
@@ -5,6 +5,13 @@
  */
 #include <linux/dma-map-ops.h>
 
+static struct page *dma_common_vaddr_to_page(void *cpu_addr)
+{
+	if (is_vmalloc_addr(cpu_addr))
+		return vmalloc_to_page(cpu_addr);
+	return virt_to_page(cpu_addr);
+}
+
 /*
  * Create scatter-list for the already allocated DMA buffer.
  */
@@ -12,7 +19,7 @@ int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
 		 void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		 unsigned long attrs)
 {
-	struct page *page = virt_to_page(cpu_addr);
+	struct page *page = dma_common_vaddr_to_page(cpu_addr);
 	int ret;
 
 	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
@@ -32,6 +39,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 	unsigned long user_count = vma_pages(vma);
 	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
 	unsigned long off = vma->vm_pgoff;
+	struct page *page = dma_common_vaddr_to_page(cpu_addr);
 	int ret = -ENXIO;
 
 	vma->vm_page_prot = dma_pgprot(dev, vma->vm_page_prot, attrs);
@@ -43,7 +51,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 		return -ENXIO;
 
 	return remap_pfn_range(vma, vma->vm_start,
-			page_to_pfn(virt_to_page(cpu_addr)) + vma->vm_pgoff,
+			page_to_pfn(page) + vma->vm_pgoff,
 			user_count << PAGE_SHIFT, vma->vm_page_prot);
 #else
 	return -ENXIO;
-- 
2.30.2


