Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B7AB4674C
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 01:45:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112841.1461006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uug70-0005vG-4x; Fri, 05 Sep 2025 23:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112841.1461006; Fri, 05 Sep 2025 23:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uug70-0005tB-1p; Fri, 05 Sep 2025 23:44:58 +0000
Received: by outflank-mailman (input) for mailman id 1112841;
 Fri, 05 Sep 2025 23:44:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uug6y-0005t5-3I
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 23:44:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uug6w-008AZj-2H;
 Fri, 05 Sep 2025 23:44:54 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uug6w-00069c-23;
 Fri, 05 Sep 2025 23:44:54 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=WqWhclai22VZ72GVJYlnH55sI1NxoxgfvAPmP7D1fSA=; b=
	SlSXs3Fx9uyNRPjHwJg5CywjB8hdGLaqe0YZTMTDurQpmC1LBGZKkmLgYe6WqWLQG1SbVDrufdy2w
	Lwu3eGiPTgykU4dp7u4ROUJtdrva9mCaWlCARQN4+9hym+O9YKcgr5QQiIXF1t8pMBp/l0OCJxGCp
	9XX5tq19REFyw6AzU=;
From: dmukhin@xen.org
Date: Fri, 5 Sep 2025 16:44:53 -0700
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v5 15/15] emul/ns16x50: implement IRQ emulation via
 vIOAPIC
Message-ID: <aLt19UfW2wIonyDK@kraken>
References: <20250828235409.2835815-1-dmukhin@ford.com>
 <20250828235409.2835815-16-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2508291508330.341243@ubuntu-linux-20-04-desktop>
 <aLtqIJbhqrGU8Pgc@kraken>
 <alpine.DEB.2.22.394.2509051557060.1405870@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2509051557060.1405870@ubuntu-linux-20-04-desktop>

On Fri, Sep 05, 2025 at 04:01:15PM -0700, Stefano Stabellini wrote:
> On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
> > On Fri, Aug 29, 2025 at 03:21:13PM -0700, Stefano Stabellini wrote:
> > > On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> > > > From: Denis Mukhin <dmukhin@ford.com> 
> > > > 
> > > > PVH domains use vIOAPIC, not vPIC and NS16550 emulates ISA IRQs which cannot
> > > > be asserted on vIOAPIC.
> > > 
> > > One option is to enable the vPIT for PVH domains when the NS16550
> > > emulator is enabled. Would that resolve the problem? That would be a
> > > simpler solution compared to adding IRQ_EMU because the IRQ_* logic is
> > > already quite complex.
> > 
> > vPIC? (PIT is timer).
> > 
> > I tried to enable vPIC for hwdom, but there's some more work to make it work
> > :-/
> > 
> > > 
> > > Alternatively...
> > [..]
> > > 
> > > > --- a/xen/arch/x86/hvm/vioapic.c
> > > > +++ b/xen/arch/x86/hvm/vioapic.c
> > > > @@ -177,6 +177,16 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, unsigned int trig,
> > > >  
> > > >      ASSERT(is_hardware_domain(currd));
> > > >  
> > > > +    /*
> > > > +     * Interrupt is claimed by one of the platform virtual devices (e.g.
> > > > +     * NS16550); do nothing.
> > > > +     */
> > > > +    write_lock(&currd->event_lock);
> > > > +    ret = domain_irq_to_emuirq(currd, gsi);
> > > > +    write_unlock(&currd->event_lock);
> > > > +    if ( ret != IRQ_UNBOUND )
> > > > +        return 0;
> > > 
> > > ..alternatively, we could have an add-hoc check here? Not very nice but
> > > at least it would be very simple.
> > > 
> > > In other words, adding vPIT is preferable in my opinion but as a second
> > > option I would consider an ad-hoc check. I would try to avoid adding
> > > IRQ_EMU -- that should be the last resort in my view.
> > 
> > In my opinion, IRQ_EMU falls into category of an ad-hoc.
> > 
> > I think vioapic_hwdom_map_gsi() should not depend on the presence of certain
> > virtual devices but rely on some global flag, e.g. via quering
> > domain_irq_to_emuirq() infra.
> 
> Hi Denis, the reason why IRQ_EMU is dangerous is that there are a bunch
> of checks emuirq != IRQ_PT and also emuirq != IRQ_MSI_EMU which I don't
> know if they would still behave correctly after the introduction of
> IRQ_EMU.

!= IRQ_PT checks (arch/x86/irq.c) are done from map_domain_emuirq_pirq()
and unmap_domain_pirq_emuirq() which I use for IRQ_EMU case.

Those checks are needed to correctly allocate an "ad-hoc flag" in a radix
"IRQ_EMU" tree, i.e. IRQ_EMU case is handled correctly.

!= IRQ_MSI_EMU check (there's only one in arch/x86/hvm/irq.c) is done from
hvm_inject_msi(), it guarantees that IRQ_EMU case is handled correctly.

> 
> I would prefer to avoid the problem if possible...

