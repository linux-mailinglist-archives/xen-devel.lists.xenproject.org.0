Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6083D7A78FD
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 12:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605501.943084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiuI3-00023e-10; Wed, 20 Sep 2023 10:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605501.943084; Wed, 20 Sep 2023 10:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiuI2-00021y-UO; Wed, 20 Sep 2023 10:18:38 +0000
Received: by outflank-mailman (input) for mailman id 605501;
 Wed, 20 Sep 2023 10:18:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rvvO=FE=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qiuI1-00021s-O4
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 10:18:38 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e39e541-579f-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 12:18:35 +0200 (CEST)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1d6a7354533so2480855fac.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Sep 2023 03:18:35 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 v17-20020aa78091000000b00687fcb1e609sm9900008pff.116.2023.09.20.03.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Sep 2023 03:18:33 -0700 (PDT)
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
X-Inumbo-ID: 0e39e541-579f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1695205114; x=1695809914; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wGNXVPxGii/1OrruCGR9o+G35rIoyKM+zE3Q4kluY2o=;
        b=V/wiBZOkUhIwaqBAmRvTj6ircbnQr8bc0Y8pZQTOecm53U8kT0qWAWqwaHyobM9xiK
         CztD6VBHgfkXJA9JI9vv4XSWSJ3kzjIt0zZhyV2YpzaFGhNsjfZi2+YkBJ5RKv55/ff6
         OKoE/Yt56u7KAYCAIe9mRQfI3muXga5ahURzUEHtUJ7hMdEyNNGbqkJWd46SFh/3otrt
         GlA05V506XjrnzsdTBhqHwKVQaBm5C1S4Zz4++SV0ZNHBk/2MRsM+A3oUn+lg+srmr87
         Znkf/vtzckV60TDqBnZKdDSePX7ml3x5qVFjR4ITf18OQrbQNuv0q2LBFhUE0/k92jTn
         p7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695205114; x=1695809914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wGNXVPxGii/1OrruCGR9o+G35rIoyKM+zE3Q4kluY2o=;
        b=o6nfox14RWbtuu5Q+lk8Q5DE6ePyfSjsLes5f11mKTpeiBMdOcPFMYV+jg3ofZJDTt
         vS8lLeQeuSbFgvj8BqOkdPpPQtoa956mdyYZ8oEiiqpKvMt8WUEge2TT11TeAiOQlaJu
         HxX8Ln7riW1xWT55Je2zvAyA9yXivAsi505Vo0TCu4slmgwI1gMNdi3AYEmTtECJYM5q
         11x4itWTPDJIjzb2Hsn1U7B+Ffyca8+GVm1M6OvVB6ldgZa6rPr+60AvPG8pjpUWmDhX
         yGw/uwAX5AtW84E4SInXHlQR//020LrHAq6Ni5oJDf3UgzdwDIac/tF74g2WxOI0W8VV
         dddw==
X-Gm-Message-State: AOJu0YxRVnvnCm1yLqifBjeSFU1HGhJq5tw5YN/M7mHqlqJq/3621Jbb
	mWsYD7xNQTLzpHX2xxurL7ebZw==
X-Google-Smtp-Source: AGHT+IETjZDCEEs66uqF++esmIHFfY2g6LKNY3dRSbU1y5F6WeIuUIjbS0tRfk5rD7INdlVSaQGKgg==
X-Received: by 2002:a05:6870:8a29:b0:1bb:753d:e6db with SMTP id p41-20020a0568708a2900b001bb753de6dbmr2230286oaq.3.1695205114050;
        Wed, 20 Sep 2023 03:18:34 -0700 (PDT)
Message-ID: <610ae949-89e7-4722-951d-ba0e8427919d@daynix.com>
Date: Wed, 20 Sep 2023 19:18:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v5 07/13] softmmu/memory: enable automatic
 deallocation of memory regions
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Huang Rui
 <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
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
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-8-ray.huang@amd.com>
 <99fb4575-9f8d-4ab6-bc22-911bbaa7ca55@daynix.com>
 <c0370b6e-c17e-2400-ef8a-7a759d2fc2d7@amd.com>
 <75698621-d210-40eb-872d-f3cfc6e4dbff@daynix.com>
 <32a68715-201b-9923-9600-fe5ae49e4b7b@amd.com>
 <73a35fbb-c9a4-41dc-a6c7-26037b0e412f@daynix.com>
 <1f8863da-fad1-f983-8ed0-d6bf8d9544b8@amd.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <1f8863da-fad1-f983-8ed0-d6bf8d9544b8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/09/20 17:57, Xenia Ragiadakou wrote:
> 
> On 20/9/23 01:18, Akihiko Odaki wrote:
>> On 2023/09/19 23:21, Xenia Ragiadakou wrote:
>>>
>>> On 19/9/23 13:44, Akihiko Odaki wrote:
>>>> On 2023/09/19 19:28, Xenia Ragiadakou wrote:
>>>>>
>>>>> On 15/9/23 18:11, Akihiko Odaki wrote:
>>>>>> On 2023/09/15 20:11, Huang Rui wrote:
>>>>>>> From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>>>>>>
>>>>>>> When the memory region has a different life-cycle from that of 
>>>>>>> her parent,
>>>>>>> could be automatically released, once has been unparent and once 
>>>>>>> all of her
>>>>>>> references have gone away, via the object's free callback.
>>>>>>>
>>>>>>> However, currently, references to the memory region are held by 
>>>>>>> its owner
>>>>>>> without first incrementing the memory region object's reference 
>>>>>>> count.
>>>>>>> As a result, the automatic deallocation of the object, not taking 
>>>>>>> into
>>>>>>> account those references, results in use-after-free memory 
>>>>>>> corruption.
>>>>>>>
>>>>>>> This patch increases the reference count of an owned memory 
>>>>>>> region object
>>>>>>> on each memory_region_ref() and decreases it on each 
>>>>>>> memory_region_unref().
>>>>>>>
>>>>>>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>>>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>>>>> ---
>>>>>>>
>>>>>>> V4 -> V5:
>>>>>>>      - ref/unref only owned memory regions (Akihiko)
>>>>>>>
>>>>>>>   softmmu/memory.c | 5 +++++
>>>>>>>   1 file changed, 5 insertions(+)
>>>>>>>
>>>>>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>>>>>> index 7d9494ce70..15e1699750 100644
>>>>>>> --- a/softmmu/memory.c
>>>>>>> +++ b/softmmu/memory.c
>>>>>>> @@ -1800,6 +1800,9 @@ void memory_region_ref(MemoryRegion *mr)
>>>>>>>       /* MMIO callbacks most likely will access data that belongs
>>>>>>>        * to the owner, hence the need to ref/unref the owner 
>>>>>>> whenever
>>>>>>>        * the memory region is in use.
>>>>>>> +     * Likewise, the owner keeps references to the memory region,
>>>>>>> +     * hence the need to ref/unref the memory region object to 
>>>>>>> prevent
>>>>>>> +     * its automatic deallocation while still referenced by its 
>>>>>>> owner.
>>>>>>
>>>>>> This comment does not make sense. Traditionally no such automatic 
>>>>>> deallocation happens so the owner has been always required to free 
>>>>>> the memory region when it gets finalized.
>>>>>>
>>>>>> "[QEMU PATCH v5 09/13] virtio-gpu: Handle resource blob commands" 
>>>>>> introduces a different kind of memory region, which can be freed 
>>>>>> anytime before the device gets finalized. Even in this case, the 
>>>>>> owner removes the reference to the memory owner by doing 
>>>>>> res->region = NULL;
>>>>>
>>>>> Hi Akihiko,
>>>>>
>>>>> You are right, the word "owner" is not correct. The issue observed 
>>>>> was due to the references kept in flatview ranges and the fact that 
>>>>> flatview_destroy() is asynchronous and was called after memory 
>>>>> region's destruction.
>>>>>
>>>>> If I replace the word "owner" with "memory subsystem" in the commit 
>>>>> message and drop the comment, would that be ok with you? or do want 
>>>>> to suggest something else?
>>>>
>>>> This will extend the lifetime of the memory region, but the 
>>>> underlying memory is still synchronously freed. Can you show that 
>>>> the flatview range will not be used to read the freed memory?
>>>
>>> Yes, the intention of this patch is to delay the mr object 
>>> finalization until all memory_region_unref() on this mr have been 
>>> taken place.
>>>
>>> What do you mean by "the underlying memory is still synchronously 
>>> freed"?
>>>
>>
>> A pointer is passed to memory_region_init_ram_ptr() with the ptr 
>> parameter when initializing the memory region and the memory region 
>> keeps the pointer.
>>
>> In virtio_gpu_virgl_resource_unmap(), the memory pointed with the 
>> pointer is unmapped with virgl_renderer_resource_unmap() and makes the 
>> pointer kept by the memory region dangling though the lifetime of the 
>> memory region is extended with this patch. Can you show that the 
>> dangling pointer the memory region has will never be referenced?
> 
> I see your point but I think it is not directly related to this patch. 
> IMHO, it is related to the implementation of 
> virtio_gpu_virgl_resource_unmap(). Maybe the unmapping should be done in 
> the free callback. However, I would expect the pointer to a disabled 
> memory region to not be used, not sure though.

Unmapping in the free callback sounds good.

