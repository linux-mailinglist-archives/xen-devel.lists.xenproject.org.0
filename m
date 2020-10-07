Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7D9286A0D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 23:27:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3813.11383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQGwW-0002c7-Gr; Wed, 07 Oct 2020 21:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3813.11383; Wed, 07 Oct 2020 21:25:48 +0000
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
	id 1kQGwW-0002bi-DO; Wed, 07 Oct 2020 21:25:48 +0000
Received: by outflank-mailman (input) for mailman id 3813;
 Wed, 07 Oct 2020 21:25:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cKu2=DO=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1kQGwV-0002bd-CM
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 21:25:47 +0000
Received: from mail-oo1-xc43.google.com (unknown [2607:f8b0:4864:20::c43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13118245-8dd5-4776-83ea-040311671c39;
 Wed, 07 Oct 2020 21:25:45 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id h8so974936ooc.12
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 14:25:44 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cKu2=DO=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
	id 1kQGwV-0002bd-CM
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 21:25:47 +0000
X-Inumbo-ID: 13118245-8dd5-4776-83ea-040311671c39
Received: from mail-oo1-xc43.google.com (unknown [2607:f8b0:4864:20::c43])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 13118245-8dd5-4776-83ea-040311671c39;
	Wed, 07 Oct 2020 21:25:45 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id h8so974936ooc.12
        for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2020 14:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tfaWlfjOG5Lclvg6ocQl8VXO5607RWxeWJyy9KOesYM=;
        b=UZCOdHk95ZQx91wU3nK7gmYCdNcC6lev8R3ryBUOF1ll11oISKeDBAmLE4vseOxoXa
         kgsMQ5UZ2si62i6PGHAcl7LBDld7iC+WY7igINshWGEiWpHFu9662TtM0MI0lLt4rwCw
         u825cUPgTxmJUF4fcjQd1eku4MnY40QaWMCloupWJtYPyhLHqTIbRxf0qA6otj10mX9P
         1ANUn+wYIOq6E04EjqlEqJvyaHJV6mscxcWZGwyqMtSsrK3lIHhvtOQaSQmQ3J34QVEu
         6IGMNPRr4X558kBBgq3CI232D/xdeYNJq0XbM37il/OlhEUKWc2Fvav0motQ0ULaBGXE
         xrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tfaWlfjOG5Lclvg6ocQl8VXO5607RWxeWJyy9KOesYM=;
        b=KY0sUQM/U9+pNpyGraJCwrw9MA4WK+FDAX5L9SHKLHEiW1p+SWeNQcQNn1e9BDM6N0
         0YFWootpQ3309OX2W7CyFMzTvAcVCbuTULp56ujndT20pe4lKkGa6DurauE040wVLNiz
         Hb9/C9YvhYUXrgSWFQGTeyuTc27V4UvCFz1UyGeBDa3xnvdqsVTzPIAyUdhDDDM6B6X0
         SqghBdkpJcHAreUhUe1Y5jPxRBLbcdflBz7BaB15bTmbPZIrhcH9bFDZ0UxconvTpm70
         a4tA2NwWLDFosrlk2KtloC3tgL6eY3/ltYeWIsGV/l978APHoso4yo7L97v8bXVDfY/Y
         9p7Q==
X-Gm-Message-State: AOAM532wo1C1yTINhCztHQXsIePxd0T9XXlBXJBHNrOcxJ9B2cf/ADKb
	UFXt2yHKDzb2gGGnb6viKHa9Eg2rYgKrL+nucSI=
X-Google-Smtp-Source: ABdhPJy0+cnlxGAXo2GrThVlb2UBFEAsuPoTD0bxwjkTV5H/gt9N5TeBVaIkyqnuXTKJ0rszsfbs/GWKckyMybVMcNs=
X-Received: by 2002:a4a:ce90:: with SMTP id f16mr1863791oos.55.1602105943960;
 Wed, 07 Oct 2020 14:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <CACMJ4GaWcF74zE5qt31MDvcX1mx1HSW7eaOXpfpWJ2KzQZOg=Q@mail.gmail.com>
 <20201001085500.GX19254@Air-de-Roger>
In-Reply-To: <20201001085500.GX19254@Air-de-Roger>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 7 Oct 2020 14:25:27 -0700
Message-ID: <CACMJ4Ga3ygh=7o+rELAiJy2uZoMJqQUV9jQ4zQxvgZSuXzm5QA@mail.gmail.com>
Subject: Re: VirtIO & Argo: a Linux VirtIO transport driver on Xen
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Rich Persaud <persaur@gmail.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Roger: thanks for your interest and fast response to the first post in
this thread. Responses inline below.

On Thu, Oct 1, 2020 at 1:55 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>
> On Wed, Sep 30, 2020 at 09:03:03PM -0700, Christopher Clark wrote:
> > Hello
> >
> > Following up on a topic introduced in last month's community call,
> > here are some notes on combining existing Linux guest virtio drivers
> > with Argo inter-VM communication on Xen.  If feasible, this would
> > combine the compatibility of tested Linux drivers with the mandatory
> > access control properties of Argo, which could help meet functional
> > safety and security requirements for Xen on Arm and x86.  This
> > development work is not resourced, but the initial investigation has
> > been encouraging.  We are sharing here for comment, aiming to work
> > with those in the Xen and wider Linux communities who may have similar
> > requirements.
> >
> > Christopher
> > - 30th September 2020
> >
> > ---
> > This document describes a proposal for development of a new Linux devic=
e
> > driver to introduce Hypervisor-Mediated data eXchange (HMX) into the
> > data transport of the popular VirtIO suite of Linux virtual device
> > drivers, by using Argo with Xen. This will provide a way to use VirtIO
> > device drivers within Xen guest VMs with strong isolation properties.
> >
> > This work has been developed by Christopher Clark, Daniel Smith and Ric=
h
> > Persaud, with Eric Chanudet and Nick Krasnoff.
> > Christopher is the primary author of this version of this document.
> >
> > ----
> > Contents:
> >
> > =3D Context: Introduction to VirtIO
> > =3D=3D VirtIO Architecture Overview
> > =3D=3D=3D VirtIO front-end driver classes
> > =3D=3D=3D VirtIO transport drivers
> > =3D VirtIO with Argo transport
> > =3D=3D Using VirtIO with the new Argo transport driver
> > =3D=3D=3D Host platform software
> > =3D=3D=3D=3D QEMU
> > =3D=3D=3D=3D Linux Argo driver
> > =3D=3D=3D=3D Toolstack
> > =3D=3D=3D Functionality
> > =3D=3D=3D Mechanisms
> > =3D=3D=3D From last discussion
> > =3D References
> >
> > ----
> > =3D Context: Introduction to VirtIO
> >
> > VirtIO is a virtual device driver standard developed originally for the
> > Linux kernel, drawing upon the lessons learned during the development o=
f
> > paravirtualized device drivers for Xen, KVM and other hypervisors. It
> > aimed to become a =E2=80=9Cde-facto standard for virtual I/O devices=E2=
=80=9D, and to
> > some extent has succeeded in doing so. VirtIO is now widely implemented
> > in both software and hardware, it is commonly the first choice for
> > virtual driver implementation in new virtualization technologies, and
> > the specification is now maintained under governance of the OASIS open
> > standards organization.
> >
> > VirtIO=E2=80=99s system architecture abstracts device-specific and
> > device-class-specific interfaces and functionality from the transport
> > mechanisms that move data and issue notifications within the kernel and
> > across virtual machine boundaries. It is attractive to developers
> > seeking to implement new drivers for a virtual device because VirtIO
> > provides documented specified interfaces with a well-designed, efficien=
t
> > and maintained common core implementation that can significantly reduce
> > the amount of work required to develop a new virtual device driver.
> >
> > VirtIO follows the Xen PV driver model of split-device drivers, where a
> > front-end device driver runs within the guest virtual machine to provid=
e
> > the device abstraction to the guest kernel, and a back-end driver runs
> > outside the VM, in platform-provided software - eg. within a QEMU devic=
e
> > emulator - to communicate with the front-end driver and provide mediate=
d
> > access to physical device resources.
> >
> > A critical property of the current common VirtIO implementations is tha=
t
> > their use of shared memory for data transport prevents enforcement of
> > strong isolation between the front-end and back-end virtual machines,
> > since the back-end VirtIO device driver is required to be able to obtai=
n
> > direct access to the memory owned by the virtual machine running the
> > front-end VirtIO device driver. ie. The VM hosting the back-end driver
> > has significant privilege over any VM running a front-end driver.
> >
> > Xen=E2=80=99s PV drivers use the grant-table mechanism to confine share=
d memory
> > access to specific memory pages used and permission to access those are
> > specifically granted by the driver in the VM that owns the memory. Argo
> > goes further and achieves stronger isolation than this since it require=
s
> > no memory sharing between communicating virtual machines.
>
> Since there's no memory sharing, all data must be copied between
> buffers (by the hypervisor I assume). Will this result in a noticeable
> performance penalty?
>
> OTOH no memory sharing means no need to map foreign memory on the
> backend, which is costly.

This is a fair question. An important part of this work will be to
measure and determine what the performance will be; however, this
approach was not pursued in blind faith since the
formerly-Bromium-now-HP vSentry product has demonstrated network and
block devices working over v4v, a mechanism that is closely related to
Argo, with acceptable performance.

> > In contrast to Xen=E2=80=99s current driver transport options, the curr=
ent
> > implementations of VirtIO transports pass memory addresses directly
> > across the VM boundary, under the assumption of shared memory access,
> > and thereby require the back-end to have sufficient privilege to
> > directly access any memory that the front-end driver refers to. This ha=
s
> > presented a challenge for the suitability of using VirtIO drivers for
> > Xen deployments where isolation is a requirement. Fortunately, a path
> > exists for integration of the Argo transport into VirtIO which can
> > address this and enable use of the existing body of VirtIO device
> > drivers with isolation maintained and mandatory access control enforced=
:
> > consequently this system architecture is significantly differentiated
> > from other options for virtual devices.
> >
> > =3D=3D VirtIO Architecture Overview
> >
> > In addition to the front-end / back-end split device driver model, ther=
e
> > are further standard elements of VirtIO system architecture.
> >
> > For detailed reference, VirtIO is described in detail in the =E2=80=9CV=
irtIO 1.1
> > specification=E2=80=9D OASIS standards document. [1]
> >
> > The front-end device driver architecture imposes tighter constraints on
> > implementation direction for this project, since it is this that is
> > already implemented in the wide body of existing VirtIO device drivers
> > that we are aiming to enable use of.
> >
> > The back-end software is implemented in the platform-provided software =
-
> > ie.  the hypervisor, toolstack, a platform-provided VM or a device
> > emulator, etc. - where we have more flexibility in implementation
> > options, and the interface is determined by both the host virtualizatio=
n
> > platform and the new transport driver that we are intending to create.
> >
> > =3D=3D=3D VirtIO front-end driver classes
> >
> > There are multiple classes of VirtIO device driver within the Linux
> > kernel; these include the general class of front-end VirtIO device
> > drivers, which provide function-specific logic to implement virtual
> > devices - eg. a virtual block device driver for storage - and the
> > _transport_ VirtIO device drivers, which are responsible for device
> > discovery with the platform and provision of data transport across the
> > VM boundary between the front-end drivers and the corresponding remote
> > back-end driver running outside the virtual machine.
> >
> > =3D=3D=3D VirtIO transport drivers
> >
> > There are several implementations of VirtIO transport device drivers in
> > Linux, each implement a common interface within the kernel, and they ar=
e
> > designed to be interchangeable and compatible with the VirtIO front-end
> > drivers: so the same front-end driver can use different transports on
> > different systems. Transports can coexist: different virtual devices ca=
n
> > be using different transports within the same virtual machine at the
> > same time.
>
> Does this transport layer also define how the device configuration is
> exposed?

Yes, I think that it does.

>
> >
> > =3D VirtIO with Argo transport
> >
> > Enabling VirtIO to use the Argo interdomain communication mechanism for
> > data transport across the VM boundary will address critical requirement=
s:
> >
> > * Preserve strong isolation between the two ends of the split device dr=
iver
> >
> >     * ie. remove the need for any shared memory between domains or any
> >       privilege to map the memory belonging to the other domain
> >
> > * Enable enforcement of granular mandatory access control policy over
> >   the communicating endpoints
> >
> >     * ie. Use Xen=E2=80=99s XSM/Flask existing control over Argo commun=
ication,
> >       and leverage any new Argo MAC capabilities as they are introduced
> >       to govern VirtIO devices
> >
> > The proposal is to implement a new VirtIO transport driver for Linux
> > that utilizes Argo. It will be used within guest virtual machines, and
> > be source-compatible with the existing VirtIO front-end device drivers
> > in Linux.
> >
> > It will be paired with a corresponding new VirtIO-Argo back-end to run
> > within the Qemu device emulator, in the same fashion as the existing
> > VirtIO transport back-ends, and the back-end will use a non-VirtIO Linu=
x
> > driver to access and utilize Argo.
>
> IMO it would be better if we could implement the backends in a more
> lightweight tool, something like kvmtool.

That's an interesting suggestion, thanks - I would be open to this.

>
> > Open Source VirtIO drivers for Windows are available, and enable Window=
s
> > guest VMs to run with virtual devices provided by the VirtIO backends i=
n
> > QEMU. The Windows VirtIO device drivers have the same transport
> > abstraction and separate driver structure, so an Argo transport driver
> > can also be developed for Windows for source-compatibility with Windows
> > VirtIO device drivers.
> >
> > =3D=3D Using VirtIO with the new Argo transport driver
> >
> > VirtIO device drivers are included in the mainline Linux kernel and
> > enabled in most modern Linux distributions. Adding the new Linux-Argo
> > guest driver to the upstream Linux kernel will enable seamless
> > deployment of modern Linux guest VMs on VirtIO-Argo hypervisor
> > platforms.
> >
> > =3D=3D=3D Host platform software
> >
> > =3D=3D=3D=3D QEMU
> >
> > The QEMU device emulator implements the VirtIO transport that the
> > front-end will connect to. Current QEMU 5.0 implements both the
> > virtio-pci and virtio-mmio common transports.
>
> Oh, I think that answers my question from above, and you would indeed
> expose the device configuration using an Argo specific virtio device
> bus.

Yes.

> Would it be possible to expose the device configuration using
> virtio-{pci,mmio} but do the data transfer using Argo?

I think potentially yes, with a bit of investigation needed to
determine exactly how to make that work.

>
> >
> > =3D=3D=3D=3D Linux Argo driver
> >
> > For QEMU to be able to use Argo, it will need an Argo Linux kernel
> > device driver, with similar functionality to the existing Argo Linux
> > driver.
> >
> > =3D=3D=3D=3D Toolstack
> >
> > The toolstack of the hypervisor is responsible for configuring and
> > establishing the back-end devices according to the virtual machine
> > configuration. It will need to be aware of the VirtIO-Argo transport an=
d
> > initialize the back-ends for each VM with a suitable configuration for
> > it.
> >
> > Alternatively, in systems that do not run with a toolstack, the DomB
> > launch domain (when available) can perform any necessary initialization=
.
> >
> > =3D=3D=3D Functionality
> >
> > Adding Argo as a transport for VirtIO will retain Argo=E2=80=99s MAC po=
licy
> > checks on all data movement, via Xen's XSM/Flask, while allowing use of
> > the VirtIO virtual device drivers and device implementations.
> >
> > With the VirtIO virtual device drivers using the VirtIO-Argo transport
> > driver, the existing Xen PV drivers, which use the grant tables and
> > event channels, are not required, and their substitution enables remova=
l
> > of shared memory from the data path of the device drivers in use and
> > makes the virtual device driver data path HMX-compliant.
> >
> > In addition, as new virtual device classes in Linux have VirtIO drivers
> > implemented, these should transparently be enabled with Mandatory Acces=
s
> > Control, via the existing virtio-argo transport driver, potentially
> > without further effort required =E2=80=93 although please note that for=
 some
> > cases (eg. graphics) optimizing performance characteristics may require
> > additional effort.
> >
> > =3D=3D=3D Mechanisms
> >
> > VirtIO transport drivers are responsible for virtual device enumeration=
,
> > triggering driver initialization for the devices, and we are proposing
> > to use ACPI tables to surface the data to the guest for the new driver
> > to parse for this purpose. Device tree has been raised as an option for
> > this on Arm and it will be evaluated.
> >
> > The VirtIO device drivers will retain use of the virtqueues, but the
> > descriptors passed between domains by the new transport driver will not
> > include guest physical addresses, but instead reference data that has
> > been exchanged via Argo. Each transmission via XEN_ARGO_OP_sendv is
> > subject to MAC checks by XSM.
> >
> > =3D=3D=3D From last discussion
> >
> > * Design of how virtual devices are surfaced to the guest VM for
> >   enumeration by the VirtIO-Argo transport driver
> >
> >     * Current plan, from the initial x86 development focus, is to
> >       populate ACPI tables
>
> Do we plan to introduce a new ACPI table for virtio-argo devices? Or
> are there plans to expand an existing table?
>
> I'm asking because all this would need to be discussed with the UEFI
> Forum in order to get whatever is needed into the spec (IIRC a
> separate table is easier because the specification doesn't need to be
> part of the official ACPI spec).

We don't have a decision either way on this at the moment.

> >     * Interest in using Device Tree, for static configurations on Arm,
> >       was raised on last month's Xen Community Call.
> >         * is being considered with development of DomB in progress
> >     * Does not need to be dom0 that populates this for the guest;
> >       just some domain with suitable permissions to do so
>
> Hm, while it's true that ACPI tables don't need to be populated by
> dom0 itself, it must be a domain that has write access to the guest
> memory, so that it can copy the created ACPI tables into the guest
> physmap.

Ack.

> I think this is all fine, but seems like a very non-trivial amount of
> work that depends on other entities (the UEFI Forum for ACPI changes
> and OASIS for the virtio ones).

I think your suggestion that we expose a virtual PCI device (as per
virtio-pci) to supply the device configuration, as an alternative to
an ACPI table, is attractive; even more so if there is a means of
using the existing virtio-pci device driver just with Argo as
transport.

> It also worries me a bit that we are
> jumping from not having virtio support at all on Xen to introducing
> our own transport layer, but I guess that's partly due to the existing
> virtio transports not being suitable for Xen use-cases.
>
> Regarding the specific usage of Argo itself, it's my understanding
> that a normal frontend would look like:
>
> virtio front -> virtio argo transport -> Argo hypervisor specific driver
>
> Would it be possible to implement an Argo interface that's hypervisor
> agnostic? I think that way you would have a much easier time trying
> to get something like this accepted upstream, if the underlying Argo
> interface could be implemented by any hypervisor _without_ having to
> add a new Argo hypervisor specific driver.
>
> On x86 I guess you could implement the Argo interface using MSRs,
> which would then allow any hypervisor to provide the same interface
> and thus there would be no component tied to Xen or any specific
> hypervisor.

I think the Argo hypervisor interface will have to change anyway, due
to its use of virtual addresses in hypercall arguments, which I
understand the maintainers would like to deprecate and replace across
all of Xen's hypercalls, so I'm open to looking at this when designing
the next generation hypervisor interface for Argo.

> Finally, has this been raised or commented with OASIS? I'm at least not
> familiar at all with virtio, and I bet that applies to most of the Xen
> community, so I think their opinion is likely even more important that
> the Xen community one.

I haven't taken this proposal to OASIS but if there are supporters of
this work that would like to engage there, I think it could make sense
as it develops.

thanks,

Christopher

>
> Thanks, Roger.

