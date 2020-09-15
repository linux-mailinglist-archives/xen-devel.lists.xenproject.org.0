Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4794526A7C8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 17:00:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kICRb-0000lG-PF; Tue, 15 Sep 2020 15:00:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X5gY=CY=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kICRa-0000TT-Ff
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 15:00:30 +0000
X-Inumbo-ID: 4282a109-e6e9-4042-b1dc-c09340d2cb77
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4282a109-e6e9-4042-b1dc-c09340d2cb77;
 Tue, 15 Sep 2020 15:00:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69906AFB0;
 Tue, 15 Sep 2020 15:00:23 +0000 (UTC)
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
Subject: [PATCH v2 07/21] drm/mediatek: Introduce GEM object functions
Date: Tue, 15 Sep 2020 16:59:44 +0200
Message-Id: <20200915145958.19993-8-tzimmermann@suse.de>
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
per-instance callbacks in mediatek. The only exception is gem_prime_mmap,
which is non-trivial to convert.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  5 -----
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 040a8f393fe2..2f8d0043fca7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -301,18 +301,13 @@ struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device *dev,
 static struct drm_driver mtk_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 
-	.gem_free_object_unlocked = mtk_drm_gem_free_object,
-	.gem_vm_ops = &drm_gem_cma_vm_ops,
 	.dumb_create = mtk_drm_gem_dumb_create,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = mtk_drm_gem_prime_import,
-	.gem_prime_get_sg_table = mtk_gem_prime_get_sg_table,
 	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
 	.gem_prime_mmap = mtk_drm_gem_mmap_buf,
-	.gem_prime_vmap = mtk_drm_gem_prime_vmap,
-	.gem_prime_vunmap = mtk_drm_gem_prime_vunmap,
 	.fops = &mtk_drm_fops,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 6190cc3b7b0d..591b90410e4a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -8,11 +8,20 @@
 #include <drm/drm.h>
 #include <drm/drm_device.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_prime.h>
 
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
 
+static const struct drm_gem_object_funcs mtk_drm_gem_object_funcs = {
+	.free = mtk_drm_gem_free_object,
+	.get_sg_table = mtk_gem_prime_get_sg_table,
+	.vmap = mtk_drm_gem_prime_vmap,
+	.vunmap = mtk_drm_gem_prime_vunmap,
+	.vm_ops = &drm_gem_cma_vm_ops,
+};
+
 static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
 						unsigned long size)
 {
@@ -25,6 +34,8 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
 	if (!mtk_gem_obj)
 		return ERR_PTR(-ENOMEM);
 
+	mtk_gem_obj->base.funcs = &mtk_drm_gem_object_funcs;
+
 	ret = drm_gem_object_init(dev, &mtk_gem_obj->base, size);
 	if (ret < 0) {
 		DRM_ERROR("failed to initialize gem object\n");
-- 
2.28.0


