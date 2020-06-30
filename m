Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D7E20F55F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 15:04:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqFve-00038N-H7; Tue, 30 Jun 2020 13:04:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4gHU=AL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jqFvc-00038I-Kn
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 13:04:00 +0000
X-Inumbo-ID: 29365518-bad2-11ea-bca7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29365518-bad2-11ea-bca7-bc764e2007e4;
 Tue, 30 Jun 2020 13:03:59 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: SmFXgo6Z9wuA3UXh/7Qd6NGLn4cCut5oS8NbKqkID7dSCrtmTDxZoUTXIVr/PXztvaJdWICsl+
 nMM0Syc2UBjv0HS4MEZPg2RlYA8Irmx8Zah/WpGOs4dn68baAxDhsrrF/BzMz2D2vnXOZYN7LF
 UAZUnfYi5FZCsUxg37ekwvkRSQoutHvIeT4FUvtIPTBasLqpE4wySI4cRDez4RlqhCRuIWRomX
 Q6oZod9wrMPCbpfm0gGwIY8Pix6F+H6pLcTVKI/70uGouCr85HoO10tuWA3hPK4s5C4sGqQuG3
 +sY=
X-SBRS: 2.7
X-MesageID: 21277757
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,297,1589256000"; d="scan'208";a="21277757"
Date: Tue, 30 Jun 2020 15:03:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14 v4] x86/tlb: fix assisted flush usage
Message-ID: <20200630130351.GL735@Air-de-Roger>
References: <20200626155723.91558-1-roger.pau@citrix.com>
 <ea76f3e0-3c23-96a4-b6e7-597741a4af17@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea76f3e0-3c23-96a4-b6e7-597741a4af17@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On Tue, Jun 30, 2020 at 02:13:36PM +0200, Jan Beulich wrote:
> On 26.06.2020 17:57, Roger Pau Monne wrote:
> > Commit e9aca9470ed86 introduced a regression when avoiding sending
> > IPIs for certain flush operations. Xen page fault handler
> > (spurious_page_fault) relies on blocking interrupts in order to
> > prevent handling TLB flush IPIs and thus preventing other CPUs from
> > removing page tables pages. Switching to assisted flushing avoided such
> > IPIs, and thus can result in pages belonging to the page tables being
> > removed (and possibly re-used) while __page_fault_type is being
> > executed.
> > 
> > Force some of the TLB flushes to use IPIs, thus avoiding the assisted
> > TLB flush. Those selected flushes are the page type change (when
> > switching from a page table type to a different one, ie: a page that
> > has been removed as a page table) and page allocation. This sadly has
> > a negative performance impact on the pvshim, as less assisted flushes
> > can be used. Note the flush in grant-table code is also switched to
> > use an IPI even when not strictly needed. This is done so that a
> > common arch_flush_tlb_mask can be introduced and always used in common
> > code.
> > 
> > Introduce a new flag (FLUSH_FORCE_IPI) and helper to force a TLB flush
> > using an IPI (flush_tlb_mask_sync, x86 only). Note that the flag is
> > only meaningfully defined when the hypervisor supports PV or shadow
> > paging mode, as otherwise hardware assisted paging domains are in
> > charge of their page tables and won't share page tables with Xen, thus
> > not influencing the result of page walks performed by the spurious
> > fault handler.
> > 
> > Just passing this new flag when calling flush_area_mask prevents the
> > usage of the assisted flush without any other side effects.
> > 
> > Note the flag is not defined on Arm.
> > 
> > Fixes: e9aca9470ed86 ('x86/tlb: use Xen L0 assisted TLB flush when available')
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> In principle
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> A few cosmetic remarks though:
> 
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -2894,7 +2894,17 @@ static int _get_page_type(struct page_info *page, unsigned long type,
> >                        ((nx & PGT_type_mask) == PGT_writable_page)) )
> >                  {
> >                      perfc_incr(need_flush_tlb_flush);
> > -                    flush_tlb_mask(mask);
> > +                    if ( (x & PGT_type_mask) &&
> > +                         (x & PGT_type_mask) <= PGT_root_page_table )
> > +                        /*
> > +                         * If page was a page table make sure the flush is
> > +                         * performed using an IPI in order to avoid changing
> > +                         * the type of a page table page under the feet of
> > +                         * spurious_page_fault.
> > +                         */
> > +                        flush_tlb_mask_sync(mask);
> > +                    else
> > +                        flush_tlb_mask(mask);
> 
> Effectively this now is the only user of the new macro. I'd prefer
> avoiding its introduction (and hence avoiding the questionable
> "_sync" suffix), doing
> 
>     flush_mask(mask, FLUSH_TLB | (... ? FLUSH_FORCE_IPI : 0));

Right, maybe placing the '(x & PGT_type_mask) && (x & PGT_type_mask) <=
PGT_root_page_table' condition inside the parameter list of flush_mask
will make the code hard to read, so it might be worth to keep the
if?

> here and ...
> 
> > @@ -148,9 +158,24 @@ void flush_area_mask(const cpumask_t *, const void *va, unsigned int flags);
> >  /* Flush specified CPUs' TLBs */
> >  #define flush_tlb_mask(mask)                    \
> >      flush_mask(mask, FLUSH_TLB)
> > +/*
> > + * Flush specified CPUs' TLBs and force the usage of an IPI to do so. This is
> > + * required for certain operations that rely on page tables themselves not
> > + * being freed and reused when interrupts are blocked, as the flush IPI won't
> > + * be fulfilled until exiting from that critical region.
> > + */
> > +#define flush_tlb_mask_sync(mask)               \
> > +    flush_mask(mask, FLUSH_TLB | FLUSH_FORCE_IPI)
> >  #define flush_tlb_one_mask(mask,v)              \
> >      flush_area_mask(mask, (const void *)(v), FLUSH_TLB|FLUSH_ORDER(0))
> >  
> > +/*
> > + * Alias the common code TLB flush helper to the sync one in order to be on the
> > + * safe side. Note that not all calls from common code strictly require the
> > + * _sync variant.
> > + */
> > +#define arch_flush_tlb_mask flush_tlb_mask_sync
> 
> ...
> 
> #define arch_flush_tlb_mask(mask)               \
>     flush_mask(mask, FLUSH_TLB | FLUSH_FORCE_IPI)

Sure. Feel free to slightly adjust the comment, I think doing
s/Alias/Force/ would be enough.

> here. I'd be okay making these adjustments while committing, if
> you and others don't object.

That's fine, I leave to your judgment whether to use the ternary
operator in the _get_page_type case.

Roger.

