Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FB7ADCD1F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 15:27:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018220.1395138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRWKY-0001rK-Hd; Tue, 17 Jun 2025 13:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018220.1395138; Tue, 17 Jun 2025 13:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRWKY-0001ot-D1; Tue, 17 Jun 2025 13:26:26 +0000
Received: by outflank-mailman (input) for mailman id 1018220;
 Tue, 17 Jun 2025 12:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jj13=ZA=gmail.com=daeinki@srs-se1.protection.inumbo.net>)
 id 1uRVun-0006vG-V3
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 12:59:50 +0000
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [2607:f8b0:4864:20::a32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1ee0b54-4b7a-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 14:59:47 +0200 (CEST)
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-5314b486207so947097e0c.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 05:59:47 -0700 (PDT)
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
X-Inumbo-ID: f1ee0b54-4b7a-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165186; x=1750769986; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJGnTu2P8k2zWLpKT9gQ0C6Ynav6qAdbDTnXBuG6SzE=;
        b=cdGaYDQPmb2t4AfUZE3geWdL5Q/R9OI20zInszY62oC4KfE7yTv3n3b38ZSLHq9SCy
         HdmPLsovITj7qkqNAQvZKE5yaWfORhV4AqinQCGAFDL1NI0rWZOQMh+QkWdBqeIdlhB2
         5lyIToqV7HjB4MIrkxaeKrOYgjk4id22ljysU3pfYnsk6h3/wDRzcp4ZPNoGzfCcW5a6
         oI3hG/OsHzCe26PSMqo2rzOxUbkN5jm3qmhICeG2NrGjxYBPF+V/AEc3C8urqfscnJDR
         RduJeVG9ao5iV7pQBQSkDOY/WpyvustdiYccJ6haHbbIklPe2lIROc1s5NiJtppWuJkf
         8pMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165186; x=1750769986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJGnTu2P8k2zWLpKT9gQ0C6Ynav6qAdbDTnXBuG6SzE=;
        b=LZKwNalAwsi7lLBABwaNu0BmuT0LrqLn647rURC/jBK5ujBOsrsq0u9T/aKaI1vlpJ
         2YaHfpZjaKRAtWtw6mhYJIBokf9HB2rMBlC+lnBfE/QAIkgtW9LoX25mr0SJw77OcH0+
         pIQl8QvUAA2Y9dTYVFJPC3frrSeL6UALCYI4+BfnxU8gppoQAozRFGQyPZfOvkZbbktY
         /iO4qJVm2ZV3WsZgcYJtmeN/Lguar8CXkETfckvlMfbcb/hsVjcluiH3wvlqQCVzI3iQ
         GT8h9cWDqbZ5jjPhpiV4K4bAXRvyWMUFVGA+ihjzC1P5ZF/bntq+IAfm3rStV3nnxcW9
         2H9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYBkKNXS+XEh8c8FHOrXVigkaHsTvz0uaqf7xQ0zx6jXAb4Cs1g8Ppx2jsXvSQoLisGeO/8AB1VE8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqRPsJKyYP/sP0Wyf4ZOa2WtMzpvwaL7zCpuIRp8UF0dfvsH8F
	LcNU/6l2PNbrKty5GnwZRR7EjkcqqIfyVtMkSXtAl9KVAangrwk6Ac12rdLXUARsDn/vFCYUc5P
	3XvZdfRDrbfXqGMMevy59lqQDb1qNjVU=
X-Gm-Gg: ASbGnctGKo+Tc6RBVX+TB4O83RW5XAKeURb3gkVnxbsd4KqyHpz1rlKiJhc+Yjay7dF
	0cTmHsQ2QwvWgERQYpXEfv6uJOPxRNz1kiaziYBFosO1hiGt02uoIi1j9xB7Y27CVlkw5yyHlDK
	pjhroSPTML93Isb2DKQzmXGjoU+I6UJtSsKperBduVkA==
X-Google-Smtp-Source: AGHT+IFyDxk9ofOoSE1jUdDwuXC6uj68bPw86gFHeN0xbFulbam2J1M/auQRgbuNa5uXdcywAXE8tSUc/+x2hYqgo2M=
X-Received: by 2002:a05:6122:4586:b0:52f:47de:3700 with SMTP id
 71dfb90a1353d-53149677e4amr8402312e0c.5.1750165185838; Tue, 17 Jun 2025
 05:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250613090431.127087-1-tzimmermann@suse.de> <20250613090431.127087-8-tzimmermann@suse.de>
In-Reply-To: <20250613090431.127087-8-tzimmermann@suse.de>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 17 Jun 2025 21:59:08 +0900
X-Gm-Features: Ac12FXy1YqAOwtksyoMPU_mcRXzK8GOxRWP5F_To6gWRQ1V5y95DviShSwJIG6g
Message-ID: <CAAQKjZOiz3Z42N_GEPzqU=CCfim+Z7oCuyxuji6Guj_dKYsimw@mail.gmail.com>
Subject: Re: [PATCH v5 07/25] drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, geert@linux-m68k.org, 
	tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	xen-devel@lists.xenproject.org, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2025=EB=85=84 6=EC=9B=94 13=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 6:05, T=
homas Zimmermann <tzimmermann@suse.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. No alignment required.
>

Acked-by : Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gem.c
> index 4787fee4696f..ffa1c02b4b1e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -11,6 +11,7 @@
>  #include <linux/shmem_fs.h>
>  #include <linux/module.h>
>
> +#include <drm/drm_dumb_buffers.h>
>  #include <drm/drm_prime.h>
>  #include <drm/drm_vma_manager.h>
>  #include <drm/exynos_drm.h>
> @@ -330,15 +331,16 @@ int exynos_drm_gem_dumb_create(struct drm_file *fil=
e_priv,
>         unsigned int flags;
>         int ret;
>
> +       ret =3D drm_mode_size_dumb(dev, args, 0, 0);
> +       if (ret)
> +               return ret;
> +
>         /*
>          * allocate memory to be used for framebuffer.
>          * - this callback would be called by user application
>          *      with DRM_IOCTL_MODE_CREATE_DUMB command.
>          */
>
> -       args->pitch =3D args->width * ((args->bpp + 7) / 8);
> -       args->size =3D args->pitch * args->height;
> -
>         if (is_drm_iommu_supported(dev))
>                 flags =3D EXYNOS_BO_NONCONTIG | EXYNOS_BO_WC;
>         else
> --
> 2.49.0
>
>

