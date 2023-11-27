Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410557FA2EE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:35:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642174.1001476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7chn-0007vn-2K; Mon, 27 Nov 2023 14:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642174.1001476; Mon, 27 Nov 2023 14:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7chm-0007sx-W1; Mon, 27 Nov 2023 14:35:22 +0000
Received: by outflank-mailman (input) for mailman id 642174;
 Mon, 27 Nov 2023 14:35:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D1Su=HI=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r7chl-0007po-LL
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:35:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30bfec85-8d32-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 15:35:20 +0100 (CET)
Received: from [192.168.1.9] (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 500AB4EE0737;
 Mon, 27 Nov 2023 15:35:19 +0100 (CET)
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
X-Inumbo-ID: 30bfec85-8d32-11ee-98e2-6d05b1d4d9a1
Message-ID: <59744708-c2fb-488c-9e6b-e47faf7a8007@bugseng.com>
Date: Mon, 27 Nov 2023 15:35:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] xen/arm: add SAF deviation for debugging and
 logging effects
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1700844359.git.simone.ballarin@bugseng.com>
 <761ce615438312ca5d37fb8829a0ba903375392f.1700844359.git.simone.ballarin@bugseng.com>
 <ec587cf6-088b-4142-8067-4d9d67fc58c1@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <ec587cf6-088b-4142-8067-4d9d67fc58c1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/23 11:46, Jan Beulich wrote:
> On 24.11.2023 18:29, Simone Ballarin wrote:
>> Rule 13.1: Initializer lists shall not contain persistent side effects
>>
>> Effects caused by debug/logging macros and functions (like ASSERT, __bad_atomic_size,
>> LOG, etc ...) that crash execution or produce logs are not dangerous in initializer
>> lists. The evaluation order in abnormal conditions is not relevant. Evaluation order
>> of logging effects is always safe.
>>
>> This patch deviates violations using SAF commits caused by debug/logging macros and
>> functions.
>>
>> Asm volatile statements in initializer lists that do not perform any persistent side
>> effect are safe: this patch deviates violations caused by uses of the current macro
>> (that contains an asm volatile) in initializer lists.
>>
>> No functional changes.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>
>> ---
>> Changes in v2:
>> New patch based on the discussion for "xen/arm: address violations of MISRA C:2012 Rule 13.1".
>> ---
>>   docs/misra/safe.json     | 16 ++++++++++++++++
>>   xen/arch/arm/device.c    |  1 +
>>   xen/arch/arm/guestcopy.c |  4 ++++
>>   xen/arch/x86/hvm/hvm.c   |  1 +
>>   xen/common/sched/core.c  |  3 +++
> 
> The latter two don't really fit the title prefix.
> 
>> --- a/docs/misra/safe.json
>> +++ b/docs/misra/safe.json
>> @@ -28,6 +28,22 @@
>>           },
>>           {
>>               "id": "SAF-3-safe",
>> +            "analyser": {
>> +                "eclair": "MC3R1.R13.1"
>> +            },
>> +            "name": "MC3R1.R13.1: effects for debugging and logging",
>> +            "text": "Effects for debugging and loggings reasons that crash execution or produce logs are allowed in initializer lists. The evaluation order in abnormal conditions is not relevant."
>> +        },
> 
> I'm wary of this statement. Order may not matter much anymore _after_ an
> abnormal condition was encountered, but in the course of determining whether
> an abnormal condition might have been reached it may very well still matter.
> 

Do you object to the deviation in general? Or just to the wording?

>> +        {
>> +            "id": "SAF-4-safe",
>> +            "analyser": {
>> +                "eclair": "MC3R1.R13.1"
>> +            },
>> +            "name": "MC3R1.R13.1: volatile asm statements that do not perform any persistent side effect",
>> +            "text": "Volatile asm statements in an initializer list if do not perform persistent side effects are safe."
> 
> Since each respective comment ought to affect just a single asm(), I think
> this wants writing in singular. I further don't think it is useful for
> "text" to largely restate what "name" already says.
> 

Ok.

>> --- a/xen/arch/arm/device.c
>> +++ b/xen/arch/arm/device.c
>> @@ -331,6 +331,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>>           .p2mt = p2mt,
>>           .skip_mapping = !own_device ||
>>                           (is_pci_passthrough_enabled() &&
>> +                        /* SAF-3-safe effects for debugging/logging reasons are safe */
>>                           (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
> 
> What's the debugging / logging reason on the commented line?

The "ASSERT(dev != NULL)" in its body.

> 
>> --- a/xen/arch/arm/guestcopy.c
>> +++ b/xen/arch/arm/guestcopy.c
>> @@ -110,18 +110,21 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>>   unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>>   {
>>       return copy_guest((void *)from, (vaddr_t)to, len,
>> +                      /* SAF-4-safe No persistent side effects */
>>                         GVA_INFO(current), COPY_to_guest | COPY_linear);
>>   }
>>   
>>   unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
>>                                                unsigned int len)
>>   {
>> +    /* SAF-4-safe No persistent side effects */
>>       return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current),
>>                         COPY_to_guest | COPY_flush_dcache | COPY_linear);
>>   }
>>   
>>   unsigned long raw_clear_guest(void *to, unsigned int len)
>>   {
>> +    /* SAF-4-safe No persistent side effects */
>>       return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current),
>>                         COPY_to_guest | COPY_linear);
>>   }
>> @@ -129,6 +132,7 @@ unsigned long raw_clear_guest(void *to, unsigned int len)
>>   unsigned long raw_copy_from_guest(void *to, const void __user *from,
>>                                     unsigned int len)
>>   {
>> +    /* SAF-4-safe No persistent side effects */
>>       return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current),
>>                         COPY_from_guest | COPY_linear);
>>   }
> 
> I can only guess that in all four of these it's the use of "current" which
> requires the comment. Yet imo that either needs making explicit, or such a
> comment shouldn't go on use sites of "current", but on its definition site.
> 

"current" does not contain any violation of R13.1. Its expansion
produces a side-effect, but this is not a problem in itself. The real
problem is that GVA_INFO expands it in an initializer list:
#define GVA_INFO(vcpu) ((copy_info_t) { .gva = { vcpu } })

GVA_INFO(current) is the real piece of code that requires to be
deviated.

>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -1517,6 +1517,7 @@ long vcpu_yield(void)
>>   
>>       SCHED_STAT_CRANK(vcpu_yield);
>>   
>> +    /* SAF-4-safe No persistent side effects */
>>       TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
>>       raise_softirq(SCHEDULE_SOFTIRQ);
>>       return 0;
>> @@ -1895,6 +1896,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>           if ( copy_from_guest(&sched_shutdown, arg, 1) )
>>               break;
>>   
>> +        /* SAF-4-safe No persistent side effects */
>>           TRACE_3D(TRC_SCHED_SHUTDOWN,
>>                    current->domain->domain_id, current->vcpu_id,
>>                    sched_shutdown.reason);
>> @@ -1912,6 +1914,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>           if ( copy_from_guest(&sched_shutdown, arg, 1) )
>>               break;
>>   
>> +        /* SAF-4-safe No persistent side effects */
>>           TRACE_3D(TRC_SCHED_SHUTDOWN_CODE,
>>                    d->domain_id, current->vcpu_id, sched_shutdown.reason);
>>   
> 
> In at least the former two of these cases pulling out "current" into a local
> variable "curr" would likely eliminate the violation and at the same time
> improve code a little.
> 

Yes, I agree.

> Jan
> 

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


