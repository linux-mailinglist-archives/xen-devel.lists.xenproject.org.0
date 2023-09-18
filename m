Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 095627A40DB
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 08:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603770.940832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi7Q0-0001qt-Rn; Mon, 18 Sep 2023 06:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603770.940832; Mon, 18 Sep 2023 06:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi7Q0-0001nr-Ow; Mon, 18 Sep 2023 06:07:36 +0000
Received: by outflank-mailman (input) for mailman id 603770;
 Mon, 18 Sep 2023 06:07:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZGqG=FC=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qi7Pz-0001nl-0C
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 06:07:35 +0000
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [2607:f8b0:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7afa217-55e9-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 08:07:33 +0200 (CEST)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-51b4ef5378bso3378490a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 17 Sep 2023 23:07:33 -0700 (PDT)
Received: from [157.82.205.33] ([157.82.205.33])
 by smtp.gmail.com with ESMTPSA id
 k6-20020aa790c6000000b0069028bdd24dsm6446226pfk.34.2023.09.17.23.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Sep 2023 23:07:31 -0700 (PDT)
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
X-Inumbo-ID: a7afa217-55e9-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1695017252; x=1695622052; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wTP6Zug257B7ooTQC5CAj7GOO7MTggg9HcFBRSUzaoc=;
        b=lsd/Sv+MEvYfy0pNbaDFX1KHl3nhGEUWRqeel2uQ0bhITdYFv83BOJ3GnRwHG3k1FS
         StywzcIp+oDeXTFDPheIV+HAZ1cr9KmbfzO8O7k6v9/l/bc3qHtQn8ZHDFOAa+89DWbD
         1eVwqstKHkAsN9i05He62x5YuUkOmUVMVJQWQDcNJfLJKHbJT6qAW28OmPUImzMQYI5j
         N1jG12zDMdtTTBfFfHyJWN/35HiWU7zB/ixLMHlkuoZliHYeVyHoWduzX8+egrS14vw2
         YENy05UUQB+dC+kVCfBCKjJ9qu3C07wgQkwAFycDIYv04RQfgOfi4zlkq20rbpIrJr7d
         pf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695017252; x=1695622052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wTP6Zug257B7ooTQC5CAj7GOO7MTggg9HcFBRSUzaoc=;
        b=Wq4LSbkpUokcCb3VXvZUP8HwC73fnD/nEvj7vNzcyQB1QvYmrEISg/4iMbpPvwln1L
         c+Ml5mynfj/UHS1wB1FRz66vkosIYPtCj0wm8fDKCS7QicfHTPp2NofF2YbXNtbOHAFG
         SZyCYf9tRc9vnpPD291N9j0lSOBWo1aBeI7rSwg2TJuY1SLL7Vo5qeEUF+pSVXZ7XH0Z
         pvsproT+DyY/11nKqUju2oUAlkwhdrVa27iUDJGI7IP2JYmRB9bh2GWchGmGIB/GsAT3
         6B2qk1jVxHGBzhsFGf853rR4mlJpd8rGSPe5SCr3jcX9TvM0NqHdTGHpP+Zuid2iEb9H
         kIcw==
X-Gm-Message-State: AOJu0Ywykp75bHVyvXwFDgWfVpXFZ5zRVucgoZ+D0Zsow5Obf9uUZzaU
	AjBixYJ8/Wxxuim92S5afZ4QZQ==
X-Google-Smtp-Source: AGHT+IEHOIOhreXYfLE6SJziVIWdwXdgdAC8dOaIF8C4wtve/e246JOxLw8znC365NulwWPD0HII/g==
X-Received: by 2002:a05:6a21:6da2:b0:153:b245:50ff with SMTP id wl34-20020a056a216da200b00153b24550ffmr11464818pzb.40.1695017251752;
        Sun, 17 Sep 2023 23:07:31 -0700 (PDT)
Message-ID: <6e4887e7-f850-43aa-b9c6-6eb80b37bbc2@daynix.com>
Date: Mon, 18 Sep 2023 15:07:25 +0900
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
 <568e9a08-c09c-4695-8165-04d3817b09f3@daynix.com> <ZQfjd9DsMTwxlPKF@amd.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <ZQfjd9DsMTwxlPKF@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/09/18 14:43, Huang Rui wrote:
> On Sun, Sep 17, 2023 at 01:49:19PM +0800, Akihiko Odaki wrote:
>> On 2023/09/17 14:45, Huang Rui wrote:
>>> On Sat, Sep 16, 2023 at 06:42:04PM +0800, Akihiko Odaki wrote:
>>>> On 2023/09/16 19:32, Huang Rui wrote:
>>>>> On Fri, Sep 15, 2023 at 11:20:46PM +0800, Akihiko Odaki wrote:
>>>>>> On 2023/09/15 20:11, Huang Rui wrote:
>>>>>>> Patch "virtio-gpu: CONTEXT_INIT feature" has added the context_init
>>>>>>> feature flags.
>>>>>>> We would like to enable the feature with virglrenderer, so add to create
>>>>>>> virgl renderer context with flags using context_id when valid.
>>>>>>>
>>>>>>> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>>>>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>>>>> ---
>>>>>>>
>>>>>>> V4 -> V5:
>>>>>>>         - Inverted patch 5 and 6 because we should configure
>>>>>>>           HAVE_VIRGL_CONTEXT_INIT firstly. (Philippe)
>>>>>>>
>>>>>>>      hw/display/virtio-gpu-virgl.c | 13 +++++++++++--
>>>>>>>      hw/display/virtio-gpu.c       |  2 ++
>>>>>>>      2 files changed, 13 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>>>>>> index 8bb7a2c21f..312953ec16 100644
>>>>>>> --- a/hw/display/virtio-gpu-virgl.c
>>>>>>> +++ b/hw/display/virtio-gpu-virgl.c
>>>>>>> @@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>>>>>>>          trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>>>>>>>                                          cc.debug_name);
>>>>>>>      
>>>>>>> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
>>>>>>> -                                  cc.debug_name);
>>>>>>> +    if (cc.context_init) {
>>>>>>> +#ifdef HAVE_VIRGL_CONTEXT_INIT
>>>>>>> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
>>>>>>> +                                                 cc.context_init,
>>>>>>> +                                                 cc.nlen,
>>>>>>> +                                                 cc.debug_name);
>>>>>>> +        return;
>>>>>>> +#endif
>>>>>>
>>>>>> This should deal with the case when context_init is set while
>>>>>> HAVE_VIRGL_CONTEXT_INIT is not defined.
>>>>>
>>>>> Actually, I received the comment below before:
>>>>>
>>>>> https://lore.kernel.org/qemu-devel/32588d0e-a1f2-30c4-5e9f-e6e7c4190b65@linaro.org/
>>>>>
>>>>> At original patch set, I have the case while HAVE_VIRGL_CONTEXT_INIT is set
>>>>> but HAVE_VIRGL_CONTEXT_INIT is not defined. But I think we may encounter
>>>>> the case that virgl_renderer_context_create_with_flags is not defined in
>>>>> virglrenderer early version. Should I bring the error message back?
>>>>>
>>>>> Thanks,
>>>>> Ray
>>>>
>>>> I suggest checking VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED instead of
>>>> reporting an error here. Perhaps it may be easier to add #ifdef around:
>>>>    > +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
>>>>    > +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),
>>>
>>> How about below changes: >
>>> ---
>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>> index 8bb7a2c21f..54a3cfe136 100644
>>> --- a/hw/display/virtio-gpu-virgl.c
>>> +++ b/hw/display/virtio-gpu-virgl.c
>>> @@ -106,8 +106,15 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>>>        trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>>>                                        cc.debug_name);
>>>
>>> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
>>> -                                  cc.debug_name);
>>> +    if (cc.context_init && virtio_gpu_context_init_enabled(g->conf)) {
>>> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
>>> +                                                 cc.context_init,
>>> +                                                 cc.nlen,
>>> +                                                 cc.debug_name);
>>> +        return;
>>> +    }
>>> +
>>> +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
>>>    }
>>>
>>>    static void virgl_cmd_context_destroy(VirtIOGPU *g,
>>> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
>>> index be16efbd38..6ff2c8e92d 100644
>>> --- a/hw/display/virtio-gpu.c
>>> +++ b/hw/display/virtio-gpu.c
>>> @@ -1508,6 +1508,10 @@ static Property virtio_gpu_properties[] = {
>>>        DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
>>>                        VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
>>>        DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
>>> +#ifdef HAVE_VIRGL_CONTEXT_INIT
>>> +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
>>> +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, true),
>>> +#endif
>>>        DEFINE_PROP_END_OF_LIST(),
>>>    };
>>>
>>
>> It looks better, but not having #ifdef around
>> virgl_renderer_context_create_with_flags() will result in a link error
>> with old virglrenderer.
> 
> Hmm, right, it seems that we have to have a "#ifdef" around here. Or do you
> have any better idea?

Having #ifdef is the right direction.

