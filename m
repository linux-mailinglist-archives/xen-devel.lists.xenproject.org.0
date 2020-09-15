Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245CF26A7B7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 17:00:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kICRT-0000eC-CW; Tue, 15 Sep 2020 15:00:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X5gY=CY=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kICRR-0000TU-HR
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 15:00:21 +0000
X-Inumbo-ID: 136932cb-9bd3-4ca0-9779-9ca42c124445
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 136932cb-9bd3-4ca0-9779-9ca42c124445;
 Tue, 15 Sep 2020 15:00:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 892D1B013;
 Tue, 15 Sep 2020 15:00:26 +0000 (UTC)
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
Subject: [PATCH v2 11/21] drm/pl111: Introduce GEM object functions
Date: Tue, 15 Sep 2020 16:59:48 +0200
Message-Id: <20200915145958.19993-12-tzimmermann@suse.de>
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
per-instance callbacks in pl111. The only exception is gem_prime_mmap,
which is non-trivial to convert.

v2:
	* use drm_gem_cma_create_object_default_funcs() (Eric)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 46b0d1c4a16c..ecef8a2383d2 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -224,15 +224,12 @@ static struct drm_driver pl111_drm_driver = {
 	.major = 1,
 	.minor = 0,
 	.patchlevel = 0,
+	.gem_create_object = drm_gem_cma_create_object_default_funcs,
 	.dumb_create = drm_gem_cma_dumb_create,
-	.gem_free_object_unlocked = drm_gem_cma_free_object,
-	.gem_vm_ops = &drm_gem_cma_vm_ops,
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = pl111_gem_import_sg_table,
-	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
 	.gem_prime_mmap = drm_gem_cma_prime_mmap,
-	.gem_prime_vmap = drm_gem_cma_prime_vmap,
 
 #if defined(CONFIG_DEBUG_FS)
 	.debugfs_init = pl111_debugfs_init,
-- 
2.28.0


