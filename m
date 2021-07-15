Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271123CA30F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 18:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156752.289366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44Vh-0006oL-S8; Thu, 15 Jul 2021 16:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156752.289366; Thu, 15 Jul 2021 16:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44Vh-0006lH-Nd; Thu, 15 Jul 2021 16:46:53 +0000
Received: by outflank-mailman (input) for mailman id 156752;
 Thu, 15 Jul 2021 16:46:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ycjv=MH=deltatee.com=gunthorp@srs-us1.protection.inumbo.net>)
 id 1m44Vg-0008SS-P0
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 16:46:52 +0000
Received: from ale.deltatee.com (unknown [204.191.154.188])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a2f15a1-e58c-11eb-8909-12813bfff9fa;
 Thu, 15 Jul 2021 16:46:14 +0000 (UTC)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m44V0-0001ye-IS; Thu, 15 Jul 2021 10:46:11 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m44Uo-0001nQ-Dh; Thu, 15 Jul 2021 10:45:58 -0600
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
X-Inumbo-ID: 2a2f15a1-e58c-11eb-8909-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Cc:To:From:content-disposition;
	bh=yHZJDyrbtc2DNRkkLnCWk6LyCavHBAROxZPaBwPJV+w=; b=Uk9hmVlOMLTaHT5Tplw3GW15jH
	CeVS5nCeJY2tUo3aAcbZduCSQVDn0jptjFbmtnj3v5G8CraUuCNv7B/bA1lXnwAqLJwQNB2t23QL6
	GCZqhLMOwzqRH34G+Y5BBzb4NQhwdrGK5mOkNWXt9gAGnvdQqFYRscmaU6pWKWcE7qUt7wO4D80pe
	8/PNToWYD9qaWrwbmxJrGUcHjdK3p3BXVy4naPhfKpzb1aURkg8IXCH/NXXzv+OOVY95aZoB5qwfA
	QHHlGEKoZAnVNvL5MsmbOBHtpgrk0NyNnIEds8LB/+w6+0+ZS1RCVbWjm8vff/8qi0kFo6Sr+2pOL
	bwtGjm0w==;
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
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date: Thu, 15 Jul 2021 10:45:35 -0600
Message-Id: <20210715164544.6827-8-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, mpe@ellerman.id.au, schnelle@linux.ibm.com, tsbogend@alpha.franken.de
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH v1 07/16] ia64/sba_iommu: return error code from sba_map_sg_attrs()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

Propagate the return of dma_mapping_error() up, if it is an errno.

sba_coalesce_chunks() may only presently fail if sba_alloc_range()
fails, which in turn only fails if the iommu is out of mapping
resources, hence a -ENOMEM is used in that case.

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/ia64/hp/common/sba_iommu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/ia64/hp/common/sba_iommu.c b/arch/ia64/hp/common/sba_iommu.c
index 9148ddbf02e5..09dbe07a18c1 100644
--- a/arch/ia64/hp/common/sba_iommu.c
+++ b/arch/ia64/hp/common/sba_iommu.c
@@ -1431,7 +1431,7 @@ static int sba_map_sg_attrs(struct device *dev, struct scatterlist *sglist,
 			    unsigned long attrs)
 {
 	struct ioc *ioc;
-	int coalesced, filled = 0;
+	int coalesced, filled = 0, ret;
 #ifdef ASSERT_PDIR_SANITY
 	unsigned long flags;
 #endif
@@ -1458,8 +1458,9 @@ static int sba_map_sg_attrs(struct device *dev, struct scatterlist *sglist,
 		sglist->dma_length = sglist->length;
 		sglist->dma_address = sba_map_page(dev, sg_page(sglist),
 				sglist->offset, sglist->length, dir, attrs);
-		if (dma_mapping_error(dev, sglist->dma_address))
-			return 0;
+		ret = dma_mapping_error(dev, sglist->dma_address);
+		if (ret)
+			return ret;
 		return 1;
 	}
 
@@ -1486,7 +1487,7 @@ static int sba_map_sg_attrs(struct device *dev, struct scatterlist *sglist,
 	coalesced = sba_coalesce_chunks(ioc, dev, sglist, nents);
 	if (coalesced < 0) {
 		sba_unmap_sg_attrs(dev, sglist, nents, dir, attrs);
-		return 0;
+		return -ENOMEM;
 	}
 
 	/*
-- 
2.20.1


