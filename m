Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B2D1FAC60
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 11:29:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl7t5-0002M3-Mo; Tue, 16 Jun 2020 09:28:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AL9H=75=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jl7t3-0002Ly-SN
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 09:28:09 +0000
X-Inumbo-ID: b06d6910-afb3-11ea-bca7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b06d6910-afb3-11ea-bca7-bc764e2007e4;
 Tue, 16 Jun 2020 09:28:08 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: eQFrrBdh0PW+LPVbxsfcSClVVY4OOjPhWXHCbAhLQ7tiDzmnaxKnyqUBhJ+xuePfPBqRDPvWGW
 KjGF6DaZzfKkkvdkkwa67yC61itTkslCxiJrZGQBgfKEFUdcX2m33lsiXBAUAuQFQsyjaY4rw9
 G3FLvtwEft9eRqQnDMAc+5s6RSvtvUANh7Y2hNzIJ0nH349aEfXkfc3m/RINSUhRLc83VkwkZ7
 4rfqzNX7UY2Ld66fsjIdiTYGZRKVeltw0yMYauuVaOBKRrq4osGqyx+EsWSbjPCFkigjFA6TW/
 n9o=
X-SBRS: 2.7
X-MesageID: 20485486
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20485486"
Date: Tue, 16 Jun 2020 11:28:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a flag for
 GSIs not requiring an EOI or unmask
Message-ID: <20200616092800.GM735@Air-de-Roger>
References: <20200610142923.9074-1-roger.pau@citrix.com>
 <20200610142923.9074-3-roger.pau@citrix.com>
 <1ccfdfdf-695e-00ce-7d49-401b1f4bb015@suse.com>
 <20200616083701.GL735@Air-de-Roger>
 <f982b10e-360b-cd58-54ca-a0a527173891@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f982b10e-360b-cd58-54ca-a0a527173891@suse.com>
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

On Tue, Jun 16, 2020 at 10:45:51AM +0200, Jan Beulich wrote:
> On 16.06.2020 10:37, Roger Pau Monné wrote:
> > On Tue, Jun 16, 2020 at 08:27:54AM +0200, Jan Beulich wrote:
> >> On 10.06.2020 16:29, Roger Pau Monne wrote:
> >>> @@ -920,6 +923,8 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
> >>>          if ( pirq_dpci->flags & HVM_IRQ_DPCI_IDENTITY_GSI )
> >>>          {
> >>>              hvm_gsi_assert(d, pirq->pirq);
> >>> +            if ( pirq_dpci->flags & HVM_IRQ_DPCI_NO_EOI )
> >>> +                goto out;
> >>
> >> Immediately ahead of this there's a similar piece of code
> >> dealing with PCI INTx. They're commonly level triggered, but
> >> I don't think there's a strict need for this to be the case.
> >> At least hvm_pci_intx_assert() -> assert_gsi() ->
> >> vioapic_irq_positive_edge() also cover the edge triggered one.
> > 
> > Hm, I'm not sure it's safe to passthrough edge triggered IO-APIC
> > interrupts, as Xen will mark those as 'shared' always, and sharing
> > edge interrupts cannot reliably work. In any case the EOI timer is
> > definitely set for those, and needs to be disabled before exiting
> > hvm_dirq_assist.
> 
> That's the
> 
>                 if ( !is_hardware_domain(d) )
>                     share = BIND_PIRQ__WILL_SHARE;
> 
> in pt_irq_create_bind() aiui? I wonder why we have that ... At a
> guess it's to accommodate pciback in Dom0 also registering a handler.
> But wasn't it XenoLinux'es pciback only that does so, and upstream's
> doesn't?

I'm not that familiar with pciback in Linux. I've taken a look and
AFAICT modern Linux kernels will register a handler for the PCI
interrupts before doing a device reset and when dealing with PV guests
that use the pciif protocol (note that such IRQ is also
unconditionally marked as shared in Linux).

It might be safe for HVM domU passed through interrupts to set the
share bit based on the triggering mode.

Roger.

