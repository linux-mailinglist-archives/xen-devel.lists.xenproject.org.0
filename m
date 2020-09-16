Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DDA26C170
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 12:03:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIUHf-0001wa-2G; Wed, 16 Sep 2020 10:03:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wetI=CZ=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1kIUHc-0001wR-LY
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 10:03:25 +0000
X-Inumbo-ID: 1783aad2-2165-4682-ade4-b17de6c79540
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1783aad2-2165-4682-ade4-b17de6c79540;
 Wed, 16 Sep 2020 10:03:23 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z1so6265849wrt.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2020 03:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e2Znfx8BWkk5aVcx8hHpr3x0pz1zwQZhs1djRV0gcOU=;
 b=YwQFNnZ46y23ilMPtQ+YA1uU56yQbhOv6Wnxz4ZcYBv/64HXgnQIstoy81UuE+BuFc
 RbVimusECAo2qKzk8yvrlLUDfal98le+MXG5s9js8pfohQ+Bnhlzr8odUz3778w+kM1b
 6iP/yC9nMmGqgDJRKWjaW8mpLjM0JRvnAZoXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e2Znfx8BWkk5aVcx8hHpr3x0pz1zwQZhs1djRV0gcOU=;
 b=mNQHHJtTZSo7ZNYjyDQAKeQqU+95xHft52eCIIu+6YGkLfzB9N/vLwk1yDwakRs3xd
 2iG7QQrQN7eRrCSDjxEqnnxGEANYkRes5CVaPoaf2PUCoiT92iUHrd4algdb+p11Z0PA
 T1QjMoWuH2jjiUfuoaJ8O0bzeQVwQMycuSiaklUn1gwWMDY9Papfsmv/76uXMoXzDRWW
 I1V0DrI2lEDqY+jt0lXGMClPonQjhqg21kJrGPus1r2jH4nJLJyPazxsPA8k4AaqIeZm
 tYxJtATml0uDYPgp1A0a/byq62yPDlXV6mSy3wIMKtDbMjHPVgRJwrLk3Hm03UObBY9X
 nLwQ==
X-Gm-Message-State: AOAM533fd9ObJEuwcwg5PJayqNy6kuXDDBPotY1DyA5TPVZcGUbLNZaP
 JCDklGQ9zXlY4zK3jfSLxmdmwg==
X-Google-Smtp-Source: ABdhPJzeuyJCXxonH76Yve4EPaguLB8swVVrVRKLIRv+fjNVrJReD84NaGvyyVb0RMzIohYAQGFSOA==
X-Received: by 2002:adf:81e6:: with SMTP id 93mr25703900wra.412.1600250602103; 
 Wed, 16 Sep 2020 03:03:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s26sm4516179wmh.44.2020.09.16.03.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 03:03:21 -0700 (PDT)
Date: Wed, 16 Sep 2020 12:03:18 +0200
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
Subject: Re: [PATCH v2 04/21] drm/exynos: Introduce GEM object functions
Message-ID: <20200916100318.GF438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-5-tzimmermann@suse.de>
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

On Tue, Sep 15, 2020 at 04:59:41PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in exynos. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 10 ----------
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 15 +++++++++++++++
>  2 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index dbd80f1e4c78..fe46680ca208 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -75,11 +75,6 @@ static void exynos_drm_postclose(struct drm_device *dev, struct drm_file *file)
>  	file->driver_priv = NULL;
>  }
>  
> -static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
> -	.open = drm_gem_vm_open,
> -	.close = drm_gem_vm_close,
> -};
> -
>  static const struct drm_ioctl_desc exynos_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(EXYNOS_GEM_CREATE, exynos_drm_gem_create_ioctl,
>  			DRM_RENDER_ALLOW),
> @@ -124,16 +119,11 @@ static struct drm_driver exynos_drm_driver = {
>  	.open			= exynos_drm_open,
>  	.lastclose		= drm_fb_helper_lastclose,
>  	.postclose		= exynos_drm_postclose,
> -	.gem_free_object_unlocked = exynos_drm_gem_free_object,
> -	.gem_vm_ops		= &exynos_drm_gem_vm_ops,
>  	.dumb_create		= exynos_drm_gem_dumb_create,
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
>  	.gem_prime_import	= exynos_drm_gem_prime_import,
> -	.gem_prime_get_sg_table	= exynos_drm_gem_prime_get_sg_table,
>  	.gem_prime_import_sg_table	= exynos_drm_gem_prime_import_sg_table,
> -	.gem_prime_vmap		= exynos_drm_gem_prime_vmap,
> -	.gem_prime_vunmap	= exynos_drm_gem_prime_vunmap,
>  	.gem_prime_mmap		= exynos_drm_gem_prime_mmap,
>  	.ioctls			= exynos_ioctls,
>  	.num_ioctls		= ARRAY_SIZE(exynos_ioctls),
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index efa476858db5..69a5cf28b4ae 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -129,6 +129,19 @@ void exynos_drm_gem_destroy(struct exynos_drm_gem *exynos_gem)
>  	kfree(exynos_gem);
>  }
>  
> +static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};

Hm moving the drm_gem_cma_vm_ops into drm_gem.h or so and maybe calling
them drm_gem_simple_ops or so would remove a pile of these. But perhaps a
quick follow up series.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
> +static const struct drm_gem_object_funcs exynos_drm_gem_object_funcs = {
> +	.free = exynos_drm_gem_free_object,
> +	.get_sg_table = exynos_drm_gem_prime_get_sg_table,
> +	.vmap = exynos_drm_gem_prime_vmap,
> +	.vunmap	= exynos_drm_gem_prime_vunmap,
> +	.vm_ops = &exynos_drm_gem_vm_ops,
> +};
> +
>  static struct exynos_drm_gem *exynos_drm_gem_init(struct drm_device *dev,
>  						  unsigned long size)
>  {
> @@ -143,6 +156,8 @@ static struct exynos_drm_gem *exynos_drm_gem_init(struct drm_device *dev,
>  	exynos_gem->size = size;
>  	obj = &exynos_gem->base;
>  
> +	obj->funcs = &exynos_drm_gem_object_funcs;
> +
>  	ret = drm_gem_object_init(dev, obj, size);
>  	if (ret < 0) {
>  		DRM_DEV_ERROR(dev->dev, "failed to initialize gem object\n");
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

