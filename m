Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D90A78E9AA
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:41:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593636.926694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeAq-00058E-KC; Thu, 31 Aug 2023 09:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593636.926694; Thu, 31 Aug 2023 09:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeAq-00056K-F1; Thu, 31 Aug 2023 09:41:12 +0000
Received: by outflank-mailman (input) for mailman id 593636;
 Thu, 31 Aug 2023 09:41:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nRSd=EQ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qbeAo-0004zc-L4
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:41:10 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 830bedcd-47e2-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 11:41:08 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-52bca2e8563so710847a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 02:41:08 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 g10-20020aa7c58a000000b005227e53cec2sm588254edq.50.2023.08.31.02.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 02:41:07 -0700 (PDT)
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
X-Inumbo-ID: 830bedcd-47e2-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693474868; x=1694079668; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wtrAuLS2IemVwbQWVwz9e7GBYwn2a8GD3H/IILTsKuQ=;
        b=ySs1xWxzcQxy+gpE5asgjXkouTs4yzO+kZt676rpDe1/2vL79Ww0TxwMlSEc7N10/H
         gj05HiGsWmg8mXruHbxP0YL5uSpimJC6gFLs6LidgCbXqhKFyyvMHRx8+xACFiA3GFZF
         8egZ+JIxtmSXqpd/mtxfaXxMfTNSbFDUzKrLDGQu3vXwZtmGUlGs3cYdlAid9XYt+s/5
         NZ/k/4oxVgE17IuVq4fn/nRH0Yj97M/eMabJY3g2/ub5OPXK/DgUjW9YwTXnDBTSvXzY
         igJzcGea0yQTfj2RqpDzAZix53G3P/iPgyN8TLH4MMaaR5OY6Y36ojjuHDYsh3rW5kOs
         7qkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693474868; x=1694079668;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtrAuLS2IemVwbQWVwz9e7GBYwn2a8GD3H/IILTsKuQ=;
        b=BbnbCQSFgI9kaMy6qy8J/iwwMvTk3fph7UP37jJ3c122ghdP+qIUXqhROhlwGmEeVN
         ezIQCAR+LD5rxfYWprJWZXKIq6xMWArzy9FY/vlwtDla5JCeWH0GTie+dWuPf6F9ni/5
         Jr2OQcF19dMjdzoP4Kpb0XshqFNuxT2PYOknEbFV705tMa94oPZMpJWTHbmNCbD6LVbI
         qjNKJw4LTM0Xh+slgd8LQv7dc6qJV8+xkFIpbu37qxVo/uZiOr/on7w96wCB0THL5t9N
         8jeXLalSjutdKId6Jv8tmLDP9jp2aVRRXc+UFowIe7lpQ8BzBkbKYj7d0XbdAxhvBb4o
         972A==
X-Gm-Message-State: AOJu0Yz9qKLZuEX2XGRX17HN2qAP+NP5fwA+z3Qq+F/i9UWDm8Zu7aOP
	oacr6LDsaaSdpvK1ejvzd3Lx6w==
X-Google-Smtp-Source: AGHT+IG3c1HJMxF4MJNYluefZGxd3hmyWfK9ojUZ7EbwQT0LdoejqO1VhAZhb19uqnff5TwlXBJs/w==
X-Received: by 2002:aa7:c685:0:b0:523:b133:5c7e with SMTP id n5-20020aa7c685000000b00523b1335c7emr4148407edq.1.1693474867879;
        Thu, 31 Aug 2023 02:41:07 -0700 (PDT)
Message-ID: <ef1c5137-f4d4-cb12-c606-ad76f46e4608@linaro.org>
Date: Thu, 31 Aug 2023 11:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [QEMU PATCH v4 05/13] virtio-gpu: Support context init feature
 with virglrenderer
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, ernunes@redhat.com,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Alyssa Ross <hi@alyssa.is>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-6-ray.huang@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230831093252.2461282-6-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/8/23 11:32, Huang Rui wrote:
> Patch "virtio-gpu: CONTEXT_INIT feature" has added the context_init
> feature flags.
> We would like to enable the feature with virglrenderer, so add to create
> virgl renderer context with flags using context_id when valid.
> 
> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
> 
> New patch, result of splitting
> [RFC QEMU PATCH 04/18] virtio-gpu: CONTEXT_INIT feature
> 
>   hw/display/virtio-gpu-virgl.c | 13 +++++++++++--
>   hw/display/virtio-gpu.c       |  2 ++
>   2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 8bb7a2c21f..312953ec16 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>       trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>                                       cc.debug_name);
>   
> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> -                                  cc.debug_name);
> +    if (cc.context_init) {
> +#ifdef HAVE_VIRGL_CONTEXT_INIT
> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> +                                                 cc.context_init,
> +                                                 cc.nlen,
> +                                                 cc.debug_name);
> +        return;
> +#endif

What happens if someone sets the 'context_init' property but virgl
doesn't have virgl_renderer_context_create_with_flags()? Should we
report an error?

> +    }
> +
> +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
>   }
>   
>   static void virgl_cmd_context_destroy(VirtIOGPU *g,
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 3e658f1fef..a66cbd9930 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1506,6 +1506,8 @@ static Property virtio_gpu_properties[] = {
>       DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
>                       VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
>       DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
> +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
> +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   


