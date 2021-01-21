Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2852FE55C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 09:50:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71930.129184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2VfW-0004sU-VE; Thu, 21 Jan 2021 08:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71930.129184; Thu, 21 Jan 2021 08:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2VfW-0004s5-S0; Thu, 21 Jan 2021 08:50:18 +0000
Received: by outflank-mailman (input) for mailman id 71930;
 Thu, 21 Jan 2021 08:50:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/JE=GY=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l2VfU-0004s0-Vf
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 08:50:17 +0000
Received: from mail-lj1-x235.google.com (unknown [2a00:1450:4864:20::235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8234c358-aac5-4336-bb1b-f2831f35d7e6;
 Thu, 21 Jan 2021 08:50:15 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id f4so693488ljo.11
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 00:50:15 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o11sm142074lfu.157.2021.01.21.00.50.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 00:50:13 -0800 (PST)
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
X-Inumbo-ID: 8234c358-aac5-4336-bb1b-f2831f35d7e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7/cfjmDColEQwTPQJf+7rIhYq0lKqVHMI8QBd5uJlMc=;
        b=OEl1LJ0REuCU7UWIY6hqMvijyfB8/8l8YPe9NNmzLat/7FTcxRx3XwAXZbRBm7varB
         Jt40vk3HNuR/tBvZwdKQaV4KYOrIyZ1n9ONFc+Wrna2Gv1HLCscD80l9sutymJauBlVO
         HO+fudpdbS0g6OHRwN3f4U7tQ/f0WaqITMpTpYoBxZz+ZG4A3sAfsfvK+dbnsetPSWLH
         9foCsLhaCj9HI7DyBjmikEbjmpltdUrCYjhPh7D996Hpm5E66Yne/W0jHRMH4ObDDK4m
         hP/KytmoB23PUxCunOsgqnngaeHLjcnPL5UrYs07JdjuCzslk1g7Y1WEgYk1KS1Qjjz8
         L3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7/cfjmDColEQwTPQJf+7rIhYq0lKqVHMI8QBd5uJlMc=;
        b=J0SY7E0QUPqR7ELkYR8IILP0SEnjF8xbHlDYLiQ5PSnrM6AiXDAcKpmp9haFwxCo9N
         iR0/8G3WRA0P5Tcy2J5xTWo7FUo4LolN697sXkGOR0HSwaM7InaIG/keUbcYz3MYKTfc
         /hRxBf6nHyCD/B3nOqxoF1qLjqBwLhYXHX1ozVdqZ+sLIOLheJ5ngIJyb51BVHntADGe
         c28A9fVI+y2c7dRW8/LmjKGBQ7YOm4R2lEdZC2lI9BVitL8XQzeyl3Z1VZGz5St+3of6
         pCqXMqcUAiEAvbqxsH0VvP1ytDD5d5Zq3iFNFWaxc2CmbZnLJJKwuyDfRgYP/nzEiw6H
         yoyA==
X-Gm-Message-State: AOAM533582GsFN5Jc/GOLw6r+NGuLl7xfkNOIAzIeXPuFquc+gizMMr7
	5oD6TpD1yMlkNmnzDpUZkNM=
X-Google-Smtp-Source: ABdhPJxgW0Q/23r4Wp8dKxiuaVl34Al3KgzgGqgz/lQpjnZrwZcRC/1HBcGq8mCGWhrZhEAOXnXZww==
X-Received: by 2002:a2e:8e63:: with SMTP id t3mr6289676ljk.88.1611219014704;
        Thu, 21 Jan 2021 00:50:14 -0800 (PST)
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
 <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org>
 <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com>
 <06704224-bb57-c55e-a2ee-23032095e8ea@xen.org>
 <e2dcc876-291f-1244-933c-179f97a84e07@gmail.com>
 <57d95c18-5215-03e7-7849-73c9fe968e75@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e0bc7f80-974e-945d-4605-173bd05302af@gmail.com>
Date: Thu, 21 Jan 2021 10:50:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <57d95c18-5215-03e7-7849-73c9fe968e75@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 20.01.21 17:50, Julien Grall wrote:
> Hi Oleksandr,


Hi Julien



>
> On 17/01/2021 18:52, Oleksandr wrote:
>>>>>>   diff --git a/xen/include/asm-arm/domain.h 
>>>>>> b/xen/include/asm-arm/domain.h
>>>>>> index 6819a3b..c235e5b 100644
>>>>>> --- a/xen/include/asm-arm/domain.h
>>>>>> +++ b/xen/include/asm-arm/domain.h
>>>>>> @@ -10,6 +10,7 @@
>>>>>>   #include <asm/gic.h>
>>>>>>   #include <asm/vgic.h>
>>>>>>   #include <asm/vpl011.h>
>>>>>> +#include <public/hvm/dm_op.h>
>>>>>
>>>>> May I ask, why do you need to include dm_op.h here?
>>>> I needed to include that header to make some bits visible 
>>>> (XEN_DMOP_IO_RANGE_PCI, struct xen_dm_op_buf, etc). Why here - is a 
>>>> really good question.
>>>> I don't remember exactly, probably I followed x86's domain.h which 
>>>> also included it.
>>>> So, trying to remove the inclusion here, I get several build 
>>>> failures on Arm which could be fixed if I include that header from 
>>>> dm.h and ioreq.h:
>>>>
>>>> Shall I do this way?
>>>
>>> If the failure are indeded because ioreq.h and dm.h use definition 
>>> from public/hvm/dm_op.h, then yes. Can you post the errors?
>> Please see attached, although I built for Arm32 (and the whole 
>> series), I think errors are valid for Arm64 also.
>
> Thanks!
>
>> error1.txt - when remove #include <public/hvm/dm_op.h> from 
>> asm-arm/domain.h
>
> For this one, I agree that including <public/hvm/dm_op.h> in xen.h 
> looks the best solution.

Yes, I assume you meant in "ioreq.h"

>
>
>> error2.txt - when add #include <public/hvm/dm_op.h> to xen/ioreq.h
>
> It looks like the error is happening in dm.c rather than xen/dm.h. Any 
> reason to not include <public/hvm/dm_op.h> in dm.c directly?
Including it directly doesn't solve build issue.
If I am not mistaken in order to follow requirements how to include 
headers (alphabetic order, public* should be included after xen* and 
asm* ones, etc)
the dm.h gets included the first in dm.c, and dm_op.h gets included the 
last. We can avoid build issue if we change inclusion order a bit,
what I mean is to include dm.h after hypercall.h at least (because 
hypercall.h already includes dm_op.h). But this breaks the requirements 
and is not way to go.
Now I am in doubt how to overcome this.


>
>
>
>> error3.txt - when add #include <public/hvm/dm_op.h> to xen/dm.h
>
> I am a bit confused with this one. Isn't it the same as error1.txt?

The same, please ignore them, sorry for the confusion.


>
>
>>
>>
>>>
>>>
>>> [...]
>>>
>>>>>>   #include <public/hvm/params.h>
>>>>>>     struct hvm_domain
>>>>>> @@ -262,6 +263,8 @@ static inline void arch_vcpu_block(struct 
>>>>>> vcpu *v) {}
>>>>>>     #define arch_vm_assist_valid_mask(d) (1UL << 
>>>>>> VMASST_TYPE_runstate_update_flag)
>>>>>>   +#define has_vpci(d)    ({ (void)(d); false; })
>>>>>> +
>>>>>>   #endif /* __ASM_DOMAIN_H__ */
>>>>>>     /*
>>>>>> diff --git a/xen/include/asm-arm/hvm/ioreq.h 
>>>>>> b/xen/include/asm-arm/hvm/ioreq.h
>>>>>> new file mode 100644
>>>>>> index 0000000..19e1247
>>>>>> --- /dev/null
>>>>>> +++ b/xen/include/asm-arm/hvm/ioreq.h
>>>>>
>>>>> Shouldn't this directly be under asm-arm/ rather than asm-arm/hvm/ 
>>>>> as the IOREQ is now meant to be agnostic?
>>>> Good question... The _common_ IOREQ code is indeed arch-agnostic. 
>>>> But, can the _arch_ IOREQ code be treated as really subarch-agnostic?
>>>> I think, on Arm it can and it is most likely ok to keep it in 
>>>> "asm-arm/", but how it would be correlated with x86's IOREQ code 
>>>> which is HVM specific and located
>>>> in "hvm" subdir?
>>>
>>> Sorry, I don't understand your answer/questions. So let me ask the 
>>> question differently, is asm-arm/hvm/ioreq.h going to be included 
>>> from common code?
>>
>> Sorry if I was unclear.
>>
>>
>>>
>>> If the answer is no, then I see no reason to follow the x86 here.
>>> If the answer is yes, then I am quite confused why half of the 
>>> series tried to remove "hvm" from the function name but we still 
>>> include "asm/hvm/ioreq.h".
>>
>> Answer is yes. Even if we could to avoid including that header from 
>> the common code somehow, we would still have #include <public/hvm/*>, 
>> is_hvm_domain().
>
> I saw Jan answered about this one. Let me know if you need more input.

Thank you, I think, no. Everything is clear at the moment.


>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


