Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9684A3D3F77
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 19:51:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160222.294675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6zK8-0000pF-L0; Fri, 23 Jul 2021 17:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160222.294675; Fri, 23 Jul 2021 17:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6zK8-0000gf-EP; Fri, 23 Jul 2021 17:51:00 +0000
Received: by outflank-mailman (input) for mailman id 160222;
 Fri, 23 Jul 2021 17:50:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uLib=MP=deltatee.com=gunthorp@srs-us1.protection.inumbo.net>)
 id 1m6zK6-0003JD-CR
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 17:50:58 +0000
Received: from ale.deltatee.com (unknown [204.191.154.188])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a35b93e-ebde-11eb-9468-12813bfff9fa;
 Fri, 23 Jul 2021 17:50:33 +0000 (UTC)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m6zJO-0005Ll-A4; Fri, 23 Jul 2021 11:50:30 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m6zJL-0005qh-1o; Fri, 23 Jul 2021 11:50:11 -0600
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
X-Inumbo-ID: 7a35b93e-ebde-11eb-9468-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Cc:To:From:content-disposition;
	bh=/XA9bvLAJiET8xClVyx9hB75GctlP2ewYMlZJlt3uAE=; b=HVJMNHeBGjTuQRAX0PgDaC3zF2
	h4cFnFeAvCNXzd9WB8YAG3qqGAv0WBWLbO2yY4NNajXtkYGAXSYNnPhoG7Lsjp3jXRGUtxG+C5tQn
	AO0Nyq1daI9kQFtb2tSUAzZkClLvu/2QNdTDESutu8/SuROXeaEliD8I20+iQ0Q2iu0v3EYLv9M04
	tvI2zgmfI0S1vEJQafhJJMTcn12/OuRwVgbR0rnxIWvsOK7Ab18O80JLZOjNRvrRT/6OZ8cEUdjVI
	0CnvcX+WKT1/RPsKegdoIVUqcHKgcZAEo1DdIxORDEfwRA67XH368HFyGiw2MOs512nK27QI9tO6q
	7PJ3h2zw==;
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
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Date: Fri, 23 Jul 2021 11:49:51 -0600
Message-Id: <20210723175008.22410-5-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723175008.22410-1-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, joro@8bytes.org, will@kernel.org
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	MYRULES_FREE,MYRULES_NO_TEXT,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.2
Subject: [PATCH v2 04/21] dma-iommu: Return error code from iommu_dma_map_sg()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Return appropriate error codes EINVAL or ENOMEM from
iommup_dma_map_sg(). If lower level code returns ENOMEM, then we
return it, other errors are coalesced into EINVAL.

iommu_dma_map_sg_swiotlb() returns -EIO as its an unknown error
from a call that returns DMA_MAPPING_ERROR.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
---
 drivers/iommu/dma-iommu.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 98ba927aee1a..d9aaed080e68 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -972,7 +972,7 @@ static int iommu_dma_map_sg_swiotlb(struct device *dev, struct scatterlist *sg,
 
 out_unmap:
 	iommu_dma_unmap_sg_swiotlb(dev, sg, i, dir, attrs | DMA_ATTR_SKIP_CPU_SYNC);
-	return 0;
+	return -EIO;
 }
 
 /*
@@ -993,11 +993,13 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	dma_addr_t iova;
 	size_t iova_len = 0;
 	unsigned long mask = dma_get_seg_boundary(dev);
+	ssize_t ret;
 	int i;
 
-	if (static_branch_unlikely(&iommu_deferred_attach_enabled) &&
-	    iommu_deferred_attach(dev, domain))
-		return 0;
+	if (static_branch_unlikely(&iommu_deferred_attach_enabled)) {
+		ret = iommu_deferred_attach(dev, domain);
+		goto out;
+	}
 
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		iommu_dma_sync_sg_for_device(dev, sg, nents, dir);
@@ -1045,14 +1047,17 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	}
 
 	iova = iommu_dma_alloc_iova(domain, iova_len, dma_get_mask(dev), dev);
-	if (!iova)
+	if (!iova) {
+		ret = -ENOMEM;
 		goto out_restore_sg;
+	}
 
 	/*
 	 * We'll leave any physical concatenation to the IOMMU driver's
 	 * implementation - it knows better than we do.
 	 */
-	if (iommu_map_sg_atomic(domain, iova, sg, nents, prot) < iova_len)
+	ret = iommu_map_sg_atomic(domain, iova, sg, nents, prot);
+	if (ret < iova_len)
 		goto out_free_iova;
 
 	return __finalise_sg(dev, sg, nents, iova);
@@ -1061,7 +1066,11 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	iommu_dma_free_iova(cookie, iova, iova_len, NULL);
 out_restore_sg:
 	__invalidate_sg(sg, nents);
-	return 0;
+out:
+	if (ret == -ENOMEM)
+		return ret;
+	else
+		return -EINVAL;
 }
 
 static void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
-- 
2.20.1


