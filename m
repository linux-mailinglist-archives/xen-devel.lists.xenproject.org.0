Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D810618163
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 16:15:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436646.690883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqbw0-000648-2G; Thu, 03 Nov 2022 15:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436646.690883; Thu, 03 Nov 2022 15:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqbvy-0005Zi-Ve; Thu, 03 Nov 2022 15:15:10 +0000
Received: by outflank-mailman (input) for mailman id 436646;
 Thu, 03 Nov 2022 15:15:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yy4e=3D=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1oqbvo-0001zN-G4
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 15:15:00 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47e52fa4-5b8a-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 16:14:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B695B21DEE;
 Thu,  3 Nov 2022 15:14:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1658D13AAF;
 Thu,  3 Nov 2022 15:14:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sBd/BPLaY2PBGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Nov 2022 15:14:58 +0000
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
X-Inumbo-ID: 47e52fa4-5b8a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1667488498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SotlzbMIFRL9v0KTZHyxFRipdSEQQSPUMfNHR83x5EY=;
	b=PDZXVu/i+LpGd/FOVJ4CtkS4GxIzhSOSRo1+zEaUTh5jGxEuVli6a4fqjug0o6eE3rbJI9
	zH6Fw3zPCpkUNHl1YiK+gk+OPfWMCE0y1TDhTATbEmWQYks3Tz1gbsoRqqMgdj2qw6UgDd
	MXCD64RK3yu6ZlG89myfxApCYJR3vFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1667488498;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SotlzbMIFRL9v0KTZHyxFRipdSEQQSPUMfNHR83x5EY=;
	b=1D2xNvf8vsnumL3E2WeVZuxoi+pkA0EJGU9PpFGu6iabSWDf05OU6gmWkluwzJaNx0b96E
	R8aEb4AWWbbranCA==
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	javierm@redhat.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: "linux-hyperv@vger.kernel.orglinux-hyperv"@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, freedreno@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 17/23] drm/fb-helper: Perform all fbdev I/O with the same implementation
Date: Thu,  3 Nov 2022 16:14:40 +0100
Message-Id: <20221103151446.2638-18-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221103151446.2638-1-tzimmermann@suse.de>
References: <20221103151446.2638-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the fbdev's read/write helpers with the same functions. Use
the generic fbdev's code as template. Convert all drivers.

DRM's fb helpers must implement regular I/O functionality in struct
fb_ops and possibly perform a damage update. Handle all this in the
same functions and convert drivers. The functionality has been used
as part of the generic fbdev code for some time. The drivers don't
set struct drm_fb_helper.fb_dirty, so they will not be affected by
damage handling.

For I/O memory, fb helpers now provide drm_fb_helper_cfb_read() and
drm_fb_helper_cfb_write(). Several drivers require these. Until now
tegra used I/O read and write, although the memory buffer appears to
be in system memory. So use _sys_ helpers now.

v3:
	* fix docs (Javier)
v2:
	* rebase onto vmwgfx changes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/armada/armada_fbdev.c      |   2 +
 drivers/gpu/drm/drm_fb_helper.c            | 383 ++++++++++++---------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |   2 +
 drivers/gpu/drm/gma500/framebuffer.c       |   2 +
 drivers/gpu/drm/i915/display/intel_fbdev.c |   2 +
 drivers/gpu/drm/radeon/radeon_fb.c         |   2 +
 drivers/gpu/drm/tegra/fb.c                 |   2 +
 include/drm/drm_fb_helper.h                |  17 +
 8 files changed, 254 insertions(+), 158 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index f02f6a5ba8320..584cee123bd8e 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -19,6 +19,8 @@
 static const struct fb_ops armada_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
+	.fb_read	= drm_fb_helper_cfb_read,
+	.fb_write	= drm_fb_helper_cfb_write,
 	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
 	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
 	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 379e0d2f67198..c7c0c0a8532b4 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -747,30 +747,132 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
+typedef ssize_t (*drm_fb_helper_read_screen)(struct fb_info *info, char __user *buf,
+					     size_t count, loff_t pos);
+
+static ssize_t __drm_fb_helper_read(struct fb_info *info, char __user *buf, size_t count,
+				    loff_t *ppos, drm_fb_helper_read_screen read_screen)
+{
+	loff_t pos = *ppos;
+	size_t total_size;
+	ssize_t ret;
+
+	if (info->screen_size)
+		total_size = info->screen_size;
+	else
+		total_size = info->fix.smem_len;
+
+	if (pos >= total_size)
+		return 0;
+	if (count >= total_size)
+		count = total_size;
+	if (total_size - count < pos)
+		count = total_size - pos;
+
+	if (info->fbops->fb_sync)
+		info->fbops->fb_sync(info);
+
+	ret = read_screen(info, buf, count, pos);
+	if (ret > 0)
+		*ppos += ret;
+
+	return ret;
+}
+
+typedef ssize_t (*drm_fb_helper_write_screen)(struct fb_info *info, const char __user *buf,
+					      size_t count, loff_t pos);
+
+static ssize_t __drm_fb_helper_write(struct fb_info *info, const char __user *buf, size_t count,
+				     loff_t *ppos, drm_fb_helper_write_screen write_screen)
+{
+	loff_t pos = *ppos;
+	size_t total_size;
+	ssize_t ret;
+	int err = 0;
+
+	if (info->screen_size)
+		total_size = info->screen_size;
+	else
+		total_size = info->fix.smem_len;
+
+	if (pos > total_size)
+		return -EFBIG;
+	if (count > total_size) {
+		err = -EFBIG;
+		count = total_size;
+	}
+	if (total_size - count < pos) {
+		if (!err)
+			err = -ENOSPC;
+		count = total_size - pos;
+	}
+
+	if (info->fbops->fb_sync)
+		info->fbops->fb_sync(info);
+
+	/*
+	 * Copy to framebuffer even if we already logged an error. Emulates
+	 * the behavior of the original fbdev implementation.
+	 */
+	ret = write_screen(info, buf, count, pos);
+	if (ret < 0)
+		return ret; /* return last error, if any */
+	else if (!ret)
+		return err; /* return previous error, if any */
+
+	*ppos += ret;
+
+	return ret;
+}
+
+static ssize_t drm_fb_helper_read_screen_buffer(struct fb_info *info, char __user *buf,
+						size_t count, loff_t pos)
+{
+	const char *src = info->screen_buffer + pos;
+
+	if (copy_to_user(buf, src, count))
+		return -EFAULT;
+
+	return count;
+}
+
 /**
- * drm_fb_helper_sys_read - wrapper around fb_sys_read
+ * drm_fb_helper_sys_read - Implements struct &fb_ops.fb_read for system memory
  * @info: fb_info struct pointer
  * @buf: userspace buffer to read from framebuffer memory
  * @count: number of bytes to read from framebuffer memory
  * @ppos: read offset within framebuffer memory
  *
- * A wrapper around fb_sys_read implemented by fbdev core
+ * Returns:
+ * The number of bytes read on success, or an error code otherwise.
  */
 ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
 			       size_t count, loff_t *ppos)
 {
-	return fb_sys_read(info, buf, count, ppos);
+	return __drm_fb_helper_read(info, buf, count, ppos, drm_fb_helper_read_screen_buffer);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_read);
 
+static ssize_t drm_fb_helper_write_screen_buffer(struct fb_info *info, const char __user *buf,
+						 size_t count, loff_t pos)
+{
+	char *dst = info->screen_buffer + pos;
+
+	if (copy_from_user(dst, buf, count))
+		return -EFAULT;
+
+	return count;
+}
+
 /**
- * drm_fb_helper_sys_write - wrapper around fb_sys_write
+ * drm_fb_helper_sys_write - Implements struct &fb_ops.fb_write for system memory
  * @info: fb_info struct pointer
  * @buf: userspace buffer to write to framebuffer memory
  * @count: number of bytes to write to framebuffer memory
  * @ppos: write offset within framebuffer memory
  *
- * A wrapper around fb_sys_write implemented by fbdev core
+ * Returns:
+ * The number of bytes written on success, or an error code otherwise.
  */
 ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 				size_t count, loff_t *ppos)
@@ -779,7 +881,7 @@ ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 	ssize_t ret;
 	struct drm_rect damage_area;
 
-	ret = fb_sys_write(info, buf, count, ppos);
+	ret = __drm_fb_helper_write(info, buf, count, ppos, drm_fb_helper_write_screen_buffer);
 	if (ret <= 0)
 		return ret;
 
@@ -837,6 +939,119 @@ void drm_fb_helper_sys_imageblit(struct fb_info *info,
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
 
+static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count,
+				   loff_t pos)
+{
+	const char __iomem *src = info->screen_base + pos;
+	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
+	ssize_t ret = 0;
+	int err = 0;
+	char *tmp;
+
+	tmp = kmalloc(alloc_size, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	while (count) {
+		size_t c = min_t(size_t, count, alloc_size);
+
+		memcpy_fromio(tmp, src, c);
+		if (copy_to_user(buf, tmp, c)) {
+			err = -EFAULT;
+			break;
+		}
+
+		src += c;
+		buf += c;
+		ret += c;
+		count -= c;
+	}
+
+	kfree(tmp);
+
+	return ret ? ret : err;
+}
+
+/**
+ * drm_fb_helper_cfb_read - Implements struct &fb_ops.fb_read for I/O memory
+ * @info: fb_info struct pointer
+ * @buf: userspace buffer to read from framebuffer memory
+ * @count: number of bytes to read from framebuffer memory
+ * @ppos: read offset within framebuffer memory
+ *
+ * Returns:
+ * The number of bytes read on success, or an error code otherwise.
+ */
+ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
+			       size_t count, loff_t *ppos)
+{
+	return __drm_fb_helper_read(info, buf, count, ppos, fb_read_screen_base);
+}
+EXPORT_SYMBOL(drm_fb_helper_cfb_read);
+
+static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf, size_t count,
+				    loff_t pos)
+{
+	char __iomem *dst = info->screen_base + pos;
+	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
+	ssize_t ret = 0;
+	int err = 0;
+	u8 *tmp;
+
+	tmp = kmalloc(alloc_size, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	while (count) {
+		size_t c = min_t(size_t, count, alloc_size);
+
+		if (copy_from_user(tmp, buf, c)) {
+			err = -EFAULT;
+			break;
+		}
+		memcpy_toio(dst, tmp, c);
+
+		dst += c;
+		buf += c;
+		ret += c;
+		count -= c;
+	}
+
+	kfree(tmp);
+
+	return ret ? ret : err;
+}
+
+/**
+ * drm_fb_helper_cfb_write - Implements struct &fb_ops.fb_write for I/O memory
+ * @info: fb_info struct pointer
+ * @buf: userspace buffer to write to framebuffer memory
+ * @count: number of bytes to write to framebuffer memory
+ * @ppos: write offset within framebuffer memory
+ *
+ * Returns:
+ * The number of bytes written on success, or an error code otherwise.
+ */
+ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
+				size_t count, loff_t *ppos)
+{
+	loff_t pos = *ppos;
+	ssize_t ret;
+	struct drm_rect damage_area;
+
+	ret = __drm_fb_helper_write(info, buf, count, ppos, fb_write_screen_base);
+	if (ret <= 0)
+		return ret;
+
+	drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
+	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
+			     drm_rect_width(&damage_area),
+			     drm_rect_height(&damage_area));
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_fb_helper_cfb_write);
+
 /**
  * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
  * @info: fbdev registered by the helper
@@ -2183,176 +2398,28 @@ static bool drm_fbdev_use_iomem(struct fb_info *info)
 	return !drm_fbdev_use_shadow_fb(fb_helper) && buffer->map.is_iomem;
 }
 
-static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count,
-				   loff_t pos)
-{
-	const char __iomem *src = info->screen_base + pos;
-	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
-	ssize_t ret = 0;
-	int err = 0;
-	char *tmp;
-
-	tmp = kmalloc(alloc_size, GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
-
-	while (count) {
-		size_t c = min_t(size_t, count, alloc_size);
-
-		memcpy_fromio(tmp, src, c);
-		if (copy_to_user(buf, tmp, c)) {
-			err = -EFAULT;
-			break;
-		}
-
-		src += c;
-		buf += c;
-		ret += c;
-		count -= c;
-	}
-
-	kfree(tmp);
-
-	return ret ? ret : err;
-}
-
-static ssize_t fb_read_screen_buffer(struct fb_info *info, char __user *buf, size_t count,
-				     loff_t pos)
-{
-	const char *src = info->screen_buffer + pos;
-
-	if (copy_to_user(buf, src, count))
-		return -EFAULT;
-
-	return count;
-}
-
 static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
 				 size_t count, loff_t *ppos)
 {
-	loff_t pos = *ppos;
-	size_t total_size;
 	ssize_t ret;
 
-	if (info->screen_size)
-		total_size = info->screen_size;
-	else
-		total_size = info->fix.smem_len;
-
-	if (pos >= total_size)
-		return 0;
-	if (count >= total_size)
-		count = total_size;
-	if (total_size - count < pos)
-		count = total_size - pos;
-
-	if (info->fbops->fb_sync)
-		info->fbops->fb_sync(info);
-
 	if (drm_fbdev_use_iomem(info))
-		ret = fb_read_screen_base(info, buf, count, pos);
+		ret = drm_fb_helper_cfb_read(info, buf, count, ppos);
 	else
-		ret = fb_read_screen_buffer(info, buf, count, pos);
-
-	if (ret > 0)
-		*ppos += ret;
+		ret = drm_fb_helper_sys_read(info, buf, count, ppos);
 
 	return ret;
 }
 
-static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf, size_t count,
-				    loff_t pos)
-{
-	char __iomem *dst = info->screen_base + pos;
-	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
-	ssize_t ret = 0;
-	int err = 0;
-	u8 *tmp;
-
-	tmp = kmalloc(alloc_size, GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
-
-	while (count) {
-		size_t c = min_t(size_t, count, alloc_size);
-
-		if (copy_from_user(tmp, buf, c)) {
-			err = -EFAULT;
-			break;
-		}
-		memcpy_toio(dst, tmp, c);
-
-		dst += c;
-		buf += c;
-		ret += c;
-		count -= c;
-	}
-
-	kfree(tmp);
-
-	return ret ? ret : err;
-}
-
-static ssize_t fb_write_screen_buffer(struct fb_info *info, const char __user *buf, size_t count,
-				      loff_t pos)
-{
-	char *dst = info->screen_buffer + pos;
-
-	if (copy_from_user(dst, buf, count))
-		return -EFAULT;
-
-	return count;
-}
-
 static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
 				  size_t count, loff_t *ppos)
 {
-	loff_t pos = *ppos;
-	size_t total_size;
 	ssize_t ret;
-	struct drm_rect damage_area;
-	int err = 0;
 
-	if (info->screen_size)
-		total_size = info->screen_size;
-	else
-		total_size = info->fix.smem_len;
-
-	if (pos > total_size)
-		return -EFBIG;
-	if (count > total_size) {
-		err = -EFBIG;
-		count = total_size;
-	}
-	if (total_size - count < pos) {
-		if (!err)
-			err = -ENOSPC;
-		count = total_size - pos;
-	}
-
-	if (info->fbops->fb_sync)
-		info->fbops->fb_sync(info);
-
-	/*
-	 * Copy to framebuffer even if we already logged an error. Emulates
-	 * the behavior of the original fbdev implementation.
-	 */
 	if (drm_fbdev_use_iomem(info))
-		ret = fb_write_screen_base(info, buf, count, pos);
+		ret = drm_fb_helper_cfb_write(info, buf, count, ppos);
 	else
-		ret = fb_write_screen_buffer(info, buf, count, pos);
-
-	if (ret < 0)
-		return ret; /* return last error, if any */
-	else if (!ret)
-		return err; /* return previous error, if any */
-
-	*ppos += ret;
-
-	drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
-	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
-			     drm_rect_width(&damage_area),
-			     drm_rect_height(&damage_area));
+		ret = drm_fb_helper_sys_write(info, buf, count, ppos);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 86c489d945849..55c92372fca04 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -49,6 +49,8 @@ static const struct fb_ops exynos_drm_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_mmap        = exynos_drm_fb_mmap,
+	.fb_read	= drm_fb_helper_cfb_read,
+	.fb_write	= drm_fb_helper_cfb_write,
 	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
 	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
 	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 6098d936e44b6..8d5a37b8f1100 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -147,6 +147,8 @@ static const struct fb_ops psbfb_unaccel_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_setcolreg = psbfb_setcolreg,
+	.fb_read = drm_fb_helper_cfb_read,
+	.fb_write = drm_fb_helper_cfb_write,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = drm_fb_helper_cfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 1b576c859837b..5575d7abdc092 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -124,6 +124,8 @@ static const struct fb_ops intelfb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_set_par = intel_fbdev_set_par,
+	.fb_read = drm_fb_helper_cfb_read,
+	.fb_write = drm_fb_helper_cfb_write,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = drm_fb_helper_cfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index f06fed2030a89..c1710ed1cab83 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -80,6 +80,8 @@ static const struct fb_ops radeonfb_ops = {
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_open = radeonfb_open,
 	.fb_release = radeonfb_release,
+	.fb_read = drm_fb_helper_cfb_read,
+	.fb_write = drm_fb_helper_cfb_write,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = drm_fb_helper_cfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 84b7f1dd9fb57..a900300ae5bdc 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -206,6 +206,8 @@ static int tegra_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 static const struct fb_ops tegra_fb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
+	.fb_read = drm_fb_helper_sys_read,
+	.fb_write = drm_fb_helper_sys_write,
 	.fb_fillrect = drm_fb_helper_sys_fillrect,
 	.fb_copyarea = drm_fb_helper_sys_copyarea,
 	.fb_imageblit = drm_fb_helper_sys_imageblit,
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 3d7a3d68dab8a..6581183618b89 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -257,6 +257,11 @@ void drm_fb_helper_sys_copyarea(struct fb_info *info,
 void drm_fb_helper_sys_imageblit(struct fb_info *info,
 				 const struct fb_image *image);
 
+ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
+			       size_t count, loff_t *ppos);
+ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
+				size_t count, loff_t *ppos);
+
 void drm_fb_helper_cfb_fillrect(struct fb_info *info,
 				const struct fb_fillrect *rect);
 void drm_fb_helper_cfb_copyarea(struct fb_info *info,
@@ -402,6 +407,18 @@ static inline void drm_fb_helper_sys_imageblit(struct fb_info *info,
 {
 }
 
+static inline ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
+					     size_t count, loff_t *ppos)
+{
+	return -ENODEV;
+}
+
+static inline ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
+					      size_t count, loff_t *ppos)
+{
+	return -ENODEV;
+}
+
 static inline void drm_fb_helper_cfb_fillrect(struct fb_info *info,
 					      const struct fb_fillrect *rect)
 {
-- 
2.38.0


