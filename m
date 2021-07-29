Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763CA3DAD3D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jul 2021 22:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162066.297465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9CSI-0004KJ-NB; Thu, 29 Jul 2021 20:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162066.297465; Thu, 29 Jul 2021 20:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9CSI-00048B-FR; Thu, 29 Jul 2021 20:16:34 +0000
Received: by outflank-mailman (input) for mailman id 162066;
 Thu, 29 Jul 2021 20:16:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yd/7=MV=deltatee.com=gunthorp@srs-us1.protection.inumbo.net>)
 id 1m9CSF-0005tB-F7
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 20:16:31 +0000
Received: from ale.deltatee.com (unknown [204.191.154.188])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc67431b-f0a9-11eb-986b-12813bfff9fa;
 Thu, 29 Jul 2021 20:16:03 +0000 (UTC)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m9CRh-0008VL-Ts; Thu, 29 Jul 2021 14:15:59 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m9CRU-0001Tw-W8; Thu, 29 Jul 2021 14:15:45 -0600
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
X-Inumbo-ID: cc67431b-f0a9-11eb-986b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Cc:To:From:content-disposition;
	bh=OuJXER8TMWR954py7rg3mrCeDrxT4LjuVdKtzQZh6Zs=; b=UsY1ykbNnjwkWofJbI4f1VZfve
	Fb9GcU4897V0RXhNncyMCRQe7sgayHYtP/HsNnSTTgqV9fSgROyJgV2gOe2yhHQenOAwFghjiU+BP
	uBE72UYytCEMGELWbGcFBBFJ5DWJpDLdjxjdJ9o76T9/kXM4wUFj1A8GLgLcyYjYD9MYMXT/FVYJJ
	Xx9pqTWgXTMsYLV8JIWCFloKjmqOwP1AMgRG486raP6kmoPLNwRZM9Mva9yei/8c15JbavQd4F9cE
	bLRW9IWYGnW3Qd2UKQozsPYqQvM1z51/XZf/VA6C4GY0Cm7DkqTL8dIi4hp3eobbIJjY1Wlrv5TfE
	YeqChe0w==;
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
Date: Thu, 29 Jul 2021 14:15:29 -0600
Message-Id: <20210729201539.5602-12-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729201539.5602-1-logang@deltatee.com>
References: <20210729201539.5602-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, geoff@infradead.org
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	MYRULES_FREE,MYRULES_NO_TEXT,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.2
Subject: [PATCH v3 11/21] powerpc/iommu: don't set failed sg dma_address to DMA_MAPPING_ERROR
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Setting the ->dma_address to DMA_MAPPING_ERROR is not part of
the ->map_sg calling convention, so remove it.

Link: https://lore.kernel.org/linux-mips/20210716063241.GC13345@lst.de/
Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/kernel/iommu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index a8ec4fe42817..30b7736f0896 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -575,7 +575,6 @@ int ppc_iommu_map_sg(struct device *dev, struct iommu_table *tbl,
 	 */
 	if (outcount < incount) {
 		outs = sg_next(outs);
-		outs->dma_address = DMA_MAPPING_ERROR;
 		outs->dma_length = 0;
 	}
 
@@ -593,7 +592,6 @@ int ppc_iommu_map_sg(struct device *dev, struct iommu_table *tbl,
 			npages = iommu_num_pages(s->dma_address, s->dma_length,
 						 IOMMU_PAGE_SIZE(tbl));
 			__iommu_free(tbl, vaddr, npages);
-			s->dma_address = DMA_MAPPING_ERROR;
 			s->dma_length = 0;
 		}
 		if (s == outs)
-- 
2.20.1


