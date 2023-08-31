Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAA578EA73
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 12:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593760.926847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbf95-0004hn-Ry; Thu, 31 Aug 2023 10:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593760.926847; Thu, 31 Aug 2023 10:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbf95-0004fq-Oo; Thu, 31 Aug 2023 10:43:27 +0000
Received: by outflank-mailman (input) for mailman id 593760;
 Thu, 31 Aug 2023 10:43:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DT0c=EQ=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qbf94-0004NX-L8
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 10:43:26 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35bb055b-47eb-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 12:43:24 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bc8a2f71eeso4873805ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 03:43:24 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a170902740c00b001bbdd44bbb6sm984888pll.136.2023.08.31.03.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 03:43:22 -0700 (PDT)
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
X-Inumbo-ID: 35bb055b-47eb-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1693478603; x=1694083403; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pthxO9otZ5F1W93I4fM7b6t8TGyUaxxABGXbq13EuGw=;
        b=gPOroCW4qRVBzkrAiSeqzGcQfzPYMLftQS6QjTlVFg+m6xxI021tY9VCQcmb5R9Kzl
         l0qP+5gcnxPnbbOHJT4ObH/KGB8JhyXCZgaTgRR49+C+FBTfAnFazHY7Xwhgx7UrsWOG
         FNLLkTj4Fm9q0NLEGmdiD2wrtY/rqvOt/MhyLCrr8q22iB9AfG51hk9gp7XarGSi/8M6
         3f9NVzK3VNPQJjdqqdKQKfFbgfXFZ0w4xMQkyfJsZli/vLghdb2s0arI7ikS+yr7NRnA
         tAPzerzEbgfnJDZdobREJ8UhjZ4h0zpxhj1aQpTKcckEUDH475Sl59tGUh6iPx3VqpLr
         lHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693478603; x=1694083403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pthxO9otZ5F1W93I4fM7b6t8TGyUaxxABGXbq13EuGw=;
        b=FBHDt4LE+JUiThxvpf/dm/pKkAa/kfnQMx8oPYUAMHR3BVQxmeesIZn2Tmzaq+l7ni
         IXFSdU8u1X4YDBrs7b5JMWY+OByuneysqBGWH3/GyokAb8nfjSRChwVSFqfIw1/gSiwk
         8xpSN/CRiszc3y9LMIr3E6Yl7n4AHRghiaedPAX+E3TzMxTGJ4tG5hjffY2MTPvln5/x
         b8kZZAn9byYENT2838PkssruM5Uj8nBrCdXPFKInUdXkxWZKRY4B3uLSNrAds65ltJOb
         gHsu5nl39rgLhp+ThLU4fczxXFbXpWxEwHakO2hyxcwDa3vP6pa0m7N+OhCUj4vl+sAX
         toNg==
X-Gm-Message-State: AOJu0Yw1307HlFVqaXIQTni1Fu91ejebgjvzIinB0EvHxdZmKBbClV0g
	5tGTpuyPYmLs1h44E/OZF+2hug==
X-Google-Smtp-Source: AGHT+IF61CnqGDOu6EZq+ZgIaumeod7KOlm7Ef1ZjxoEiKfNUFtI0udiwYapvHIpTz8Oekph4Jtnfg==
X-Received: by 2002:a17:902:c086:b0:1c0:6e92:8cc5 with SMTP id j6-20020a170902c08600b001c06e928cc5mr3604644pld.17.1693478603280;
        Thu, 31 Aug 2023 03:43:23 -0700 (PDT)
Message-ID: <fe36e4e1-1198-4da4-b6ee-a6a00a44298a@daynix.com>
Date: Thu, 31 Aug 2023 19:43:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v4 11/13] virtio-gpu: Support Venus capset
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, ernunes@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-12-ray.huang@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230831093252.2461282-12-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/08/31 18:32, Huang Rui wrote:
> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> 
> Add support for the Venus capset, which enables Vulkan support through
> the Venus Vulkan driver for virtio-gpu.
> 
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>   hw/display/virtio-gpu-virgl.c               | 21 +++++++++++++++++----
>   include/standard-headers/linux/virtio_gpu.h |  2 ++
>   2 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 1a996a08fc..83cd8c8fd0 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -437,6 +437,11 @@ static void virgl_cmd_get_capset_info(VirtIOGPU *g,
>           virgl_renderer_get_cap_set(resp.capset_id,
>                                      &resp.capset_max_version,
>                                      &resp.capset_max_size);
> +    } else if (info.capset_index == 2) {
> +        resp.capset_id = VIRTIO_GPU_CAPSET_VENUS;
> +        virgl_renderer_get_cap_set(resp.capset_id,
> +                                   &resp.capset_max_version,
> +                                   &resp.capset_max_size);
>       } else {
>           resp.capset_max_version = 0;
>           resp.capset_max_size = 0;
> @@ -901,10 +906,18 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
>   
>   int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g)
>   {
> -    uint32_t capset2_max_ver, capset2_max_size;
> +    uint32_t capset2_max_ver, capset2_max_size, num_capsets;
> +    num_capsets = 1;
> +
>       virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VIRGL2,
> -                              &capset2_max_ver,
> -                              &capset2_max_size);
> +                               &capset2_max_ver,
> +                               &capset2_max_size);
> +    num_capsets += capset2_max_ver ? 1 : 0;
> +
> +    virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VENUS,
> +                               &capset2_max_ver,
> +                               &capset2_max_size);
> +    num_capsets += capset2_max_size ? 1 : 0;
>   
> -    return capset2_max_ver ? 2 : 1;
> +    return num_capsets;
>   }
> diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
> index 2da48d3d4c..2db643ed8f 100644
> --- a/include/standard-headers/linux/virtio_gpu.h
> +++ b/include/standard-headers/linux/virtio_gpu.h
> @@ -309,6 +309,8 @@ struct virtio_gpu_cmd_submit {
>   
>   #define VIRTIO_GPU_CAPSET_VIRGL 1
>   #define VIRTIO_GPU_CAPSET_VIRGL2 2
> +/* 3 is reserved for gfxstream */
> +#define VIRTIO_GPU_CAPSET_VENUS 4

This file is synced with scripts/update-linux-headers.sh and should not 
be modified.

>   
>   /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
>   struct virtio_gpu_get_capset_info {

