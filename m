Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587B3260A54
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 07:49:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFWVH-0005kY-MG; Tue, 08 Sep 2020 05:49:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gt+x=CR=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1kFWVG-0005kR-1T
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 05:49:14 +0000
X-Inumbo-ID: a9835fbf-e282-4d82-84d8-7fe7998c551f
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a9835fbf-e282-4d82-84d8-7fe7998c551f;
 Tue, 08 Sep 2020 05:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599544151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eQK1NPwmSWOx8INcFCnwK3inQ46y12Ng6QHkYnvGe3I=;
 b=LgEG1tI4Zg9p7W0XFQUtFbSA9O19wnmfYk+arU225fe071UZkhTYVyVe9ozIFm6qvgBL9I
 vFqaZ1bni8u1ptDth7cpUSare4TzzO1Eooo+g3VHSu5At+2xYJObBSk4R3HVt+MsB1AHm0
 QghfE8aBXYJwxDxqzIyjUC/Dz9jvjKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-r-VulFGYMA-fjnnBfjljEg-1; Tue, 08 Sep 2020 01:49:07 -0400
X-MC-Unique: r-VulFGYMA-fjnnBfjljEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E448D425D1;
 Tue,  8 Sep 2020 05:49:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C936811BE;
 Tue,  8 Sep 2020 05:48:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0FDF617538; Tue,  8 Sep 2020 07:48:58 +0200 (CEST)
Date: Tue, 8 Sep 2020 07:48:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Ben Skeggs <bskeggs@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
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
Message-ID: <20200908054858.um34wojjv6uhi7d3@sirius.home.kraxel.org>
References: <20200907112425.15610-1-kraxel@redhat.com>
 <20200907112425.15610-2-kraxel@redhat.com>
 <CAKMK7uGjT73rh=9iuCKAXvC_CaOuygm8PgOQgofkTgH7wRysFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGjT73rh=9iuCKAXvC_CaOuygm8PgOQgofkTgH7wRysFw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

On Mon, Sep 07, 2020 at 03:53:02PM +0200, Daniel Vetter wrote:
> On Mon, Sep 7, 2020 at 1:24 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > Add drm_device argument to drm_prime_pages_to_sg(), so we can
> > call dma_max_mapping_size() to figure the segment size limit
> > and call into __sg_alloc_table_from_pages() with the correct
> > limit.
> >
> > This fixes virtio-gpu with sev.  Possibly it'll fix other bugs
> > too given that drm seems to totaly ignore segment size limits
> > so far ...
> >
> > v2: place max_segment in drm driver not gem object.
> > v3: move max_segment next to the other gem fields.
> > v4: just use dma_max_mapping_size().
> >
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Uh, are you sure this works in all cases for virtio?

Sure, I've tested it ;)

> The comments I've found suggest very much not ... Or is that all very
> old stuff only that no one cares about anymore?

I think these days it is possible to override dma_ops per device, which
in turn allows virtio to deal with the quirks without the rest of the
kernel knowing about these details.

I also think virtio-gpu can drop the virtio_has_dma_quirk() checks, just
use the dma api path unconditionally and depend on virtio core having
setup dma_ops in a way that it JustWorks[tm].  I'll look into that next.

take care,
  Gerd


