Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050CA91A822
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 15:41:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750099.1158359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMpND-0006lS-9H; Thu, 27 Jun 2024 13:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750099.1158359; Thu, 27 Jun 2024 13:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMpND-0006in-59; Thu, 27 Jun 2024 13:41:15 +0000
Received: by outflank-mailman (input) for mailman id 750099;
 Thu, 27 Jun 2024 13:41:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ztxJ=N5=bounce.vates.tech=bounce-md_30504962.667d6bf6.v1-93e112db93ce43eba1696d079574e9fd@srs-se1.protection.inumbo.net>)
 id 1sMpNC-0006ih-8C
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 13:41:14 +0000
Received: from mail145-25.atl61.mandrillapp.com
 (mail145-25.atl61.mandrillapp.com [198.2.145.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea6c7001-348a-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 15:41:12 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-25.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4W908Q2fnXz35hb7b
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 13:41:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 93e112db93ce43eba1696d079574e9fd; Thu, 27 Jun 2024 13:41:10 +0000
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
X-Inumbo-ID: ea6c7001-348a-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719495670; x=1719756170;
	bh=NTTNFqKwiPKP9I/ZG3X/aBVJ/iykNaZrWMPAIZEkmls=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=osKQ+qAQmmHfx+Ws+QvymIqMzGK49suvieSjvzPm/eS+DmRGDLUHtyupNn1+9ti/i
	 lVvk/R7RICei1C61BSxwolKM8lj4iYZQdci3KEFft+L9SFQFmx+v3h825ZVVIvD2X8
	 Mhr++aeOlAwqNP5MSHOiemnP50YsF662nRZ2P5qL72zvgGbelScbiFm1/SnqtUzY/+
	 8OXfXliO1HK/v2mlRQPazGBnmXvm+Xjp4wTKa2lH8lHcEEpnKGjLY3NHw50XpwUQz6
	 +cJjd88NkyenflMhDA/fwfXEvSrrq3K9P95BuVOGGyfwFHyAi34MHMb/qAHgOm97Be
	 GcvljDNpbfOWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719495670; x=1719756170; i=vaishali.thakkar@vates.tech;
	bh=NTTNFqKwiPKP9I/ZG3X/aBVJ/iykNaZrWMPAIZEkmls=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=IDKH9wTfGhABIVYcdai+yYVPzsvw/8iKBceCJ/8HMr3GlNYgRzfYkBIEUmyC47s2V
	 PR1MtQGtBE37W9z7qCBOGJ74IBU0f4my2XegXNjkYKFzOvgvXs3HXOu3ZbeT7gOspK
	 Kielqk7sSm+jLJ5O+mMHWeZYUUcQlzhsCcBjAOw8d//JV1UxHHdO0LMc8X4IAt/bNS
	 GJ6Ub9KgdfeE0zZzMlJ7EYOpB7ork/MF2TayDOOodR+/BNtcRz8yWZxw1wCCdi32Tm
	 LfO/T5nMZjteh3KGvKskW6cPJgRn8+YbIg2PFYO8U4haPRU05qUUAu0dRaktWLD1Wq
	 TCio1UZJxxpcQ==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20for-4.20=20v1=201/1]=20x86/hvm:=20Introduce=20Xen-wide=20ASID=20Allocator?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719495669079
Message-Id: <2c843753-d27b-43cd-907e-851109890cc3@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, george.dunlap@citrix.com, xen-devel@lists.xenproject.org
References: <cover.1716551380.git.vaishali.thakkar@vates.tech> <f15042aa7953d986b6dbd4dc1512024ba6362420.1716551380.git.vaishali.thakkar@vates.tech> <c18dbed6-07ac-4ce6-a5e4-4a72cbac3e12@suse.com>
In-Reply-To: <c18dbed6-07ac-4ce6-a5e4-4a72cbac3e12@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.93e112db93ce43eba1696d079574e9fd?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240627:md
Date: Thu, 27 Jun 2024 13:41:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/24 1:04 PM, Jan Beulich wrote:
> On 24.05.2024 14:31, Vaishali Thakkar wrote:
>> --- a/xen/arch/x86/hvm/asid.c
>> +++ b/xen/arch/x86/hvm/asid.c
>> @@ -27,8 +27,8 @@ boolean_param("asid", opt_asid_enabled);
>>    * the TLB.
>>    *
>>    * Sketch of the Implementation:
>> - *
>> - * ASIDs are a CPU-local resource.  As preemption of ASIDs is not possible,
>> + * TODO(vaishali): Update this comment
>> + * ASIDs are Xen-wide resource.  As preemption of ASIDs is not possible,
>>    * ASIDs are assigned in a round-robin scheme.  To minimize the overhead of
>>    * ASID invalidation, at the time of a TLB flush,  ASIDs are tagged with a
>>    * 64-bit generation.  Only on a generation overflow the code needs to
>> @@ -38,20 +38,21 @@ boolean_param("asid", opt_asid_enabled);
>>    * ASID useage to retain correctness.
>>    */
>>   
>> -/* Per-CPU ASID management. */
>> +/* Xen-wide ASID management */
>>   struct hvm_asid_data {
>> -   uint64_t core_asid_generation;
>> +   uint64_t asid_generation;
>>      uint32_t next_asid;
>>      uint32_t max_asid;
>> +   uint32_t min_asid;
>>      bool disabled;
>>   };
>>   
>> -static DEFINE_PER_CPU(struct hvm_asid_data, hvm_asid_data);
>> +static struct hvm_asid_data asid_data;
>>   
>>   void hvm_asid_init(int nasids)
>>   {
>>       static int8_t g_disabled = -1;
>> -    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
>> +    struct hvm_asid_data *data = &asid_data;
>>   
>>       data->max_asid = nasids - 1;
>>       data->disabled = !opt_asid_enabled || (nasids <= 1);
>> @@ -64,67 +65,73 @@ void hvm_asid_init(int nasids)
>>       }
>>   
>>       /* Zero indicates 'invalid generation', so we start the count at one. */
>> -    data->core_asid_generation = 1;
>> +    data->asid_generation = 1;
>>   
>>       /* Zero indicates 'ASIDs disabled', so we start the count at one. */
>>       data->next_asid = 1;
> 
> Both of these want to become compile-time initializers now, I think. The
> comments would move there, but especially the second one also looks to
> need updating.

Ack, will fix this.

>>   }
>>   
>> -void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid)
>> +void hvm_asid_flush_domain_asid(struct hvm_domain_asid *asid)
>>   {
>>       write_atomic(&asid->generation, 0);
>>   }
>>   
>> -void hvm_asid_flush_vcpu(struct vcpu *v)
>> +void hvm_asid_flush_domain(struct domain *d)
>>   {
>> -    hvm_asid_flush_vcpu_asid(&v->arch.hvm.n1asid);
>> -    hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
>> +    hvm_asid_flush_domain_asid(&d->arch.hvm.n1asid);
>> +    //hvm_asid_flush_domain_asid(&vcpu_nestedhvm(v).nv_n2asid);
> 
> While in Lisbon Andrew indicated to not specifically bother about the nested
> case, I don't think he meant by this to outright break it. Hence imo
> something like this will need taking care of (which it being commented out
> may or may not indicate is the plan).
> 

I've already mentioned the reason for commenting out this code for v1 in 
the cover letter. But in case you missed it, TLDR: I wanted to know the 
plans from the nested virtualization project with regards to this before 
doing the changes. And it was commented out just to present the idea and 
for testing. Also, I have put few TODOs in this RFC for v2 which indicates 
the plan to handle the nested virt parts.

Anyway, as discussed at the Xen Summit and indicated by Andrew, in v2 I'll 
make the changes kind of similar to what's happening in the non-nested virt 
code.

>>   }
>>   
>> -void hvm_asid_flush_core(void)
>> +void hvm_asid_flush_all(void)
>>   {
>> -    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
>> +    struct hvm_asid_data *data = &asid_data;
>>   
>> -    if ( data->disabled )
>> +    if ( data->disabled)
>>           return;
>>   
>> -    if ( likely(++data->core_asid_generation != 0) )
>> +    if ( likely(++data->asid_generation != 0) )
>>           return;
>>   
>>       /*
>> -     * ASID generations are 64 bit.  Overflow of generations never happens.
>> -     * For safety, we simply disable ASIDs, so correctness is established; it
>> -     * only runs a bit slower.
>> -     */
>> +    * ASID generations are 64 bit.  Overflow of generations never happens.
>> +    * For safety, we simply disable ASIDs, so correctness is established; it
>> +    * only runs a bit slower.
>> +    */
> 
> Please don't screw up indentation; this comment was well-formed before. What
> I question is whether, with the ultimate purpose in mind, the comment actually
> will continue to be correct. We can't simply disable ASIDs when we have SEV
> VMs running, can we?

You're right about SEV VMs. But wouldn't we still want to have a way to 
disable ASIDs when there are no SEV VMs are running?

>>       printk("HVM: ASID generation overrun. Disabling ASIDs.\n");
>>       data->disabled = 1;
>>   }
>>   
>> -bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid)
>> +/* This function is called only when first vmenter happens after creating a new domain */
>> +bool hvm_asid_handle_vmenter(struct hvm_domain_asid *asid)
> 
> With what the comment says, the function likely wants giving a different
> name.

Ack.

>>   {
>> -    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
>> +    struct hvm_asid_data *data = &asid_data;
>>   
>>       /* On erratum #170 systems we must flush the TLB.
>>        * Generation overruns are taken here, too. */
>>       if ( data->disabled )
>>           goto disabled;
>>   
>> -    /* Test if VCPU has valid ASID. */
>> -    if ( read_atomic(&asid->generation) == data->core_asid_generation )
>> +    /* Test if domain has valid ASID. */
>> +    if ( read_atomic(&asid->generation) == data->asid_generation )
>>           return 0;
>>   
>>       /* If there are no free ASIDs, need to go to a new generation */
>>       if ( unlikely(data->next_asid > data->max_asid) )
>>       {
>> -        hvm_asid_flush_core();
>> +        // TODO(vaishali): Add a check to pick the asid from the reclaimable asids if any
>> +        hvm_asid_flush_all();
>>           data->next_asid = 1;
>>           if ( data->disabled )
>>               goto disabled;
>>       }
>>   
>> -    /* Now guaranteed to be a free ASID. */
>> -    asid->asid = data->next_asid++;
>> -    write_atomic(&asid->generation, data->core_asid_generation);
>> +    /* Now guaranteed to be a free ASID. Only assign a new asid if the ASID is 1 */
>> +    if (asid->asid == 0)
> 
> Comment and code appear to not be matching up, which makes it difficult
> to figure what is actually meant.

Ack

>> +    {
>> +        asid->asid = data->next_asid++;
>> +    }
>> +
>> +    write_atomic(&asid->generation, data->asid_generation);
> 
> Is this generation thing really still relevant when a domain has an ASID
> assigned once and for all? Plus, does allocation really need to happen as
> late as immediately ahead of the first VM entry? Can't that be part of
> normal domain creation?

Ack, for the generation thing. Agree, it's not needed and makes sense to do 
allocation as part of domain creation. I'll re-structure the code accordingly.

>> --- a/xen/arch/x86/hvm/emulate.c
>> +++ b/xen/arch/x86/hvm/emulate.c
>> @@ -2519,10 +2519,7 @@ static int cf_check hvmemul_tlb_op(
>>   
>>       case x86emul_invpcid:
>>           if ( x86emul_invpcid_type(aux) != X86_INVPCID_INDIV_ADDR )
>> -        {
>> -            hvm_asid_flush_vcpu(current);
>>               break;
>> -        }
> 
> What replaces this flush? Things like this (also e.g. the change to
> switch_cr3_cr4(), and there are more further down) would be good to
> explain in the description, perhaps by more generally explaining how
> the flushing model changes.

Ok, will do.

>> --- a/xen/arch/x86/hvm/svm/asid.c
>> +++ b/xen/arch/x86/hvm/svm/asid.c
>> @@ -7,31 +7,35 @@
>>   #include <asm/amd.h>
>>   #include <asm/hvm/nestedhvm.h>
>>   #include <asm/hvm/svm/svm.h>
>> -
>> +#include <asm/processor.h>
>>   #include "svm.h"
>> +#include "xen/cpumask.h"
> 
> The blank line was here on purpose; please keep it. And please never
> use "" for xen/ includes. That #include also wants moving up; the
> "canonical" way of arranging #include-s would be <xen/...> first, then
> <asm/...>, then anything custom. Each block separated by a blank line.
> 

Ack

>> -void svm_asid_init(const struct cpuinfo_x86 *c)
>> +void svm_asid_init(void)
> 
> Since this is now global initialization, can't it be __init?
> 
>>   {
>> +    unsigned int cpu = smp_processor_id();
>> +    const struct cpuinfo_x86 *c;
>>       int nasids = 0;
>>   
>> -    /* Check for erratum #170, and leave ASIDs disabled if it's present. */
>> -    if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
>> -        nasids = cpuid_ebx(0x8000000aU);
>> -
>> +    for_each_online_cpu( cpu ) {
> 
> Nit (style): Brace goes on its own line.

ack

>> +        c = &cpu_data[cpu];
>> +        /* Check for erratum #170, and leave ASIDs disabled if it's present. */
>> +        if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
>> +            nasids += cpuid_ebx(0x8000000aU);
> 
> Why += ? Don't you mean to establish the minimum across all CPUs? Which would
> be assuming there might be an asymmetry, which generally we assume there
> isn't.
> And if you invoke CPUID, you'll need to do so on the very CPU, not many times
> in a row on the BSP.

Hmm, I'm not sure if I understand your point completely. Just to clarify, 
do you mean even if it's assumed that asymmetry is not there, we should 
find and establish min ASID count across all online CPUs and ensure that 
CPUID instruction is executed on the respective CPU?

>> +    }
>>       hvm_asid_init(nasids);
>>   }
>>   
>>   /*
>> - * Called directly before VMRUN.  Checks if the VCPU needs a new ASID,
>> + * Called directly before first VMRUN.  Checks if the domain needs an ASID,
>>    * assigns it, and if required, issues required TLB flushes.
>>    */
>>   void svm_asid_handle_vmrun(void)
> 
> Again the function name will likely want to change if this is called just
> once per domain. Question then again is whether really this needs doing as
> late as ahead of the VMRUN, of whether perhaps at least parts can be done
> during normal domain creation.

Ack, the parts with regards to setting up the asids can definitely be moved 
during the domain creation. I'll also check if the part with regards to 
setting the bit for tlb_control can be done while/after creating VMCB or not.

>>   {
>> -    struct vcpu *curr = current;
>> -    struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
>> -    struct hvm_vcpu_asid *p_asid =
>> -        nestedhvm_vcpu_in_guestmode(curr)
>> -        ? &vcpu_nestedhvm(curr).nv_n2asid : &curr->arch.hvm.n1asid;
>> +    struct vcpu *v = current;
> 
> Please don't move away from naming this "curr".
> 
>> +    struct domain *d = current->domain;
> 
> Then this, if it needs to be a local variable in the first place, would
> want to be "currd".
> 
>> @@ -988,8 +986,8 @@ static void noreturn cf_check svm_do_resume(void)
>>           v->arch.hvm.svm.launch_core = smp_processor_id();
>>           hvm_migrate_timers(v);
>>           hvm_migrate_pirqs(v);
>> -        /* Migrating to another ASID domain.  Request a new ASID. */
>> -        hvm_asid_flush_vcpu(v);
>> +        /* Migrating to another ASID domain. Request a new ASID. */
>> +        hvm_asid_flush_domain(v->domain);
>>       }
> 
> Is "migrating to another ASID domain" actually still possible in the new
> model

That's correct. Eventually we will have to find a way for that. But as part 
of initial work for this, it won't be possible. Will fix the above thing.

>> @@ -2358,8 +2351,9 @@ static bool cf_check is_invlpg(
>>   
>>   static void cf_check svm_invlpg(struct vcpu *v, unsigned long linear)
>>   {
>> +    v = current;
> 
> ???
> 
>>       /* Safe fallback. Take a new ASID. */
>> -    hvm_asid_flush_vcpu(v);
>> +    hvm_asid_flush_domain(v->domain);
>>   }
>>   
>>   static bool cf_check svm_get_pending_event(
>> @@ -2533,6 +2527,7 @@ void asmlinkage svm_vmexit_handler(void)
>>       struct cpu_user_regs *regs = guest_cpu_user_regs();
>>       uint64_t exit_reason;
>>       struct vcpu *v = current;
>> +    struct domain *d = current->domain;
>>       struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>>       int insn_len, rc;
>>       vintr_t intr;
>> @@ -2927,7 +2922,7 @@ void asmlinkage svm_vmexit_handler(void)
>>           }
>>           if ( (insn_len = svm_get_insn_len(v, INSTR_INVLPGA)) == 0 )
>>               break;
>> -        svm_invlpga_intercept(v, regs->rax, regs->ecx);
>> +        svm_invlpga_intercept(d, regs->rax, regs->ecx);
>>           __update_guest_eip(regs, insn_len);
>>           break;
> 
> The function may certainly benefit from introducing "d" (or better "currd"),
> but please uniformly then (in a separate, prereq patch). Else just use
> v->domain in this one place you're changing.

Ack for this and above comment regarding naming

>> --- a/xen/arch/x86/include/asm/hvm/asid.h
>> +++ b/xen/arch/x86/include/asm/hvm/asid.h
>> @@ -8,25 +8,24 @@
>>   #ifndef __ASM_X86_HVM_ASID_H__
>>   #define __ASM_X86_HVM_ASID_H__
>>   
>> +struct hvm_domain;
>> +struct hvm_domain_asid;
> 
> I can see the need for the latter, but why the former?
> 
>> -struct vcpu;
>> -struct hvm_vcpu_asid;
>> -
>> -/* Initialise ASID management for the current physical CPU. */
>> +/* Initialise ASID management distributed across all CPUs. */
>>   void hvm_asid_init(int nasids);
>>   
>>   /* Invalidate a particular ASID allocation: forces re-allocation. */
>> -void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid);
>> +void hvm_asid_flush_domain_asid(struct hvm_domain_asid *asid);
>>   
>> -/* Invalidate all ASID allocations for specified VCPU: forces re-allocation. */
>> -void hvm_asid_flush_vcpu(struct vcpu *v);
>> +/* Invalidate all ASID allocations for specified domain */
>> +void hvm_asid_flush_domain(struct domain *d);
>>   
>> -/* Flush all ASIDs on this processor core. */
>> -void hvm_asid_flush_core(void);
>> +/* Flush all ASIDs on all processor cores */
>> +void hvm_asid_flush_all(void);
>>   
>>   /* Called before entry to guest context. Checks ASID allocation, returns a
>>    * boolean indicating whether all ASIDs must be flushed. */
>> -bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid);
>> +bool hvm_asid_handle_vmenter(struct hvm_domain_asid *asid);
> 
> Much like the comment on the definition, this comment then wants adjusting,
> too.

Ack

>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> @@ -525,6 +525,7 @@ void ept_sync_domain(struct p2m_domain *p2m);
>>   
>>   static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
>>   {
>> +    struct domain *d = current->domain;
> 
> Why "current" when "v" is being passed in?

Sorry, this was a leftover from some debugging traces. Will fix this and
above unnecessary use of current..

>> --- a/xen/arch/x86/mm/hap/hap.c
>> +++ b/xen/arch/x86/mm/hap/hap.c
>> @@ -739,13 +739,13 @@ static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap)
>>           if ( !flush_vcpu(v, vcpu_bitmap) )
>>               continue;
>>   
>> -        hvm_asid_flush_vcpu(v);
>> -
>>           cpu = read_atomic(&v->dirty_cpu);
>>           if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) && v->is_running )
>>               __cpumask_set_cpu(cpu, mask);
>>       }
>>   
>> +    hvm_asid_flush_domain(d);
> 
> Hmm, that's potentially much more flushing than is needed here. There
> surely wants to be a wait to flush at a granularity smaller than the
> entire domain. (Likely applies elsewhere as well.)

I see, does it mean we still need a way to flush at the vcpu level in the
case of HAP?

>> @@ -2013,6 +2014,12 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>           printk(XENLOG_INFO "Parked %u CPUs\n", num_parked);
>>       smp_cpus_done();
>>   
>> +    /* Initialize xen-wide ASID handling */
>> +    #ifdef CONFIG_HVM
>> +    if ( cpu_has_svm )
>> +        svm_asid_init();
>> +    #endif
> 
> Nit (style): Pre-processor directives want to start in the leftmost column.
> 
> Overall I'm afraid I have to say that there's too much hackery and too
> little description to properly reply to this to address its RFC-ness. You
> also don't really raise any specific questions.

I've raised few questions in the cover letter but the initial purpose for
sending this as an RFC was to present the idea and have some code for 
people to take a look at (instead of just talking about it theoretically) 
before the design session at Xen Summit. Nonetheless, will do better next time.

Thanks for your review!

> Jan

