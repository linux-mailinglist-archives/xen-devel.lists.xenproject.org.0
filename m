Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 406164C89DB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 11:53:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281111.479311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP08N-00038k-C9; Tue, 01 Mar 2022 10:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281111.479311; Tue, 01 Mar 2022 10:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP08N-00033l-2V; Tue, 01 Mar 2022 10:53:35 +0000
Received: by outflank-mailman (input) for mailman id 281111;
 Tue, 01 Mar 2022 10:53:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AA0s=TM=bombadil.srs.infradead.org=BATV+e5026ef6e36407c4b08a+6764+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nP08L-00031b-9S
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 10:53:33 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3f564ac-994d-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 11:53:30 +0100 (CET)
Received: from [2.53.44.23] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP086-00GCwl-PS; Tue, 01 Mar 2022 10:53:19 +0000
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
X-Inumbo-ID: d3f564ac-994d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=fpYq2gch6ejmPkcFKPjSyDr7OAs4OQSLe0uyAoUEPa0=; b=fPAUDOwUGnyXtx+hZA5zj2Ej4o
	HV9I6mYI0fayhovoE3oLXfq8qlMel6pFXXEc1mFWZvLXjhqfrbEyGhTBlOaKUDjaA5CMiNeYGJSlR
	GdeXeohIETuTXXnuIlqxqGPh/VMWo8hZjPyELE8feSOsKIkrkw8+qaC6yMhYVu17XpDc82M+q7Bjt
	P632yeVc6VELpePyjZp8VgOAEAH7yaxooKuzgDiHjXqCwex8uGIgNuXO8DeKOfVen/Dat6rNPrxN6
	ijjP0c7VtoQrVKhle4tTPRFAXwLIjwChLUwuVEdyRedzAx7rh05DpVyMdlXZjiKBQ/Hagn5ofY1Vr
	BAWrqPTg==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
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
Subject: [PATCH 01/12] dma-direct: use is_swiotlb_active in dma_direct_map_page
Date: Tue,  1 Mar 2022 12:53:00 +0200
Message-Id: <20220301105311.885699-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301105311.885699-1-hch@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use the more specific is_swiotlb_active check instead of checking the
global swiotlb_force variable.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
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


