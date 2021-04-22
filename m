Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C7E367AEA
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 09:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115025.219346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTdM-0003sq-VP; Thu, 22 Apr 2021 07:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115025.219346; Thu, 22 Apr 2021 07:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTdM-0003sA-Rg; Thu, 22 Apr 2021 07:20:20 +0000
Received: by outflank-mailman (input) for mailman id 115025;
 Thu, 22 Apr 2021 07:20:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Z8K=JT=bombadil.srs.infradead.org=batv+ccca8c562e79e8576e72+6451+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lZTdL-0002oJ-D3
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 07:20:19 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34332746-7e13-435b-8d06-521101fd59c2;
 Thu, 22 Apr 2021 07:19:51 +0000 (UTC)
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZTck-00DRlu-Sv; Thu, 22 Apr 2021 07:19:43 +0000
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
X-Inumbo-ID: 34332746-7e13-435b-8d06-521101fd59c2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=uecr72uR4S7RBlQH3PaVDyORw5/pv2frUuL1UFgzCPE=; b=nhiKI19LhclhWHaCMD71/Cry2I
	ad6ySo/VVhMQiMubBTbcXCyyZlDNjzYbPA+tZk8BiT5hw3n0w6mKDxom0sj0rvkAgg0i1yyn8o7oo
	1WIEdVXIC6LTk0UxAy1ehak/xKXq6XQPbaGVDUPwPborS1UiEulB3qS7UESlVagzJt4QCZaO9CtEI
	fcQs+SXYcRWhy5a8sDZTyC08Ri/E79nWiQSVrG4ZiR8v9uKg/DTl1oamETbfl6gUflJKqvh2ddxOi
	BdTobsRp+kpB65cIWtJVMzOi3UY9DmsWvx7DOMlmgKmk3irvAqkEQdojJ/k//Qspi8SEXYbVYNPNh
	pTGVPpvQ==;
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
Subject: [PATCH 7/7] swiotlb: don't override the command line in swiotlb_adjust_size
Date: Thu, 22 Apr 2021 09:19:21 +0200
Message-Id: <20210422071921.1428607-8-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210422071921.1428607-1-hch@lst.de>
References: <20210422071921.1428607-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

When the user specified an explicit swiotlb size on the command line,
the achitecture code should not override it.

Fixes: 2cbc2776efe4 ("swiotlb: remove swiotlb_nr_tbl")
Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 87d06ddf4753f3..aef02a3825b494 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -106,7 +106,9 @@ void swiotlb_set_max_segment(unsigned int val)
 
 unsigned long swiotlb_size_or_default(void)
 {
-	return swiotlb_default_size;
+	if (swiotlb_default_size)
+		return swiotlb_default_size;
+	return IO_TLB_DEFAULT_SIZE;
 }
 
 void __init swiotlb_adjust_size(unsigned long size)
@@ -116,6 +118,8 @@ void __init swiotlb_adjust_size(unsigned long size)
 	 * architectures such as those supporting memory encryption to
 	 * adjust/expand SWIOTLB size for their use.
 	 */
+	if (swiotlb_default_size)
+		return;
 	swiotlb_default_size = ALIGN(size, IO_TLB_SEGSIZE << IO_TLB_SHIFT);
 	pr_info("SWIOTLB bounce buffer size adjusted to %luMB",
 		swiotlb_default_size >> 20);
-- 
2.30.1


