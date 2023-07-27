Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F18764558
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 07:16:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570781.892902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOtLD-0008Fd-Lh; Thu, 27 Jul 2023 05:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570781.892902; Thu, 27 Jul 2023 05:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOtLD-0008Cu-II; Thu, 27 Jul 2023 05:15:11 +0000
Received: by outflank-mailman (input) for mailman id 570781;
 Thu, 27 Jul 2023 05:15:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kK8p=DN=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qOtLB-0008Co-Bn
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 05:15:09 +0000
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c7702fa-2c3c-11ee-b246-6b7b168915f2;
 Thu, 27 Jul 2023 07:15:07 +0200 (CEST)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-686b643df5dso440794b3a.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 22:15:07 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 iw12-20020a170903044c00b001bbbc655ca1sm497667plb.219.2023.07.26.22.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 22:15:04 -0700 (PDT)
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
X-Inumbo-ID: 8c7702fa-2c3c-11ee-b246-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690434905; x=1691039705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IqB43PdmbcTw3ufSyQ43JzmiXWlC5qoPqlYdpi0HhWU=;
        b=hf7QWxp3ar4MlFB5JLFFXxpezzS0Ih4ly9DH1KLy2sZujvYzui17Pqr4iInmPdd+AW
         Rbh2paRnkEd8YcKkwWNZfQQMPpgYP+w+SCXYy4Dq92bKc+BEgIV53cRx+pp/85GumokE
         ny0cKtGJanZnZL/9UufrTRr7GEG7w277pm3qux9CbNlnbsDGbQx3vn8YZEWH6lRlfQ+c
         bPgjjmA26ZfgpqmUunQyhCfOVa7HNQS2gvz4AXW2dW7NjhthSp3VIxdHn4yFth2kmWxR
         bhQrMZjgWuFztLyML9KA2xlIy6cp4TCuExVhbKAV45BLDnGflxGzdh0ogoJP+UJdtoO1
         0GTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690434905; x=1691039705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqB43PdmbcTw3ufSyQ43JzmiXWlC5qoPqlYdpi0HhWU=;
        b=SxFo+XQkB6xGAgd9BYiOnP2xAueeGvgRnlpVHqrakbZhnMD103DX0aFWPegOu5qJ5D
         2KVTqBbW5040SWZOWb06Zum8n5Jgijl4CZivuQXo8+kaKjl3gkxnDjvvmoo6DJCHa+sQ
         fyPy2U5Ua0Nkhz4Ch7CeHm5tO4/imhtjaZCqfJq6fjmcOQZETrB7RMzKUERp+9VgilcZ
         mUmK+mXqpO/pxPyt8uCbGYPZ571gPPs5d98OIrfqM6gqEmA+cR4+Yv4JjivXWF3X23kR
         GQDDXrrPSgqhHa56QhN0DpjOYNB226GT5s0EpuagcEoWK4GMzxjCiS3I9bqyqdT2yl3P
         Rmag==
X-Gm-Message-State: ABy/qLYI2ciySMBrQM2n+AS87gRqnVvDPSVEeG9V/qsJK4V2Xpt2peDN
	KixpfG/X1mvqZ/qsrL1SzttbAw==
X-Google-Smtp-Source: APBJJlEMiFAtgaJQTG65kCCrdS97rmEW1MfWMKFi0qwBcIbLxvgB5x3ZMnkyt+g9hsEdIjt2iXVs+g==
X-Received: by 2002:a05:6a20:3d2a:b0:133:901:fe55 with SMTP id y42-20020a056a203d2a00b001330901fe55mr4402761pzi.38.1690434905485;
        Wed, 26 Jul 2023 22:15:05 -0700 (PDT)
Date: Thu, 27 Jul 2023 10:45:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libxl: Add missing libxl__virtio_devtype to
 device_type_tbl array
Message-ID: <20230727051502.wtwi3k5ojhjduhql@vireshk-i7>
References: <20230726141459.985463-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726141459.985463-1-olekstysh@gmail.com>

On 26-07-23, 17:14, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Without it being present it won't be possible to use some
> libxl__device_type's callbacks for virtio devices as the common code
> can only invoke these callbacks (by dereferencing a pointer) for valid
> libxl__device_type's elements when iterating over device_type_tbl[].
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  tools/libs/light/libxl_create.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index 393c535579..c91059d713 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -1887,6 +1887,7 @@ const libxl__device_type *device_type_tbl[] = {
>      &libxl__dtdev_devtype,
>      &libxl__vdispl_devtype,
>      &libxl__vsnd_devtype,
> +    &libxl__virtio_devtype,
>      NULL
>  };

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

