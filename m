Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BBA7F3B13
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 02:13:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638340.994806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5bn8-0003M2-N9; Wed, 22 Nov 2023 01:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638340.994806; Wed, 22 Nov 2023 01:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5bn8-0003JB-K1; Wed, 22 Nov 2023 01:12:34 +0000
Received: by outflank-mailman (input) for mailman id 638340;
 Wed, 22 Nov 2023 01:12:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5bn7-0003J5-CY
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 01:12:33 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 342ab051-88d4-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 02:12:30 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 642B0CE1E91;
 Wed, 22 Nov 2023 01:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A4FC433C7;
 Wed, 22 Nov 2023 01:12:25 +0000 (UTC)
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
X-Inumbo-ID: 342ab051-88d4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700615546;
	bh=+BROR+QS3r0GPbPxzNB/D/UwRDl6uwVB9j+aJRysZfw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oDQYwYWOBfI5PzGsfYOCt6i3whjYbByt4ACej2bu0ztwfYQ7WgaQtmBzADF5UXG59
	 U5luAa+TdO3TnVSZH6hvWbrxFUNPNuFE3GXn1ZtCcgbCBSAg+EqFZiBUJGAxFv1hfs
	 3a3fOn1jXPCNLH+zTv6eOnNV6F203HOiXODZZr04QAUqYrfBsb/ZQ9gqCv0ysSYrDr
	 mjDXXZAEqWqHZg6fL2my09ieNXPkrH3dZmVoD7vC5qX91Nq9fAHqvWrzJN+ABAg8vN
	 oRjNeFHSCnG+v20pC3qwbKWlc1YRFijMCiptPgC9B5tXwg3qedq7CkYfI1FxSdWZSo
	 2Ri7vAtJEMx6A==
Date: Tue, 21 Nov 2023 17:12:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
In-Reply-To: <87ttpg0wdx.fsf@epam.com>
Message-ID: <alpine.DEB.2.22.394.2311211712090.2053963@ubuntu-linux-20-04-desktop>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com> <20231012220854.2736994-14-volodymyr_babchuk@epam.com> <d6a58e73-da51-40f1-a2f7-576274945585@xen.org> <alpine.DEB.2.22.394.2311161513210.773207@ubuntu-linux-20-04-desktop> <87o7ft44bv.fsf@epam.com>
 <alpine.DEB.2.22.394.2311161651090.773207@ubuntu-linux-20-04-desktop> <87a5rc4gk7.fsf@epam.com> <770aaef8-09f4-480a-95b8-cc0448ad07ff@xen.org> <8734x43zxi.fsf@epam.com> <alpine.DEB.2.22.394.2311171339010.773207@ubuntu-linux-20-04-desktop> <87edgo2f6j.fsf@epam.com>
 <alpine.DEB.2.22.394.2311171633190.773207@ubuntu-linux-20-04-desktop> <87ttpg0wdx.fsf@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Nov 2023, Volodymyr Babchuk wrote:
> Stefano Stabellini <sstabellini@kernel.org> writes:
> > On Fri, 17 Nov 2023, Volodymyr Babchuk wrote:
> >> > On Fri, 17 Nov 2023, Volodymyr Babchuk wrote:
> >> >> Hi Julien,
> >> >> 
> >> >> Julien Grall <julien@xen.org> writes:
> >> >> 
> >> >> > Hi Volodymyr,
> >> >> >
> >> >> > On 17/11/2023 14:09, Volodymyr Babchuk wrote:
> >> >> >> Hi Stefano,
> >> >> >> Stefano Stabellini <sstabellini@kernel.org> writes:
> >> >> >> 
> >> >> >>> On Fri, 17 Nov 2023, Volodymyr Babchuk wrote:
> >> >> >>>>> I still think, no matter the BDF allocation scheme, that we should try
> >> >> >>>>> to avoid as much as possible to have two different PCI Root Complex
> >> >> >>>>> emulators. Ideally we would have only one PCI Root Complex emulated by
> >> >> >>>>> Xen. Having 2 PCI Root Complexes both of them emulated by Xen would be
> >> >> >>>>> tolerable but not ideal.
> >> >> >>>>
> >> >> >>>> But what is exactly wrong with this setup?
> >> >> >>>
> >> >> >>> [...]
> >> >> >>>
> >> >> >>>>> The worst case I would like to avoid is to have
> >> >> >>>>> two PCI Root Complexes, one emulated by Xen and one emulated by QEMU.
> >> >> >>>>
> >> >> >>>> This is how our setup works right now.
> >> >> >>>
> >> >> >>> If we have:
> >> >> >>> - a single PCI Root Complex emulated in Xen
> >> >> >>> - Xen is safety certified
> >> >> >>> - individual Virtio devices emulated by QEMU with grants for memory
> >> >> >>>
> >> >> >>> We can go very far in terms of being able to use Virtio in safety
> >> >> >>> use-cases. We might even be able to use Virtio (frontends) in a SafeOS.
> >> >> >>>
> >> >> >>> On the other hand if we put an additional Root Complex in QEMU:
> >> >> >>> - we pay a price in terms of complexity of the codebase
> >> >> >>> - we pay a price in terms of resource utilization
> >> >> >>> - we have one additional problem in terms of using this setup with a
> >> >> >>>    SafeOS (one more device emulated by a non-safe component)
> >> >> >>>
> >> >> >>> Having 2 PCI Root Complexes both emulated in Xen is a middle ground
> >> >> >>> solution because:
> >> >> >>> - we still pay a price in terms of resource utilization
> >> >> >>> - the code complexity goes up a bit but hopefully not by much
> >> >> >>> - there is no impact on safety compared to the ideal scenario
> >> >> >>>
> >> >> >>> This is why I wrote that it is tolerable.
> >> >> >> Ah, I see now. Yes, I am agree with this. Also I want to add some
> >> >> >> more
> >> >> >> points:
> >> >> >> - There is ongoing work on implementing virtio backends as a
> >> >> >> separate
> >> >> >>    applications, written in Rust. Linaro are doing this part. Right now
> >> >> >>    they are implementing only virtio-mmio, but if they want to provide
> >> >> >>    virtio-pci as well, they will need a mechanism to plug only
> >> >> >>    virtio-pci, without Root Complex. This is argument for using single Root
> >> >> >>    Complex emulated in Xen.
> >> >> >> - As far as I know (actually, Oleksandr told this to me), QEMU has
> >> >> >> no
> >> >> >>    mechanism for exposing virtio-pci backends without exposing PCI root
> >> >> >>    complex as well. Architecturally, there should be a PCI bus to which
> >> >> >>    virtio-pci devices are connected. Or we need to make some changes to
> >> >> >>    QEMU internals to be able to create virtio-pci backends that are not
> >> >> >>    connected to any bus. Also, added benefit that PCI Root Complex
> >> >> >>    emulator in QEMU handles legacy PCI interrupts for us. This is
> >> >> >>    argument for separate Root Complex for QEMU.
> >> >> >> As right now we have only virtio-pci backends provided by QEMU and
> >> >> >> this
> >> >> >> setup is already working, I propose to stick to this
> >> >> >> solution. Especially, taking into account that it does not require any
> >> >> >> changes to hypervisor code.
> >> >> >
> >> >> > I am not against two hostbridge as a temporary solution as long as
> >> >> > this is not a one way door decision. I am not concerned about the
> >> >> > hypervisor itself, I am more concerned about the interface exposed by
> >> >> > the toolstack and QEMU.
> >> >
> >> > I agree with this...
> >> >
> >> >
> >> >> > To clarify, I don't particular want to have to maintain the two
> >> >> > hostbridges solution once we can use a single hostbridge. So we need
> >> >> > to be able to get rid of it without impacting the interface too much.
> >> >
> >> > ...and this
> >> >
> >> >
> >> >> This depends on virtio-pci backends availability. AFAIK, now only one
> >> >> option is to use QEMU and QEMU provides own host bridge. So if we want
> >> >> get rid of the second host bridge we need either another virtio-pci
> >> >> backend or we need to alter QEMU code so it can live without host
> >> >> bridge.
> >> >> 
> >> >> As for interfaces, it appears that QEMU case does not require any changes
> >> >> into hypervisor itself, it just boils down to writing couple of xenstore
> >> >> entries and spawning QEMU with correct command line arguments.
> >> >
> >> > One thing that Stewart wrote in his reply that is important: it doesn't
> >> > matter if QEMU thinks it is emulating a PCI Root Complex because that's
> >> > required from QEMU's point of view to emulate an individual PCI device.
> >> >
> >> > If we can arrange it so the QEMU PCI Root Complex is not registered
> >> > against Xen as part of the ioreq interface, then QEMU's emulated PCI
> >> > Root Complex is going to be left unused. I think that would be great
> >> > because we still have a clean QEMU-Xen-tools interface and the only
> >> > downside is some extra unused emulation in QEMU. It would be a
> >> > fantastic starting point.
> >> 
> >> I believe, that in this case we need to set manual ioreq handlers, like
> >> what was done in patch "xen/arm: Intercept vPCI config accesses and
> >> forward them to emulator", because we need to route ECAM accesses
> >> either to a virtio-pci backend or to a real PCI device. Also we need
> >> to tell QEMU to not install own ioreq handles for ECAM space.
> >
> > I was imagining that the interface would look like this: QEMU registers
> > a PCI BDF and Xen automatically starts forwarding to QEMU ECAM
> > reads/writes requests for the PCI config space of that BDF only. It
> > would not be the entire ECAM space but only individual PCI conf
> > reads/writes that the BDF only.
> >
> 
> Okay, I see that there is the
> xendevicemodel_map_pcidev_to_ioreq_server() function and corresponding
> IOREQ_TYPE_PCI_CONFIG call. Is this what you propose to use to register
> PCI BDF?

Yes, I think that's best.

Let me expand on this. Like I wrote above, I think it is important that
Xen vPCI is the only in-use PCI Root Complex emulator. If it makes the
QEMU implementation easier, it is OK if QEMU emulates an unneeded and
unused PCI Root Complex. From Xen point of view, it doesn't exist.

In terms if ioreq registration, QEMU calls
xendevicemodel_map_pcidev_to_ioreq_server for each PCI BDF it wants to
emulate. That way, Xen vPCI knows exactly what PCI config space
reads/writes to forward to QEMU.

Let's say that:
- 00:02.0 is PCI passthrough device
- 00:03.0 is a PCI emulated device

QEMU would register 00:03.0 and vPCI would know to forward anything
related to 00:03.0 to QEMU, but not 00:02.0.



> I see that xen-hvm-common.c in QEMU is able to handle only standard 256
> bytes configuration space, but I hope that it will be easy fix.

