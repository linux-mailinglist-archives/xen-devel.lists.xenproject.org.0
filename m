Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9AD6182A6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 16:25:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436747.691008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqc6D-0000oc-Oz; Thu, 03 Nov 2022 15:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436747.691008; Thu, 03 Nov 2022 15:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqc6D-0000kt-Ha; Thu, 03 Nov 2022 15:25:45 +0000
Received: by outflank-mailman (input) for mailman id 436747;
 Thu, 03 Nov 2022 15:25:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yy4e=3D=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1oqbvu-0001nI-2M
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 15:15:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48a8c2d0-5b8a-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 16:15:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 426EA1F900;
 Thu,  3 Nov 2022 15:15:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B325D13AAF;
 Thu,  3 Nov 2022 15:15:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8LVrKvXaY2PBGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Nov 2022 15:15:01 +0000
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
X-Inumbo-ID: 48a8c2d0-5b8a-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1667488502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HgxG97nmydzNCVipkHzgPf3aCI1grjy0cqRB+0/Ck74=;
	b=kcgtu9PKiyMKUj8GxwYh+/ORcWz7+UhaRslLpGT/0EYXH4EiaVWbRO1rXX+RnuBF5OjTj2
	Xec3+JBI90xwvAliyOtjTY3B94F0kq3muNjviJe52VZzz9N0Nd9Yc6Mfuv+xD0GBg/lfBm
	F9ORYgDvXcxRapg5A3YBRJRoUxxeEtI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1667488502;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HgxG97nmydzNCVipkHzgPf3aCI1grjy0cqRB+0/Ck74=;
	b=BTICG+mmiOcUdGuFYoU4C0nyEBYhfhmngf4Ev9loTA8Jed/wbNJaxvDDbye+EQL4FS5m+K
	t/wO99a1pUjQkKCQ==
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	javierm@redhat.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: "linux-hyperv@vger.kernel.orglinux-hyperv"@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, freedreno@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 23/23] drm/fb-helper: Clarify use of last_close and output_poll_changed
Date: Thu,  3 Nov 2022 16:14:46 +0100
Message-Id: <20221103151446.2638-24-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221103151446.2638-1-tzimmermann@suse.de>
References: <20221103151446.2638-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clarify documentation in the use of struct drm_driver.last_close and
struct drm_mode_config_funcs.output_poll_changed. Those callbacks should
not be said for fbdev implementations on top of struct drm_client_funcs.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 5eb2f0d4bf8d4..e0384f967c0b3 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -89,11 +89,13 @@ static DEFINE_MUTEX(kernel_fb_helper_lock);
  * It will automatically set up deferred I/O if the driver requires a shadow
  * buffer.
  *
- * At runtime drivers should restore the fbdev console by using
+ * Existing fbdev implementations should restore the fbdev console by using
  * drm_fb_helper_lastclose() as their &drm_driver.lastclose callback.
  * They should also notify the fb helper code from updates to the output
  * configuration by using drm_fb_helper_output_poll_changed() as their
- * &drm_mode_config_funcs.output_poll_changed callback.
+ * &drm_mode_config_funcs.output_poll_changed callback. New implementations
+ * of fbdev should be build on top of struct &drm_client_funcs, which handles
+ * this automatically. Setting the old callbacks should be avoided.
  *
  * For suspend/resume consider using drm_mode_config_helper_suspend() and
  * drm_mode_config_helper_resume() which takes care of fbdev as well.
-- 
2.38.0


