Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F5498F0C4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 15:47:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809476.1221817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMAa-0004Vc-A0; Thu, 03 Oct 2024 13:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809476.1221817; Thu, 03 Oct 2024 13:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMAa-0004T6-6e; Thu, 03 Oct 2024 13:47:04 +0000
Received: by outflank-mailman (input) for mailman id 809476;
 Thu, 03 Oct 2024 13:47:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJdh=Q7=linux.intel.com=ville.syrjala@srs-se1.protection.inumbo.net>)
 id 1swMAY-0004T0-81
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 13:47:02 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4eaf7a9-818d-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 15:46:58 +0200 (CEST)
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 06:46:56 -0700
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 06:46:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 16:46:48 +0300
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
X-Inumbo-ID: f4eaf7a9-818d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727963219; x=1759499219;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=n5OHn3QUdpat2aC/O/iKVjfoE6iGTaPoN/6J8frtUYg=;
  b=ffpmsEQjwQw748bDEeZZlwtPl5gVhoPsjlRbU5biIJsRMDeV5hdHVDML
   /q5JLgCQI2OOJZC+099BMkvMYHuyXZh6Xr33Z2qHLP9EhTOI5fJaJYO9M
   /LkGXSqVV3c+71gjX1Hs1MkCXJgSxw9DG2Fwvy8rplPUdTvkgCc43gUUW
   cgUlVY5MOXsIIyyOSWHojwmpt8ZKpCWQ/2RN0ZozoIN8LgxAd7JJtxVLd
   xpxf+kxkEr2NRv3jVxe07n8bU/VGnclzDTKivG5AyuGXV6gnztHLGyDnH
   DwvtL1fZoaY0rRyJ/OR5oM3iSednu0m0z3b0OsgAsobEbaoUgPsAKmrpG
   Q==;
X-CSE-ConnectionGUID: JrKGJOgJRI6gnX4T/8WBkg==
X-CSE-MsgGUID: 4EyBjoDUS0K6mYvn7j0Fbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27286667"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27286667"
X-CSE-ConnectionGUID: H7+f/vSCTa27grfFf3KfqQ==
X-CSE-MsgGUID: dSiUo7Y0SbyaiImM3Q2NMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74451391"
Date: Thu, 3 Oct 2024 16:46:48 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Inki Dae <inki.dae@samsung.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Sandy Huang <hjc@rock-chips.com>, Jyri Sarha <jyri.sarha@iki.fi>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Zack Rusin <zack.rusin@broadcom.com>, amd-gfx@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drm: Move crtc->{x, y, mode, enabled} to legacy
 sub-structure
Message-ID: <Zv6gSGMXZZARf3oV@intel.com>
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
 <20241002182200.15363-3-ville.syrjala@linux.intel.com>
 <Zv6QF2EmIcogtlLA@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zv6QF2EmIcogtlLA@louis-chauvet-laptop>
X-Patchwork-Hint: comment

On Thu, Oct 03, 2024 at 02:38:35PM +0200, Louis Chauvet wrote:
> Le 02/10/24 - 21:22, Ville Syrjala a écrit :
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Atomic drivers shouldn't be using the legacy state stored
> > directly under drm_crtc. Move that junk into a 'legacy' sub
> > structure to highlight the offenders, of which there are
> > quite a few unfortunately.
> 
> Hi,
> 
> Do we need to do something particular in an atomic driver except using
> state content?
> 
> I proposed some modifications for VKMS bellow. If you think this is good,
> I can send a patch to avoid being an offender :-) I just tested it, and it
> seems to work.
> 
> > I'm hoping we could get all these fixed and then declare
> > the legacy state off limits for atomic drivers (which is
> > what did long ago for plane->fb/etc). And maybe eventually
> > turn crtc->legacy into a pointer and only allocate it on
> > legacy drivers.
> > 
> > TODO: hwmode should probably go there too but it probably
> >       needs a closer look, maybe other stuff too...
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > index 57a5769fc994..a7f8b1da6e85 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -187,7 +187,7 @@ static void blend(struct vkms_writeback_job *wb,
> >  
> >  	const struct pixel_argb_u16 background_color = { .a = 0xffff };
> >  
> > -	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
> > +	size_t crtc_y_limit = crtc_state->base.crtc->legacy.mode.vdisplay;
> 
> 	size_t crtc_y_limit = crtc_state->base.mode.vdisplay;
> 
> >  	/*
> >  	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
> > @@ -270,7 +270,7 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
> >  	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
> >  		return -EINVAL;
> >  
> > -	line_width = crtc_state->base.crtc->mode.hdisplay;
> > +	line_width = crtc_state->base.crtc->legacy.mode.hdisplay;
> 
> 	line_width = crtc_state->base.mode.hdisplay;
> 
> >  	stage_buffer.n_pixels = line_width;
> >  	output_buffer.n_pixels = line_width;
> >  
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > index a40295c18b48..780681ea77e4 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -64,7 +64,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
> >  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> >  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> >  
> > -	drm_calc_timestamping_constants(crtc, &crtc->mode);
> > +	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);
> 
> 	drm_calc_timestamping_constants(crtc, &crtc->state->mode);

This one doesn't look safe. You want to call that during your atomic
commit already.

The rest look reasonable.

> 
> >  	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> >  	out->vblank_hrtimer.function = &vkms_vblank_simulate;
> > diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> > index bc724cbd5e3a..27164cddb94d 100644
> > --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> > +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> > @@ -131,8 +131,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
> >  	struct drm_connector_state *conn_state = wb_conn->base.state;
> >  	struct vkms_crtc_state *crtc_state = output->composer_state;
> >  	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
> > -	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
> > -	u16 crtc_width = crtc_state->base.crtc->mode.hdisplay;
> > +	u16 crtc_height = crtc_state->base.crtc->legacy.mode.vdisplay;
> > +	u16 crtc_width = crtc_state->base.crtc->legacy.mode.hdisplay;
> 
> 	u16 crtc_height = crtc_state->base.mode.vdisplay;
> 	u16 crtc_width = crtc_state->base.mode.hdisplay;
> 
> >  	struct vkms_writeback_job *active_wb;
> >  	struct vkms_frame_info *wb_frame_info;
> >  	u32 wb_format = fb->format->format;
> 
> [...]
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Ville Syrjälä
Intel

