Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE09367AE7
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 09:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115018.219275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTct-0002on-VE; Thu, 22 Apr 2021 07:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115018.219275; Thu, 22 Apr 2021 07:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTct-0002oO-Rs; Thu, 22 Apr 2021 07:19:51 +0000
Received: by outflank-mailman (input) for mailman id 115018;
 Thu, 22 Apr 2021 07:19:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Z8K=JT=bombadil.srs.infradead.org=batv+ccca8c562e79e8576e72+6451+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lZTcr-0002oJ-Ks
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 07:19:49 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38248176-4324-4d82-89ac-0b8bf5972c1a;
 Thu, 22 Apr 2021 07:19:46 +0000 (UTC)
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZTcX-00DRko-OO; Thu, 22 Apr 2021 07:19:30 +0000
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
X-Inumbo-ID: 38248176-4324-4d82-89ac-0b8bf5972c1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ocKi+a7wA4qY8frBZ78pjJ0PvLqvNZlAHfEVjthKdOw=; b=rIas4ugj56r8ElM/bnchDokS2d
	mFY5g6FAgdaRMzZSuL6wueVstVK+INGvP9FcnGBJPEx2Wz/58EaILo4Vd3JtUgnDVm/Pe5jfEeMy+
	n1VLxAk7vCdLqB8GfXBHw9YNAOymqr2nOEIbCxLsqNEW12sxs1g+x22cc7mXLNMHbK2P7p/bVy5y/
	c0zYvlu8JhJ3C/qoUFlucMevgR+R0jg8QXQFG8p0uUfNsqp2ASnwLBv6GoVWDdt1t35j5sTsNuElg
	0QI/6vvUiKqAIdYUzgDbJn4cHtdqkXpBlqYT9+i7m+45G4wwGBZTefduoz+81IYCwYckzOSCKXnEM
	Z5BkkTkQ==;
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
Subject: [PATCH 2/7] swiotlb: use swiotlb_size_or_default in swiotlb_init
Date: Thu, 22 Apr 2021 09:19:16 +0200
Message-Id: <20210422071921.1428607-3-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210422071921.1428607-1-hch@lst.de>
References: <20210422071921.1428607-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use swiotlb_size_or_default to calculate the buffer size insted of
open coding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index c7b3dd86db7f56..27461fd63e0330 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -209,7 +209,7 @@ int __init swiotlb_init_with_tbl(char *tlb, size_t bytes, int verbose)
 void  __init
 swiotlb_init(int verbose)
 {
-	size_t bytes = default_nslabs << IO_TLB_SHIFT;
+	size_t bytes = swiotlb_size_or_default();
 	void *tlb;
 
 	if (swiotlb_force == SWIOTLB_NO_FORCE)
-- 
2.30.1


