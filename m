Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A98F799CA2
	for <lists+xen-devel@lfdr.de>; Sun, 10 Sep 2023 06:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598658.933637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfC7J-0001il-3b; Sun, 10 Sep 2023 04:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598658.933637; Sun, 10 Sep 2023 04:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfC7J-0001gt-13; Sun, 10 Sep 2023 04:32:13 +0000
Received: by outflank-mailman (input) for mailman id 598658;
 Sun, 10 Sep 2023 04:32:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHF+=E2=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qfC7H-0001gn-TL
 for xen-devel@lists.xenproject.org; Sun, 10 Sep 2023 04:32:11 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00db1723-4f93-11ee-9b0d-b553b5be7939;
 Sun, 10 Sep 2023 06:32:09 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-76dc77fd01fso202892185a.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Sep 2023 21:32:09 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 e19-20020aa78c53000000b00679a4b56e41sm3387194pfd.43.2023.09.09.21.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Sep 2023 21:32:07 -0700 (PDT)
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
X-Inumbo-ID: 00db1723-4f93-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694320328; x=1694925128; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6mLDKK0spS0SXw0nxD2bYbl1ukTpmkTjYoJfRa7X6Jc=;
        b=JRPS06/UWZNhgNSZqlJI5IQ/7ghal06r1wtiIOWqM3w0Tc5P7YWrCdvc6csVSblmRQ
         B3foxgU58N8WZb6UICxkFPUOOMWfuhpeGGc8KDc5PIhtjcovmpenE/RMTkYaXLjLl8oK
         dUmkQVqBHD7CZffzTU6DdZMn1bKzgW4fIvPdMk82P6YX/pwGuFMe4f786ws52Tl3/YDa
         WbwyVwamQ2AV4LF18f3ooKNCY2PX90v25fdD6rSAzWFi0KvaJDt1s5DtsCHzD7+3+Ovk
         123DwId7tHHDP14q/dlCIbk4lBuzCmv88O/M30I3Gz+OamfRq8p44sb/p4kTp9s14tUR
         4c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694320328; x=1694925128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6mLDKK0spS0SXw0nxD2bYbl1ukTpmkTjYoJfRa7X6Jc=;
        b=G5v5/dgbhHngNhNE/4lXbGEUkw9HOv9R3lsW7FNTmQJAdDZwSsBDgx+kspOv8lgl5h
         kY2ig1lxqyQm+tmQmGaiRJ9OfKH1SZtPFUlZVQ1yXyqFuZ1RQXpjIoImBi0+T0wsIXey
         FjzYj+yrdnAuze2TulU3ChuP4CJ2Lv7MoRQHUp3idwHBa7C1K2L0oEDSjeNBGJ2wNDtZ
         KW6VZpQYUWTTnPOzkePUYAvlRlL62WH+pAPuyAjWvkyrNMRAjafjVwIfdpo/IKHRq7tB
         JXhTszMUBqk6Cxz9cYj8yETE3yeIXpNgVTd5yx08qLloni4UrpcQ48Sfe1W5oEyFvSyS
         QECg==
X-Gm-Message-State: AOJu0YzC9sVggHRLq+GG98VpFGPHbqMZYFZauf+2h2rSASCiE+9mo4Bk
	gBpGbYDEVqPdIWHx7k7ctBO33Q==
X-Google-Smtp-Source: AGHT+IH41CY1gp7ku8RIGtDEesEP1+sGE/g5r/DzrN13Mfai6YcjxHyadOjiT3yptF7xCb8j/jsORw==
X-Received: by 2002:a05:620a:2983:b0:76f:f0b:a1b8 with SMTP id r3-20020a05620a298300b0076f0f0ba1b8mr8942239qkp.25.1694320328329;
        Sat, 09 Sep 2023 21:32:08 -0700 (PDT)
Message-ID: <b82982aa-5b9e-481e-9491-b9313877bcaa@daynix.com>
Date: Sun, 10 Sep 2023 13:32:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v4 11/13] virtio-gpu: Support Venus capset
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 "ernunes@redhat.com" <ernunes@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-12-ray.huang@amd.com>
 <fe36e4e1-1198-4da4-b6ee-a6a00a44298a@daynix.com> <ZPw7FIMmykdYtVeM@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <ZPw7FIMmykdYtVeM@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/09/09 18:29, Huang Rui wrote:
> On Thu, Aug 31, 2023 at 06:43:17PM +0800, Akihiko Odaki wrote:
>> On 2023/08/31 18:32, Huang Rui wrote:
>>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
>>>
>>> Add support for the Venus capset, which enables Vulkan support through
>>> the Venus Vulkan driver for virtio-gpu.
>>>
>>> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> ---
>>>    hw/display/virtio-gpu-virgl.c               | 21 +++++++++++++++++----
>>>    include/standard-headers/linux/virtio_gpu.h |  2 ++
>>>    2 files changed, 19 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>> index 1a996a08fc..83cd8c8fd0 100644
>>> --- a/hw/display/virtio-gpu-virgl.c
>>> +++ b/hw/display/virtio-gpu-virgl.c
>>> @@ -437,6 +437,11 @@ static void virgl_cmd_get_capset_info(VirtIOGPU *g,
>>>            virgl_renderer_get_cap_set(resp.capset_id,
>>>                                       &resp.capset_max_version,
>>>                                       &resp.capset_max_size);
>>> +    } else if (info.capset_index == 2) {
>>> +        resp.capset_id = VIRTIO_GPU_CAPSET_VENUS;
>>> +        virgl_renderer_get_cap_set(resp.capset_id,
>>> +                                   &resp.capset_max_version,
>>> +                                   &resp.capset_max_size);
>>>        } else {
>>>            resp.capset_max_version = 0;
>>>            resp.capset_max_size = 0;
>>> @@ -901,10 +906,18 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
>>>    
>>>    int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g)
>>>    {
>>> -    uint32_t capset2_max_ver, capset2_max_size;
>>> +    uint32_t capset2_max_ver, capset2_max_size, num_capsets;
>>> +    num_capsets = 1;
>>> +
>>>        virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VIRGL2,
>>> -                              &capset2_max_ver,
>>> -                              &capset2_max_size);
>>> +                               &capset2_max_ver,
>>> +                               &capset2_max_size);
>>> +    num_capsets += capset2_max_ver ? 1 : 0;
>>> +
>>> +    virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VENUS,
>>> +                               &capset2_max_ver,
>>> +                               &capset2_max_size);
>>> +    num_capsets += capset2_max_size ? 1 : 0;
>>>    
>>> -    return capset2_max_ver ? 2 : 1;
>>> +    return num_capsets;
>>>    }
>>> diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
>>> index 2da48d3d4c..2db643ed8f 100644
>>> --- a/include/standard-headers/linux/virtio_gpu.h
>>> +++ b/include/standard-headers/linux/virtio_gpu.h
>>> @@ -309,6 +309,8 @@ struct virtio_gpu_cmd_submit {
>>>    
>>>    #define VIRTIO_GPU_CAPSET_VIRGL 1
>>>    #define VIRTIO_GPU_CAPSET_VIRGL2 2
>>> +/* 3 is reserved for gfxstream */
>>> +#define VIRTIO_GPU_CAPSET_VENUS 4
>>
>> This file is synced with scripts/update-linux-headers.sh and should not
>> be modified.
> 
> Should I add marco in kernel include/uapi/linux/virtio_gpu.h?

Yes, I think so.

Regards,
Akihiko Odaki

