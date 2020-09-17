Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F63B26DA9F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 13:45:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIsLc-0006LO-Eb; Thu, 17 Sep 2020 11:45:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IBe1=C2=gmail.com=melissa.srw@srs-us1.protection.inumbo.net>)
 id 1kIs8S-0005DF-4k
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 11:31:32 +0000
X-Inumbo-ID: 57b65740-6581-40d6-9dcc-a8de1aa1b219
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57b65740-6581-40d6-9dcc-a8de1aa1b219;
 Thu, 17 Sep 2020 11:31:31 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d4so1613144wmd.5
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2020 04:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QoGoJWGY9uvsPbK1VFldPakdj/95886EaH4XmF5Nmig=;
 b=WT+tCnqscdjnhBzx4pey4qfrs3TpF1Xktu7jt8T8cQSP0yZJdX3KoYHPdWspzIugsq
 6HSKY9VJKgsdLw89cCYxqdbs7Vt7/k4/jK9LtTE+4i9XvfXW1Lr/Fm+fEnngxxWPD5dx
 hAgvu8wEl2ImGMZ/Vxi1axcUTWC/C1hcCZmRCP+VMlQrWSEcu/Hqzj+fuVKA2INfBjX3
 /zcARTJCVi7gGPGSYovxguWtsuZzPwF6TsPs2IH9t/Kp5k3R+t/9fCDbL8cqbYXRyKxo
 iHGdqfCt+o61f/ixQfUMrk5tyRoSS69zCZaqGiTmJsGllEHi/xlz25EYavgN+6zZY8AL
 WM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QoGoJWGY9uvsPbK1VFldPakdj/95886EaH4XmF5Nmig=;
 b=PpfeCgWFthNwtIvYQmyAInGisHciYnFkNiO8iPpF9kYWpLKy5+77U3GrhPlBvKP1h8
 UQ951/0xGx913fLTIOt1c8gtU2erXoeTqmYvntCVmLQzAqXVF8stywLTcs+aBeQforxj
 rNoKCYs9b+6QTWWCNKE8EAbuElcJN3MSkyRgMkxXSa5Y5BMXzCfOtz0owAKh66oGKHSi
 7o4leI7C2UPq0O6ampA5NBkLRu+NpTKjI7KTFMsRZt6icmK4bxr9Ig9249+uVOnFMrVD
 EUUvTxHa0R7ATGHf4o6735tSxlOK3FE0WVypfle5vRFwgeDGvTGlDEJoxfbQ6Lxz/dFc
 OrOQ==
X-Gm-Message-State: AOAM532+enxezRkBG8WyV8U7mtr/V2V1AVL8xcXIc0BfUGxV5dfDNbBE
 f80caCshWAdeJGbCLj7MiGQ=
X-Google-Smtp-Source: ABdhPJyuZcp+AqRLPz3yJIfvdwNUATarIMvgIK7I09VrN4WEXhLqSMqZyvaS1A1ZqiWgJrdIoQA/Hg==
X-Received: by 2002:a1c:96:: with SMTP id 144mr9601334wma.84.1600342290200;
 Thu, 17 Sep 2020 04:31:30 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id 11sm10489240wmi.14.2020.09.17.04.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 04:31:29 -0700 (PDT)
Date: Thu, 17 Sep 2020 08:31:20 -0300
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
Subject: Re: [PATCH v2 18/21] drm/vkms: Introduce GEM object functions
Message-ID: <20200917113120.dtz7yxvdg7xdgbx5@smtp.gmail.com>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-19-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-19-tzimmermann@suse.de>
X-Mailman-Approved-At: Thu, 17 Sep 2020 11:45:06 +0000
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
> per-instance callbacks in vkms.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks! Looks fine.

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_drv.c |  8 --------
>  drivers/gpu/drm/vkms/vkms_gem.c | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index cb0b6230c22c..726801ab44d4 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -51,12 +51,6 @@ static const struct file_operations vkms_driver_fops = {
>  	.release	= drm_release,
>  };
>  
> -static const struct vm_operations_struct vkms_gem_vm_ops = {
> -	.fault = vkms_gem_fault,
> -	.open = drm_gem_vm_open,
> -	.close = drm_gem_vm_close,
> -};
> -
>  static void vkms_release(struct drm_device *dev)
>  {
>  	struct vkms_device *vkms = container_of(dev, struct vkms_device, drm);
> @@ -98,8 +92,6 @@ static struct drm_driver vkms_driver = {
>  	.release		= vkms_release,
>  	.fops			= &vkms_driver_fops,
>  	.dumb_create		= vkms_dumb_create,
> -	.gem_vm_ops		= &vkms_gem_vm_ops,
> -	.gem_free_object_unlocked = vkms_gem_free_object,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
>  	.gem_prime_import_sg_table = vkms_prime_import_sg_table,
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
> index a017fc59905e..19a0e260a4df 100644
> --- a/drivers/gpu/drm/vkms/vkms_gem.c
> +++ b/drivers/gpu/drm/vkms/vkms_gem.c
> @@ -7,6 +7,17 @@
>  
>  #include "vkms_drv.h"
>  
> +static const struct vm_operations_struct vkms_gem_vm_ops = {
> +	.fault = vkms_gem_fault,
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};
> +
> +static const struct drm_gem_object_funcs vkms_gem_object_funcs = {
> +	.free = vkms_gem_free_object,
> +	.vm_ops = &vkms_gem_vm_ops,
> +};
> +
>  static struct vkms_gem_object *__vkms_gem_create(struct drm_device *dev,
>  						 u64 size)
>  {
> @@ -17,6 +28,8 @@ static struct vkms_gem_object *__vkms_gem_create(struct drm_device *dev,
>  	if (!obj)
>  		return ERR_PTR(-ENOMEM);
>  
> +	obj->gem.funcs = &vkms_gem_object_funcs;
> +
>  	size = roundup(size, PAGE_SIZE);
>  	ret = drm_gem_object_init(dev, &obj->gem, size);
>  	if (ret) {
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

