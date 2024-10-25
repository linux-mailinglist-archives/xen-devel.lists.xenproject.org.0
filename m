Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5609B9AFF20
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 11:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825744.1240133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4H4C-0005Un-KO; Fri, 25 Oct 2024 09:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825744.1240133; Fri, 25 Oct 2024 09:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4H4C-0005Qv-HM; Fri, 25 Oct 2024 09:57:12 +0000
Received: by outflank-mailman (input) for mailman id 825744;
 Fri, 25 Oct 2024 09:54:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVQX=RV=linaro.org=dmitry.baryshkov@srs-se1.protection.inumbo.net>)
 id 1t4H20-0004iH-2M
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 09:54:56 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ed85774-92b7-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 11:54:54 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-6e35f08e23eso18031147b3.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2024 02:54:54 -0700 (PDT)
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
X-Inumbo-ID: 2ed85774-92b7-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729850093; x=1730454893; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovzUCbOnf8ad3/AG/s6edyQx3Y96JvN5zzmYGNZvn88=;
        b=kzm7FWGFCr5xszHTwyrl3hngXTVg1+wS8+78itGhYATKT47/IoAGIH+mOfHQ4bcnUw
         0qcT9u/6L6EM69LUHOuQeEBeIgRl0I7Qn+RRzmkv8DoCak1+mubH1FjN01ey2hWWZfdv
         +mrNmrdqePVzqqNXW2Yg2A+VDAIoPxd8NOFYG6+agBO1xlC+jvbpG9xO6vPWFMhO5ZQS
         Pe5/H7k5KMIDNZdiVFirzcmrxt0Bo2IGHqZXwRg5u0hsNCC8Z9iBjoKIpylaWnnPRdCG
         gaGcG8ukoi9nRvrXqOgWie/VIVweMtAVng3rsFkCwWsjO0Y/vL5kIZjhaqT0Qyox07xH
         uE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729850093; x=1730454893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovzUCbOnf8ad3/AG/s6edyQx3Y96JvN5zzmYGNZvn88=;
        b=FNMpmw0ZcwUl9UXhsG+X9c0FPbOY8Iast99/emGxjK0m6cnmbjPFjy72Sx7Lhnvi6b
         5vcX5MjVYWdq7uWxmjNE+DkpvM2IVwPBrbpoJsANvJVsVICcl2CzSB5dY2ufxDtfYVng
         upHLsxjDVVuCQJ+DUjNb36yOA0TuoULkH3ue4IcmWJKKrANRXJi4lih7uqkc1aD0r3ui
         XFuXj+4ze6F005sw6pDnqr/kDCMb9SkGEHXg0qS5+cUnaC1J2VfpLLJanN+JlAD4i5Vr
         0PYbOCgMG6RkMg9kDuTLvAfcE6bt/xVEC7GAPtMxuLdS5nSjMXK+Jd72Fad+5Yrzy0gw
         x12w==
X-Forwarded-Encrypted: i=1; AJvYcCU9W+rJdFxJvjJgTFB4vUtTZUNPsZA6h7DRWf4BqJFpzCW/F8eKCMAJHcrjn96CGKJuZWmzEjA2Q38=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsmatVnn22zP19yNbdTqLwasPqFpUkzvklbqjoDSPktHzzTiDZ
	SA+PdqppbWEeK5UmZjQH655WZ8WtDHjD7PbjulbALMkwSh0rRqVNd7JqlTBj8xNcqCgOcADyHc9
	JrpSMBoKrLe5RGW0bonIWjti00Nv4POHck6BhVA==
X-Google-Smtp-Source: AGHT+IFZu/LyAjfpwX5MrN+JVkr0x0xSzSrKk0A5Mdi5tj38z9PJE4G47Yh4NVVkEqgziX0kL7VNUYJrsxipC6JS6p4=
X-Received: by 2002:a05:690c:fc7:b0:6e7:fb87:7094 with SMTP id
 00721157ae682-6e85814d77fmr57343097b3.6.1729850092872; Fri, 25 Oct 2024
 02:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com> <ZxtMz8JP3DbzpMew@intel.com>
In-Reply-To: <ZxtMz8JP3DbzpMew@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 12:54:42 +0300
Message-ID: <CAA8EJprT=BGyMnvkjS4BkRqar1hHn_hpXFaz9gstPL_9u1rAsQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: Treewide plane/crtc legacy state sweeping
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	amd-gfx@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Danilo Krummrich <dakr@redhat.com>, freedreno@lists.freedesktop.org, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Inki Dae <inki.dae@samsung.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Karol Herbst <kherbst@redhat.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.orga, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Liviu Dudau <liviu.dudau@arm.com>, Lyude Paul <lyude@redhat.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	Marijn Suijten <marijn.suijten@somainline.org>, nouveau@lists.freedesktop.org, 
	nouveau@lists.freedesktop.orga, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>, 
	spice-devel@lists.freedesktop.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Xinhui Pan <Xinhui.Pan@amd.com>, 
	Zack Rusin <zack.rusin@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Oct 2024 at 10:46, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Oct 02, 2024 at 09:21:58PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >
> > An attempt to hide the drm_plane/crtc legacy state better.
> >
> > This also highlights the fact that a lot of supposedly
> > atomic drivers are poking around in the legacy crtc state,
> > which is rather questionable. For planes we did force the
> > legacy state to NULL already to force drivers to behave.
> > But even then it seems capable of confusing people with
> > its high profile location directly under drm_plane.
> >
> > This might end up as some kind of conflict
> > galore, but the alternative would involve trying
> > to wean the atomic drivers off one by one,
> > which would probably take forever. At least with
> > this the issue becomes visible and shouldn't be
> > forgotten as easily.
>
> Ping, anyone have thoughts on this? I'd like to get something
> like this in at some point to make the legacy state (ab)users
> easily visible...

I think that's a good idea. I hope to find a time slot and check the
(ab)using of legacy state in drm/msm driver.

>
> >
> > The cc list was getting way out of hand, so I had
> > to trim it a bit. Hopefully I didn't chop off too
> > many names...



--=20
With best wishes
Dmitry

