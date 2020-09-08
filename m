Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4DE260E2F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 10:56:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFZPr-0006Gf-OO; Tue, 08 Sep 2020 08:55:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t1cP=CR=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1kFZPp-0006GV-Nw
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 08:55:50 +0000
X-Inumbo-ID: 9a2e1b93-4bd6-4792-b8c2-1910bcd4669c
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a2e1b93-4bd6-4792-b8c2-1910bcd4669c;
 Tue, 08 Sep 2020 08:55:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s13so16437984wmh.4
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 01:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=lPf7+5yaWPR4Bsu29CBYqFns/59BDsvYdpze1XOObUQ=;
 b=PGlAHISsJbb/iYgixfJKVAK0d3OOuP3SlP2TjTpoK/oyd/DkyWjQ7j9CtU74WPEw0A
 NkxDuWQKM4W+M6eiE0fRmROTwl4OHi/jQ6z3R8Ikhb+ljBKxuSnOMNBFuSVwV7AkQa34
 kBB3vAMyk0pYZpn9c7JUOZ/xI0bfjYSUvtffY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=lPf7+5yaWPR4Bsu29CBYqFns/59BDsvYdpze1XOObUQ=;
 b=RqYP9FE3M9/OKs5yiU3Amxecqv2nRoJe9RZSDwOGVRKhtMTk2xwxM9CjoXJYxx278P
 HOhGFPAbf0omSYl6az8yhwnE5nnrKXBKYj8gQkZzCOtf+Y1fkptEbRP+ZFj7eCZUpEId
 SBnUdGHBjAZSgqoNI06B1WKk+jRntBvedCvBCUT1u9uJAKfo456sOkd25T2+HkNkcAI3
 JsO5zTo5PwPXM3E2M9RIFbd9Ie/VhXCSxO3gl6k+nMjMrp+/bC1KYtLb5x0xSErhuU+w
 88SveBZbNnUCwO9PbfNx3xl2jImMPkWUzFzMu3dtZP9x5JdpXPoDKVdSRojxCf2mJgGq
 +35A==
X-Gm-Message-State: AOAM531v6NhwHMY1XlAmgL/55mz2eB1Jku4tk1LsMkxyOj9NcChIH7Zi
 wcGkFRg9kZBGLkp5wAdb2w7FGA==
X-Google-Smtp-Source: ABdhPJzRIgnrsr1zISzj3JMMO+qHmnUUaLRMb8phFavthqU3M8id+c7krZN538k/E4IFJZLkveZLYQ==
X-Received: by 2002:a1c:e256:: with SMTP id z83mr3369682wmg.33.1599555347784; 
 Tue, 08 Sep 2020 01:55:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l10sm30834268wru.59.2020.09.08.01.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:55:47 -0700 (PDT)
Date: Tue, 8 Sep 2020 10:55:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Ben Skeggs <bskeggs@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 1/1] drm: allow limiting the scatter list size.
Message-ID: <20200908085544.GI2352366@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Ben Skeggs <bskeggs@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, 
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>
References: <20200907112425.15610-1-kraxel@redhat.com>
 <20200907112425.15610-2-kraxel@redhat.com>
 <CAKMK7uGjT73rh=9iuCKAXvC_CaOuygm8PgOQgofkTgH7wRysFw@mail.gmail.com>
 <20200908054858.um34wojjv6uhi7d3@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908054858.um34wojjv6uhi7d3@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Sep 08, 2020 at 07:48:58AM +0200, Gerd Hoffmann wrote:
> On Mon, Sep 07, 2020 at 03:53:02PM +0200, Daniel Vetter wrote:
> > On Mon, Sep 7, 2020 at 1:24 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > Add drm_device argument to drm_prime_pages_to_sg(), so we can
> > > call dma_max_mapping_size() to figure the segment size limit
> > > and call into __sg_alloc_table_from_pages() with the correct
> > > limit.
> > >
> > > This fixes virtio-gpu with sev.  Possibly it'll fix other bugs
> > > too given that drm seems to totaly ignore segment size limits
> > > so far ...
> > >
> > > v2: place max_segment in drm driver not gem object.
> > > v3: move max_segment next to the other gem fields.
> > > v4: just use dma_max_mapping_size().
> > >
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > 
> > Uh, are you sure this works in all cases for virtio?
> 
> Sure, I've tested it ;)
> 
> > The comments I've found suggest very much not ... Or is that all very
> > old stuff only that no one cares about anymore?
> 
> I think these days it is possible to override dma_ops per device, which
> in turn allows virtio to deal with the quirks without the rest of the
> kernel knowing about these details.
> 
> I also think virtio-gpu can drop the virtio_has_dma_quirk() checks, just
> use the dma api path unconditionally and depend on virtio core having
> setup dma_ops in a way that it JustWorks[tm].  I'll look into that next.

The comment above vring_use_dma_api() suggests that this has not yet
happened, that's why I'm asking. If this has happened then I think it'd be
best if you remove that todo entry and update it, as part of the overall
series to add dma_max_mapping_size and remove the quirks.

Otherwise this all is a bit wtf material :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

