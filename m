Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA9C425E8E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 23:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204036.359235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYanZ-0008Cc-3i; Thu, 07 Oct 2021 21:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204036.359235; Thu, 07 Oct 2021 21:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYanZ-0008A2-0h; Thu, 07 Oct 2021 21:19:29 +0000
Received: by outflank-mailman (input) for mailman id 204036;
 Thu, 07 Oct 2021 21:19:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4W4d=O3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mYanX-00089Y-Ir
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 21:19:27 +0000
Received: from mail-ed1-x529.google.com (unknown [2a00:1450:4864:20::529])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8fef562-bb3e-4295-b308-b0a52a44b1cc;
 Thu, 07 Oct 2021 21:19:26 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r18so28253450edv.12
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 14:19:26 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o5sm230384eds.26.2021.10.07.14.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 14:19:25 -0700 (PDT)
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
X-Inumbo-ID: d8fef562-bb3e-4295-b308-b0a52a44b1cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=LukkjeGvSI0BY1W+mXe0HSJdY78EUYNMhAIPp3JeJPA=;
        b=n8NV+1m2KOfLSVOINnmtS4LmJSf79mjK7Z/o1XfFDZwswDnIH8G9kWvsyLETg2B7mo
         +u8oiRH7IAQJWMU8R5s0IvCrs5EXoYtLKnOcOO6tBkURiJdNxs099+VLoMyG2UVgMoti
         mbL3KRMtCbjRTm3xJZ/hdIxKuhevD+8t2n7/cs4t0bhlZ1bcuk0xciID8MJIMe5xzW/f
         fAoElJ9pyF1rBUXihIFNIxVKTDLvjMYOi76gBQyqnDh5Bzn4cn0GNCpiXX7lwO8YbD14
         Sii99VKHfpEadrEB/hWA70biQukb+VIhDwyrI/J7H5wwxSCgTSrqamgMgRhdCxPdHrwa
         EN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LukkjeGvSI0BY1W+mXe0HSJdY78EUYNMhAIPp3JeJPA=;
        b=FZNjlNbsIAqM2u9Z0SxgB9VH9XCKGNoyRenehKKmio2Soj94mZS+GqSLbxQbUKuqlg
         cQELLd8a4Hv5lytRF5rWZW8D9AAtlBwfcz4rQf3Gx8xqlBDfeqeD0okfjQ7Vw3iScEn+
         sg9pk7CvA7RIU0WjBQBgn6cpKHX5ALR5Q68sD0tHzd/Wuk+bMwt3DLCsiSISM8S5BtTG
         sTXHe3I60LsF5TbPlfbDplivCGlA4Gj7oYiQWO0f6omGB0VvTtKb0tqX96L1Ay03vFZ7
         Mu30srH+UbRkPQPie2yguZ+9Lv/VuKe5R7IHXLsFOdRlxsmCzJFMvZYYtcQmGpbtDXns
         pY9Q==
X-Gm-Message-State: AOAM533kPJEyiv0obKhQwhY4n/b2nDJVauMGMWKvk1oaX9RCakuuXuWu
	JqOlMqIAbRxUMj0MgtFF1bQ=
X-Google-Smtp-Source: ABdhPJx/buooncs7SbNYFsuLDN9rPZbfccw8RSBVoZCzxV0dqr3NMdf7mk2TrSBVPR0klTbUsuFsMw==
X-Received: by 2002:a05:6402:3483:: with SMTP id v3mr7321340edc.296.1633641565720;
        Thu, 07 Oct 2021 14:19:25 -0700 (PDT)
Subject: Re: [PATCH V5 3/3] xen/arm: Updates for extended regions support
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-4-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2110061843360.3209@sstabellini-ThinkPad-T480s>
 <a5a81348-4b18-6be6-ba85-4c31172459dc@gmail.com>
 <alpine.DEB.2.21.2110071300380.414@sstabellini-ThinkPad-T480s>
 <ff6800b3-74f0-3203-6465-1547644924e2@gmail.com>
 <alpine.DEB.2.21.2110071337550.414@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <fe6ed0ec-597a-9548-db68-465633892ca9@gmail.com>
Date: Fri, 8 Oct 2021 00:19:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110071337550.414@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.10.21 23:42, Stefano Stabellini wrote:

Hi Stefano

> On Thu, 7 Oct 2021, Oleksandr wrote:
>> On 07.10.21 23:06, Stefano Stabellini wrote:
>>> On Thu, 7 Oct 2021, Oleksandr wrote:
>>>> On 07.10.21 04:50, Stefano Stabellini wrote:
>>>>
>>>> Hi Stefano
>>>>
>>>>> On Wed, 6 Oct 2021, Oleksandr Tyshchenko wrote:
>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>
>>>>>> This is a follow-up of
>>>>>> "b6fe410 xen/arm: Add handling of extended regions for Dom0"
>>>>>>
>>>>>> Add various in-code comments, update Xen hypervisor device tree
>>>>>> bindings text, change the log level for some prints and clarify
>>>>>> format specifier, reuse dt_for_each_range() to avoid open-coding
>>>>>> in find_memory_holes().
>>>>>>
>>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>> Thanks for the patch, it looks like you addressed all Julien's comments
>>>>> well.
>>>> I believe so)
>>> [...]
>>>
>>>>>> @@ -1193,8 +1215,8 @@ static int __init make_hypervisor_node(struct
>>>>>> domain
>>>>>> *d,
>>>>>>             u64 start = ext_regions->bank[i].start;
>>>>>>             u64 size = ext_regions->bank[i].size;
>>>>>>     -        dt_dprintk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
>>>>>> -                   i, start, start + size);
>>>>>> +        printk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
>>>>>> +               i, start, start + size);
>>>>> Also should be PRIpaddr
>>>> I thought I needed to change specifier only for variables of type
>>>> "paddr_t",
>>>> but here "u64".
>>> Sorry, you are right.
>>>
>>> I added my reviewed-by and made the small typo changes on commit.
>> Thanks! In case if you haven't committed the patch yet, let's please wait for
>> Julien (who asked for this follow-up) to review it.
>>
>> In any case, I will be able to do another follow-up if needed.
>   
> I committed it as I would like to squeeze as many runs out of OSSTest
> and Gitlab-CI as possible as we are getting closer and closer to the
> release. I am trying to avoid the last minute rush to commit 150 patches
> one day before code freeze :-)
>
> The more intermediate runs we get, the easier is to pinpoint (and fix)
> regressions.

I got it, thank you for the explanation.


>
> But also, this patch doesn't affect external interfances, it is just
> internal and mostly comments, so it is super-easy to do follow-ups.

Yes, agree.


-- 
Regards,

Oleksandr Tyshchenko


