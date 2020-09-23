Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ED92755A4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 12:22:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL1uZ-00064k-3Q; Wed, 23 Sep 2020 10:22:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EYdF=DA=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kL1uX-00064a-Bf
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 10:22:05 +0000
X-Inumbo-ID: 0bbf1ed5-391c-43b9-ad12-5f33e28c4850
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bbf1ed5-391c-43b9-ad12-5f33e28c4850;
 Wed, 23 Sep 2020 10:22:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91779B27A;
 Wed, 23 Sep 2020 10:22:40 +0000 (UTC)
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
 xen-devel@lists.xenproject.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH v3 02/22] drm/armada: Introduce GEM object functions
Date: Wed, 23 Sep 2020 12:21:39 +0200
Message-Id: <20200923102159.24084-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923102159.24084-1-tzimmermann@suse.de>
References: <20200923102159.24084-1-tzimmermann@suse.de>
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
per-instance callbacks in armada.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/gpu/drm/armada/armada_drv.c |  3 ---
 drivers/gpu/drm/armada/armada_gem.c | 12 +++++++++++-
 drivers/gpu/drm/armada/armada_gem.h |  2 --
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 980d3f1f8f16..22247cfce80b 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -37,13 +37,10 @@ DEFINE_DRM_GEM_FOPS(armada_drm_fops);
 
 static struct drm_driver armada_drm_driver = {
 	.lastclose		= drm_fb_helper_lastclose,
-	.gem_free_object_unlocked = armada_gem_free_object,
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
-	.gem_prime_export	= armada_gem_prime_export,
 	.gem_prime_import	= armada_gem_prime_import,
 	.dumb_create		= armada_gem_dumb_create,
-	.gem_vm_ops		= &armada_gem_vm_ops,
 	.major			= 1,
 	.minor			= 0,
 	.name			= "armada-drm",
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 6654bccd9466..21909642ee4c 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -25,7 +25,7 @@ static vm_fault_t armada_gem_vm_fault(struct vm_fault *vmf)
 	return vmf_insert_pfn(vmf->vma, vmf->address, pfn);
 }
 
-const struct vm_operations_struct armada_gem_vm_ops = {
+static const struct vm_operations_struct armada_gem_vm_ops = {
 	.fault	= armada_gem_vm_fault,
 	.open	= drm_gem_vm_open,
 	.close	= drm_gem_vm_close,
@@ -184,6 +184,12 @@ armada_gem_map_object(struct drm_device *dev, struct armada_gem_object *dobj)
 	return dobj->addr;
 }
 
+static const struct drm_gem_object_funcs armada_gem_object_funcs = {
+	.free = armada_gem_free_object,
+	.export = armada_gem_prime_export,
+	.vm_ops = &armada_gem_vm_ops,
+};
+
 struct armada_gem_object *
 armada_gem_alloc_private_object(struct drm_device *dev, size_t size)
 {
@@ -195,6 +201,8 @@ armada_gem_alloc_private_object(struct drm_device *dev, size_t size)
 	if (!obj)
 		return NULL;
 
+	obj->obj.funcs = &armada_gem_object_funcs;
+
 	drm_gem_private_object_init(dev, &obj->obj, size);
 
 	DRM_DEBUG_DRIVER("alloc private obj %p size %zu\n", obj, size);
@@ -214,6 +222,8 @@ static struct armada_gem_object *armada_gem_alloc_object(struct drm_device *dev,
 	if (!obj)
 		return NULL;
 
+	obj->obj.funcs = &armada_gem_object_funcs;
+
 	if (drm_gem_object_init(dev, &obj->obj, size)) {
 		kfree(obj);
 		return NULL;
diff --git a/drivers/gpu/drm/armada/armada_gem.h b/drivers/gpu/drm/armada/armada_gem.h
index de04cc2c8f0e..ffcc7e8dd351 100644
--- a/drivers/gpu/drm/armada/armada_gem.h
+++ b/drivers/gpu/drm/armada/armada_gem.h
@@ -21,8 +21,6 @@ struct armada_gem_object {
 	void			*update_data;
 };
 
-extern const struct vm_operations_struct armada_gem_vm_ops;
-
 #define drm_to_armada_gem(o) container_of(o, struct armada_gem_object, obj)
 
 void armada_gem_free_object(struct drm_gem_object *);
-- 
2.28.0


