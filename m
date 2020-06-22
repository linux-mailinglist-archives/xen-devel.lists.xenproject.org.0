Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A43120335C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 11:32:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnInh-0002ij-3L; Mon, 22 Jun 2020 09:31:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48w=AD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jnInf-0002ie-A7
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 09:31:35 +0000
X-Inumbo-ID: 295b7946-b46b-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 295b7946-b46b-11ea-bb8b-bc764e2007e4;
 Mon, 22 Jun 2020 09:31:34 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0X73z1w2Bk0Skytn43gA6dE5BYrGftvErUanFqlLzE7YG/FZFVp0XNcBlxOSr/pr/6L1ylYy9O
 CBO0Idq3+FECjmKpMelTaJA9SBLgqMJ0o2eiHetZ4n0cTsxiEAVn4nSKs/TW5X4jh3A0jdNw8H
 HUz9J5vTi/PjK/05Y66OQIZFT5Zy+fHG4v0J/R6BtoP8EwhBsNszzxnORIdhynC1qJLRn/DktF
 c3l8HpZ7XWBGyQdMwRlHMmLgMWt1Os/qM4rxI+gIv5d6/fMOG1qlDh0zSMwauU9j7KXVHUxpNO
 4sw=
X-SBRS: 2.7
X-MesageID: 20596152
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,266,1589256000"; d="scan'208";a="20596152"
Date: Mon, 22 Jun 2020 11:31:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14] x86/tlb: fix assisted flush usage
Message-ID: <20200622093123.GI735@Air-de-Roger>
References: <20200618160403.35199-1-roger.pau@citrix.com>
 <0b6c900f-e2a6-c9b1-0e57-68c6898150a9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b6c900f-e2a6-c9b1-0e57-68c6898150a9@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, paul@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 19, 2020 at 04:06:55PM +0200, Jan Beulich wrote:
> On 18.06.2020 18:04, Roger Pau Monne wrote:
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
> > can be used.
> > 
> > Introduce a new flag (FLUSH_FORCE_IPI) and helper to force a TLB flush
> > using an IPI (flush_tlb_mask_sync). Note that the flag is only
> > meaningfully defined when the hypervisor supports PV mode, as
> > otherwise translated domains are in charge of their page tables and
> > won't share page tables with Xen, thus not influencing the result of
> > page walks performed by the spurious fault handler.
> 
> Is this true for shadow mode? If a page shadowing a guest one was
> given back quickly enough to the allocator and then re-used, I think
> the same situation could in principle arise.

Hm, I think it's not applicable to HVM shadow mode at least, because
CR3 is switched as part of vmentry/vmexit, and the page tables are not
shared between Xen and the guest, so there's no way for a HVM shadow
guest to modify the page-tables while Xen is walking them in
spurious_page_fault (note spurious_page_fault is only called when the
fault happens in non-guest context).

> > Note the flag is not defined on Arm, and the introduced helper is just
> > a dummy alias to the existing flush_tlb_mask.
> > 
> > Fixes: e9aca9470ed86 ('x86/tlb: use Xen L0 assisted TLB flush when available')
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > It's my understanding that not doing such IPI flushes could lead to
> > the pages tables being read by __page_fault_type being modified by a
> > third party, which could make them point to other mfns out of the
> > scope of the guest allowed physical memory addresses. However those
> > accesses would be limited to __page_fault_type, and hence the main
> > worry would be that a guest could make it point to read from a
> > physical memory region that has side effects?
> 
> I don't think so, no - the memory could be changed such that the
> PTEs are invalid altogether (like having reserved bits set). Consider
> for example the case of reading an MFN out of such a PTE that's larger
> than the physical address width supported by the CPU. Afaict
> map_domain_page() will happily install a respective page table entry,
> but we'd get a reserved-bit #PF upon reading from that mapping.

So there are no hazards from executing __page_fault_type against a
page-table that could be modified by a user?

> > ---
> >  xen/arch/x86/mm.c              | 12 +++++++++++-
> >  xen/common/memory.c            |  2 +-
> >  xen/common/page_alloc.c        |  2 +-
> >  xen/include/asm-arm/flushtlb.h |  1 +
> >  xen/include/asm-x86/flushtlb.h | 14 ++++++++++++++
> >  xen/include/xen/mm.h           |  8 ++++++--
> >  6 files changed, 34 insertions(+), 5 deletions(-)
> 
> Not finding a consumer of the new flag, my first reaction was to
> ask whether there's code missing somewhere. Having looked at
> flush_area_mask() another time I now understand the itended
> behavior results because of the extra flag now allowing
> hypervisor_flush_tlb() to be entered. I think that's something
> that's worth calling out in the description, or perhaps even in
> the comment next to the #define.

Oh right, the condition to use assisted flush is not actually changed
in flush_area_mask since setting any bit in the flags would prevent
using it.

> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -2894,7 +2894,17 @@ static int _get_page_type(struct page_info *page, unsigned long type,
> >                        ((nx & PGT_type_mask) == PGT_writable_page)) )
> >                  {
> >                      perfc_incr(need_flush_tlb_flush);
> > -                    flush_tlb_mask(mask);
> > +                    if ( (x & PGT_type_mask) &&
> > +                         (x & PGT_type_mask) <= PGT_l4_page_table )
> 
> With there being 5-level page tables around the corner, I think
> we ought to get used to use PGT_root_page_table (or alike)
> whenever possible, to avoid having to touch such code when
> adding support for the new paging mode.
> 
> > --- a/xen/include/asm-x86/flushtlb.h
> > +++ b/xen/include/asm-x86/flushtlb.h
> > @@ -126,6 +126,12 @@ void switch_cr3_cr4(unsigned long cr3, unsigned long cr4);
> >  #else
> >  #define FLUSH_HVM_ASID_CORE 0
> >  #endif
> > +#if CONFIG_PV
> 
> #ifdef
> 
> > +/* Force an IPI to be sent */
> > +# define FLUSH_FORCE_IPI 0x8000
> > +#else
> > +# define FLUSH_FORCE_IPI 0
> > +#endif
> 
> If my shadow mode concern above is unwarranted, this overhead could
> also be avoided if there's no PV domain at all in the system.
> Perhaps an improvement not for now, but for the future ...

Hm, right, I guess it would be possible to turn FLUSH_FORCE_IPI into a
dynamic flag.

Thanks, Roger.

