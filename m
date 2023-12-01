Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410C7800C83
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 14:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645551.1007769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r93st-0004jf-SC; Fri, 01 Dec 2023 13:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645551.1007769; Fri, 01 Dec 2023 13:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r93st-0004hX-P6; Fri, 01 Dec 2023 13:48:47 +0000
Received: by outflank-mailman (input) for mailman id 645551;
 Fri, 01 Dec 2023 13:48:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r93ss-0004hR-3v
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 13:48:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r93sr-0000Az-43; Fri, 01 Dec 2023 13:48:45 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r93sq-0005Vq-Sm; Fri, 01 Dec 2023 13:48:44 +0000
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
	bh=2R66boRFwBsQho0+tHKj/fSCT3uqk/5VtRoJ5fdbFPk=; b=hnhDp37H2l8am57tBK/dx8bn2z
	vaemka1ot26wkvU+Jj6JeIUke+gKo+h9Gtr8NlrIs9PeewsNBinci23Cnq+EHRxS/i0Q5o6PnH5PL
	bBJvVwvEaLHQA+MgihYm/TzEuSq5xNeQGoaq8LT5mr7XvKfQiv2Xbgnw5mU8Jdtsveoo=;
Message-ID: <e3e0f335-3894-4b62-af4b-835b1664907b@xen.org>
Date: Fri, 1 Dec 2023 13:48:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: address violations of MISRA C:2012 Rule 11.8.
Content-Language: en-GB
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, maria.celeste.cesario@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <a295b44a9fbb02f962720e086588437876e02ce3.1701430079.git.maria.celeste.cesario@bugseng.com>
 <a33ffc19-1e1c-4126-aba4-4a2b0ee24cf4@xen.org>
 <19432dd3-991c-4508-b360-80520c30c196@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <19432dd3-991c-4508-b360-80520c30c196@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 01/12/2023 13:42, Simone Ballarin wrote:
> On 01/12/23 12:48, Julien Grall wrote:
>> Hi Simone,
>>
>> On 01/12/2023 11:37, Simone Ballarin wrote:
>>> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
>>>
>>> Remove or amend casts to comply with Rule 11.8.
>>>
>>> The violations are resolved either by adding missing const
>>> qualifiers in casts or by removing unnecessary cast.
>>>
>>> Change type of operands from char* to uintptr_t: uintptr_t is
>>> the appropriate type for memory address operations.
>>>
>>> No functional change.
>>>
>>> ---
>>> Changes in v2:
>>> - arm/regs.h: add const qualifier to the first operand,
>>>      change types of both operands from char* to uintptr_t.
>>> - x86/regs.h: add const qualifier to both operands. Change
>>>      types of both operands from char* to uintptr_t to
>>>      conform with the arm version.
>>> - dom0less-build.c: rebase change in the new file.
>>>
>>> Signed-off-by: Maria Celeste Cesario  
>>> <maria.celeste.cesario@bugseng.com>
>>> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
>>> ---
>>>   xen/arch/arm/dom0less-build.c     | 2 +-
>>>   xen/arch/arm/include/asm/atomic.h | 2 +-
>>>   xen/arch/arm/include/asm/regs.h   | 2 +-
>>>   xen/arch/x86/include/asm/regs.h   | 3 ++-
>>>   4 files changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/dom0less-build.c 
>>> b/xen/arch/arm/dom0less-build.c
>>> index d39cbd969a..fb63ec6fd1 100644
>>> --- a/xen/arch/arm/dom0less-build.c
>>> +++ b/xen/arch/arm/dom0less-build.c
>>> @@ -354,7 +354,7 @@ static int __init handle_passthrough_prop(struct 
>>> kernel_info *kinfo,
>>>       if ( node == NULL )
>>>       {
>>>           printk(XENLOG_ERR "Couldn't find node %s in host_dt!\n",
>>> -               (char *)xen_path->data);
>>> +               xen_path->data);
>>>           return -EINVAL;
>>>       }
>>> diff --git a/xen/arch/arm/include/asm/atomic.h 
>>> b/xen/arch/arm/include/asm/atomic.h
>>> index 64314d59b3..517216d2a8 100644
>>> --- a/xen/arch/arm/include/asm/atomic.h
>>> +++ b/xen/arch/arm/include/asm/atomic.h
>>> @@ -154,7 +154,7 @@ static always_inline void 
>>> write_atomic_size(volatile void *p,
>>>    */
>>>   static inline int atomic_read(const atomic_t *v)
>>>   {
>>> -    return *(volatile int *)&v->counter;
>>> +    return *(const volatile int *)&v->counter;
>>>   }
>>>   static inline int _atomic_read(atomic_t v)
>>> diff --git a/xen/arch/arm/include/asm/regs.h 
>>> b/xen/arch/arm/include/asm/regs.h
>>> index 8a0db95415..b28eb5de7a 100644
>>> --- a/xen/arch/arm/include/asm/regs.h
>>> +++ b/xen/arch/arm/include/asm/regs.h
>>> @@ -48,7 +48,7 @@ static inline bool regs_mode_is_32bit(const struct 
>>> cpu_user_regs *regs)
>>>   static inline bool guest_mode(const struct cpu_user_regs *r)
>>>   {
>>> -    unsigned long diff = (char *)guest_cpu_user_regs() - (char *)(r);
>>> +    unsigned long diff = (const uintptr_t)guest_cpu_user_regs() - 
>>> (const uintptr_t)(r);
>>
>> NIT: The const should not be necessary here. Am I correct?
> 
> The const in the first parameter is not necessary, I will drop it.

I am confused. In the case of 'r' the const applied to the pointee not 
the pointer (e.g. the pointer can be modified but not the content). So 
the 'const' should not be necessary even for the second parameter.

Cheers,

-- 
Julien Grall

