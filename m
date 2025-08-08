Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262DDB1E77B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 13:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074279.1436986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukLSV-0001hh-1G; Fri, 08 Aug 2025 11:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074279.1436986; Fri, 08 Aug 2025 11:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukLSU-0001es-UX; Fri, 08 Aug 2025 11:40:26 +0000
Received: by outflank-mailman (input) for mailman id 1074279;
 Fri, 08 Aug 2025 10:46:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE/V=2U=ideasonboard.com=tomi.valkeinen+renesas@srs-se1.protection.inumbo.net>)
 id 1ukKbo-0006f9-Cn
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 10:46:00 +0000
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de2611ae-7444-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 12:45:58 +0200 (CEST)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F313185B;
 Fri,  8 Aug 2025 12:45:07 +0200 (CEST)
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
X-Inumbo-ID: de2611ae-7444-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754649908;
	bh=brJMRHo/8Tl3e7xMygG9eyiFT2hDjy5O7wtChHaeNYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bpVMEvVV/KjgNPSTx09Y1zAid5VLUpMgHxMncGlh/eIqSnOEbYo/e7pfZcCaLnvMR
	 a4WP/S0JCHnwihLwBpo0WvGkuChuDoTi3adY52UACj4F5WD116oIVmo+wa34Zq++Sp
	 qyMsD/KygsGrVig9ySGURL4Ju5+a5JMr5a6kJVSM=
Message-ID: <20be7c9d-ad67-4157-b03e-18f91534a1cd@ideasonboard.com>
Date: Fri, 8 Aug 2025 13:45:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/25] drm/renesas/rcar-du: Compute dumb-buffer sizes
 with drm_mode_size_dumb()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 geert@linux-m68k.org
References: <20250613090431.127087-1-tzimmermann@suse.de>
 <20250613090431.127087-18-tzimmermann@suse.de>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250613090431.127087-18-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/06/2025 12:00, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch according to hardware requirements.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index 4c8fe83dd610..dd353fb858ef 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_dumb_buffers.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> @@ -407,8 +408,8 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
>  			struct drm_mode_create_dumb *args)
>  {
>  	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
> -	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
>  	unsigned int align;
> +	int ret;
>  
>  	/*
>  	 * The R8A7779 DU requires a 16 pixels pitch alignment as documented,
> @@ -419,7 +420,9 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
>  	else
>  		align = 16 * args->bpp / 8;
>  
> -	args->pitch = roundup(min_pitch, align);
> +	ret = drm_mode_size_dumb(dev, args, align, 0);
> +	if (ret)
> +		return ret;
>  
>  	return drm_gem_dma_dumb_create_internal(file, dev, args);
>  }

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

 Tomi


