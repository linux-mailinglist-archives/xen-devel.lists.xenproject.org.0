Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8202F2056F3
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 18:18:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnlbQ-0002xe-V9; Tue, 23 Jun 2020 16:16:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClC/=AE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jnlbP-0002xY-M3
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 16:16:51 +0000
X-Inumbo-ID: f19edfcc-b56c-11ea-bfa7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f19edfcc-b56c-11ea-bfa7-12813bfff9fa;
 Tue, 23 Jun 2020 16:16:50 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: h+kS0Md/dJ/O7jFwFjCqbFu92zkeLOY3Tdg1bcMcThuRkGf/ykPrACM+7IRmfMN7J+hx2kW+EK
 DsxtXDTTiit2RcYsHEPcI0CWGpMhEngebMwIZv92Ok6lOgtT71G/jNcpe2VrGhP+W5orsBm87X
 eyNG6MXuJvAvyJcYj/9hMqb+RWyG0oKqY5+sPD9YJ5EuggqaEMCYyOGledMnIW7wxh/WgDyuHM
 sgYcmLJ3UpQiVKwbnmu9oJGlnpuum/dYvOp5a7JITdUX0wX0oPJkNwvwJCcomaiQnJNc0NPmLL
 ymM=
X-SBRS: 2.7
X-MesageID: 21536931
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,271,1589256000"; d="scan'208";a="21536931"
Date: Tue, 23 Jun 2020 18:16:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.14 v2] x86/tlb: fix assisted flush usage
Message-ID: <20200623161607.GT735@Air-de-Roger>
References: <20200623145006.66723-1-roger.pau@citrix.com>
 <741ff589-4366-1430-6639-13dc5f02fdfa@xen.org>
 <20200623151542.GR735@Air-de-Roger>
 <a3e73ebe-44ee-31a7-05ee-dd115af3414f@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3e73ebe-44ee-31a7-05ee-dd115af3414f@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 23, 2020 at 04:46:29PM +0100, Julien Grall wrote:
> 
> 
> On 23/06/2020 16:15, Roger Pau Monné wrote:
> > On Tue, Jun 23, 2020 at 04:08:06PM +0100, Julien Grall wrote:
> > > Hi Roger,
> > > 
> > > On 23/06/2020 15:50, Roger Pau Monne wrote:
> > > > diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> > > > index 9b62087be1..f360166f00 100644
> > > > --- a/xen/include/xen/mm.h
> > > > +++ b/xen/include/xen/mm.h
> > > > @@ -639,7 +639,8 @@ static inline void accumulate_tlbflush(bool *need_tlbflush,
> > > >        }
> > > >    }
> > > > -static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
> > > > +static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp,
> > > > +                                           bool sync)
> > > 
> > > I read the commit message and went through the code, but it is still not
> > > clear what "sync" means in a non-architectural way.
> > > 
> > > As an Arm developper, I would assume this means we don't wait for the TLB
> > > flush to complete. But I am sure this would result to some unexpected
> > > behavior.
> > 
> > No, when we return from filtered_flush_tlb_mask the flush has been
> > performed (either with sync or without), but I understand the
> > confusion given the parameter name.
> > 
> > > So can you explain on non-x86 words what this really mean?
> > 
> > sync (in this context) means to force the usage of an IPI (if built
> > with PV or shadow paging support) in order to perform the flush.
> 
> This is compare to?

Using assisted flushes, like you do on Arm, where you don't send an
IPI in order to achieve a TLB flush on a remote pCPU.

> > AFAICT on Arm you always avoid an IPI when performing a flush, and
> > that's fine because you don't have PV or shadow, and then you don't
> > require this.
> 
> Arm provides instructions to broadcast TLB flush, so by the time one of
> instruction is completed there is all the TLB entry associated to the
> translation doesn't exist.
> 
> I don't think using PV or shadow would change anything here in the way we do
> the flush.

TBH, I'm not sure how this applies to Arm. There's no PV or shadow
implementation, so I have no idea whether this would apply or not.

> > Also I'm not sure Arm has the concept of a spurious
> > page fault.
> 
> So if I understand correctly, the HW may raise a fault even if the mapping
> was in the page-tables. Is it correct?

Yes, this can happen when you promote the permission of a page table
entry without doing a TLB flush AFAICT. Ie: you have a read-only page,
which is promoted to writable, but you don't perform a TLB flush and
just rely on getting a page fault that will clear the TLB entry and
retry.

> We have a spurious page fault handler for stage-2 (aka EPT on x86) as we
> need to have an invalid mapping to transition for certain page-tables update
> (e.g. superpage shattering). We are using the same rwlock with the page
> fault handler and the page-table update, so there is no way the two can run
> concurrently.

This is slightly different as it's used by PV page tables, so the
fault is triggered much more often than the fault handler you are
referring to IMO.

> > 
> > I could rename to force_ipi (or require_ipi) if that's better?
> 
> Hmmm, based on what I wrote above, I don't think this name would be more
> suitable. However, regardless the name, it is not clear to me when a caller
> should use false or true.
> 
> Have you considered a rwlock to synchronize the two?

Yes, the performance drop is huge when I tried. I could try to refine,
but I think there's always going to be a performance drop, as you then
require mutual exclusion when modifying the page tables (you take the
lock in write mode). Right now modification of the page tables can be
done concurrently.

FWIW Xen explicitly moved from using a lock into this model in
3203345bb13 apparently due to some deadlock situation. I'm not sure
if that still holds.

Roger.

