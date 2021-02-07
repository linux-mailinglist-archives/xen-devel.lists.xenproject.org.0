Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AB23125D6
	for <lists+xen-devel@lfdr.de>; Sun,  7 Feb 2021 17:10:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82431.152257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8mdO-0004Fl-Bs; Sun, 07 Feb 2021 16:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82431.152257; Sun, 07 Feb 2021 16:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8mdO-0004DL-5k; Sun, 07 Feb 2021 16:10:02 +0000
Received: by outflank-mailman (input) for mailman id 82431;
 Sun, 07 Feb 2021 16:10:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QIBx=HJ=casper.srs.infradead.org=batv+661ee30cee4f8a507613+6377+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1l8mdM-00042X-IQ
 for xen-devel@lists.xenproject.org; Sun, 07 Feb 2021 16:10:00 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a86c215f-204d-47a0-a1f2-4377bd28f039;
 Sun, 07 Feb 2021 16:09:48 +0000 (UTC)
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8md3-004tmH-BE; Sun, 07 Feb 2021 16:09:41 +0000
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
X-Inumbo-ID: a86c215f-204d-47a0-a1f2-4377bd28f039
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T8t1FwG6dE6zlEC3wLjW3JLNNjj/ykTR2lwFCEWQrxw=; b=YqZ4QnN1AVP9n/XFE9fsSrvWCF
	8EEyVnum1O4pgtOIHD11S+iAWfm6laLkacn4Z2eWxuAyluOFTvlaedJznz/qrn3jE5wUHhthpubHU
	Apn4BjiI+OFuhTOzZH+VzHVviNaDF4pAfarvhdBIVt8KWXZ43vISJu96/HCVVesdgCAxz3eawu2lg
	2xjUd2GoHUF+9GKve/GSvZ20KB2IuFHtrylOK3+Wn3al61Xht1ZQhvrv95mynOS4veIx/MiL2So2G
	SmG5re6h//fchVk1f1XgUNgw6TBeVkKwuHQVxG2BIwR4ROuxSMOFuG56ulMVKHCEGHViqPxAFdMAg
	CFXHUMMQ==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 3/8] xen-swiotlb: use io_tlb_end in xen_swiotlb_dma_supported
Date: Sun,  7 Feb 2021 17:09:29 +0100
Message-Id: <20210207160934.2955931-4-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207160934.2955931-1-hch@lst.de>
References: <20210207160934.2955931-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use the existing variable that holds the physical address for
xen_io_tlb_end to simplify xen_swiotlb_dma_supported a bit, and remove
the otherwise unused xen_io_tlb_end variable and the xen_virt_to_bus
helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index a4026822a889f7..4298f74a083985 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -46,7 +46,7 @@
  * API.
  */
 
-static char *xen_io_tlb_start, *xen_io_tlb_end;
+static char *xen_io_tlb_start;
 static unsigned long xen_io_tlb_nslabs;
 /*
  * Quick lookup value of the bus address of the IOTLB.
@@ -82,11 +82,6 @@ static inline phys_addr_t xen_dma_to_phys(struct device *dev,
 	return xen_bus_to_phys(dev, dma_to_phys(dev, dma_addr));
 }
 
-static inline dma_addr_t xen_virt_to_bus(struct device *dev, void *address)
-{
-	return xen_phys_to_dma(dev, virt_to_phys(address));
-}
-
 static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
 {
 	unsigned long next_bfn, xen_pfn = XEN_PFN_DOWN(p);
@@ -250,7 +245,6 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 		rc = swiotlb_late_init_with_tbl(xen_io_tlb_start, xen_io_tlb_nslabs);
 
 end:
-	xen_io_tlb_end = xen_io_tlb_start + bytes;
 	if (!rc)
 		swiotlb_set_max_segment(PAGE_SIZE);
 
@@ -558,7 +552,7 @@ xen_swiotlb_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 static int
 xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
 {
-	return xen_virt_to_bus(hwdev, xen_io_tlb_end - 1) <= mask;
+	return xen_phys_to_dma(hwdev, io_tlb_end - 1) <= mask;
 }
 
 const struct dma_map_ops xen_swiotlb_dma_ops = {
-- 
2.29.2


