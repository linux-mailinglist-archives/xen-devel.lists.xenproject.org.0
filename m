Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B48363A127B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 13:21:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139208.257489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqwFx-0003ll-PG; Wed, 09 Jun 2021 11:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139208.257489; Wed, 09 Jun 2021 11:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqwFx-0003gw-JJ; Wed, 09 Jun 2021 11:20:21 +0000
Received: by outflank-mailman (input) for mailman id 139208;
 Wed, 09 Jun 2021 11:20:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FYhx=LD=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1lqwFv-0003dc-33
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 11:20:19 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2384f954-1f82-4d11-9f27-5f2373317b20;
 Wed, 09 Jun 2021 11:20:16 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D370E219BC;
 Wed,  9 Jun 2021 11:20:14 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 354B811A98;
 Wed,  9 Jun 2021 11:20:14 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 2DYmDO6jwGBTUgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Jun 2021 11:20:14 +0000
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
X-Inumbo-ID: 2384f954-1f82-4d11-9f27-5f2373317b20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1623237614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h+ZIKR66Gjb9uIHTGXu21Qs0ridWWVUt4g+4HcSLyfc=;
	b=XnWyLcXU2DzGKjVpWY+v6GsFXDEvAnsTBuiSFsLYtDqOuSuQ24o7BZ7onxGf1xLaPad5mU
	918hNEVR8evAVRyMQoWrhChlZiOEb+TV/XShyiMhFRl8SP//hv3k9Igf72r/48f0zcqDEc
	MPAr1LiOPOj6guYJivFP9U39T2osWL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1623237614;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h+ZIKR66Gjb9uIHTGXu21Qs0ridWWVUt4g+4HcSLyfc=;
	b=3hlvfUg2sc+GZSp3mXVxRN0jtCQ6ZZAWw26CXhEuVMNAOePsQpDVWMJIvwDLKIJh/YG3fs
	M2puEtDQ2CPjnHBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1623237614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h+ZIKR66Gjb9uIHTGXu21Qs0ridWWVUt4g+4HcSLyfc=;
	b=XnWyLcXU2DzGKjVpWY+v6GsFXDEvAnsTBuiSFsLYtDqOuSuQ24o7BZ7onxGf1xLaPad5mU
	918hNEVR8evAVRyMQoWrhChlZiOEb+TV/XShyiMhFRl8SP//hv3k9Igf72r/48f0zcqDEc
	MPAr1LiOPOj6guYJivFP9U39T2osWL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1623237614;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h+ZIKR66Gjb9uIHTGXu21Qs0ridWWVUt4g+4HcSLyfc=;
	b=3hlvfUg2sc+GZSp3mXVxRN0jtCQ6ZZAWw26CXhEuVMNAOePsQpDVWMJIvwDLKIJh/YG3fs
	M2puEtDQ2CPjnHBg==
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	l.stach@pengutronix.de,
	linux+etnaviv@armlinux.org.uk,
	christian.gmeiner@gmail.com,
	inki.dae@samsung.com,
	jy0922.shim@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzysztof.kozlowski@canonical.com,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	robdclark@gmail.com,
	sean@poorly.run,
	airlied@redhat.com,
	kraxel@redhat.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	oleksandr_andrushchenko@epam.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	etnaviv@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	spice-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/9] drm/etnaviv: Implement mmap as GEM object function
Date: Wed,  9 Jun 2021 13:20:04 +0200
Message-Id: <20210609112012.10019-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609112012.10019-1-tzimmermann@suse.de>
References: <20210609112012.10019-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moving the driver-specific mmap code into a GEM object function allows
for using DRM helpers for various mmap callbacks.

The respective etnaviv functions are being removed. The file_operations
structure fops is now being created by the helper macro
DEFINE_DRM_GEM_FOPS().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 14 ++------------
 drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  3 ---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 18 +++++-------------
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 13 -------------
 4 files changed, 7 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index f0a07278ad04..7dcc6392792d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -468,17 +468,7 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
 	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
 };
 
-static const struct file_operations fops = {
-	.owner              = THIS_MODULE,
-	.open               = drm_open,
-	.release            = drm_release,
-	.unlocked_ioctl     = drm_ioctl,
-	.compat_ioctl       = drm_compat_ioctl,
-	.poll               = drm_poll,
-	.read               = drm_read,
-	.llseek             = no_llseek,
-	.mmap               = etnaviv_gem_mmap,
-};
+DEFINE_DRM_GEM_FOPS(fops);
 
 static const struct drm_driver etnaviv_drm_driver = {
 	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
@@ -487,7 +477,7 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = etnaviv_gem_prime_import_sg_table,
-	.gem_prime_mmap     = etnaviv_gem_prime_mmap,
+	.gem_prime_mmap     = drm_gem_prime_mmap,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = etnaviv_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 003288ebd896..049ae87de9be 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -47,12 +47,9 @@ struct etnaviv_drm_private {
 int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
-int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma);
 int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset);
 struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj);
 int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
-int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
-			   struct vm_area_struct *vma);
 struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
 	struct dma_buf_attachment *attach, struct sg_table *sg);
 int etnaviv_gem_prime_pin(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b8fa6ed3dd73..8f1b5af47dd6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -130,8 +130,7 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
 {
 	pgprot_t vm_page_prot;
 
-	vma->vm_flags &= ~VM_PFNMAP;
-	vma->vm_flags |= VM_MIXEDMAP;
+	vma->vm_flags |= VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP;
 
 	vm_page_prot = vm_get_page_prot(vma->vm_flags);
 
@@ -154,19 +153,11 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
 	return 0;
 }
 
-int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma)
+static int etnaviv_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 {
-	struct etnaviv_gem_object *obj;
-	int ret;
-
-	ret = drm_gem_mmap(filp, vma);
-	if (ret) {
-		DBG("mmap failed: %d", ret);
-		return ret;
-	}
+	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 
-	obj = to_etnaviv_bo(vma->vm_private_data);
-	return obj->ops->mmap(obj, vma);
+	return etnaviv_obj->ops->mmap(etnaviv_obj, vma);
 }
 
 static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
@@ -567,6 +558,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
 	.unpin = etnaviv_gem_prime_unpin,
 	.get_sg_table = etnaviv_gem_prime_get_sg_table,
 	.vmap = etnaviv_gem_prime_vmap,
+	.mmap = etnaviv_gem_mmap,
 	.vm_ops = &vm_ops,
 };
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index b390dd4d60b7..4d9e8e9b6191 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -34,19 +34,6 @@ int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 	return 0;
 }
 
-int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
-			   struct vm_area_struct *vma)
-{
-	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
-	int ret;
-
-	ret = drm_gem_mmap_obj(obj, obj->size, vma);
-	if (ret < 0)
-		return ret;
-
-	return etnaviv_obj->ops->mmap(etnaviv_obj, vma);
-}
-
 int etnaviv_gem_prime_pin(struct drm_gem_object *obj)
 {
 	if (!obj->import_attach) {
-- 
2.31.1


