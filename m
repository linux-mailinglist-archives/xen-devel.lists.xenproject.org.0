Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDE36D77D7
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 11:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518347.804781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjzAs-0006fH-O8; Wed, 05 Apr 2023 09:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518347.804781; Wed, 05 Apr 2023 09:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjzAs-0006dY-L4; Wed, 05 Apr 2023 09:11:26 +0000
Received: by outflank-mailman (input) for mailman id 518347;
 Wed, 05 Apr 2023 09:11:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mHoi=74=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1pjzAr-0006dR-Mw
 for xen-devel@lists.xen.org; Wed, 05 Apr 2023 09:11:25 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d51b8abb-d391-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 11:11:22 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id d17so35434249wrb.11
 for <xen-devel@lists.xen.org>; Wed, 05 Apr 2023 02:11:21 -0700 (PDT)
Received: from [192.168.0.106] ([91.123.150.38])
 by smtp.gmail.com with ESMTPSA id
 u17-20020adfed51000000b002c6e8af1037sm14385616wro.104.2023.04.05.02.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 02:11:20 -0700 (PDT)
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
X-Inumbo-ID: d51b8abb-d391-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680685881;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gRLOiGbueskxaYnwpqydq+rM10NCqVGbvjWXD3gvn6E=;
        b=G2elS4ZYo1kgEMMcjJIhFHe/VvAfXmuTV4s89NwHNjE6m9A+6bvEvkm8YOybg5S59j
         +/VR0nxbNt5OV3tJhTq6fB3ImMahLMTA2BJQJRSnvH+aAY7yUB98kItFD0jHtNtamUqz
         3nwryQ72vjbrwPNnWmLDZtSk9ttqot/Q3E5AxOorOkYZ/G9dl592HMBp0fasowjNg2+v
         ONjsu+JmrYYtX0XO8GUIuWg3QaUEhfX2Fe/w4gkIbRlAV2hcyljW7K3GCLDwLXpJ8EXt
         6jlseYTxw6Q1GIWxuYSr/n8MsGiDLeguYXyy++qWraM7x47tXfS943MZREjSIXdDFxWs
         tG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680685881;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gRLOiGbueskxaYnwpqydq+rM10NCqVGbvjWXD3gvn6E=;
        b=7mMw/pglvxN0NgNES+0esaG7kEcQxjFpT2McME1nwfpR3PE0UQglKvIuZ0gEUbiyGt
         kxBnG6NVyqOq/3VhRZ+r8FoIK/Qdf/JbK0MurDBYDGyYf4uCeZIjzM3bL8wGGx1UiGvz
         St7y80KiBD7FqbLdKvkDCnQiqPPA5Y+HcA+neHKg+nEWaZ+Gr3X3MW+xnyXcL7f3O6iw
         JrHb6vuMgnYXF1OXiJxNRAa8yp1+1i+7RXPBOk7vdmKJAerjjOMaptH/OGUkJPVUdRV0
         fbyyISvJOoKPhjRSnCKIjHqRKYuMZqBILqCazsDtG03GzPtDDBllAvEgK7SsyOlH0J46
         1Anw==
X-Gm-Message-State: AAQBX9fke5OmJQhJ0J7Hg7Opqhiul7Zc5GH86Nt8jNYw8dfzOlEg/Qfb
	Mfmjuaeb+rYIKWs+5AfcB6E=
X-Google-Smtp-Source: AKy350boAjHuIRohqBGVvG15oxrCQ5hHEJXX3ihgms29Tggf0EMnE5y29T4h/k/F2llty9g8UQTbhg==
X-Received: by 2002:adf:fe8e:0:b0:2c5:4c9d:2dab with SMTP id l14-20020adffe8e000000b002c54c9d2dabmr1315099wrr.10.1680685881035;
        Wed, 05 Apr 2023 02:11:21 -0700 (PDT)
Message-ID: <25c3cc19-e32d-6ced-2853-d1f78e3a476b@gmail.com>
Date: Wed, 5 Apr 2023 12:11:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V2 2/2] libxl: fix matching of generic virtio device
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xen.org,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
 Erik Schilling <erik.schilling@linaro.org>
References: <c5d2ab978255ca84197c980cbfb9a504e7c625f8.1680653504.git.viresh.kumar@linaro.org>
 <62f2603d8b3fba1efb236063a0819fb95285b0ae.1680653504.git.viresh.kumar@linaro.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <62f2603d8b3fba1efb236063a0819fb95285b0ae.1680653504.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05.04.23 03:12, Viresh Kumar wrote:


Hello Viresh

> The strings won't be an exact match, as we are only looking to match the
> prefix here, i.e. "virtio,device". This is already done properly in
> libxl_virtio.c file, lets do the same here too.
> 
> Fixes: 43ba5202e2ee ("libxl: add support for generic virtio device")
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V1->V2: Add the missing fixes tag.

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

> 
>   tools/libs/light/libxl_arm.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index ddc7b2a15975..97c80d7ed0fa 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1033,10 +1033,14 @@ static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
>       } else if (!strcmp(type, VIRTIO_DEVICE_TYPE_GPIO)) {
>           res = make_virtio_mmio_node_gpio(gc, fdt);
>           if (res) return res;
> -    } else if (strcmp(type, VIRTIO_DEVICE_TYPE_GENERIC)) {
> -        /* Doesn't match generic virtio device */
> -        LOG(ERROR, "Invalid type for virtio device: %s", type);
> -        return -EINVAL;
> +    } else {
> +        int len = sizeof(VIRTIO_DEVICE_TYPE_GENERIC) - 1;
> +
> +        if (strncmp(type, VIRTIO_DEVICE_TYPE_GENERIC, len)) {
> +            /* Doesn't match generic virtio device */
> +            LOG(ERROR, "Invalid type for virtio device: %s", type);
> +            return -EINVAL;
> +        }
>       }
>   
>       return fdt_end_node(fdt);

