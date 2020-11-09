Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355662AB501
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 11:33:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22326.48611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc4Tm-0007H2-BT; Mon, 09 Nov 2020 10:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22326.48611; Mon, 09 Nov 2020 10:32:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc4Tm-0007GO-5t; Mon, 09 Nov 2020 10:32:54 +0000
Received: by outflank-mailman (input) for mailman id 22326;
 Mon, 09 Nov 2020 10:32:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jo29=EP=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kc4Tk-0007FI-9g
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:32:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d83c79b1-074a-4775-97b5-b1d801e6f370;
 Mon, 09 Nov 2020 10:32:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2DD92AF2F;
 Mon,  9 Nov 2020 10:32:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Jo29=EP=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
	id 1kc4Tk-0007FI-9g
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 10:32:52 +0000
X-Inumbo-ID: d83c79b1-074a-4775-97b5-b1d801e6f370
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d83c79b1-074a-4775-97b5-b1d801e6f370;
	Mon, 09 Nov 2020 10:32:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2DD92AF2F;
	Mon,  9 Nov 2020 10:32:50 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@linux.ie,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	robdclark@gmail.com,
	sean@poorly.run
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Dave Airlie <airlied@redhat.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Qiang Yu <yuq825@gmail.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Eric Anholt <eric@anholt.net>,
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Emil Velikov <emil.velikov@collabora.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Arunpravin <apaneers@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Luben Tuikov <luben.tuikov@amd.com>,
	Madhav Chauhan <madhav.chauhan@amd.com>,
	Nirmoy Das <Nirmoy.Das@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Sam Ravnborg <sam@ravnborg.org>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	etnaviv@lists.freedesktop.org,
	lima@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	spice-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/2] drm/mediatek: Use struct dma_buf_map in GEM vmap ops
Date: Mon,  9 Nov 2020 11:32:42 +0100
Message-Id: <20201109103242.19544-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109103242.19544-1-tzimmermann@suse.de>
References: <20201109103242.19544-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes a build failure with mediatek.

This change was supposed to be part of commit 49a3f51dfeee ("drm/gem:
Use struct dma_buf_map in GEM vmap ops and convert GEM backends"), but
mediatek was forgotten.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 49a3f51dfeee ("drm/gem: Use struct dma_buf_map in GEM vmap ops and convert GEM backends")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Christian König <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Eric Anholt <eric@anholt.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Emil Velikov <emil.velikov@collabora.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Arunpravin <apaneers@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Madhav Chauhan <madhav.chauhan@amd.com>
Cc: Nirmoy Das <Nirmoy.Das@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: dri-devel@lists.freedesktop.org
Cc: etnaviv@lists.freedesktop.org
Cc: lima@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: virtualization@lists.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: xen-devel@lists.xenproject.org
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 20 ++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_gem.h |  4 ++--
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index cdd1a6e61564..28a2ee1336ef 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -240,23 +240,25 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 	return &mtk_gem->base;
 }
 
-void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
+int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
 	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
-	struct sg_table *sgt;
+	struct sg_table *sgt = NULL;
 	unsigned int npages;
 
 	if (mtk_gem->kvaddr)
-		return mtk_gem->kvaddr;
+		goto out;
 
 	sgt = mtk_gem_prime_get_sg_table(obj);
 	if (IS_ERR(sgt))
-		return NULL;
+		return PTR_ERR(sgt);
 
 	npages = obj->size >> PAGE_SHIFT;
 	mtk_gem->pages = kcalloc(npages, sizeof(*mtk_gem->pages), GFP_KERNEL);
-	if (!mtk_gem->pages)
-		goto out;
+	if (!mtk_gem->pages) {
+		kfree(sgt);
+		return -ENOMEM;
+	}
 
 	drm_prime_sg_to_page_addr_arrays(sgt, mtk_gem->pages, NULL, npages);
 
@@ -265,13 +267,15 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
 
 out:
 	kfree(sgt);
+	dma_buf_map_set_vaddr(map, mtk_gem->kvaddr);
 
-	return mtk_gem->kvaddr;
+	return 0;
 }
 
-void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
+void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
 	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
+	void *vaddr = map->vaddr;
 
 	if (!mtk_gem->pages)
 		return;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
index ff9f976d9807..6da5ccb4b933 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
@@ -45,7 +45,7 @@ int mtk_drm_gem_mmap_buf(struct drm_gem_object *obj,
 struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 			struct dma_buf_attachment *attach, struct sg_table *sg);
-void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj);
-void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
+int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 
 #endif
-- 
2.29.2


