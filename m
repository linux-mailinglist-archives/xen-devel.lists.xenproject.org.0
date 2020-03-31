Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3881998F9
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 16:53:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJIDX-0000sp-MO; Tue, 31 Mar 2020 14:50:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dece=5Q=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1jJIDV-0000sk-Se
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 14:50:13 +0000
X-Inumbo-ID: ecdf3ff4-735e-11ea-b58d-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecdf3ff4-735e-11ea-b58d-bc764e2007e4;
 Tue, 31 Mar 2020 14:50:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j17so26266873wru.13
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2020 07:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LThkFwSkZqTw2d4yYtrBRfrpjqvh2S44Ii+brKsEaNw=;
 b=j9eW+kYrODFdfrvu7dy3d7qBefcQklepGBvj9jeR8ukot9h5lwypuGf5uufqC6HRgI
 kOxYY0Gl1d+rsvs3jI2joeQ/K9fw0zLrpKP2ZfW17KXY4+WUk/JSZ8KAUVAnIoYijiSG
 72xe3HjDiRAGweyGBeu0koQ6R6h53GPsoakP+UZ63E0oG2b3gbice2QixK1CP37bWFvF
 nFymoKBWxsY3etNsmAtN0CcDfZOj9AnypWpwdsYX9DdcJZicqd8a+AG3qJ4Xlh7CtbZV
 wpoAEOJD53gMflO5aGS6pi7iX1qHirLV9b3hK64AZ+M80o5vpoCHeuC7oIDhoy097U7j
 YpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LThkFwSkZqTw2d4yYtrBRfrpjqvh2S44Ii+brKsEaNw=;
 b=rQVZTC3kBsYs6TD/7ctEx0rjFIWYc0CLfREcPrbw2mlN107CsKNGWcszGGT+WinUxz
 qGu0y4zUuO9vheA3CORl9rY3Us3pyElMeKYh26oXOEcBapVCfp5TDXk0o2Z4UZsX7bjQ
 hJ1kdH2XKVDqNCdz0w3oVCN7AWbjUAWuReIpKS0M09ypk/t37AV+6xZtueMYX93cVWoT
 EZIOVNEuynQU+uzQvGmfkKt+PbQv8B+jshs+KJJ55uE7x5nj5wnESglYS5eu29rV91gy
 +XyHY86z10QOyPlct9EMNVnp1Bknv9A6hv7A4lOG5a6yX4v80pcOZ9Cf/xAcdzz612g3
 118g==
X-Gm-Message-State: ANhLgQ1ovN0EXopAaGy0rq/zvwfurVH0ey6wCIh8t0zZA4TRsWE86JMv
 Ff22PxbZRQF53sUFYgpeaU4=
X-Google-Smtp-Source: ADFU+vsr3d8+VMK/1DccKZdQKSpk3+U3Tn2Yv0QuaeVmGVHxKuIWc8675z3Jx+k42MOjeg8U4DKKKQ==
X-Received: by 2002:adf:ecc3:: with SMTP id s3mr20158772wro.32.1585666212208; 
 Tue, 31 Mar 2020 07:50:12 -0700 (PDT)
Received: from [192.168.10.4] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id d6sm26595939wrw.10.2020.03.31.07.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2020 07:50:11 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH] drm/xen: fix passing zero to 'PTR_ERR' warning
To: Ding Xiang <dingxiang@cmss.chinamobile.com>,
 oleksandr_andrushchenko@epam.com, airlied@linux.ie, daniel@ffwll.ch
References: <1585562347-30214-1-git-send-email-dingxiang@cmss.chinamobile.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <b4d43b05-8b30-749c-0b60-87b4cdd7b1dd@gmail.com>
Date: Tue, 31 Mar 2020 17:50:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1585562347-30214-1-git-send-email-dingxiang@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 3/30/20 12:59, Ding Xiang wrote:
> Fix a static code checker warning:
>      drivers/gpu/drm/xen/xen_drm_front.c:404 xen_drm_drv_dumb_create()
>      warn: passing zero to 'PTR_ERR'
>
> Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>   drivers/gpu/drm/xen/xen_drm_front.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
> index 4be49c1..3741420 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -401,7 +401,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
>   
>   	obj = xen_drm_front_gem_create(dev, args->size);
>   	if (IS_ERR_OR_NULL(obj)) {
> -		ret = PTR_ERR(obj);
> +		ret = PTR_ERR_OR_ZERO(obj);
>   		goto fail;
>   	}
>   

