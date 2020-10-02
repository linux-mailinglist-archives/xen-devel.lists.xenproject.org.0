Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D359281B0C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 20:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2300.6884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOQ4A-0008KC-Op; Fri, 02 Oct 2020 18:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2300.6884; Fri, 02 Oct 2020 18:46:02 +0000
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
	id 1kOQ4A-0008Jn-KK; Fri, 02 Oct 2020 18:46:02 +0000
Received: by outflank-mailman (input) for mailman id 2300;
 Fri, 02 Oct 2020 18:46:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z+Ma=DJ=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1kOQ49-0008Jh-U1
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 18:46:01 +0000
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15ce7678-8595-47bb-8de5-4f5116d095f0;
 Fri, 02 Oct 2020 18:46:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t10so2874427wrv.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 11:46:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n2sm2937452wma.29.2020.10.02.11.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 11:45:57 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z+Ma=DJ=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
	id 1kOQ49-0008Jh-U1
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 18:46:01 +0000
X-Inumbo-ID: 15ce7678-8595-47bb-8de5-4f5116d095f0
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 15ce7678-8595-47bb-8de5-4f5116d095f0;
	Fri, 02 Oct 2020 18:46:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t10so2874427wrv.1
        for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 11:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cqLPfUuqb60ZIVoOQ31hnraU/Ifr39O5/ULDkN9IWmw=;
        b=LhoHpieZ6b1yu3Bgv5UVyYwE5gEJCucfXpQtCsua7dxm7nPU5GPxUoM22UNQQ6v2CK
         k0Y2QqxCtl6jlPSAgvR23+rIu6KvQsYlEl3KTS7hhk4KmBbGsS7srplNima8l2683HV3
         M+RegCjSI+WIRGmRnHJIv+DYHNTbkSdc4/ZqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cqLPfUuqb60ZIVoOQ31hnraU/Ifr39O5/ULDkN9IWmw=;
        b=Jc1+4nCBo5FjJTpGThV4qZJ49j1stclHysExxv06YHfLujHFTghSnaVt45sydp1Amh
         8TCoBuRzWVoggND7Q/fBq8yFayCxD+3uxxfIGzBcFIfUGnBRLH+Qs+USuNfhbCiqrY/Q
         Tqahlk0L+J41Pz0afo1csTmCGbS9/nIzz85Czmn5nQprKLy7H1TUUBuEyFe2br8nUuPZ
         PT0Z53s/5iACgj9pnK1wHiTJiQYQ+rMWiVsKs/mX8r5QwXpaA1ogUMOREmlRhj/S53lP
         Jp3AoExXsmMU+/13VL6Sc6z0D7T/FrswjI6VT9oQpzelEbTke+P1nCQ+ZcRWMw15v8Hu
         Snmg==
X-Gm-Message-State: AOAM532MC78XmKTVzynSnZz2Zyvxs5acQ5iwM78MPJNPAzi8qgcL4BrG
	AbR6BAkkK9Gt8NZr8xallMnJJg==
X-Google-Smtp-Source: ABdhPJzgHPhBsD8FZtMDQrfMIjGL4qmZj/8xNAuAHXm+0qz5n2h6pVB3S7OCKNZbK4qjctoXq1cGGA==
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr4528517wrq.297.1601664359823;
        Fri, 02 Oct 2020 11:45:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n2sm2937452wma.29.2020.10.02.11.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 11:45:57 -0700 (PDT)
Date: Fri, 2 Oct 2020 20:45:54 +0200
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
Subject: Re: [PATCH v3 7/7] drm/todo: Update entries around struct dma_buf_map
Message-ID: <20201002184554.GN438822@phenom.ffwll.local>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200929151437.19717-8-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 

On Tue, Sep 29, 2020 at 05:14:37PM +0200, Thomas Zimmermann wrote:
> Instances of struct dma_buf_map should be useful throughout DRM's
> memory management code. Furthermore, several drivers can now use
> generic fbdev emulation.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/todo.rst | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 3751ac976c3e..023626c1837b 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -197,8 +197,10 @@ Convert drivers to use drm_fbdev_generic_setup()
>  ------------------------------------------------
>  
>  Most drivers can use drm_fbdev_generic_setup(). Driver have to implement
> -atomic modesetting and GEM vmap support. Current generic fbdev emulation
> -expects the framebuffer in system memory (or system-like memory).
> +atomic modesetting and GEM vmap support. Historically, generic fbdev emulation
> +expected the framebuffer in system memory or system-like memory. By employing
> +struct dma_buf_map, drivers with frambuffers in I/O memory can be supported
> +as well.
>  
>  Contact: Maintainer of the driver you plan to convert
>  
> @@ -446,6 +448,24 @@ Contact: Ville Syrjälä, Daniel Vetter
>  
>  Level: Intermediate
>  
> +Use struct dma_buf_map throughout codebase
> +------------------------------------------
> +
> +Pointers to shared device memory are stored in struct dma_buf_map. Each
> +instance knows whether it refers to system or I/O memory. Most of the DRM-wide
> +interface have been converted to use struct dma_buf_map, but implementations
> +often still use raw pointers.
> +
> +The task is to use struct dma_buf_map where it makes sense.
> +
> +* Memory managers should use struct dma_buf_map for dma-buf-imported buffers.
> +* TTM might benefit from using struct dma_buf_map internally.
> +* Framebuffer copying and blitting helpers should operate on struct dma_buf_map.
> +
> +Contact: Thomas Zimmermann <tzimmermann@suse.de>, Christian König, Daniel Vetter
> +
> +Level: Intermediate
> +
>  
>  Core refactorings
>  =================
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

