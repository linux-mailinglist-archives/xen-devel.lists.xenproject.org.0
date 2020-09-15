Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29E726A7C2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 17:00:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kICRX-0000hB-Q7; Tue, 15 Sep 2020 15:00:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X5gY=CY=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kICRV-0000TT-FS
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 15:00:25 +0000
X-Inumbo-ID: 834419b9-f462-412f-8cb9-fb9e85244de7
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 834419b9-f462-412f-8cb9-fb9e85244de7;
 Tue, 15 Sep 2020 15:00:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2EED5AFA0;
 Tue, 15 Sep 2020 15:00:22 +0000 (UTC)
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
Subject: [PATCH v2 06/21] drm/i915: Introduce GEM object functions
Date: Tue, 15 Sep 2020 16:59:43 +0200
Message-Id: <20200915145958.19993-7-tzimmermann@suse.de>
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
per-instance callbacks in i915.

v2:
	* move object-function instance to i915_gem_object.c (Jani)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 21 ++++++++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  3 ---
 drivers/gpu/drm/i915/i915_drv.c               |  4 ----
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 ---
 4 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index c8421fd9d2dc..3389ac972d16 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -39,9 +39,18 @@ static struct i915_global_object {
 	struct kmem_cache *slab_objects;
 } global;
 
+static const struct drm_gem_object_funcs i915_gem_object_funcs;
+
 struct drm_i915_gem_object *i915_gem_object_alloc(void)
 {
-	return kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
+	struct drm_i915_gem_object *obj;
+
+	obj = kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
+	if (!obj)
+		return NULL;
+	obj->base.funcs = &i915_gem_object_funcs;
+
+	return obj;
 }
 
 void i915_gem_object_free(struct drm_i915_gem_object *obj)
@@ -101,7 +110,7 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 		!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE);
 }
 
-void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file)
+static void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file)
 {
 	struct drm_i915_gem_object *obj = to_intel_bo(gem);
 	struct drm_i915_file_private *fpriv = file->driver_priv;
@@ -264,7 +273,7 @@ static void __i915_gem_free_work(struct work_struct *work)
 	i915_gem_flush_free_objects(i915);
 }
 
-void i915_gem_free_object(struct drm_gem_object *gem_obj)
+static void i915_gem_free_object(struct drm_gem_object *gem_obj)
 {
 	struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
@@ -403,6 +412,12 @@ int __init i915_global_objects_init(void)
 	return 0;
 }
 
+static const struct drm_gem_object_funcs i915_gem_object_funcs = {
+	.free = i915_gem_free_object,
+	.close = i915_gem_close_object,
+	.export = i915_gem_prime_export,
+};
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/huge_gem_object.c"
 #include "selftests/huge_pages.c"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index d46db8d8f38e..eaf3d4147be0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -38,9 +38,6 @@ void __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
 
 int i915_gem_object_attach_phys(struct drm_i915_gem_object *obj, int align);
 
-void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file);
-void i915_gem_free_object(struct drm_gem_object *obj);
-
 void i915_gem_flush_free_objects(struct drm_i915_private *i915);
 
 struct sg_table *
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 94e00e450683..011a3fb41ece 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1750,12 +1750,8 @@ static struct drm_driver driver = {
 	.lastclose = i915_driver_lastclose,
 	.postclose = i915_driver_postclose,
 
-	.gem_close_object = i915_gem_close_object,
-	.gem_free_object_unlocked = i915_gem_free_object,
-
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export = i915_gem_prime_export,
 	.gem_prime_import = i915_gem_prime_import,
 
 	.dumb_create = i915_gem_dumb_create,
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index f127e633f7ca..9244b5d6fb01 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -87,9 +87,6 @@ static struct drm_driver mock_driver = {
 	.name = "mock",
 	.driver_features = DRIVER_GEM,
 	.release = mock_device_release,
-
-	.gem_close_object = i915_gem_close_object,
-	.gem_free_object_unlocked = i915_gem_free_object,
 };
 
 static void release_dev(struct device *dev)
-- 
2.28.0


