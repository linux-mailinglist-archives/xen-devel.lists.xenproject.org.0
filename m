Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8434A5CA3E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 17:05:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908639.1315759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts26s-0004oJ-Tx; Tue, 11 Mar 2025 16:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908639.1315759; Tue, 11 Mar 2025 16:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts26s-0004lD-Mn; Tue, 11 Mar 2025 16:05:38 +0000
Received: by outflank-mailman (input) for mailman id 908639;
 Tue, 11 Mar 2025 16:05:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NX78=V6=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1ts1wg-0007cO-8w
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 15:55:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33454903-fe91-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 16:55:05 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 20B441F394;
 Tue, 11 Mar 2025 15:54:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D0AD134A0;
 Tue, 11 Mar 2025 15:54:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uGUlIcpc0GdUdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Mar 2025 15:54:50 +0000
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
X-Inumbo-ID: 33454903-fe91-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvyGQVvG/Gr8G1BafpFDmLBDPMYzsWpx1f1tc2HrwAI=;
	b=tepoufunognjy90xS3nppaCSwnZ7oLR7Zn0XRgzXn8AosmwaJ6IQ0UfQkoyhjDljXC1uKD
	sRqjm/OsiAstSPs0MAGQV9Jsw9rba2EtiIKoRPaC5WuiCf8rPBWiBQT+AbS4rb7FMY3czw
	2VlI67tCsPBGryS+Oaxh5LGx82/MB7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvyGQVvG/Gr8G1BafpFDmLBDPMYzsWpx1f1tc2HrwAI=;
	b=OfCFEZ+Frrl/5DJj9fTTIYXz5LFodSlpQtjLSXfiflwK6MEYvoa+/n+B0pccF9fGqe06Fv
	x7XGipQhFsSbx+DQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tepoufun;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OfCFEZ+F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvyGQVvG/Gr8G1BafpFDmLBDPMYzsWpx1f1tc2HrwAI=;
	b=tepoufunognjy90xS3nppaCSwnZ7oLR7Zn0XRgzXn8AosmwaJ6IQ0UfQkoyhjDljXC1uKD
	sRqjm/OsiAstSPs0MAGQV9Jsw9rba2EtiIKoRPaC5WuiCf8rPBWiBQT+AbS4rb7FMY3czw
	2VlI67tCsPBGryS+Oaxh5LGx82/MB7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvyGQVvG/Gr8G1BafpFDmLBDPMYzsWpx1f1tc2HrwAI=;
	b=OfCFEZ+Frrl/5DJj9fTTIYXz5LFodSlpQtjLSXfiflwK6MEYvoa+/n+B0pccF9fGqe06Fv
	x7XGipQhFsSbx+DQ==
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
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v4 06/25] drm/armada: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 11 Mar 2025 16:47:10 +0100
Message-ID: <20250311155120.442633-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311155120.442633-1-tzimmermann@suse.de>
References: <20250311155120.442633-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 20B441F394
X-Spam-Score: -1.51
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 128.

v4:
- align pitch to 128 bytes (Russell)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Russell King <linux@armlinux.org.uk>
---
 drivers/gpu/drm/armada/armada_gem.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 1a1680d71486..a767c4edd5c8 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -9,6 +9,7 @@
 #include <linux/shmem_fs.h>
 
 #include <drm/armada_drm.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
 
 #include "armada_drm.h"
@@ -244,14 +245,13 @@ int armada_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 	struct drm_mode_create_dumb *args)
 {
 	struct armada_gem_object *dobj;
-	u32 handle;
-	size_t size;
 	int ret;
 
-	args->pitch = armada_pitch(args->width, args->bpp);
-	args->size = size = args->pitch * args->height;
+	ret = drm_mode_size_dumb(dev, args, SZ_128, 0);
+	if (ret)
+		return ret;
 
-	dobj = armada_gem_alloc_private_object(dev, size);
+	dobj = armada_gem_alloc_private_object(dev, args->size);
 	if (dobj == NULL)
 		return -ENOMEM;
 
@@ -259,14 +259,12 @@ int armada_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 	if (ret)
 		goto err;
 
-	ret = drm_gem_handle_create(file, &dobj->obj, &handle);
+	ret = drm_gem_handle_create(file, &dobj->obj, &args->handle);
 	if (ret)
 		goto err;
 
-	args->handle = handle;
-
 	/* drop reference from allocate - handle holds it now */
-	DRM_DEBUG_DRIVER("obj %p size %zu handle %#x\n", dobj, size, handle);
+	DRM_DEBUG_DRIVER("obj %p size %llu handle %#x\n", dobj, args->size, args->handle);
  err:
 	drm_gem_object_put(&dobj->obj);
 	return ret;
-- 
2.48.1


