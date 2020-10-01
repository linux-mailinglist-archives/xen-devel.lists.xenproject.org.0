Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AB627F84C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 06:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016.3415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNpoM-0002P8-I5; Thu, 01 Oct 2020 04:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016.3415; Thu, 01 Oct 2020 04:03:18 +0000
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
	id 1kNpoM-0002Oj-EW; Thu, 01 Oct 2020 04:03:18 +0000
Received: by outflank-mailman (input) for mailman id 1016;
 Thu, 01 Oct 2020 04:03:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x1nv=DI=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1kNpoL-0002Oc-7P
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 04:03:17 +0000
Received: from mail-oi1-x22c.google.com (unknown [2607:f8b0:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f533039-30e8-4bed-9911-3b2e75da8fe0;
 Thu, 01 Oct 2020 04:03:15 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id 26so4174902ois.5
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 21:03:15 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=x1nv=DI=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
	id 1kNpoL-0002Oc-7P
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 04:03:17 +0000
X-Inumbo-ID: 5f533039-30e8-4bed-9911-3b2e75da8fe0
Received: from mail-oi1-x22c.google.com (unknown [2607:f8b0:4864:20::22c])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5f533039-30e8-4bed-9911-3b2e75da8fe0;
	Thu, 01 Oct 2020 04:03:15 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id 26so4174902ois.5
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 21:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=Y+/JvufSK3ZxV7jymrqViOSalYUL22yHRhepeIvQBGo=;
        b=OeO/StWSE/Uf2wczzfj71mYtKhB/cZGQGDy3DLfA+BHAwRg8RCzcTUViHffiLz0U6g
         /2wVuthgtyO2c4XjIR46c5AbfPPCKdW6XiqR6FS6PdDjukTHXqlMdzkWyh/ed03uW3Ba
         cMgejNXfQx7qgVeqpuzC/fJ5sQiw0LykTesaeDNmX96o7410I8CR55bMMvZMUlF063Lv
         ibXmDuOxDZEPqwKfHzsSzVfsdtt0dCTduOcbWavohiKxWUD1eY5AwMHlqAb5ZLMebWBi
         S4vPxzIVpaY3exywVXIV9JP/spiocjONN9ErO+C/cQiRASjf4mtrqhr7vKUO7eDmFxl2
         EZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=Y+/JvufSK3ZxV7jymrqViOSalYUL22yHRhepeIvQBGo=;
        b=oGcqFlqDJ2Kp8quf1way4+YbxA7CFoP9JO/8cy942kZcy320n9RaICU9xkQ4lRU63k
         +qjAd9S/vERA8vi0qQibJ/mQvsIY5ALnYOpFd1kpSoTflt2fm/M2wSmtCfBNd40+v8Ry
         bXzzkGBnqVTyGXTQJTnzUQrD07mIZZgO712vSRofCfmIjtR/C+dxgsbCasoN75grSqA8
         u16WjA0R6sOXo604M2xOIDVCip7Dslo2/ZUq9IRqoaIqd4f/n8mx6FV0IRW9CJbRD5n1
         jqfKEyouXqvHGsJ4i2b0ex4RGlPei5crKeeDobylMR2ssAmq8N0/6QRoJIdkMSVJU4p2
         LmNw==
X-Gm-Message-State: AOAM532oO2LJJl73RhGNGuF9nXCquCb4fynZZIoA9dyloVgOWDzGMdFK
	J5nexw4mRYtFIhpyn/svV2MQGrOb+G/tU7x8rFyHOfwug3A=
X-Google-Smtp-Source: ABdhPJxXa6s/BzXJWyCtpG7WaoF40ixkeUdXoUBrrHCKpuUoH0Gg45gBUxXPk5NLMVq9rEFcK56kKoWjso1Hw/qfqfA=
X-Received: by 2002:aca:e08b:: with SMTP id x133mr711222oig.20.1601524994729;
 Wed, 30 Sep 2020 21:03:14 -0700 (PDT)
MIME-Version: 1.0
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 30 Sep 2020 21:03:03 -0700
Message-ID: <CACMJ4GaWcF74zE5qt31MDvcX1mx1HSW7eaOXpfpWJ2KzQZOg=Q@mail.gmail.com>
Subject: VirtIO & Argo: a Linux VirtIO transport driver on Xen
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Rich Persaud <persaur@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello

Following up on a topic introduced in last month's community call,
here are some notes on combining existing Linux guest virtio drivers
with Argo inter-VM communication on Xen.  If feasible, this would
combine the compatibility of tested Linux drivers with the mandatory
access control properties of Argo, which could help meet functional
safety and security requirements for Xen on Arm and x86.  This
development work is not resourced, but the initial investigation has
been encouraging.  We are sharing here for comment, aiming to work
with those in the Xen and wider Linux communities who may have similar
requirements.

Christopher
- 30th September 2020

---
This document describes a proposal for development of a new Linux device
driver to introduce Hypervisor-Mediated data eXchange (HMX) into the
data transport of the popular VirtIO suite of Linux virtual device
drivers, by using Argo with Xen. This will provide a way to use VirtIO
device drivers within Xen guest VMs with strong isolation properties.

This work has been developed by Christopher Clark, Daniel Smith and Rich
Persaud, with Eric Chanudet and Nick Krasnoff.
Christopher is the primary author of this version of this document.

----
Contents:

=3D Context: Introduction to VirtIO
=3D=3D VirtIO Architecture Overview
=3D=3D=3D VirtIO front-end driver classes
=3D=3D=3D VirtIO transport drivers
=3D VirtIO with Argo transport
=3D=3D Using VirtIO with the new Argo transport driver
=3D=3D=3D Host platform software
=3D=3D=3D=3D QEMU
=3D=3D=3D=3D Linux Argo driver
=3D=3D=3D=3D Toolstack
=3D=3D=3D Functionality
=3D=3D=3D Mechanisms
=3D=3D=3D From last discussion
=3D References

----
=3D Context: Introduction to VirtIO

VirtIO is a virtual device driver standard developed originally for the
Linux kernel, drawing upon the lessons learned during the development of
paravirtualized device drivers for Xen, KVM and other hypervisors. It
aimed to become a =E2=80=9Cde-facto standard for virtual I/O devices=E2=80=
=9D, and to
some extent has succeeded in doing so. VirtIO is now widely implemented
in both software and hardware, it is commonly the first choice for
virtual driver implementation in new virtualization technologies, and
the specification is now maintained under governance of the OASIS open
standards organization.

VirtIO=E2=80=99s system architecture abstracts device-specific and
device-class-specific interfaces and functionality from the transport
mechanisms that move data and issue notifications within the kernel and
across virtual machine boundaries. It is attractive to developers
seeking to implement new drivers for a virtual device because VirtIO
provides documented specified interfaces with a well-designed, efficient
and maintained common core implementation that can significantly reduce
the amount of work required to develop a new virtual device driver.

VirtIO follows the Xen PV driver model of split-device drivers, where a
front-end device driver runs within the guest virtual machine to provide
the device abstraction to the guest kernel, and a back-end driver runs
outside the VM, in platform-provided software - eg. within a QEMU device
emulator - to communicate with the front-end driver and provide mediated
access to physical device resources.

A critical property of the current common VirtIO implementations is that
their use of shared memory for data transport prevents enforcement of
strong isolation between the front-end and back-end virtual machines,
since the back-end VirtIO device driver is required to be able to obtain
direct access to the memory owned by the virtual machine running the
front-end VirtIO device driver. ie. The VM hosting the back-end driver
has significant privilege over any VM running a front-end driver.

Xen=E2=80=99s PV drivers use the grant-table mechanism to confine shared me=
mory
access to specific memory pages used and permission to access those are
specifically granted by the driver in the VM that owns the memory. Argo
goes further and achieves stronger isolation than this since it requires
no memory sharing between communicating virtual machines.

In contrast to Xen=E2=80=99s current driver transport options, the current
implementations of VirtIO transports pass memory addresses directly
across the VM boundary, under the assumption of shared memory access,
and thereby require the back-end to have sufficient privilege to
directly access any memory that the front-end driver refers to. This has
presented a challenge for the suitability of using VirtIO drivers for
Xen deployments where isolation is a requirement. Fortunately, a path
exists for integration of the Argo transport into VirtIO which can
address this and enable use of the existing body of VirtIO device
drivers with isolation maintained and mandatory access control enforced:
consequently this system architecture is significantly differentiated
from other options for virtual devices.

=3D=3D VirtIO Architecture Overview

In addition to the front-end / back-end split device driver model, there
are further standard elements of VirtIO system architecture.

For detailed reference, VirtIO is described in detail in the =E2=80=9CVirtI=
O 1.1
specification=E2=80=9D OASIS standards document. [1]

The front-end device driver architecture imposes tighter constraints on
implementation direction for this project, since it is this that is
already implemented in the wide body of existing VirtIO device drivers
that we are aiming to enable use of.

The back-end software is implemented in the platform-provided software -
ie.  the hypervisor, toolstack, a platform-provided VM or a device
emulator, etc. - where we have more flexibility in implementation
options, and the interface is determined by both the host virtualization
platform and the new transport driver that we are intending to create.

=3D=3D=3D VirtIO front-end driver classes

There are multiple classes of VirtIO device driver within the Linux
kernel; these include the general class of front-end VirtIO device
drivers, which provide function-specific logic to implement virtual
devices - eg. a virtual block device driver for storage - and the
_transport_ VirtIO device drivers, which are responsible for device
discovery with the platform and provision of data transport across the
VM boundary between the front-end drivers and the corresponding remote
back-end driver running outside the virtual machine.

=3D=3D=3D VirtIO transport drivers

There are several implementations of VirtIO transport device drivers in
Linux, each implement a common interface within the kernel, and they are
designed to be interchangeable and compatible with the VirtIO front-end
drivers: so the same front-end driver can use different transports on
different systems. Transports can coexist: different virtual devices can
be using different transports within the same virtual machine at the
same time.

=3D VirtIO with Argo transport

Enabling VirtIO to use the Argo interdomain communication mechanism for
data transport across the VM boundary will address critical requirements:

* Preserve strong isolation between the two ends of the split device driver

    * ie. remove the need for any shared memory between domains or any
      privilege to map the memory belonging to the other domain

* Enable enforcement of granular mandatory access control policy over
  the communicating endpoints

    * ie. Use Xen=E2=80=99s XSM/Flask existing control over Argo communicat=
ion,
      and leverage any new Argo MAC capabilities as they are introduced
      to govern VirtIO devices

The proposal is to implement a new VirtIO transport driver for Linux
that utilizes Argo. It will be used within guest virtual machines, and
be source-compatible with the existing VirtIO front-end device drivers
in Linux.

It will be paired with a corresponding new VirtIO-Argo back-end to run
within the Qemu device emulator, in the same fashion as the existing
VirtIO transport back-ends, and the back-end will use a non-VirtIO Linux
driver to access and utilize Argo.

Open Source VirtIO drivers for Windows are available, and enable Windows
guest VMs to run with virtual devices provided by the VirtIO backends in
QEMU. The Windows VirtIO device drivers have the same transport
abstraction and separate driver structure, so an Argo transport driver
can also be developed for Windows for source-compatibility with Windows
VirtIO device drivers.

=3D=3D Using VirtIO with the new Argo transport driver

VirtIO device drivers are included in the mainline Linux kernel and
enabled in most modern Linux distributions. Adding the new Linux-Argo
guest driver to the upstream Linux kernel will enable seamless
deployment of modern Linux guest VMs on VirtIO-Argo hypervisor
platforms.

=3D=3D=3D Host platform software

=3D=3D=3D=3D QEMU

The QEMU device emulator implements the VirtIO transport that the
front-end will connect to. Current QEMU 5.0 implements both the
virtio-pci and virtio-mmio common transports.

=3D=3D=3D=3D Linux Argo driver

For QEMU to be able to use Argo, it will need an Argo Linux kernel
device driver, with similar functionality to the existing Argo Linux
driver.

=3D=3D=3D=3D Toolstack

The toolstack of the hypervisor is responsible for configuring and
establishing the back-end devices according to the virtual machine
configuration. It will need to be aware of the VirtIO-Argo transport and
initialize the back-ends for each VM with a suitable configuration for
it.

Alternatively, in systems that do not run with a toolstack, the DomB
launch domain (when available) can perform any necessary initialization.

=3D=3D=3D Functionality

Adding Argo as a transport for VirtIO will retain Argo=E2=80=99s MAC policy
checks on all data movement, via Xen's XSM/Flask, while allowing use of
the VirtIO virtual device drivers and device implementations.

With the VirtIO virtual device drivers using the VirtIO-Argo transport
driver, the existing Xen PV drivers, which use the grant tables and
event channels, are not required, and their substitution enables removal
of shared memory from the data path of the device drivers in use and
makes the virtual device driver data path HMX-compliant.

In addition, as new virtual device classes in Linux have VirtIO drivers
implemented, these should transparently be enabled with Mandatory Access
Control, via the existing virtio-argo transport driver, potentially
without further effort required =E2=80=93 although please note that for som=
e
cases (eg. graphics) optimizing performance characteristics may require
additional effort.

=3D=3D=3D Mechanisms

VirtIO transport drivers are responsible for virtual device enumeration,
triggering driver initialization for the devices, and we are proposing
to use ACPI tables to surface the data to the guest for the new driver
to parse for this purpose. Device tree has been raised as an option for
this on Arm and it will be evaluated.

The VirtIO device drivers will retain use of the virtqueues, but the
descriptors passed between domains by the new transport driver will not
include guest physical addresses, but instead reference data that has
been exchanged via Argo. Each transmission via XEN_ARGO_OP_sendv is
subject to MAC checks by XSM.

=3D=3D=3D From last discussion

* Design of how virtual devices are surfaced to the guest VM for
  enumeration by the VirtIO-Argo transport driver

    * Current plan, from the initial x86 development focus, is to
      populate ACPI tables
    * Interest in using Device Tree, for static configurations on Arm,
      was raised on last month's Xen Community Call.
        * is being considered with development of DomB in progress
    * Does not need to be dom0 that populates this for the guest;
      just some domain with suitable permissions to do so


=3D References
1. The VirtIO 1.1 specification, OASIS
https://docs.oasis-open.org/virtio/virtio/v1.1/csprd01/virtio-v1.1-csprd01.=
html

2. virtio: Towards a De-Facto Standard For Virtual I/O Devices
Rusty Russell, IBM OzLabs; ACM SIGOPS Operating Systems Review, 2008.
https://ozlabs.org/~rusty/virtio-spec/virtio-paper.pdf

3. Xen and the Art of Virtualization
Paul Barham, Boris Dragovic, Keir Fraser, Steven Hand, Tim Harris,
Alex Ho, Rolf Neugebauer, Ian Pratt, Andrew Warfield; ACM Symposium on
Operating System Principles, 2003
https://www.cl.cam.ac.uk/research/srg/netos/papers/2003-xensosp.pdf

4. Project ACRN: 1.0 chose to implement virtio
https://projectacrn.org/acrn-project-releases-version-1-0/

5. Solo5 unikernel runtime: chose to implement virtio
https://mirage.io/blog/introducing-solo5

6. Windows VirtIO drivers
https://www.linux-kvm.org/page/WindowsGuestDrivers/Download_Drivers
=EF=BF=BChttps://github.com/virtio-win/kvm-guest-drivers-windows

