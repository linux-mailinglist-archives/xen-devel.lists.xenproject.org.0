Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ADB2755A9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 12:22:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL1uc-00065p-Cl; Wed, 23 Sep 2020 10:22:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EYdF=DA=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kL1ua-00064P-Tn
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 10:22:08 +0000
X-Inumbo-ID: f141571e-73e9-4154-be15-a256ac897320
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f141571e-73e9-4154-be15-a256ac897320;
 Wed, 23 Sep 2020 10:22:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A24C4B016;
 Wed, 23 Sep 2020 10:22:39 +0000 (UTC)
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
 emil.velikov@collabora.com, laurentiu.palcu@oss.nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 01/22] drm/amdgpu: Introduce GEM object functions
Date: Wed, 23 Sep 2020 12:21:38 +0200
Message-Id: <20200923102159.24084-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923102159.24084-1-tzimmermann@suse.de>
References: <20200923102159.24084-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
per-instance callbacks in amdgpu. The only exception is gem_prime_mmap,
which is non-trivial to convert.

v3:
	* remove amdgpu_object.c from patch (Christian)
v2:
	* move object-function instance to amdgpu_gem.c (Christian)
	* set callbacks in amdgpu_gem_object_create() (Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  6 ------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 23 ++++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h |  5 -----
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 6edde2b9e402..840ca8f9c1e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1505,19 +1505,13 @@ static struct drm_driver kms_driver = {
 	.lastclose = amdgpu_driver_lastclose_kms,
 	.irq_handler = amdgpu_irq_handler,
 	.ioctls = amdgpu_ioctls_kms,
-	.gem_free_object_unlocked = amdgpu_gem_object_free,
-	.gem_open_object = amdgpu_gem_object_open,
-	.gem_close_object = amdgpu_gem_object_close,
 	.dumb_create = amdgpu_mode_dumb_create,
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
 	.fops = &amdgpu_driver_kms_fops,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export = amdgpu_gem_prime_export,
 	.gem_prime_import = amdgpu_gem_prime_import,
-	.gem_prime_vmap = amdgpu_gem_prime_vmap,
-	.gem_prime_vunmap = amdgpu_gem_prime_vunmap,
 	.gem_prime_mmap = amdgpu_gem_prime_mmap,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index aa7f230c71bf..aeecd5dc3ce4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -36,9 +36,12 @@
 
 #include "amdgpu.h"
 #include "amdgpu_display.h"
+#include "amdgpu_dma_buf.h"
 #include "amdgpu_xgmi.h"
 
-void amdgpu_gem_object_free(struct drm_gem_object *gobj)
+static const struct drm_gem_object_funcs amdgpu_gem_object_funcs;
+
+static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
 {
 	struct amdgpu_bo *robj = gem_to_amdgpu_bo(gobj);
 
@@ -87,6 +90,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 		return r;
 	}
 	*obj = &bo->tbo.base;
+	(*obj)->funcs = &amdgpu_gem_object_funcs;
 
 	return 0;
 }
@@ -119,8 +123,8 @@ void amdgpu_gem_force_release(struct amdgpu_device *adev)
  * Call from drm_gem_handle_create which appear in both new and open ioctl
  * case.
  */
-int amdgpu_gem_object_open(struct drm_gem_object *obj,
-			   struct drm_file *file_priv)
+static int amdgpu_gem_object_open(struct drm_gem_object *obj,
+				  struct drm_file *file_priv)
 {
 	struct amdgpu_bo *abo = gem_to_amdgpu_bo(obj);
 	struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
@@ -152,8 +156,8 @@ int amdgpu_gem_object_open(struct drm_gem_object *obj,
 	return 0;
 }
 
-void amdgpu_gem_object_close(struct drm_gem_object *obj,
-			     struct drm_file *file_priv)
+static void amdgpu_gem_object_close(struct drm_gem_object *obj,
+				    struct drm_file *file_priv)
 {
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
@@ -211,6 +215,15 @@ void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	ttm_eu_backoff_reservation(&ticket, &list);
 }
 
+static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
+	.free = amdgpu_gem_object_free,
+	.open = amdgpu_gem_object_open,
+	.close = amdgpu_gem_object_close,
+	.export = amdgpu_gem_prime_export,
+	.vmap = amdgpu_gem_prime_vmap,
+	.vunmap = amdgpu_gem_prime_vunmap,
+};
+
 /*
  * GEM ioctls.
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
index e0f025dd1b14..637bf51dbf06 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
@@ -33,11 +33,6 @@
 #define AMDGPU_GEM_DOMAIN_MAX		0x3
 #define gem_to_amdgpu_bo(gobj) container_of((gobj), struct amdgpu_bo, tbo.base)
 
-void amdgpu_gem_object_free(struct drm_gem_object *obj);
-int amdgpu_gem_object_open(struct drm_gem_object *obj,
-				struct drm_file *file_priv);
-void amdgpu_gem_object_close(struct drm_gem_object *obj,
-				struct drm_file *file_priv);
 unsigned long amdgpu_gem_timeout(uint64_t timeout_ns);
 
 /*
-- 
2.28.0


