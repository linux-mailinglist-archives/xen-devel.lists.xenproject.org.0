Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF37A39FC1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 15:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891542.1300615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOcY-00089y-P2; Tue, 18 Feb 2025 14:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891542.1300615; Tue, 18 Feb 2025 14:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOcY-00088F-LV; Tue, 18 Feb 2025 14:30:46 +0000
Received: by outflank-mailman (input) for mailman id 891542;
 Tue, 18 Feb 2025 14:30:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n6Eg=VJ=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1tkOYM-0001OR-RC
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 14:26:26 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55534e39-ee04-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 15:26:25 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C7BC21F458;
 Tue, 18 Feb 2025 14:25:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F3EF132C7;
 Tue, 18 Feb 2025 14:25:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WD8jDneYtGdXYQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:59 +0000
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
X-Inumbo-ID: 55534e39-ee04-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8R2M5LLAHXFZEddSmuQRHiKZmmsqVdbAGGQy7ynxW6M=;
	b=w9+dDV2yKjDKG30GvShHhT6bjrZcmnbxOLq5GW/YKWGl5J34WqAEiyi9u/gfW0vLzq79h/
	7K5M70mNPtzpN1Z0/js+qnM0PpLTQWHygW88sAVYiZOUN9eDqkUb5BnGElu4oEH5Oozz1C
	poUj+ERN3cKzQFDXhyZTRECfJ3/xJvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8R2M5LLAHXFZEddSmuQRHiKZmmsqVdbAGGQy7ynxW6M=;
	b=GVJ5QuIq+0riqDLILiCPDkGqrHhDIxgtG39tDlazbcJDJ7yMBxit+TQZjvH1fAwGfTLRYL
	AgW4k/VSr8aoUUCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w9+dDV2y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GVJ5QuIq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8R2M5LLAHXFZEddSmuQRHiKZmmsqVdbAGGQy7ynxW6M=;
	b=w9+dDV2yKjDKG30GvShHhT6bjrZcmnbxOLq5GW/YKWGl5J34WqAEiyi9u/gfW0vLzq79h/
	7K5M70mNPtzpN1Z0/js+qnM0PpLTQWHygW88sAVYiZOUN9eDqkUb5BnGElu4oEH5Oozz1C
	poUj+ERN3cKzQFDXhyZTRECfJ3/xJvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8R2M5LLAHXFZEddSmuQRHiKZmmsqVdbAGGQy7ynxW6M=;
	b=GVJ5QuIq+0riqDLILiCPDkGqrHhDIxgtG39tDlazbcJDJ7yMBxit+TQZjvH1fAwGfTLRYL
	AgW4k/VSr8aoUUCQ==
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
	Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: [PATCH v3 22/25] drm/vmwgfx: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 18 Feb 2025 15:23:45 +0100
Message-ID: <20250218142542.438557-23-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218142542.438557-1-tzimmermann@suse.de>
References: <20250218142542.438557-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C7BC21F458
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51
X-Spam-Flag: NO

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
and buffer size. No alignment required.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 5721c74da3e0..a3fbd4148f73 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -34,6 +34,7 @@
 #include "vmw_surface_cache.h"
 #include "device_include/svga3d_surfacedefs.h"
 
+#include <drm/drm_dumb_buffers.h>
 #include <drm/ttm/ttm_placement.h>
 
 #define SVGA3D_FLAGS_64(upper32, lower32) (((uint64_t)upper32 << 32) | lower32)
@@ -2291,23 +2292,9 @@ int vmw_dumb_create(struct drm_file *file_priv,
 	 * contents is going to be rendered guest side.
 	 */
 	if (!dev_priv->has_mob || !vmw_supports_3d(dev_priv)) {
-		int cpp = DIV_ROUND_UP(args->bpp, 8);
-
-		switch (cpp) {
-		case 1: /* DRM_FORMAT_C8 */
-		case 2: /* DRM_FORMAT_RGB565 */
-		case 4: /* DRM_FORMAT_XRGB8888 */
-			break;
-		default:
-			/*
-			 * Dumb buffers don't allow anything else.
-			 * This is tested via IGT's dumb_buffers
-			 */
-			return -EINVAL;
-		}
-
-		args->pitch = args->width * cpp;
-		args->size = ALIGN(args->pitch * args->height, PAGE_SIZE);
+		ret = drm_mode_size_dumb(dev, args, 0, 0);
+		if (ret)
+			return ret;
 
 		ret = vmw_gem_object_create_with_handle(dev_priv, file_priv,
 							args->size, &args->handle,
-- 
2.48.1


