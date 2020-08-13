Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1177E24367C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 10:37:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k68js-0006qY-7R; Thu, 13 Aug 2020 08:37:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cOQw=BX=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1k68jq-0006LY-HY
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 08:37:30 +0000
X-Inumbo-ID: e1d607c3-1350-4e64-8b4f-ad4d42a0aa25
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1d607c3-1350-4e64-8b4f-ad4d42a0aa25;
 Thu, 13 Aug 2020 08:37:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D6F9B5A8;
 Thu, 13 Aug 2020 08:37:29 +0000 (UTC)
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
Subject: [PATCH 18/20] drm/xen: Introduce GEM object functions
Date: Thu, 13 Aug 2020 10:36:42 +0200
Message-Id: <20200813083644.31711-19-tzimmermann@suse.de>
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
per-instance callbacks in xen. The only exception is gem_prime_mmap,
which is non-trivial to convert.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/xen/xen_drm_front.c     | 12 +-----------
 drivers/gpu/drm/xen/xen_drm_front.h     |  2 ++
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 15 +++++++++++++++
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 3e660fb111b3..bd9af1875af1 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -433,7 +433,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 	return ret;
 }
 
-static void xen_drm_drv_free_object_unlocked(struct drm_gem_object *obj)
+void xen_drm_drv_free_object_unlocked(struct drm_gem_object *obj)
 {
 	struct xen_drm_front_drm_info *drm_info = obj->dev->dev_private;
 	int idx;
@@ -481,22 +481,12 @@ static const struct file_operations xen_drm_dev_fops = {
 	.mmap           = xen_drm_front_gem_mmap,
 };
 
-static const struct vm_operations_struct xen_drm_drv_vm_ops = {
-	.open           = drm_gem_vm_open,
-	.close          = drm_gem_vm_close,
-};
-
 static struct drm_driver xen_drm_driver = {
 	.driver_features           = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.release                   = xen_drm_drv_release,
-	.gem_vm_ops                = &xen_drm_drv_vm_ops,
-	.gem_free_object_unlocked  = xen_drm_drv_free_object_unlocked,
 	.prime_handle_to_fd        = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle        = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = xen_drm_front_gem_import_sg_table,
-	.gem_prime_get_sg_table    = xen_drm_front_gem_get_sg_table,
-	.gem_prime_vmap            = xen_drm_front_gem_prime_vmap,
-	.gem_prime_vunmap          = xen_drm_front_gem_prime_vunmap,
 	.gem_prime_mmap            = xen_drm_front_gem_prime_mmap,
 	.dumb_create               = xen_drm_drv_dumb_create,
 	.fops                      = &xen_drm_dev_fops,
diff --git a/drivers/gpu/drm/xen/xen_drm_front.h b/drivers/gpu/drm/xen/xen_drm_front.h
index f92c258350ca..93e60c1db550 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.h
+++ b/drivers/gpu/drm/xen/xen_drm_front.h
@@ -160,4 +160,6 @@ int xen_drm_front_page_flip(struct xen_drm_front_info *front_info,
 void xen_drm_front_on_frame_done(struct xen_drm_front_info *front_info,
 				 int conn_idx, u64 fb_cookie);
 
+void xen_drm_drv_free_object_unlocked(struct drm_gem_object *obj);
+
 #endif /* __XEN_DRM_FRONT_H_ */
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index f0b85e094111..7b315c08bcfc 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -56,6 +56,19 @@ static void gem_free_pages_array(struct xen_gem_object *xen_obj)
 	xen_obj->pages = NULL;
 }
 
+static const struct vm_operations_struct xen_drm_drv_vm_ops = {
+	.open           = drm_gem_vm_open,
+	.close          = drm_gem_vm_close,
+};
+
+static const struct drm_gem_object_funcs xen_drm_front_gem_object_funcs = {
+	.free = xen_drm_drv_free_object_unlocked,
+	.get_sg_table = xen_drm_front_gem_get_sg_table,
+	.vmap = xen_drm_front_gem_prime_vmap,
+	.vunmap = xen_drm_front_gem_prime_vunmap,
+	.vm_ops = &xen_drm_drv_vm_ops,
+};
+
 static struct xen_gem_object *gem_create_obj(struct drm_device *dev,
 					     size_t size)
 {
@@ -66,6 +79,8 @@ static struct xen_gem_object *gem_create_obj(struct drm_device *dev,
 	if (!xen_obj)
 		return ERR_PTR(-ENOMEM);
 
+	xen_obj->base.funcs = &xen_drm_front_gem_object_funcs;
+
 	ret = drm_gem_object_init(dev, &xen_obj->base, size);
 	if (ret < 0) {
 		kfree(xen_obj);
-- 
2.28.0


