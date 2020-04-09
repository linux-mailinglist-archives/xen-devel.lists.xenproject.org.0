Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E07AF1A339B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 13:55:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMVld-0007rT-DR; Thu, 09 Apr 2020 11:54:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jMVlc-0007rO-2W
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 11:54:44 +0000
X-Inumbo-ID: e5e9e7de-7a58-11ea-82b4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5e9e7de-7a58-11ea-82b4-12813bfff9fa;
 Thu, 09 Apr 2020 11:54:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DF44DAE30;
 Thu,  9 Apr 2020 11:54:40 +0000 (UTC)
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200406105703.79201-1-roger.pau@citrix.com>
 <20200406105703.79201-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <30062a0c-6587-a16e-2b31-de0dd6bf4c9a@suse.com>
Date: Thu, 9 Apr 2020 13:54:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406105703.79201-2-roger.pau@citrix.com>
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

On 06.04.2020 12:57, Roger Pau Monne wrote:
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -118,7 +118,7 @@ int hap_track_dirty_vram(struct domain *d,
>              p2m_change_type_range(d, begin_pfn, begin_pfn + nr,
>                                    p2m_ram_rw, p2m_ram_logdirty);
>  
> -            flush_tlb_mask(d->dirty_cpumask);
> +            hap_flush_tlb_mask(d->dirty_cpumask);
>  
>              memset(dirty_bitmap, 0xff, size); /* consider all pages dirty */
>          }
> @@ -205,7 +205,7 @@ static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
>           * to be read-only, or via hardware-assisted log-dirty.
>           */
>          p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> -        flush_tlb_mask(d->dirty_cpumask);
> +        hap_flush_tlb_mask(d->dirty_cpumask);
>      }
>      return 0;
>  }
> @@ -234,7 +234,7 @@ static void hap_clean_dirty_bitmap(struct domain *d)
>       * be read-only, or via hardware-assisted log-dirty.
>       */
>      p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> -    flush_tlb_mask(d->dirty_cpumask);
> +    hap_flush_tlb_mask(d->dirty_cpumask);
>  }
>  
>  /************************************************/
> @@ -798,7 +798,7 @@ hap_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn, l1_pgentry_t *p,
>  
>      safe_write_pte(p, new);
>      if ( old_flags & _PAGE_PRESENT )
> -        flush_tlb_mask(d->dirty_cpumask);
> +        hap_flush_tlb_mask(d->dirty_cpumask);
>  
>      paging_unlock(d);
>  

Following up on my earlier mail about paging_log_dirty_range(), I'm
now of the opinion that all of these flushes should go away too. I
can only assume that they got put where they are when HAP code was
cloned from the shadow one. These are only p2m operations, and hence
p2m level TLB flushing is all that's needed here.

> --- a/xen/arch/x86/mm/hap/nested_hap.c
> +++ b/xen/arch/x86/mm/hap/nested_hap.c
> @@ -84,7 +84,7 @@ nestedp2m_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
>      safe_write_pte(p, new);
>  
>      if (old_flags & _PAGE_PRESENT)
> -        flush_tlb_mask(p2m->dirty_cpumask);
> +        hap_flush_tlb_mask(p2m->dirty_cpumask);

Same here then presumably.

As suggested in my earlier reply, the plain removals of flush
invocations would probably better be split out into a separate
patch.

> --- a/xen/arch/x86/mm/hap/private.h
> +++ b/xen/arch/x86/mm/hap/private.h
> @@ -47,4 +47,9 @@ unsigned long hap_p2m_ga_to_gfn_4_levels(struct vcpu *v,
>      struct p2m_domain *p2m, unsigned long cr3,
>      paddr_t ga, uint32_t *pfec, unsigned int *page_order);
>  
> +static inline void hap_flush_tlb_mask(const cpumask_t *mask)
> +{
> +    flush_mask(mask, FLUSH_HVM_ASID_CORE);
> +}

With the above introduction of this would then become unnecessary.

Jan

