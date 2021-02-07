Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A29C23125D4
	for <lists+xen-devel@lfdr.de>; Sun,  7 Feb 2021 17:10:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82430.152245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8mdI-000481-UH; Sun, 07 Feb 2021 16:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82430.152245; Sun, 07 Feb 2021 16:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8mdI-00047X-Pi; Sun, 07 Feb 2021 16:09:56 +0000
Received: by outflank-mailman (input) for mailman id 82430;
 Sun, 07 Feb 2021 16:09:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QIBx=HJ=casper.srs.infradead.org=batv+661ee30cee4f8a507613+6377+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1l8mdH-00042X-IA
 for xen-devel@lists.xenproject.org; Sun, 07 Feb 2021 16:09:55 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83c2965e-1cdd-4643-a833-b32e7e910eb2;
 Sun, 07 Feb 2021 16:09:47 +0000 (UTC)
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8md1-004tmA-Lk; Sun, 07 Feb 2021 16:09:40 +0000
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
X-Inumbo-ID: 83c2965e-1cdd-4643-a833-b32e7e910eb2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jFI2mi7dyRl0KQwCReup9amZMDdC7KVLA5/jiqTUJgc=; b=PzcY4sAIeTkV30mNeSR7f4zhev
	1l86naI/SQcUf0zOFqJq4KJw5/8N1oMJjS8yNc/Z8ehT98TCXfbqC0yQIJkU5+vzsX2EJcA7lqXnD
	inxtjszyQ9sK7lZOffjVlwnAIPOGvXzlMpup2gQRm/SVMpF6REFiaCeA3V36wmiPskUOOwbKs2f2/
	Bh9N0vS73XhuuqKUlQtGemY4mIiM6twaFuU0N84w1IvGRIOriBPhiyre+OW/45YumEnkat66MuvVP
	iZjwGsedAM5O6qFZcTy0pBe4gMYLXotX3BJJucUjweYhEXiYYk6TIHHM3R2KLkGXZDkHwdJsP3F08
	DtFINz5Q==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 2/8] xen-swiotlb: use is_swiotlb_buffer in is_xen_swiotlb_buffer
Date: Sun,  7 Feb 2021 17:09:28 +0100
Message-Id: <20210207160934.2955931-3-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207160934.2955931-1-hch@lst.de>
References: <20210207160934.2955931-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use the is_swiotlb_buffer to check if a physical address is
a swiotlb buffer.  This works because xen-swiotlb does use the
same buffer as the main swiotlb code, and xen_io_tlb_{start,end}
are just the addresses for it that went through phys_to_virt.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 2b385c1b4a99cb..a4026822a889f7 100644
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


