Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 169797F5275
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 22:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639170.996170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ucM-0000K5-Hn; Wed, 22 Nov 2023 21:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639170.996170; Wed, 22 Nov 2023 21:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ucM-0000Gv-ED; Wed, 22 Nov 2023 21:18:42 +0000
Received: by outflank-mailman (input) for mailman id 639170;
 Wed, 22 Nov 2023 21:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5ucK-0000CD-C0
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 21:18:40 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2f6000a-897c-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 22:18:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D6A35B829A4;
 Wed, 22 Nov 2023 21:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D525CC433C7;
 Wed, 22 Nov 2023 21:18:33 +0000 (UTC)
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
X-Inumbo-ID: b2f6000a-897c-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700687915;
	bh=EewVR80HMkkioeqsh2flkjPAQSyl9mvD4SiueovGads=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZSETPo+5ya2Nl+LF6MRenfRdH3VBCzCRRx7w3acVcUGEl9tUIo+gZRKMttj5Z4boT
	 813NDJeUSLTLYmCwNtJtwDmHxzaWTWN4h84AdBm1et56xEOEfltxLSHirIh/SCyEGi
	 WVY7sFpConU+7fivxDoHjrsHzi/FCtSVq+NcjEwhjGfW7z/bH/0oNUM/n9/bQlKw9s
	 o+RUDxMw9d42PQMop/Uc/1x9Ftu9bDRcKLpEFZK+fQD6ARvAmo7jyCBIxvPz+PW64D
	 P4Xf3td2WZstLcoSMZtn6pYNU6TYSyXJbeX3Kts98aZRlANyjfemD8j6ZM7rUuRIdQ
	 X1Je/y1AbVxAQ==
Date: Wed, 22 Nov 2023 13:18:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <julien@xen.org>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
In-Reply-To: <ZV3r1uc3av1wQu4W@macbook>
Message-ID: <alpine.DEB.2.22.394.2311221306060.2053963@ubuntu-linux-20-04-desktop>
References: <87o7ft44bv.fsf@epam.com> <alpine.DEB.2.22.394.2311161651090.773207@ubuntu-linux-20-04-desktop> <87a5rc4gk7.fsf@epam.com> <770aaef8-09f4-480a-95b8-cc0448ad07ff@xen.org> <8734x43zxi.fsf@epam.com> <alpine.DEB.2.22.394.2311171339010.773207@ubuntu-linux-20-04-desktop>
 <87edgo2f6j.fsf@epam.com> <alpine.DEB.2.22.394.2311171633190.773207@ubuntu-linux-20-04-desktop> <87ttpg0wdx.fsf@epam.com> <alpine.DEB.2.22.394.2311211712090.2053963@ubuntu-linux-20-04-desktop> <ZV3r1uc3av1wQu4W@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1579814357-1700687241=:2053963"
Content-ID: <alpine.DEB.2.22.394.2311221307320.2053963@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1579814357-1700687241=:2053963
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2311221307321.2053963@ubuntu-linux-20-04-desktop>

On Wed, 22 Nov 2023, Roger Pau Monné wrote:
> On Tue, Nov 21, 2023 at 05:12:15PM -0800, Stefano Stabellini wrote:
> > On Tue, 20 Nov 2023, Volodymyr Babchuk wrote:
> > > Stefano Stabellini <sstabellini@kernel.org> writes:
> > > > On Fri, 17 Nov 2023, Volodymyr Babchuk wrote:
> > > >> > On Fri, 17 Nov 2023, Volodymyr Babchuk wrote:
> > > >> >> Hi Julien,
> > > >> >> 
> > > >> >> Julien Grall <julien@xen.org> writes:
> > > >> >> 
> > > >> >> > Hi Volodymyr,
> > > >> >> >
> > > >> >> > On 17/11/2023 14:09, Volodymyr Babchuk wrote:
> > > >> >> >> Hi Stefano,
> > > >> >> >> Stefano Stabellini <sstabellini@kernel.org> writes:
> > > >> >> >> 
> > > >> >> >>> On Fri, 17 Nov 2023, Volodymyr Babchuk wrote:
> > > >> >> >>>>> I still think, no matter the BDF allocation scheme, that we should try
> > > >> >> >>>>> to avoid as much as possible to have two different PCI Root Complex
> > > >> >> >>>>> emulators. Ideally we would have only one PCI Root Complex emulated by
> > > >> >> >>>>> Xen. Having 2 PCI Root Complexes both of them emulated by Xen would be
> > > >> >> >>>>> tolerable but not ideal.
> > > >> >> >>>>
> > > >> >> >>>> But what is exactly wrong with this setup?
> > > >> >> >>>
> > > >> >> >>> [...]
> > > >> >> >>>
> > > >> >> >>>>> The worst case I would like to avoid is to have
> > > >> >> >>>>> two PCI Root Complexes, one emulated by Xen and one emulated by QEMU.
> > > >> >> >>>>
> > > >> >> >>>> This is how our setup works right now.
> > > >> >> >>>
> > > >> >> >>> If we have:
> > > >> >> >>> - a single PCI Root Complex emulated in Xen
> > > >> >> >>> - Xen is safety certified
> > > >> >> >>> - individual Virtio devices emulated by QEMU with grants for memory
> > > >> >> >>>
> > > >> >> >>> We can go very far in terms of being able to use Virtio in safety
> > > >> >> >>> use-cases. We might even be able to use Virtio (frontends) in a SafeOS.
> > > >> >> >>>
> > > >> >> >>> On the other hand if we put an additional Root Complex in QEMU:
> > > >> >> >>> - we pay a price in terms of complexity of the codebase
> > > >> >> >>> - we pay a price in terms of resource utilization
> > > >> >> >>> - we have one additional problem in terms of using this setup with a
> > > >> >> >>>    SafeOS (one more device emulated by a non-safe component)
> > > >> >> >>>
> > > >> >> >>> Having 2 PCI Root Complexes both emulated in Xen is a middle ground
> > > >> >> >>> solution because:
> > > >> >> >>> - we still pay a price in terms of resource utilization
> > > >> >> >>> - the code complexity goes up a bit but hopefully not by much
> > > >> >> >>> - there is no impact on safety compared to the ideal scenario
> > > >> >> >>>
> > > >> >> >>> This is why I wrote that it is tolerable.
> > > >> >> >> Ah, I see now. Yes, I am agree with this. Also I want to add some
> > > >> >> >> more
> > > >> >> >> points:
> > > >> >> >> - There is ongoing work on implementing virtio backends as a
> > > >> >> >> separate
> > > >> >> >>    applications, written in Rust. Linaro are doing this part. Right now
> > > >> >> >>    they are implementing only virtio-mmio, but if they want to provide
> > > >> >> >>    virtio-pci as well, they will need a mechanism to plug only
> > > >> >> >>    virtio-pci, without Root Complex. This is argument for using single Root
> > > >> >> >>    Complex emulated in Xen.
> > > >> >> >> - As far as I know (actually, Oleksandr told this to me), QEMU has
> > > >> >> >> no
> > > >> >> >>    mechanism for exposing virtio-pci backends without exposing PCI root
> > > >> >> >>    complex as well. Architecturally, there should be a PCI bus to which
> > > >> >> >>    virtio-pci devices are connected. Or we need to make some changes to
> > > >> >> >>    QEMU internals to be able to create virtio-pci backends that are not
> > > >> >> >>    connected to any bus. Also, added benefit that PCI Root Complex
> > > >> >> >>    emulator in QEMU handles legacy PCI interrupts for us. This is
> > > >> >> >>    argument for separate Root Complex for QEMU.
> > > >> >> >> As right now we have only virtio-pci backends provided by QEMU and
> > > >> >> >> this
> > > >> >> >> setup is already working, I propose to stick to this
> > > >> >> >> solution. Especially, taking into account that it does not require any
> > > >> >> >> changes to hypervisor code.
> > > >> >> >
> > > >> >> > I am not against two hostbridge as a temporary solution as long as
> > > >> >> > this is not a one way door decision. I am not concerned about the
> > > >> >> > hypervisor itself, I am more concerned about the interface exposed by
> > > >> >> > the toolstack and QEMU.
> > > >> >
> > > >> > I agree with this...
> > > >> >
> > > >> >
> > > >> >> > To clarify, I don't particular want to have to maintain the two
> > > >> >> > hostbridges solution once we can use a single hostbridge. So we need
> > > >> >> > to be able to get rid of it without impacting the interface too much.
> > > >> >
> > > >> > ...and this
> > > >> >
> > > >> >
> > > >> >> This depends on virtio-pci backends availability. AFAIK, now only one
> > > >> >> option is to use QEMU and QEMU provides own host bridge. So if we want
> > > >> >> get rid of the second host bridge we need either another virtio-pci
> > > >> >> backend or we need to alter QEMU code so it can live without host
> > > >> >> bridge.
> > > >> >> 
> > > >> >> As for interfaces, it appears that QEMU case does not require any changes
> > > >> >> into hypervisor itself, it just boils down to writing couple of xenstore
> > > >> >> entries and spawning QEMU with correct command line arguments.
> > > >> >
> > > >> > One thing that Stewart wrote in his reply that is important: it doesn't
> > > >> > matter if QEMU thinks it is emulating a PCI Root Complex because that's
> > > >> > required from QEMU's point of view to emulate an individual PCI device.
> > > >> >
> > > >> > If we can arrange it so the QEMU PCI Root Complex is not registered
> > > >> > against Xen as part of the ioreq interface, then QEMU's emulated PCI
> > > >> > Root Complex is going to be left unused. I think that would be great
> > > >> > because we still have a clean QEMU-Xen-tools interface and the only
> > > >> > downside is some extra unused emulation in QEMU. It would be a
> > > >> > fantastic starting point.
> > > >> 
> > > >> I believe, that in this case we need to set manual ioreq handlers, like
> > > >> what was done in patch "xen/arm: Intercept vPCI config accesses and
> > > >> forward them to emulator", because we need to route ECAM accesses
> > > >> either to a virtio-pci backend or to a real PCI device. Also we need
> > > >> to tell QEMU to not install own ioreq handles for ECAM space.
> > > >
> > > > I was imagining that the interface would look like this: QEMU registers
> > > > a PCI BDF and Xen automatically starts forwarding to QEMU ECAM
> > > > reads/writes requests for the PCI config space of that BDF only. It
> > > > would not be the entire ECAM space but only individual PCI conf
> > > > reads/writes that the BDF only.
> > > >
> > > 
> > > Okay, I see that there is the
> > > xendevicemodel_map_pcidev_to_ioreq_server() function and corresponding
> > > IOREQ_TYPE_PCI_CONFIG call. Is this what you propose to use to register
> > > PCI BDF?
> > 
> > Yes, I think that's best.
> > 
> > Let me expand on this. Like I wrote above, I think it is important that
> > Xen vPCI is the only in-use PCI Root Complex emulator. If it makes the
> > QEMU implementation easier, it is OK if QEMU emulates an unneeded and
> > unused PCI Root Complex. From Xen point of view, it doesn't exist.
> > 
> > In terms if ioreq registration, QEMU calls
> > xendevicemodel_map_pcidev_to_ioreq_server for each PCI BDF it wants to
> > emulate. That way, Xen vPCI knows exactly what PCI config space
> > reads/writes to forward to QEMU.
> > 
> > Let's say that:
> > - 00:02.0 is PCI passthrough device
> > - 00:03.0 is a PCI emulated device
> > 
> > QEMU would register 00:03.0 and vPCI would know to forward anything
> > related to 00:03.0 to QEMU, but not 00:02.0.
> 
> I think there's some work here so that we have a proper hierarchy
> inside of Xen.  Right now both ioreq and vpci expect to decode the
> accesses to the PCI config space, and setup (MM)IO handlers to trap
> ECAM, see vpci_ecam_{read,write}().
> 
> I think we want to move to a model where vPCI doesn't setup MMIO traps
> itself, and instead relies on ioreq to do the decoding and forwarding
> of accesses.  We need some work in order to represent an internal
> ioreq handler, but that shouldn't be too complicated.  IOW: vpci
> should register devices it's handling with ioreq, much like QEMU does.

I think this could be a good idea.

This would be the very first IOREQ handler implemented in Xen itself,
rather than outside of Xen. Some code refactoring might be required,
which worries me given that vPCI is at v10 and has been pending for
years. I think it could make sense as a follow-up series, not v11.

I think this idea would be beneficial if, in the example above, vPCI
doesn't really need to know about device 00:03.0. vPCI registers via
IOREQ the PCI Root Complex and device 00:02.0 only, QEMU registers
00:03.0, and everything works. vPCI is not involved at all in PCI config
space reads and writes for 00:03.0. If this is the case, then moving
vPCI to IOREQ could be good.

On the other hand if vPCI actually needs to know that 00:03.0 exists,
perhaps because it changes something in the PCI Root Complex emulation
or vPCI needs to take some action when PCI config space registers of
00:03.0 are written to, then I think this model doesn't work well. If
this is the case, then I think it would be best to keep vPCI as MMIO
handler and let vPCI forward to IOREQ when appropriate.

I haven't run any experiements, but my gut feeling tells me that we'll
have to follow the second approach because the first is too limiting.
--8323329-1579814357-1700687241=:2053963--

