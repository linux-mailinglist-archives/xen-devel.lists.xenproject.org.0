Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD2B19A570
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 08:37:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJWxJ-0005yA-Vo; Wed, 01 Apr 2020 06:34:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1qDs=5R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJWxI-0005y5-2L
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 06:34:28 +0000
X-Inumbo-ID: d50fa880-73e2-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d50fa880-73e2-11ea-b4f4-bc764e2007e4;
 Wed, 01 Apr 2020 06:34:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9844EABBD;
 Wed,  1 Apr 2020 06:34:25 +0000 (UTC)
Subject: Re: [PATCH v8 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200320184240.41769-1-roger.pau@citrix.com>
 <20200320184240.41769-2-roger.pau@citrix.com>
 <ee1587a0-7a6c-a1f9-860e-ea93a05d8462@suse.com>
 <20200331164500.GT28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a8ee855-7659-2a97-bab0-d0e43b171adf@suse.com>
Date: Wed, 1 Apr 2020 08:34:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331164500.GT28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 18:45, Roger Pau Monné wrote:
> On Tue, Mar 31, 2020 at 05:40:59PM +0200, Jan Beulich wrote:
>> On 20.03.2020 19:42, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/mm/hap/hap.c
>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>> @@ -118,7 +118,7 @@ int hap_track_dirty_vram(struct domain *d,
>>>              p2m_change_type_range(d, begin_pfn, begin_pfn + nr,
>>>                                    p2m_ram_rw, p2m_ram_logdirty);
>>>  
>>> -            flush_tlb_mask(d->dirty_cpumask);
>>> +            flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
>>>  
>>>              memset(dirty_bitmap, 0xff, size); /* consider all pages dirty */
>>>          }
>>> @@ -205,7 +205,7 @@ static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
>>>           * to be read-only, or via hardware-assisted log-dirty.
>>>           */
>>>          p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
>>> -        flush_tlb_mask(d->dirty_cpumask);
>>> +        flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
>>>      }
>>>      return 0;
>>>  }
>>> @@ -234,7 +234,7 @@ static void hap_clean_dirty_bitmap(struct domain *d)
>>>       * be read-only, or via hardware-assisted log-dirty.
>>>       */
>>>      p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
>>> -    flush_tlb_mask(d->dirty_cpumask);
>>> +    flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
>>>  }
>>>  
>>>  /************************************************/
>>> @@ -798,7 +798,7 @@ hap_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn, l1_pgentry_t *p,
>>>  
>>>      safe_write_pte(p, new);
>>>      if ( old_flags & _PAGE_PRESENT )
>>> -        flush_tlb_mask(d->dirty_cpumask);
>>> +        flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
>>
>> For all four - why FLUSH_TLB? Doesn't the flushing here solely care
>> about guest translations?
> 
> Not on AMD, at least to my understanding, the AMD SDM states:
> 
> "If a hypervisor modifies a nested page table by decreasing permission
> levels, clearing present bits, or changing address translations and
> intends to return to the same ASID, it should use either TLB command
> 011b or 001b."
> 
> It's in section 15.16.1.
> 
> This to my understanding implies that on AMD hardware modifications to
> the NPT require an ASID flush. I assume that on AMD ASIDs also cache
> combined translations, guest linear -> host physical.

I guess I don't follow - I asked about FLUSH_TLB. I agree there needs
to be FLUSH_HVM_ASID_CORE here.

>>> --- a/xen/arch/x86/mm/hap/nested_hap.c
>>> +++ b/xen/arch/x86/mm/hap/nested_hap.c
>>> @@ -84,7 +84,7 @@ nestedp2m_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
>>>      safe_write_pte(p, new);
>>>  
>>>      if (old_flags & _PAGE_PRESENT)
>>> -        flush_tlb_mask(p2m->dirty_cpumask);
>>> +        flush_mask(p2m->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
>>
>> Same here then I guess.
>>
>>> --- a/xen/arch/x86/mm/p2m-pt.c
>>> +++ b/xen/arch/x86/mm/p2m-pt.c
>>> @@ -896,7 +896,8 @@ static void p2m_pt_change_entry_type_global(struct p2m_domain *p2m,
>>>      unmap_domain_page(tab);
>>>  
>>>      if ( changed )
>>> -         flush_tlb_mask(p2m->domain->dirty_cpumask);
>>> +         flush_mask(p2m->domain->dirty_cpumask,
>>> +                    FLUSH_TLB | FLUSH_HVM_ASID_CORE);
>>
>> Given that this code is used in shadow mode as well, perhaps
>> better to keep it here. Albeit maybe FLUSH_TLB could be dependent
>> upon !hap_enabled()?
>>
>>> --- a/xen/arch/x86/mm/paging.c
>>> +++ b/xen/arch/x86/mm/paging.c
>>> @@ -613,7 +613,7 @@ void paging_log_dirty_range(struct domain *d,
>>>  
>>>      p2m_unlock(p2m);
>>>  
>>> -    flush_tlb_mask(d->dirty_cpumask);
>>> +    flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
>>
>> Same here?
> 
> I'm fine with doing further refinements, but I would like to be on the
> conservative side and keep such flushes.

Well, if hap.c had FLUSH_TLB dropped, for consistency it should
become conditional here, imo.

>>> @@ -993,7 +993,7 @@ static void shadow_blow_tables(struct domain *d)
>>>                                 pagetable_get_mfn(v->arch.shadow_table[i]), 0);
>>>  
>>>      /* Make sure everyone sees the unshadowings */
>>> -    flush_tlb_mask(d->dirty_cpumask);
>>> +    flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
>>
>> Taking this as example, wouldn't it be more consistent overall if
>> paths not being HVM-only would specify FLUSH_HVM_ASID_CORE only
>> for HVM domains?
> 
> I think there's indeed room for improvement here, as it's likely
> possible to drop some of the ASID/VPID flushes. Given that previous to
> this patch we would flush ASIDs on every TLB flush I think the current
> approach is safe, and as said above further improvements can be done
> afterwards.

There's no safety implication from my suggestion. Needless
FLUSH_HVM_ASID_CORE for non-HVM will result in a call to
hvm_flush_guest_tlbs(), with it then causing the generation
to be incremented without there being any vCPU to consume
this, as there's not going to be a VM entry without a prior
context switch on the specific CPU.

>> Also, seeing the large number of conversions, perhaps have another
>> wrapper, e.g. flush_tlb_mask_hvm(), at least for the cases where
>> both flags get specified unconditionally?
> 
> That's fine for me, if you agree with the proposed naming
> (flush_tlb_mask_hvm) I'm happy to introduce the helper.

Well, I couldn't (and still can't) think of a better (yet not
overly long) name, yet I'm also not fully happy with it.

Jan

