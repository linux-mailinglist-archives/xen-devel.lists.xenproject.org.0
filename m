Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E45605CF3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 12:38:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426421.674832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olSw5-0005M7-Lx; Thu, 20 Oct 2022 10:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426421.674832; Thu, 20 Oct 2022 10:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olSw5-0005K2-J2; Thu, 20 Oct 2022 10:38:01 +0000
Received: by outflank-mailman (input) for mailman id 426421;
 Thu, 20 Oct 2022 10:37:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vz6S=2V=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1olSw3-0005Jb-Bn
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 10:37:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 430c44da-5063-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 12:37:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 428851F93A;
 Thu, 20 Oct 2022 10:37:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE6B013AF5;
 Thu, 20 Oct 2022 10:37:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8BWlLQQlUWPPYwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Oct 2022 10:37:56 +0000
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
X-Inumbo-ID: 430c44da-5063-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1666262277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Y7BdOtp6TFqwXPX3o6UHDb+9HmQzCsygQB8jvOJl5oY=;
	b=pexEAXjK3+YaGpJd+JADtO15n0ydGTiAR9QdozIjQlWTGCJGvjDk3GLtnTjahBibfxqKn8
	e0ZCiKKRAhP4pa+DGq9AHeQHkye84awc19SWK5FgvFa4p4jHOOLv6Ie/+7K77qgyduKGGP
	7xA6whgamY9hl61unJ7iRpO/wohJ91Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1666262277;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Y7BdOtp6TFqwXPX3o6UHDb+9HmQzCsygQB8jvOJl5oY=;
	b=CVcd7TwC6JyEu5wf89r3Wdsik/2sML9uk++MZ6TfBQTpvFyIWJxR+TOmqJlzmQsVkjVxBs
	WhUhW1hA4SnyrHBQ==
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
Subject: [PATCH 00/21] drm/fb-helper: Untangle fbdev emulation and helpers
Date: Thu, 20 Oct 2022 12:37:34 +0200
Message-Id: <20221020103755.24058-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate generic fbdev emulation from the helper code that is shared
among the various fbdev implementations within DRM. Affects many drivers.

The goal of this patchset is to improve readability and streamline the
fbdev helper code within DRM. In the long term, we want to get to a point
where drivers or memory managers can pick and combine the various helpers
for optimal fbdev support.

Patches 1 to 8 start by preparing drivers. Setting lastclose is not
required by generic fbdev emulation.

Two drivers depend on fb helpers implicitly including other Linux header
files. Fixing this in patches 9 and 10 allows to remove unnecesary include
statements from the fb-helper header in patch 11.

Do some renaming in patches 12 to 14.

There are currently various implementation of the fbdev I/O helpers
with varying feature sets. The fb helpers for fbdev I/O should all call
fb_sync, which is what fbdev's internal implementation does. For DRM,
damage handling needs to be performed after updating a framebuffer. The
damage worker is part of the fb helpers, but the actual update logic only
works with generic fbdev emulation. Separate the two, which also gives
other drivers an option so set their own damage handling if neccessary.
The full-featured I/O helpers can be moved under a shared implementation
and called by all drivers. Patches 15 to 18 resolve these issues.

Patch 19 changes fbdev disablement to work at the level of display
detection. If disabled, generic fbdev emulation will be initialized,
but no display will be detected. It can later be enabled by changing
the parameter in sysfs and plugging in a connector.

Patches 20 and 21 move the generic fbdev emulation into their own source
and header files and clean up the include statements throughout DRM.
Many drivers only call drm_fbdev_generic_setup() and can avoid including
other Linux header files.

Built on x86-64, aarch64, arm, ppc64le. Tested with various combinations
of bochs, radeon, simpledrm.

Thomas Zimmermann (21):
  drm/amdgpu: Don't set struct drm_driver.lastclose
  drm/imx: Don't set struct drm_driver.lastclose
  drm/ingenic: Don't set struct drm_driver.lastclose
  drm/komeda: Don't set struct drm_driver.lastclose
  drm/logicvc: Don't set struct drm_driver.lastclose
  drm/mcde: Don't set struct drm_driver.lastclose
  drm/rockchip: Don't set struct drm_driver.lastclose
  drm/vboxvideo: Don't set struct drm_driver.lastclose
  drm/panel-ili9341: Include <linux/backlight.h>
  drm/tve200: Include <linux/of.h>
  drm/fb-helper: Cleanup include statements in header file
  drm/fb_helper: Rename field fbdev to info in struct drm_fb_helper
  drm/fb-helper: Rename drm_fb_helper_alloc_fbi() to use _info postfix
  drm/fb-helper: Rename drm_fb_helper_unregister_fbi() to use _info
    postfix
  drm/fb-helper: Disconnect damage worker from update logic
  drm/fb-helper: Call fb_sync in I/O functions
  drm/fb-helper: Perform all fbdev I/O with the same implementation
  drm/fb_helper: Minimize damage-helper overhead
  drm/fb-helper: Always initialize generic fbdev emulation
  drm/fb-helper: Move generic fbdev emulation into separate source file
  drm/fb-helper: Remove unnecessary include statements

 drivers/gpu/drm/Makefile                      |    2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |    1 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    2 -
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |    2 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |    2 -
 drivers/gpu/drm/arm/hdlcd_crtc.c              |    1 -
 drivers/gpu/drm/arm/hdlcd_drv.c               |    2 +-
 drivers/gpu/drm/arm/malidp_drv.c              |    2 +-
 drivers/gpu/drm/armada/armada_fbdev.c         |    6 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |    2 +-
 drivers/gpu/drm/ast/ast_drv.c                 |    1 +
 drivers/gpu/drm/ast/ast_drv.h                 |    1 -
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |    2 +-
 drivers/gpu/drm/bridge/tc358762.c             |    2 +-
 drivers/gpu/drm/drm_crtc_helper.c             |    1 -
 drivers/gpu/drm/drm_fb_helper.c               | 1081 ++++++-----------
 drivers/gpu/drm/drm_fbdev.c                   |  512 ++++++++
 drivers/gpu/drm/drm_gem_framebuffer_helper.c  |    1 -
 drivers/gpu/drm/drm_probe_helper.c            |    1 -
 drivers/gpu/drm/etnaviv/etnaviv_drv.h         |    3 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |    6 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |    2 +-
 drivers/gpu/drm/gma500/framebuffer.c          |    6 +-
 drivers/gpu/drm/gud/gud_drv.c                 |    2 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |    1 +
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |    1 -
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |    2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |    2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |    1 -
 drivers/gpu/drm/i915/display/intel_fbdev.c    |    8 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |    3 +-
 drivers/gpu/drm/imx/imx-drm-core.c            |    2 +-
 drivers/gpu/drm/imx/imx-ldb.c                 |    2 +-
 drivers/gpu/drm/imx/imx-tve.c                 |    1 -
 drivers/gpu/drm/imx/parallel-display.c        |    2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |    3 +-
 drivers/gpu/drm/kmb/kmb_drv.c                 |    2 +-
 drivers/gpu/drm/kmb/kmb_plane.c               |    1 -
 drivers/gpu/drm/logicvc/logicvc_drm.c         |    2 +-
 drivers/gpu/drm/logicvc/logicvc_mode.c        |    2 -
 drivers/gpu/drm/mcde/mcde_drv.c               |    3 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    2 +-
 drivers/gpu/drm/meson/meson_drv.c             |    2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         |    1 +
 drivers/gpu/drm/mgag200/mgag200_drv.h         |    1 -
 drivers/gpu/drm/msm/msm_fbdev.c               |    4 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c             |    2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |    2 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c       |   27 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c          |    6 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c  |    3 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |    2 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |    1 +
 drivers/gpu/drm/qxl/qxl_drv.h                 |    1 -
 drivers/gpu/drm/radeon/radeon_fb.c            |    6 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |    2 -
 drivers/gpu/drm/solomon/ssd130x.c             |    2 +-
 drivers/gpu/drm/sti/sti_drv.c                 |    2 +-
 drivers/gpu/drm/stm/drv.c                     |    2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |    2 +-
 drivers/gpu/drm/tegra/fb.c                    |    8 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |    2 +-
 drivers/gpu/drm/tidss/tidss_kms.c             |    1 -
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |    2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |    2 +-
 drivers/gpu/drm/tiny/bochs.c                  |    2 +-
 drivers/gpu/drm/tiny/cirrus.c                 |    2 +-
 drivers/gpu/drm/tiny/gm12u320.c               |    2 +-
 drivers/gpu/drm/tiny/hx8357d.c                |    2 +-
 drivers/gpu/drm/tiny/ili9163.c                |    2 +-
 drivers/gpu/drm/tiny/ili9225.c                |    2 +-
 drivers/gpu/drm/tiny/ili9341.c                |    2 +-
 drivers/gpu/drm/tiny/ili9486.c                |    2 +-
 drivers/gpu/drm/tiny/mi0283qt.c               |    2 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |    2 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c         |    2 +-
 drivers/gpu/drm/tiny/repaper.c                |    2 +-
 drivers/gpu/drm/tiny/simpledrm.c              |    2 +-
 drivers/gpu/drm/tiny/st7586.c                 |    2 +-
 drivers/gpu/drm/tiny/st7735r.c                |    2 +-
 drivers/gpu/drm/tve200/tve200_drv.c           |    3 +-
 drivers/gpu/drm/udl/udl_drv.c                 |    2 +-
 drivers/gpu/drm/v3d/v3d_drv.c                 |    1 -
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |    4 +-
 drivers/gpu/drm/vboxvideo/vbox_main.c         |    1 -
 drivers/gpu/drm/vc4/vc4_drv.c                 |    2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |    1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h          |    1 -
 drivers/gpu/drm/vkms/vkms_drv.c               |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c            |    3 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c       |    1 -
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |    2 +-
 include/drm/drm_fb_helper.h                   |   59 +-
 include/drm/drm_fbdev.h                       |   15 +
 99 files changed, 1019 insertions(+), 883 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_fbdev.c
 create mode 100644 include/drm/drm_fbdev.h


base-commit: 8c797a984264f04708d2099e83c85978a0fede89
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
-- 
2.38.0


