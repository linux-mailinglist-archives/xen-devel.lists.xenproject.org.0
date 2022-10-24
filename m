Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBBE60A183
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 13:25:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428979.679715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvaQ-000799-Rq; Mon, 24 Oct 2022 11:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428979.679715; Mon, 24 Oct 2022 11:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvaQ-00076n-OH; Mon, 24 Oct 2022 11:25:42 +0000
Received: by outflank-mailman (input) for mailman id 428979;
 Mon, 24 Oct 2022 11:25:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fxyk=2Z=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1omvV3-00036S-L4
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 11:20:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cffa41a3-538d-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 13:20:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3182E21EEB;
 Mon, 24 Oct 2022 11:20:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF83613357;
 Mon, 24 Oct 2022 11:20:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0HEWKuV0VmOYMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Oct 2022 11:20:05 +0000
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
X-Inumbo-ID: cffa41a3-538d-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1666610406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WYaJhA1ZHtKKCWMYOS0WRaraoDBAxhkucQ5O+wo9aPw=;
	b=0+Tl2DefcQaIYDUcMpFES9rEJY2u7yBZpXAmi4fc375AoTyYVR/7WgMN8VQcSxOqKlWIKs
	3CFjEDVT+j637v/7vkplfyZa83e9w+O0jNGK/Xta2v8V3bn8X8OrO3xpgz/NyJRhZYttrM
	A+NB3uy7keMR+cfMtO7CanoIfLgx6lY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1666610406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WYaJhA1ZHtKKCWMYOS0WRaraoDBAxhkucQ5O+wo9aPw=;
	b=ZR2qVGoni5VWvUoz6IrDdy2Kg/Ns+PUOtWkhqAoYhpZ2d6bonEJBKMBrVKoHqwVyfZfnZ4
	dgC584T7huNIz1Aw==
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
Subject: [PATCH v2 15/21] drm/fb-helper: Disconnect damage worker from update logic
Date: Mon, 24 Oct 2022 13:19:47 +0200
Message-Id: <20221024111953.24307-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221024111953.24307-1-tzimmermann@suse.de>
References: <20221024111953.24307-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fbdev helpers implement a damage worker that forwards fbdev
updates to the DRM driver. The worker's update logic depends on
the generic fbdev emulation. Separate the two via function pointer.

The generic fbdev emulation sets struct drm_fb_helper_funcs.fb_dirty,
a new callback that hides the update logic from the damage worker.
It's not possible to use the generic logic with other fbdev emulation,
because it contains additional code for the shadow buffering that
the generic emulation employs.

DRM drivers with internal fbdev emulation can set fb_dirty to their
own implementation if they require damage handling; although no such
drivers currently exist.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 75 ++++++++++++++++++++-------------
 include/drm/drm_fb_helper.h     | 15 +++++++
 2 files changed, 61 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index bfbb2af144060..f6d22cc4cd876 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -448,35 +448,24 @@ static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
 
 static void drm_fb_helper_damage_work(struct work_struct *work)
 {
-	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper,
-						    damage_work);
-	struct drm_device *dev = helper->dev;
+	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);
 	struct drm_clip_rect *clip = &helper->damage_clip;
 	struct drm_clip_rect clip_copy;
 	unsigned long flags;
 	int ret;
 
+	if (!helper->funcs->fb_dirty)
+		return;
+
 	spin_lock_irqsave(&helper->damage_lock, flags);
 	clip_copy = *clip;
 	clip->x1 = clip->y1 = ~0;
 	clip->x2 = clip->y2 = 0;
 	spin_unlock_irqrestore(&helper->damage_lock, flags);
 
-	/* Call damage handlers only if necessary */
-	if (!(clip_copy.x1 < clip_copy.x2 && clip_copy.y1 < clip_copy.y2))
-		return;
-
-	if (helper->buffer) {
-		ret = drm_fb_helper_damage_blit(helper, &clip_copy);
-		if (drm_WARN_ONCE(dev, ret, "Damage blitter failed: ret=%d\n", ret))
-			goto err;
-	}
-
-	if (helper->fb->funcs->dirty) {
-		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
-		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
-			goto err;
-	}
+	ret = helper->funcs->fb_dirty(helper, &clip_copy);
+	if (ret)
+		goto err;
 
 	return;
 
@@ -670,16 +659,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 }
 EXPORT_SYMBOL(drm_fb_helper_fini);
 
-static bool drm_fbdev_use_shadow_fb(struct drm_fb_helper *fb_helper)
-{
-	struct drm_device *dev = fb_helper->dev;
-	struct drm_framebuffer *fb = fb_helper->fb;
-
-	return dev->mode_config.prefer_shadow_fbdev ||
-	       dev->mode_config.prefer_shadow ||
-	       fb->funcs->dirty;
-}
-
 static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
 				 u32 width, u32 height)
 {
@@ -687,7 +666,7 @@ static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
 	struct drm_clip_rect *clip = &helper->damage_clip;
 	unsigned long flags;
 
-	if (!drm_fbdev_use_shadow_fb(helper))
+	if (!helper->funcs->fb_dirty)
 		return;
 
 	spin_lock_irqsave(&helper->damage_lock, flags);
@@ -2111,6 +2090,16 @@ void drm_fb_helper_output_poll_changed(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_fb_helper_output_poll_changed);
 
+static bool drm_fbdev_use_shadow_fb(struct drm_fb_helper *fb_helper)
+{
+	struct drm_device *dev = fb_helper->dev;
+	struct drm_framebuffer *fb = fb_helper->fb;
+
+	return dev->mode_config.prefer_shadow_fbdev ||
+	       dev->mode_config.prefer_shadow ||
+	       fb->funcs->dirty;
+}
+
 /* @user: 1=userspace, 0=fbcon */
 static int drm_fbdev_fb_open(struct fb_info *info, int user)
 {
@@ -2487,8 +2476,36 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 	return 0;
 }
 
+static int drm_fbdev_fb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *clip)
+{
+	struct drm_device *dev = helper->dev;
+	int ret;
+
+	if (!drm_fbdev_use_shadow_fb(helper))
+		return 0;
+
+	/* Call damage handlers only if necessary */
+	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
+		return 0;
+
+	if (helper->buffer) {
+		ret = drm_fb_helper_damage_blit(helper, clip);
+		if (drm_WARN_ONCE(dev, ret, "Damage blitter failed: ret=%d\n", ret))
+			return ret;
+	}
+
+	if (helper->fb->funcs->dirty) {
+		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
+		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct drm_fb_helper_funcs drm_fb_helper_generic_funcs = {
 	.fb_probe = drm_fb_helper_generic_probe,
+	.fb_dirty = drm_fbdev_fb_dirty,
 };
 
 static void drm_fbdev_client_unregister(struct drm_client_dev *client)
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index edc697a2fde24..3d7a3d68dab8a 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -30,6 +30,7 @@
 #ifndef DRM_FB_HELPER_H
 #define DRM_FB_HELPER_H
 
+struct drm_clip_rect;
 struct drm_fb_helper;
 
 #include <linux/fb.h>
@@ -89,6 +90,20 @@ struct drm_fb_helper_funcs {
 	 */
 	int (*fb_probe)(struct drm_fb_helper *helper,
 			struct drm_fb_helper_surface_size *sizes);
+
+	/**
+	 * @fb_dirty:
+	 *
+	 * Driver callback to update the framebuffer memory. If set, fbdev
+	 * emulation will invoke this callback in regular intervals after
+	 * the framebuffer has been written.
+	 *
+	 * This callback is optional.
+	 *
+	 * Returns:
+	 * 0 on success, or an error code otherwise.
+	 */
+	int (*fb_dirty)(struct drm_fb_helper *helper, struct drm_clip_rect *clip);
 };
 
 /**
-- 
2.38.0


