Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C832B9E86
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 00:39:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31452.61827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kftV6-00024q-GM; Thu, 19 Nov 2020 23:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31452.61827; Thu, 19 Nov 2020 23:38:04 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kftV6-00024Q-Bn; Thu, 19 Nov 2020 23:38:04 +0000
Received: by outflank-mailman (input) for mailman id 31452;
 Thu, 19 Nov 2020 23:38:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlxA=EZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kftV4-00024L-SG
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 23:38:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8b3310a-0b1b-4129-bcb7-866b2abf2369;
 Thu, 19 Nov 2020 23:38:01 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6101C208FE;
 Thu, 19 Nov 2020 23:38:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IlxA=EZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kftV4-00024L-SG
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 23:38:02 +0000
X-Inumbo-ID: e8b3310a-0b1b-4129-bcb7-866b2abf2369
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e8b3310a-0b1b-4129-bcb7-866b2abf2369;
	Thu, 19 Nov 2020 23:38:01 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6101C208FE;
	Thu, 19 Nov 2020 23:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605829081;
	bh=ZxS7x7R7bNzKe7y4mPvW/YBPlDsE4JAnLjfXtaOBjC8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p9jFgobEj00jE/nRl1vFjwUKu+Iq6Vo9WOWOFR17i6RwhHvOZTxBBJmNVRivUl51G
	 UadSYOGLRw5+3G30lzU7x/H7QN7138ZDDzuKQ6Tys0xgIlI4V3Y9PExDNdQdo4KTuG
	 ZnSVSmItONbdcj41y6V2KKew8rVBUAhZlqqayyIs=
Date: Thu, 19 Nov 2020 15:37:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
In-Reply-To: <89F35B3F-FAAD-4C58-B3FD-F93CA3290A49@arm.com>
Message-ID: <alpine.DEB.2.21.2011191534060.7979@sstabellini-ThinkPad-T480s>
References: <cover.1605527997.git.rahul.singh@arm.com> <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com> <3740e147-719a-4e97-bb0e-fe9bd2ec2aa5@xen.org> <aa256a44-8f8f-d4f1-f5f4-12529f45d8c8@suse.com> <9007e08f-6d90-88ed-ba64-2f0b3c21cb50@xen.org>
 <8531a99d-3c54-36c7-0cd4-2e4838f96eb0@suse.com> <ba26fdfb-34f8-c4d3-e082-f1f49c768981@xen.org> <89F35B3F-FAAD-4C58-B3FD-F93CA3290A49@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-941843809-1605828939=:7979"
Content-ID: <alpine.DEB.2.21.2011191536040.7979@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-941843809-1605828939=:7979
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2011191536041.7979@sstabellini-ThinkPad-T480s>

On Thu, 19 Nov 2020, Rahul Singh wrote:
> > On 19/11/2020 09:53, Jan Beulich wrote:
> >> On 19.11.2020 10:21, Julien Grall wrote:
> >>> Hi Jan,
> >>> 
> >>> On 19/11/2020 09:05, Jan Beulich wrote:
> >>>> On 18.11.2020 16:50, Julien Grall wrote:
> >>>>> On 16/11/2020 12:25, Rahul Singh wrote:
> >>>>>> NS16550 driver has PCI support that is under HAS_PCI flag. When HAS_PCI
> >>>>>> is enabled for ARM, compilation error is observed for ARM architecture
> >>>>>> because ARM platforms do not have full PCI support available.
> >>>>>   >
> >>>>>> Introducing new kconfig option CONFIG_HAS_NS16550_PCI to support
> >>>>>> ns16550 PCI for X86.
> >>>>>> 
> >>>>>> For X86 platforms it is enabled by default. For ARM platforms it is
> >>>>>> disabled by default, once we have proper support for NS16550 PCI for
> >>>>>> ARM we can enable it.
> >>>>>> 
> >>>>>> No functional change.
> >>>>> 
> >>>>> NIT: I would say "No functional change intended" to make clear this is
> >>>>> an expectation and hopefully will be correct :).
> >>>>> 
> >>>>> Regarding the commit message itself, I would suggest the following to
> >>>>> address Jan's concern:
> >>>> 
> >>>> While indeed this is a much better description, I continue to think
> >>>> that the proposed Kconfig option is undesirable to have.
> >>> 
> >>> I am yet to see an argument into why we should keep the PCI code
> >>> compiled on Arm when there will be no-use....
> >> Well, see my patch suppressing building of quite a part of it.
> > 
> > I will let Rahul figuring out whether your patch series is sufficient to fix compilation issues (this is what matters right now).
> 
> I just checked the compilation error for ARM after enabling the HAS_PCI on ARM. I am observing the same compilation error what I observed previously. 
> There are two new errors related to struct uart_config and struct part_param as those struct defined globally but used under X86 flags.
> 
> At top level:
> ns16550.c:179:48: error: ‘uart_config’ defined but not used [-Werror=unused-const-variable=]
>  static const struct ns16550_config __initconst uart_config[] =
>                                                 ^~~~~~~~~~~
> ns16550.c:104:54: error: ‘uart_param’ defined but not used [-Werror=unused-const-variable=]
>  static const struct ns16550_config_param __initconst uart_param[] = { 
> 
> 
> > 
> >>>> Either,
> >>>> following the patch I've just sent, truly x86-specific things (at
> >>>> least as far as current state goes - if any of this was to be
> >>>> re-used by a future port, suitable further abstraction may be
> >>>> needed) should be guarded by CONFIG_X86 (or abstracted into arch
> >>>> hooks), or the HAS_PCI_MSI proposal would at least want further
> >>>> investigating as to its feasibility to address the issues at hand.
> >>> 
> >>> I would be happy with CONFIG_X86, despite the fact that this is only
> >>> deferring the problem.
> >>> 
> >>> Regarding HAS_PCI_MSI, I don't really see the point of introducing given
> >>> that we are not going to use NS16550 PCI on Arm in the forseeable
> >>> future.
> >> And I continue to fail to see what would guarantee this: As soon
> >> as you can plug in such a card into an Arm system, people will
> >> want to be able use it. That's why we had to add support for it
> >> on x86, after all.
> > 
> > Well, plug-in PCI cards on Arm has been available for quite a while... Yet I haven't heard anyone asking for NS16550 PCI support.
> > 
> > This is probably because SBSA compliant server should always provide an SBSA UART (a cut-down version of the PL011). So why would bother to lose a PCI slot for yet another UART?
> > 
> >> >> So why do we need a finer graine Kconfig?
> >> Because most of the involved code is indeed MSI-related?
> > 
> > Possibly, yet it would not be necessary if we don't want NS16550 PCI support...
> 
> To fix compilation error on ARM as per the discussion there are below options please suggest which one to use to proceed further.
> 
> 1. Use the newly introduced CONFIG_HAS_NS16550_PCI config options. This helps also non-x86 architecture in the future not to have compilation error 
> what we are observing now when HAS_PCI is enabled.
> 
> 2. Guard the remaining x86 specific code with CONFIG_X86 and introduce the new CONFIG_HAS_PCI_MSI options to fix the MSI related compilation error. 
> Once we have proper support for MSI and PCI for ARM  (HAS_PCI_MSI and HAS_PCI enabled for ARM in Kconfig ) I am not sure if NS16550 PCI will work out of the box on ARM .In that case, we might need to come back again to fix NS16550 driver.  


It doesn't matter too much to me, let's just choose one option so that you
get unblocked soon.

It looks like Jan prefers option 2) and both Julien and I are OK with
it. So let's do 2). Jan, please confirm too :-)
--8323329-941843809-1605828939=:7979--

