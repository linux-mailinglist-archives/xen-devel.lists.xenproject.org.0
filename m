Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AEB367AEB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 09:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115028.219357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTdS-0003zR-Ee; Thu, 22 Apr 2021 07:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115028.219357; Thu, 22 Apr 2021 07:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTdS-0003yo-BJ; Thu, 22 Apr 2021 07:20:26 +0000
Received: by outflank-mailman (input) for mailman id 115028;
 Thu, 22 Apr 2021 07:20:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Z8K=JT=bombadil.srs.infradead.org=batv+ccca8c562e79e8576e72+6451+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lZTdQ-0002oJ-D4
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 07:20:24 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37b1f354-d6ee-4f62-86ae-c33f17780e27;
 Thu, 22 Apr 2021 07:19:52 +0000 (UTC)
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZTci-00DRlk-9r; Thu, 22 Apr 2021 07:19:40 +0000
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
X-Inumbo-ID: 37b1f354-d6ee-4f62-86ae-c33f17780e27
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=IEVkrkm3MuKaNKcyW8a+DG4O3GXVaGagie2/ONcqlhY=; b=anmjfDz2al0zGRuceriPKIfAtn
	2r5xN/fPvoh9RqCq8f2NgLc28anKl85DQp79zJxmlgMjrkAnWT9K6kWFfWdFfa+/oaUraoNrx3EK7
	Cj1NfF+BsAFyNN5ph+FqgH3P21AXa37gyZz30XWgEDpt7OyTdni3oF/OXOL2GxIlSHK6QlH9F8lXj
	oV/bsNdU9LdBrsaiEIvtR7snQd2qNegyfbIbJA40BDORsEqgSmk4odm8REfk7daCNYinPEfg7qB2T
	I6PzWdLRK3qjS5KE+f7VAlXQTos9C/2Z9rykR9kzQr/7cas/V3Ex7wBiKH/DQZu8dTJdpPwX8l/Ki
	812AaC/A==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 6/7] swiotlb: replace default_nslabs with a byte value
Date: Thu, 22 Apr 2021 09:19:20 +0200
Message-Id: <20210422071921.1428607-7-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210422071921.1428607-1-hch@lst.de>
References: <20210422071921.1428607-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Replace the default_nslabs variable with one that stores the size in
bytes as that is what all the users actually expect.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 93737d0932fbf2..87d06ddf4753f3 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -71,7 +71,7 @@ struct io_tlb_mem *io_tlb_default_mem;
  */
 static unsigned int max_segment;
 
-static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
+static unsigned long swiotlb_default_size = IO_TLB_DEFAULT_SIZE;
 
 static int __init
 setup_io_tlb_npages(char *str)
@@ -106,7 +106,7 @@ void swiotlb_set_max_segment(unsigned int val)
 
 unsigned long swiotlb_size_or_default(void)
 {
-	return default_nslabs << IO_TLB_SHIFT;
+	return swiotlb_default_size;
 }
 
 void __init swiotlb_adjust_size(unsigned long size)
@@ -116,9 +116,9 @@ void __init swiotlb_adjust_size(unsigned long size)
 	 * architectures such as those supporting memory encryption to
 	 * adjust/expand SWIOTLB size for their use.
 	 */
-	size = ALIGN(size, IO_TLB_SIZE);
-	default_nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
-	pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
+	swiotlb_default_size = ALIGN(size, IO_TLB_SEGSIZE << IO_TLB_SHIFT);
+	pr_info("SWIOTLB bounce buffer size adjusted to %luMB",
+		swiotlb_default_size >> 20);
 }
 
 void swiotlb_print_info(void)
-- 
2.30.1


