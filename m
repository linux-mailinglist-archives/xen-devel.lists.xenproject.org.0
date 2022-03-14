Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48B84D7BAD
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 08:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289937.491670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfBM-0005PS-Ab; Mon, 14 Mar 2022 07:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289937.491670; Mon, 14 Mar 2022 07:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfBM-0005MP-5s; Mon, 14 Mar 2022 07:31:56 +0000
Received: by outflank-mailman (input) for mailman id 289937;
 Mon, 14 Mar 2022 07:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BEku=TZ=bombadil.srs.infradead.org=BATV+605a0c0c3369109790a8+6777+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nTfBK-00056d-Ej
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 07:31:54 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf0dc345-a368-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 08:31:49 +0100 (CET)
Received: from [46.140.54.162] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfB1-0044SD-2u; Mon, 14 Mar 2022 07:31:35 +0000
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
X-Inumbo-ID: cf0dc345-a368-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=fpYq2gch6ejmPkcFKPjSyDr7OAs4OQSLe0uyAoUEPa0=; b=1SiDt8zubg5I0ueT636uOGUNeo
	nzdNRiaQCUVWgjMPxZ1+oQTQbyiLg/w4TFouHm2BYLknLSuxCv/ojkO1Z5PpI5wlZ3h0uqPrutEh8
	OuZPV6b5cmTW9qNKKLWRTUH4LF4VetuO/2a0xOe6Q/Fz+TG4amB4EVcoitlw06DP9dGsILqimGObs
	ExsRJz/Gu+rY3tdP9ldFzM98I4FPsnUIBEiN1tfsgCwAluNTubp3//rXJ6sYUpzqebfF0FJRHE1lC
	bxauBfwlUuLRbxzO+E/W4SduALdUw9Kb+9eT67a6+f/Dsi9acNlJyA8zzX7BXeY9ZUCUeg4ftUTle
	5C25WlEg==;
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
Subject: [PATCH 01/15] dma-direct: use is_swiotlb_active in dma_direct_map_page
Date: Mon, 14 Mar 2022 08:31:15 +0100
Message-Id: <20220314073129.1862284-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220314073129.1862284-1-hch@lst.de>
References: <20220314073129.1862284-1-hch@lst.de>
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


