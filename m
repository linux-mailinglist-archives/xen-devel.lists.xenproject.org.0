Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A953D4006
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 19:56:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160290.294754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6zPW-0006ks-IW; Fri, 23 Jul 2021 17:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160290.294754; Fri, 23 Jul 2021 17:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6zPW-0006ga-FC; Fri, 23 Jul 2021 17:56:34 +0000
Received: by outflank-mailman (input) for mailman id 160290;
 Fri, 23 Jul 2021 17:56:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uLib=MP=deltatee.com=gunthorp@srs-us1.protection.inumbo.net>)
 id 1m6zKK-0003J8-U8
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 17:51:12 +0000
Received: from ale.deltatee.com (unknown [204.191.154.188])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a34e6f7-4289-4c22-ab2b-5df614dbfd29;
 Fri, 23 Jul 2021 17:50:34 +0000 (UTC)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m6zJe-0005Lg-MM; Fri, 23 Jul 2021 11:50:31 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m6zJL-0005qz-RW; Fri, 23 Jul 2021 11:50:11 -0600
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
X-Inumbo-ID: 7a34e6f7-4289-4c22-ab2b-5df614dbfd29
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Cc:To:From:content-disposition;
	bh=HMmFCnKiUdZs8XdQrQe+q8n2y8J+pVaubqcncKbrGOc=; b=TxLSaXfyIrqdZibn+BQXuDk4R/
	QkjnyO3+7nKEqm6/dBDGqT9B6ehiUwEjYK3p6z170ejG3qzLM7cTIghm+rBdXZtQylTGtZVq/PclA
	W/tzGcPoosyMbkawZFt6ijD+3xj0KCAMjE/J7NDII9fGZO3zJMzjnCUD5cFRAPB6OMusUcsTmC4+9
	R8vDLwVQz5dveEX3lbp3d+dJBFS7utdZyK6HVFyf/72sMOPvIje20PrC/wLI1/0SrI35auk/pob13
	v/FTtTdGeL7zv+mRT/II5A1r8zGvHtaivtA+dsqs3svnUmz2syz2Fr1FHKlWH7Qi77t3YHbS9HKjx
	an0vDIlA==;
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
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Geoff Levand <geoff@infradead.org>
Date: Fri, 23 Jul 2021 11:49:57 -0600
Message-Id: <20210723175008.22410-11-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723175008.22410-1-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, geoff@infradead.org
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	MYRULES_NO_TEXT,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.2
Subject: [PATCH v2 10/21] powerpc/iommu: return error code from .map_sg() ops
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

Propagate the error up if vio_dma_iommu_map_sg() fails.

ppc_iommu_map_sg() may fail either because of iommu_range_alloc() or
because of tbl->it_ops->set(). The former only supports returning an
error with DMA_MAPPING_ERROR and an examination of the latter indicates
that it may return arch-specific errors (for example,
tce_buildmulti_pSeriesLP()). Hence, coalesce all of those errors into
-EIO, per the documentation on dma_map_sgtable().

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/kernel/iommu.c             | 4 ++--
 arch/powerpc/platforms/ps3/system-bus.c | 2 +-
 arch/powerpc/platforms/pseries/vio.c    | 5 +++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 2af89a5e379f..a8ec4fe42817 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -473,7 +473,7 @@ int ppc_iommu_map_sg(struct device *dev, struct iommu_table *tbl,
 	BUG_ON(direction == DMA_NONE);
 
 	if ((nelems == 0) || !tbl)
-		return 0;
+		return -EINVAL;
 
 	outs = s = segstart = &sglist[0];
 	outcount = 1;
@@ -599,7 +599,7 @@ int ppc_iommu_map_sg(struct device *dev, struct iommu_table *tbl,
 		if (s == outs)
 			break;
 	}
-	return 0;
+	return -EIO;
 }
 
 
diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index 1a5665875165..c54eb46f0cfb 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -663,7 +663,7 @@ static int ps3_ioc0_map_sg(struct device *_dev, struct scatterlist *sg,
 			   unsigned long attrs)
 {
 	BUG();
-	return 0;
+	return -EINVAL;
 }
 
 static void ps3_sb_unmap_sg(struct device *_dev, struct scatterlist *sg,
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index e00f3725ec96..e31e59c54f30 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -560,7 +560,8 @@ static int vio_dma_iommu_map_sg(struct device *dev, struct scatterlist *sglist,
 	for_each_sg(sglist, sgl, nelems, count)
 		alloc_size += roundup(sgl->length, IOMMU_PAGE_SIZE(tbl));
 
-	if (vio_cmo_alloc(viodev, alloc_size))
+	ret = vio_cmo_alloc(viodev, alloc_size);
+	if (ret)
 		goto out_fail;
 	ret = ppc_iommu_map_sg(dev, tbl, sglist, nelems, dma_get_mask(dev),
 			direction, attrs);
@@ -577,7 +578,7 @@ static int vio_dma_iommu_map_sg(struct device *dev, struct scatterlist *sglist,
 	vio_cmo_dealloc(viodev, alloc_size);
 out_fail:
 	atomic_inc(&viodev->cmo.allocs_failed);
-	return 0;
+	return ret;
 }
 
 static void vio_dma_iommu_unmap_sg(struct device *dev,
-- 
2.20.1


