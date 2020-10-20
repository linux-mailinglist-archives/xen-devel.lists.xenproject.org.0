Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F33293B3C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 14:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9464.24824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUqdQ-0004PI-VD; Tue, 20 Oct 2020 12:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9464.24824; Tue, 20 Oct 2020 12:21:00 +0000
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
	id 1kUqdQ-0004OZ-Nw; Tue, 20 Oct 2020 12:21:00 +0000
Received: by outflank-mailman (input) for mailman id 9464;
 Tue, 20 Oct 2020 12:20:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wemb=D3=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kUqdP-0004KG-48
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 12:20:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 295c6168-8e3e-49e3-9f17-132fa31bf4c2;
 Tue, 20 Oct 2020 12:20:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EA87BB1C8;
 Tue, 20 Oct 2020 12:20:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wemb=D3=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
	id 1kUqdP-0004KG-48
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 12:20:59 +0000
X-Inumbo-ID: 295c6168-8e3e-49e3-9f17-132fa31bf4c2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 295c6168-8e3e-49e3-9f17-132fa31bf4c2;
	Tue, 20 Oct 2020 12:20:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EA87BB1C8;
	Tue, 20 Oct 2020 12:20:51 +0000 (UTC)
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
Subject: [PATCH v5 02/10] drm/cma-helper: Remove empty drm_gem_cma_prime_vunmap()
Date: Tue, 20 Oct 2020 14:20:38 +0200
Message-Id: <20201020122046.31167-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020122046.31167-1-tzimmermann@suse.de>
References: <20201020122046.31167-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The function drm_gem_cma_prime_vunmap() is empty. Remove it before
changing the interface to use struct drm_buf_map.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Christian König <christian.koenig@amd.com>
Tested-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 17 -----------------
 drivers/gpu/drm/vc4/vc4_bo.c         |  1 -
 include/drm/drm_gem_cma_helper.h     |  1 -
 3 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 2165633c9b9e..d527485ea0b7 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -537,23 +537,6 @@ void *drm_gem_cma_prime_vmap(struct drm_gem_object *obj)
 }
 EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vmap);
 
-/**
- * drm_gem_cma_prime_vunmap - unmap a CMA GEM object from the kernel's virtual
- *     address space
- * @obj: GEM object
- * @vaddr: kernel virtual address where the CMA GEM object was mapped
- *
- * This function removes a buffer exported via DRM PRIME from the kernel's
- * virtual address space. This is a no-op because CMA buffers cannot be
- * unmapped from kernel space. Drivers using the CMA helpers should set this
- * as their &drm_gem_object_funcs.vunmap callback.
- */
-void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
-{
-	/* Nothing to do */
-}
-EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vunmap);
-
 static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
 	.free = drm_gem_cma_free_object,
 	.print_info = drm_gem_cma_print_info,
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index f432278173cd..557f0d1e6437 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -387,7 +387,6 @@ static const struct drm_gem_object_funcs vc4_gem_object_funcs = {
 	.export = vc4_prime_export,
 	.get_sg_table = drm_gem_cma_prime_get_sg_table,
 	.vmap = vc4_prime_vmap,
-	.vunmap = drm_gem_cma_prime_vunmap,
 	.vm_ops = &vc4_vm_ops,
 };
 
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 2bfa2502607a..a064b0d1c480 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -104,7 +104,6 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
 int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
 			   struct vm_area_struct *vma);
 void *drm_gem_cma_prime_vmap(struct drm_gem_object *obj);
-void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
 
 struct drm_gem_object *
 drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);
-- 
2.28.0


