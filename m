Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC79243ADA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 15:37:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6DP5-0001UP-VR; Thu, 13 Aug 2020 13:36:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Phyw=BX=ideasonboard.com=laurent.pinchart@srs-us1.protection.inumbo.net>)
 id 1k6DP4-0001Tg-OJ
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 13:36:23 +0000
X-Inumbo-ID: 5736c015-8de4-4453-bdb9-bb4edf0f5357
Received: from perceval.ideasonboard.com (unknown [213.167.242.64])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5736c015-8de4-4453-bdb9-bb4edf0f5357;
 Thu, 13 Aug 2020 13:36:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EEF4C80C;
 Thu, 13 Aug 2020 15:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597325779;
 bh=LFjCPgHaIF6gKZ6ttwoh7vM/ha5xd+8WqVY3LrXFqdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mD2ffodeTiALBx4jMPG8qxz9L2zNHMknBM29LVKDZwsuv+HPNiU01uwaTPvLjoGS1
 sOMLw+vbWye9FliJAd9NJAyN9AUdPYnu7XpJWDyFWNmXGiBOuqF8WtSmdbAdPKkTbA
 m/8ZHk2o7qVvXfCHUPCtVlJuq/Rqpw7zILkn+1Oc=
Date: Thu, 13 Aug 2020 16:36:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 michal.simek@xilinx.com, sumit.semwal@linaro.org, evan.quan@amd.com,
 Hawking.Zhang@amd.com, tianci.yin@amd.com, marek.olsak@amd.com,
 hdegoede@redhat.com, andrey.grodzovsky@amd.com,
 Felix.Kuehling@amd.com, xinhui.pan@amd.com, aaron.liu@amd.com,
 nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, abdiel.janulgue@linux.intel.com,
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
Subject: Re: [PATCH 19/20] drm/xlnx: Initialize DRM driver instance with CMA
 helper macro
Message-ID: <20200813133605.GJ6057@pendragon.ideasonboard.com>
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-20-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200813083644.31711-20-tzimmermann@suse.de>
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

Thank you for the patch.

On Thu, Aug 13, 2020 at 10:36:43AM +0200, Thomas Zimmermann wrote:
> The xlnx driver uses CMA helpers with default callback functions.
> Initialize the driver structure with the rsp CMA helper macro. The
> driver is being converted to use GEM object functions as part of
> this change.
> 
> Two callbacks, .dumb_destroy and .gem_prime_import, were initialized
> to their default implementations, so they are just kept empty now.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index 26328c76305b..058044dcc062 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -80,19 +80,7 @@ static struct drm_driver zynqmp_dpsub_drm_driver = {
>  	.driver_features		= DRIVER_MODESET | DRIVER_GEM |
>  					  DRIVER_ATOMIC,
>  
> -	.prime_handle_to_fd		= drm_gem_prime_handle_to_fd,
> -	.prime_fd_to_handle		= drm_gem_prime_fd_to_handle,
> -	.gem_prime_export		= drm_gem_prime_export,
> -	.gem_prime_import		= drm_gem_prime_import,
> -	.gem_prime_get_sg_table		= drm_gem_cma_prime_get_sg_table,
> -	.gem_prime_import_sg_table	= drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_vmap			= drm_gem_cma_prime_vmap,
> -	.gem_prime_vunmap		= drm_gem_cma_prime_vunmap,
> -	.gem_prime_mmap			= drm_gem_cma_prime_mmap,
> -	.gem_free_object_unlocked	= drm_gem_cma_free_object,
> -	.gem_vm_ops			= &drm_gem_cma_vm_ops,
> -	.dumb_create			= zynqmp_dpsub_dumb_create,
> -	.dumb_destroy			= drm_gem_dumb_destroy,
> +	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(zynqmp_dpsub_dumb_create),

The only effective change here is

-	.gem_prime_import_sg_table	= drm_gem_cma_prime_import_sg_table,
-	.gem_prime_mmap			= drm_gem_cma_prime_mmap,
+	.gem_prime_import_sg_table	= drm_gem_cma_prime_import_sg_table_vmap,
+	.gem_prime_mmap			= drm_gem_prime_mmap,

The change is significant, and I have a hard time following the code to
verify that it's correct, or if it's an undesired side effect. If it's
correct, could the change be mentioned in the commit message, with at
least a brief explanation of why this is correct, and what the
consequences here ?

>  
>  	.fops				= &zynqmp_dpsub_drm_fops,
>  

-- 
Regards,

Laurent Pinchart

