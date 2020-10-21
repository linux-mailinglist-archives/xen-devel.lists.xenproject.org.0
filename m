Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB75295014
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 17:40:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10102.26649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVGD0-0002Ws-NZ; Wed, 21 Oct 2020 15:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10102.26649; Wed, 21 Oct 2020 15:39:26 +0000
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
	id 1kVGD0-0002WT-KG; Wed, 21 Oct 2020 15:39:26 +0000
Received: by outflank-mailman (input) for mailman id 10102;
 Wed, 21 Oct 2020 15:39:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yt4r=D4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kVGCz-0002WO-65
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 15:39:25 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39edfadf-4cbd-46df-bdee-84d9fccedc3f;
 Wed, 21 Oct 2020 15:39:23 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Yt4r=D4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kVGCz-0002WO-65
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 15:39:25 +0000
X-Inumbo-ID: 39edfadf-4cbd-46df-bdee-84d9fccedc3f
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 39edfadf-4cbd-46df-bdee-84d9fccedc3f;
	Wed, 21 Oct 2020 15:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603294764;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=j1f/C6xHFI5imBkiewetuRffC+ZV4VWL4EInYpwkqik=;
  b=N2UvY/4pROXsE0/AQsWGfh0uH6bQjUR8n55TbsMe+RboGdHvpH17GKmb
   REORs+Yti1YLFSjdC3uKoDZPf/f0ahxcB9Lsv1xPgcOyOoAA+zZSDv3EV
   I6RvzZAERAOPbOXFg4bhxmHSLqxXhjiTvgz7KK9+af3JfeBzOSdgAA/BX
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +cDykpqcAK1Q00ombkIHAnxKp0+9Ucxp5aNgtqaGvXH5YsLyG7dHGx1a8a0o44cNVDXfI/uvcb
 mzv2ClnsLDl/4r0PZZ8nfPGHE4fBp8OBnZgiojY8VutoqaA5SUios2B7hSUNBTjti1PoLs2vI1
 p6xlqFKRHl/Lj52kcDXXkiZO/6HN6pPE66zUX92FQN7OzrJrbTRpe+exhyRJiHFY1w76wUf5Si
 zCOHAzlAUJ7zgAgFV5NFkNArvUeAlb0NrGfCLTvrDL/jrMicO1RKsdKJhCxECmu0MkoKmXL2Bn
 kI4=
X-SBRS: 2.5
X-MesageID: 29827639
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="29827639"
Subject: Re: [PATCH] x86/pv: Flush TLB in response to paging structure changes
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201021130708.12249-1-andrew.cooper3@citrix.com>
 <7967fa6e-213d-50e2-87d3-dbd319aa2060@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9fe3d967-6bfe-71ef-6430-029de97dca8c@citrix.com>
Date: Wed, 21 Oct 2020 16:39:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7967fa6e-213d-50e2-87d3-dbd319aa2060@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 21/10/2020 14:56, Jan Beulich wrote:
> On 21.10.2020 15:07, Andrew Cooper wrote:
>> @@ -4037,6 +4037,9 @@ long do_mmu_update(
>>                          break;
>>                      rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
>>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
>> +                    /* Paging structure maybe changed.  Flush linear range. */
>> +                    if ( !rc )
>> +                        flush_flags_all |= FLUSH_TLB;
>>                      break;
>>  
>>                  case PGT_l3_page_table:
>> @@ -4044,6 +4047,9 @@ long do_mmu_update(
>>                          break;
>>                      rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
>>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
>> +                    /* Paging structure maybe changed.  Flush linear range. */
>> +                    if ( !rc )
>> +                        flush_flags_all |= FLUSH_TLB;
>>                      break;
>>  
>>                  case PGT_l4_page_table:
>> @@ -4051,27 +4057,28 @@ long do_mmu_update(
>>                          break;
>>                      rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
>>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
>> -                    if ( !rc && pt_owner->arch.pv.xpti )
>> +                    /* Paging structure maybe changed.  Flush linear range. */
>> +                    if ( !rc )
>>                      {
>> -                        bool local_in_use = false;
>> +                        bool local_in_use = mfn_eq(
>> +                            pagetable_get_mfn(curr->arch.guest_table), mfn);
>>  
>> -                        if ( mfn_eq(pagetable_get_mfn(curr->arch.guest_table),
>> -                                    mfn) )
>> -                        {
>> -                            local_in_use = true;
>> -                            get_cpu_info()->root_pgt_changed = true;
>> -                        }
>> +                        flush_flags_all |= FLUSH_TLB;
>> +
>> +                        if ( local_in_use )
>> +                            flush_flags_local |= FLUSH_TLB | FLUSH_ROOT_PGTBL;
> Aiui here (and in the code consuming the flags) you build upon
> flush_flags_local, when not zero, always being a superset of
> flush_flags_all. I think this is a trap to fall into when later
> wanting to change this code, but as per below this won't hold
> anymore anyway, I think. Hence here I think you want to set
> FLUSH_TLB unconditionally, and above for L3 and L2 you want to
> set it in both variables. Or, if I'm wrong below, a comment to
> that effect may help people avoid falling into this trap.
>
> An alternative would be to have
>
>     flush_flags_local |= (flush_flags_all & FLUSH_TLB);
>
> before doing the actual flush.

Honestly, this is what I meant by stating that the asymmetry is a total
mess.

I originally named all 'remote', but this is even less accurate, it may
still contain the current cpu.

Our matrix of complexity:

* FLUSH_TLB for L2+ structure changes
* FLUSH_TLB_GLOBAL/FLUSH_ROOT_PGTBL for XPTI

with optimisations to skip GLOBAL/ROOT_PGTBL on the local CPU if none of
the updates hit the L4-in-use, and to skip the remote if we hold all
references on the L4.

Everything is complicated because pt_owner may not be current, for
toolstack operations constructing a new domain.

>
>>                          /*
>>                           * No need to sync if all uses of the page can be
>>                           * accounted to the page lock we hold, its pinned
>>                           * status, and uses on this (v)CPU.
>>                           */
>> -                        if ( (page->u.inuse.type_info & PGT_count_mask) >
>> +                        if ( pt_owner->arch.pv.xpti &&
> I assume you've moved this here to avoid the further non-trivial
> checks when possible, but you've not put it around the setting
> of FLUSH_ROOT_PGTBL in flush_flags_local because setting
> ->root_pgt_changed is benign when !XPTI?

No - that was accidental, while attempting to reduce the diff.

>
>> +                             (page->u.inuse.type_info & PGT_count_mask) >
>>                               (1 + !!(page->u.inuse.type_info & PGT_pinned) +
>>                                mfn_eq(pagetable_get_mfn(curr->arch.guest_table_user),
>>                                       mfn) + local_in_use) )
>> -                            sync_guest = true;
>> +                            flush_flags_all |= FLUSH_ROOT_PGTBL;
> This needs to also specify FLUSH_TLB_GLOBAL, or else original
> XPTI behavior gets broken. Since the local CPU doesn't need this,
> the variable may then better be named flush_flags_remote?

See above.  remote is even more confusing than all.

>
> Or if I'm wrong here, the reasoning behind the dropping of the
> global flush in this case needs putting in the description, not
> the least because it would mean the change introducing it went
> too far.
>
>> @@ -4173,18 +4180,36 @@ long do_mmu_update(
>>      if ( va )
>>          unmap_domain_page(va);
>>  
>> -    if ( sync_guest )
>> +    /*
>> +     * Flushing needs to occur for one of several reasons.
>> +     *
>> +     * 1) An update to an L2 or higher occured.  This potentially changes the
>> +     *    pagetable structure, requiring a flush of the linear range.
>> +     * 2) An update to an L4 occured, and XPTI is enabled.  All CPUs running
>> +     *    on a copy of this L4 need refreshing.
>> +     */
>> +    if ( flush_flags_all || flush_flags_local )
> Minor remark: At least in x86 code it is more efficient to use
> | instead of || in such cases, to avoid relying on the compiler
> to carry out this small optimization.

This transformation should not be recommended in general.  There are
cases, including this one, where it is at best, no effect, and at worst,
wrong.

I don't care about people using ancient compilers.  They've got far
bigger (== more impactful) problems than (the absence of) this
transformation, and the TLB flush will dwarf anything the compiler does
here.

However, the hand "optimised" case breaks a compiler spotting that the
entire second clause is actually redundant for now.

I specifically didn't encode the dependency, to avoid subtle bugs
if/when someone alters the logic.

>
>>      {
>> +        cpumask_t *mask = pt_owner->dirty_cpumask;
>> +
>>          /*
>> -         * Force other vCPU-s of the affected guest to pick up L4 entry
>> -         * changes (if any).
>> +         * Local flushing may be asymmetric with remote.  If there is local
>> +         * flushing to do, perform it separately and omit the current CPU from
>> +         * pt_owner->dirty_cpumask.
>>           */
>> -        unsigned int cpu = smp_processor_id();
>> -        cpumask_t *mask = per_cpu(scratch_cpumask, cpu);
>> +        if ( flush_flags_local )
>> +        {
>> +            unsigned int cpu = smp_processor_id();
>> +
>> +            mask = per_cpu(scratch_cpumask, cpu);
>> +            cpumask_copy(mask, pt_owner->dirty_cpumask);
>> +            __cpumask_clear_cpu(cpu, mask);
>> +
>> +            flush_local(flush_flags_local);
>> +        }
>>  
>> -        cpumask_andnot(mask, pt_owner->dirty_cpumask, cpumask_of(cpu));
> I understand you're of the opinion that cpumask_copy() +
> __cpumask_clear_cpu() is more efficient than cpumask_andnot()?
> (I guess I agree for high enough CPU counts.)

Its faster in all cases, even low CPU counts.

~Andrew

