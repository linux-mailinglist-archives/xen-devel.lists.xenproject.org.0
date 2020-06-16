Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7291FAB62
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 10:37:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl75k-0006G6-KX; Tue, 16 Jun 2020 08:37:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AL9H=75=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jl75j-0006G1-B7
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 08:37:11 +0000
X-Inumbo-ID: 91cb8e08-afac-11ea-bb8b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91cb8e08-afac-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 08:37:10 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Z/ZNyfjJA3+IgJN2CawebcoSsjoGtrTZpcTMb2wqPHe2xP8XA+e1Wb+2tI/9jDr+f6beTRp1Cs
 CBrHl9BeRgeNCfKlp2Yv5XcrWBjx1hyxDzILugHx/qtvdtjRPG9551Cf2TogqPU1YXlEGggLTJ
 rcLvmA6fhfTc+YNq6kHHhjMRdJJNZTr6yjHouqwXqqFALzRvxZ5yR2rUJ5fvuiXHo4U/BGSWNf
 r/56Dco3WHHqELI1wCj/y+HdiwfVoqFNU6D0eEk8ClUMcDEP/bBOp30UYHb2CvhPbch/mZl/Tz
 Aqs=
X-SBRS: 2.7
X-MesageID: 20481905
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20481905"
Date: Tue, 16 Jun 2020 10:37:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a flag for
 GSIs not requiring an EOI or unmask
Message-ID: <20200616083701.GL735@Air-de-Roger>
References: <20200610142923.9074-1-roger.pau@citrix.com>
 <20200610142923.9074-3-roger.pau@citrix.com>
 <1ccfdfdf-695e-00ce-7d49-401b1f4bb015@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1ccfdfdf-695e-00ce-7d49-401b1f4bb015@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 16, 2020 at 08:27:54AM +0200, Jan Beulich wrote:
> On 10.06.2020 16:29, Roger Pau Monne wrote:
> > @@ -558,6 +559,12 @@ int pt_irq_create_bind(
> >                       */
> >                      ASSERT(!mask);
> >                      share = trigger_mode;
> > +                    if ( trigger_mode == VIOAPIC_EDGE_TRIG )
> > +                        /*
> > +                         * Edge IO-APIC interrupt, no EOI or unmask to perform
> > +                         * and hence no timer needed.
> > +                         */
> > +                        pirq_dpci->flags |= HVM_IRQ_DPCI_NO_EOI;
> 
> Is this really limited to edge triggered IO-APIC interrupts?
> MSI ones are effectively edge triggered too, aren't they?

MSIs do sometimes require an EOI, depending on whether they can be
masked, see irq_acktype.

> Along the lines of irq_acktype() maskable MSI may then also
> not need any such arrangements? The pirq_guest_eoi() ->
> desc_guest_eoi() path looks to confirm this.

Yes, that's correct. AFAICT MSI interrupts won't get the EOI timer,
since pt_irq_need_timer will return false because the
HVM_IRQ_DPCI_GUEST_MSI flag will be set.

> > @@ -920,6 +923,8 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
> >          if ( pirq_dpci->flags & HVM_IRQ_DPCI_IDENTITY_GSI )
> >          {
> >              hvm_gsi_assert(d, pirq->pirq);
> > +            if ( pirq_dpci->flags & HVM_IRQ_DPCI_NO_EOI )
> > +                goto out;
> 
> Immediately ahead of this there's a similar piece of code
> dealing with PCI INTx. They're commonly level triggered, but
> I don't think there's a strict need for this to be the case.
> At least hvm_pci_intx_assert() -> assert_gsi() ->
> vioapic_irq_positive_edge() also cover the edge triggered one.

Hm, I'm not sure it's safe to passthrough edge triggered IO-APIC
interrupts, as Xen will mark those as 'shared' always, and sharing
edge interrupts cannot reliably work. In any case the EOI timer is
definitely set for those, and needs to be disabled before exiting
hvm_dirq_assist.

Thanks, Roger.

