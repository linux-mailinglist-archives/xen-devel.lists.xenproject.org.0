Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50EF2A401D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 10:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18074.42848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZsdy-0003Le-99; Tue, 03 Nov 2020 09:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18074.42848; Tue, 03 Nov 2020 09:30:22 +0000
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
	id 1kZsdy-0003LF-66; Tue, 03 Nov 2020 09:30:22 +0000
Received: by outflank-mailman (input) for mailman id 18074;
 Tue, 03 Nov 2020 09:30:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xrPR=EJ=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kZsdw-0003L5-Fc
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 09:30:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 80e816b4-7c1e-46e0-a62b-57310a1ac20d;
 Tue, 03 Nov 2020 09:30:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AEAE2AF4F;
 Tue,  3 Nov 2020 09:30:18 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xrPR=EJ=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
	id 1kZsdw-0003L5-Fc
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 09:30:20 +0000
X-Inumbo-ID: 80e816b4-7c1e-46e0-a62b-57310a1ac20d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 80e816b4-7c1e-46e0-a62b-57310a1ac20d;
	Tue, 03 Nov 2020 09:30:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AEAE2AF4F;
	Tue,  3 Nov 2020 09:30:18 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch,
	sam@ravnborg.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	kraxel@redhat.com,
	l.stach@pengutronix.de,
	linux+etnaviv@armlinux.org.uk,
	christian.gmeiner@gmail.com,
	inki.dae@samsung.com,
	jy0922.shim@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	kgene@kernel.org,
	krzk@kernel.org,
	yuq825@gmail.com,
	bskeggs@redhat.com,
	robh@kernel.org,
	tomeu.vizoso@collabora.com,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	hdegoede@redhat.com,
	sean@poorly.run,
	eric@anholt.net,
	oleksandr_andrushchenko@epam.com,
	ray.huang@amd.com,
	sumit.semwal@linaro.org,
	emil.velikov@collabora.com,
	luben.tuikov@amd.com,
	apaneers@amd.com,
	linus.walleij@linaro.org,
	melissa.srw@gmail.com,
	chris@chris-wilson.co.uk,
	miaoqinglang@huawei.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	etnaviv@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	lima@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	spice-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v7 01/10] drm/vram-helper: Remove invariant parameters from internal kmap function
Date: Tue,  3 Nov 2020 10:30:06 +0100
Message-Id: <20201103093015.1063-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201103093015.1063-1-tzimmermann@suse.de>
References: <20201103093015.1063-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The parameters map and is_iomem are always of the same value. Removed them
to prepares the function for conversion to struct dma_buf_map.

v4:
	* don't check for !kmap->virtual; will always be false

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Christian König <christian.koenig@amd.com>
Tested-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 16d68c04ea5d..e305fadb8bc8 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -378,32 +378,22 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_unpin);
 
-static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
-				      bool map, bool *is_iomem)
+static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo)
 {
 	int ret;
 	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
+	bool is_iomem;
 
 	if (gbo->kmap_use_count > 0)
 		goto out;
 
-	if (kmap->virtual || !map)
-		goto out;
-
 	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, kmap);
 	if (ret)
 		return ERR_PTR(ret);
 
 out:
-	if (!kmap->virtual) {
-		if (is_iomem)
-			*is_iomem = false;
-		return NULL; /* not mapped; don't increment ref */
-	}
 	++gbo->kmap_use_count;
-	if (is_iomem)
-		return ttm_kmap_obj_virtual(kmap, is_iomem);
-	return kmap->virtual;
+	return ttm_kmap_obj_virtual(kmap, &is_iomem);
 }
 
 static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
@@ -448,7 +438,7 @@ void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo)
 	ret = drm_gem_vram_pin_locked(gbo, 0);
 	if (ret)
 		goto err_ttm_bo_unreserve;
-	base = drm_gem_vram_kmap_locked(gbo, true, NULL);
+	base = drm_gem_vram_kmap_locked(gbo);
 	if (IS_ERR(base)) {
 		ret = PTR_ERR(base);
 		goto err_drm_gem_vram_unpin_locked;
-- 
2.29.0


