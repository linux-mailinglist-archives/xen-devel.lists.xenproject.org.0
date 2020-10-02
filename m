Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AF028101A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 11:48:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1778.5458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHfe-0007ue-1g; Fri, 02 Oct 2020 09:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1778.5458; Fri, 02 Oct 2020 09:48:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHfd-0007u5-Si; Fri, 02 Oct 2020 09:48:09 +0000
Received: by outflank-mailman (input) for mailman id 1778;
 Fri, 02 Oct 2020 09:48:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z+Ma=DJ=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1kOHfc-0007tg-0L
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:48:08 +0000
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc68222b-8951-456d-8e5e-6d0f0603b85d;
 Fri, 02 Oct 2020 09:48:05 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x14so1055918wrl.12
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 02:48:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k8sm1015650wrl.42.2020.10.02.02.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 02:48:03 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z+Ma=DJ=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
	id 1kOHfc-0007tg-0L
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:48:08 +0000
X-Inumbo-ID: fc68222b-8951-456d-8e5e-6d0f0603b85d
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fc68222b-8951-456d-8e5e-6d0f0603b85d;
	Fri, 02 Oct 2020 09:48:05 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x14so1055918wrl.12
        for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 02:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XBKf5rCOPo4NoQKS2bCbn6OHpqMgKghSnuzncLMaEsg=;
        b=NnPhOIiGXFfvJWiXpwMfYCrlYJj3jSqwhM3Fr7FAFgDtN8+LWpUPVsY9CPqHheoz3s
         duOjN3dl7KGdJpPoH/Rn+jfMpp1zUc3mpthUjoLgdoNEYm7Fr4xKD3gS0xfEr0+XOfv6
         XtSRuu65opavt6S+qKQAVPJTls41fPewz/rXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XBKf5rCOPo4NoQKS2bCbn6OHpqMgKghSnuzncLMaEsg=;
        b=bjwS1PUB2j6XcjWj8NXAyg/Jiakapp8/GZZhqN+tkJyt926RKTqi2oEDcQ6XbLBQ/L
         vWecOpIBZ1UYjWFlTl82AXj5PeQLYXbynrBSxq/bkBsqZ5HrOiTjPMBPFnJqbLVNudRg
         dq00K3+EILirgvKDsrPRwc42MTswNHIWVFm3cEKpGK28X596PH0bX05mrmgPwu3mg1sz
         xfD4W02OHAlnprZIbIvmUTMt6Sd+on9pmY0iE1EqJPdrI+kkYaIR2hBZBXREEipY/yV5
         Npz7Ve4Bzq12xnz+vf7ckxzVJi+KK/GRfnBMzwStmyj0XImtg1iTQ/IxxA7pTCgmVM8j
         7oZg==
X-Gm-Message-State: AOAM533+5Gvu7S3dBFR8oraXHMYAq3YJP5/EXeuho/EAOgiGhjyMAtYi
	wTHJqfvqgbpd3SMk3Mn1380qDw==
X-Google-Smtp-Source: ABdhPJwvtlXjY3abDVfehLG+NbtTw4ENbbSxjUqiw5J1WQgeZzduYuia7fGlp8u2Z6fywLN6MoeKFw==
X-Received: by 2002:adf:fed1:: with SMTP id q17mr1966851wrs.85.1601632084874;
        Fri, 02 Oct 2020 02:48:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id k8sm1015650wrl.42.2020.10.02.02.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 02:48:03 -0700 (PDT)
Date: Fri, 2 Oct 2020 11:48:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
	daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
	christian.koenig@amd.com, kraxel@redhat.com, l.stach@pengutronix.de,
	linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
	inki.dae@samsung.com, jy0922.shim@samsung.com,
	sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
	krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com,
	robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
	alyssa.rosenzweig@collabora.com, hjc@rock-chips.com,
	heiko@sntech.de, hdegoede@redhat.com, sean@poorly.run,
	eric@anholt.net, oleksandr_andrushchenko@epam.com,
	ray.huang@amd.com, sumit.semwal@linaro.org,
	emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.com,
	linus.walleij@linaro.org, melissa.srw@gmail.com,
	chris@chris-wilson.co.uk, miaoqinglang@huawei.com,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 1/7] drm/vram-helper: Remove invariant parameters from
 internal kmap function
Message-ID: <20201002094800.GG438822@phenom.ffwll.local>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929151437.19717-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 

On Tue, Sep 29, 2020 at 05:14:31PM +0200, Thomas Zimmermann wrote:
> The parameters map and is_iomem are always of the same value. Removed them
> to prepares the function for conversion to struct dma_buf_map.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 3fe4b326e18e..256b346664f2 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -382,16 +382,16 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
>  }
>  EXPORT_SYMBOL(drm_gem_vram_unpin);
>  
> -static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
> -				      bool map, bool *is_iomem)
> +static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo)
>  {
>  	int ret;
>  	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
> +	bool is_iomem;
>  
>  	if (gbo->kmap_use_count > 0)
>  		goto out;
>  
> -	if (kmap->virtual || !map)
> +	if (kmap->virtual)
>  		goto out;
>  
>  	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, kmap);
> @@ -399,15 +399,10 @@ static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
>  		return ERR_PTR(ret);
>  
>  out:
> -	if (!kmap->virtual) {
> -		if (is_iomem)
> -			*is_iomem = false;
> +	if (!kmap->virtual)
>  		return NULL; /* not mapped; don't increment ref */
> -	}
>  	++gbo->kmap_use_count;
> -	if (is_iomem)
> -		return ttm_kmap_obj_virtual(kmap, is_iomem);
> -	return kmap->virtual;
> +	return ttm_kmap_obj_virtual(kmap, &is_iomem);
>  }
>  
>  static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
> @@ -452,7 +447,7 @@ void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo)
>  	ret = drm_gem_vram_pin_locked(gbo, 0);
>  	if (ret)
>  		goto err_ttm_bo_unreserve;
> -	base = drm_gem_vram_kmap_locked(gbo, true, NULL);
> +	base = drm_gem_vram_kmap_locked(gbo);
>  	if (IS_ERR(base)) {
>  		ret = PTR_ERR(base);
>  		goto err_drm_gem_vram_unpin_locked;
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

