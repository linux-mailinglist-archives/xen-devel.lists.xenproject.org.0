Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC7725F3B2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 09:14:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFBLx-0000Kk-3E; Mon, 07 Sep 2020 07:14:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rx60=CQ=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1kFBLv-0000Kb-00
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 07:14:11 +0000
X-Inumbo-ID: c11c544c-3a1d-457b-bcfa-70f4859da721
Received: from mail-oo1-xc43.google.com (unknown [2607:f8b0:4864:20::c43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c11c544c-3a1d-457b-bcfa-70f4859da721;
 Mon, 07 Sep 2020 07:14:09 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id r4so3053623ooq.7
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 00:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KVfAGFVhhH+3gKxWPx4EEt2i/99FDkLx011kDtsMF+I=;
 b=Euxtu+trgjabIp7kfpqLzFQS+dE83z6NFR5B38p25hCsIskYQhJEXI8aDOFmjb9/rb
 ajdQe4bmbBxWioDNhCAVb/QZqh3F00karTYzM2FazYTVvrVMLOroBXd2TBPPFA8thdy7
 kAmoBHvDcK9wIivmZv2bC4v0rV5TvwkjuxeM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KVfAGFVhhH+3gKxWPx4EEt2i/99FDkLx011kDtsMF+I=;
 b=iS/rx6uGeX56DqfgE7Mqx06o4h+Gy6+bkFJyEgqWqkFEoykoO4U0SuBEH7XaYORaF3
 bQLDgyA0fjvLccRQvcQg6S4/h1Y7aFMH1u9G5+KeFO0n8Rq50LJBfwFzV9izUQ4CB2JU
 oqRIXs4WYxi7iH79F/7+IrLoV5kxeAoRPe/KgDfF0sKcy7CEKkkVPuTfk2cgwnalUyyF
 gpqiQT6v5q2AvPAMrKrV4CaSAWoCt+fJq1kHVYqmWwNzCEekkhhgjjOLh4gH/fOfNTLB
 ZlRUJetPKSa8PJ3Rbp2cC0GNgrkyJFSpywflEy9CfiA+7ye5/l+o4uX9zasUAudETlSR
 yhIg==
X-Gm-Message-State: AOAM5302vjGz58kDUzvoDJQAmFn1fWmSvQM1LpA/Qw46DBMfFzNIza2n
 Z4f7FJy6te5F/iWkv0nCawsY0e+Qfyz+veGOJsKL7A==
X-Google-Smtp-Source: ABdhPJyDsSLWPXy8R9Ce8HIpecD+QM6t0+0yQYpXyChVzKDiPvzj0GbvH4ZECIfVS8TxI8k421NQRVJ+suYIajAm3/8=
X-Received: by 2002:a4a:e98e:: with SMTP id s14mr13829467ood.28.1599462848946; 
 Mon, 07 Sep 2020 00:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200818092017.26290-1-kraxel@redhat.com>
 <20200818092017.26290-2-kraxel@redhat.com>
 <20200901074043.GT2352366@phenom.ffwll.local>
 <20200907063901.atwjdxz7iqyra22h@sirius.home.kraxel.org>
In-Reply-To: <20200907063901.atwjdxz7iqyra22h@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 7 Sep 2020 09:13:58 +0200
Message-ID: <CAKMK7uFixrbxVoaF4-1hXvQcPySaaYRooQ=LKoivPALH-UCgbw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: allow limiting the scatter list size.
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Ben Skeggs <bskeggs@redhat.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
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
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Sep 7, 2020 at 8:39 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > > +   /**
> > > +    * @max_segment:
> > > +    *
> > > +    * Max size for scatter list segments.  When unset the default
> > > +    * (SCATTERLIST_MAX_SEGMENT) is used.
> > > +    */
> > > +   size_t max_segment;
> >
> > Is there no better place for this then "at the bottom"? drm_device is a
> > huge structure, piling stuff up randomly doesn't make it better :-)
>
> Moved next to the other gem fields for now (v3 posted).
>
> > I think ideally we'd have a gem substruct like we have on the modeset side
> > at least.
>
> Phew, that'll be quite some churn in the tree.  And there aren't that many
> gem-related fields in struct drm_device.
>
> So you are looking for something like below (header changes only)?

Hm yeah it's a lot less than I thought. And yes I think that would be neat.
-Daniel

>
> take care,
>   Gerd
>
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index c455ef404ca6..950167ede98a 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -299,22 +299,8 @@ struct drm_device {
>         /** @mode_config: Current mode config */
>         struct drm_mode_config mode_config;
>
> -       /** @object_name_lock: GEM information */
> -       struct mutex object_name_lock;
> -
> -       /** @object_name_idr: GEM information */
> -       struct idr object_name_idr;
> -
> -       /** @vma_offset_manager: GEM information */
> -       struct drm_vma_offset_manager *vma_offset_manager;
> -
> -       /**
> -        * @max_segment:
> -        *
> -        * Max size for scatter list segments for GEM objects.  When
> -        * unset the default (SCATTERLIST_MAX_SEGMENT) is used.
> -        */
> -       size_t max_segment;
> +       /** @gem_config: Current GEM config */
> +       struct drm_gem_config gem_config;
>
>         /** @vram_mm: VRAM MM memory manager */
>         struct drm_vram_mm *vram_mm;
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 337a48321705..74129fb29fb8 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -39,6 +39,25 @@
>
>  #include <drm/drm_vma_manager.h>
>
> +struct drm_gem_config {
> +       /** @object_name_lock: GEM information */
> +       struct mutex object_name_lock;
> +
> +       /** @object_name_idr: GEM information */
> +       struct idr object_name_idr;
> +
> +       /** @vma_offset_manager: GEM information */
> +       struct drm_vma_offset_manager *vma_offset_manager;
> +
> +       /**
> +        * @max_segment:
> +        *
> +        * Max size for scatter list segments for GEM objects.  When
> +        * unset the default (SCATTERLIST_MAX_SEGMENT) is used.
> +        */
> +       size_t max_segment;
> +};
> +
>  struct drm_gem_object;
>
>  /**
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

