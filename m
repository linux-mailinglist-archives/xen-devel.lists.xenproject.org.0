Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D34698F226
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 17:08:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809563.1221960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swNQh-0002MP-8z; Thu, 03 Oct 2024 15:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809563.1221960; Thu, 03 Oct 2024 15:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swNQh-0002Jn-6S; Thu, 03 Oct 2024 15:07:47 +0000
Received: by outflank-mailman (input) for mailman id 809563;
 Thu, 03 Oct 2024 15:07:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=187q=Q7=bootlin.com=louis.chauvet@srs-se1.protection.inumbo.net>)
 id 1swNQe-0002Jh-Pf
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 15:07:45 +0000
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cddfbcb-8199-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 17:07:42 +0200 (CEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11E6024000C;
 Thu,  3 Oct 2024 15:07:36 +0000 (UTC)
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
X-Inumbo-ID: 3cddfbcb-8199-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727968061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YZElLwQ5mHYReOaSmSvT7278JqqhnnyULQk+/1+1kJk=;
	b=YEH2YnPwiMskls9hd/gfzbIgYfC1qkcLesGnJNkrsmHEe3zu8VFZWm6BdgmnrnZ2Qgf6Mu
	rl3svRb/4mCMycfcmpARRBvji7+Ry/w2vzIC3T393ERmy9UbpVYnNhM87rfFxR4CxUfMDQ
	ksrKmVA99rcw5b1jA2ZNxjOLpTc24XkDfONA9tFeR45nmPl6UkQuJxTG6VYt19wt2k0OWd
	ly5GPToqHmZiL+uWVlGQozyWeIO9rxeLv5puwAjVLmo/Jys8TaMxMe0xWkBxg30yo2dr0e
	+qHYoE0Ir3I/BslTW53FebEDYX6GCccBs1oOkCfEqWwDeCFPtxDgi2SkeFavmA==
Date: Thu, 3 Oct 2024 17:07:35 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
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
Message-ID: <Zv6zN7Go_XG44P2-@louis-chauvet-laptop>
Mail-Followup-To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
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
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
 <20241002182200.15363-3-ville.syrjala@linux.intel.com>
 <Zv6QF2EmIcogtlLA@louis-chauvet-laptop>
 <Zv6gSGMXZZARf3oV@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv6gSGMXZZARf3oV@intel.com>
X-GND-Sasl: louis.chauvet@bootlin.com


> > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > index a40295c18b48..780681ea77e4 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > @@ -64,7 +64,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
> > >  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> > >  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> > >  
> > > -	drm_calc_timestamping_constants(crtc, &crtc->mode);
> > > +	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);
> > 
> > 	drm_calc_timestamping_constants(crtc, &crtc->state->mode);
> 
> This one doesn't look safe. You want to call that during your atomic
> commit already.
> 

This was already not safe with the previous implementation? Or it is only 
unsafe because now I use state->mode instead of legacy.mode?

After inspecting the code, I think I don't need to call it as:

In `vkms_atomic_commit_tail` (used in 
`@vkms_mode_config_helpers.atomic_commit_tail`), we call 
`drm_atomic_helper_commit_modeset_disables`, which call 
`drm_atomic_helper_calc_timestamping_constants` which call 
`drm_calc_timestamping_constants` for every CRTC.

I tested kms_vblank, all of them are SUCCESS/SKIP, do you know other tests 
that can trigger bugs?

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

