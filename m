Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FC83DAD1F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jul 2021 22:16:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162030.297298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9CRh-00067r-Kf; Thu, 29 Jul 2021 20:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162030.297298; Thu, 29 Jul 2021 20:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9CRh-00065z-Gx; Thu, 29 Jul 2021 20:15:57 +0000
Received: by outflank-mailman (input) for mailman id 162030;
 Thu, 29 Jul 2021 20:15:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yd/7=MV=deltatee.com=gunthorp@srs-us1.protection.inumbo.net>)
 id 1m9CRg-0005tB-Hv
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 20:15:56 +0000
Received: from ale.deltatee.com (unknown [204.191.154.188])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c743b2a6-f0a9-11eb-986b-12813bfff9fa;
 Thu, 29 Jul 2021 20:15:55 +0000 (UTC)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m9CRZ-0008VM-Dl; Thu, 29 Jul 2021 14:15:50 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m9CRW-0001UQ-LZ; Thu, 29 Jul 2021 14:15:46 -0600
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
X-Inumbo-ID: c743b2a6-f0a9-11eb-986b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Cc:To:From:content-disposition;
	bh=X/PGh6GTfJ6ZdtihVioh5gR+sLDdDHokoaBTKsSS/Sc=; b=Cl0pwajPUF0MbvvK+bH3m8G15c
	iHGMTRHjC70auqPKPrfU/+fnjiDq8xpUMiFyYl3bcXjcpeMj0bAqbgfhD+GY9+ktWOOjLziknbBpV
	eOrDDhbu2P6PbvlVWSvYgPEnlp2BricnQaa43UTkbJu+XUYXR7je7h3vqOKBtF35iiPZChQvy2Y6T
	SQk28+qNruG/mX+ypm5KCA5pmv+A8RtK+979e9bCfNDpbieX0+q4/AvvQXFkzgOrHSbjqtMqcmzC3
	ChuWTdKg/GFTa5IPAkYTKqDInd6tjgcT2Sy8uBUU77cbYGKw3nkXhBa/lC9mrNgps7kOEZnUPfeL7
	SViD+cFQ==;
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
	Logan Gunthorpe <logang@deltatee.com>
Date: Thu, 29 Jul 2021 14:15:39 -0600
Message-Id: <20210729201539.5602-22-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729201539.5602-1-logang@deltatee.com>
References: <20210729201539.5602-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH v3 21/21] dma-mapping: Disallow .map_sg operations from returning zero on error
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Now that all the .map_sg operations have been converted to returning
proper error codes, drop the code to handle a zero return value,
add a warning if a zero is returned.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 kernel/dma/mapping.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 9f0bb56eb9aa..cbcbdc877458 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -196,8 +196,8 @@ static int __dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
 
 	if (ents > 0)
 		debug_dma_map_sg(dev, sg, nents, ents, dir);
-	else if (WARN_ON_ONCE(ents != -EINVAL && ents != -ENOMEM &&
-			      ents != -EIO && ents != 0))
+	else if (WARN_ON_ONCE((ents != -EINVAL && ents != -ENOMEM &&
+			       ents != -EIO) || ents == 0))
 		return -EIO;
 
 	return ents;
@@ -262,9 +262,7 @@ int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
 	int nents;
 
 	nents = __dma_map_sg_attrs(dev, sgt->sgl, sgt->orig_nents, dir, attrs);
-	if (nents == 0)
-		return -EIO;
-	else if (nents < 0)
+	if (nents < 0)
 		return nents;
 
 	sgt->nents = nents;
-- 
2.20.1


