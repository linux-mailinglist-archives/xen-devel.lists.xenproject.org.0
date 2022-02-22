Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D234BFCF4
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276968.473384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXD3-0000z7-4F; Tue, 22 Feb 2022 15:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276968.473384; Tue, 22 Feb 2022 15:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXD2-0000vv-Uw; Tue, 22 Feb 2022 15:36:12 +0000
Received: by outflank-mailman (input) for mailman id 276968;
 Tue, 22 Feb 2022 15:36:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CFyZ=TF=bombadil.srs.infradead.org=BATV+11ac0858211c0bd5236f+6757+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nMXCP-0005NI-V9
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:35:34 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11e0b600-93f5-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 16:35:32 +0100 (CET)
Received: from [2001:4bb8:198:f8fc:c22a:ebfc:be8d:63c2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMXCB-00AGo7-Po; Tue, 22 Feb 2022 15:35:20 +0000
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
X-Inumbo-ID: 11e0b600-93f5-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=XYJlVwldNVCJqO/+tuKojN3UlpP6EWuPoimLYHKi/jc=; b=PjYqXlXh0/xMADYjBN4lX4q5Ly
	AuFycvSAdpIXN9YbLSHqw0K2dYILwjr7wgIeGZEPaMgVELz5o/txiNNKILc4nXrxHan9rtYYBwlmt
	7GaftcZ0rDAFxBm9a1LqzQTCL93a6M9uf1PyDLGYGiRgPK7ZuYIRQDsrVP9eN9dOO9swFx1vDeZc+
	yZPvyf1fh6NCG0uMF/LNlnZNoPYsVTSxgQ7mhLCFFvpZJhhnjfKuephjOMuwK1KFrmapY7foUzQ7p
	05RnloFRKzpM7mJ1akDcM3wUeCLyhzdFOE+AL1st9GwnxOLIxR7uY8XZpOgAYp4TpNIfEYTRusOAm
	VVgxXFDQ==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: [PATCH 01/11] dma-direct: use is_swiotlb_active in dma_direct_map_page
Date: Tue, 22 Feb 2022 16:35:04 +0100
Message-Id: <20220222153514.593231-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222153514.593231-1-hch@lst.de>
References: <20220222153514.593231-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use the more specific is_swiotlb_active check instead of checking the
global swiotlb_force variable.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index 4632b0f4f72eb..4dc16e08c7e1a 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -91,7 +91,7 @@ static inline dma_addr_t dma_direct_map_page(struct device *dev,
 		return swiotlb_map(dev, phys, size, dir, attrs);
 
 	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
-		if (swiotlb_force != SWIOTLB_NO_FORCE)
+		if (is_swiotlb_active(dev))
 			return swiotlb_map(dev, phys, size, dir, attrs);
 
 		dev_WARN_ONCE(dev, 1,
-- 
2.30.2


