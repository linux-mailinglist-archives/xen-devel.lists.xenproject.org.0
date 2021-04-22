Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B94367AEE
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 09:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115021.219310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTd7-0003MR-UW; Thu, 22 Apr 2021 07:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115021.219310; Thu, 22 Apr 2021 07:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTd7-0003Kl-Q1; Thu, 22 Apr 2021 07:20:05 +0000
Received: by outflank-mailman (input) for mailman id 115021;
 Thu, 22 Apr 2021 07:20:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Z8K=JT=bombadil.srs.infradead.org=batv+ccca8c562e79e8576e72+6451+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lZTd6-0002oJ-Cy
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 07:20:04 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2701f58c-9e93-4833-bf2d-ae415e931107;
 Thu, 22 Apr 2021 07:19:46 +0000 (UTC)
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZTca-00DRkx-Hb; Thu, 22 Apr 2021 07:19:32 +0000
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
X-Inumbo-ID: 2701f58c-9e93-4833-bf2d-ae415e931107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=mQKOkV7O/cQZUeeS2ywVjzBgZ2gsXE3uYRnoQOufOWY=; b=uebudFWLuE7bflMDQQdSHpip3B
	XJBkAvt2kX2G6MchzpNWjh2R5I5XUFdiU9YEccqUF4kwnqBT3m4sBkXQnHY9jHNuENyd0DCmXMTZN
	dBJOdK44cce23/YdS7uP/U8DAILaoZKRL9UpKZjV12NYQkp/tF5xNjHAfhtREAB42GK2cPt59erj+
	tSye60ezBe7oalDxD5wTkF/SJvwbJs5HXXv+xq4rYo4ueA78wnZB3d83Oztierm4iFQ19mw/9DrkA
	DjDnoSkiQsnQNtwCys4BZhCzdt0vHegfZjJoWaoeydlI294lUbZ2HKrrreZNLkVdBQGWu0/XnueMs
	ek06CYVA==;
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
Subject: [PATCH 3/7] swiotlb: use swiotlb_adjust_size in setup_io_tlb_npages
Date: Thu, 22 Apr 2021 09:19:17 +0200
Message-Id: <20210422071921.1428607-4-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210422071921.1428607-1-hch@lst.de>
References: <20210422071921.1428607-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use the proper helper to do the proper alignment of the buffer size
to the requirements of the swiotlb allocator instead of open coding
the logic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 27461fd63e0330..93737d0932fbf2 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -76,11 +76,9 @@ static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
 static int __init
 setup_io_tlb_npages(char *str)
 {
-	if (isdigit(*str)) {
-		/* avoid tail segment of size < IO_TLB_SEGSIZE */
-		default_nslabs =
-			ALIGN(simple_strtoul(str, &str, 0), IO_TLB_SEGSIZE);
-	}
+	if (isdigit(*str))
+		swiotlb_adjust_size(
+			simple_strtoul(str, &str, 0) << IO_TLB_SHIFT);
 	if (*str == ',')
 		++str;
 	if (!strcmp(str, "force"))
-- 
2.30.1


