Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD3D44BF07
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 11:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224246.387435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkl84-0001za-L0; Wed, 10 Nov 2021 10:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224246.387435; Wed, 10 Nov 2021 10:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkl84-0001x1-I1; Wed, 10 Nov 2021 10:46:56 +0000
Received: by outflank-mailman (input) for mailman id 224246;
 Wed, 10 Nov 2021 10:46:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z30i=P5=ffwll.ch=daniel@srs-se1.protection.inumbo.net>)
 id 1mkl81-0001wv-FL
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 10:46:54 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 836dd9d7-4213-11ec-9787-a32c541c8605;
 Wed, 10 Nov 2021 11:46:52 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id o8so8794616edc.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Nov 2021 02:46:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z10sm14094307edd.12.2021.11.10.02.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 02:46:50 -0800 (PST)
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
X-Inumbo-ID: 836dd9d7-4213-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CJ8BKvr5XUSO/Vo4sS7QvREYUZiUN+4dM8bteUPX/YU=;
        b=a5PDaYRSHhLE0B/0FQ+MlW7rePX4lX8rMFt04k9jy714oeV6rCydngg+4chiEab4BB
         0et1lR5054ugeHjiqzoRhGkDg1UoJWAzmwRFvIlBA+ugUkN39qs5cm5is5LIv5WH2xEf
         oEhqQbxoFXx4fNzwMrzHIsDeA0puwKDSYP3nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CJ8BKvr5XUSO/Vo4sS7QvREYUZiUN+4dM8bteUPX/YU=;
        b=L/fC4b2Fccbtzb+yoCurDNoXsrpk+PQO6n+9scgUK6rXehllN1Nee90G0NOKL/K0zk
         g5wdRU9cQfp5/19KKe/GH3FNDiGx4plpCJQMGruB23wrvutnI7tWKAyh1Qy5iNXCnhn4
         ZHBdUS6naSn0oa1vZmp0GrgPPr6fM8zvru0HwYdHhPTlx/Ae0QO1OEHXfubCZCUtWRvr
         dnbtpKscx9m2QJLgaP6aIWZjlW+WgKP3Gz8JNRJzdNvZU2ku6gjM784HosEaJkNjbZM1
         /Z0zBSgVzuWvKgb715FPTcKNwSa+phEdndoVjG98nHMrAU3mBjKjMUDElP5UcfV2P81j
         vd6Q==
X-Gm-Message-State: AOAM532ZJoknFBdjmHgDk9JVJFAGRHMYeeba/sOO0sy9pf8VtA7i2bhB
	+GEX7qQR0eXOYN/DN0b6rRCcHw==
X-Google-Smtp-Source: ABdhPJzex3EJLJxKesbpcXVhuXhXz8mKsgkAvORtmUcskNu2IAPYg8LWXRVSpkQDC+igoNaKseVJbA==
X-Received: by 2002:aa7:d546:: with SMTP id u6mr20545346edr.311.1636541210512;
        Wed, 10 Nov 2021 02:46:50 -0800 (PST)
Date: Wed, 10 Nov 2021 11:46:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com,
	sw0312.kim@samsung.com, kyungmin.park@samsung.com,
	krzysztof.kozlowski@canonical.com, oleksandr_andrushchenko@epam.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/3] drm: Update documentation and TODO of gem_prime_mmap
 hook
Message-ID: <YYujGLFf+spiXMil@phenom.ffwll.local>
References: <20211108102846.309-1-tzimmermann@suse.de>
 <20211108102846.309-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108102846.309-4-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 

On Mon, Nov 08, 2021 at 11:28:46AM +0100, Thomas Zimmermann wrote:
> The hook gem_prime_mmap in struct drm_driver is deprecated. Document
> the new requirements.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/todo.rst | 11 -----------
>  include/drm/drm_drv.h      | 11 +++++++----
>  2 files changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 60d1d7ee0719..6593c4c4006e 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -268,17 +268,6 @@ Contact: Daniel Vetter
>  
>  Level: Intermediate
>  
> -Clean up mmap forwarding
> -------------------------
> -
> -A lot of drivers forward gem mmap calls to dma-buf mmap for imported buffers.
> -And also a lot of them forward dma-buf mmap to the gem mmap implementations.
> -There's drm_gem_prime_mmap() for this now, but still needs to be rolled out.
> -
> -Contact: Daniel Vetter
> -
> -Level: Intermediate
> -
>  Generic fbdev defio support
>  ---------------------------
>  
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 0cd95953cdf5..a84eb4028e5b 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -345,11 +345,14 @@ struct drm_driver {
>  	 * mmap hook for GEM drivers, used to implement dma-buf mmap in the
>  	 * PRIME helpers.
>  	 *
> -	 * FIXME: There's way too much duplication going on here, and also moved
> -	 * to &drm_gem_object_funcs.
> +	 * This hook only exists for historical reasons. Drivers must use
> +	 * drm_gem_prime_mmap() to implement it.
> +	 *
> +	 * FIXME: Convert all drivers to implement mmap in struct
> +	 * &drm_gem_object_funcs and inline drm_gem_prime_mmap() into
> +	 * its callers. This hook should be removed afterwards.

I think at least i915 has different semantics between dma-buf mmap and gem
mmap in some cases, so this might be tricky to achieve. But I think
everywhere else this should be solid.
-Daniel

>  	 */
> -	int (*gem_prime_mmap)(struct drm_gem_object *obj,
> -				struct vm_area_struct *vma);
> +	int (*gem_prime_mmap)(struct drm_gem_object *obj, struct vm_area_struct *vma);
>  
>  	/**
>  	 * @dumb_create:
> -- 
> 2.33.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

