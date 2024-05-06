Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC998BCBE1
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717470.1119793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vTa-00032A-RV; Mon, 06 May 2024 10:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717470.1119793; Mon, 06 May 2024 10:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vTa-0002zS-NP; Mon, 06 May 2024 10:21:42 +0000
Received: by outflank-mailman (input) for mailman id 717470;
 Mon, 06 May 2024 10:21:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0G4=MJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s3vTY-0002zG-VO
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:21:40 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d581570-0b92-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 12:21:40 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41c7ac71996so14461645e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:21:40 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d5985000000b0034e0ff3e6dasm10304139wri.93.2024.05.06.03.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 03:21:39 -0700 (PDT)
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
X-Inumbo-ID: 6d581570-0b92-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714990899; x=1715595699; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3R19P3OyRCxMOQp4ONqe+KyB+udrpxcbfQ17ucAD1/A=;
        b=gPYLtaYlVWjvt4jL5kLIridf8NjLATKJuf++4vpEHEDMjbcZeo3ba36hQp8f2oZ17K
         bWnwXWtn4zwaa3oGbWr8SMjwXXfzE8aELropghdfNTMZITWmN0yXGv3T+0Clg+bFFUgF
         l9U+QjHBy84hu5gJqA+XdY9YefkdwqmcHeH3Lkt4zKnHKNbgU6PRvDcFPfRWoPqXbPrD
         AtlrPPnBWwgv+PW6BJX/9WrYvoyD2Lp7qU771kltlbkDTGtq7n1RLuQC7x5wGaPQtrjA
         T8Wjwe92TcrG0QdOKUUlE/8qZmEkLYPBZJKj3SEr6ZXoY+1tIYBf0YFTnLf11c8StEQR
         PxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990899; x=1715595699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3R19P3OyRCxMOQp4ONqe+KyB+udrpxcbfQ17ucAD1/A=;
        b=wxpO18CXOKYrJU0NcXgRbx2SjJZMbsPjJpLc3j148RayBXsoN9tl+7ckaKH4ytY6fZ
         6UVWf8DEt/m+3v0Icia03kWs34fB89/WUYDStNmjSKdaIthPyFbOyDvtFdEGBp48BxB8
         9O3HPnWEZwUSTKqpIib2OmIsMT9RueqolUO74C9Bfp9PalpJSbbuas0bGXgdm3iuIAzA
         e07EKAeXfW+XQaf0f/Kg8UGWkWhcKeO52Jd5Xlp+H19aRA/eWTJ8+6zBJKJGTcC4p3hQ
         d3P9j/C1AHejeI1BKA/A98I7YMjvOHICqCVhUQt3AluTSfjFWJGojbq9t4JFUGaCDNTM
         qqVw==
X-Forwarded-Encrypted: i=1; AJvYcCVnCGsbYebFQmVvZX4YUZ1QLRHnfCi2WUyFQ4mtI8j+qdHHT4lre7zBAxxYiAIiN/R96HgPldw30x04MDaUqbs54d8cXvRRb60r9Xw8iJM=
X-Gm-Message-State: AOJu0YwiYDkYqAZJjMoRrD3wuOUJIXwBEZ6eHr/8gDeiq93udrx4sZHq
	L0h+OtvyzpiP8p5snY/YTKjqq9VCqZ+/2HkA9d03WC+huoLRX3huLuNpnjRkvmc=
X-Google-Smtp-Source: AGHT+IF1SoDbHOXgpG8N/21hSx48uhBBIxbLFUYZmZQ6dqIA0cRCB6rMozrTycEpVZUACIKnO+CDuw==
X-Received: by 2002:a5d:4444:0:b0:34d:b284:9540 with SMTP id x4-20020a5d4444000000b0034db2849540mr6615328wrr.4.1714990899512;
        Mon, 06 May 2024 03:21:39 -0700 (PDT)
Message-ID: <b386a0b6-9cf0-4503-85be-f7b48d90d381@linaro.org>
Date: Mon, 6 May 2024 12:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/17] xen: mapcache: Refactor
 xen_replace_cache_entry_unlocked
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-8-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2405011345140.497719@ubuntu-linux-20-04-desktop>
 <CAJy5ezq2PBXMXGMFORfuDVeC_t4S=9AF6b_pur9kD26fhBPhwA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAJy5ezq2PBXMXGMFORfuDVeC_t4S=9AF6b_pur9kD26fhBPhwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/5/24 08:32, Edgar E. Iglesias wrote:
> On Wed, May 1, 2024 at 10:46 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>>
>> On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
>>> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>>>
>>> Add MapCache argument to xen_replace_cache_entry_unlocked in
>>> preparation for supporting multiple map caches.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>>> ---
>>>   hw/xen/xen-mapcache.c | 8 +++++---
>>>   1 file changed, 5 insertions(+), 3 deletions(-)


>>> -static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
>>> +static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
>>> +                                                 hwaddr old_phys_addr,
>>>                                                    hwaddr new_phys_addr,
>>>                                                    hwaddr size)
>>>   {
>>> @@ -578,7 +579,7 @@ static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
>>>           cache_size += MCACHE_BUCKET_SIZE - (cache_size % MCACHE_BUCKET_SIZE);
>>>       }
>>>
>>> -    entry = &mapcache->entry[address_index % mapcache->nr_buckets];
>>> +    entry = &mc->entry[address_index % mc->nr_buckets];
>>>       while (entry && !(entry->paddr_index == address_index &&
>>>                         entry->size == cache_size)) {
>>>           entry = entry->next;
>>
>> There is still a global mapcache pointer in use in this function:
>>
>>    xen_remap_bucket(mapcache, entry, entry->vaddr_base,
>>
> 
> 
> Thanks! I had accidentally put the change to use mc in future patches.
> Will fix in v5.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


