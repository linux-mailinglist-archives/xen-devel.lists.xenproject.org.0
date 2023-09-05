Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0682179215D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 11:18:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595512.929099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdSBt-0002ag-2h; Tue, 05 Sep 2023 09:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595512.929099; Tue, 05 Sep 2023 09:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdSBs-0002Xz-Vh; Tue, 05 Sep 2023 09:17:44 +0000
Received: by outflank-mailman (input) for mailman id 595512;
 Tue, 05 Sep 2023 09:17:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5vf=EV=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qdSBr-0002Xt-IB
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 09:17:43 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f4b9605-4bcd-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 11:17:40 +0200 (CEST)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bc83a96067so11493615ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Sep 2023 02:17:40 -0700 (PDT)
Received: from [157.82.204.253] ([157.82.204.253])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a170902654a00b001bde877a7casm8982684pln.264.2023.09.05.02.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 02:17:38 -0700 (PDT)
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
X-Inumbo-ID: 0f4b9605-4bcd-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1693905458; x=1694510258; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XO2+yXar5HP/Nvv10RVpzWvUXgBqEg4olN/cjiB+X1I=;
        b=nhV5V0wWiBmhhrnV+GYA/8L8LyFRO80B8xgkICKe1UcMGJFC5Xh2TnM2xYLllPQIap
         mAqwHtGHEfDVCPAN9ybIOA7Zrsp8Ugbz/FFlBC9fCa690m6szFtzr+KsmZd+sTqrVooC
         RjwL8r0wFrb7jY7IW62FI6/8E5Jpf5FAPrSZ9DzRbt7jPeAIcnYwhVK/zSI7xB0To8I3
         4SBv+mb2RipWRyBAzCpsPDI+1lsNN/sUpL+YBnCMcjMwKxahwQKnxpKFxAKQw/uHgTME
         3R3Ieq1Tp/7+1F7pxfxNTZRDU4io2E+0NKSUBNwmNoDp+h4Ju0FHSbB/DdIY8dZqwTOd
         DiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693905458; x=1694510258;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XO2+yXar5HP/Nvv10RVpzWvUXgBqEg4olN/cjiB+X1I=;
        b=IykSips/D8IM8NR0TQNCgPOBjQ/uC4Xp9oy7GDLtvGthS3kWPhnAWlxU6YBv3PvGNe
         ZLVMRCEBtWY45uGIFqLbTOuEwwa8EVfXEIkLBJDU3tjeRrvwAWy5qDH2Nhj9glAl3Lea
         2TiMZsd/t550nBRHHgwa383CIPgsGUbgv1m3S2JdPUueorUmb/EL9J23AtfNBh4lDQSb
         AfBYUNgQ6pmXqb5AqVGXxv7KnjS8qBVa58lNV02/htzAX2vmvOQpTrFLVizGYx6nP6Yi
         7MhKRgdj9fCoHWhkPF/TPujHeOE+Kgs9nxtLgY+3hqIR19haMBxeAo3PNfwi5+NWjFRK
         n4+A==
X-Gm-Message-State: AOJu0YydP5d8KYA6y8Kyw+lDrkL6pJCXtOLPAPp5kxAQvis7B0a1Pxzq
	QplfR9JsDKup81Qz4kC8xbtrDQ==
X-Google-Smtp-Source: AGHT+IHmdsTj3NWf+kJXTqNa0KpZXSsejtq0BJ85YRdCU9SkqxFyfpvDRx0WQ9z097JuwTP/N0j0PA==
X-Received: by 2002:a17:903:228a:b0:1bd:a22a:d40a with SMTP id b10-20020a170903228a00b001bda22ad40amr12216472plh.2.1693905458526;
        Tue, 05 Sep 2023 02:17:38 -0700 (PDT)
Message-ID: <2ec5929b-eb79-4848-8ab4-517c89f6b476@daynix.com>
Date: Tue, 5 Sep 2023 18:17:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v4 07/13] softmmu/memory: enable automatic
 deallocation of memory regions
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
 <20230831093252.2461282-8-ray.huang@amd.com>
 <b988f9d4-69d7-4cc4-b13e-3e697acf9fe9@daynix.com> <ZPbvyDsikvvzierv@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <ZPbvyDsikvvzierv@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/09/05 18:07, Huang Rui wrote:
> On Thu, Aug 31, 2023 at 06:10:08PM +0800, Akihiko Odaki wrote:
>> On 2023/08/31 18:32, Huang Rui wrote:
>>> From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>>
>>> When the memory region has a different life-cycle from that of her parent,
>>> could be automatically released, once has been unparent and once all of her
>>> references have gone away, via the object's free callback.
>>>
>>> However, currently, references to the memory region are held by its owner
>>> without first incrementing the memory region object's reference count.
>>> As a result, the automatic deallocation of the object, not taking into
>>> account those references, results in use-after-free memory corruption.
>>>
>>> This patch increases the reference count of the memory region object on
>>> each memory_region_ref() and decreases it on each memory_region_unref().
>>>
>>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> ---
>>>
>>> New patch
>>>
>>>    softmmu/memory.c | 19 +++++++++++++++++--
>>>    1 file changed, 17 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>> index 7d9494ce70..0fdd5eebf9 100644
>>> --- a/softmmu/memory.c
>>> +++ b/softmmu/memory.c
>>> @@ -1797,6 +1797,15 @@ Object *memory_region_owner(MemoryRegion *mr)
>>>    
>>>    void memory_region_ref(MemoryRegion *mr)
>>>    {
>>> +    if (!mr) {
>>> +        return;
>>> +    }
>>> +
>>> +    /* Obtain a reference to prevent the memory region object
>>> +     * from being released under our feet.
>>> +     */
>>> +    object_ref(OBJECT(mr));
>>> +
>>>        /* MMIO callbacks most likely will access data that belongs
>>>         * to the owner, hence the need to ref/unref the owner whenever
>>>         * the memory region is in use.
>>> @@ -1807,16 +1816,22 @@ void memory_region_ref(MemoryRegion *mr)
>>>         * Memory regions without an owner are supposed to never go away;
>>>         * we do not ref/unref them because it slows down DMA sensibly.
>>>         */
>>
>> The collapsed comment says:
>>   > The memory region is a child of its owner.  As long as the
>>   > owner doesn't call unparent itself on the memory region,
>>   > ref-ing the owner will also keep the memory region alive.
>>   > Memory regions without an owner are supposed to never go away;
>>   > we do not ref/unref them because it slows down DMA sensibly.
>>
>> It contradicts with this patch.
> 
> The reason that we modify it is because we would like to address the memory
> leak issue in the original codes. Please see below, we find the memory
> region will be crashed once we free(unref) the simple resource, because the
> region will be freed in object_finalize() after unparent and the ref count
> is to 0. Then the VM will be crashed with this.
> 
> In virgl_cmd_resource_map_blob():
>      memory_region_init_ram_device_ptr(res->region, OBJECT(g), NULL, size, data);
>      OBJECT(res->region)->free = g_free;
>      memory_region_add_subregion(&b->hostmem, mblob.offset, res->region);
>      memory_region_set_enabled(res->region, true);
> 
> In virtio_gpu_virgl_resource_unmap():
>      memory_region_set_enabled(res->region, false);
>      memory_region_del_subregion(&b->hostmem, res->region);
>      object_unparent(OBJECT(res->region));
>      res->region = NULL;
> 
> I spent a bit more time to understand your point, do you want me to update
> corresponding comments or you have some concern about this change?

As the comment says ref-ing memory regions without an owner will slow 
down DMA, you should avoid that. More concretely, you should check 
mr->owner before doing object_ref(OBJECT(mr)).

Regards,
Akihiko Odaki

