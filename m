Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0240780815
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 11:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585886.917087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWvZf-0005wr-Mk; Fri, 18 Aug 2023 09:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585886.917087; Fri, 18 Aug 2023 09:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWvZf-0005v5-Jw; Fri, 18 Aug 2023 09:15:19 +0000
Received: by outflank-mailman (input) for mailman id 585886;
 Fri, 18 Aug 2023 09:15:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWvZe-0005uz-Or
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 09:15:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWvZa-0004Xl-ID; Fri, 18 Aug 2023 09:15:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWvZa-0006kv-Cr; Fri, 18 Aug 2023 09:15:14 +0000
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
	bh=PG15t376dXHfO+vwxn6Gcvzc92mrPJ12GlgCJNyR/3o=; b=c6Kl/1DKYZKjF/MvWgmNyT/1zY
	QzgeQwZQgNoUQ3vVPf0F3ZvrBOwEKK+4uws2eW8u5AJAswVeMylZFGShfsJfTZ3MDZ5sVO2RMNPYH
	7a8hd3ivW6Y0sj77BcbjjwvQC3jX2WTfyUFUu+aR+8eXP0m5cwW5Z3cNeu2FO523DARA=;
Message-ID: <2bb2291a-a931-48c5-b398-fe813db89ec2@xen.org>
Date: Fri, 18 Aug 2023 10:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/public: arch-arm: All PSR_* defines should be
 unsigned
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230817214356.47174-1-julien@xen.org>
 <20230817214356.47174-4-julien@xen.org>
 <93ccb2c0-fa2c-3e84-35bf-3d86aef7a2bd@suse.com>
 <2b86f83a-6352-4b43-835b-6c56ad8260ba@xen.org>
 <857a72e2-4716-4419-9955-ad044e73151d@suse.com>
 <cb383251-3c90-4579-b6c5-19662d828969@xen.org>
 <8a463a31-0bbd-414f-91ea-7d5342cbc148@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8a463a31-0bbd-414f-91ea-7d5342cbc148@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 18/08/2023 09:25, Juergen Gross wrote:
> On 18.08.23 10:05, Julien Grall wrote:
>> Hi,
>>
>> On 18/08/2023 09:00, Juergen Gross wrote:
>>> On 18.08.23 09:39, Julien Grall wrote:
>>>> Hi Jan,
>>>>
>>>> On 18/08/2023 07:33, Jan Beulich wrote:
>>>>> On 17.08.2023 23:43, Julien Grall wrote:
>>>>>> --- a/xen/include/public/arch-arm.h
>>>>>> +++ b/xen/include/public/arch-arm.h
>>>>>> @@ -339,36 +339,36 @@ typedef uint64_t xen_callback_t;
>>>>>>   /* PSR bits (CPSR, SPSR) */
>>>>>> -#define PSR_THUMB       (1<<5)        /* Thumb Mode enable */
>>>>>> -#define PSR_FIQ_MASK    (1<<6)        /* Fast Interrupt mask */
>>>>>> -#define PSR_IRQ_MASK    (1<<7)        /* Interrupt mask */
>>>>>> -#define PSR_ABT_MASK    (1<<8)        /* Asynchronous Abort mask */
>>>>>> -#define PSR_BIG_ENDIAN  (1<<9)        /* arm32: Big Endian Mode */
>>>>>> -#define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception 
>>>>>> mask */
>>>>>> -#define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
>>>>>> -#define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
>>>>>> -#define PSR_Z           (1<<30)       /* Zero condition flag */
>>>>>> +#define PSR_THUMB       (1U <<5)      /* Thumb Mode enable */
>>>>>> +#define PSR_FIQ_MASK    (1U <<6)      /* Fast Interrupt mask */
>>>>>> +#define PSR_IRQ_MASK    (1U <<7)      /* Interrupt mask */
>>>>>> +#define PSR_ABT_MASK    (1U <<8)      /* Asynchronous Abort mask */
>>>>>
>>>>> Nit: Did you mean to insert blanks also on the rhs of the <<, like 
>>>>> you ...
>>>>>
>>>>>> +#define PSR_BIG_ENDIAN  (1U << 9)     /* arm32: Big Endian Mode */
>>>>>> +#define PSR_DBG_MASK    (1U << 9)     /* arm64: Debug Exception 
>>>>>> mask */
>>>>>> +#define PSR_IT_MASK     (0x0600fc00U) /* Thumb If-Then Mask */
>>>>>> +#define PSR_JAZELLE     (1U << 24)    /* Jazelle Mode */
>>>>>> +#define PSR_Z           (1U << 30)    /* Zero condition flag */
>>>>>
>>>>> ... did everywhere here?
>>>>
>>>> Yes I did. I will update the patch.
>>>>
>>>>>
>>>>> As an aside I wonder why they're here: They look like definitions of
>>>>> processor registers, which aren't under our (Xen's) control.
>>>>
>>>> I agree they are not under Xen's control. However, they are used by 
>>>> the toolstack and IIRC back then they were not available in any 
>>>> other headers.
>>>>
>>>> Note that they are only available by the tools and the hypervisor 
>>>> (see #ifdef above).
>>>>
>>>>> I ask in
>>>>> part because the presence of such constants may then be taken as
>>>>> justification to add similar things in new ports. Yet such definitions
>>>>> shouldn't be put here.
>>>>
>>>>  From my understanding we are using the public headers to provide 
>>>> macros/defines that are used by both the toolstack and the 
>>>> hypervisor. If they are not meant to be exposed to the guest, then 
>>>> they will be protected with "#if defined(__XEN__) || 
>>>> defined(__XEN_TOOLS__)".
>>>>
>>>> I think we are in a similar situation here. So it is not clear where 
>>>> they should be put if we need to share them between the hypervisor 
>>>> and the toolstack.
>>>
>>> What about include/xen/lib? There are headers below that linked at 
>>> build time
>>> via tools/include/Makefile to tools/include/xen/lib.
>>
>> To me, the question is why would we want to move PSR_* in xen/lib (or 
>> whatever name we decide) but all the other defines that are only used 
>> by the toolstack would still be in public/.
>>
>> So are you suggesting to move all the tools only information in xen/lib?
> 
> I didn't want to suggest that, especially with our general desire to 
> switch the
> tools' interfaces to stable ones.

Ok. If there are a desire to switch the tools interface to stables one. 
Then...

> 
> I just wanted to point out that there are other locations available already
> where such information could be shared between hypervisor and tools. 
> Especially
> information related to hardware (so not an interface we are defining) 
> might be
> a good candidate for such an alternative location.

... I disagree with moving PSR_* outside of the public interface because 
they are those defines are used in hypercalls. So they would be part of 
the ABI.

Cheers,

-- 
Julien Grall

