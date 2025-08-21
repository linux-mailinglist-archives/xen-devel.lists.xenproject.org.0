Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFE6B2F1DE
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 10:33:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088052.1445883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up0jX-0003lS-OX; Thu, 21 Aug 2025 08:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088052.1445883; Thu, 21 Aug 2025 08:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up0jX-0003jW-Ly; Thu, 21 Aug 2025 08:33:19 +0000
Received: by outflank-mailman (input) for mailman id 1088052;
 Thu, 21 Aug 2025 08:33:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+F7x=3B=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1up0ZV-0001aB-VI
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 08:22:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 056b368f-7e68-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 10:22:48 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 946E41F853;
 Thu, 21 Aug 2025 08:22:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 06F8E13867;
 Thu, 21 Aug 2025 08:22:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CFJ9AD3XpmhzEwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:21 +0000
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
X-Inumbo-ID: 056b368f-7e68-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5jjJ1T1v/aZMEH6qEuFOLLTT1MbnehEC6ADbpMxNn/Y=;
	b=vi/Te3EaMGkxWne1cDrn7ss5wH3an8cpo5qRGhJwqSvV4zdPDQEysn0Xr94P00xzKbhL5P
	rAuGGknCsO+PQxy2RmWc+NjwUrIS+KHS8HtGtgELNbkrI2JefNOC3f6CuyofRTaF+yzAgD
	PvCjkl+g+4jlIr3GjsOnooCXuito11M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5jjJ1T1v/aZMEH6qEuFOLLTT1MbnehEC6ADbpMxNn/Y=;
	b=Ko8NiJHS05xtmCsxqe8GU7aiqtH97ywiCmDn3phzu80rJ2+SG3P04U4b5vZNupcKxO8oeL
	HETIc6If+883LbDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5jjJ1T1v/aZMEH6qEuFOLLTT1MbnehEC6ADbpMxNn/Y=;
	b=vi/Te3EaMGkxWne1cDrn7ss5wH3an8cpo5qRGhJwqSvV4zdPDQEysn0Xr94P00xzKbhL5P
	rAuGGknCsO+PQxy2RmWc+NjwUrIS+KHS8HtGtgELNbkrI2JefNOC3f6CuyofRTaF+yzAgD
	PvCjkl+g+4jlIr3GjsOnooCXuito11M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5jjJ1T1v/aZMEH6qEuFOLLTT1MbnehEC6ADbpMxNn/Y=;
	b=Ko8NiJHS05xtmCsxqe8GU7aiqtH97ywiCmDn3phzu80rJ2+SG3P04U4b5vZNupcKxO8oeL
	HETIc6If+883LbDw==
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
	Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v6 16/25] drm/qxl: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu, 21 Aug 2025 10:17:23 +0200
Message-ID: <20250821081918.79786-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821081918.79786-1-tzimmermann@suse.de>
References: <20250821081918.79786-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6),to(RLbwen1niosrcqbxsafh1)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -1.30

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
and buffer size. No alignment required.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_dumb.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_dumb.c b/drivers/gpu/drm/qxl/qxl_dumb.c
index 17df5c7ccf69..1200946767ce 100644
--- a/drivers/gpu/drm/qxl/qxl_dumb.c
+++ b/drivers/gpu/drm/qxl/qxl_dumb.c
@@ -23,6 +23,8 @@
  *          Alon Levy
  */
 
+#include <drm/drm_dumb_buffers.h>
+
 #include "qxl_drv.h"
 #include "qxl_object.h"
 
@@ -35,14 +37,13 @@ int qxl_mode_dumb_create(struct drm_file *file_priv,
 	struct qxl_device *qdev = to_qxl(dev);
 	struct qxl_bo *qobj;
 	struct drm_gem_object *gobj;
-	uint32_t handle;
 	int r;
 	struct qxl_surface surf;
-	uint32_t pitch, format;
+	u32 format;
 
-	pitch = args->width * ((args->bpp + 1) / 8);
-	args->size = pitch * args->height;
-	args->size = ALIGN(args->size, PAGE_SIZE);
+	r = drm_mode_size_dumb(dev, args, 0, 0);
+	if (r)
+		return r;
 
 	switch (args->bpp) {
 	case 16:
@@ -57,20 +58,18 @@ int qxl_mode_dumb_create(struct drm_file *file_priv,
 
 	surf.width = args->width;
 	surf.height = args->height;
-	surf.stride = pitch;
+	surf.stride = args->pitch;
 	surf.format = format;
 	surf.data = 0;
 
 	r = qxl_gem_object_create_with_handle(qdev, file_priv,
 					      QXL_GEM_DOMAIN_CPU,
 					      args->size, &surf, &gobj,
-					      &handle);
+					      &args->handle);
 	if (r)
 		return r;
 	qobj = gem_to_qxl_bo(gobj);
 	qobj->is_dumb = true;
 	drm_gem_object_put(gobj);
-	args->pitch = pitch;
-	args->handle = handle;
 	return 0;
 }
-- 
2.50.1


