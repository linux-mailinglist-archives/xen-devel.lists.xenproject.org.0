Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FB928F268
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 14:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7294.19036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT2WP-0000Xs-Gp; Thu, 15 Oct 2020 12:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7294.19036; Thu, 15 Oct 2020 12:38:17 +0000
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
	id 1kT2WP-0000XV-D1; Thu, 15 Oct 2020 12:38:17 +0000
Received: by outflank-mailman (input) for mailman id 7294;
 Thu, 15 Oct 2020 12:38:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CmRu=DW=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kT2WO-0000Wl-6r
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 12:38:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 596f9b79-0b59-4e4f-aae1-98c0ad215b28;
 Thu, 15 Oct 2020 12:38:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 42699B19B;
 Thu, 15 Oct 2020 12:38:13 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CmRu=DW=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
	id 1kT2WO-0000Wl-6r
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 12:38:16 +0000
X-Inumbo-ID: 596f9b79-0b59-4e4f-aae1-98c0ad215b28
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 596f9b79-0b59-4e4f-aae1-98c0ad215b28;
	Thu, 15 Oct 2020 12:38:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 42699B19B;
	Thu, 15 Oct 2020 12:38:13 +0000 (UTC)
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
Subject: [PATCH v4 04/10] drm/exynos: Remove empty exynos_drm_gem_prime_{vmap,vunmap}()
Date: Thu, 15 Oct 2020 14:38:00 +0200
Message-Id: <20201015123806.32416-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015123806.32416-1-tzimmermann@suse.de>
References: <20201015123806.32416-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions exynos_drm_gem_prime_{vmap,vunmap}() are empty. Remove
them before changing the interface to use struct drm_buf_map. As a side
effect of removing drm_gem_prime_vmap(), the error code changes from
ENOMEM to EOPNOTSUPP.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 12 ------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h |  2 --
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index e7a6eb96f692..13a35623ac04 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -137,8 +137,6 @@ static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
 static const struct drm_gem_object_funcs exynos_drm_gem_object_funcs = {
 	.free = exynos_drm_gem_free_object,
 	.get_sg_table = exynos_drm_gem_prime_get_sg_table,
-	.vmap = exynos_drm_gem_prime_vmap,
-	.vunmap	= exynos_drm_gem_prime_vunmap,
 	.vm_ops = &exynos_drm_gem_vm_ops,
 };
 
@@ -471,16 +469,6 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
 	return &exynos_gem->base;
 }
 
-void *exynos_drm_gem_prime_vmap(struct drm_gem_object *obj)
-{
-	return NULL;
-}
-
-void exynos_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
-{
-	/* Nothing to do */
-}
-
 int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
 			      struct vm_area_struct *vma)
 {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index 74e926abeff0..a23272fb96fb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -107,8 +107,6 @@ struct drm_gem_object *
 exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
 				     struct dma_buf_attachment *attach,
 				     struct sg_table *sgt);
-void *exynos_drm_gem_prime_vmap(struct drm_gem_object *obj);
-void exynos_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
 int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
 			      struct vm_area_struct *vma);
 
-- 
2.28.0


