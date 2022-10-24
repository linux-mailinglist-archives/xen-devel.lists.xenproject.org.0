Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5696A60A07B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 13:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428910.679632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvVB-0007Kq-IK; Mon, 24 Oct 2022 11:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428910.679632; Mon, 24 Oct 2022 11:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvVA-000720-KU; Mon, 24 Oct 2022 11:20:16 +0000
Received: by outflank-mailman (input) for mailman id 428910;
 Mon, 24 Oct 2022 11:20:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fxyk=2Z=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1omvV1-0003Yp-Ni
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 11:20:07 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d00a2c37-538d-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 13:20:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B4276220DA;
 Mon, 24 Oct 2022 11:20:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 359A713A98;
 Mon, 24 Oct 2022 11:20:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UFgyDOZ0VmOYMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Oct 2022 11:20:06 +0000
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
X-Inumbo-ID: d00a2c37-538d-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1666610406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2hXo1ZXw+fT7jNTQpjjai6MaQuUlFJ3x4yHM5t/NT8=;
	b=NmK2JPY7erjfISSjJHyuZn3S9M4HE0QY2DX64ewIKQkqdV4YW55dIfYZUFwsucHgK8EJWo
	9OqpMMbfSr3Sj4qTG661IHslL7dTlOf47A0qYZ/yUtPD5rYrjiqIr2/K1pI8y8YSUIBX7A
	u/2NuQed3cKWK0fTF/Zshk2lHorpMOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1666610406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2hXo1ZXw+fT7jNTQpjjai6MaQuUlFJ3x4yHM5t/NT8=;
	b=2HdzFY+hAc4IQyzPhbPzdnFAvNOMcpZCifG7L10kN4snoDQgnsRKjQRlxM4yHitxgDoIAD
	6G6AQD9Zct0kBEBA==
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
Subject: [PATCH v2 16/21] drm/fb-helper: Call fb_sync in I/O functions
Date: Mon, 24 Oct 2022 13:19:48 +0200
Message-Id: <20221024111953.24307-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221024111953.24307-1-tzimmermann@suse.de>
References: <20221024111953.24307-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call struct fb_ops.fb_sync in drm_fbdev_{read,write}() to mimic the
behavior of fbdev. Fbdev implementations of fb_read and fb_write in
struct fb_ops invoke fb_sync to synchronize with outstanding operations
before I/O. Doing the same in DRM implementations will allow us to use
them throughout DRM drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index f6d22cc4cd876..379e0d2f67198 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -2246,6 +2246,9 @@ static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
 	if (total_size - count < pos)
 		count = total_size - pos;
 
+	if (info->fbops->fb_sync)
+		info->fbops->fb_sync(info);
+
 	if (drm_fbdev_use_iomem(info))
 		ret = fb_read_screen_base(info, buf, count, pos);
 	else
@@ -2327,6 +2330,9 @@ static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
 		count = total_size - pos;
 	}
 
+	if (info->fbops->fb_sync)
+		info->fbops->fb_sync(info);
+
 	/*
 	 * Copy to framebuffer even if we already logged an error. Emulates
 	 * the behavior of the original fbdev implementation.
-- 
2.38.0


