Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D599199A08
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 17:43:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJJ0h-0005rf-Td; Tue, 31 Mar 2020 15:41:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJJ0g-0005ra-Of
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 15:41:02 +0000
X-Inumbo-ID: 06112328-7366-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06112328-7366-11ea-9e09-bc764e2007e4;
 Tue, 31 Mar 2020 15:41:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EED30AFD7;
 Tue, 31 Mar 2020 15:41:00 +0000 (UTC)
Subject: Re: [PATCH v8 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200320184240.41769-1-roger.pau@citrix.com>
 <20200320184240.41769-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ee1587a0-7a6c-a1f9-860e-ea93a05d8462@suse.com>
Date: Tue, 31 Mar 2020 17:40:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320184240.41769-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 20.03.2020 19:42, Roger Pau Monne wrote:
> Introduce a specific flag to request a HVM guest linear TLB flush,
> which is an ASID/VPID tickle that forces a guest linear to guest
> physical TLB flush for all HVM guests.
> 
> This was previously unconditionally done in each pre_flush call, but
> that's not required: HVM guests not using shadow don't require linear
> TLB flushes as Xen doesn't modify the guest page tables in that case
> (ie: when using HAP). Note that shadow paging code already takes care
> of issuing the necessary flushes when the shadow page tables are
> modified.
> 
> In order to keep the previous behavior modify all shadow code TLB
> flushes to also flush the guest linear to physical TLB. I haven't
> looked at each specific shadow code TLB flush in order to figure out
> whether it actually requires a guest TLB flush or not, so there might
> be room for improvement in that regard.
> 
> Also perform ASID/VPIT flushes when modifying the p2m tables as it's a
> requirement for AMD hardware. Finally keep the flush in
> switch_cr3_cr4, as it's not clear whether code could rely on
> switch_cr3_cr4 also performing a guest linear TLB flush. A following
> patch can remove the ASID/VPIT tickle from switch_cr3_cr4 if found to
> not be necessary.

s/VPIT/VPID/ in this paragraph?

> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -118,7 +118,7 @@ int hap_track_dirty_vram(struct domain *d,
>              p2m_change_type_range(d, begin_pfn, begin_pfn + nr,
>                                    p2m_ram_rw, p2m_ram_logdirty);
>  
> -            flush_tlb_mask(d->dirty_cpumask);
> +            flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
>  
>              memset(dirty_bitmap, 0xff, size); /* consider all pages dirty */
>          }
> @@ -205,7 +205,7 @@ static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
>           * to be read-only, or via hardware-assisted log-dirty.
>           */
>          p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> -        flush_tlb_mask(d->dirty_cpumask);
> +        flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
>      }
>      return 0;
>  }
> @@ -234,7 +234,7 @@ static void hap_clean_dirty_bitmap(struct domain *d)
>       * be read-only, or via hardware-assisted log-dirty.
>       */
>      p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> -    flush_tlb_mask(d->dirty_cpumask);
> +    flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
>  }
>  
>  /************************************************/
> @@ -798,7 +798,7 @@ hap_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn, l1_pgentry_t *p,
>  
>      safe_write_pte(p, new);
>      if ( old_flags & _PAGE_PRESENT )
> -        flush_tlb_mask(d->dirty_cpumask);
> +        flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);

For all four - why FLUSH_TLB? Doesn't the flushing here solely care
about guest translations?

> --- a/xen/arch/x86/mm/hap/nested_hap.c
> +++ b/xen/arch/x86/mm/hap/nested_hap.c
> @@ -84,7 +84,7 @@ nestedp2m_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
>      safe_write_pte(p, new);
>  
>      if (old_flags & _PAGE_PRESENT)
> -        flush_tlb_mask(p2m->dirty_cpumask);
> +        flush_mask(p2m->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);

Same here then I guess.

> --- a/xen/arch/x86/mm/p2m-pt.c
> +++ b/xen/arch/x86/mm/p2m-pt.c
> @@ -896,7 +896,8 @@ static void p2m_pt_change_entry_type_global(struct p2m_domain *p2m,
>      unmap_domain_page(tab);
>  
>      if ( changed )
> -         flush_tlb_mask(p2m->domain->dirty_cpumask);
> +         flush_mask(p2m->domain->dirty_cpumask,
> +                    FLUSH_TLB | FLUSH_HVM_ASID_CORE);

Given that this code is used in shadow mode as well, perhaps
better to keep it here. Albeit maybe FLUSH_TLB could be dependent
upon !hap_enabled()?

> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -613,7 +613,7 @@ void paging_log_dirty_range(struct domain *d,
>  
>      p2m_unlock(p2m);
>  
> -    flush_tlb_mask(d->dirty_cpumask);
> +    flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);

Same here?

> @@ -993,7 +993,7 @@ static void shadow_blow_tables(struct domain *d)
>                                 pagetable_get_mfn(v->arch.shadow_table[i]), 0);
>  
>      /* Make sure everyone sees the unshadowings */
> -    flush_tlb_mask(d->dirty_cpumask);
> +    flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);

Taking this as example, wouldn't it be more consistent overall if
paths not being HVM-only would specify FLUSH_HVM_ASID_CORE only
for HVM domains?

Also, seeing the large number of conversions, perhaps have another
wrapper, e.g. flush_tlb_mask_hvm(), at least for the cases where
both flags get specified unconditionally?

Jan

