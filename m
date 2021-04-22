Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B585367AE8
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 09:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115020.219299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTd2-0002sk-Jf; Thu, 22 Apr 2021 07:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115020.219299; Thu, 22 Apr 2021 07:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTd2-0002sA-Fm; Thu, 22 Apr 2021 07:20:00 +0000
Received: by outflank-mailman (input) for mailman id 115020;
 Thu, 22 Apr 2021 07:19:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Z8K=JT=bombadil.srs.infradead.org=batv+ccca8c562e79e8576e72+6451+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lZTd1-0002oJ-CT
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 07:19:59 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f6b6b23-b8a2-40e9-8e7b-a57a3c3f58c1;
 Thu, 22 Apr 2021 07:19:46 +0000 (UTC)
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZTcd-00DRlK-3P; Thu, 22 Apr 2021 07:19:35 +0000
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
X-Inumbo-ID: 8f6b6b23-b8a2-40e9-8e7b-a57a3c3f58c1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=dYyH/8K4Q8sCxeRfrx+sXZtnFZXl8dFeAAsbGjqR53E=; b=OYuuEeJvdRaOhc/KxZZh+gdgIc
	Pp/EPZXmB/fYLLqsRz/c0KwUZj/GOo1pdbdH6soycjs2KejEXIVJNZ7tQ+lf9O/LsH+jTFSSDOzZd
	t+gxtZRNuq7rxDeh6ySTt1AVSqrH2MQViV22MbxnRmy068+lzX+O0JLxqXQH/5IrHfRCI5qY6KpdA
	kaiQpAzWqDtiwzjkobuFUj9pclIHoEBzbD+b8LiqZ2sMabrUaOwnYHY7zIP1d8+0eoimCFxhiNNI9
	fJTUcQe8yUYVqIZp8UrHTvtUKr17zjKQySXJ4neE19YZy4WQ85r+8TPO/CfTvbmt0vZI1mUJDDUES
	tQclwPXQ==;
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
Subject: [PATCH 4/7] powerpc/pseries: simplify svm_swiotlb_init
Date: Thu, 22 Apr 2021 09:19:18 +0200
Message-Id: <20210422071921.1428607-5-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210422071921.1428607-1-hch@lst.de>
References: <20210422071921.1428607-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

The value returned by swiotlb_size_or_default is always properly
aligned now, so don't duplicate the work.

Signed-off-by: Christoph Hellwig <hch@lst.de>dddd
---
 arch/powerpc/platforms/pseries/svm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 4d281ff56ce96f..9187d2a1ed568d 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -43,20 +43,14 @@ machine_early_initcall(pseries, init_svm);
  */
 void __init svm_swiotlb_init(void)
 {
+	unsigned long bytes = swiotlb_size_or_default();
 	unsigned char *vstart;
-	unsigned long bytes, io_tlb_nslabs;
-
-	io_tlb_nslabs = (swiotlb_size_or_default() >> IO_TLB_SHIFT);
-	io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
-
-	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
 
 	vstart = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
 	if (vstart && !swiotlb_init_with_tbl(vstart, bytes, false))
 		return;
 
-	memblock_free_early(__pa(vstart),
-			    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
+	memblock_free_early(__pa(vstart), PAGE_ALIGN(bytes));
 	panic("SVM: Cannot allocate SWIOTLB buffer");
 }
 
-- 
2.30.1


