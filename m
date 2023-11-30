Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8ED7FE6A9
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 03:28:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644346.1005186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Wmr-0000kr-Hx; Thu, 30 Nov 2023 02:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644346.1005186; Thu, 30 Nov 2023 02:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Wmr-0000ic-FL; Thu, 30 Nov 2023 02:28:21 +0000
Received: by outflank-mailman (input) for mailman id 644346;
 Thu, 30 Nov 2023 02:28:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8Wmq-0000iW-5B
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 02:28:20 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1df9bf1b-8f28-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 03:28:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B2CC4CE1FE7;
 Thu, 30 Nov 2023 02:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767D5C433C8;
 Thu, 30 Nov 2023 02:28:12 +0000 (UTC)
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
X-Inumbo-ID: 1df9bf1b-8f28-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701311294;
	bh=UNFRKaFGoIA6/UeK+gGsFIGWfqtOwxYbX3N2GxAZYIE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rYqriCY1E3gAtkU6kHucAQkaKjtOEZktVbS5024I/grGVIfcqkqgvko+lngAKG2bY
	 0Hq2y0EAy58R/v+xxZ+InG/CVs5cwmF6IOQBm+kWmqVK/l6ckyGNe2dRC9Kt2PG7dp
	 HFyLv3nJql6PrmTGmJ7nLAKREcp/dvcBKgf9jtHgIqHcJzPugyeP3UVrTE/twngREE
	 U5EAJGrGBtKixS6wP8q444JhV7dU4Ft1PlaUUzCallQhEeJhyHqGmHNqKltwHEeKJO
	 SX8kyXez3TI6SMAkqgOCDLBWPU2MbNt/xOJIN4TKfvtTxHsMYEZB/KiNtPQDnVKg3s
	 FK+fiYN4Xjfcw==
Date: Wed, 29 Nov 2023 18:28:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
In-Reply-To: <ZWb3XyxOCzXtiZhG@macbook>
Message-ID: <alpine.DEB.2.22.394.2311291823350.3533093@ubuntu-linux-20-04-desktop>
References: <8734x43zxi.fsf@epam.com> <alpine.DEB.2.22.394.2311171339010.773207@ubuntu-linux-20-04-desktop> <87edgo2f6j.fsf@epam.com> <alpine.DEB.2.22.394.2311171633190.773207@ubuntu-linux-20-04-desktop> <87ttpg0wdx.fsf@epam.com>
 <alpine.DEB.2.22.394.2311211712090.2053963@ubuntu-linux-20-04-desktop> <ZV3r1uc3av1wQu4W@macbook> <alpine.DEB.2.22.394.2311221306060.2053963@ubuntu-linux-20-04-desktop> <ZV8NhPohwTDWXOTk@macbook> <87a5qxtpb6.fsf@epam.com> <ZWb3XyxOCzXtiZhG@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-314476793-1701311293=:3533093"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-314476793-1701311293=:3533093
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 29 Nov 2023, Roger Pau Monné wrote:
> On Tue, Nov 28, 2023 at 11:45:34PM +0000, Volodymyr Babchuk wrote:
> > Hi Roger,
> > 
> > Roger Pau Monné <roger.pau@citrix.com> writes:
> > 
> > > On Wed, Nov 22, 2023 at 01:18:32PM -0800, Stefano Stabellini wrote:
> > >> On Wed, 22 Nov 2023, Roger Pau Monné wrote:
> > >> > On Tue, Nov 21, 2023 at 05:12:15PM -0800, Stefano Stabellini wrote:
> > >> > > Let me expand on this. Like I wrote above, I think it is important that
> > >> > > Xen vPCI is the only in-use PCI Root Complex emulator. If it makes the
> > >> > > QEMU implementation easier, it is OK if QEMU emulates an unneeded and
> > >> > > unused PCI Root Complex. From Xen point of view, it doesn't exist.
> > >> > > 
> > >> > > In terms if ioreq registration, QEMU calls
> > >> > > xendevicemodel_map_pcidev_to_ioreq_server for each PCI BDF it wants to
> > >> > > emulate. That way, Xen vPCI knows exactly what PCI config space
> > >> > > reads/writes to forward to QEMU.
> > >> > > 
> > >> > > Let's say that:
> > >> > > - 00:02.0 is PCI passthrough device
> > >> > > - 00:03.0 is a PCI emulated device
> > >> > > 
> > >> > > QEMU would register 00:03.0 and vPCI would know to forward anything
> > >> > > related to 00:03.0 to QEMU, but not 00:02.0.
> > >> > 
> > >> > I think there's some work here so that we have a proper hierarchy
> > >> > inside of Xen.  Right now both ioreq and vpci expect to decode the
> > >> > accesses to the PCI config space, and setup (MM)IO handlers to trap
> > >> > ECAM, see vpci_ecam_{read,write}().
> > >> > 
> > >> > I think we want to move to a model where vPCI doesn't setup MMIO traps
> > >> > itself, and instead relies on ioreq to do the decoding and forwarding
> > >> > of accesses.  We need some work in order to represent an internal
> > >> > ioreq handler, but that shouldn't be too complicated.  IOW: vpci
> > >> > should register devices it's handling with ioreq, much like QEMU does.
> > >> 
> > >> I think this could be a good idea.
> > >> 
> > >> This would be the very first IOREQ handler implemented in Xen itself,
> > >> rather than outside of Xen. Some code refactoring might be required,
> > >> which worries me given that vPCI is at v10 and has been pending for
> > >> years. I think it could make sense as a follow-up series, not v11.
> > >
> > > That's perfectly fine for me, most of the series here just deal with
> > > the logic to intercept guest access to the config space and is
> > > completely agnostic as to how the accesses are intercepted.
> > >
> > >> I think this idea would be beneficial if, in the example above, vPCI
> > >> doesn't really need to know about device 00:03.0. vPCI registers via
> > >> IOREQ the PCI Root Complex and device 00:02.0 only, QEMU registers
> > >> 00:03.0, and everything works. vPCI is not involved at all in PCI config
> > >> space reads and writes for 00:03.0. If this is the case, then moving
> > >> vPCI to IOREQ could be good.
> > >
> > > Given your description above, with the root complex implemented in
> > > vPCI, we would need to mandate vPCI together with ioreqs even if no
> > > passthrough devices are using vPCI itself (just for the emulation of
> > > the root complex).  Which is fine, just wanted to mention the
> > > dependency.
> > >
> > >> On the other hand if vPCI actually needs to know that 00:03.0 exists,
> > >> perhaps because it changes something in the PCI Root Complex emulation
> > >> or vPCI needs to take some action when PCI config space registers of
> > >> 00:03.0 are written to, then I think this model doesn't work well. If
> > >> this is the case, then I think it would be best to keep vPCI as MMIO
> > >> handler and let vPCI forward to IOREQ when appropriate.
> > >
> > > At first approximation I don't think we would have such interactions,
> > > otherwise the whole premise of ioreq being able to register individual
> > > PCI devices would be broken.
> > >
> > > XenSever already has scenarios with two different user-space emulators
> > > (ie: two different ioreq servers) handling accesses to different
> > > devices in the same PCI bus, and there's no interaction with the root
> > > complex required.

Good to hear

 
> > Out of curiosity: how legacy PCI interrupts are handled in this case? In
> > my understanding, it is Root Complex's responsibility to propagate
> > correct IRQ levels to an interrupt controller?
> 
> I'm unsure whether my understanding of the question is correct, so my
> reply might not be what you are asking for, sorry.
> 
> Legacy IRQs (GSI on x86) are setup directly by the toolstack when the
> device is assigned to the guest, using PHYSDEVOP_map_pirq +
> XEN_DOMCTL_bind_pt_irq.  Those hypercalls bind together a host IO-APIC
> pin to a guest IO-APIC pin, so that interrupts originating from that
> host IO-APIC pin are always forwarded to the guest an injected as
> originating from the guest IO-APIC pin.
> 
> Note that the device will always use the same IO-APIC pin, this is not
> configured by the OS.

QEMU calls xen_set_pci_intx_level which is implemented by
xendevicemodel_set_pci_intx_level, which is XEN_DMOP_set_pci_intx_level,
which does set_pci_intx_level. Eventually it calls hvm_pci_intx_assert
and hvm_pci_intx_deassert.

I don't think any of this goes via the Root Complex otherwise, like
Roger pointed out, it wouldn't be possible to emulated individual PCI
devices in separate IOREQ servers.
--8323329-314476793-1701311293=:3533093--

