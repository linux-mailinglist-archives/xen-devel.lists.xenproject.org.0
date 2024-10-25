Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5C89AFB5F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 09:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825663.1239942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4F1t-0003Te-Co; Fri, 25 Oct 2024 07:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825663.1239942; Fri, 25 Oct 2024 07:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4F1t-0003Rc-A1; Fri, 25 Oct 2024 07:46:41 +0000
Received: by outflank-mailman (input) for mailman id 825663;
 Fri, 25 Oct 2024 07:46:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=woHg=RV=linux.intel.com=ville.syrjala@srs-se1.protection.inumbo.net>)
 id 1t4F1s-0003RW-3K
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 07:46:40 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42524174-92a5-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 09:46:36 +0200 (CEST)
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 00:46:34 -0700
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 25 Oct 2024 00:46:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Oct 2024 10:46:23 +0300
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
X-Inumbo-ID: 42524174-92a5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729842397; x=1761378397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Mzm/p9vp/1SxZYyxLUIAr3dK4m/QwRpy+mAy/vi+65A=;
  b=LYivEDIEWQiqAnUHNrZ9TFEZ34ZEfufYxRzKeBkINNV0Obu+vR7m7psb
   9Mh5hVbbsuSRaU2fZLeBGSHCs6BZ01yvdwJkbzYGdNTaIyZOhlbRMCUCf
   MczcTKAocY6zMCA32VyzVA8+AAoeElp242BrYU5RK5uWIy8Jo/ojz4Jeg
   6f6SU7ViUqHkfTRbz/dcsLc1a40BmETd1Cc98BuwPwmEB9YX8W6hRJDwQ
   /CypW4u/M90IP4dxo+3f0Yw8qXnOOkz+KrGqCcSURdhF2MWp5vYxRcFOa
   oJa+2faga/ZblpeGGQfAeJfI7077dgbBOL7FZlIHTZc9VmmON2BQja+gh
   Q==;
X-CSE-ConnectionGUID: StwnbtfiT8KTl7s+Md3p2A==
X-CSE-MsgGUID: +V6MyHwFRjSkPTy+Gbejrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29446877"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29446877"
X-CSE-ConnectionGUID: 4NLKVHg9T6yFez9/u+3hfQ==
X-CSE-MsgGUID: 8E8OB6zhRpuvXvELpRP+eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80948136"
Date: Fri, 25 Oct 2024 10:46:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	amd-gfx@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	freedreno@lists.freedesktop.org,
	Hans de Goede <hdegoede@redhat.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Inki Dae <inki.dae@samsung.com>, Jyri Sarha <jyri.sarha@iki.fi>,
	Karol Herbst <kherbst@redhat.com>,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-arm-msm@vger.kernel.orga, linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Liviu Dudau <liviu.dudau@arm.com>, Lyude Paul <lyude@redhat.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	nouveau@lists.freedesktop.org, nouveau@lists.freedesktop.orga,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>,
	spice-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org, Xinhui Pan <Xinhui.Pan@amd.com>,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: Re: [PATCH 0/2] drm: Treewide plane/crtc legacy state sweeping
Message-ID: <ZxtMz8JP3DbzpMew@intel.com>
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment

On Wed, Oct 02, 2024 at 09:21:58PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> An attempt to hide the drm_plane/crtc legacy state better.
> 
> This also highlights the fact that a lot of supposedly
> atomic drivers are poking around in the legacy crtc state,
> which is rather questionable. For planes we did force the
> legacy state to NULL already to force drivers to behave.
> But even then it seems capable of confusing people with
> its high profile location directly under drm_plane.
> 
> This might end up as some kind of conflict
> galore, but the alternative would involve trying
> to wean the atomic drivers off one by one,
> which would probably take forever. At least with
> this the issue becomes visible and shouldn't be
> forgotten as easily.

Ping, anyone have thoughts on this? I'd like to get something
like this in at some point to make the legacy state (ab)users
easily visible...

> 
> The cc list was getting way out of hand, so I had
> to trim it a bit. Hopefully I didn't chop off too
> many names...
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: freedreno@lists.freedesktop.org
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.orga
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: "Maíra Canal" <mairacanal@riseup.net>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: nouveau@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.orga
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: spice-devel@lists.freedesktop.org
> Cc: virtualization@lists.linux.dev
> Cc: xen-devel@lists.xenproject.org
> Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> 
> Ville Syrjälä (2):
>   drm: Move plane->{fb,old_fb,crtc} to legacy sub-structure
>   drm: Move crtc->{x,y,mode,enabled} to legacy sub-structure
> 
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 20 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c       |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        | 35 ++++----
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        | 35 ++++----
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         | 37 ++++-----
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         | 35 ++++----
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 ++--
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  2 +-
>  drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c  |  4 +-
>  drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
>  drivers/gpu/drm/arm/malidp_hw.c               |  2 +-
>  drivers/gpu/drm/armada/armada_crtc.c          | 12 ++-
>  drivers/gpu/drm/ast/ast_dp.c                  |  8 +-
>  drivers/gpu/drm/drm_atomic.c                  |  6 +-
>  drivers/gpu/drm/drm_atomic_helper.c           |  8 +-
>  drivers/gpu/drm/drm_client_modeset.c          | 10 +--
>  drivers/gpu/drm/drm_crtc.c                    | 31 +++----
>  drivers/gpu/drm/drm_crtc_helper.c             | 80 ++++++++++---------
>  drivers/gpu/drm/drm_fb_helper.c               | 12 +--
>  drivers/gpu/drm/drm_framebuffer.c             |  4 +-
>  drivers/gpu/drm/drm_plane.c                   | 69 ++++++++--------
>  drivers/gpu/drm/drm_plane_helper.c            |  6 +-
>  drivers/gpu/drm/drm_vblank.c                  |  2 +-
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  4 +-
>  drivers/gpu/drm/gma500/cdv_intel_display.c    |  2 +-
>  drivers/gpu/drm/gma500/cdv_intel_dp.c         |  6 +-
>  drivers/gpu/drm/gma500/cdv_intel_hdmi.c       |  3 +-
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c       |  6 +-
>  drivers/gpu/drm/gma500/gma_display.c          | 22 ++---
>  drivers/gpu/drm/gma500/oaktrail_crtc.c        |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_display.c    |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_lvds.c       |  6 +-
>  drivers/gpu/drm/gma500/psb_intel_sdvo.c       |  8 +-
>  drivers/gpu/drm/i2c/ch7006_drv.c              |  7 +-
>  drivers/gpu/drm/i2c/sil164_drv.c              |  2 +-
>  .../drm/i915/display/intel_modeset_setup.c    |  4 +-
>  drivers/gpu/drm/imx/lcdc/imx-lcdc.c           | 31 ++++---
>  drivers/gpu/drm/mediatek/mtk_crtc.c           |  6 +-
>  drivers/gpu/drm/meson/meson_overlay.c         |  2 +-
>  drivers/gpu/drm/meson/meson_plane.c           |  8 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 18 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  6 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 16 ++--
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  4 +-
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c       | 25 +++---
>  drivers/gpu/drm/nouveau/dispnv04/cursor.c     |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/dfp.c        |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/disp.c       |  4 +-
>  .../gpu/drm/nouveau/dispnv04/tvmodesnv17.c    |  4 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  7 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  6 +-
>  drivers/gpu/drm/qxl/qxl_display.c             |  6 +-
>  drivers/gpu/drm/radeon/atombios_crtc.c        | 28 +++----
>  drivers/gpu/drm/radeon/cik.c                  | 12 +--
>  drivers/gpu/drm/radeon/evergreen.c            | 16 ++--
>  drivers/gpu/drm/radeon/r100.c                 | 16 ++--
>  drivers/gpu/drm/radeon/r600_cs.c              |  2 +-
>  drivers/gpu/drm/radeon/r600_dpm.c             |  4 +-
>  drivers/gpu/drm/radeon/radeon_connectors.c    |  7 +-
>  drivers/gpu/drm/radeon/radeon_cursor.c        | 29 +++----
>  drivers/gpu/drm/radeon/radeon_device.c        |  2 +-
>  drivers/gpu/drm/radeon/radeon_display.c       | 26 +++---
>  drivers/gpu/drm/radeon/radeon_drv.c           |  2 +-
>  drivers/gpu/drm/radeon/radeon_legacy_crtc.c   | 16 ++--
>  .../gpu/drm/radeon/radeon_legacy_encoders.c   |  2 +-
>  drivers/gpu/drm/radeon/radeon_pm.c            |  2 +-
>  drivers/gpu/drm/radeon/rs600.c                | 10 +--
>  drivers/gpu/drm/radeon/rs690.c                | 22 ++---
>  drivers/gpu/drm/radeon/rs780_dpm.c            |  6 +-
>  drivers/gpu/drm/radeon/rv515.c                | 30 +++----
>  drivers/gpu/drm/radeon/rv770.c                |  2 +-
>  drivers/gpu/drm/radeon/si.c                   | 14 ++--
>  .../gpu/drm/renesas/rcar-du/rcar_du_crtc.c    |  2 +-
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  6 +-
>  drivers/gpu/drm/sti/sti_crtc.c                |  4 +-
>  drivers/gpu/drm/sti/sti_cursor.c              |  2 +-
>  drivers/gpu/drm/sti/sti_gdp.c                 |  2 +-
>  drivers/gpu/drm/sti/sti_hqvdp.c               |  2 +-
>  drivers/gpu/drm/sti/sti_tvout.c               |  6 +-
>  drivers/gpu/drm/sti/sti_vid.c                 |  2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c          | 10 +--
>  drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c         |  2 +-
>  drivers/gpu/drm/vc4/vc4_dpi.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_plane.c               |  4 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c      |  4 +-
>  drivers/gpu/drm/vkms/vkms_composer.c          |  4 +-
>  drivers/gpu/drm/vkms/vkms_crtc.c              |  2 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c         |  4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  8 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           | 18 +++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  9 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |  4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c          |  2 +-
>  drivers/gpu/drm/xen/xen_drm_front_kms.c       |  2 +-
>  include/drm/drm_crtc.h                        | 75 ++++++++---------
>  include/drm/drm_plane.h                       | 52 ++++++------
>  100 files changed, 599 insertions(+), 547 deletions(-)
> 
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel

