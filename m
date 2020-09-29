Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C3F27D262
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 17:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.252.614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHLB-0006wu-AT; Tue, 29 Sep 2020 15:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252.614; Tue, 29 Sep 2020 15:14:53 +0000
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
	id 1kNHLB-0006ve-2k; Tue, 29 Sep 2020 15:14:53 +0000
Received: by outflank-mailman (input) for mailman id 252;
 Tue, 29 Sep 2020 15:14:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5GuN=DG=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kNHL9-0006qi-5x
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:14:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3474995c-d429-43cb-a2d3-452af215f680;
 Tue, 29 Sep 2020 15:14:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73CB9B11A;
 Tue, 29 Sep 2020 15:14:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5GuN=DG=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
	id 1kNHL9-0006qi-5x
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:14:51 +0000
X-Inumbo-ID: 3474995c-d429-43cb-a2d3-452af215f680
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3474995c-d429-43cb-a2d3-452af215f680;
	Tue, 29 Sep 2020 15:14:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 73CB9B11A;
	Tue, 29 Sep 2020 15:14:44 +0000 (UTC)
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
Subject: [PATCH v3 4/7] drm/gem: Update internal GEM vmap/vunmap interfaces to use struct dma_buf_map
Date: Tue, 29 Sep 2020 17:14:34 +0200
Message-Id: <20200929151437.19717-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929151437.19717-1-tzimmermann@suse.de>
References: <20200929151437.19717-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GEM's vmap and vunmap interfaces now wrap memory pointers in struct
dma_buf_map.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client.c   | 18 +++++++++++-------
 drivers/gpu/drm/drm_gem.c      | 28 ++++++++++++++--------------
 drivers/gpu/drm/drm_internal.h |  5 +++--
 drivers/gpu/drm/drm_prime.c    | 14 ++++----------
 4 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 495f47d23d87..ac0082bed966 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -3,6 +3,7 @@
  * Copyright 2018 Noralf Trønnes
  */
 
+#include <linux/dma-buf-map.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -304,7 +305,8 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
  */
 void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
 {
-	void *vaddr;
+	struct dma_buf_map map;
+	int ret;
 
 	if (buffer->vaddr)
 		return buffer->vaddr;
@@ -317,13 +319,13 @@ void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
 	 * fd_install step out of the driver backend hooks, to make that
 	 * final step optional for internal users.
 	 */
-	vaddr = drm_gem_vmap(buffer->gem);
-	if (IS_ERR(vaddr))
-		return vaddr;
+	ret = drm_gem_vmap(buffer->gem, &map);
+	if (ret)
+		return ERR_PTR(ret);
 
-	buffer->vaddr = vaddr;
+	buffer->vaddr = map.vaddr;
 
-	return vaddr;
+	return map.vaddr;
 }
 EXPORT_SYMBOL(drm_client_buffer_vmap);
 
@@ -337,7 +339,9 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
  */
 void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
 {
-	drm_gem_vunmap(buffer->gem, buffer->vaddr);
+	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buffer->vaddr);
+
+	drm_gem_vunmap(buffer->gem, &map);
 	buffer->vaddr = NULL;
 }
 EXPORT_SYMBOL(drm_client_buffer_vunmap);
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 0c4a66dea5c2..f2b2f37d41c4 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1205,32 +1205,32 @@ void drm_gem_unpin(struct drm_gem_object *obj)
 		obj->funcs->unpin(obj);
 }
 
-void *drm_gem_vmap(struct drm_gem_object *obj)
+int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
-	struct dma_buf_map map;
 	int ret;
 
-	if (!obj->funcs->vmap) {
-		return ERR_PTR(-EOPNOTSUPP);
+	if (!obj->funcs->vmap)
+		return -EOPNOTSUPP;
 
-	ret = obj->funcs->vmap(obj, &map);
+	ret = obj->funcs->vmap(obj, map);
 	if (ret)
-		return ERR_PTR(ret);
-	else if (dma_buf_map_is_null(&map))
-		return ERR_PTR(-ENOMEM);
+		return ret;
+	else if (dma_buf_map_is_null(map))
+		return -ENOMEM;
 
-	return map.vaddr;
+	return 0;
 }
 
-void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr)
+void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
-	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(vaddr);
-
-	if (!vaddr)
+	if (dma_buf_map_is_null(map))
 		return;
 
 	if (obj->funcs->vunmap)
-		obj->funcs->vunmap(obj, &map);
+		obj->funcs->vunmap(obj, map);
+
+	/* Always set the mapping to NULL. Callers may rely on this. */
+	dma_buf_map_clear(map);
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index b65865c630b0..58832d75a9bd 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -33,6 +33,7 @@
 
 struct dentry;
 struct dma_buf;
+struct dma_buf_map;
 struct drm_connector;
 struct drm_crtc;
 struct drm_framebuffer;
@@ -187,8 +188,8 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 
 int drm_gem_pin(struct drm_gem_object *obj);
 void drm_gem_unpin(struct drm_gem_object *obj);
-void *drm_gem_vmap(struct drm_gem_object *obj);
-void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
+int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 
 /* drm_debugfs.c drm_debugfs_crc.c */
 #if defined(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 89e2a2496734..cb8fbeeb731b 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -667,21 +667,15 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
  *
  * Sets up a kernel virtual mapping. This can be used as the &dma_buf_ops.vmap
  * callback. Calls into &drm_gem_object_funcs.vmap for device specific handling.
+ * The kernel virtual address is returned in map.
  *
- * Returns the kernel virtual address or NULL on failure.
+ * Returns 0 on success or a negative errno code otherwise.
  */
 int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
-	void *vaddr;
 
-	vaddr = drm_gem_vmap(obj);
-	if (IS_ERR(vaddr))
-		return PTR_ERR(vaddr);
-
-	dma_buf_map_set_vaddr(map, vaddr);
-
-	return 0;
+	return drm_gem_vmap(obj, map);
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
 
@@ -697,7 +691,7 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	drm_gem_vunmap(obj, map->vaddr);
+	drm_gem_vunmap(obj, map);
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
 
-- 
2.28.0


