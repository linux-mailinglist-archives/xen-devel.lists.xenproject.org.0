Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B70800CBA
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 14:59:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645558.1007778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9434-0007od-Oj; Fri, 01 Dec 2023 13:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645558.1007778; Fri, 01 Dec 2023 13:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9434-0007mG-Ly; Fri, 01 Dec 2023 13:59:18 +0000
Received: by outflank-mailman (input) for mailman id 645558;
 Fri, 01 Dec 2023 13:59:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gkum=HM=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r9433-0007m8-HY
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 13:59:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0c747f2-9051-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 14:59:16 +0100 (CET)
Received: from [192.168.1.9] (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 6BB284EE073C;
 Fri,  1 Dec 2023 14:59:15 +0100 (CET)
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
X-Inumbo-ID: d0c747f2-9051-11ee-98e5-6d05b1d4d9a1
Message-ID: <cfa25bd3-296d-4668-b37d-90bc63c5c750@bugseng.com>
Date: Fri, 1 Dec 2023 14:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: address violations of MISRA C:2012 Rule 11.8.
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
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
 <e3e0f335-3894-4b62-af4b-835b1664907b@xen.org>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <e3e0f335-3894-4b62-af4b-835b1664907b@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/12/23 14:48, Julien Grall wrote:
> 
> 
> On 01/12/2023 13:42, Simone Ballarin wrote:
>> On 01/12/23 12:48, Julien Grall wrote:
>>> Hi Simone,
>>>
>>> On 01/12/2023 11:37, Simone Ballarin wrote:
>>>> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
>>>>
>>>> Remove or amend casts to comply with Rule 11.8.
>>>>
>>>> The violations are resolved either by adding missing const
>>>> qualifiers in casts or by removing unnecessary cast.
>>>>
>>>> Change type of operands from char* to uintptr_t: uintptr_t is
>>>> the appropriate type for memory address operations.
>>>>
>>>> No functional change.
>>>>
>>>> ---
>>>> Changes in v2:
>>>> - arm/regs.h: add const qualifier to the first operand,
>>>>      change types of both operands from char* to uintptr_t.
>>>> - x86/regs.h: add const qualifier to both operands. Change
>>>>      types of both operands from char* to uintptr_t to
>>>>      conform with the arm version.
>>>> - dom0less-build.c: rebase change in the new file.
>>>>
>>>> Signed-off-by: Maria Celeste Cesario 
>>>> <maria.celeste.cesario@bugseng.com>
>>>> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
>>>> ---
>>>>   xen/arch/arm/dom0less-build.c     | 2 +-
>>>>   xen/arch/arm/include/asm/atomic.h | 2 +-
>>>>   xen/arch/arm/include/asm/regs.h   | 2 +-
>>>>   xen/arch/x86/include/asm/regs.h   | 3 ++-
>>>>   4 files changed, 5 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/dom0less-build.c 
>>>> b/xen/arch/arm/dom0less-build.c
>>>> index d39cbd969a..fb63ec6fd1 100644
>>>> --- a/xen/arch/arm/dom0less-build.c
>>>> +++ b/xen/arch/arm/dom0less-build.c
>>>> @@ -354,7 +354,7 @@ static int __init handle_passthrough_prop(struct 
>>>> kernel_info *kinfo,
>>>>       if ( node == NULL )
>>>>       {
>>>>           printk(XENLOG_ERR "Couldn't find node %s in host_dt!\n",
>>>> -               (char *)xen_path->data);
>>>> +               xen_path->data);
>>>>           return -EINVAL;
>>>>       }
>>>> diff --git a/xen/arch/arm/include/asm/atomic.h 
>>>> b/xen/arch/arm/include/asm/atomic.h
>>>> index 64314d59b3..517216d2a8 100644
>>>> --- a/xen/arch/arm/include/asm/atomic.h
>>>> +++ b/xen/arch/arm/include/asm/atomic.h
>>>> @@ -154,7 +154,7 @@ static always_inline void 
>>>> write_atomic_size(volatile void *p,
>>>>    */
>>>>   static inline int atomic_read(const atomic_t *v)
>>>>   {
>>>> -    return *(volatile int *)&v->counter;
>>>> +    return *(const volatile int *)&v->counter;
>>>>   }
>>>>   static inline int _atomic_read(atomic_t v)
>>>> diff --git a/xen/arch/arm/include/asm/regs.h 
>>>> b/xen/arch/arm/include/asm/regs.h
>>>> index 8a0db95415..b28eb5de7a 100644
>>>> --- a/xen/arch/arm/include/asm/regs.h
>>>> +++ b/xen/arch/arm/include/asm/regs.h
>>>> @@ -48,7 +48,7 @@ static inline bool regs_mode_is_32bit(const struct 
>>>> cpu_user_regs *regs)
>>>>   static inline bool guest_mode(const struct cpu_user_regs *r)
>>>>   {
>>>> -    unsigned long diff = (char *)guest_cpu_user_regs() - (char *)(r);
>>>> +    unsigned long diff = (const uintptr_t)guest_cpu_user_regs() - 
>>>> (const uintptr_t)(r);
>>>
>>> NIT: The const should not be necessary here. Am I correct?
>>
>> The const in the first parameter is not necessary, I will drop it.
> 
> I am confused. In the case of 'r' the const applied to the pointee not 
> the pointer (e.g. the pointer can be modified but not the content). So 
> the 'const' should not be necessary even for the second parameter.
> 

Yes, sorry. Here there is no reason to use a const: if we cast to a 
non-pointer type (uintptr_t) rule 11.8 does not apply.

> Cheers,
> 

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


