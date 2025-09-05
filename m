Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FE2B466DF
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 00:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112571.1460778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufK7-00048k-FP; Fri, 05 Sep 2025 22:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112571.1460778; Fri, 05 Sep 2025 22:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufK7-00045i-Cd; Fri, 05 Sep 2025 22:54:27 +0000
Received: by outflank-mailman (input) for mailman id 1112571;
 Fri, 05 Sep 2025 22:54:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uufK6-00045c-HJ
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 22:54:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufK5-0089V3-0k;
 Fri, 05 Sep 2025 22:54:25 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufK5-0003on-0S;
 Fri, 05 Sep 2025 22:54:25 +0000
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
	:Subject:Cc:To:Date:From; bh=47ePpJhRuJW5EXdaEotAg4TP76Fryf9vbpsXrXvFJyw=; b=
	qM3Gz0bgJ56boc7l5smR5v+tg4hNTbXJk8x0mVWgHFsH/pOmt6oHCPl4/W2l5pCr1hWEBbmAolAX7
	c0T4TQrRloKhFnnZh7204LI2YA1l4f3ACF/fB2YWv7Fx7numZRTUnyU20Q/mbztKMjiSVHZFknU8H
	hScJM5vhfx65DPric=;
From: dmukhin@xen.org
Date: Fri, 5 Sep 2025 15:54:24 -0700
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v5 15/15] emul/ns16x50: implement IRQ emulation via
 vIOAPIC
Message-ID: <aLtqIJbhqrGU8Pgc@kraken>
References: <20250828235409.2835815-1-dmukhin@ford.com>
 <20250828235409.2835815-16-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2508291508330.341243@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2508291508330.341243@ubuntu-linux-20-04-desktop>

On Fri, Aug 29, 2025 at 03:21:13PM -0700, Stefano Stabellini wrote:
> On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > PVH domains use vIOAPIC, not vPIC and NS16550 emulates ISA IRQs which cannot
> > be asserted on vIOAPIC.
> 
> One option is to enable the vPIT for PVH domains when the NS16550
> emulator is enabled. Would that resolve the problem? That would be a
> simpler solution compared to adding IRQ_EMU because the IRQ_* logic is
> already quite complex.

vPIC? (PIT is timer).

I tried to enable vPIC for hwdom, but there's some more work to make it work
:-/

> 
> Alternatively...
[..]
> 
> > --- a/xen/arch/x86/hvm/vioapic.c
> > +++ b/xen/arch/x86/hvm/vioapic.c
> > @@ -177,6 +177,16 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, unsigned int trig,
> >  
> >      ASSERT(is_hardware_domain(currd));
> >  
> > +    /*
> > +     * Interrupt is claimed by one of the platform virtual devices (e.g.
> > +     * NS16550); do nothing.
> > +     */
> > +    write_lock(&currd->event_lock);
> > +    ret = domain_irq_to_emuirq(currd, gsi);
> > +    write_unlock(&currd->event_lock);
> > +    if ( ret != IRQ_UNBOUND )
> > +        return 0;
> 
> ..alternatively, we could have an add-hoc check here? Not very nice but
> at least it would be very simple.
> 
> In other words, adding vPIT is preferable in my opinion but as a second
> option I would consider an ad-hoc check. I would try to avoid adding
> IRQ_EMU -- that should be the last resort in my view.

In my opinion, IRQ_EMU falls into category of an ad-hoc.

I think vioapic_hwdom_map_gsi() should not depend on the presence of certain
virtual devices but rely on some global flag, e.g. via quering
domain_irq_to_emuirq() infra.

