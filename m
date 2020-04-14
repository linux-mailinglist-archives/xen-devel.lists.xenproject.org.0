Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13061A76CA
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 11:01:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOHRS-0006Dv-3p; Tue, 14 Apr 2020 09:01:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOHRQ-0006Dm-25
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 09:01:12 +0000
X-Inumbo-ID: 7c342320-7e2e-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c342320-7e2e-11ea-9e09-bc764e2007e4;
 Tue, 14 Apr 2020 09:01:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 13045AA55;
 Tue, 14 Apr 2020 09:01:09 +0000 (UTC)
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200406105703.79201-1-roger.pau@citrix.com>
 <20200406105703.79201-2-roger.pau@citrix.com>
 <30062a0c-6587-a16e-2b31-de0dd6bf4c9a@suse.com>
 <20200414075245.GC28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <92a4ff05-9dcf-1d50-b9b2-bde39c4e3e8d@suse.com>
Date: Tue, 14 Apr 2020 11:01:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414075245.GC28601@Air-de-Roger>
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

On 14.04.2020 09:52, Roger Pau Monné wrote:
> On Thu, Apr 09, 2020 at 01:54:40PM +0200, Jan Beulich wrote:
>> On 06.04.2020 12:57, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/mm/hap/hap.c
>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>> @@ -118,7 +118,7 @@ int hap_track_dirty_vram(struct domain *d,
>>>              p2m_change_type_range(d, begin_pfn, begin_pfn + nr,
>>>                                    p2m_ram_rw, p2m_ram_logdirty);
>>>  
>>> -            flush_tlb_mask(d->dirty_cpumask);
>>> +            hap_flush_tlb_mask(d->dirty_cpumask);
>>>  
>>>              memset(dirty_bitmap, 0xff, size); /* consider all pages dirty */
>>>          }
>>> @@ -205,7 +205,7 @@ static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
>>>           * to be read-only, or via hardware-assisted log-dirty.
>>>           */
>>>          p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
>>> -        flush_tlb_mask(d->dirty_cpumask);
>>> +        hap_flush_tlb_mask(d->dirty_cpumask);
>>>      }
>>>      return 0;
>>>  }
>>> @@ -234,7 +234,7 @@ static void hap_clean_dirty_bitmap(struct domain *d)
>>>       * be read-only, or via hardware-assisted log-dirty.
>>>       */
>>>      p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
>>> -    flush_tlb_mask(d->dirty_cpumask);
>>> +    hap_flush_tlb_mask(d->dirty_cpumask);
>>>  }
>>>  
>>>  /************************************************/
>>> @@ -798,7 +798,7 @@ hap_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn, l1_pgentry_t *p,
>>>  
>>>      safe_write_pte(p, new);
>>>      if ( old_flags & _PAGE_PRESENT )
>>> -        flush_tlb_mask(d->dirty_cpumask);
>>> +        hap_flush_tlb_mask(d->dirty_cpumask);
>>>  
>>>      paging_unlock(d);
>>>  
>>
>> Following up on my earlier mail about paging_log_dirty_range(), I'm
>> now of the opinion that all of these flushes should go away too. I
>> can only assume that they got put where they are when HAP code was
>> cloned from the shadow one. These are only p2m operations, and hence
>> p2m level TLB flushing is all that's needed here.
> 
> IIRC without those ASID flushes NPT won't work correctly, as I think
> it relies on those flushes when updating the p2m.

Hmm, yes - at least for this last one (in patch context) I definitely
agree: NPT's TLB invalidation is quite different from EPT's (and I
was too focused on the latter when writing the earlier reply).
Therefore how about keeping hap_flush_tlb_mask() (and its uses), but
teaching it to do nothing for EPT, while doing an ASID based flush
for NPT?

There may then even be the option to have a wider purpose helper,
dealing with most (all?) of the flushes needed from underneath
x86/mm/, setting the TLB and HVM_ASID_CORE flags as appropriate. In
the EPT case the function would still be a no-op (afaict).

> We could see about moving those flushes inside the NPT functions that
> modify the p2m, AFAICT p2m_pt_set_entry which calls
> p2m->write_p2m_entry relies on the later doing the ASID flushes, as it
> doesn't perform any.

I don't think we want to go this far at this point.

Jan

