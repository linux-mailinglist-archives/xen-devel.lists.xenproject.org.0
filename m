Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5204E26C27F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 14:07:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIWDt-0005A9-7b; Wed, 16 Sep 2020 12:07:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wetI=CZ=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1kIWDr-0005A4-VR
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 12:07:39 +0000
X-Inumbo-ID: b4e632ca-642f-448a-93a3-217c7ed46dd1
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4e632ca-642f-448a-93a3-217c7ed46dd1;
 Wed, 16 Sep 2020 12:07:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j2so6640187wrx.7
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2020 05:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MGCPV3gxMGzqEc3cNJPEYSeaflc+Izh53Gg+hbi1Nhw=;
 b=D8Cn+LnzRzcwcAFRiK+P1SGw66Mhbu0VayIxxEwp3/Ke3uFcgTtEyg2O2TchfbyaU1
 /t1Jed/k7t8UhbtyHLBWwi9QGEEtHwtsdBVK0+CssfY95ypMsX9PNDgpg6PAhXIZmBww
 EM4H0+Gc3gntNd2KUdiNeLGf+3Tz2z1yDgJeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MGCPV3gxMGzqEc3cNJPEYSeaflc+Izh53Gg+hbi1Nhw=;
 b=iC2aegZMeYh3l/2QMG+pEUyTEnX+Rko52dZYVYdvcURqx54EP1zOcWPoMkbZiaV13S
 TOMgQ1WRIg3Up5+oMQbZ4V3TebQ6RuFieaplFGk9Zj3+c2DJrQmnb9W1tPUHXWwsswkG
 zRHWyKamEncZwdbLV2ZGowZWQ0huRH0vi1mU8/+hJLSToFMjxMMlB/PmgGvcnNVPyupF
 jbcEYsdHrk4//Nwe48C4XQzezgCnm5F7vRRDpI9pc6/BoNB8cJfCZ+OfyugvYtukEp0P
 3JMYTUrKmlo/2PxCH02tGNQjjgNR5JCrT45o2adbjPG8FMVxqPWOQQLAtvQZj/36RYfY
 ejlw==
X-Gm-Message-State: AOAM533IfukONJfSqkGXUzO4JcOEg7UzjPUvBNKVpPkeiAN28piLbRi4
 XZ8hfzZvpDOFuQqNXiG6DO2i0Q==
X-Google-Smtp-Source: ABdhPJwrWIpLSYf41av9bZsrjEfrlf4lf8//RpX+N0WUgXGOZN7ZDB+gPcHHEGIp6RA3wivQd9OHbQ==
X-Received: by 2002:a05:6000:1152:: with SMTP id
 d18mr26158129wrx.173.1600258057971; 
 Wed, 16 Sep 2020 05:07:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y2sm4834552wmg.23.2020.09.16.05.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 05:07:36 -0700 (PDT)
Date: Wed, 16 Sep 2020 14:07:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, linux@armlinux.org.uk,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, robdclark@gmail.com,
 sean@poorly.run, bskeggs@redhat.com, tomi.valkeinen@ti.com,
 eric@anholt.net, hjc@rock-chips.com, heiko@sntech.de,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
 tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
 andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
 xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
 chris@chris-wilson.co.uk, matthew.auld@intel.com,
 tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com,
 sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 13/21] drm/rockchip: Convert to drm_gem_object_funcs
Message-ID: <20200916120733.GN438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-14-tzimmermann@suse.de>
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

On Tue, Sep 15, 2020 at 04:59:50PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in rockchip. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c |  5 -----
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 10 ++++++++++
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index 0f3eb392fe39..b7654f5e4225 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -212,15 +212,10 @@ static const struct file_operations rockchip_drm_driver_fops = {
>  static struct drm_driver rockchip_drm_driver = {
>  	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.lastclose		= drm_fb_helper_lastclose,
> -	.gem_vm_ops		= &drm_gem_cma_vm_ops,
> -	.gem_free_object_unlocked = rockchip_gem_free_object,
>  	.dumb_create		= rockchip_gem_dumb_create,
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> -	.gem_prime_get_sg_table	= rockchip_gem_prime_get_sg_table,
>  	.gem_prime_import_sg_table	= rockchip_gem_prime_import_sg_table,
> -	.gem_prime_vmap		= rockchip_gem_prime_vmap,
> -	.gem_prime_vunmap	= rockchip_gem_prime_vunmap,
>  	.gem_prime_mmap		= rockchip_gem_mmap_buf,
>  	.fops			= &rockchip_drm_driver_fops,
>  	.name	= DRIVER_NAME,
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> index 0055d86576f7..bddc7d99efe3 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -296,6 +296,14 @@ static void rockchip_gem_release_object(struct rockchip_gem_object *rk_obj)
>  	kfree(rk_obj);
>  }
>  
> +static const struct drm_gem_object_funcs rockchip_gem_object_funcs = {
> +	.free = rockchip_gem_free_object,
> +	.get_sg_table = rockchip_gem_prime_get_sg_table,
> +	.vmap = rockchip_gem_prime_vmap,
> +	.vunmap	= rockchip_gem_prime_vunmap,
> +	.vm_ops = &drm_gem_cma_vm_ops,
> +};
> +
>  static struct rockchip_gem_object *
>  	rockchip_gem_alloc_object(struct drm_device *drm, unsigned int size)
>  {
> @@ -310,6 +318,8 @@ static struct rockchip_gem_object *
>  
>  	obj = &rk_obj->base;
>  
> +	obj->funcs = &rockchip_gem_object_funcs;
> +
>  	drm_gem_object_init(drm, obj, size);
>  
>  	return rk_obj;
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

