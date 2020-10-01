Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7259327FC02
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 10:55:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123.3695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNuNI-0004q3-Qn; Thu, 01 Oct 2020 08:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123.3695; Thu, 01 Oct 2020 08:55:40 +0000
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
	id 1kNuNI-0004pe-N1; Thu, 01 Oct 2020 08:55:40 +0000
Received: by outflank-mailman (input) for mailman id 1123;
 Thu, 01 Oct 2020 08:55:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNuNH-0004pZ-9w
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 08:55:39 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f521877-3378-482c-acd8-d32c9151a533;
 Thu, 01 Oct 2020 08:55:37 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNuNH-0004pZ-9w
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 08:55:39 +0000
X-Inumbo-ID: 6f521877-3378-482c-acd8-d32c9151a533
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6f521877-3378-482c-acd8-d32c9151a533;
	Thu, 01 Oct 2020 08:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601542537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fZ/6nqIlBBmYIEPpFga4/sXEDw1y/kPBr/n5agM7Ykk=;
  b=IDPFRsEwv+J8TofM+1ydJB/+U8IcxQ0YnX/Qklbqp0n5zbEfj87Rofg1
   yc3gX3heNqhh9bJZURsQxow++dg80GTduvngOWo4SdFQNfHW+fmwbFxZ0
   deUY8Ek6tjhJNLAkr0WhTAJkrZKpnCsjjxQ/zH12DnyZuhxNnDi/Iokv3
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: e86dpylu3t/sVz9OJy1J0l5XeXK90IxnIms7ObHsXNdgR6p9tTrAQMXIboMTdx5R9otPraU40X
 A/a1y7jv6dhk1DRz09jNWsBSknrvm24RXsTsD91Prie9iOjcfEhSeqhZaDpoCb5LC8dXgMlhZA
 N+LNIgT6JSIrrUvUJepAlpzWFAnKSwfzscE39MOwaSKgsrWwg2QRpEVfsQjmC+DqRQXHO2/MAG
 AkUJglmqjHj2ucL9BpuqsVCOnOB0TramYYajzLGDytAQd07zJulogTsl89eI2vAFdG84BTRhbD
 KBk=
X-SBRS: None
X-MesageID: 28382312
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="28382312"
Date: Thu, 1 Oct 2020 10:55:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Rich Persaud
	<persaur@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: VirtIO & Argo: a Linux VirtIO transport driver on Xen
Message-ID: <20201001085500.GX19254@Air-de-Roger>
References: <CACMJ4GaWcF74zE5qt31MDvcX1mx1HSW7eaOXpfpWJ2KzQZOg=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACMJ4GaWcF74zE5qt31MDvcX1mx1HSW7eaOXpfpWJ2KzQZOg=Q@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Sep 30, 2020 at 09:03:03PM -0700, Christopher Clark wrote:
> Hello
> 
> Following up on a topic introduced in last month's community call,
> here are some notes on combining existing Linux guest virtio drivers
> with Argo inter-VM communication on Xen.  If feasible, this would
> combine the compatibility of tested Linux drivers with the mandatory
> access control properties of Argo, which could help meet functional
> safety and security requirements for Xen on Arm and x86.  This
> development work is not resourced, but the initial investigation has
> been encouraging.  We are sharing here for comment, aiming to work
> with those in the Xen and wider Linux communities who may have similar
> requirements.
> 
> Christopher
> - 30th September 2020
> 
> ---
> This document describes a proposal for development of a new Linux device
> driver to introduce Hypervisor-Mediated data eXchange (HMX) into the
> data transport of the popular VirtIO suite of Linux virtual device
> drivers, by using Argo with Xen. This will provide a way to use VirtIO
> device drivers within Xen guest VMs with strong isolation properties.
> 
> This work has been developed by Christopher Clark, Daniel Smith and Rich
> Persaud, with Eric Chanudet and Nick Krasnoff.
> Christopher is the primary author of this version of this document.
> 
> ----
> Contents:
> 
> = Context: Introduction to VirtIO
> == VirtIO Architecture Overview
> === VirtIO front-end driver classes
> === VirtIO transport drivers
> = VirtIO with Argo transport
> == Using VirtIO with the new Argo transport driver
> === Host platform software
> ==== QEMU
> ==== Linux Argo driver
> ==== Toolstack
> === Functionality
> === Mechanisms
> === From last discussion
> = References
> 
> ----
> = Context: Introduction to VirtIO
> 
> VirtIO is a virtual device driver standard developed originally for the
> Linux kernel, drawing upon the lessons learned during the development of
> paravirtualized device drivers for Xen, KVM and other hypervisors. It
> aimed to become a “de-facto standard for virtual I/O devices”, and to
> some extent has succeeded in doing so. VirtIO is now widely implemented
> in both software and hardware, it is commonly the first choice for
> virtual driver implementation in new virtualization technologies, and
> the specification is now maintained under governance of the OASIS open
> standards organization.
> 
> VirtIO’s system architecture abstracts device-specific and
> device-class-specific interfaces and functionality from the transport
> mechanisms that move data and issue notifications within the kernel and
> across virtual machine boundaries. It is attractive to developers
> seeking to implement new drivers for a virtual device because VirtIO
> provides documented specified interfaces with a well-designed, efficient
> and maintained common core implementation that can significantly reduce
> the amount of work required to develop a new virtual device driver.
> 
> VirtIO follows the Xen PV driver model of split-device drivers, where a
> front-end device driver runs within the guest virtual machine to provide
> the device abstraction to the guest kernel, and a back-end driver runs
> outside the VM, in platform-provided software - eg. within a QEMU device
> emulator - to communicate with the front-end driver and provide mediated
> access to physical device resources.
> 
> A critical property of the current common VirtIO implementations is that
> their use of shared memory for data transport prevents enforcement of
> strong isolation between the front-end and back-end virtual machines,
> since the back-end VirtIO device driver is required to be able to obtain
> direct access to the memory owned by the virtual machine running the
> front-end VirtIO device driver. ie. The VM hosting the back-end driver
> has significant privilege over any VM running a front-end driver.
> 
> Xen’s PV drivers use the grant-table mechanism to confine shared memory
> access to specific memory pages used and permission to access those are
> specifically granted by the driver in the VM that owns the memory. Argo
> goes further and achieves stronger isolation than this since it requires
> no memory sharing between communicating virtual machines.

Since there's no memory sharing, all data must be copied between
buffers (by the hypervisor I assume). Will this result in a noticeable
performance penalty?

OTOH no memory sharing means no need to map foreign memory on the
backend, which is costly.

> In contrast to Xen’s current driver transport options, the current
> implementations of VirtIO transports pass memory addresses directly
> across the VM boundary, under the assumption of shared memory access,
> and thereby require the back-end to have sufficient privilege to
> directly access any memory that the front-end driver refers to. This has
> presented a challenge for the suitability of using VirtIO drivers for
> Xen deployments where isolation is a requirement. Fortunately, a path
> exists for integration of the Argo transport into VirtIO which can
> address this and enable use of the existing body of VirtIO device
> drivers with isolation maintained and mandatory access control enforced:
> consequently this system architecture is significantly differentiated
> from other options for virtual devices.
> 
> == VirtIO Architecture Overview
> 
> In addition to the front-end / back-end split device driver model, there
> are further standard elements of VirtIO system architecture.
> 
> For detailed reference, VirtIO is described in detail in the “VirtIO 1.1
> specification” OASIS standards document. [1]
> 
> The front-end device driver architecture imposes tighter constraints on
> implementation direction for this project, since it is this that is
> already implemented in the wide body of existing VirtIO device drivers
> that we are aiming to enable use of.
> 
> The back-end software is implemented in the platform-provided software -
> ie.  the hypervisor, toolstack, a platform-provided VM or a device
> emulator, etc. - where we have more flexibility in implementation
> options, and the interface is determined by both the host virtualization
> platform and the new transport driver that we are intending to create.
> 
> === VirtIO front-end driver classes
> 
> There are multiple classes of VirtIO device driver within the Linux
> kernel; these include the general class of front-end VirtIO device
> drivers, which provide function-specific logic to implement virtual
> devices - eg. a virtual block device driver for storage - and the
> _transport_ VirtIO device drivers, which are responsible for device
> discovery with the platform and provision of data transport across the
> VM boundary between the front-end drivers and the corresponding remote
> back-end driver running outside the virtual machine.
> 
> === VirtIO transport drivers
> 
> There are several implementations of VirtIO transport device drivers in
> Linux, each implement a common interface within the kernel, and they are
> designed to be interchangeable and compatible with the VirtIO front-end
> drivers: so the same front-end driver can use different transports on
> different systems. Transports can coexist: different virtual devices can
> be using different transports within the same virtual machine at the
> same time.

Does this transport layer also define how the device configuration is
exposed?

> 
> = VirtIO with Argo transport
> 
> Enabling VirtIO to use the Argo interdomain communication mechanism for
> data transport across the VM boundary will address critical requirements:
> 
> * Preserve strong isolation between the two ends of the split device driver
> 
>     * ie. remove the need for any shared memory between domains or any
>       privilege to map the memory belonging to the other domain
> 
> * Enable enforcement of granular mandatory access control policy over
>   the communicating endpoints
> 
>     * ie. Use Xen’s XSM/Flask existing control over Argo communication,
>       and leverage any new Argo MAC capabilities as they are introduced
>       to govern VirtIO devices
> 
> The proposal is to implement a new VirtIO transport driver for Linux
> that utilizes Argo. It will be used within guest virtual machines, and
> be source-compatible with the existing VirtIO front-end device drivers
> in Linux.
> 
> It will be paired with a corresponding new VirtIO-Argo back-end to run
> within the Qemu device emulator, in the same fashion as the existing
> VirtIO transport back-ends, and the back-end will use a non-VirtIO Linux
> driver to access and utilize Argo.

IMO it would be better if we could implement the backends in a more
lightweight tool, something like kvmtool.

> Open Source VirtIO drivers for Windows are available, and enable Windows
> guest VMs to run with virtual devices provided by the VirtIO backends in
> QEMU. The Windows VirtIO device drivers have the same transport
> abstraction and separate driver structure, so an Argo transport driver
> can also be developed for Windows for source-compatibility with Windows
> VirtIO device drivers.
> 
> == Using VirtIO with the new Argo transport driver
> 
> VirtIO device drivers are included in the mainline Linux kernel and
> enabled in most modern Linux distributions. Adding the new Linux-Argo
> guest driver to the upstream Linux kernel will enable seamless
> deployment of modern Linux guest VMs on VirtIO-Argo hypervisor
> platforms.
> 
> === Host platform software
> 
> ==== QEMU
> 
> The QEMU device emulator implements the VirtIO transport that the
> front-end will connect to. Current QEMU 5.0 implements both the
> virtio-pci and virtio-mmio common transports.

Oh, I think that answers my question from above, and you would indeed
expose the device configuration using an Argo specific virtio device
bus.

Would it be possible to expose the device configuration using
virtio-{pci,mmio} but do the data transfer using Argo?

> 
> ==== Linux Argo driver
> 
> For QEMU to be able to use Argo, it will need an Argo Linux kernel
> device driver, with similar functionality to the existing Argo Linux
> driver.
> 
> ==== Toolstack
> 
> The toolstack of the hypervisor is responsible for configuring and
> establishing the back-end devices according to the virtual machine
> configuration. It will need to be aware of the VirtIO-Argo transport and
> initialize the back-ends for each VM with a suitable configuration for
> it.
> 
> Alternatively, in systems that do not run with a toolstack, the DomB
> launch domain (when available) can perform any necessary initialization.
> 
> === Functionality
> 
> Adding Argo as a transport for VirtIO will retain Argo’s MAC policy
> checks on all data movement, via Xen's XSM/Flask, while allowing use of
> the VirtIO virtual device drivers and device implementations.
> 
> With the VirtIO virtual device drivers using the VirtIO-Argo transport
> driver, the existing Xen PV drivers, which use the grant tables and
> event channels, are not required, and their substitution enables removal
> of shared memory from the data path of the device drivers in use and
> makes the virtual device driver data path HMX-compliant.
> 
> In addition, as new virtual device classes in Linux have VirtIO drivers
> implemented, these should transparently be enabled with Mandatory Access
> Control, via the existing virtio-argo transport driver, potentially
> without further effort required – although please note that for some
> cases (eg. graphics) optimizing performance characteristics may require
> additional effort.
> 
> === Mechanisms
> 
> VirtIO transport drivers are responsible for virtual device enumeration,
> triggering driver initialization for the devices, and we are proposing
> to use ACPI tables to surface the data to the guest for the new driver
> to parse for this purpose. Device tree has been raised as an option for
> this on Arm and it will be evaluated.
> 
> The VirtIO device drivers will retain use of the virtqueues, but the
> descriptors passed between domains by the new transport driver will not
> include guest physical addresses, but instead reference data that has
> been exchanged via Argo. Each transmission via XEN_ARGO_OP_sendv is
> subject to MAC checks by XSM.
> 
> === From last discussion
> 
> * Design of how virtual devices are surfaced to the guest VM for
>   enumeration by the VirtIO-Argo transport driver
> 
>     * Current plan, from the initial x86 development focus, is to
>       populate ACPI tables

Do we plan to introduce a new ACPI table for virtio-argo devices? Or
are there plans to expand an existing table?

I'm asking because all this would need to be discussed with the UEFI
Forum in order to get whatever is needed into the spec (IIRC a
separate table is easier because the specification doesn't need to be
part of the official ACPI spec).

>     * Interest in using Device Tree, for static configurations on Arm,
>       was raised on last month's Xen Community Call.
>         * is being considered with development of DomB in progress
>     * Does not need to be dom0 that populates this for the guest;
>       just some domain with suitable permissions to do so

Hm, while it's true that ACPI tables don't need to be populated by
dom0 itself, it must be a domain that has write access to the guest
memory, so that it can copy the created ACPI tables into the guest
physmap.

I think this is all fine, but seems like a very non-trivial amount of
work that depends on other entities (the UEFI Forum for ACPI changes
and OASIS for the virtio ones). It also worries me a bit that we are
jumping from not having virtio support at all on Xen to introducing
our own transport layer, but I guess that's partly due to the existing
virtio transports not being suitable for Xen use-cases.

Regarding the specific usage of Argo itself, it's my understanding
that a normal frontend would look like:

virtio front -> virtio argo transport -> Argo hypervisor specific driver

Would it be possible to implement an Argo interface that's hypervisor
agnostic? I think that way you would have a much easier time trying
to get something like this accepted upstream, if the underlying Argo
interface could be implemented by any hypervisor _without_ having to
add a new Argo hypervisor specific driver.

On x86 I guess you could implement the Argo interface using MSRs,
which would then allow any hypervisor to provide the same interface
and thus there would be no component tied to Xen or any specific
hypervisor.

Finally, has this been raised or commented with OASIS? I'm at least not
familiar at all with virtio, and I bet that applies to most of the Xen
community, so I think their opinion is likely even more important that
the Xen community one.

Thanks, Roger.

