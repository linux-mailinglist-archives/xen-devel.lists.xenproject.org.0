Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0A398F298
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 17:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809579.1221981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swNlc-0007L8-Am; Thu, 03 Oct 2024 15:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809579.1221981; Thu, 03 Oct 2024 15:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swNlc-0007J0-7I; Thu, 03 Oct 2024 15:29:24 +0000
Received: by outflank-mailman (input) for mailman id 809579;
 Thu, 03 Oct 2024 15:29:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJdh=Q7=linux.intel.com=ville.syrjala@srs-se1.protection.inumbo.net>)
 id 1swNla-0006wh-Hr
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 15:29:22 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41b97736-819c-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 17:29:20 +0200 (CEST)
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 08:29:18 -0700
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 08:29:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 18:29:10 +0300
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
X-Inumbo-ID: 41b97736-819c-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727969361; x=1759505361;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=YvquIwwg5/j4zuorAq7NmB4oxpw4k5D2MxcNq7+7jVA=;
  b=JewvC40H/0MVGiTGQesEK3gpNkaNjRb0fZ2pZNLvPXGoD9goi0SzY1ck
   R+dfi47e0zOqKM7jr/uZJfXz6V8YsvSRMiBusrkz3RUAghj+4dxFcXwa8
   6IkQpDHH05j5S6At1ZRblzzroeONbiZ8CxyyqVpmgehFYi0aSmo1d/61u
   fsNyNa63EtiOzfcqURfChcASocnmlL73ww1nYyAA953sV9Ru2kEbLtDtQ
   AMK9YlTKf/ha9ldezoH4KkrzNc1hZ/UbbhawSzPJl7FS8C7d2ZAqwKxaH
   hvYN+Wj87ZsstI38U9Mjdoc58IwXRqN0wGVtDmRQ6uuLvJkHX7XA1yYi5
   w==;
X-CSE-ConnectionGUID: pPZ5+d//QQO++nIo7vvWdw==
X-CSE-MsgGUID: jDl19JY4Q/O8FdMMO1277w==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="26680404"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="26680404"
X-CSE-ConnectionGUID: R4ZdAm2cSWCWdcBvo+HW5w==
X-CSE-MsgGUID: Rg93cpzSR3e/8YcpWOq3jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74496623"
Date: Thu, 3 Oct 2024 18:29:10 +0300
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
Message-ID: <Zv64RktMPv2rpCZf@intel.com>
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
 <20241002182200.15363-3-ville.syrjala@linux.intel.com>
 <Zv6QF2EmIcogtlLA@louis-chauvet-laptop>
 <Zv6gSGMXZZARf3oV@intel.com>
 <Zv6zN7Go_XG44P2-@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zv6zN7Go_XG44P2-@louis-chauvet-laptop>
X-Patchwork-Hint: comment

On Thu, Oct 03, 2024 at 05:07:35PM +0200, Louis Chauvet wrote:
> 
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > index a40295c18b48..780681ea77e4 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > @@ -64,7 +64,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
> > > >  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> > > >  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> > > >  
> > > > -	drm_calc_timestamping_constants(crtc, &crtc->mode);
> > > > +	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);
> > > 
> > > 	drm_calc_timestamping_constants(crtc, &crtc->state->mode);
> > 
> > This one doesn't look safe. You want to call that during your atomic
> > commit already.
> > 
> 
> This was already not safe with the previous implementation? Or it is only 
> unsafe because now I use state->mode instead of legacy.mode?

Yeah, if you want to look at obj->state then you need the corresponding
lock.

obj->state is also not necessarily the correct state you want because
a parallel commit could have already swapped in a new state but the
hardware is still on the old state.

Basically 99.9% of code should never even look at obj->state, and
instead should always use the for_each_new_<obj>_in_state()
and drm_atomic_get_new_<obj>_state() stuff. Currently that is a
pipe dream though because a lot of drivers haven't been fixed to
do things properly. If we ever manage to fix everything then we
could remove the stall hacks from drm_atomic_helper_swap_state()
and allow a commit pipeline of arbitrary length.

> 
> After inspecting the code, I think I don't need to call it as:
> 
> In `vkms_atomic_commit_tail` (used in 
> `@vkms_mode_config_helpers.atomic_commit_tail`), we call 
> `drm_atomic_helper_commit_modeset_disables`, which call 
> `drm_atomic_helper_calc_timestamping_constants` which call 
> `drm_calc_timestamping_constants` for every CRTC.

Slightly odd place for it, but I think that's just because it was
originally part of drm_atomic_helper_update_legacy_modeset_state()
and I didn't bother looking for a better home for it when I split
it out. But seems like it should work fine as is.

> 
> I tested kms_vblank, all of them are SUCCESS/SKIP, do you know other tests 
> that can trigger bugs?

You would explicitly have to race commits against vblank_enable.
Could of course sprinkle sleep()s around to widen the race window
if you're really keen to hit it.

-- 
Ville Syrjälä
Intel

