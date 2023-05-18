Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF867708303
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 15:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536355.834612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzduf-000728-GK; Thu, 18 May 2023 13:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536355.834612; Thu, 18 May 2023 13:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzduf-0006zA-AX; Thu, 18 May 2023 13:43:25 +0000
Received: by outflank-mailman (input) for mailman id 536355;
 Thu, 18 May 2023 13:43:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cezo=BH=bombadil.srs.infradead.org=BATV+e1e315a83c1522261844+7207+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1pzdud-0006XN-2k
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 13:43:23 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f34b7459-f581-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 15:43:20 +0200 (CEST)
Received: from [2001:4bb8:188:3dd5:1149:8081:5f51:3e54] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pzduK-00D6SB-1r; Thu, 18 May 2023 13:43:05 +0000
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
X-Inumbo-ID: f34b7459-f581-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=0qIa3nDGH6TUOBAqJwF2s8Hp3AbyQ3Z9bxsITaMukWA=; b=pbfDTeq5MMRbhVEH4CcdLdnaIl
	cLan6u3lCSEqM4f7q8nJqZieDbhwOHHwFhSmsXM+2qxYj6DG3yMd0HOMjR58sstguuZ77BU9YJPyF
	Gq2BxiI4p9KIc19qV7MrhjjquWR8DTa68qrZBvDpK4lspAF2bcFqXQFEGH/ctEOaYlz0ydULrznJu
	fTKWdqL1KcqMzgW8IWNlqgjkpiSonSU/N02Ryto3srwkIe5afJY4CG3YrCwULl9ZWmNuF8if5C7Pj
	f+9G6D6Evcs7iO6Gx1cZhk6B1nbfBHfS3KpZeNIVDKkj5akOhZyeVSrW5OgkXWV06WpKhlDx7WvLX
	bin8x6rQ==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>
Cc: xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 3/4] drm/nouveau: stop using is_swiotlb_active
Date: Thu, 18 May 2023 15:42:52 +0200
Message-Id: <20230518134253.909623-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518134253.909623-1-hch@lst.de>
References: <20230518134253.909623-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Drivers have no business looking into dma-mapping internals and check
what backend is used.  Unfortunstely the DRM core is still broken and
tries to do plain page allocations instead of using DMA API allocators
by default and uses various bandaids on when to use dma_alloc_coherent.

Switch nouveau to use the same (broken) scheme as amdgpu and radeon
to remove the last driver user of is_swiotlb_active.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 1469a88910e45d..486f39f31a38df 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -24,9 +24,9 @@
  */
 
 #include <linux/limits.h>
-#include <linux/swiotlb.h>
 
 #include <drm/ttm/ttm_range_manager.h>
+#include <drm/drm_cache.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_gem.h"
@@ -265,7 +265,6 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	struct nvkm_pci *pci = device->pci;
 	struct nvif_mmu *mmu = &drm->client.mmu;
 	struct drm_device *dev = drm->dev;
-	bool need_swiotlb = false;
 	int typei, ret;
 
 	ret = nouveau_ttm_init_host(drm, 0);
@@ -300,13 +299,10 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 		drm->agp.cma = pci->agp.cma;
 	}
 
-#if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
-	need_swiotlb = is_swiotlb_active(dev->dev);
-#endif
-
 	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
 				  dev->anon_inode->i_mapping,
-				  dev->vma_offset_manager, need_swiotlb,
+				  dev->vma_offset_manager,
+				  drm_need_swiotlb(drm->client.mmu.dmabits),
 				  drm->client.mmu.dmabits <= 32);
 	if (ret) {
 		NV_ERROR(drm, "error initialising bo driver, %d\n", ret);
-- 
2.39.2


