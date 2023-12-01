Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53260800C6D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 14:43:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645543.1007748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r93nO-00038n-1l; Fri, 01 Dec 2023 13:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645543.1007748; Fri, 01 Dec 2023 13:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r93nN-000364-VE; Fri, 01 Dec 2023 13:43:05 +0000
Received: by outflank-mailman (input) for mailman id 645543;
 Fri, 01 Dec 2023 13:43:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gkum=HM=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r93nL-00035y-Qs
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 13:43:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bb54f02-904f-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 14:43:01 +0100 (CET)
Received: from [192.168.1.9] (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 9298D4EE073C;
 Fri,  1 Dec 2023 14:43:00 +0100 (CET)
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
X-Inumbo-ID: 8bb54f02-904f-11ee-98e5-6d05b1d4d9a1
Message-ID: <19432dd3-991c-4508-b360-80520c30c196@bugseng.com>
Date: Fri, 1 Dec 2023 14:42:59 +0100
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
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <a33ffc19-1e1c-4126-aba4-4a2b0ee24cf4@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/12/23 12:48, Julien Grall wrote:
> Hi Simone,
> 
> On 01/12/2023 11:37, Simone Ballarin wrote:
>> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
>>
>> Remove or amend casts to comply with Rule 11.8.
>>
>> The violations are resolved either by adding missing const
>> qualifiers in casts or by removing unnecessary cast.
>>
>> Change type of operands from char* to uintptr_t: uintptr_t is
>> the appropriate type for memory address operations.
>>
>> No functional change.
>>
>> ---
>> Changes in v2:
>> - arm/regs.h: add const qualifier to the first operand,
>>      change types of both operands from char* to uintptr_t.
>> - x86/regs.h: add const qualifier to both operands. Change
>>      types of both operands from char* to uintptr_t to
>>      conform with the arm version.
>> - dom0less-build.c: rebase change in the new file.
>>
>> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
>> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
>> ---
>>   xen/arch/arm/dom0less-build.c     | 2 +-
>>   xen/arch/arm/include/asm/atomic.h | 2 +-
>>   xen/arch/arm/include/asm/regs.h   | 2 +-
>>   xen/arch/x86/include/asm/regs.h   | 3 ++-
>>   4 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/dom0less-build.c 
>> b/xen/arch/arm/dom0less-build.c
>> index d39cbd969a..fb63ec6fd1 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -354,7 +354,7 @@ static int __init handle_passthrough_prop(struct 
>> kernel_info *kinfo,
>>       if ( node == NULL )
>>       {
>>           printk(XENLOG_ERR "Couldn't find node %s in host_dt!\n",
>> -               (char *)xen_path->data);
>> +               xen_path->data);
>>           return -EINVAL;
>>       }
>> diff --git a/xen/arch/arm/include/asm/atomic.h 
>> b/xen/arch/arm/include/asm/atomic.h
>> index 64314d59b3..517216d2a8 100644
>> --- a/xen/arch/arm/include/asm/atomic.h
>> +++ b/xen/arch/arm/include/asm/atomic.h
>> @@ -154,7 +154,7 @@ static always_inline void 
>> write_atomic_size(volatile void *p,
>>    */
>>   static inline int atomic_read(const atomic_t *v)
>>   {
>> -    return *(volatile int *)&v->counter;
>> +    return *(const volatile int *)&v->counter;
>>   }
>>   static inline int _atomic_read(atomic_t v)
>> diff --git a/xen/arch/arm/include/asm/regs.h 
>> b/xen/arch/arm/include/asm/regs.h
>> index 8a0db95415..b28eb5de7a 100644
>> --- a/xen/arch/arm/include/asm/regs.h
>> +++ b/xen/arch/arm/include/asm/regs.h
>> @@ -48,7 +48,7 @@ static inline bool regs_mode_is_32bit(const struct 
>> cpu_user_regs *regs)
>>   static inline bool guest_mode(const struct cpu_user_regs *r)
>>   {
>> -    unsigned long diff = (char *)guest_cpu_user_regs() - (char *)(r);
>> +    unsigned long diff = (const uintptr_t)guest_cpu_user_regs() - 
>> (const uintptr_t)(r);
> 
> NIT: The const should not be necessary here. Am I correct?

The const in the first parameter is not necessary, I will drop it.

> 
>>       /* Frame pointer must point into current CPU stack. */
>>       ASSERT(diff < STACK_SIZE);
>>       /* If not a guest frame, it must be a hypervisor frame. */
>> diff --git a/xen/arch/x86/include/asm/regs.h 
>> b/xen/arch/x86/include/asm/regs.h
>> index 3fb94deedc..64f1e0d400 100644
>> --- a/xen/arch/x86/include/asm/regs.h
>> +++ b/xen/arch/x86/include/asm/regs.h
>> @@ -6,7 +6,8 @@
>>   #define 
>> guest_mode(r)                                                         \
>>   
>> ({                                                                            \
>> -    unsigned long diff = (char *)guest_cpu_user_regs() - (char 
>> *)(r);         \
>> +    unsigned long diff = (const uintptr_t)guest_cpu_user_regs() 
>> -             \
>> +                                                        (const 
>> uintptr_t(r)); \
> 
> Was this compiled on x86? Shouldn't the last one be (const uintptr_t)(r))?
> 

Yes, you are right. I'll fix in it in v3.

> Cheers,
> 

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


