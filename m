Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7392D1A7833
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 12:13:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOIZ2-0004uu-9a; Tue, 14 Apr 2020 10:13:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOIZ0-0004up-KE
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 10:13:06 +0000
X-Inumbo-ID: 87df5e88-7e38-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87df5e88-7e38-11ea-83d8-bc764e2007e4;
 Tue, 14 Apr 2020 10:13:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BD16BAD9F;
 Tue, 14 Apr 2020 10:13:03 +0000 (UTC)
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200406105703.79201-1-roger.pau@citrix.com>
 <20200406105703.79201-2-roger.pau@citrix.com>
 <30062a0c-6587-a16e-2b31-de0dd6bf4c9a@suse.com>
 <20200414075245.GC28601@Air-de-Roger>
 <92a4ff05-9dcf-1d50-b9b2-bde39c4e3e8d@suse.com>
 <20200414100213.GH28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <389afe02-1747-1583-e642-6e4025b402aa@suse.com>
Date: Tue, 14 Apr 2020 12:13:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414100213.GH28601@Air-de-Roger>
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

On 14.04.2020 12:02, Roger Pau Monné wrote:
> On Tue, Apr 14, 2020 at 11:01:06AM +0200, Jan Beulich wrote:
>> On 14.04.2020 09:52, Roger Pau Monné wrote:
>>> On Thu, Apr 09, 2020 at 01:54:40PM +0200, Jan Beulich wrote:
>>>> On 06.04.2020 12:57, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/mm/hap/hap.c
>>>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>>>> @@ -118,7 +118,7 @@ int hap_track_dirty_vram(struct domain *d,
>>>>>              p2m_change_type_range(d, begin_pfn, begin_pfn + nr,
>>>>>                                    p2m_ram_rw, p2m_ram_logdirty);
>>>>>  
>>>>> -            flush_tlb_mask(d->dirty_cpumask);
>>>>> +            hap_flush_tlb_mask(d->dirty_cpumask);
>>>>>  
>>>>>              memset(dirty_bitmap, 0xff, size); /* consider all pages dirty */
>>>>>          }
>>>>> @@ -205,7 +205,7 @@ static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
>>>>>           * to be read-only, or via hardware-assisted log-dirty.
>>>>>           */
>>>>>          p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
>>>>> -        flush_tlb_mask(d->dirty_cpumask);
>>>>> +        hap_flush_tlb_mask(d->dirty_cpumask);
>>>>>      }
>>>>>      return 0;
>>>>>  }
>>>>> @@ -234,7 +234,7 @@ static void hap_clean_dirty_bitmap(struct domain *d)
>>>>>       * be read-only, or via hardware-assisted log-dirty.
>>>>>       */
>>>>>      p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
>>>>> -    flush_tlb_mask(d->dirty_cpumask);
>>>>> +    hap_flush_tlb_mask(d->dirty_cpumask);
>>>>>  }
>>>>>  
>>>>>  /************************************************/
>>>>> @@ -798,7 +798,7 @@ hap_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn, l1_pgentry_t *p,
>>>>>  
>>>>>      safe_write_pte(p, new);
>>>>>      if ( old_flags & _PAGE_PRESENT )
>>>>> -        flush_tlb_mask(d->dirty_cpumask);
>>>>> +        hap_flush_tlb_mask(d->dirty_cpumask);
>>>>>  
>>>>>      paging_unlock(d);
>>>>>  
>>>>
>>>> Following up on my earlier mail about paging_log_dirty_range(), I'm
>>>> now of the opinion that all of these flushes should go away too. I
>>>> can only assume that they got put where they are when HAP code was
>>>> cloned from the shadow one. These are only p2m operations, and hence
>>>> p2m level TLB flushing is all that's needed here.
>>>
>>> IIRC without those ASID flushes NPT won't work correctly, as I think
>>> it relies on those flushes when updating the p2m.
>>
>> Hmm, yes - at least for this last one (in patch context) I definitely
>> agree: NPT's TLB invalidation is quite different from EPT's (and I
>> was too focused on the latter when writing the earlier reply).
>> Therefore how about keeping hap_flush_tlb_mask() (and its uses), but
>> teaching it to do nothing for EPT, while doing an ASID based flush
>> for NPT?
> 
> I could give that a try. I'm slightly worried that EPT code might rely
> on some of those ASID/VPID flushes. It seems like it's trying to do
> VPID flushes when needed, but issues could be masked by the ASID/VPID
> flushes done by the callers.

I can't seem to find any EPT code doing VPID flushes, and I'd also
not expect to. There's VMX code doing so, yes. EPT should be fully
agnostic to guest virtual address space.

>> There may then even be the option to have a wider purpose helper,
>> dealing with most (all?) of the flushes needed from underneath
>> x86/mm/, setting the TLB and HVM_ASID_CORE flags as appropriate. In
>> the EPT case the function would still be a no-op (afaict).
> 
> That seems nice, we would have to be careful however as reducing the
> number of ASID/VPID flushes could uncover issues in the existing code.
> I guess you mean something like:
> 
> static inline void guest_flush_tlb_mask(const struct domain *d,
>                                         const cpumask_t *mask)
> {
>     flush_mask(mask, (is_pv_domain(d) || shadow_mode_enabled(d) ? FLUSH_TLB
>                                                                 : 0) |
>     		     (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
> 		                                      : 0));
> }

Almost - is_hvm_domain(d) && cpu_has_svm seems to wide for me. I'd
rather use hap_enabled() && cpu_has_svm, which effectively means NPT.
Or am I overlooking a need to do ASID flushes also in shadow mode?

Also I'd suggest to calculate the flags up front, to avoid calling
flush_mask() in the first place in case (EPT) neither bit is set.

> I think this should work, but I would rather do it in a separate
> patch.

Yes, just like the originally (wrongly, as you validly say) suggested
full removal of them, putting this in a separate patch would indeed
seem better.

> I'm also not fully convinced guest_flush_tlb_mask is the best
> name, but I couldn't think of anything else more descriptive of the
> purpose of the function.

That's the name I was thinking of, too, despite also not being
entirely happy with it.

Jan

