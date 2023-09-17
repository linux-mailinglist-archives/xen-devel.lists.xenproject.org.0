Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A447A33E0
	for <lists+xen-devel@lfdr.de>; Sun, 17 Sep 2023 07:49:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603671.940741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhkev-0006TF-RY; Sun, 17 Sep 2023 05:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603671.940741; Sun, 17 Sep 2023 05:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhkev-0006QL-O8; Sun, 17 Sep 2023 05:49:29 +0000
Received: by outflank-mailman (input) for mailman id 603671;
 Sun, 17 Sep 2023 05:49:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IbiU=FB=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qhkev-0006QF-0b
 for xen-devel@lists.xenproject.org; Sun, 17 Sep 2023 05:49:29 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f64130bc-551d-11ee-8788-cb3800f73035;
 Sun, 17 Sep 2023 07:49:27 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c4707b1031so3193245ad.2
 for <xen-devel@lists.xenproject.org>; Sat, 16 Sep 2023 22:49:27 -0700 (PDT)
Received: from [157.82.205.33] ([157.82.205.33])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a170902e88600b001c413e216fbsm5716616plg.226.2023.09.16.22.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Sep 2023 22:49:25 -0700 (PDT)
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
X-Inumbo-ID: f64130bc-551d-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694929766; x=1695534566; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ftBbZUD9qjL5k9CoM3Lz+rdiUqAl7dEn7UYob6Ef6U8=;
        b=QVv5w1rR87xlZNml5GYqECknQK+f7CZ1hB27UfkP1TYocfqf1XAgr3clBrvsXVoBgL
         BpTPPN3ilbnAAzWh9wFGyRac8GoKONJUiswKeh/RCLhIoJcgtbY944bAsKuAneqT5FYC
         ANesf47ryOfqXoXCekVcKvE3ez8Qi2qL+09uRRSHwiYt6tMHLjAwl/uKc1eSwuWaGT6B
         Hu9Pt/XsFbPWst5DnsmBmh1mAnX+TcVUuxjAWQRmAsq+/EAj1HRy8JMdHhx2EsY8qqWP
         o/hViUH/BCnKWHQ6gw2EKXaOPXdNs0VngryaTkkFR5Y+cX4bn/rJgcN5eCjzsITY7DDC
         Vetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694929766; x=1695534566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftBbZUD9qjL5k9CoM3Lz+rdiUqAl7dEn7UYob6Ef6U8=;
        b=OrRanGzjEbcrN2BJknZDYZkIQnnQuufI62ZrRNcf2676hIq91/yNZzTY70frRVemUq
         vGLruM2kZqZNj1+K1PppTi5FI9ayzgcCyuV8qpyKzgk3qeaxhkEBp5huBoDz2b1P5Z7Q
         YsqE4U1GVD/nd9NMwCuTL8yeiYO1DkKrfUACoGQnxGNGbXjPspW0KLCI7YAkVtkGS2bR
         M+ATUyBczrmuLxB+0i5Gl7aV+2QrR9H377mcezA3je7HTYtyazOSXbLWHaZY9jIgpzNV
         QmStJEdnMIbFJifKS0+wCOIi/DTV2C8hJ3DhB/Wko7SIZK6LwA7fxLWq8m0QlSzhLSdh
         ldCQ==
X-Gm-Message-State: AOJu0YyTD1qULUf4Dq0YErXPAAwCd2hQSyD2XFW3VP+5/aauo2LdIeHE
	5lsjUbmAr9PLshH66iODvTaG7Q==
X-Google-Smtp-Source: AGHT+IGpb+yRTIEIRaa0k4bX/4nKCq1FpIWGs/TzjLAaCLV7lrAGhOl6+KUo8vw1UbJnYDW7JG9Q3A==
X-Received: by 2002:a17:903:2283:b0:1b9:e81f:fb08 with SMTP id b3-20020a170903228300b001b9e81ffb08mr6622062plh.55.1694929766182;
        Sat, 16 Sep 2023 22:49:26 -0700 (PDT)
Message-ID: <568e9a08-c09c-4695-8165-04d3817b09f3@daynix.com>
Date: Sun, 17 Sep 2023 14:49:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v5 06/13] virtio-gpu: Support context init feature
 with virglrenderer
To: Huang Rui <ray.huang@amd.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Albert Esteve <aesteve@redhat.com>, "ernunes@redhat.com"
 <ernunes@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alyssa Ross <hi@alyssa.is>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-7-ray.huang@amd.com>
 <561abf48-d72c-467d-94fd-54ffa1dfb512@daynix.com> <ZQWEQ9ZHkokhKOSA@amd.com>
 <d671bfad-7d78-41cf-a6f4-e92bf6ce2bd5@daynix.com> <ZQaSbaCUQ6iiHI/Y@amd.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <ZQaSbaCUQ6iiHI/Y@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/09/17 14:45, Huang Rui wrote:
> On Sat, Sep 16, 2023 at 06:42:04PM +0800, Akihiko Odaki wrote:
>> On 2023/09/16 19:32, Huang Rui wrote:
>>> On Fri, Sep 15, 2023 at 11:20:46PM +0800, Akihiko Odaki wrote:
>>>> On 2023/09/15 20:11, Huang Rui wrote:
>>>>> Patch "virtio-gpu: CONTEXT_INIT feature" has added the context_init
>>>>> feature flags.
>>>>> We would like to enable the feature with virglrenderer, so add to create
>>>>> virgl renderer context with flags using context_id when valid.
>>>>>
>>>>> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>>> ---
>>>>>
>>>>> V4 -> V5:
>>>>>        - Inverted patch 5 and 6 because we should configure
>>>>>          HAVE_VIRGL_CONTEXT_INIT firstly. (Philippe)
>>>>>
>>>>>     hw/display/virtio-gpu-virgl.c | 13 +++++++++++--
>>>>>     hw/display/virtio-gpu.c       |  2 ++
>>>>>     2 files changed, 13 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>>>> index 8bb7a2c21f..312953ec16 100644
>>>>> --- a/hw/display/virtio-gpu-virgl.c
>>>>> +++ b/hw/display/virtio-gpu-virgl.c
>>>>> @@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>>>>>         trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>>>>>                                         cc.debug_name);
>>>>>     
>>>>> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
>>>>> -                                  cc.debug_name);
>>>>> +    if (cc.context_init) {
>>>>> +#ifdef HAVE_VIRGL_CONTEXT_INIT
>>>>> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
>>>>> +                                                 cc.context_init,
>>>>> +                                                 cc.nlen,
>>>>> +                                                 cc.debug_name);
>>>>> +        return;
>>>>> +#endif
>>>>
>>>> This should deal with the case when context_init is set while
>>>> HAVE_VIRGL_CONTEXT_INIT is not defined.
>>>
>>> Actually, I received the comment below before:
>>>
>>> https://lore.kernel.org/qemu-devel/32588d0e-a1f2-30c4-5e9f-e6e7c4190b65@linaro.org/
>>>
>>> At original patch set, I have the case while HAVE_VIRGL_CONTEXT_INIT is set
>>> but HAVE_VIRGL_CONTEXT_INIT is not defined. But I think we may encounter
>>> the case that virgl_renderer_context_create_with_flags is not defined in
>>> virglrenderer early version. Should I bring the error message back?
>>>
>>> Thanks,
>>> Ray
>>
>> I suggest checking VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED instead of
>> reporting an error here. Perhaps it may be easier to add #ifdef around:
>>   > +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
>>   > +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),
> 
> How about below changes: >
> ---
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 8bb7a2c21f..54a3cfe136 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -106,8 +106,15 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>       trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>                                       cc.debug_name);
> 
> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> -                                  cc.debug_name);
> +    if (cc.context_init && virtio_gpu_context_init_enabled(g->conf)) {
> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> +                                                 cc.context_init,
> +                                                 cc.nlen,
> +                                                 cc.debug_name);
> +        return;
> +    }
> +
> +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
>   }
> 
>   static void virgl_cmd_context_destroy(VirtIOGPU *g,
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index be16efbd38..6ff2c8e92d 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1508,6 +1508,10 @@ static Property virtio_gpu_properties[] = {
>       DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
>                       VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
>       DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
> +#ifdef HAVE_VIRGL_CONTEXT_INIT
> +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
> +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, true),
> +#endif
>       DEFINE_PROP_END_OF_LIST(),
>   };
> 

It looks better, but not having #ifdef around 
virgl_renderer_context_create_with_flags() will result in a link error 
with old virglrenderer.

