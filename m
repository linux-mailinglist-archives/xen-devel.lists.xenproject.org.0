Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2713CA305
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 18:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156732.289285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44VK-0002C0-FS; Thu, 15 Jul 2021 16:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156732.289285; Thu, 15 Jul 2021 16:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44VJ-000229-Ty; Thu, 15 Jul 2021 16:46:29 +0000
Received: by outflank-mailman (input) for mailman id 156732;
 Thu, 15 Jul 2021 16:46:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ycjv=MH=deltatee.com=gunthorp@srs-us1.protection.inumbo.net>)
 id 1m44VH-0008SS-OA
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 16:46:27 +0000
Received: from ale.deltatee.com (unknown [204.191.154.188])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29e21944-e58c-11eb-8909-12813bfff9fa;
 Thu, 15 Jul 2021 16:46:12 +0000 (UTC)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m44Ux-0001yd-5T; Thu, 15 Jul 2021 10:46:07 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m44Up-0001nc-2A; Thu, 15 Jul 2021 10:45:59 -0600
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
X-Inumbo-ID: 29e21944-e58c-11eb-8909-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Cc:To:From:content-disposition;
	bh=bP1/zbeT2pa523Na4lBPwCxSPdXLF6EA3VaIa9YAxC8=; b=sJmCUNWZOQ6d70ImKoRR27n6b+
	E39yZfan4G4WzG9wL3lTV+KlnqhMrasNQXRGkyUszUPJHEArPHAPGcY2sWj8PnuG0ob2OZYn24jC7
	YzDiIbJWkFENBGhhXfYDKBWmDzziXvoGGD0YC4LoB3rHM/84eqGdF03tY+VbGdbA+bbu0DCVP2Cxc
	hKSRIDKA15ormrTIGaKN2Qh1cWztWNAY4KnoKZpsuBiMg7vQCgkGb3S96H4k4EX9Lqx5kiNItXR5P
	ezHvRasL53lzmbQQWsT5h7UaFNR4HwdymkezbQ3oQKfE7WBbAYMV2rFas0+V4ja/N2XRd12MEZauy
	2zUp+pNw==;
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
	"David S. Miller" <davem@davemloft.net>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 15 Jul 2021 10:45:39 -0600
Message-Id: <20210715164544.6827-12-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, davem@davemloft.net, schnelle@linux.ibm.com, mpe@ellerman.id.au
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH v1 11/16] sparc/iommu: return error codes from .map_sg() ops
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

Returning an errno from __sbus_iommu_map_sg() results in
sbus_iommu_map_sg_gflush() and sbus_iommu_map_sg_pflush() returning an
errno, as those functions are wrappers around __sbus_iommu_map_sg().

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/sparc/kernel/iommu.c     | 4 ++--
 arch/sparc/kernel/pci_sun4v.c | 4 ++--
 arch/sparc/mm/iommu.c         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
index a034f571d869..0589acd34201 100644
--- a/arch/sparc/kernel/iommu.c
+++ b/arch/sparc/kernel/iommu.c
@@ -448,7 +448,7 @@ static int dma_4u_map_sg(struct device *dev, struct scatterlist *sglist,
 	iommu = dev->archdata.iommu;
 	strbuf = dev->archdata.stc;
 	if (nelems == 0 || !iommu)
-		return 0;
+		return -EINVAL;
 
 	spin_lock_irqsave(&iommu->lock, flags);
 
@@ -580,7 +580,7 @@ static int dma_4u_map_sg(struct device *dev, struct scatterlist *sglist,
 	}
 	spin_unlock_irqrestore(&iommu->lock, flags);
 
-	return 0;
+	return -EINVAL;
 }
 
 /* If contexts are being used, they are the same in all of the mappings
diff --git a/arch/sparc/kernel/pci_sun4v.c b/arch/sparc/kernel/pci_sun4v.c
index 9de57e88f7a1..d90e80fa5705 100644
--- a/arch/sparc/kernel/pci_sun4v.c
+++ b/arch/sparc/kernel/pci_sun4v.c
@@ -486,7 +486,7 @@ static int dma_4v_map_sg(struct device *dev, struct scatterlist *sglist,
 
 	iommu = dev->archdata.iommu;
 	if (nelems == 0 || !iommu)
-		return 0;
+		return -EINVAL;
 	atu = iommu->atu;
 
 	prot = HV_PCI_MAP_ATTR_READ;
@@ -619,7 +619,7 @@ static int dma_4v_map_sg(struct device *dev, struct scatterlist *sglist,
 	}
 	local_irq_restore(flags);
 
-	return 0;
+	return -EINVAL;
 }
 
 static void dma_4v_unmap_sg(struct device *dev, struct scatterlist *sglist,
diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
index 0c0342e5b10d..01ffcedd159c 100644
--- a/arch/sparc/mm/iommu.c
+++ b/arch/sparc/mm/iommu.c
@@ -256,7 +256,7 @@ static int __sbus_iommu_map_sg(struct device *dev, struct scatterlist *sgl,
 		sg->dma_address =__sbus_iommu_map_page(dev, sg_page(sg),
 				sg->offset, sg->length, per_page_flush);
 		if (sg->dma_address == DMA_MAPPING_ERROR)
-			return 0;
+			return -EINVAL;
 		sg->dma_length = sg->length;
 	}
 
-- 
2.20.1


