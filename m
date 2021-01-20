Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AA22FD485
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 16:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71588.128293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FkU-0000VJ-7s; Wed, 20 Jan 2021 15:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71588.128293; Wed, 20 Jan 2021 15:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FkU-0000Uu-4k; Wed, 20 Jan 2021 15:50:22 +0000
Received: by outflank-mailman (input) for mailman id 71588;
 Wed, 20 Jan 2021 15:50:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2FkS-0000UZ-5g
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:50:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2FkQ-0003if-RU; Wed, 20 Jan 2021 15:50:18 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2FkQ-00056G-Jw; Wed, 20 Jan 2021 15:50:18 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=zx+AlRkdxx+IC6P7dwq7aS0Ud2ST7RLf8GV0KKKc3E8=; b=y3vovgUjdDKFLG7zt5KtOaRx6w
	J6P38xjVcOlYQLWMbz6UX/mSA2sQuKS+hIILAvIngW4MZ8vj2gONfFPBUm7+npxSTpnzzm+Ns47FC
	j6MDPQeJ9V3AJRV9SeAbL3Suj9liR9FeDOMmBjp/NJ6GtUSFtaNRd3kiB7NXPRLEE7HQ=;
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
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
From: Julien Grall <julien@xen.org>
Message-ID: <57d95c18-5215-03e7-7849-73c9fe968e75@xen.org>
Date: Wed, 20 Jan 2021 15:50:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <e2dcc876-291f-1244-933c-179f97a84e07@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 17/01/2021 18:52, Oleksandr wrote:
>>>>>   diff --git a/xen/include/asm-arm/domain.h 
>>>>> b/xen/include/asm-arm/domain.h
>>>>> index 6819a3b..c235e5b 100644
>>>>> --- a/xen/include/asm-arm/domain.h
>>>>> +++ b/xen/include/asm-arm/domain.h
>>>>> @@ -10,6 +10,7 @@
>>>>>   #include <asm/gic.h>
>>>>>   #include <asm/vgic.h>
>>>>>   #include <asm/vpl011.h>
>>>>> +#include <public/hvm/dm_op.h>
>>>>
>>>> May I ask, why do you need to include dm_op.h here?
>>> I needed to include that header to make some bits visible 
>>> (XEN_DMOP_IO_RANGE_PCI, struct xen_dm_op_buf, etc). Why here - is a 
>>> really good question.
>>> I don't remember exactly, probably I followed x86's domain.h which 
>>> also included it.
>>> So, trying to remove the inclusion here, I get several build failures 
>>> on Arm which could be fixed if I include that header from dm.h and 
>>> ioreq.h:
>>>
>>> Shall I do this way?
>>
>> If the failure are indeded because ioreq.h and dm.h use definition 
>> from public/hvm/dm_op.h, then yes. Can you post the errors?
> Please see attached, although I built for Arm32 (and the whole series), 
> I think errors are valid for Arm64 also.

Thanks!

> error1.txt - when remove #include <public/hvm/dm_op.h> from 
> asm-arm/domain.h

For this one, I agree that including <public/hvm/dm_op.h> in xen.h looks 
the best solution.

> error2.txt - when add #include <public/hvm/dm_op.h> to xen/ioreq.h

It looks like the error is happening in dm.c rather than xen/dm.h. Any 
reason to not include <public/hvm/dm_op.h> in dm.c directly?


> error3.txt - when add #include <public/hvm/dm_op.h> to xen/dm.h

I am a bit confused with this one. Isn't it the same as error1.txt?

> 
> 
>>
>>
>> [...]
>>
>>>>>   #include <public/hvm/params.h>
>>>>>     struct hvm_domain
>>>>> @@ -262,6 +263,8 @@ static inline void arch_vcpu_block(struct vcpu 
>>>>> *v) {}
>>>>>     #define arch_vm_assist_valid_mask(d) (1UL << 
>>>>> VMASST_TYPE_runstate_update_flag)
>>>>>   +#define has_vpci(d)    ({ (void)(d); false; })
>>>>> +
>>>>>   #endif /* __ASM_DOMAIN_H__ */
>>>>>     /*
>>>>> diff --git a/xen/include/asm-arm/hvm/ioreq.h 
>>>>> b/xen/include/asm-arm/hvm/ioreq.h
>>>>> new file mode 100644
>>>>> index 0000000..19e1247
>>>>> --- /dev/null
>>>>> +++ b/xen/include/asm-arm/hvm/ioreq.h
>>>>
>>>> Shouldn't this directly be under asm-arm/ rather than asm-arm/hvm/ 
>>>> as the IOREQ is now meant to be agnostic?
>>> Good question... The _common_ IOREQ code is indeed arch-agnostic. 
>>> But, can the _arch_ IOREQ code be treated as really subarch-agnostic?
>>> I think, on Arm it can and it is most likely ok to keep it in 
>>> "asm-arm/", but how it would be correlated with x86's IOREQ code 
>>> which is HVM specific and located
>>> in "hvm" subdir?
>>
>> Sorry, I don't understand your answer/questions. So let me ask the 
>> question differently, is asm-arm/hvm/ioreq.h going to be included from 
>> common code?
> 
> Sorry if I was unclear.
> 
> 
>>
>> If the answer is no, then I see no reason to follow the x86 here.
>> If the answer is yes, then I am quite confused why half of the series 
>> tried to remove "hvm" from the function name but we still include 
>> "asm/hvm/ioreq.h".
> 
> Answer is yes. Even if we could to avoid including that header from the 
> common code somehow, we would still have #include <public/hvm/*>, 
> is_hvm_domain().

I saw Jan answered about this one. Let me know if you need more input.

Cheers,

-- 
Julien Grall

