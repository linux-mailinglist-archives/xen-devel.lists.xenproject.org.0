Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F7284894
	for <lists+xen-devel@lfdr.de>; Tue,  6 Oct 2020 10:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3142.9065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPiJK-0005TL-VI; Tue, 06 Oct 2020 08:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3142.9065; Tue, 06 Oct 2020 08:27:02 +0000
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
	id 1kPiJK-0005Sw-Ru; Tue, 06 Oct 2020 08:27:02 +0000
Received: by outflank-mailman (input) for mailman id 3142;
 Tue, 06 Oct 2020 08:27:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RbFo=DN=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kPiJI-0005Sr-W6
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 08:27:01 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bba97cb6-e026-43f1-b5e4-9a7d47fe1fab;
 Tue, 06 Oct 2020 08:26:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B855868AFE; Tue,  6 Oct 2020 10:26:56 +0200 (CEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=RbFo=DN=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kPiJI-0005Sr-W6
	for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 08:27:01 +0000
X-Inumbo-ID: bba97cb6-e026-43f1-b5e4-9a7d47fe1fab
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bba97cb6-e026-43f1-b5e4-9a7d47fe1fab;
	Tue, 06 Oct 2020 08:26:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B855868AFE; Tue,  6 Oct 2020 10:26:56 +0200 (CEST)
Date: Tue, 6 Oct 2020 10:26:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org
Subject: Re: xen-swiotlb vs phys_to_dma
Message-ID: <20201006082656.GB10243@lst.de>
References: <20201002123436.GA30329@lst.de> <alpine.DEB.2.21.2010021313010.10908@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010021313010.10908@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Oct 02, 2020 at 01:21:25PM -0700, Stefano Stabellini wrote:
> On Fri, 2 Oct 2020, Christoph Hellwig wrote:
> > Hi Stefano,
> > 
> > I've looked over xen-swiotlb in linux-next, that is with your recent
> > changes to take dma offsets into account.  One thing that puzzles me
> > is that xen_swiotlb_map_page passes virt_to_phys(xen_io_tlb_start) as
> > the tbl_dma_addr argument to swiotlb_tbl_map_single, despite the fact
> > that the argument is a dma_addr_t and both other callers translate
> > from a physical to the dma address.  Was this an oversight?
> 
> Hi Christoph,
> 
> It was not an oversight, it was done on purpose, although maybe I could
> have been wrong. There was a brief discussion on this topic here: 
> 
> https://marc.info/?l=linux-kernel&m=159011972107683&w=2
> https://marc.info/?l=linux-kernel&m=159018047129198&w=2
> 
> I'll repeat and summarize here for convenience. 
> 
> swiotlb_init_with_tbl is called by xen_swiotlb_init, passing a virtual
> address (xen_io_tlb_start), which gets converted to phys and stored in
> io_tlb_start as a physical address at the beginning of swiotlb_init_with_tbl.

Yes.

> Afterwards, xen_swiotlb_map_page calls swiotlb_tbl_map_single. The
> second parameter, dma_addr_t tbl_dma_addr, is used to calculate the
> right slot in the swiotlb buffer to use, comparing it against
> io_tlb_start.

It is not compared against io_tlb_start.  It is just used to pick
a slot that fits the dma_get_seg_boundary limitation in a somewhat
awkward way.

> Thus, I think it makes sense for xen_swiotlb_map_page to call
> swiotlb_tbl_map_single passing an address meant to be compared with
> io_tlb_start, which is __pa(xen_io_tlb_start), so
> virt_to_phys(xen_io_tlb_start) seems to be what we want.

No, it doesn't.  tlb_addr is used to ensure the picked slots satisfies
the segment boundary, and for that you need a dma_addr_t.

The index variable in swiotlb_tbl_map_single is derived from
io_tlb_index, not io_tlb_start.

> However, you are right that it is strange that tbl_dma_addr is a
> dma_addr_t, and maybe it shouldn't be? Maybe the tbl_dma_addr parameter
> to swiotlb_tbl_map_single should be a phys address instead?
> Or it could be swiotlb_init_with_tbl to be wrong and it should take a
> dma address to initialize the swiotlb buffer.

No, it must be a dma_addr_t so that the dma_get_seg_boundary check works.

I think we need something like this (against linux-next):

---
From 07b39a62b235ed2d4b2215700d99968998fbf6c0 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Tue, 6 Oct 2020 10:22:19 +0200
Subject: swiotlb: remove the tlb_addr argument to swiotlb_tbl_map_single

The tlb_addr always must be the dma view of io_tlb_start so that the
segment boundary checks work.  Remove the argument and do the right
thing inside swiotlb_tbl_map_single.  This fixes the swiotlb-xen case
that failed to take DMA offset into account.  The issue probably did
not show up very much in practice as the typical dma offsets are
large enough to not affect the segment boundaries for most devices.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/intel/iommu.c |  5 ++---
 drivers/xen/swiotlb-xen.c   |  3 +--
 include/linux/swiotlb.h     | 10 +++-------
 kernel/dma/swiotlb.c        | 16 ++++++----------
 4 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 5ee0b7921b0b37..d473811fcfacd5 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3815,9 +3815,8 @@ bounce_map_single(struct device *dev, phys_addr_t paddr, size_t size,
 	 * page aligned, we don't need to use a bounce page.
 	 */
 	if (!IS_ALIGNED(paddr | size, VTD_PAGE_SIZE)) {
-		tlb_addr = swiotlb_tbl_map_single(dev,
-				phys_to_dma_unencrypted(dev, io_tlb_start),
-				paddr, size, aligned_size, dir, attrs);
+		tlb_addr = swiotlb_tbl_map_single(dev, paddr, size,
+						  aligned_size, dir, attrs);
 		if (tlb_addr == DMA_MAPPING_ERROR) {
 			goto swiotlb_error;
 		} else {
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 030a225624b060..953186f6d7d222 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -395,8 +395,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 	 */
 	trace_swiotlb_bounced(dev, dev_addr, size, swiotlb_force);
 
-	map = swiotlb_tbl_map_single(dev, virt_to_phys(xen_io_tlb_start),
-				     phys, size, size, dir, attrs);
+	map = swiotlb_tbl_map_single(dev, phys, size, size, dir, attrs);
 	if (map == (phys_addr_t)DMA_MAPPING_ERROR)
 		return DMA_MAPPING_ERROR;
 
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 513913ff748626..3bb72266a75a1d 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -45,13 +45,9 @@ enum dma_sync_target {
 	SYNC_FOR_DEVICE = 1,
 };
 
-extern phys_addr_t swiotlb_tbl_map_single(struct device *hwdev,
-					  dma_addr_t tbl_dma_addr,
-					  phys_addr_t phys,
-					  size_t mapping_size,
-					  size_t alloc_size,
-					  enum dma_data_direction dir,
-					  unsigned long attrs);
+phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
+		size_t mapping_size, size_t alloc_size,
+		enum dma_data_direction dir, unsigned long attrs);
 
 extern void swiotlb_tbl_unmap_single(struct device *hwdev,
 				     phys_addr_t tlb_addr,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 995c1b4cb427ee..8d0b7c3971e81e 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -441,14 +441,11 @@ static void swiotlb_bounce(phys_addr_t orig_addr, phys_addr_t tlb_addr,
 	}
 }
 
-phys_addr_t swiotlb_tbl_map_single(struct device *hwdev,
-				   dma_addr_t tbl_dma_addr,
-				   phys_addr_t orig_addr,
-				   size_t mapping_size,
-				   size_t alloc_size,
-				   enum dma_data_direction dir,
-				   unsigned long attrs)
+phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
+		size_t mapping_size, size_t alloc_size,
+		enum dma_data_direction dir, unsigned long attrs)
 {
+	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(dev, io_tlb_start);
 	unsigned long flags;
 	phys_addr_t tlb_addr;
 	unsigned int nslots, stride, index, wrap;
@@ -667,9 +664,8 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
 	trace_swiotlb_bounced(dev, phys_to_dma(dev, paddr), size,
 			      swiotlb_force);
 
-	swiotlb_addr = swiotlb_tbl_map_single(dev,
-			phys_to_dma_unencrypted(dev, io_tlb_start),
-			paddr, size, size, dir, attrs);
+	swiotlb_addr = swiotlb_tbl_map_single(dev, paddr, size, size, dir,
+					      attrs);
 	if (swiotlb_addr == (phys_addr_t)DMA_MAPPING_ERROR)
 		return DMA_MAPPING_ERROR;
 
-- 
2.28.0


