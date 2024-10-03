Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446A698F2FF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 17:45:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809597.1222011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swO15-0003Mh-0v; Thu, 03 Oct 2024 15:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809597.1222011; Thu, 03 Oct 2024 15:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swO14-0003K7-UI; Thu, 03 Oct 2024 15:45:22 +0000
Received: by outflank-mailman (input) for mailman id 809597;
 Thu, 03 Oct 2024 15:45:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=187q=Q7=bootlin.com=louis.chauvet@srs-se1.protection.inumbo.net>)
 id 1swO12-0003Jz-6p
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 15:45:21 +0000
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [2001:4b98:dc4:8::224])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c38e32d-819e-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 17:45:18 +0200 (CEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E6A6E0002;
 Thu,  3 Oct 2024 15:45:12 +0000 (UTC)
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
X-Inumbo-ID: 7c38e32d-819e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727970315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KEG391uPbET+smFrjuUd3Gbf+SfD/X5R0PGVdaNVyDQ=;
	b=TICrwrFPqNQr0FkllJojskNhDNyxJBBjJ7p1KfIigSpe1yz5eAAGd2ZrO2BidvC6/A+Qom
	NZAd/9RJSz1RiDd3lLdtADp5nqX9bQyWNoBMaYmxSJhOSDe0T0fZ3BzR0Se1uCIXgHLatP
	0EnPqF616SrgdCpZaDlShmBrP13ZbIXW9Bj7Oi5IuZvb8HSqOh6m1SReSPJmtquU99Yk9c
	wA7Vpopy8iwsQYMzzsZgtNT4idP5iRQdLFv3pdXkbJyEmdQQR3dqplUNNyYzH1sATd/MpW
	BCY3lPJp+f+t7R9s2mNyuYyLKxVcwMtVAupvHPO8B9IX4HLM2IwIi9MsvKSHrQ==
Date: Thu, 3 Oct 2024 17:45:10 +0200
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
Message-ID: <Zv68Bj8UTNvRSmFj@louis-chauvet-laptop>
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
 <Zv6zN7Go_XG44P2-@louis-chauvet-laptop>
 <Zv64RktMPv2rpCZf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zv64RktMPv2rpCZf@intel.com>
X-GND-Sasl: louis.chauvet@bootlin.com

Le 03/10/24 - 18:29, Ville Syrjälä a écrit :
> On Thu, Oct 03, 2024 at 05:07:35PM +0200, Louis Chauvet wrote:
> > 
> > > > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > > index a40295c18b48..780681ea77e4 100644
> > > > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > > @@ -64,7 +64,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
> > > > >  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> > > > >  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> > > > >  
> > > > > -	drm_calc_timestamping_constants(crtc, &crtc->mode);
> > > > > +	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);
> > > > 
> > > > 	drm_calc_timestamping_constants(crtc, &crtc->state->mode);
> > > 
> > > This one doesn't look safe. You want to call that during your atomic
> > > commit already.
> > > 
> > 
> > This was already not safe with the previous implementation? Or it is only 
> > unsafe because now I use state->mode instead of legacy.mode?
> 
> Yeah, if you want to look at obj->state then you need the corresponding
> lock.
> 
> obj->state is also not necessarily the correct state you want because
> a parallel commit could have already swapped in a new state but the
> hardware is still on the old state.
> 
> Basically 99.9% of code should never even look at obj->state, and
> instead should always use the for_each_new_<obj>_in_state()
> and drm_atomic_get_new_<obj>_state() stuff. Currently that is a
> pipe dream though because a lot of drivers haven't been fixed to
> do things properly. If we ever manage to fix everything then we
> could remove the stall hacks from drm_atomic_helper_swap_state()
> and allow a commit pipeline of arbitrary length.
>
> > 
> > After inspecting the code, I think I don't need to call it as:
> > 
> > In `vkms_atomic_commit_tail` (used in 
> > `@vkms_mode_config_helpers.atomic_commit_tail`), we call 
> > `drm_atomic_helper_commit_modeset_disables`, which call 
> > `drm_atomic_helper_calc_timestamping_constants` which call 
> > `drm_calc_timestamping_constants` for every CRTC.
> 
> Slightly odd place for it, but I think that's just because it was
> originally part of drm_atomic_helper_update_legacy_modeset_state()
> and I didn't bother looking for a better home for it when I split
> it out. But seems like it should work fine as is.

I just send a patch for this! Thanks for your help!

[1]:https://lore.kernel.org/all/20241003-remove-legacy-v1-1-0b7db1f1a1a6@bootlin.com/
 
> > 
> > I tested kms_vblank, all of them are SUCCESS/SKIP, do you know other tests 
> > that can trigger bugs?
> 
> You would explicitly have to race commits against vblank_enable.
> Could of course sprinkle sleep()s around to widen the race window
> if you're really keen to hit it.
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

