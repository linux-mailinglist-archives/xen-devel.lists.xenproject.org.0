Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761D584C83A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 11:04:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677309.1053832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXelp-0002I6-50; Wed, 07 Feb 2024 10:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677309.1053832; Wed, 07 Feb 2024 10:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXelp-0002FS-1x; Wed, 07 Feb 2024 10:03:09 +0000
Received: by outflank-mailman (input) for mailman id 677309;
 Wed, 07 Feb 2024 10:03:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQwS=JQ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rXelo-0002FI-A7
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 10:03:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 170fdb13-c5a0-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 11:03:07 +0100 (CET)
Received: from [192.168.1.140] (unknown [81.56.166.244])
 by support.bugseng.com (Postfix) with ESMTPSA id EA6CC4EE0738;
 Wed,  7 Feb 2024 11:03:05 +0100 (CET)
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
X-Inumbo-ID: 170fdb13-c5a0-11ee-8a49-1f161083a0e0
Message-ID: <851eb6ec-558b-4a89-a31a-34046730bb55@bugseng.com>
Date: Wed, 7 Feb 2024 11:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 1/4] xen: add SAF deviation for debugging and
 logging effects
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1706886631.git.simone.ballarin@bugseng.com>
 <7c6aeedac626b171ed44df50ce5e3e2c76593f60.1706886631.git.simone.ballarin@bugseng.com>
 <09869431-ed00-4102-93fd-84c697a5c950@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <09869431-ed00-4102-93fd-84c697a5c950@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/24 13:04, Jan Beulich wrote:
> On 02.02.2024 16:16, Simone Ballarin wrote:
>> Rule 13.1: Initializer lists shall not contain persistent side effects
>>
>> Effects caused by debug/logging macros and functions (like ASSERT, __bad_atomic_size,
>> LOG, etc ...) that crash execution or produce logs are not dangerous in initializer
>> lists. The evaluation order in abnormal conditions is not relevant. Evaluation order
>> of logging effects is always safe.
> 
> I thought I said so before: When talking of just logging, evaluation order
> may very well have a impact on correctness. Therefore we shouldn't mix
> debugging and logging.

My general feeling was that changes like the following one are not supported by
the community:

- x = { .field1 = function_with_logs_effects() /*other eventual code*/ };
+ int field1 = function_with_logs_effects();
+ x = { .field1 = field1 /*other eventual code*/};

so I tried to deviate as much as possible.

If having log effects is a good reason to do changes like the above, I can
propose a patch in that sense.

> 
>> Function hvm_get_guest_tsc_fixed (indirectly) performs different side effects.
>> For example it calls hvm_get_guest_time_fixed that contains an ASSERT and calls
>> to spin_lock and spin_unlock.
>>
>> These side effects are not dangerous: they can be executed regardless of the
>> initializer list evaluation order
>>
>> This patch deviates violations using SAF commits caused by debug/logging macros and
>> functions.
> 
> DYM "comments"?
> 

Oh yes, sorry.

>> --- a/xen/arch/arm/device.c
>> +++ b/xen/arch/arm/device.c
>> @@ -331,6 +331,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>>           .p2mt = p2mt,
>>           .skip_mapping = !own_device ||
>>                           (is_pci_passthrough_enabled() &&
>> +                        /* SAF-3-safe effects for debugging/logging reasons are safe */
>>                           (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
> 
> Taking this just as example: I think the comment is too long. Just
> saying (leaving aside my comment higher up) "debugging/logging"
> would imo be sufficient.
> 

Ok.

>> --- a/xen/arch/arm/guestcopy.c
>> +++ b/xen/arch/arm/guestcopy.c
>> @@ -110,26 +110,34 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>>   unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>>   {
>>       return copy_guest((void *)from, (vaddr_t)to, len,
>> -                      GVA_INFO(current), COPY_to_guest | COPY_linear);
>> +                      /* SAF-4-safe No persistent side effects */
>> +                      GVA_INFO(current),
> 
> I _still_ think this leaves ambiguity. The more that you need to look
> up GVA_INFO() to recognize what this is about.


Just to recap: here the point is that current reads a register with a volatile asm, so the
violation is in the expansion of GVA_INFO(current). Both GVA_INFO and current taken alone
are completely fine, so this is the only place where a SAF comment can be placed.

The exapansion is:
((copy_info_t) { .gva = { ((*({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"(&
   per_cpu__curr_vcpu)); (typeof(&per_cpu__curr_vcpu)) (__ptr + (({ uint64_t _r; asm volatile("mrs  %0, ""TPIDR_EL2" : "=r"
   (_r)); _r; }))); }))) } }), (1U << 1) | (1U << 2));

My proposals are:
1) address the violation moving the current expansion outside (extra variable);
2) put a more detailed comment to avoid the ambiguity;
3) use an ECL deviation for GVA_INFO(current).

Do you have any preference or proposal?

>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -800,6 +800,7 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
>>   {
>>       struct segment_register seg;
>>       struct hvm_hw_cpu ctxt = {
>> +        /* SAF-3-safe effects for debugging/logging reasons are safe */
>>           .tsc = hvm_get_guest_tsc_fixed(v, v->domain->arch.hvm.sync_tsc),
> 
> A prereq for this imo is that the function take const struct vcpu *.
> But I'm not sure that'll suffice. The function can change at any time,
> rendering the comment here stale perhaps without anyone noticing.
>

IMO It isn't a strict prereq, but it would make everything more clear.

In any case, apart adding the const, I do not see other easy solutions.
Would you give me your ack if I change the function signature?

Another possible solutions would be documenting the function in the new
JSON file with a special attribute like only_debug_effect. Of course,
this still requires keeping the JSON up to date in case of changes.

>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -1521,6 +1521,7 @@ long vcpu_yield(void)
>>   
>>       SCHED_STAT_CRANK(vcpu_yield);
>>   
>> +    /* SAF-4-safe No persistent side effects */
>>       TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
>>       raise_softirq(SCHEDULE_SOFTIRQ);
>>       return 0;
>> @@ -1899,6 +1900,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>           if ( copy_from_guest(&sched_shutdown, arg, 1) )
>>               break;
>>   
>> +        /* SAF-4-safe No persistent side effects */
>>           TRACE_3D(TRC_SCHED_SHUTDOWN,
>>                    current->domain->domain_id, current->vcpu_id,
>>                    sched_shutdown.reason);
>> @@ -1916,6 +1918,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>           if ( copy_from_guest(&sched_shutdown, arg, 1) )
>>               break;
>>   
>> +        /* SAF-4-safe No persistent side effects */
>>           TRACE_3D(TRC_SCHED_SHUTDOWN_CODE,
>>                    d->domain_id, current->vcpu_id, sched_shutdown.reason);
>>   
> 
> For all of these iirc the suggestion was to latch current into a local
> variable (named "curr" by convention).
> 

Ok.

> Jan

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


