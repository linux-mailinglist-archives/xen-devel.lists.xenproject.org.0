Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8FC60A03B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 13:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428902.679551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvV0-0004qF-T9; Mon, 24 Oct 2022 11:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428902.679551; Mon, 24 Oct 2022 11:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvV0-0004ir-Ds; Mon, 24 Oct 2022 11:20:06 +0000
Received: by outflank-mailman (input) for mailman id 428902;
 Mon, 24 Oct 2022 11:20:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fxyk=2Z=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1omvUx-00036S-JL
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 11:20:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccfece6c-538d-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 13:20:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3791B21DE4;
 Mon, 24 Oct 2022 11:20:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C109713A98;
 Mon, 24 Oct 2022 11:20:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8PxcLuB0VmOYMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Oct 2022 11:20:00 +0000
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
X-Inumbo-ID: ccfece6c-538d-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1666610401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pDwG/2ZvVtedihuD7tm996Em6sMhLiO4FmD57P041QM=;
	b=mdwZe4oCDl9UJvnRtuXrem4SfiiFBuEbsVuBcem6XZzeWKEvLFgh++5J+F0kFPZh2OwF2c
	8rR6QVpJvrZjvNSwkyboHHN0mwwyZ2/JI1FZUdMFbe0+p5YrXMyI6It+57tRSs7sXcQ/Ma
	OZ806Nd+ViS++4+DGE9xm8GZLyhfO7g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1666610401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pDwG/2ZvVtedihuD7tm996Em6sMhLiO4FmD57P041QM=;
	b=hxqccXaIzzUM0Q2daluFxMAfY0DJqTJ1PLIzkvZNd4Zm8xifYKdsxU+9OAw1FxBxz2U0YP
	1XAP5XUT21C9REAA==
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
Subject: [PATCH v2 05/21] drm/imx/dcss: Don't set struct drm_driver.output_poll_changed
Date: Mon, 24 Oct 2022 13:19:37 +0200
Message-Id: <20221024111953.24307-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221024111953.24307-1-tzimmermann@suse.de>
References: <20221024111953.24307-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't set struct drm_driver.output_poll_changed. It's used to restore
the fbdev console. But as DCSS uses generic fbdev emulation, the
console is being restored by the DRM client helpers already. See the
functions drm_kms_helper_hotplug_event() and
drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.

v2:
	* fix commit description (Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index b4f82ebca5325..1defd6a40f11d 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -21,7 +21,6 @@ DEFINE_DRM_GEM_DMA_FOPS(dcss_cma_fops);
 
 static const struct drm_mode_config_funcs dcss_drm_mode_config_funcs = {
 	.fb_create = drm_gem_fb_create,
-	.output_poll_changed = drm_fb_helper_output_poll_changed,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
-- 
2.38.0


