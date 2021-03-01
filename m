Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2CF32787D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 08:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91283.172507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdGF-0003Ux-AB; Mon, 01 Mar 2021 07:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91283.172507; Mon, 01 Mar 2021 07:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdGF-0003UK-54; Mon, 01 Mar 2021 07:46:35 +0000
Received: by outflank-mailman (input) for mailman id 91283;
 Mon, 01 Mar 2021 07:46:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LLJP=H7=casper.srs.infradead.org=batv+bce9324c41c3486454c7+6399+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lGdGD-0003Px-FD
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 07:46:33 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8907fb7-1183-41fc-8ced-cf8aac6b1f92;
 Mon, 01 Mar 2021 07:46:26 +0000 (UTC)
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdFu-00FREl-Fr; Mon, 01 Mar 2021 07:46:16 +0000
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
X-Inumbo-ID: f8907fb7-1183-41fc-8ced-cf8aac6b1f92
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mXkVhFtn8HeR3wavy6jqxTMaaOwapdi0UDpQuxnpggo=; b=MbcvSu3J2A/2YUuOQNftUQ40jQ
	oUyLNnz0N1TEM4xM+lm4M86OFbd+5jWcWV5H8fJ+wevrT5rjsxPmbvlkku5a6L6YhDxVew8znrmgZ
	Cf4ecqDKrnijw22rBE/MZaMd92C/DYnWIjSgWuViL9Ymn0FdRFdRKjFO/m6MuCJK/C08WYdQ4wXJw
	RCCZEzP9gpPvK7pZcDtyRKDuANbg/bRDXobijdkIyKk1Kl6on4DGYufGNrrPCBvvUVmZ0qyKVx7a7
	Z565H9liCHB8m+RNFQsMXMoPrF3YD83Axz+iZTxR69IH2XG69+UqAc6OkrTK4pIgFoNfVbM/GwwPA
	87TI1Fjg==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 11/14] xen-swiotlb: remove the unused size argument from xen_swiotlb_fixup
Date: Mon,  1 Mar 2021 08:44:33 +0100
Message-Id: <20210301074436.919889-12-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301074436.919889-1-hch@lst.de>
References: <20210301074436.919889-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 00adeb95ebb9df..4ecfce2c6f7263 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -104,8 +104,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	return 0;
 }
 
-static int
-xen_swiotlb_fixup(void *buf, size_t size, unsigned long nslabs)
+static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 {
 	int i, rc;
 	int dma_bits;
@@ -195,7 +194,7 @@ int __ref xen_swiotlb_init(void)
 	/*
 	 * And replace that memory with pages under 4GB.
 	 */
-	rc = xen_swiotlb_fixup(start, bytes, nslabs);
+	rc = xen_swiotlb_fixup(start, nslabs);
 	if (rc) {
 		free_pages((unsigned long)start, order);
 		m_ret = XEN_SWIOTLB_EFIXUP;
@@ -243,7 +242,7 @@ void __init xen_swiotlb_init_early(void)
 	/*
 	 * And replace that memory with pages under 4GB.
 	 */
-	rc = xen_swiotlb_fixup(start, bytes, nslabs);
+	rc = xen_swiotlb_fixup(start, nslabs);
 	if (rc) {
 		memblock_free(__pa(start), PAGE_ALIGN(bytes));
 		if (repeat--) {
-- 
2.29.2


