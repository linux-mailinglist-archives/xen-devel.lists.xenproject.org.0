Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1F732786F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 08:46:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91269.172435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdFY-0002uD-AG; Mon, 01 Mar 2021 07:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91269.172435; Mon, 01 Mar 2021 07:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdFY-0002tl-4w; Mon, 01 Mar 2021 07:45:52 +0000
Received: by outflank-mailman (input) for mailman id 91269;
 Mon, 01 Mar 2021 07:45:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LLJP=H7=casper.srs.infradead.org=batv+bce9324c41c3486454c7+6399+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lGdFW-0002sK-EB
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 07:45:50 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83d1d930-5506-416b-9373-1512f9c8c7f4;
 Mon, 01 Mar 2021 07:45:49 +0000 (UTC)
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdF4-00FRBm-On; Mon, 01 Mar 2021 07:45:28 +0000
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
X-Inumbo-ID: 83d1d930-5506-416b-9373-1512f9c8c7f4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=waRM0pjuhEeQaBWUrgK7ZdelZaRqodVDxZI32WcdEMs=; b=l9A9+OrFX2akSpcdSbJffe1kyf
	38IwDgTDdrgca89MW5mliDcOLO5Nd0YTAd+ofoshJOMHMQ4O35SMjrqUSU9BIHBTrFAacTJCjWAH3
	MmKvzN6NMpMwvvP6g0ZXvkrEF4XoDYt1DYcZ7SUrX+oWzfjcZJ1GA4dM4UpRcUm7kFnJARpBEfYgI
	A3Sdb4LCU5WFHZbbQwkGeNAkJDOEECqd0DCf7dqLDGdhg10VJK800H5RapjGPVmj1QIBsBNLQ0dey
	tGbmmvR/4HsSuRkqrabDlZRDAgwFImpxNnkr11nYp5NPR3J5sG9CcFaruHrnGOM9tkBPSZNeSHJPt
	25rxC34A==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 05/14] xen-swiotlb: use is_swiotlb_buffer in is_xen_swiotlb_buffer
Date: Mon,  1 Mar 2021 08:44:27 +0100
Message-Id: <20210301074436.919889-6-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301074436.919889-1-hch@lst.de>
References: <20210301074436.919889-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use the is_swiotlb_buffer to check if a physical address is
a swiotlb buffer.  This works because xen-swiotlb does use the
same buffer as the main swiotlb code, and xen_io_tlb_{start,end}
are just the addresses for it that went through phys_to_virt.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
---
 drivers/xen/swiotlb-xen.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 4e8a4e14942afd..bffb35993c9d5f 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -111,10 +111,8 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	 * have the same virtual address as another address
 	 * in our domain. Therefore _only_ check address within our domain.
 	 */
-	if (pfn_valid(PFN_DOWN(paddr))) {
-		return paddr >= virt_to_phys(xen_io_tlb_start) &&
-		       paddr < virt_to_phys(xen_io_tlb_end);
-	}
+	if (pfn_valid(PFN_DOWN(paddr)))
+		return is_swiotlb_buffer(paddr);
 	return 0;
 }
 
-- 
2.29.2


