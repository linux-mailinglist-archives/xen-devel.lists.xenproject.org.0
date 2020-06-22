Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B562037DC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 15:24:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnMQu-0007Fo-JQ; Mon, 22 Jun 2020 13:24:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48w=AD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jnMQt-0007Fj-BA
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 13:24:19 +0000
X-Inumbo-ID: ac4d037c-b48b-11ea-bca7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac4d037c-b48b-11ea-bca7-bc764e2007e4;
 Mon, 22 Jun 2020 13:24:17 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 72JLREy5tlnWQy2N//vIJ+8DWcwz/J3H3u0UlwN6DNyt08rAowWiXLXf8VohKcriNiYVrPQqt0
 0qRpFHSLhgsOUL6YRvx9VQMKbvjskcn8iSlaYqzmw0YhL5qxa/+EDvHUOrsUNS3+WyZnAozU0d
 mw701/nAkFWDcTDw3WiV114Qnv9dj7fTOM2dCtdbRCS7ZJhcd1laVFrF0lvr1bUyX/Q3rW4Ipg
 t9gs7Qvf0O7oGnlFwPjX/d0TElTwOKqAl7djGt1kt1ZruKiukcrYuDWz/R8X9zZtFqJ0TNyGaB
 NL0=
X-SBRS: 2.7
X-MesageID: 20964307
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,266,1589256000"; d="scan'208";a="20964307"
Date: Mon, 22 Jun 2020 15:24:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14] x86/tlb: fix assisted flush usage
Message-ID: <20200622132410.GJ735@Air-de-Roger>
References: <20200618160403.35199-1-roger.pau@citrix.com>
 <0b6c900f-e2a6-c9b1-0e57-68c6898150a9@suse.com>
 <20200622093123.GI735@Air-de-Roger>
 <5ad66ef4-9406-f35a-5683-ac4608242dd7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ad66ef4-9406-f35a-5683-ac4608242dd7@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, paul@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 22, 2020 at 01:07:10PM +0200, Jan Beulich wrote:
> On 22.06.2020 11:31, Roger Pau Monné wrote:
> > On Fri, Jun 19, 2020 at 04:06:55PM +0200, Jan Beulich wrote:
> >> On 18.06.2020 18:04, Roger Pau Monne wrote:
> >>> Commit e9aca9470ed86 introduced a regression when avoiding sending
> >>> IPIs for certain flush operations. Xen page fault handler
> >>> (spurious_page_fault) relies on blocking interrupts in order to
> >>> prevent handling TLB flush IPIs and thus preventing other CPUs from
> >>> removing page tables pages. Switching to assisted flushing avoided such
> >>> IPIs, and thus can result in pages belonging to the page tables being
> >>> removed (and possibly re-used) while __page_fault_type is being
> >>> executed.
> >>>
> >>> Force some of the TLB flushes to use IPIs, thus avoiding the assisted
> >>> TLB flush. Those selected flushes are the page type change (when
> >>> switching from a page table type to a different one, ie: a page that
> >>> has been removed as a page table) and page allocation. This sadly has
> >>> a negative performance impact on the pvshim, as less assisted flushes
> >>> can be used.
> >>>
> >>> Introduce a new flag (FLUSH_FORCE_IPI) and helper to force a TLB flush
> >>> using an IPI (flush_tlb_mask_sync). Note that the flag is only
> >>> meaningfully defined when the hypervisor supports PV mode, as
> >>> otherwise translated domains are in charge of their page tables and
> >>> won't share page tables with Xen, thus not influencing the result of
> >>> page walks performed by the spurious fault handler.
> >>
> >> Is this true for shadow mode? If a page shadowing a guest one was
> >> given back quickly enough to the allocator and then re-used, I think
> >> the same situation could in principle arise.
> > 
> > Hm, I think it's not applicable to HVM shadow mode at least, because
> > CR3 is switched as part of vmentry/vmexit, and the page tables are not
> > shared between Xen and the guest, so there's no way for a HVM shadow
> > guest to modify the page-tables while Xen is walking them in
> > spurious_page_fault (note spurious_page_fault is only called when the
> > fault happens in non-guest context).
> 
> I'm afraid I disagree, because of shadow's use of "linear page tables".

You will have to bear with me, but I don't follow.

Could you provide some pointers at how/where the shadow (I assume
guest controlled) "linear page tables" are used while in Xen
context?

do_page_fault will only call spurious_page_fault (and thus attempt a
page walk) when the fault happens in non-guest context, yet on HVM all
accesses to guest memory are performed using __hvm_copy which doesn't
load any guest page tables into CR3, but instead performs a software
walk of the paging structures in order to find and map the destination
address into the hypervisor page tables and perform the read or copy.

> >>> Note the flag is not defined on Arm, and the introduced helper is just
> >>> a dummy alias to the existing flush_tlb_mask.
> >>>
> >>> Fixes: e9aca9470ed86 ('x86/tlb: use Xen L0 assisted TLB flush when available')
> >>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> It's my understanding that not doing such IPI flushes could lead to
> >>> the pages tables being read by __page_fault_type being modified by a
> >>> third party, which could make them point to other mfns out of the
> >>> scope of the guest allowed physical memory addresses. However those
> >>> accesses would be limited to __page_fault_type, and hence the main
> >>> worry would be that a guest could make it point to read from a
> >>> physical memory region that has side effects?
> >>
> >> I don't think so, no - the memory could be changed such that the
> >> PTEs are invalid altogether (like having reserved bits set). Consider
> >> for example the case of reading an MFN out of such a PTE that's larger
> >> than the physical address width supported by the CPU. Afaict
> >> map_domain_page() will happily install a respective page table entry,
> >> but we'd get a reserved-bit #PF upon reading from that mapping.
> > 
> > So there are no hazards from executing __page_fault_type against a
> > page-table that could be modified by a user?
> 
> There are - I realize only now that the way I started my earlier
> reply was ambiguous. I meant to negate your "only with side effects"
> way of thinking.

Ack.

Thanks, Roger.

