Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD9026A7D6
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 17:00:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kICRg-0000qJ-IB; Tue, 15 Sep 2020 15:00:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X5gY=CY=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kICRf-0000TT-Fq
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 15:00:35 +0000
X-Inumbo-ID: 2cf732ae-26f0-4379-b6f5-81a636c1d6b1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cf732ae-26f0-4379-b6f5-81a636c1d6b1;
 Tue, 15 Sep 2020 15:00:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C6525AFB7;
 Tue, 15 Sep 2020 15:00:24 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
 tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com,
 heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
 tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
 andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 aaron.liu@amd.com, nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 09/21] drm/nouveau: Introduce GEM object functions
Date: Tue, 15 Sep 2020 16:59:46 +0200
Message-Id: <20200915145958.19993-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915145958.19993-1-tzimmermann@suse.de>
References: <20200915145958.19993-1-tzimmermann@suse.de>
MIME-Version: 1.0
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

GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in nouveau.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  9 ---------
 drivers/gpu/drm/nouveau/nouveau_gem.c   | 13 +++++++++++++
 drivers/gpu/drm/nouveau/nouveau_gem.h   |  2 ++
 drivers/gpu/drm/nouveau/nouveau_prime.c |  2 ++
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 42fc5c813a9b..72640bca1617 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1207,16 +1207,7 @@ driver_stub = {
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_pin = nouveau_gem_prime_pin,
-	.gem_prime_unpin = nouveau_gem_prime_unpin,
-	.gem_prime_get_sg_table = nouveau_gem_prime_get_sg_table,
 	.gem_prime_import_sg_table = nouveau_gem_prime_import_sg_table,
-	.gem_prime_vmap = nouveau_gem_prime_vmap,
-	.gem_prime_vunmap = nouveau_gem_prime_vunmap,
-
-	.gem_free_object_unlocked = nouveau_gem_object_del,
-	.gem_open_object = nouveau_gem_object_open,
-	.gem_close_object = nouveau_gem_object_close,
 
 	.dumb_create = nouveau_display_dumb_create,
 	.dumb_map_offset = nouveau_display_dumb_map_offset,
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 89adadf4706b..28e0cbb00876 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -169,6 +169,17 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	ttm_bo_unreserve(&nvbo->bo);
 }
 
+const struct drm_gem_object_funcs nouveau_gem_object_funcs = {
+	.free = nouveau_gem_object_del,
+	.open = nouveau_gem_object_open,
+	.close = nouveau_gem_object_close,
+	.pin = nouveau_gem_prime_pin,
+	.unpin = nouveau_gem_prime_unpin,
+	.get_sg_table = nouveau_gem_prime_get_sg_table,
+	.vmap = nouveau_gem_prime_vmap,
+	.vunmap = nouveau_gem_prime_vunmap,
+};
+
 int
 nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 		uint32_t tile_mode, uint32_t tile_flags,
@@ -186,6 +197,8 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 	if (IS_ERR(nvbo))
 		return PTR_ERR(nvbo);
 
+	nvbo->bo.base.funcs = &nouveau_gem_object_funcs;
+
 	/* Initialize the embedded gem-object. We return a single gem-reference
 	 * to the caller, instead of a normal nouveau_bo ttm reference. */
 	ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.h b/drivers/gpu/drm/nouveau/nouveau_gem.h
index 978e07591990..b35c180322e2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.h
@@ -5,6 +5,8 @@
 #include "nouveau_drv.h"
 #include "nouveau_bo.h"
 
+extern const struct drm_gem_object_funcs nouveau_gem_object_funcs;
+
 static inline struct nouveau_bo *
 nouveau_gem_object(struct drm_gem_object *gem)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index b2ecb91f8ddc..a8264aebf3d4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -77,6 +77,8 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
 
 	nvbo->valid_domains = NOUVEAU_GEM_DOMAIN_GART;
 
+	nvbo->bo.base.funcs = &nouveau_gem_object_funcs;
+
 	/* Initialize the embedded gem-object. We return a single gem-reference
 	 * to the caller, instead of a normal nouveau_bo ttm reference. */
 	ret = drm_gem_object_init(dev, &nvbo->bo.base, size);
-- 
2.28.0


