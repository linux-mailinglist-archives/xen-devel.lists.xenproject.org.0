Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1551605CF6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 12:38:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426422.674842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olSw6-0005V3-6E; Thu, 20 Oct 2022 10:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426422.674842; Thu, 20 Oct 2022 10:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olSw5-0005NY-Tt; Thu, 20 Oct 2022 10:38:01 +0000
Received: by outflank-mailman (input) for mailman id 426422;
 Thu, 20 Oct 2022 10:37:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vz6S=2V=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1olSw3-0005Jc-Gy
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 10:37:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43884e75-5063-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 12:37:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B59D22B3D;
 Thu, 20 Oct 2022 10:37:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BBDBF13AF5;
 Thu, 20 Oct 2022 10:37:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EG0KLQUlUWPPYwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Oct 2022 10:37:57 +0000
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
X-Inumbo-ID: 43884e75-5063-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1666262278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmVfBkgQXeOJOs+lPsJuCl8bEsl7tdAgDeD2faGswnM=;
	b=xXdmWqIQfh0f0yJA3s0BPIeYEr3NNBygmE7VRKPJkQsM/g6E2+cV3BtvIsSHfPV/Zm2qX7
	r2clL0Fv/uWooja8TMsFYgvZciJRT0hTccsFr8g1QaD0IUJqiBlD+GdmvD0oilhw5kenke
	6XqrCQkfvOQ9SsLQR9c+XaGqOPwxmz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1666262278;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmVfBkgQXeOJOs+lPsJuCl8bEsl7tdAgDeD2faGswnM=;
	b=4eKuWLJB4biZqfRWi8B+SJis28AqEs4YJSoTa7xFnBHPlmt1qY0h5xZ7aBvq6htSbFrV3z
	FgVjttMfW3hPpXAA==
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
Subject: [PATCH 02/21] drm/imx: Don't set struct drm_driver.lastclose
Date: Thu, 20 Oct 2022 12:37:36 +0200
Message-Id: <20221020103755.24058-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221020103755.24058-1-tzimmermann@suse.de>
References: <20221020103755.24058-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't set struct drm_driver.lastclose. It's used to restore the
fbdev console. But as imx uses generic fbdev emulation, the
console is being restored by the DRM client helpers already. See
the call to drm_client_dev_restore() in drm_lastclose().

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


