Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA2C2958FF
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 09:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10187.26978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVUvV-0004B7-0t; Thu, 22 Oct 2020 07:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10187.26978; Thu, 22 Oct 2020 07:22:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVUvU-0004Ai-U0; Thu, 22 Oct 2020 07:22:20 +0000
Received: by outflank-mailman (input) for mailman id 10187;
 Thu, 22 Oct 2020 07:22:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVUvT-0004Ad-5r
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:22:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 704cdbe9-1292-4c7c-bd20-1eae4100e3c0;
 Thu, 22 Oct 2020 07:22:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0EC1ABB2;
 Thu, 22 Oct 2020 07:22:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVUvT-0004Ad-5r
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:22:19 +0000
X-Inumbo-ID: 704cdbe9-1292-4c7c-bd20-1eae4100e3c0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 704cdbe9-1292-4c7c-bd20-1eae4100e3c0;
	Thu, 22 Oct 2020 07:22:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603351336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AEohr86YwyMbd6ENMvAUnEuFe7qV+XNj9RSib7V+qOw=;
	b=aPTzcGbwa+lxQfeUIZ8xWuHRPfqEmRG+qUuvVBLElKedfQUKbsgNgRpzflOVyARUYYKMli
	2iCx4A94NovZsbi4G9VQoWwYhtUUXWNAI0g4l/7tPQyvL0SSupEApVnPBEyQqs1uM12L5u
	SToyoI6vs4FNuTxjtGUa+BvPxjgVbHI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C0EC1ABB2;
	Thu, 22 Oct 2020 07:22:16 +0000 (UTC)
Subject: Re: [PATCH] x86/pv: Flush TLB in response to paging structure changes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201021130708.12249-1-andrew.cooper3@citrix.com>
 <7967fa6e-213d-50e2-87d3-dbd319aa2060@suse.com>
 <9fe3d967-6bfe-71ef-6430-029de97dca8c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <74bd40bb-dfad-39dc-bcae-b5a6f6d16a0c@suse.com>
Date: Thu, 22 Oct 2020 09:22:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <9fe3d967-6bfe-71ef-6430-029de97dca8c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.10.2020 17:39, Andrew Cooper wrote:
> On 21/10/2020 14:56, Jan Beulich wrote:
>> On 21.10.2020 15:07, Andrew Cooper wrote:
>>> @@ -4037,6 +4037,9 @@ long do_mmu_update(
>>>                          break;
>>>                      rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
>>>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
>>> +                    /* Paging structure maybe changed.  Flush linear range. */
>>> +                    if ( !rc )
>>> +                        flush_flags_all |= FLUSH_TLB;
>>>                      break;
>>>  
>>>                  case PGT_l3_page_table:
>>> @@ -4044,6 +4047,9 @@ long do_mmu_update(
>>>                          break;
>>>                      rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
>>>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
>>> +                    /* Paging structure maybe changed.  Flush linear range. */
>>> +                    if ( !rc )
>>> +                        flush_flags_all |= FLUSH_TLB;
>>>                      break;
>>>  
>>>                  case PGT_l4_page_table:
>>> @@ -4051,27 +4057,28 @@ long do_mmu_update(
>>>                          break;
>>>                      rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
>>>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
>>> -                    if ( !rc && pt_owner->arch.pv.xpti )
>>> +                    /* Paging structure maybe changed.  Flush linear range. */
>>> +                    if ( !rc )
>>>                      {
>>> -                        bool local_in_use = false;
>>> +                        bool local_in_use = mfn_eq(
>>> +                            pagetable_get_mfn(curr->arch.guest_table), mfn);
>>>  
>>> -                        if ( mfn_eq(pagetable_get_mfn(curr->arch.guest_table),
>>> -                                    mfn) )
>>> -                        {
>>> -                            local_in_use = true;
>>> -                            get_cpu_info()->root_pgt_changed = true;
>>> -                        }
>>> +                        flush_flags_all |= FLUSH_TLB;
>>> +
>>> +                        if ( local_in_use )
>>> +                            flush_flags_local |= FLUSH_TLB | FLUSH_ROOT_PGTBL;
>> Aiui here (and in the code consuming the flags) you build upon
>> flush_flags_local, when not zero, always being a superset of
>> flush_flags_all. I think this is a trap to fall into when later
>> wanting to change this code, but as per below this won't hold
>> anymore anyway, I think. Hence here I think you want to set
>> FLUSH_TLB unconditionally, and above for L3 and L2 you want to
>> set it in both variables. Or, if I'm wrong below, a comment to
>> that effect may help people avoid falling into this trap.
>>
>> An alternative would be to have
>>
>>     flush_flags_local |= (flush_flags_all & FLUSH_TLB);
>>
>> before doing the actual flush.
> 
> Honestly, this is what I meant by stating that the asymmetry is a total
> mess.
> 
> I originally named all 'remote', but this is even less accurate, it may
> still contain the current cpu.
> 
> Our matrix of complexity:
> 
> * FLUSH_TLB for L2+ structure changes
> * FLUSH_TLB_GLOBAL/FLUSH_ROOT_PGTBL for XPTI
> 
> with optimisations to skip GLOBAL/ROOT_PGTBL on the local CPU if none of
> the updates hit the L4-in-use, and to skip the remote if we hold all
> references on the L4.
> 
> Everything is complicated because pt_owner may not be current, for
> toolstack operations constructing a new domain.

Which is a case I'm wondering why we flush in the first place.
The L4 under construction can't be in use yet, and hence
updates to it shouldn't need syncing. Otoh
pt_owner->dirty_cpumask obviously is empty at that point, i.e.
special casing this likely isn't really worth it.

>>> @@ -4173,18 +4180,36 @@ long do_mmu_update(
>>>      if ( va )
>>>          unmap_domain_page(va);
>>>  
>>> -    if ( sync_guest )
>>> +    /*
>>> +     * Flushing needs to occur for one of several reasons.
>>> +     *
>>> +     * 1) An update to an L2 or higher occured.  This potentially changes the
>>> +     *    pagetable structure, requiring a flush of the linear range.
>>> +     * 2) An update to an L4 occured, and XPTI is enabled.  All CPUs running
>>> +     *    on a copy of this L4 need refreshing.
>>> +     */
>>> +    if ( flush_flags_all || flush_flags_local )
>> Minor remark: At least in x86 code it is more efficient to use
>> | instead of || in such cases, to avoid relying on the compiler
>> to carry out this small optimization.
> 
> This transformation should not be recommended in general.  There are
> cases, including this one, where it is at best, no effect, and at worst,
> wrong.
> 
> I don't care about people using ancient compilers.  They've got far
> bigger (== more impactful) problems than (the absence of) this
> transformation, and the TLB flush will dwarf anything the compiler does
> here.
> 
> However, the hand "optimised" case breaks a compiler spotting that the
> entire second clause is actually redundant for now.

Oh, you mean non-zero flush_flags_local implying non-zero
flush_flags_all? Not sure why a compiler recognizing this shouldn't
be able to optimize away | when it is able to optimize away || in
this case. Anyway - minor point, as said.

> I specifically didn't encode the dependency, to avoid subtle bugs
> if/when someone alters the logic.

Good point, but let me point out then that you encoded another
subtle dependency, which I didn't spell out completely before
because with the suggested adjustments it disappears: You may not
omit FLUSH_TLB from flush_flags_local when !local_in_use, as the L4
being changed may be one recursively hanging off of the L4 we're
running on.

>>>      {
>>> +        cpumask_t *mask = pt_owner->dirty_cpumask;
>>> +
>>>          /*
>>> -         * Force other vCPU-s of the affected guest to pick up L4 entry
>>> -         * changes (if any).
>>> +         * Local flushing may be asymmetric with remote.  If there is local
>>> +         * flushing to do, perform it separately and omit the current CPU from
>>> +         * pt_owner->dirty_cpumask.
>>>           */
>>> -        unsigned int cpu = smp_processor_id();
>>> -        cpumask_t *mask = per_cpu(scratch_cpumask, cpu);
>>> +        if ( flush_flags_local )
>>> +        {
>>> +            unsigned int cpu = smp_processor_id();
>>> +
>>> +            mask = per_cpu(scratch_cpumask, cpu);
>>> +            cpumask_copy(mask, pt_owner->dirty_cpumask);
>>> +            __cpumask_clear_cpu(cpu, mask);
>>> +
>>> +            flush_local(flush_flags_local);
>>> +        }
>>>  
>>> -        cpumask_andnot(mask, pt_owner->dirty_cpumask, cpumask_of(cpu));
>> I understand you're of the opinion that cpumask_copy() +
>> __cpumask_clear_cpu() is more efficient than cpumask_andnot()?
>> (I guess I agree for high enough CPU counts.)
> 
> Its faster in all cases, even low CPU counts.

Is it? Data for BTR with a memory operand is available in the ORM only
for some Atom CPUs, and its latency and throughput aren't very good
there. Anyway - again a minor aspect, but I'll keep this in mind for
future code I write, as so far I've preferred the "andnot" form in
such cases.

Jan

