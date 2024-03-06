Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A53873415
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 11:25:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689032.1073932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhoRs-00085f-V4; Wed, 06 Mar 2024 10:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689032.1073932; Wed, 06 Mar 2024 10:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhoRs-00082v-SS; Wed, 06 Mar 2024 10:24:32 +0000
Received: by outflank-mailman (input) for mailman id 689032;
 Wed, 06 Mar 2024 10:24:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rhoRr-00082p-Lw
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 10:24:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rhoRl-0003vs-6I; Wed, 06 Mar 2024 10:24:25 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rhoRk-0005pD-TJ; Wed, 06 Mar 2024 10:24:25 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=USlFkwQQXNjREb0RjuNpLPpBaj0cLKNsxoJ/LiNtvvM=; b=RTZb++6v3PvErwKGkny2o8dvdH
	CuWSHRZGYvF10SmpmzV0P5mYTEAu+PDqD0w6MVZtWwd9yQ7j23HBUHrltzST37ed10/L27rRvIfw8
	afJKjwv3bMUGdWIo6wQ9KZzdS+ZFgInBVd3S1G5hSb4ZzwZ9NOqP5jM3pB8BOt8XXkVA=;
Message-ID: <3264c64f-815a-4340-85cc-286c4983e902@xen.org>
Date: Wed, 6 Mar 2024 10:24:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86+Arm: drop (rename) __virt_to_maddr() /
 __maddr_to_virt()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b837e02d-fd65-458f-a946-ea36a52ddd3e@suse.com>
 <ce705871-bda9-4518-96da-010f24c98512@xen.org>
 <6fb7b2c9-6665-4cbd-a1c4-24ebf7514b88@suse.com>
 <be2a0d46-4b2f-444d-8ae7-2e3d1f9d03c4@xen.org>
 <610e5e76-db0f-4509-84ed-c1bc085b4b6e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <610e5e76-db0f-4509-84ed-c1bc085b4b6e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/03/2024 09:59, Jan Beulich wrote:
> On 06.03.2024 10:44, Julien Grall wrote:
>> On 06/03/2024 07:22, Jan Beulich wrote:
>>> On 05.03.2024 20:24, Julien Grall wrote:
>>>> The title is quite confusing. I would have expected the macro...
>>>>
>>>> On 05/03/2024 08:33, Jan Beulich wrote:
>>>>> There's no use of them anymore except in the definitions of the non-
>>>>> underscore-prefixed aliases. Rename the inline functions, adjust the
>>>>> virt_to_maddr() #define-e, and purge the (x86-only) maddr_to_virt() one,
>>>>> thus eliminating a bogus cast which would have allowed the passing of a
>>>>> pointer type variable into maddr_to_virt() to go silently.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> --- a/xen/arch/arm/include/asm/mm.h
>>>>> +++ b/xen/arch/arm/include/asm/mm.h
>>>>> @@ -256,12 +256,12 @@ static inline void __iomem *ioremap_wc(p
>>>>>     /* Page-align address and convert to frame number format */
>>>>>     #define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
>>>>>     
>>>>> -static inline paddr_t __virt_to_maddr(vaddr_t va)
>>>>> +static inline paddr_t virt_to_maddr(vaddr_t va)
>>>>>     {
>>>>>         uint64_t par = va_to_par(va);
>>>>>         return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
>>>>>     }
>>>>> -#define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
>>>>> +#define virt_to_maddr(va) virt_to_maddr((vaddr_t)(va))
>>>>
>>>> ... to be removed. But you keep it and just overload the name. I know it
>>>> is not possible to remove the macro because some callers are using
>>>> pointers (?).
>>>
>>> Indeed. I actually tried without, but the build fails miserably.
>>>
>>>> So I would rather prefer if we keep the name distinct on Arm.
>>>>
>>>> Let see what the other Arm maintainers think.
>>>
>>> Well, okay. I'm a little surprised though; I was under the impression
>>> that a goal would be to, eventually, get rid of all the __-prefixed
>>> secondary variants of this kind of helpers.
>>
>> Because of MISRA? If so, you would be replacing one violation by another
>> one (duplicated name). IIRC we decided to deviate it, yet I don't
>> particular want to use the pattern in Arm headers when there is no need.
>>
>> If you are trying to solve MISRA, then I think we want to either remove
>> the macro (not possible here) or suffix with the double-underscore the
>> static inline helper.
> 
> No, Misra is only secondary here. Many of these helpers come in two flavors
> such than one can be overridden in individual source files. That's mainly
> connected to type-safety being generally wanted, but not always easy to
> achieve without a lot of code churn. We've made quite a bit of progress
> there, and imo ultimately the need for two flavors of doing the same thing
> ought to disappear.

What about converting the static inline to a macro? As we cast 'va', I 
don't think we have any benefits to keep the static inline helper and 
provide a thin wrapper with just a cast.

This would address my concern and possibly address your wish to remove 
the double-underscore version.

Cheers,


-- 
Julien Grall

