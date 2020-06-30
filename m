Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103FB20F451
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 14:15:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqF8t-00064Y-Pi; Tue, 30 Jun 2020 12:13:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jqF8s-00064T-Fu
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 12:13:38 +0000
X-Inumbo-ID: 1fb85d58-bacb-11ea-860b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fb85d58-bacb-11ea-860b-12813bfff9fa;
 Tue, 30 Jun 2020 12:13:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6427AE70;
 Tue, 30 Jun 2020 12:13:35 +0000 (UTC)
Subject: Re: [PATCH for-4.14 v4] x86/tlb: fix assisted flush usage
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200626155723.91558-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea76f3e0-3c23-96a4-b6e7-597741a4af17@suse.com>
Date: Tue, 30 Jun 2020 14:13:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626155723.91558-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.06.2020 17:57, Roger Pau Monne wrote:
> Commit e9aca9470ed86 introduced a regression when avoiding sending
> IPIs for certain flush operations. Xen page fault handler
> (spurious_page_fault) relies on blocking interrupts in order to
> prevent handling TLB flush IPIs and thus preventing other CPUs from
> removing page tables pages. Switching to assisted flushing avoided such
> IPIs, and thus can result in pages belonging to the page tables being
> removed (and possibly re-used) while __page_fault_type is being
> executed.
> 
> Force some of the TLB flushes to use IPIs, thus avoiding the assisted
> TLB flush. Those selected flushes are the page type change (when
> switching from a page table type to a different one, ie: a page that
> has been removed as a page table) and page allocation. This sadly has
> a negative performance impact on the pvshim, as less assisted flushes
> can be used. Note the flush in grant-table code is also switched to
> use an IPI even when not strictly needed. This is done so that a
> common arch_flush_tlb_mask can be introduced and always used in common
> code.
> 
> Introduce a new flag (FLUSH_FORCE_IPI) and helper to force a TLB flush
> using an IPI (flush_tlb_mask_sync, x86 only). Note that the flag is
> only meaningfully defined when the hypervisor supports PV or shadow
> paging mode, as otherwise hardware assisted paging domains are in
> charge of their page tables and won't share page tables with Xen, thus
> not influencing the result of page walks performed by the spurious
> fault handler.
> 
> Just passing this new flag when calling flush_area_mask prevents the
> usage of the assisted flush without any other side effects.
> 
> Note the flag is not defined on Arm.
> 
> Fixes: e9aca9470ed86 ('x86/tlb: use Xen L0 assisted TLB flush when available')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

In principle
Reviewed-by: Jan Beulich <jbeulich@suse.com>
A few cosmetic remarks though:

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -2894,7 +2894,17 @@ static int _get_page_type(struct page_info *page, unsigned long type,
>                        ((nx & PGT_type_mask) == PGT_writable_page)) )
>                  {
>                      perfc_incr(need_flush_tlb_flush);
> -                    flush_tlb_mask(mask);
> +                    if ( (x & PGT_type_mask) &&
> +                         (x & PGT_type_mask) <= PGT_root_page_table )
> +                        /*
> +                         * If page was a page table make sure the flush is
> +                         * performed using an IPI in order to avoid changing
> +                         * the type of a page table page under the feet of
> +                         * spurious_page_fault.
> +                         */
> +                        flush_tlb_mask_sync(mask);
> +                    else
> +                        flush_tlb_mask(mask);

Effectively this now is the only user of the new macro. I'd prefer
avoiding its introduction (and hence avoiding the questionable
"_sync" suffix), doing

    flush_mask(mask, FLUSH_TLB | (... ? FLUSH_FORCE_IPI : 0));

here and ...

> @@ -148,9 +158,24 @@ void flush_area_mask(const cpumask_t *, const void *va, unsigned int flags);
>  /* Flush specified CPUs' TLBs */
>  #define flush_tlb_mask(mask)                    \
>      flush_mask(mask, FLUSH_TLB)
> +/*
> + * Flush specified CPUs' TLBs and force the usage of an IPI to do so. This is
> + * required for certain operations that rely on page tables themselves not
> + * being freed and reused when interrupts are blocked, as the flush IPI won't
> + * be fulfilled until exiting from that critical region.
> + */
> +#define flush_tlb_mask_sync(mask)               \
> +    flush_mask(mask, FLUSH_TLB | FLUSH_FORCE_IPI)
>  #define flush_tlb_one_mask(mask,v)              \
>      flush_area_mask(mask, (const void *)(v), FLUSH_TLB|FLUSH_ORDER(0))
>  
> +/*
> + * Alias the common code TLB flush helper to the sync one in order to be on the
> + * safe side. Note that not all calls from common code strictly require the
> + * _sync variant.
> + */
> +#define arch_flush_tlb_mask flush_tlb_mask_sync

...

#define arch_flush_tlb_mask(mask)               \
    flush_mask(mask, FLUSH_TLB | FLUSH_FORCE_IPI)

here. I'd be okay making these adjustments while committing, if
you and others don't object.

Jan

