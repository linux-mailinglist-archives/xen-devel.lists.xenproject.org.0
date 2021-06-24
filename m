Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D02813B2BDF
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 11:54:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146562.269661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwM3Y-0000LW-4a; Thu, 24 Jun 2021 09:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146562.269661; Thu, 24 Jun 2021 09:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwM3Y-0000Hw-0u; Thu, 24 Jun 2021 09:53:56 +0000
Received: by outflank-mailman (input) for mailman id 146562;
 Thu, 24 Jun 2021 09:53:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D+gE=LS=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1lwM3W-0000Hq-I1
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 09:53:54 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45c9bbe6-3b57-4de9-bec9-d742fe392d40;
 Thu, 24 Jun 2021 09:53:52 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8AECA2197D;
 Thu, 24 Jun 2021 09:53:51 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 6305C11A97;
 Thu, 24 Jun 2021 09:53:51 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id TO47Fy9W1GC8UAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 09:53:51 +0000
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
X-Inumbo-ID: 45c9bbe6-3b57-4de9-bec9-d742fe392d40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1624528431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sgQz981DmPHHoBLAmzWHm2K8NJ1AiERtFp8KGPCVdkQ=;
	b=FQ7TZewTeM434xUo1DVCkrknJtFpjXMUkHaPsMZSmuoBOxjwWbmZFsbC8ispHDeFkxYvRr
	S9EFKZUUeGdetUlWQxEqD5jX9l0CGhU7OES+4lWTRXMBer1u6d54+v4xgQ2QeifKy1tTa8
	yKV9gEeGvxnIT/MjnG0Hg22+twSUIX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1624528431;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sgQz981DmPHHoBLAmzWHm2K8NJ1AiERtFp8KGPCVdkQ=;
	b=JuJLk2PLfiI8Nc5dOkA8x0XYrxAHa22G8Prnn+9jh+IDZeLA3r5DVF7YdCDnl1ebMjzf0x
	2QA9tygMS+fZpuAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1624528431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sgQz981DmPHHoBLAmzWHm2K8NJ1AiERtFp8KGPCVdkQ=;
	b=FQ7TZewTeM434xUo1DVCkrknJtFpjXMUkHaPsMZSmuoBOxjwWbmZFsbC8ispHDeFkxYvRr
	S9EFKZUUeGdetUlWQxEqD5jX9l0CGhU7OES+4lWTRXMBer1u6d54+v4xgQ2QeifKy1tTa8
	yKV9gEeGvxnIT/MjnG0Hg22+twSUIX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1624528431;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sgQz981DmPHHoBLAmzWHm2K8NJ1AiERtFp8KGPCVdkQ=;
	b=JuJLk2PLfiI8Nc5dOkA8x0XYrxAHa22G8Prnn+9jh+IDZeLA3r5DVF7YdCDnl1ebMjzf0x
	2QA9tygMS+fZpuAA==
From: Thomas Zimmermann <tzimmermann@suse.de>
To: oleksandr_andrushchenko@epam.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/xen: Implement mmap as GEM object function
Date: Thu, 24 Jun 2021 11:53:49 +0200
Message-Id: <20210624095349.8874-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moving the driver-specific mmap code into a GEM object function allows
for using DRM helpers for various mmap callbacks.

The respective xen functions are being removed. The file_operations
structure fops is now being created by the helper macro
DEFINE_DRM_GEM_FOPS().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/xen/xen_drm_front.c     |  16 +---
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 108 +++++++++---------------
 drivers/gpu/drm/xen/xen_drm_front_gem.h |   7 --
 3 files changed, 44 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 9f14d99c763c..434064c820e8 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -469,19 +469,7 @@ static void xen_drm_drv_release(struct drm_device *dev)
 	kfree(drm_info);
 }
 
-static const struct file_operations xen_drm_dev_fops = {
-	.owner          = THIS_MODULE,
-	.open           = drm_open,
-	.release        = drm_release,
-	.unlocked_ioctl = drm_ioctl,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl   = drm_compat_ioctl,
-#endif
-	.poll           = drm_poll,
-	.read           = drm_read,
-	.llseek         = no_llseek,
-	.mmap           = xen_drm_front_gem_mmap,
-};
+DEFINE_DRM_GEM_FOPS(xen_drm_dev_fops);
 
 static const struct drm_driver xen_drm_driver = {
 	.driver_features           = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
@@ -489,7 +477,7 @@ static const struct drm_driver xen_drm_driver = {
 	.prime_handle_to_fd        = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle        = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = xen_drm_front_gem_import_sg_table,
-	.gem_prime_mmap            = xen_drm_front_gem_prime_mmap,
+	.gem_prime_mmap            = drm_gem_prime_mmap,
 	.dumb_create               = xen_drm_drv_dumb_create,
 	.fops                      = &xen_drm_dev_fops,
 	.name                      = "xendrm-du",
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index b293c67230ef..dd358ba2bf8e 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -57,6 +57,47 @@ static void gem_free_pages_array(struct xen_gem_object *xen_obj)
 	xen_obj->pages = NULL;
 }
 
+static int xen_drm_front_gem_object_mmap(struct drm_gem_object *gem_obj,
+					 struct vm_area_struct *vma)
+{
+	struct xen_gem_object *xen_obj = to_xen_gem_obj(gem_obj);
+	int ret;
+
+	vma->vm_ops = gem_obj->funcs->vm_ops;
+
+	/*
+	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
+	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
+	 * the whole buffer.
+	 */
+	vma->vm_flags &= ~VM_PFNMAP;
+	vma->vm_flags |= VM_MIXEDMAP;
+	vma->vm_pgoff = 0;
+
+	/*
+	 * According to Xen on ARM ABI (xen/include/public/arch-arm.h):
+	 * all memory which is shared with other entities in the system
+	 * (including the hypervisor and other guests) must reside in memory
+	 * which is mapped as Normal Inner Write-Back Outer Write-Back
+	 * Inner-Shareable.
+	 */
+	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+
+	/*
+	 * vm_operations_struct.fault handler will be called if CPU access
+	 * to VM is here. For GPUs this isn't the case, because CPU  doesn't
+	 * touch the memory. Insert pages now, so both CPU and GPU are happy.
+	 *
+	 * FIXME: as we insert all the pages now then no .fault handler must
+	 * be called, so don't provide one
+	 */
+	ret = vm_map_pages(vma, xen_obj->pages, xen_obj->num_pages);
+	if (ret < 0)
+		DRM_ERROR("Failed to map pages into vma: %d\n", ret);
+
+	return ret;
+}
+
 static const struct vm_operations_struct xen_drm_drv_vm_ops = {
 	.open           = drm_gem_vm_open,
 	.close          = drm_gem_vm_close,
@@ -67,6 +108,7 @@ static const struct drm_gem_object_funcs xen_drm_front_gem_object_funcs = {
 	.get_sg_table = xen_drm_front_gem_get_sg_table,
 	.vmap = xen_drm_front_gem_prime_vmap,
 	.vunmap = xen_drm_front_gem_prime_vunmap,
+	.mmap = xen_drm_front_gem_object_mmap,
 	.vm_ops = &xen_drm_drv_vm_ops,
 };
 
@@ -238,58 +280,6 @@ xen_drm_front_gem_import_sg_table(struct drm_device *dev,
 	return &xen_obj->base;
 }
 
-static int gem_mmap_obj(struct xen_gem_object *xen_obj,
-			struct vm_area_struct *vma)
-{
-	int ret;
-
-	/*
-	 * clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
-	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
-	 * the whole buffer.
-	 */
-	vma->vm_flags &= ~VM_PFNMAP;
-	vma->vm_flags |= VM_MIXEDMAP;
-	vma->vm_pgoff = 0;
-	/*
-	 * According to Xen on ARM ABI (xen/include/public/arch-arm.h):
-	 * all memory which is shared with other entities in the system
-	 * (including the hypervisor and other guests) must reside in memory
-	 * which is mapped as Normal Inner Write-Back Outer Write-Back
-	 * Inner-Shareable.
-	 */
-	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
-
-	/*
-	 * vm_operations_struct.fault handler will be called if CPU access
-	 * to VM is here. For GPUs this isn't the case, because CPU
-	 * doesn't touch the memory. Insert pages now, so both CPU and GPU are
-	 * happy.
-	 * FIXME: as we insert all the pages now then no .fault handler must
-	 * be called, so don't provide one
-	 */
-	ret = vm_map_pages(vma, xen_obj->pages, xen_obj->num_pages);
-	if (ret < 0)
-		DRM_ERROR("Failed to map pages into vma: %d\n", ret);
-
-	return ret;
-}
-
-int xen_drm_front_gem_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct xen_gem_object *xen_obj;
-	struct drm_gem_object *gem_obj;
-	int ret;
-
-	ret = drm_gem_mmap(filp, vma);
-	if (ret < 0)
-		return ret;
-
-	gem_obj = vma->vm_private_data;
-	xen_obj = to_xen_gem_obj(gem_obj);
-	return gem_mmap_obj(xen_obj, vma);
-}
-
 int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj, struct dma_buf_map *map)
 {
 	struct xen_gem_object *xen_obj = to_xen_gem_obj(gem_obj);
@@ -313,17 +303,3 @@ void xen_drm_front_gem_prime_vunmap(struct drm_gem_object *gem_obj,
 {
 	vunmap(map->vaddr);
 }
-
-int xen_drm_front_gem_prime_mmap(struct drm_gem_object *gem_obj,
-				 struct vm_area_struct *vma)
-{
-	struct xen_gem_object *xen_obj;
-	int ret;
-
-	ret = drm_gem_mmap_obj(gem_obj, gem_obj->size, vma);
-	if (ret < 0)
-		return ret;
-
-	xen_obj = to_xen_gem_obj(gem_obj);
-	return gem_mmap_obj(xen_obj, vma);
-}
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.h b/drivers/gpu/drm/xen/xen_drm_front_gem.h
index a4e67d0a149c..eaea470f7001 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.h
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.h
@@ -15,9 +15,7 @@ struct dma_buf_attachment;
 struct dma_buf_map;
 struct drm_device;
 struct drm_gem_object;
-struct file;
 struct sg_table;
-struct vm_area_struct;
 
 struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *dev,
 						size_t size);
@@ -33,15 +31,10 @@ struct page **xen_drm_front_gem_get_pages(struct drm_gem_object *obj);
 
 void xen_drm_front_gem_free_object_unlocked(struct drm_gem_object *gem_obj);
 
-int xen_drm_front_gem_mmap(struct file *filp, struct vm_area_struct *vma);
-
 int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj,
 				 struct dma_buf_map *map);
 
 void xen_drm_front_gem_prime_vunmap(struct drm_gem_object *gem_obj,
 				    struct dma_buf_map *map);
 
-int xen_drm_front_gem_prime_mmap(struct drm_gem_object *gem_obj,
-				 struct vm_area_struct *vma);
-
 #endif /* __XEN_DRM_FRONT_GEM_H */
-- 
2.32.0


