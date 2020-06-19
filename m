Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45872200AF0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 16:08:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmHfW-0004jT-1d; Fri, 19 Jun 2020 14:06:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jmHfU-0004jO-AJ
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 14:06:56 +0000
X-Inumbo-ID: 21941f24-b236-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21941f24-b236-11ea-bb8b-bc764e2007e4;
 Fri, 19 Jun 2020 14:06:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3998BADE5;
 Fri, 19 Jun 2020 14:06:53 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/tlb: fix assisted flush usage
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200618160403.35199-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0b6c900f-e2a6-c9b1-0e57-68c6898150a9@suse.com>
Date: Fri, 19 Jun 2020 16:06:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200618160403.35199-1-roger.pau@citrix.com>
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

On 18.06.2020 18:04, Roger Pau Monne wrote:
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
> can be used.
> 
> Introduce a new flag (FLUSH_FORCE_IPI) and helper to force a TLB flush
> using an IPI (flush_tlb_mask_sync). Note that the flag is only
> meaningfully defined when the hypervisor supports PV mode, as
> otherwise translated domains are in charge of their page tables and
> won't share page tables with Xen, thus not influencing the result of
> page walks performed by the spurious fault handler.

Is this true for shadow mode? If a page shadowing a guest one was
given back quickly enough to the allocator and then re-used, I think
the same situation could in principle arise.

> Note the flag is not defined on Arm, and the introduced helper is just
> a dummy alias to the existing flush_tlb_mask.
> 
> Fixes: e9aca9470ed86 ('x86/tlb: use Xen L0 assisted TLB flush when available')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> It's my understanding that not doing such IPI flushes could lead to
> the pages tables being read by __page_fault_type being modified by a
> third party, which could make them point to other mfns out of the
> scope of the guest allowed physical memory addresses. However those
> accesses would be limited to __page_fault_type, and hence the main
> worry would be that a guest could make it point to read from a
> physical memory region that has side effects?

I don't think so, no - the memory could be changed such that the
PTEs are invalid altogether (like having reserved bits set). Consider
for example the case of reading an MFN out of such a PTE that's larger
than the physical address width supported by the CPU. Afaict
map_domain_page() will happily install a respective page table entry,
but we'd get a reserved-bit #PF upon reading from that mapping.

> ---
>  xen/arch/x86/mm.c              | 12 +++++++++++-
>  xen/common/memory.c            |  2 +-
>  xen/common/page_alloc.c        |  2 +-
>  xen/include/asm-arm/flushtlb.h |  1 +
>  xen/include/asm-x86/flushtlb.h | 14 ++++++++++++++
>  xen/include/xen/mm.h           |  8 ++++++--
>  6 files changed, 34 insertions(+), 5 deletions(-)

Not finding a consumer of the new flag, my first reaction was to
ask whether there's code missing somewhere. Having looked at
flush_area_mask() another time I now understand the itended
behavior results because of the extra flag now allowing
hypervisor_flush_tlb() to be entered. I think that's something
that's worth calling out in the description, or perhaps even in
the comment next to the #define.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -2894,7 +2894,17 @@ static int _get_page_type(struct page_info *page, unsigned long type,
>                        ((nx & PGT_type_mask) == PGT_writable_page)) )
>                  {
>                      perfc_incr(need_flush_tlb_flush);
> -                    flush_tlb_mask(mask);
> +                    if ( (x & PGT_type_mask) &&
> +                         (x & PGT_type_mask) <= PGT_l4_page_table )

With there being 5-level page tables around the corner, I think
we ought to get used to use PGT_root_page_table (or alike)
whenever possible, to avoid having to touch such code when
adding support for the new paging mode.

> --- a/xen/include/asm-x86/flushtlb.h
> +++ b/xen/include/asm-x86/flushtlb.h
> @@ -126,6 +126,12 @@ void switch_cr3_cr4(unsigned long cr3, unsigned long cr4);
>  #else
>  #define FLUSH_HVM_ASID_CORE 0
>  #endif
> +#if CONFIG_PV

#ifdef

> +/* Force an IPI to be sent */
> +# define FLUSH_FORCE_IPI 0x8000
> +#else
> +# define FLUSH_FORCE_IPI 0
> +#endif

If my shadow mode concern above is unwarranted, this overhead could
also be avoided if there's no PV domain at all in the system.
Perhaps an improvement not for now, but for the future ...

Jan

