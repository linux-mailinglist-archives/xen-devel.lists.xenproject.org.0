Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27648209BF5
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 11:33:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joOG0-0000MB-7V; Thu, 25 Jun 2020 09:33:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTrP=AG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1joOFy-0000M6-O8
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 09:33:18 +0000
X-Inumbo-ID: e5a8ab66-b6c6-11ea-818c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5a8ab66-b6c6-11ea-818c-12813bfff9fa;
 Thu, 25 Jun 2020 09:33:16 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: z9KMsgTj9i2pS/wFcP+GLTq7gByjR0h799ge7osmNSL4vrk9VAuIy9lz7Or6qcqbNhdBnzCNFV
 iv3JOuBntz7hTpS3jUADoeclLRjkE5yNV2H4M2P4FMOYzdKKep0ZkulUgdJzpifdxBll1vwQcK
 iQOlkQ8W3gNIKQQj5JHHmbGg66EHE8DQecENTH+TVO/OIY8wlXKuGPQWUiRR4ovCbCzQkSli4d
 xLhPhli1wUKlxCbHrflluKfOzuYJVEYo+E54Dko2wfugKh590wywbuxqdslanf+fHPYtTqMAP+
 35E=
X-SBRS: 2.7
X-MesageID: 20911906
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,278,1589256000"; d="scan'208";a="20911906"
Date: Thu, 25 Jun 2020 11:33:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.14 v2] x86/tlb: fix assisted flush usage
Message-ID: <20200625093309.GX735@Air-de-Roger>
References: <20200623145006.66723-1-roger.pau@citrix.com>
 <741ff589-4366-1430-6639-13dc5f02fdfa@xen.org>
 <20200623151542.GR735@Air-de-Roger>
 <a3e73ebe-44ee-31a7-05ee-dd115af3414f@xen.org>
 <20200623161607.GT735@Air-de-Roger>
 <d148e407-6c7f-92ee-2abd-1d06560dca08@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d148e407-6c7f-92ee-2abd-1d06560dca08@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 24, 2020 at 12:10:45PM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 23/06/2020 17:16, Roger Pau Monné wrote:
> > On Tue, Jun 23, 2020 at 04:46:29PM +0100, Julien Grall wrote:
> > > 
> > > 
> > > On 23/06/2020 16:15, Roger Pau Monné wrote:
> > > > On Tue, Jun 23, 2020 at 04:08:06PM +0100, Julien Grall wrote:
> > > > > Hi Roger,
> > > > > 
> > > > > On 23/06/2020 15:50, Roger Pau Monne wrote:
> > > > > > diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> > > > > > index 9b62087be1..f360166f00 100644
> > > > > > --- a/xen/include/xen/mm.h
> > > > > > +++ b/xen/include/xen/mm.h
> > > > > > @@ -639,7 +639,8 @@ static inline void accumulate_tlbflush(bool *need_tlbflush,
> > > > > >         }
> > > > > >     }
> > > > > > -static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
> > > > > > +static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp,
> > > > > > +                                           bool sync)
> > > > > 
> > > > > I read the commit message and went through the code, but it is still not
> > > > > clear what "sync" means in a non-architectural way.
> > > > > 
> > > > > As an Arm developper, I would assume this means we don't wait for the TLB
> > > > > flush to complete. But I am sure this would result to some unexpected
> > > > > behavior.
> > > > 
> > > > No, when we return from filtered_flush_tlb_mask the flush has been
> > > > performed (either with sync or without), but I understand the
> > > > confusion given the parameter name.
> > > > 
> > > > > So can you explain on non-x86 words what this really mean?
> > > > 
> > > > sync (in this context) means to force the usage of an IPI (if built
> > > > with PV or shadow paging support) in order to perform the flush.
> > > 
> > > This is compare to?
> > 
> > Using assisted flushes, like you do on Arm, where you don't send an
> > IPI in order to achieve a TLB flush on a remote pCPU.
> 
> AFAICT, the assisted flushes only happen when running a nested Xen. Is that
> correct?

ATM yes, we don't have support for the newly introduced AMD INVLPGB
instruction yet, which provides such functionality on bare metal.

> > 
> > > > AFAICT on Arm you always avoid an IPI when performing a flush, and
> > > > that's fine because you don't have PV or shadow, and then you don't
> > > > require this.
> > > 
> > > Arm provides instructions to broadcast TLB flush, so by the time one of
> > > instruction is completed there is all the TLB entry associated to the
> > > translation doesn't exist.
> > > 
> > > I don't think using PV or shadow would change anything here in the way we do
> > > the flush.
> > 
> > TBH, I'm not sure how this applies to Arm. There's no PV or shadow
> > implementation, so I have no idea whether this would apply or not.
> 
> Yes there is none. However, my point was that if we had to implement
> PV/shadow on Arm then an IPI would definitely be my last choice.

Right, this mostly depends on how you perform page table modifications
and whether you have to handle spurious faults like x86 does.

> > > > 
> > > > I could rename to force_ipi (or require_ipi) if that's better?
> > > 
> > > Hmmm, based on what I wrote above, I don't think this name would be more
> > > suitable. However, regardless the name, it is not clear to me when a caller
> > > should use false or true.
> > > 
> > > Have you considered a rwlock to synchronize the two?
> > 
> > Yes, the performance drop is huge when I tried. I could try to refine,
> > but I think there's always going to be a performance drop, as you then
> > require mutual exclusion when modifying the page tables (you take the
> > lock in write mode). Right now modification of the page tables can be
> > done concurrently.
> 
> Fair enough. I will scratch that suggestion then. Thanks for the
> explanation!
> 
> So now getting back to filtered_flush_tlb(). AFAICT, the only two callers
> are in common code. The two are used for allocation purpose, so may I ask
> why they need to use different kind of flush?

Looking at it again, this is wrong. I've just realized that
populate_physmap will, depending on the situation, use the
MEMF_no_tlbflush flag, and so it needs to perform the flush by itself
(and that's why filtered_flush_tlb_mask is used).

I guess you will be fine with removing the sync parameter then, and on
x86 force filtered_flush_tlb_mask to always use physical IPIs in
order to perform the flush?

Thanks, Roger.

