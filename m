Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2977A5FEC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 12:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604583.942042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiYDv-0005gd-FV; Tue, 19 Sep 2023 10:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604583.942042; Tue, 19 Sep 2023 10:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiYDv-0005ea-Cp; Tue, 19 Sep 2023 10:44:55 +0000
Received: by outflank-mailman (input) for mailman id 604583;
 Tue, 19 Sep 2023 10:44:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckRK=FD=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qiYDt-0005eU-Qw
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 10:44:53 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 900329ef-56d9-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 12:44:52 +0200 (CEST)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c3cbfa40d6so49362035ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Sep 2023 03:44:52 -0700 (PDT)
Received: from [157.82.206.151] ([157.82.206.151])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b001bb7a736b4csm3409972plo.77.2023.09.19.03.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Sep 2023 03:44:50 -0700 (PDT)
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
X-Inumbo-ID: 900329ef-56d9-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1695120291; x=1695725091; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=smljqgzosS5OJqCedcK9N/6xUm9qe80j7oWlUug+4Jw=;
        b=VY/SKgmGtgDZajQwl5i0WMHKJ3WNQBhtn5RJxnZu9sCISMdlxH4sNlBYpBylMqowV7
         RBFi/iMcECU/yP7Id7cXNkjKMVLeigBytn72+skDtduT+Xk8yhnykBcKQVOSFSxN51Ht
         zsCMRhPwHlpOl+XnDPpYAxmBEVFV2WplE7m8YQe7iNRrU7sqzEZeBjp8l5k6Ux+RQIJP
         OLussTdvNGbHf3kmaTh8wkXs/oSAbvVxEQmALZac1NpfgtonQDuv1dJNuAdUeNbbv0ic
         xqgRNO6trc/eK3X+ggqggv8KTt7zBUQz90aigtBllK6h1LwzOxDN8L6MNPwts31lJQKY
         MTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695120291; x=1695725091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smljqgzosS5OJqCedcK9N/6xUm9qe80j7oWlUug+4Jw=;
        b=uz0Tr9MtC/i1zZUEom5c5rApCVCXxdt59fQk0sVZ+KnOal5cf//8lTopCap94VbQ6O
         s+o9wCS50vieC2hh7C5GXy+lttJhDQYYzpTOVOcWNqUKWuFKXuawWN4gSt51w2QW4d/N
         8gOiRQR6BZP5yTYEiSbod1UH/5mHvRwlfpUtV9H2DG3tzp6uWfsUqpxz3LeG8row2HH/
         6Y9K7INqJnn2GHSW2OSen4l4Ag/bYwO1cJjr/rBZ6HVU7TiVDL2pRfFyAOYVRksTcFob
         cWsd0HOwLwn8SSKcOhtfSLklhh1NpTsF5JZA3lfgM6DnFq5JAM6LhjKnyZW8s5nKrnH6
         Zbkg==
X-Gm-Message-State: AOJu0YxvXY5vv66NquVNt1IgO78F8dg+uqT6Q3TFbHRDHAvvbW89dHua
	jdPvQwGdKW1U4k5naPD0t00MNg==
X-Google-Smtp-Source: AGHT+IE1rvQgqf2KfT7I++lA0G6ulx4YIhz3L5ez9EyE2wjGmry5CNVl3i/34lsTkQNO0gf+B6/CXg==
X-Received: by 2002:a17:903:507:b0:1b8:4f93:b210 with SMTP id jn7-20020a170903050700b001b84f93b210mr9965606plb.45.1695120291167;
        Tue, 19 Sep 2023 03:44:51 -0700 (PDT)
Message-ID: <75698621-d210-40eb-872d-f3cfc6e4dbff@daynix.com>
Date: Tue, 19 Sep 2023 19:44:45 +0900
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <c0370b6e-c17e-2400-ef8a-7a759d2fc2d7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/09/19 19:28, Xenia Ragiadakou wrote:
> 
> On 15/9/23 18:11, Akihiko Odaki wrote:
>> On 2023/09/15 20:11, Huang Rui wrote:
>>> From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>>
>>> When the memory region has a different life-cycle from that of her 
>>> parent,
>>> could be automatically released, once has been unparent and once all 
>>> of her
>>> references have gone away, via the object's free callback.
>>>
>>> However, currently, references to the memory region are held by its 
>>> owner
>>> without first incrementing the memory region object's reference count.
>>> As a result, the automatic deallocation of the object, not taking into
>>> account those references, results in use-after-free memory corruption.
>>>
>>> This patch increases the reference count of an owned memory region 
>>> object
>>> on each memory_region_ref() and decreases it on each 
>>> memory_region_unref().
>>>
>>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> ---
>>>
>>> V4 -> V5:
>>>      - ref/unref only owned memory regions (Akihiko)
>>>
>>>   softmmu/memory.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>> index 7d9494ce70..15e1699750 100644
>>> --- a/softmmu/memory.c
>>> +++ b/softmmu/memory.c
>>> @@ -1800,6 +1800,9 @@ void memory_region_ref(MemoryRegion *mr)
>>>       /* MMIO callbacks most likely will access data that belongs
>>>        * to the owner, hence the need to ref/unref the owner whenever
>>>        * the memory region is in use.
>>> +     * Likewise, the owner keeps references to the memory region,
>>> +     * hence the need to ref/unref the memory region object to prevent
>>> +     * its automatic deallocation while still referenced by its owner.
>>
>> This comment does not make sense. Traditionally no such automatic 
>> deallocation happens so the owner has been always required to free the 
>> memory region when it gets finalized.
>>
>> "[QEMU PATCH v5 09/13] virtio-gpu: Handle resource blob commands" 
>> introduces a different kind of memory region, which can be freed 
>> anytime before the device gets finalized. Even in this case, the owner 
>> removes the reference to the memory owner by doing res->region = NULL;
> 
> Hi Akihiko,
> 
> You are right, the word "owner" is not correct. The issue observed was 
> due to the references kept in flatview ranges and the fact that 
> flatview_destroy() is asynchronous and was called after memory region's 
> destruction.
> 
> If I replace the word "owner" with "memory subsystem" in the commit 
> message and drop the comment, would that be ok with you? or do want to 
> suggest something else?

This will extend the lifetime of the memory region, but the underlying 
memory is still synchronously freed. Can you show that the flatview 
range will not be used to read the freed memory?

Regards,
Akihiko Odaki

