Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2014D7A4100
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 08:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603781.940851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi7f2-00059a-BJ; Mon, 18 Sep 2023 06:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603781.940851; Mon, 18 Sep 2023 06:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi7f2-00056g-86; Mon, 18 Sep 2023 06:23:08 +0000
Received: by outflank-mailman (input) for mailman id 603781;
 Mon, 18 Sep 2023 06:23:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZGqG=FC=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qi7f0-00056Y-T6
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 06:23:06 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2417d85-55eb-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 08:23:03 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1bf7423ef3eso29368975ad.3
 for <xen-devel@lists.xenproject.org>; Sun, 17 Sep 2023 23:23:03 -0700 (PDT)
Received: from [157.82.205.33] ([157.82.205.33])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902ee4d00b001c55db80b14sm1791613plo.221.2023.09.17.23.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Sep 2023 23:23:01 -0700 (PDT)
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
X-Inumbo-ID: d2417d85-55eb-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1695018182; x=1695622982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u8t9XvJ5MSVjBAztpJwmc9U2NCJ7mEahfpPAcNq8dkI=;
        b=tyk5zBUQ2nAQWFWYsvpexswwP/TfQvQMyk5SBjQVvZE7JEYX862gv/Y9Sa3C1WZdnx
         Zc8NK1Cs0IgMIVed65jERugWxSUgtu+cBZ/3dlUwRVQ4xtqIHuLyfiLT0B/WuWE4L9Jt
         kRZVpEZr11MX2pTGzJ+5NbTDaEMDw0fqKjGUsrfUhzV3YJSdtjnIdDDnVO/jmTWzLQFQ
         erAw3whXrrZG9aHXE+celY0u0yOwd3AP300dXY768tcGasTiYA5z1nVQMjBY9lKsXcie
         4FgB01L/Q9ZSOQAyHHc412P9iBD0VWMhPyeCRZhJ2aZYlyZ4DvoLab5yBCDIlt5v9IlE
         BbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695018182; x=1695622982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u8t9XvJ5MSVjBAztpJwmc9U2NCJ7mEahfpPAcNq8dkI=;
        b=e4kLk8oE+2m4tkodW5tX2w+ttIKmXYo8PVuLAaEI9viYva/ofqw+Cgt9EtFApszHQc
         DpUHt08nxvW9/LzsdwboDCm9zrfqhmt8FB1an5uIXn7hqNu8VXo+TNVAk3AfA5aAJoHi
         OX1cbGC5K4y6dPU5KVoiITvns5x8Ypb4HcaKdhbXOuIWZrie2aOOVHpEAxMnBMfW3EUm
         ZPd8c4FHHpjGSdGYmee1rJ5QC53vR/dmwo1Xx8pFA6UvO/TsiIBHNXvClYkKCm57lza7
         YvFTaT6xEiapNH+mxBckXp3/25XCdkz4nfOFPOj9XnEfkWHik9knkQPrBXDr/aks4U1B
         fwCQ==
X-Gm-Message-State: AOJu0YxofuDRUgVQPhbiW1P9CkMD6Jxr0jynPv5ILTZL99FoWpStSp9B
	U2xairu5wn+NhQtrgC23LY4i/Q==
X-Google-Smtp-Source: AGHT+IE2vtRE5qBNv54fiMtFDfRwC09+R/a46LYdmyUGIvChiEsj7hQL2uj7L3ABkrfVIYoI54eNdA==
X-Received: by 2002:a17:902:f543:b0:1c3:77cd:653d with SMTP id h3-20020a170902f54300b001c377cd653dmr7731864plf.28.1695018182172;
        Sun, 17 Sep 2023 23:23:02 -0700 (PDT)
Message-ID: <6b1374d2-da8f-4552-a6e5-b05094b0f0a0@daynix.com>
Date: Mon, 18 Sep 2023 15:22:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v5 06/13] virtio-gpu: Support context init feature
 with virglrenderer
Content-Language: en-US
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
 <568e9a08-c09c-4695-8165-04d3817b09f3@daynix.com> <ZQfjd9DsMTwxlPKF@amd.com>
 <6e4887e7-f850-43aa-b9c6-6eb80b37bbc2@daynix.com> <ZQfsRDk/H3VMDgw+@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <ZQfsRDk/H3VMDgw+@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/09/18 15:20, Huang Rui wrote:
> On Mon, Sep 18, 2023 at 02:07:25PM +0800, Akihiko Odaki wrote:
>> On 2023/09/18 14:43, Huang Rui wrote:
>>> On Sun, Sep 17, 2023 at 01:49:19PM +0800, Akihiko Odaki wrote:
>>>> On 2023/09/17 14:45, Huang Rui wrote:
>>>>> On Sat, Sep 16, 2023 at 06:42:04PM +0800, Akihiko Odaki wrote:
>>>>>> On 2023/09/16 19:32, Huang Rui wrote:
>>>>>>> On Fri, Sep 15, 2023 at 11:20:46PM +0800, Akihiko Odaki wrote:
>>>>>>>> On 2023/09/15 20:11, Huang Rui wrote:
>>>>>>>>> Patch "virtio-gpu: CONTEXT_INIT feature" has added the context_init
>>>>>>>>> feature flags.
>>>>>>>>> We would like to enable the feature with virglrenderer, so add to create
>>>>>>>>> virgl renderer context with flags using context_id when valid.
>>>>>>>>>
>>>>>>>>> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>>>>>>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>>>>>>> ---
>>>>>>>>>
>>>>>>>>> V4 -> V5:
>>>>>>>>>          - Inverted patch 5 and 6 because we should configure
>>>>>>>>>            HAVE_VIRGL_CONTEXT_INIT firstly. (Philippe)
>>>>>>>>>
>>>>>>>>>       hw/display/virtio-gpu-virgl.c | 13 +++++++++++--
>>>>>>>>>       hw/display/virtio-gpu.c       |  2 ++
>>>>>>>>>       2 files changed, 13 insertions(+), 2 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>>>>>>>> index 8bb7a2c21f..312953ec16 100644
>>>>>>>>> --- a/hw/display/virtio-gpu-virgl.c
>>>>>>>>> +++ b/hw/display/virtio-gpu-virgl.c
>>>>>>>>> @@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>>>>>>>>>           trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>>>>>>>>>                                           cc.debug_name);
>>>>>>>>>       
>>>>>>>>> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
>>>>>>>>> -                                  cc.debug_name);
>>>>>>>>> +    if (cc.context_init) {
>>>>>>>>> +#ifdef HAVE_VIRGL_CONTEXT_INIT
>>>>>>>>> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
>>>>>>>>> +                                                 cc.context_init,
>>>>>>>>> +                                                 cc.nlen,
>>>>>>>>> +                                                 cc.debug_name);
>>>>>>>>> +        return;
>>>>>>>>> +#endif
>>>>>>>>
>>>>>>>> This should deal with the case when context_init is set while
>>>>>>>> HAVE_VIRGL_CONTEXT_INIT is not defined.
>>>>>>>
>>>>>>> Actually, I received the comment below before:
>>>>>>>
>>>>>>> https://lore.kernel.org/qemu-devel/32588d0e-a1f2-30c4-5e9f-e6e7c4190b65@linaro.org/
>>>>>>>
>>>>>>> At original patch set, I have the case while HAVE_VIRGL_CONTEXT_INIT is set
>>>>>>> but HAVE_VIRGL_CONTEXT_INIT is not defined. But I think we may encounter
>>>>>>> the case that virgl_renderer_context_create_with_flags is not defined in
>>>>>>> virglrenderer early version. Should I bring the error message back?
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Ray
>>>>>>
>>>>>> I suggest checking VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED instead of
>>>>>> reporting an error here. Perhaps it may be easier to add #ifdef around:
>>>>>>     > +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
>>>>>>     > +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),
>>>>>
>>>>> How about below changes: >
>>>>> ---
>>>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>>>> index 8bb7a2c21f..54a3cfe136 100644
>>>>> --- a/hw/display/virtio-gpu-virgl.c
>>>>> +++ b/hw/display/virtio-gpu-virgl.c
>>>>> @@ -106,8 +106,15 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>>>>>         trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>>>>>                                         cc.debug_name);
>>>>>
>>>>> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
>>>>> -                                  cc.debug_name);
>>>>> +    if (cc.context_init && virtio_gpu_context_init_enabled(g->conf)) {
>>>>> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
>>>>> +                                                 cc.context_init,
>>>>> +                                                 cc.nlen,
>>>>> +                                                 cc.debug_name);
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
>>>>>     }
>>>>>
>>>>>     static void virgl_cmd_context_destroy(VirtIOGPU *g,
>>>>> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
>>>>> index be16efbd38..6ff2c8e92d 100644
>>>>> --- a/hw/display/virtio-gpu.c
>>>>> +++ b/hw/display/virtio-gpu.c
>>>>> @@ -1508,6 +1508,10 @@ static Property virtio_gpu_properties[] = {
>>>>>         DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
>>>>>                         VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
>>>>>         DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
>>>>> +#ifdef HAVE_VIRGL_CONTEXT_INIT
>>>>> +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
>>>>> +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, true),
>>>>> +#endif
>>>>>         DEFINE_PROP_END_OF_LIST(),
>>>>>     };
>>>>>
>>>>
>>>> It looks better, but not having #ifdef around
>>>> virgl_renderer_context_create_with_flags() will result in a link error
>>>> with old virglrenderer.
>>>
>>> Hmm, right, it seems that we have to have a "#ifdef" around here. Or do you
>>> have any better idea?
>>
>> Having #ifdef is the right direction.
> 
> OK, so we can use cc.context_init and make sure context_init function
> enabled. Please check below:
> 
> ---
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 8bb7a2c21f..8363674ebc 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>       trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>                                       cc.debug_name);
> 
> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> -                                  cc.debug_name);
> +    if (cc.context_init && virtio_gpu_context_init_enabled(g->parent_obj.conf)) {
> +#ifdef HAVE_VIRGL_CONTEXT_INIT
> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> +                                                 cc.context_init,
> +                                                 cc.nlen,
> +                                                 cc.debug_name);
> +        return;
> +#endif
> +    }

You can put the if-statement into #ifdef. Otherwise it looks good to me.

