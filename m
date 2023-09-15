Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25697A23B0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 18:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603303.940255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhBp6-0007HA-Cx; Fri, 15 Sep 2023 16:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603303.940255; Fri, 15 Sep 2023 16:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhBp6-0007E9-9g; Fri, 15 Sep 2023 16:37:40 +0000
Received: by outflank-mailman (input) for mailman id 603303;
 Fri, 15 Sep 2023 16:37:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cweo=E7=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qhBp4-0007Bh-Td
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 16:37:39 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d8214f9-53e6-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 18:37:37 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c09673b006so18708255ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 09:37:37 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902ee4d00b001aaecc0b6ffsm3708212plo.160.2023.09.15.09.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 09:37:35 -0700 (PDT)
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
X-Inumbo-ID: 2d8214f9-53e6-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694795856; x=1695400656; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QvbdwGc2q9ykrPdPA/5vXC1OmEEsdu9JN7M2jZpSlQY=;
        b=zy0tAPcmT95f243WIxUgdket5RNexmVdRSxwu3BRohaBQllLpXuiQPoekt1R7HgqTw
         qvS7AiVunFG3aq/SIcjNxPkJt1AkTGuVGR3nVQzgMbEq9N2ocUScIuqiZVOGPDfFWTmI
         nl/i0Xhy4bWVW8FgUfSXR/Uz3ToLVQAX3VSQSk0DzCX1UVkvdqd6dUKV9Pb3XB9jcEkS
         VoLyb7gpuswv60x6KDKI1ntdC02PH0ZeQzmBI7fNF15o9/G22IAwc+7w1WAC3pixN6ib
         mQuEsZicQfy9nOb+kQilt+T36eBAgOjb7LZA+8uj84exuNWA3tDik0cHbUmwulDKkK9O
         TgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694795856; x=1695400656;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QvbdwGc2q9ykrPdPA/5vXC1OmEEsdu9JN7M2jZpSlQY=;
        b=lvdTUvkZfNmFs73gP7tw/7L3FwfqA/ot0nLHNDEMC/YX1kIqoNjuFA6kJGPFFMJhXY
         H/A7dkYNHn6r8Ov6ZsB54/lFSB2l9/zMNIXn0kOzTLIkyFRe5r5Ha7UGcuWMd28j0vvp
         F435DJSfk/Ej2QAyqN/1fx/JxtzHDXTj2gAI3vEYuO4yUIFk35wE9W1uq1Ai2TJyjvBz
         5cMOdFBZ6hCt9C/1HYq49GmTIGILATbTFbB5WB+c5mn3rhMxJPlyLDQCUIt6ZpQ59pI4
         XhzhFeRmtWMi1RA3oEn3kTgyhQnI7DKdrDHs4Vz8+qdJTquf+3lj9SzYKUR4KfyX55MH
         XJFQ==
X-Gm-Message-State: AOJu0YyzhAOWOMiDF+lLEXP4r5PjH4dac/0hWVR4scNgnMQGcroo+/SH
	WWiCsRFi/jWa+YYLXCY5PW/3BA==
X-Google-Smtp-Source: AGHT+IHbWHKGZmN4Ilxyi7utzfQU0/OWAKabcK7DzJPoXar13eQHnjOLF+Kj6/lxHHwJgWxPUH4Dfw==
X-Received: by 2002:a17:903:2291:b0:1b8:6cae:4400 with SMTP id b17-20020a170903229100b001b86cae4400mr2373071plh.37.1694795855923;
        Fri, 15 Sep 2023 09:37:35 -0700 (PDT)
Message-ID: <9700c2ed-93c5-4bf6-bc6b-d5d33359d9a7@daynix.com>
Date: Sat, 16 Sep 2023 01:37:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v5 09/13] virtio-gpu: Handle resource blob commands
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Albert Esteve <aesteve@redhat.com>, ernunes@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-10-ray.huang@amd.com>
 <a14b26dc-c804-4be8-83d5-088e71d37a7b@daynix.com>
In-Reply-To: <a14b26dc-c804-4be8-83d5-088e71d37a7b@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/09/16 1:04, Akihiko Odaki wrote:
> On 2023/09/15 20:11, Huang Rui wrote:
>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
>>
>> Support BLOB resources creation, mapping and unmapping by calling the
>> new stable virglrenderer 0.10 interface. Only enabled when available and
>> via the blob config. E.g. -device virtio-vga-gl,blob=true
>>
>> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>> ---
>>
>> V4 -> V5:
>>      - Use memory_region_init_ram_ptr() instead of
>>        memory_region_init_ram_device_ptr() (Akihiko)
>>
>>   hw/display/virtio-gpu-virgl.c  | 213 +++++++++++++++++++++++++++++++++
>>   hw/display/virtio-gpu.c        |   4 +-
>>   include/hw/virtio/virtio-gpu.h |   5 +
>>   meson.build                    |   4 +
>>   4 files changed, 225 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/display/virtio-gpu-virgl.c 
>> b/hw/display/virtio-gpu-virgl.c
>> index 312953ec16..563a6f2f58 100644
>> --- a/hw/display/virtio-gpu-virgl.c
>> +++ b/hw/display/virtio-gpu-virgl.c
>> @@ -17,6 +17,7 @@
>>   #include "trace.h"
>>   #include "hw/virtio/virtio.h"
>>   #include "hw/virtio/virtio-gpu.h"
>> +#include "hw/virtio/virtio-gpu-bswap.h"
>>   #include "ui/egl-helpers.h"
>> @@ -78,9 +79,24 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
>>       virgl_renderer_resource_create(&args, NULL, 0);
>>   }
>> +static void virgl_resource_destroy(VirtIOGPU *g,
>> +                                   struct virtio_gpu_simple_resource 
>> *res)
>> +{
>> +    if (!res)
>> +        return;
>> +
>> +    QTAILQ_REMOVE(&g->reslist, res, next);
>> +
>> +    virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
>> +    g_free(res->addrs);
>> +
>> +    g_free(res);
>> +}
>> +
>>   static void virgl_cmd_resource_unref(VirtIOGPU *g,
>>                                        struct virtio_gpu_ctrl_command 
>> *cmd)
>>   {
>> +    struct virtio_gpu_simple_resource *res;
>>       struct virtio_gpu_resource_unref unref;
>>       struct iovec *res_iovs = NULL;
>>       int num_iovs = 0;
>> @@ -88,13 +104,22 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
>>       VIRTIO_GPU_FILL_CMD(unref);
>>       trace_virtio_gpu_cmd_res_unref(unref.resource_id);
>> +    res = virtio_gpu_find_resource(g, unref.resource_id);
>> +
>>       virgl_renderer_resource_detach_iov(unref.resource_id,
>>                                          &res_iovs,
>>                                          &num_iovs);
>>       if (res_iovs != NULL && num_iovs != 0) {
>>           virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
>> +        if (res) {
>> +            res->iov = NULL;
>> +            res->iov_cnt = 0;
>> +        }
>>       }
>> +
>>       virgl_renderer_resource_unref(unref.resource_id);
>> +
>> +    virgl_resource_destroy(g, res);

This may leak memory region.

