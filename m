Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4133624AA84
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 02:02:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8Y27-00011K-2M; Thu, 20 Aug 2020 00:02:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q1N0=B6=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1k8Y26-00011E-AS
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 00:02:18 +0000
X-Inumbo-ID: 7507ca01-b617-4108-abb6-bdbc7ca8b658
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7507ca01-b617-4108-abb6-bdbc7ca8b658;
 Thu, 20 Aug 2020 00:02:17 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F10F321741;
 Thu, 20 Aug 2020 00:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597881737;
 bh=/S/5fcNXp1qF0dj5Sh7EBvrVNQQbog7E1B1vZS/c6vk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lcEIr4B4Gyut2krPkxrECa5l+X6KWt7FqZD5lRLWyqr0s+PTwxrtMnw5QLLrs0PY4
 s78p3Cj6t501J2VPXa3Rwyecj7hubG3I3MxhIAZoDDla0N4ZjeGZvPFXgLj7T/f8jj
 oWf7HAyC2X95hbAZHkpBVQZD8nqan0VmVRLo9e8Q=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Corey Minyard <cminyard@mvista.com>, Roman Shaposhnik <roman@zededa.com>,
 Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
 xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org
Subject: [PATCH AUTOSEL 5.7 16/24] swiotlb-xen: use vmalloc_to_page on vmalloc
 virt addresses
Date: Wed, 19 Aug 2020 20:01:47 -0400
Message-Id: <20200820000155.215089-16-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200820000155.215089-1-sashal@kernel.org>
References: <20200820000155.215089-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Boris Ostrovsky <boris.ostrovsky@oracle.com>

[ Upstream commit 8b1e868f66076490189a36d984fcce286cdd6295 ]

xen_alloc_coherent_pages might return pages for which virt_to_phys and
virt_to_page don't work, e.g. ioremap'ed pages.

So in xen_swiotlb_free_coherent we can't assume that virt_to_page works.
Instead add a is_vmalloc_addr check and use vmalloc_to_page on vmalloc
virt addresses.

This patch fixes the following crash at boot on RPi4 (the underlying
issue is not RPi4 specific):
https://marc.info/?l=xen-devel&m=158862573216800

Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Tested-by: Corey Minyard <cminyard@mvista.com>
Tested-by: Roman Shaposhnik <roman@zededa.com>
Link: https://lore.kernel.org/r/20200710223427.6897-1-sstabellini@kernel.org
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/swiotlb-xen.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index b6d27762c6f8c..5fbadd07819bd 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -335,6 +335,7 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 	int order = get_order(size);
 	phys_addr_t phys;
 	u64 dma_mask = DMA_BIT_MASK(32);
+	struct page *page;
 
 	if (hwdev && hwdev->coherent_dma_mask)
 		dma_mask = hwdev->coherent_dma_mask;
@@ -346,9 +347,14 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 	/* Convert the size to actually allocated. */
 	size = 1UL << (order + XEN_PAGE_SHIFT);
 
+	if (is_vmalloc_addr(vaddr))
+		page = vmalloc_to_page(vaddr);
+	else
+		page = virt_to_page(vaddr);
+
 	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
 		     range_straddles_page_boundary(phys, size)) &&
-	    TestClearPageXenRemapped(virt_to_page(vaddr)))
+	    TestClearPageXenRemapped(page))
 		xen_destroy_contiguous_region(phys, order);
 
 	xen_free_coherent_pages(hwdev, size, vaddr, (dma_addr_t)phys, attrs);
-- 
2.25.1


