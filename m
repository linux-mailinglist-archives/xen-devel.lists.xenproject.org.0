Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7ED60A079
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 13:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428911.679651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvVF-00085l-4H; Mon, 24 Oct 2022 11:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428911.679651; Mon, 24 Oct 2022 11:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvVD-0007Zo-PA; Mon, 24 Oct 2022 11:20:19 +0000
Received: by outflank-mailman (input) for mailman id 428911;
 Mon, 24 Oct 2022 11:20:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fxyk=2Z=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1omvV3-0003Yp-5N
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 11:20:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0c0cdee-538d-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 13:20:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F1B821FD8F;
 Mon, 24 Oct 2022 11:20:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 50C2013A98;
 Mon, 24 Oct 2022 11:20:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SNLmEud0VmOYMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Oct 2022 11:20:07 +0000
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
X-Inumbo-ID: d0c0cdee-538d-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1666610408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIcpJgbeqPNRftPv7Q4iDJZ6HW36+TLeNbJLj/Rhtmc=;
	b=J5V9t/9FM/VDgPyc0yq6tO0GmQq6Qv25guz1Q1fY5WqdBAinoQHFhztpNq5LcTRRfUvvcT
	/NuVcNEdfBJX7fusjs7hFRkyxgbHxcWN1kfohXIkpRJAi1ty3GFGrpl4rAh+odteORdTGx
	FKkgD3un0IG2lJnoPAZi1HhvrYE46Xs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1666610408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIcpJgbeqPNRftPv7Q4iDJZ6HW36+TLeNbJLj/Rhtmc=;
	b=CNYWcX45+/WAYm9dPFnFWlK6swVE3qJRR6m+/F0MjgXTEr5bOtQ33tW8HoXd70hS0Hn34P
	VykmHgLg4gOIWDBg==
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	javierm@redhat.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	etnaviv@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 18/21] drm/fb_helper: Minimize damage-helper overhead
Date: Mon, 24 Oct 2022 13:19:50 +0200
Message-Id: <20221024111953.24307-19-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221024111953.24307-1-tzimmermann@suse.de>
References: <20221024111953.24307-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pull the test for fb_dirty into the caller to avoid extra work
if no callback has been set. In this case no damage handling is
required and no damage area needs to be computed. Print a warning
if the damage worker runs without getting an fb_dirty callback.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 90 ++++++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 836523aef6a27..fbc5c5445fdb0 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -449,12 +449,13 @@ static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
 static void drm_fb_helper_damage_work(struct work_struct *work)
 {
 	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);
+	struct drm_device *dev = helper->dev;
 	struct drm_clip_rect *clip = &helper->damage_clip;
 	struct drm_clip_rect clip_copy;
 	unsigned long flags;
 	int ret;
 
-	if (!helper->funcs->fb_dirty)
+	if (drm_WARN_ON_ONCE(dev, !helper->funcs->fb_dirty))
 		return;
 
 	spin_lock_irqsave(&helper->damage_lock, flags);
@@ -659,16 +660,12 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 }
 EXPORT_SYMBOL(drm_fb_helper_fini);
 
-static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
+static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
 				 u32 width, u32 height)
 {
-	struct drm_fb_helper *helper = info->par;
 	struct drm_clip_rect *clip = &helper->damage_clip;
 	unsigned long flags;
 
-	if (!helper->funcs->fb_dirty)
-		return;
-
 	spin_lock_irqsave(&helper->damage_lock, flags);
 	clip->x1 = min_t(u32, clip->x1, x);
 	clip->y1 = min_t(u32, clip->y1, y);
@@ -718,6 +715,7 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
  */
 void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
+	struct drm_fb_helper *helper = info->par;
 	unsigned long start, end, min_off, max_off;
 	struct fb_deferred_io_pageref *pageref;
 	struct drm_rect damage_area;
@@ -733,17 +731,19 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 	if (min_off >= max_off)
 		return;
 
-	/*
-	 * As we can only track pages, we might reach beyond the end
-	 * of the screen and account for non-existing scanlines. Hence,
-	 * keep the covered memory area within the screen buffer.
-	 */
-	max_off = min(max_off, info->screen_size);
+	if (helper->funcs->fb_dirty) {
+		/*
+		 * As we can only track pages, we might reach beyond the end
+		 * of the screen and account for non-existing scanlines. Hence,
+		 * keep the covered memory area within the screen buffer.
+		 */
+		max_off = min(max_off, info->screen_size);
 
-	drm_fb_helper_memory_range_to_clip(info, min_off, max_off - min_off, &damage_area);
-	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
-			     drm_rect_width(&damage_area),
-			     drm_rect_height(&damage_area));
+		drm_fb_helper_memory_range_to_clip(info, min_off, max_off - min_off, &damage_area);
+		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
+				     drm_rect_width(&damage_area),
+				     drm_rect_height(&damage_area));
+	}
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
@@ -877,6 +877,7 @@ static ssize_t drm_fb_helper_write_screen_buffer(struct fb_info *info, const cha
 ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 				size_t count, loff_t *ppos)
 {
+	struct drm_fb_helper *helper = info->par;
 	loff_t pos = *ppos;
 	ssize_t ret;
 	struct drm_rect damage_area;
@@ -885,10 +886,12 @@ ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 	if (ret <= 0)
 		return ret;
 
-	drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
-	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
-			     drm_rect_width(&damage_area),
-			     drm_rect_height(&damage_area));
+	if (helper->funcs->fb_dirty) {
+		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
+		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
+				     drm_rect_width(&damage_area),
+				     drm_rect_height(&damage_area));
+	}
 
 	return ret;
 }
@@ -904,8 +907,12 @@ EXPORT_SYMBOL(drm_fb_helper_sys_write);
 void drm_fb_helper_sys_fillrect(struct fb_info *info,
 				const struct fb_fillrect *rect)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	sys_fillrect(info, rect);
-	drm_fb_helper_damage(info, rect->dx, rect->dy, rect->width, rect->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
 
@@ -919,8 +926,12 @@ EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
 void drm_fb_helper_sys_copyarea(struct fb_info *info,
 				const struct fb_copyarea *area)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	sys_copyarea(info, area);
-	drm_fb_helper_damage(info, area->dx, area->dy, area->width, area->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
 
@@ -934,8 +945,12 @@ EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
 void drm_fb_helper_sys_imageblit(struct fb_info *info,
 				 const struct fb_image *image)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	sys_imageblit(info, image);
-	drm_fb_helper_damage(info, image->dx, image->dy, image->width, image->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
 
@@ -1035,6 +1050,7 @@ static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf
 ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
 				size_t count, loff_t *ppos)
 {
+	struct drm_fb_helper *helper = info->par;
 	loff_t pos = *ppos;
 	ssize_t ret;
 	struct drm_rect damage_area;
@@ -1043,10 +1059,12 @@ ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
 	if (ret <= 0)
 		return ret;
 
-	drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
-	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
-			     drm_rect_width(&damage_area),
-			     drm_rect_height(&damage_area));
+	if (helper->funcs->fb_dirty) {
+		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
+		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
+				     drm_rect_width(&damage_area),
+				     drm_rect_height(&damage_area));
+	}
 
 	return ret;
 }
@@ -1062,8 +1080,12 @@ EXPORT_SYMBOL(drm_fb_helper_cfb_write);
 void drm_fb_helper_cfb_fillrect(struct fb_info *info,
 				const struct fb_fillrect *rect)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	cfb_fillrect(info, rect);
-	drm_fb_helper_damage(info, rect->dx, rect->dy, rect->width, rect->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_fillrect);
 
@@ -1077,8 +1099,12 @@ EXPORT_SYMBOL(drm_fb_helper_cfb_fillrect);
 void drm_fb_helper_cfb_copyarea(struct fb_info *info,
 				const struct fb_copyarea *area)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	cfb_copyarea(info, area);
-	drm_fb_helper_damage(info, area->dx, area->dy, area->width, area->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_copyarea);
 
@@ -1092,8 +1118,12 @@ EXPORT_SYMBOL(drm_fb_helper_cfb_copyarea);
 void drm_fb_helper_cfb_imageblit(struct fb_info *info,
 				 const struct fb_image *image)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	cfb_imageblit(info, image);
-	drm_fb_helper_damage(info, image->dx, image->dy, image->width, image->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_imageblit);
 
-- 
2.38.0


