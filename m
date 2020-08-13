Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0174324365C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 10:37:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k68jg-0006cd-6W; Thu, 13 Aug 2020 08:37:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cOQw=BX=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1k68je-0006LO-M6
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 08:37:18 +0000
X-Inumbo-ID: 2b8a9c0f-90cf-41f4-9a7e-fe651cb65a8c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b8a9c0f-90cf-41f4-9a7e-fe651cb65a8c;
 Thu, 13 Aug 2020 08:36:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3719FB599;
 Thu, 13 Aug 2020 08:37:18 +0000 (UTC)
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
 matthew.auld@intel.com, abdiel.janulgue@linux.intel.com,
 tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com, sam@ravnborg.org,
 miaoqinglang@huawei.com, emil.velikov@collabora.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/20] drm/i915: Introduce GEM object functions
Date: Thu, 13 Aug 2020 10:36:30 +0200
Message-Id: <20200813083644.31711-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813083644.31711-1-tzimmermann@suse.de>
References: <20200813083644.31711-1-tzimmermann@suse.de>
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c       |  9 ++++++++-
 drivers/gpu/drm/i915/i915_drv.c                  | 10 ++++++----
 drivers/gpu/drm/i915/i915_drv.h                  |  1 +
 drivers/gpu/drm/i915/selftests/mock_gem_device.c |  3 ---
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index c8421fd9d2dc..bc15ee4f2bd5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -41,7 +41,14 @@ static struct i915_global_object {
 
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
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 068447f565a9..b09eee11c540 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1840,6 +1840,12 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem_vm_destroy_ioctl, DRM_RENDER_ALLOW),
 };
 
+const struct drm_gem_object_funcs i915_gem_object_funcs = {
+	.free = i915_gem_free_object,
+	.close = i915_gem_close_object,
+	.export = i915_gem_prime_export,
+};
+
 static struct drm_driver driver = {
 	/* Don't use MTRRs here; the Xserver or userspace app should
 	 * deal with them for Intel hardware.
@@ -1853,12 +1859,8 @@ static struct drm_driver driver = {
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
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index bacb4c762f5b..666db65fe69e 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1736,6 +1736,7 @@ intel_ggtt_update_needs_vtd_wa(struct drm_i915_private *dev_priv)
 
 /* i915_drv.c */
 extern const struct dev_pm_ops i915_pm_ops;
+extern const struct drm_gem_object_funcs i915_gem_object_funcs;
 
 int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
 void i915_driver_remove(struct drm_i915_private *i915);
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index ce4d4303229c..4725dad63e0a 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -86,9 +86,6 @@ static struct drm_driver mock_driver = {
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


