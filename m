Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBE73CA310
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 18:47:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156756.289378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44Vn-0007bS-5v; Thu, 15 Jul 2021 16:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156756.289378; Thu, 15 Jul 2021 16:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44Vn-0007ZA-0F; Thu, 15 Jul 2021 16:46:59 +0000
Received: by outflank-mailman (input) for mailman id 156756;
 Thu, 15 Jul 2021 16:46:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ycjv=MH=deltatee.com=gunthorp@srs-us1.protection.inumbo.net>)
 id 1m44Vl-0008SS-PE
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 16:46:57 +0000
Received: from ale.deltatee.com (unknown [204.191.154.188])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b8fd93e-e58c-11eb-8909-12813bfff9fa;
 Thu, 15 Jul 2021 16:46:15 +0000 (UTC)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m44V1-0001yg-Li; Thu, 15 Jul 2021 10:46:12 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m44Uo-0001nN-8x; Thu, 15 Jul 2021 10:45:58 -0600
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
X-Inumbo-ID: 2b8fd93e-e58c-11eb-8909-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Cc:To:From:content-disposition;
	bh=tVzBPY6/Bgdpsr8bmfZpwFmQV8rVEWLD9Ju+AXRRB/Q=; b=sT6nIphYRpQg2LPmIHPAN9+aTu
	GJh+kG/x4SM7ujeEOwTJw5ilEgyuKzytEd4BRwwLa0nLKahIc7+GQ9qJ4fA5Hu9384ZtjsbuG2b92
	s51DHr3LmCxuscjDOqlyMZ7uwWmozJZCa9HkoIp885CAsrDYo/QLqd7pHbw54nqIDcuExXUrrVRfw
	hZPArbok7AiyAtDvc1e+GRkLRV8zgo/jTjvTVyD1VZI/lSLxAe/izWpR6ucAyWORMvAeNpU6T2dEP
	ToPwTmhEJvkkerb0Tb9hn7uJF1hapwuF3GeNQtxgW4wYN95t0lZGeB9IRWqetmlEjHzeTZ71Uml4S
	1lVZm5YQ==;
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
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date: Thu, 15 Jul 2021 10:45:34 -0600
Message-Id: <20210715164544.6827-7-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, linux@armlinux.org.uk, tsbogend@alpha.franken.de
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH v1 06/16] ARM/dma-mapping: return error code from .map_sg() ops
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure,
so propagate any errors that may happen all the way up.

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/arm/mm/dma-mapping.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index c4b8df2ad328..8c286e690756 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -980,7 +980,7 @@ int arm_dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	struct scatterlist *s;
-	int i, j;
+	int i, j, ret;
 
 	for_each_sg(sg, s, nents, i) {
 #ifdef CONFIG_NEED_SG_DMA_LENGTH
@@ -988,7 +988,8 @@ int arm_dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 #endif
 		s->dma_address = ops->map_page(dev, sg_page(s), s->offset,
 						s->length, dir, attrs);
-		if (dma_mapping_error(dev, s->dma_address))
+		ret = dma_mapping_error(dev, s->dma_address);
+		if (ret)
 			goto bad_mapping;
 	}
 	return nents;
@@ -996,7 +997,7 @@ int arm_dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
  bad_mapping:
 	for_each_sg(sg, s, i, j)
 		ops->unmap_page(dev, sg_dma_address(s), sg_dma_len(s), dir, attrs);
-	return 0;
+	return ret;
 }
 
 /**
@@ -1622,7 +1623,7 @@ static int __iommu_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 		     bool is_coherent)
 {
 	struct scatterlist *s = sg, *dma = sg, *start = sg;
-	int i, count = 0;
+	int i, count = 0, ret;
 	unsigned int offset = s->offset;
 	unsigned int size = s->offset + s->length;
 	unsigned int max = dma_get_max_seg_size(dev);
@@ -1634,8 +1635,10 @@ static int __iommu_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 		s->dma_length = 0;
 
 		if (s->offset || (size & ~PAGE_MASK) || size + s->length > max) {
-			if (__map_sg_chunk(dev, start, size, &dma->dma_address,
-			    dir, attrs, is_coherent) < 0)
+			ret = __map_sg_chunk(dev, start, size,
+					     &dma->dma_address, dir, attrs,
+					     is_coherent);
+			if (ret < 0)
 				goto bad_mapping;
 
 			dma->dma_address += offset;
@@ -1648,8 +1651,9 @@ static int __iommu_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 		}
 		size += s->length;
 	}
-	if (__map_sg_chunk(dev, start, size, &dma->dma_address, dir, attrs,
-		is_coherent) < 0)
+	ret = __map_sg_chunk(dev, start, size, &dma->dma_address, dir, attrs,
+			     is_coherent);
+	if (ret < 0)
 		goto bad_mapping;
 
 	dma->dma_address += offset;
@@ -1660,7 +1664,7 @@ static int __iommu_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 bad_mapping:
 	for_each_sg(sg, s, count, i)
 		__iommu_remove_mapping(dev, sg_dma_address(s), sg_dma_len(s));
-	return 0;
+	return ret;
 }
 
 /**
-- 
2.20.1


