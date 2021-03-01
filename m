Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F64327872
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 08:46:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91271.172446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdFj-0002zZ-IM; Mon, 01 Mar 2021 07:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91271.172446; Mon, 01 Mar 2021 07:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdFj-0002yx-E8; Mon, 01 Mar 2021 07:46:03 +0000
Received: by outflank-mailman (input) for mailman id 91271;
 Mon, 01 Mar 2021 07:46:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LLJP=H7=casper.srs.infradead.org=batv+bce9324c41c3486454c7+6399+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lGdFi-0002yc-EZ
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 07:46:02 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39a37b42-4e08-4a33-8ddc-30ce59f6d3b8;
 Mon, 01 Mar 2021 07:45:59 +0000 (UTC)
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdFQ-00FRCL-0I; Mon, 01 Mar 2021 07:45:46 +0000
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
X-Inumbo-ID: 39a37b42-4e08-4a33-8ddc-30ce59f6d3b8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OCILNlokJCxmLaXrgvg794b6b4atNJeGi+QbETqZtzY=; b=n2VQKtfAYQonjn8kWQvsXpZj00
	EL3jl9UA5+wN2UQu9NxyAYOuJG12NX6uYa2qLyFZLMxl5fbXDop5kVsZqCdyIIEt29aRzatWQNkqA
	OB32u9XjFpGo6wSQwtWRgvklyPmyuzphmHFTWaISqvgVzYH/0+SL5NXnpAQR1qI8SO9VWURLQ/L4n
	I58qbE6gV6GeOQgJJDsqODfRzK69AeitDS/OZpoBARnsIv2KwoMN7N7xiB+e4O9LnfWUlocfnSzlr
	lnJBcw8Dvv2laYJlgev77JFgu8iEqDd6mVEcY0zRgaRY3lx3eyp9LomM4YYkhb+Z/UHcQnIhmcpoM
	JcA5BOhQ==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 06/14] xen-swiotlb: use io_tlb_end in xen_swiotlb_dma_supported
Date: Mon,  1 Mar 2021 08:44:28 +0100
Message-Id: <20210301074436.919889-7-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301074436.919889-1-hch@lst.de>
References: <20210301074436.919889-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use the existing variable that holds the physical address for
xen_io_tlb_end to simplify xen_swiotlb_dma_supported a bit, and remove
the otherwise unused xen_io_tlb_end variable and the xen_virt_to_bus
helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
---
 drivers/xen/swiotlb-xen.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index bffb35993c9d5f..e99f0614dcb979 100644
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


