Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB24A39EE3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 15:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891478.1300596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOY2-00045i-Qc; Tue, 18 Feb 2025 14:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891478.1300596; Tue, 18 Feb 2025 14:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOY2-0003yu-Ge; Tue, 18 Feb 2025 14:26:06 +0000
Received: by outflank-mailman (input) for mailman id 891478;
 Tue, 18 Feb 2025 14:26:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n6Eg=VJ=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1tkOY0-0001OR-NN
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 14:26:04 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4833f344-ee04-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 15:26:03 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C9DE71F396;
 Tue, 18 Feb 2025 14:25:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 349A5132C7;
 Tue, 18 Feb 2025 14:25:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KO1DC3CYtGdXYQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:52 +0000
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
X-Inumbo-ID: 4833f344-ee04-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6tw141ERvTj50LMM/M8KRuOx9Sn2tlrGiZPGvM+A8Ag=;
	b=kOQJlDYbdXiQq/kzsTkX4kXzK7a5I5YxIwjhGF5xlgxqzAQmjNe4Pw9dyiIqZVOWaq+L8O
	avmS+6G9nrXbwJP6CJA8v9vsTj9Br+jqxVEXuEjEsQNjJrV6vbuNlJMAdNZ+PEd5KLFE3c
	tIZE1Dhq5SrHox7No+DovNtApJxEVfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888752;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6tw141ERvTj50LMM/M8KRuOx9Sn2tlrGiZPGvM+A8Ag=;
	b=nJuS/UBtzO82Eyt+vaZH3gja0zLuJFrIJCHYqoL7F2yGpvlbWq56TuDp3aNi9xrs+QQHEh
	H+6TRFnCSI328ECQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6tw141ERvTj50LMM/M8KRuOx9Sn2tlrGiZPGvM+A8Ag=;
	b=kOQJlDYbdXiQq/kzsTkX4kXzK7a5I5YxIwjhGF5xlgxqzAQmjNe4Pw9dyiIqZVOWaq+L8O
	avmS+6G9nrXbwJP6CJA8v9vsTj9Br+jqxVEXuEjEsQNjJrV6vbuNlJMAdNZ+PEd5KLFE3c
	tIZE1Dhq5SrHox7No+DovNtApJxEVfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888752;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6tw141ERvTj50LMM/M8KRuOx9Sn2tlrGiZPGvM+A8Ag=;
	b=nJuS/UBtzO82Eyt+vaZH3gja0zLuJFrIJCHYqoL7F2yGpvlbWq56TuDp3aNi9xrs+QQHEh
	H+6TRFnCSI328ECQ==
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 10/25] drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 18 Feb 2025 15:23:33 +0100
Message-ID: <20250218142542.438557-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218142542.438557-1-tzimmermann@suse.de>
References: <20250218142542.438557-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,suse.de,pengutronix.de,kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. The hardware requires the framebuffer width to be a
multiple of 8. The scanline pitch has be large enough to support
this. Therefore compute the byte size of 8 pixels in the given color
mode and align the pitch accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 31 ++++++++++++++++++------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index e7025df7b978..465b5a6ad5bb 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -17,7 +17,9 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_fbdev_dma.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
@@ -141,19 +143,32 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
 			       struct drm_device *drm,
 			       struct drm_mode_create_dumb *args)
 {
-	u32 width = args->width;
+	u32 fourcc;
+	const struct drm_format_info *info;
+	u64 pitch_align;
 	int ret;
 
-	args->width = ALIGN(width, 8);
-	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
-
-	ret = drm_gem_dma_dumb_create(file_priv, drm, args);
+	/*
+	 * Hardware requires the framebuffer width to be aligned to
+	 * multiples of 8. The mode-setting code handles this, but
+	 * the buffer pitch has to be aligned as well. Set the pitch
+	 * alignment accordingly, so that the each scanline fits into
+	 * the allocated buffer.
+	 */
+	fourcc = drm_driver_color_mode_format(drm, args->bpp);
+	if (fourcc == DRM_FORMAT_INVALID)
+		return -EINVAL;
+	info = drm_format_info(fourcc);
+	if (!info)
+		return -EINVAL;
+	pitch_align = drm_format_info_min_pitch(info, 0, SZ_8);
+	if (!pitch_align || pitch_align > U32_MAX)
+		return -EINVAL;
+	ret = drm_mode_size_dumb(drm, args, pitch_align, 0);
 	if (ret)
 		return ret;
 
-	args->width = width;
-	return ret;
+	return drm_gem_dma_dumb_create(file_priv, drm, args);
 }
 
 static const struct drm_driver imx_drm_driver = {
-- 
2.48.1


