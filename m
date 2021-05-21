Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC4B38C2CC
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 11:11:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131209.245352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk1Ai-00063n-Vi; Fri, 21 May 2021 09:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131209.245352; Fri, 21 May 2021 09:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk1Ai-00060o-S7; Fri, 21 May 2021 09:10:20 +0000
Received: by outflank-mailman (input) for mailman id 131209;
 Fri, 21 May 2021 09:10:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GxT2=KQ=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1lk1Ag-00060g-HI
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 09:10:18 +0000
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f1b1392-567d-4988-892b-7164b613c034;
 Fri, 21 May 2021 09:10:16 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so6976584wmk.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 May 2021 02:10:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y2sm13589457wmq.45.2021.05.21.02.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 02:10:14 -0700 (PDT)
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
X-Inumbo-ID: 2f1b1392-567d-4988-892b-7164b613c034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1cn49LnC9MKqFexYQ7Z0jLWqvfPvwRgzNVyBE6xCMzo=;
        b=is09Q9qxPVyW0NgJaiKqPOqAgDwUvOEAav7i+ZL2/Ccp4gvX0OeKSQfBkc348utKqf
         cC2qOlnY1+LC6R0B9IR0gNU/DFLJLLH4+dwh9lrZyfQQJQotuzewpZvfyI8GYOI7PGhl
         czy0z5y5GEqCFxZ4qScRCiwGNYe2HLNIwMtdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1cn49LnC9MKqFexYQ7Z0jLWqvfPvwRgzNVyBE6xCMzo=;
        b=pzdBTndyMo+cd7EvuIvBW2gXvg2T+HkiF23N7qAaV9DIXk3gxDg22G0Re7XFzoWzDB
         BukpfIcAo2b3xPnAjwtRanQnt6RtwrQo9AimXEIlNKPHFsp6RzNQEAGNP8d+/5itFvcC
         QZSdwFRyrwI0eUdFrNc5lKLOKFSuf2xHeAzDuv7t6qsqcCP/wRZpwbZV2lhPwRojlzOD
         3S/fISiLboQcxohuqfaSvbk0eFhw0iUBvHP+mVWGt51ZqoZ8PZwg+G+6GwWicC8FDYv3
         YrKYjIJMIjNOao3FwgkS6h2b+uncGYMNcrtMrypCaFVLX2PWT3ncbRauLdqh9TIIYQNx
         Qt/Q==
X-Gm-Message-State: AOAM533PFRTROvJnmrlPFCBwHPB+jQUerUysLn1Ia48IU/4d39LBPjJN
	0aPJQNQ8XPBRyxrEaEse+mXl/A==
X-Google-Smtp-Source: ABdhPJyT+6ranHRVQTb55siylh+EXYDlHb4SOwMXRTurfI70FKwfrCVWQUisCBlN9GVJKBZtwLJJ0A==
X-Received: by 2002:a05:600c:3510:: with SMTP id h16mr7502448wmq.38.1621588215236;
        Fri, 21 May 2021 02:10:15 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Daniel Vetter <daniel.vetter@intel.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emma Anholt <emma@anholt.net>,
	David Lechner <david@lechnology.com>,
	Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 11/11] drm/tiny: drm_gem_simple_display_pipe_prepare_fb is the default
Date: Fri, 21 May 2021 11:09:59 +0200
Message-Id: <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Goes through all the drivers and deletes the default hook since it's
the default now.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: "Noralf Trønnes" <noralf@tronnes.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Emma Anholt <emma@anholt.net>
Cc: David Lechner <david@lechnology.com>
Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: xen-devel@lists.xenproject.org
---
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 1 -
 drivers/gpu/drm/gud/gud_drv.c            | 1 -
 drivers/gpu/drm/mcde/mcde_display.c      | 1 -
 drivers/gpu/drm/pl111/pl111_display.c    | 1 -
 drivers/gpu/drm/tiny/hx8357d.c           | 1 -
 drivers/gpu/drm/tiny/ili9225.c           | 1 -
 drivers/gpu/drm/tiny/ili9341.c           | 1 -
 drivers/gpu/drm/tiny/ili9486.c           | 1 -
 drivers/gpu/drm/tiny/mi0283qt.c          | 1 -
 drivers/gpu/drm/tiny/repaper.c           | 1 -
 drivers/gpu/drm/tiny/st7586.c            | 1 -
 drivers/gpu/drm/tiny/st7735r.c           | 1 -
 drivers/gpu/drm/tve200/tve200_display.c  | 1 -
 drivers/gpu/drm/xen/xen_drm_front_kms.c  | 1 -
 14 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index 098f96d4d50d..827e62c1daba 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -220,7 +220,6 @@ static const struct drm_simple_display_pipe_funcs aspeed_gfx_funcs = {
 	.enable		= aspeed_gfx_pipe_enable,
 	.disable	= aspeed_gfx_pipe_disable,
 	.update		= aspeed_gfx_pipe_update,
-	.prepare_fb	= drm_gem_simple_display_pipe_prepare_fb,
 	.enable_vblank	= aspeed_gfx_enable_vblank,
 	.disable_vblank	= aspeed_gfx_disable_vblank,
 };
diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index e8b672dc9832..1925df9c0fb7 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -364,7 +364,6 @@ static void gud_debugfs_init(struct drm_minor *minor)
 static const struct drm_simple_display_pipe_funcs gud_pipe_funcs = {
 	.check      = gud_pipe_check,
 	.update	    = gud_pipe_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_mode_config_funcs gud_mode_config_funcs = {
diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 4ddc55d58f38..ce12a36e2db4 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -1479,7 +1479,6 @@ static struct drm_simple_display_pipe_funcs mcde_display_funcs = {
 	.update = mcde_display_update,
 	.enable_vblank = mcde_display_enable_vblank,
 	.disable_vblank = mcde_display_disable_vblank,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 int mcde_display_init(struct drm_device *drm)
diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 6fd7f13f1aca..b5a8859739a2 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -440,7 +440,6 @@ static struct drm_simple_display_pipe_funcs pl111_display_funcs = {
 	.enable = pl111_display_enable,
 	.disable = pl111_display_disable,
 	.update = pl111_display_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index da5df93450de..9b33c05732aa 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -184,7 +184,6 @@ static const struct drm_simple_display_pipe_funcs hx8357d_pipe_funcs = {
 	.enable = yx240qv29_enable,
 	.disable = mipi_dbi_pipe_disable,
 	.update = mipi_dbi_pipe_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_display_mode yx350hv15_mode = {
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 69265d8a3beb..976d3209f164 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -328,7 +328,6 @@ static const struct drm_simple_display_pipe_funcs ili9225_pipe_funcs = {
 	.enable		= ili9225_pipe_enable,
 	.disable	= ili9225_pipe_disable,
 	.update		= ili9225_pipe_update,
-	.prepare_fb	= drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_display_mode ili9225_mode = {
diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
index ad9ce7b4f76f..37e0c33399c8 100644
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ b/drivers/gpu/drm/tiny/ili9341.c
@@ -140,7 +140,6 @@ static const struct drm_simple_display_pipe_funcs ili9341_pipe_funcs = {
 	.enable = yx240qv29_enable,
 	.disable = mipi_dbi_pipe_disable,
 	.update = mipi_dbi_pipe_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_display_mode yx240qv29_mode = {
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 75aa1476c66c..e9a63f4b2993 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -153,7 +153,6 @@ static const struct drm_simple_display_pipe_funcs waveshare_pipe_funcs = {
 	.enable = waveshare_enable,
 	.disable = mipi_dbi_pipe_disable,
 	.update = mipi_dbi_pipe_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_display_mode waveshare_mode = {
diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index 82fd1ad3413f..023de49e7a8e 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -144,7 +144,6 @@ static const struct drm_simple_display_pipe_funcs mi0283qt_pipe_funcs = {
 	.enable = mi0283qt_enable,
 	.disable = mipi_dbi_pipe_disable,
 	.update = mipi_dbi_pipe_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_display_mode mi0283qt_mode = {
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 2cee07a2e00b..007d9d59f01c 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -861,7 +861,6 @@ static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
 	.enable = repaper_pipe_enable,
 	.disable = repaper_pipe_disable,
 	.update = repaper_pipe_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static int repaper_connector_get_modes(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 05db980cc047..1be55bed609a 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -268,7 +268,6 @@ static const struct drm_simple_display_pipe_funcs st7586_pipe_funcs = {
 	.enable		= st7586_pipe_enable,
 	.disable	= st7586_pipe_disable,
 	.update		= st7586_pipe_update,
-	.prepare_fb	= drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_display_mode st7586_mode = {
diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index ec9dc817a2cc..122320db5d38 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -136,7 +136,6 @@ static const struct drm_simple_display_pipe_funcs st7735r_pipe_funcs = {
 	.enable		= st7735r_pipe_enable,
 	.disable	= mipi_dbi_pipe_disable,
 	.update		= mipi_dbi_pipe_update,
-	.prepare_fb	= drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct st7735r_cfg jd_t18003_t01_cfg = {
diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
index 50e1fb71869f..17b8c8dd169d 100644
--- a/drivers/gpu/drm/tve200/tve200_display.c
+++ b/drivers/gpu/drm/tve200/tve200_display.c
@@ -316,7 +316,6 @@ static const struct drm_simple_display_pipe_funcs tve200_display_funcs = {
 	.enable = tve200_display_enable,
 	.disable = tve200_display_disable,
 	.update = tve200_display_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 	.enable_vblank = tve200_display_enable_vblank,
 	.disable_vblank = tve200_display_disable_vblank,
 };
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index 371202ebe900..cfda74490765 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -302,7 +302,6 @@ static const struct drm_simple_display_pipe_funcs display_funcs = {
 	.mode_valid = display_mode_valid,
 	.enable = display_enable,
 	.disable = display_disable,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 	.check = display_check,
 	.update = display_update,
 };
-- 
2.31.0


