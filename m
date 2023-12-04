Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48555803B33
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 18:13:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647242.1010162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rACUy-0006wN-KS; Mon, 04 Dec 2023 17:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647242.1010162; Mon, 04 Dec 2023 17:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rACUy-0006u8-Hs; Mon, 04 Dec 2023 17:12:48 +0000
Received: by outflank-mailman (input) for mailman id 647242;
 Mon, 04 Dec 2023 17:12:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJlD=HP=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rACUx-0006u2-4B
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 17:12:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57bae942-92c8-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 18:12:46 +0100 (CET)
Received: from [192.168.1.9] (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id DA7524EE0C8A;
 Mon,  4 Dec 2023 18:12:44 +0100 (CET)
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
X-Inumbo-ID: 57bae942-92c8-11ee-98e5-6d05b1d4d9a1
Message-ID: <deaf5661-b4ed-432f-940f-11ff44681f2f@bugseng.com>
Date: Mon, 4 Dec 2023 18:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: address violations of MISRA C:2012 Rule 11.8.
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, maria.celeste.cesario@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <de2bfb322d91e99cf794c233461a04e638ee93aa.1701707356.git.maria.celeste.cesario@bugseng.com>
 <3c7abc30-20d7-4a4e-b963-27339952e7a3@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <3c7abc30-20d7-4a4e-b963-27339952e7a3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/23 17:54, Jan Beulich wrote:
> On 04.12.2023 17:32, Simone Ballarin wrote:
>> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
>>
>> Remove or amend casts to comply with Rule 11.8.
>>
>> Fix violations by adding missing const qualifier in cast.
>> Fix violations by removing unnecessary cast.
>> Change type of operands from char* to uintptr_t: uintptr_t is
>> the appropriate type for memory address operations.
>>
>> No functional changes.
>>
>> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
>> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> 
> I consider it good practice to at least briefly say what the rule is
> about, so it is clear why certain changes need doing.
> 
>> --- a/xen/arch/arm/include/asm/atomic.h
>> +++ b/xen/arch/arm/include/asm/atomic.h
>> @@ -154,7 +154,7 @@ static always_inline void write_atomic_size(volatile void *p,
>>    */
>>   static inline int atomic_read(const atomic_t *v)
>>   {
>> -    return *(volatile int *)&v->counter;
>> +    return *(const volatile int *)&v->counter;
>>   }
> 
> What about PPC's identical code?

If the ARM part is accepted, I will include this change in an upcoming 
series for Rule 11.8 (which I'm working on), otherwise in v4.

> 
>> --- a/xen/arch/x86/include/asm/regs.h
>> +++ b/xen/arch/x86/include/asm/regs.h
>> @@ -6,7 +6,7 @@
>>   
>>   #define guest_mode(r)                                                         \
>>   ({                                                                            \
>> -    unsigned long diff = (char *)guest_cpu_user_regs() - (char *)(r);         \
>> +    unsigned long diff = (uintptr_t)guest_cpu_user_regs() - (uintptr_t)(r);   \
>>       /* Frame pointer must point into current CPU stack. */                    \
>>       ASSERT(diff < STACK_SIZE);                                                \
>>       /* If not a guest frame, it must be a hypervisor frame. */                \
> 
> This part
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


