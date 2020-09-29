Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E344727D25D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 17:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.250.590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHL5-0006rr-Eh; Tue, 29 Sep 2020 15:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250.590; Tue, 29 Sep 2020 15:14:47 +0000
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
	id 1kNHL5-0006rE-9B; Tue, 29 Sep 2020 15:14:47 +0000
Received: by outflank-mailman (input) for mailman id 250;
 Tue, 29 Sep 2020 15:14:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5GuN=DG=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kNHL4-0006qi-AB
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:14:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 417d5dd7-20b0-47d2-9c18-c0f93ce9a10d;
 Tue, 29 Sep 2020 15:14:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98A25B049;
 Tue, 29 Sep 2020 15:14:43 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5GuN=DG=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
	id 1kNHL4-0006qi-AB
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:14:46 +0000
X-Inumbo-ID: 417d5dd7-20b0-47d2-9c18-c0f93ce9a10d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 417d5dd7-20b0-47d2-9c18-c0f93ce9a10d;
	Tue, 29 Sep 2020 15:14:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 98A25B049;
	Tue, 29 Sep 2020 15:14:43 +0000 (UTC)
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 1/7] drm/vram-helper: Remove invariant parameters from internal kmap function
Date: Tue, 29 Sep 2020 17:14:31 +0200
Message-Id: <20200929151437.19717-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929151437.19717-1-tzimmermann@suse.de>
References: <20200929151437.19717-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parameters map and is_iomem are always of the same value. Removed them
to prepares the function for conversion to struct dma_buf_map.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 3fe4b326e18e..256b346664f2 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -382,16 +382,16 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
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
+	if (kmap->virtual)
 		goto out;
 
 	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, kmap);
@@ -399,15 +399,10 @@ static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
 		return ERR_PTR(ret);
 
 out:
-	if (!kmap->virtual) {
-		if (is_iomem)
-			*is_iomem = false;
+	if (!kmap->virtual)
 		return NULL; /* not mapped; don't increment ref */
-	}
 	++gbo->kmap_use_count;
-	if (is_iomem)
-		return ttm_kmap_obj_virtual(kmap, is_iomem);
-	return kmap->virtual;
+	return ttm_kmap_obj_virtual(kmap, &is_iomem);
 }
 
 static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
@@ -452,7 +447,7 @@ void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo)
 	ret = drm_gem_vram_pin_locked(gbo, 0);
 	if (ret)
 		goto err_ttm_bo_unreserve;
-	base = drm_gem_vram_kmap_locked(gbo, true, NULL);
+	base = drm_gem_vram_kmap_locked(gbo);
 	if (IS_ERR(base)) {
 		ret = PTR_ERR(base);
 		goto err_drm_gem_vram_unpin_locked;
-- 
2.28.0


