Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28568A5C927
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 16:55:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908451.1315578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1wq-0000Rk-8b; Tue, 11 Mar 2025 15:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908451.1315578; Tue, 11 Mar 2025 15:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1wq-0000QC-5a; Tue, 11 Mar 2025 15:55:16 +0000
Received: by outflank-mailman (input) for mailman id 908451;
 Tue, 11 Mar 2025 15:55:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NX78=V6=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1ts1wo-0008RK-4j
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 15:55:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37363688-fe91-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 16:55:12 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1755A1F443;
 Tue, 11 Mar 2025 15:54:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 694BE13AB8;
 Tue, 11 Mar 2025 15:54:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sJFGGMxc0GdUdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Mar 2025 15:54:52 +0000
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
X-Inumbo-ID: 37363688-fe91-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bQvxtHW//eoogfjKKEKKkC38s4D6U/hg24arM25nRWk=;
	b=oZOuqrYPSVVM9VvFxsTMXUZyj85FErY9iYGF5Lsz6PAQ3zJocOf9J6O8uXpl6iNBVBoTvX
	mrKZO1LMGVKfarIb7O3wWYqkRLJE1Fcdr+W/UE5/1Clq9jWGEV5yuXOJOgYdEW07ZKXYAS
	fO44Oq58Y/QeHZm+yO+vaBqcQM4TN5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708494;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bQvxtHW//eoogfjKKEKKkC38s4D6U/hg24arM25nRWk=;
	b=7XB6KMRoTaRLV/ooyrNK8EgyNY6/OaB9L9XyH0wGeesybuyOSAPpM5X6qSTwOUzIleh5kv
	1LTjdnzBxMTMr4DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="qAiQ+/xv";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=a0oqtpx2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bQvxtHW//eoogfjKKEKKkC38s4D6U/hg24arM25nRWk=;
	b=qAiQ+/xvMTwufmeSnKIpIj59G3KotmnnvXYY+381HT3A1szboyWhNzScXEb4YplhbAdsWr
	52j6tEZZ+yRpDGylLAyPNrBqgeTzK3vJS+hI7irK44we8oulDWSASH0e7TzoNRbCuLt3/9
	McU0nA4hE2zwkNG7MDkH5WjlLwmm38s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708493;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bQvxtHW//eoogfjKKEKKkC38s4D6U/hg24arM25nRWk=;
	b=a0oqtpx2gAGAVOEIftO2shSS1sEkvpJBwQjtP+w4lBZ6yrZtR5driQRJFB6GREiFVg4p/+
	/m18E4LqKR5YqRAg==
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	geert@linux-m68k.org,
	tomi.valkeinen@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Tian Tao <tiantao6@hisilicon.com>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>
Subject: [PATCH v4 09/25] drm/hibmc: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 11 Mar 2025 16:47:13 +0100
Message-ID: <20250311155120.442633-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311155120.442633-1-tzimmermann@suse.de>
References: <20250311155120.442633-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1755A1F443
X-Spam-Level: 
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[27];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,linaro.org:email,suse.de:email,suse.de:dkim,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51
X-Spam-Flag: NO

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 128.

The hibmc driver's new hibmc_dumb_create() is similar to the one
in GEM VRAM helpers. The driver was the only caller of
drm_gem_vram_fill_create_dumb(). Remove the now unused helper.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Cc: John Stultz <jstultz@google.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c         | 65 -------------------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 25 ++++++-
 include/drm/drm_gem_vram_helper.h             |  6 --
 3 files changed, 24 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 15cd564cbeac..b4cf8134df6d 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -444,71 +444,6 @@ void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
 }
 EXPORT_SYMBOL(drm_gem_vram_vunmap);
 
-/**
- * drm_gem_vram_fill_create_dumb() - Helper for implementing
- *				     &struct drm_driver.dumb_create
- *
- * @file:		the DRM file
- * @dev:		the DRM device
- * @pg_align:		the buffer's alignment in multiples of the page size
- * @pitch_align:	the scanline's alignment in powers of 2
- * @args:		the arguments as provided to
- *			&struct drm_driver.dumb_create
- *
- * This helper function fills &struct drm_mode_create_dumb, which is used
- * by &struct drm_driver.dumb_create. Implementations of this interface
- * should forwards their arguments to this helper, plus the driver-specific
- * parameters.
- *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
- */
-int drm_gem_vram_fill_create_dumb(struct drm_file *file,
-				  struct drm_device *dev,
-				  unsigned long pg_align,
-				  unsigned long pitch_align,
-				  struct drm_mode_create_dumb *args)
-{
-	size_t pitch, size;
-	struct drm_gem_vram_object *gbo;
-	int ret;
-	u32 handle;
-
-	pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
-	if (pitch_align) {
-		if (WARN_ON_ONCE(!is_power_of_2(pitch_align)))
-			return -EINVAL;
-		pitch = ALIGN(pitch, pitch_align);
-	}
-	size = pitch * args->height;
-
-	size = roundup(size, PAGE_SIZE);
-	if (!size)
-		return -EINVAL;
-
-	gbo = drm_gem_vram_create(dev, size, pg_align);
-	if (IS_ERR(gbo))
-		return PTR_ERR(gbo);
-
-	ret = drm_gem_handle_create(file, &gbo->bo.base, &handle);
-	if (ret)
-		goto err_drm_gem_object_put;
-
-	drm_gem_object_put(&gbo->bo.base);
-
-	args->pitch = pitch;
-	args->size = size;
-	args->handle = handle;
-
-	return 0;
-
-err_drm_gem_object_put:
-	drm_gem_object_put(&gbo->bo.base);
-	return ret;
-}
-EXPORT_SYMBOL(drm_gem_vram_fill_create_dumb);
-
 /*
  * Helpers for struct ttm_device_funcs
  */
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index e6de6d5edf6b..81768577871f 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -18,10 +18,12 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_mode.h>
 #include <drm/drm_module.h>
 #include <drm/drm_vblank.h>
 
@@ -54,7 +56,28 @@ static irqreturn_t hibmc_interrupt(int irq, void *arg)
 static int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
 			     struct drm_mode_create_dumb *args)
 {
-	return drm_gem_vram_fill_create_dumb(file, dev, 0, 128, args);
+	struct drm_gem_vram_object *gbo;
+	int ret;
+
+	ret = drm_mode_size_dumb(dev, args, SZ_128, 0);
+	if (ret)
+		return ret;
+
+	gbo = drm_gem_vram_create(dev, args->size, 0);
+	if (IS_ERR(gbo))
+		return PTR_ERR(gbo);
+
+	ret = drm_gem_handle_create(file, &gbo->bo.base, &args->handle);
+	if (ret)
+		goto err_drm_gem_object_put;
+
+	drm_gem_object_put(&gbo->bo.base);
+
+	return 0;
+
+err_drm_gem_object_put:
+	drm_gem_object_put(&gbo->bo.base);
+	return ret;
 }
 
 static const struct drm_driver hibmc_driver = {
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 00830b49a3ff..b6e821f5dd03 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -100,12 +100,6 @@ int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct iosys_map *map);
 void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
 			 struct iosys_map *map);
 
-int drm_gem_vram_fill_create_dumb(struct drm_file *file,
-				  struct drm_device *dev,
-				  unsigned long pg_align,
-				  unsigned long pitch_align,
-				  struct drm_mode_create_dumb *args);
-
 /*
  * Helpers for struct drm_driver
  */
-- 
2.48.1


