Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B821AD8753
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 11:12:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014046.1392318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ0SB-0004hv-3r; Fri, 13 Jun 2025 09:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014046.1392318; Fri, 13 Jun 2025 09:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ0SB-0004ei-0g; Fri, 13 Jun 2025 09:12:03 +0000
Received: by outflank-mailman (input) for mailman id 1014046;
 Fri, 13 Jun 2025 09:12:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iqaj=Y4=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1uQ0Lf-0002BZ-IX
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 09:05:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83e6370f-4835-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 11:05:13 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9E5101F896;
 Fri, 13 Jun 2025 09:04:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 08101137FE;
 Fri, 13 Jun 2025 09:04:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YEKZAK3pS2inNAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 09:04:45 +0000
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
X-Inumbo-ID: 83e6370f-4835-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749805485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xV/rClDUfCgVuPmCSOActQIgsfxDY8oPQuweoA/ffSQ=;
	b=qlMVT7vNnHSOv/vpD9RlSdHxWD5rt2xTwEa4OyBEYDldmyOf91q6YH+0UT6dCwTnv21J93
	/wsmjqPkelxg8CEiHED+kyCpl3Afc+9g5WZDus45IjX8oKeLXMAbhYbdNdvz2ggcwR+yML
	bh6Da6LIug8bTZVjB/koBhHGJjKkOsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749805485;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xV/rClDUfCgVuPmCSOActQIgsfxDY8oPQuweoA/ffSQ=;
	b=Tgeyfox/qBVuHOt4rI8xForvg1EsZ92vf7KpmnOhb9lYz2nkl1rFZs6XwvUforXArhGLYo
	30lqTT0xfRRelNAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749805485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xV/rClDUfCgVuPmCSOActQIgsfxDY8oPQuweoA/ffSQ=;
	b=qlMVT7vNnHSOv/vpD9RlSdHxWD5rt2xTwEa4OyBEYDldmyOf91q6YH+0UT6dCwTnv21J93
	/wsmjqPkelxg8CEiHED+kyCpl3Afc+9g5WZDus45IjX8oKeLXMAbhYbdNdvz2ggcwR+yML
	bh6Da6LIug8bTZVjB/koBhHGJjKkOsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749805485;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xV/rClDUfCgVuPmCSOActQIgsfxDY8oPQuweoA/ffSQ=;
	b=Tgeyfox/qBVuHOt4rI8xForvg1EsZ92vf7KpmnOhb9lYz2nkl1rFZs6XwvUforXArhGLYo
	30lqTT0xfRRelNAQ==
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
	Lyude Paul <lyude@redhat.com>,
	Karol Herbst <kherbst@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v5 14/25] drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Fri, 13 Jun 2025 11:00:33 +0200
Message-ID: <20250613090431.127087-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613090431.127087-1-tzimmermann@suse.de>
References: <20250613090431.127087-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -5.30
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 256.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index add006fc8d81..daa2528f9c9a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -30,6 +30,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_client_event.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -808,9 +809,9 @@ nouveau_display_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 	uint32_t domain;
 	int ret;
 
-	args->pitch = roundup(args->width * (args->bpp / 8), 256);
-	args->size = args->pitch * args->height;
-	args->size = roundup(args->size, PAGE_SIZE);
+	ret = drm_mode_size_dumb(dev, args, SZ_256, 0);
+	if (ret)
+		return ret;
 
 	/* Use VRAM if there is any ; otherwise fallback to system memory */
 	if (nouveau_drm(dev)->client.device.info.ram_size != 0)
-- 
2.49.0


