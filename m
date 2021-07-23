Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 932043D3F74
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 19:51:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160221.294669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6zK8-0000hC-6L; Fri, 23 Jul 2021 17:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160221.294669; Fri, 23 Jul 2021 17:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6zK7-0000bS-SH; Fri, 23 Jul 2021 17:50:59 +0000
Received: by outflank-mailman (input) for mailman id 160221;
 Fri, 23 Jul 2021 17:50:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uLib=MP=deltatee.com=gunthorp@srs-us1.protection.inumbo.net>)
 id 1m6zK5-0003J8-TU
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 17:50:57 +0000
Received: from ale.deltatee.com (unknown [204.191.154.188])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b40c562a-7b9f-47ec-b2e1-732abb71e25b;
 Fri, 23 Jul 2021 17:50:31 +0000 (UTC)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m6zJb-0005Lh-V7; Fri, 23 Jul 2021 11:50:28 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m6zJM-0005r5-69; Fri, 23 Jul 2021 11:50:12 -0600
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
X-Inumbo-ID: b40c562a-7b9f-47ec-b2e1-732abb71e25b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Cc:To:From:content-disposition;
	bh=wMwfB+QVxoWPoNbugW7oseZQ2FEaT6sisUumX/+txWI=; b=pfXfAO7YkOcMYhlz3wKSIjwOWJ
	gcxE6m3ltAk47piXpHGv2GRrb5g21F9D+3bWQ8vWi9qG7xdYyEcimyshYKPGP3KMDm9kInzPt6V5C
	U8QoSnjyjjf42kffJsVZpy39L235sFV/Zil2OphUTZJ8IXsxqp9j2BgmTes/2bQqNfGv0x7cf6hO0
	rejKXvPKnCvWltqW8pIXuMF7o0QlXbq2u4cOyUAiJ76OXWRV+3jtaD4tsw7XwEbHVG1u6fkn4ftdg
	8d8RrukAz+smxebL5eapHTLsP77WyjxI6UGg7JrhesQT+y9Rt3L5zg+scZZ3UHDXFlWWuCsc0OMUH
	CyKjeeTA==;
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	linux-parisc@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Stephen Bates <sbates@raithlin.com>,
	Martin Oliveira <martin.oliveira@eideticom.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>
Date: Fri, 23 Jul 2021 11:49:59 -0600
Message-Id: <20210723175008.22410-13-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723175008.22410-1-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, schnelle@linux.ibm.com, gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH v2 12/21] s390/pci: return error code from s390_dma_map_sg()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

So propagate the error from __s390_dma_map_sg() up. __s390_dma_map_sg()
returns either -ENOMEM on allocation failure or -EINVAL which is
the same as what's expected by dma_map_sgtable().

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
---
 arch/s390/pci/pci_dma.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/s390/pci/pci_dma.c b/arch/s390/pci/pci_dma.c
index ebc9a49523aa..c78b02012764 100644
--- a/arch/s390/pci/pci_dma.c
+++ b/arch/s390/pci/pci_dma.c
@@ -487,7 +487,7 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	unsigned int max = dma_get_max_seg_size(dev);
 	unsigned int size = s->offset + s->length;
 	unsigned int offset = s->offset;
-	int count = 0, i;
+	int count = 0, i, ret;
 
 	for (i = 1; i < nr_elements; i++) {
 		s = sg_next(s);
@@ -497,8 +497,9 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
 
 		if (s->offset || (size & ~PAGE_MASK) ||
 		    size + s->length > max) {
-			if (__s390_dma_map_sg(dev, start, size,
-					      &dma->dma_address, dir))
+			ret = __s390_dma_map_sg(dev, start, size,
+						&dma->dma_address, dir);
+			if (ret)
 				goto unmap;
 
 			dma->dma_address += offset;
@@ -511,7 +512,8 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		}
 		size += s->length;
 	}
-	if (__s390_dma_map_sg(dev, start, size, &dma->dma_address, dir))
+	ret = __s390_dma_map_sg(dev, start, size, &dma->dma_address, dir);
+	if (ret)
 		goto unmap;
 
 	dma->dma_address += offset;
@@ -523,7 +525,7 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		s390_dma_unmap_pages(dev, sg_dma_address(s), sg_dma_len(s),
 				     dir, attrs);
 
-	return 0;
+	return ret;
 }
 
 static void s390_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
-- 
2.20.1


