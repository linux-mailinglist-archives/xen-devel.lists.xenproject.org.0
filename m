Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57A926DD69
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 16:02:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIuU5-000253-Ci; Thu, 17 Sep 2020 14:02:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IBe1=C2=gmail.com=melissa.srw@srs-us1.protection.inumbo.net>)
 id 1kIuU4-00024y-H7
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 14:02:00 +0000
X-Inumbo-ID: 3a5e0d53-b093-4897-8927-245e0b4283c9
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a5e0d53-b093-4897-8927-245e0b4283c9;
 Thu, 17 Sep 2020 14:01:59 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e17so2095756wme.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2020 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lBUrIOfg3+mq8ad85tbb7EImBFZIDC/tVRBXQ4hE1ik=;
 b=DNZiBZAKqypMSqQJoyD2IPrVpqiI3ikdcnRtqSUtglPbT/8APSdwaP78S9dCceWhaB
 CUFzh+i3SYFxQjgJQYQXA+eAyv74bC7KPueFL/Gfi5sPNtWoyu6oeH0LQkpIWYJSX21y
 rV7VkyxfFYten7MOhzm3Bz7i04GYai5m0PJD8/+pat7mIsmnFKD4UKKCCUMZ01zZFTbO
 PKJYwiwHEuO6KO353OHy/LaLG0eDM48NEvTlWgc4GQY7VXvipXO0S4rEEhbCyvprEr3R
 BIuNCJjy1NTGULEvR1fAoX12DfpViAnvzecyOpIl9S6AtbE1NSwC4GsSGoUx0L019NSL
 oeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lBUrIOfg3+mq8ad85tbb7EImBFZIDC/tVRBXQ4hE1ik=;
 b=UxlDIhUC8PHSQCNzqMKyLC0FkIyCDRQCEA4KC9fsw/gnM0AMikfeARu8gfGydevYAE
 +40prhzoKL9kuPA/8lUfYpmJaGdFxFanOP/xtEsKQ/YkR+gN+KjqJIlzFCTPRxiu0D1A
 EPQFvfieRe1eKNvK9+qgxH8N4fOzZsE8B9BwDYgIRLEj51xK9V15P9R6o2OC3cJ2PLBj
 8nZPX6OT7g1HsnDzOxSNKrND4K80vza7fA76x0AIu4cxPVo/0yRlxaCtg/Al8WNeW6yn
 pXapq63K1ytDJnHq33b+e94n+gFTRMyZJFvcBJAYeq6Al10mx32Q6A/5Es3I57T7te/o
 fRYw==
X-Gm-Message-State: AOAM532TVSQpwLmdnrqDW0Zg3W3yl9DBAmFWZEwXbOSUA8znG3P+05fI
 8/Qzilp5Hm8WiTHRROp/Vb0=
X-Google-Smtp-Source: ABdhPJwVFsi9VyC5N2zDyjQYYSf7iQdzkgcW/plJduCk7Y3eMkitDq4/6m+bqkSKVjF1esIZWne4iA==
X-Received: by 2002:a1c:ba0b:: with SMTP id k11mr10119624wmf.20.1600351318328; 
 Thu, 17 Sep 2020 07:01:58 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id z14sm37316830wrh.14.2020.09.17.07.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 07:01:57 -0700 (PDT)
Date: Thu, 17 Sep 2020 11:01:48 -0300
From: Melissa Wen <melissa.srw@gmail.com>
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
 emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 16/21] drm/vgem: Introduce GEM object functions
Message-ID: <20200917140148.orpdihcctrr5upxg@smtp.gmail.com>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-17-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-17-tzimmermann@suse.de>
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

Hi Thomas,

On 09/15, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in vgem. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks here again.

This drv file is little tumultuous to me.
I mean, I took a while to sort functions in my head.

However, finally, I got it, and the change looks good.

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>

> ---
>  drivers/gpu/drm/vgem/vgem_drv.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index cb884c890065..fa54a6d1403d 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -50,6 +50,8 @@
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> +static const struct drm_gem_object_funcs vgem_gem_object_funcs;
> +
>  static struct vgem_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
> @@ -167,6 +169,8 @@ static struct drm_vgem_gem_object *__vgem_gem_create(struct drm_device *dev,
>  	if (!obj)
>  		return ERR_PTR(-ENOMEM);
>  
> +	obj->base.funcs = &vgem_gem_object_funcs;
> +
>  	ret = drm_gem_object_init(dev, &obj->base, roundup(size, PAGE_SIZE));
>  	if (ret) {
>  		kfree(obj);
> @@ -401,12 +405,20 @@ static int vgem_prime_mmap(struct drm_gem_object *obj,
>  	return 0;
>  }
>  
> +static const struct drm_gem_object_funcs vgem_gem_object_funcs = {
> +	.free = vgem_gem_free_object,
> +	.pin = vgem_prime_pin,
> +	.unpin = vgem_prime_unpin,
> +	.get_sg_table = vgem_prime_get_sg_table,
> +	.vmap = vgem_prime_vmap,
> +	.vunmap = vgem_prime_vunmap,
> +	.vm_ops = &vgem_gem_vm_ops,
> +};
> +
>  static struct drm_driver vgem_driver = {
>  	.driver_features		= DRIVER_GEM | DRIVER_RENDER,
>  	.open				= vgem_open,
>  	.postclose			= vgem_postclose,
> -	.gem_free_object_unlocked	= vgem_gem_free_object,
> -	.gem_vm_ops			= &vgem_gem_vm_ops,
>  	.ioctls				= vgem_ioctls,
>  	.num_ioctls 			= ARRAY_SIZE(vgem_ioctls),
>  	.fops				= &vgem_driver_fops,
> @@ -415,13 +427,8 @@ static struct drm_driver vgem_driver = {
>  
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_pin = vgem_prime_pin,
> -	.gem_prime_unpin = vgem_prime_unpin,
>  	.gem_prime_import = vgem_prime_import,
>  	.gem_prime_import_sg_table = vgem_prime_import_sg_table,
> -	.gem_prime_get_sg_table = vgem_prime_get_sg_table,
> -	.gem_prime_vmap = vgem_prime_vmap,
> -	.gem_prime_vunmap = vgem_prime_vunmap,
>  	.gem_prime_mmap = vgem_prime_mmap,
>  
>  	.name	= DRIVER_NAME,
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

