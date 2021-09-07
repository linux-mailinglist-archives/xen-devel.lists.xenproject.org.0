Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52034021D4
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 03:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180313.326905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNQ8a-00073j-SX; Tue, 07 Sep 2021 01:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180313.326905; Tue, 07 Sep 2021 01:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNQ8a-00071r-NU; Tue, 07 Sep 2021 01:43:00 +0000
Received: by outflank-mailman (input) for mailman id 180313;
 Tue, 07 Sep 2021 01:42:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M3oQ=N5=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1mNQ8Y-00071l-VO
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 01:42:59 +0000
Received: from mail-oo1-xc2b.google.com (unknown [2607:f8b0:4864:20::c2b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f67aa032-282b-44eb-bc5c-ffc11927bb96;
 Tue, 07 Sep 2021 01:42:53 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 k18-20020a4abd92000000b002915ed21fb8so2468578oop.11
 for <xen-devel@lists.xenproject.org>; Mon, 06 Sep 2021 18:42:53 -0700 (PDT)
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
X-Inumbo-ID: f67aa032-282b-44eb-bc5c-ffc11927bb96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=AmTYCsTMxsxUaV+vrl73d/gbiuPrWmazNxtA2VpDiE4=;
        b=F2cSITu7H6zodAIKEv07Q1UXJNjdAmUHud5D8ZNM4iteDHDTuhTSM1laFUOwcuvo+j
         GF1VwFDyEBZHMtuv6On3rpsc4EXDSYGet1ZuqppQYR13E/0jxEeDHnr+c5U1Ba7u4Go1
         3yMtTxviC1wLPfcXvas1a6xSozLNCorc+hQvj+PeRu88S5p7uW5LqqCBesmmZzsbngbI
         D0uupFhGHO2oYlw87f7EvTfVn2RrzZ0XPjPj+3KfwYobiLuwzDu10SaO+v3ugsytrWMr
         FVRl0F8dygQlu9Ao2u5wCPpNN0iuqZKOFOaPOu/2dg3GAQhPjISTLa8iDFpx3snPmkKq
         yGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=AmTYCsTMxsxUaV+vrl73d/gbiuPrWmazNxtA2VpDiE4=;
        b=IGGPibdq2DnKSHyzxBm5b3ciAkCxhfxgPEqPElbNZHsiM+mo201HgKUcw0jk0OwBiV
         IOaEnqxqlGPJSz25kcmMT2KfUc+9k8AZrBajxTJU9VsVuSBoAlh2AFXmfhR00bUpkt6f
         vDGBjf7w+1MLQ0d8A5dPt4OYDIX/zQ0kGr/MXebz6NcIRYzbmCsptxkUbKhi61ohVGaa
         6GoS+U6/ncuKj0fl5MMJUPAcmPGoV+JIUPV5066fK41VOasDtoXdGZi4kJcghaXtAVXt
         Db4rNseiBnvVUbvl9KI7VfJS0/OzlJpRDznBUjawRAnskesCwMyJX/BTs5Nk9wfhI62X
         QSeQ==
X-Gm-Message-State: AOAM533lnSdvUEB7c7yXWKJTvpVP6A9npbZZQson7BjQmGQzhcTMnmcm
	mu7hdKxC4gSd6WbxfBEcNUWjXtpbVmTmw1cCkgC4QnriD159oA==
X-Google-Smtp-Source: ABdhPJyqyXvInMjZtKtyVn1MU4FPSFnwbM+SxbhnaCAPYw9c+kHOMzZpytZTtEokXXQMt3YOn814gLY+OvHFIAoi7VI=
X-Received: by 2002:a4a:e3cf:: with SMTP id m15mr15993837oov.21.1630978972478;
 Mon, 06 Sep 2021 18:42:52 -0700 (PDT)
MIME-Version: 1.0
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 6 Sep 2021 18:42:36 -0700
Message-ID: <CACMJ4GarXj5uAiNuoxvKHPhbv40jVtqgH0TxpB22PjyD2mLMRQ@mail.gmail.com>
Subject: Notes from the Xen Summit 2021: Design Session VirtIO Cross-Project
 BoF (Birds of a Feather) for Xen and Guest OS (Linux, Windows, FreeBSD) developers
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Rich Persaud <persaur@gmail.com>, stratos-dev@linaro.org, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <jgrall@amazon.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>, 
	Julien Grall <julien.grall.oss@gmail.com>, James McKenzie <james@bromium.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>, 
	Paul Durrant <paul@xen.org>, Jean-Philippe Ouellet <jpo@vt.edu>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jason Andryuk <jandryuk@gmail.com>, eric chanudet <eric.chanudet@gmail.com>, 
	Chris Rogers <rogersc@ainfosec.com>, Rich Turner <turnerr@ainfosec.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>, 
	Artem Mygaiev <Artem_Mygaiev@epam.com>, demi@invisiblethingslab.com, 
	George Dunlap <George.Dunlap@citrix.com>, damien.thenot@vates.fr, 
	Wei Chen <Wei.Chen@arm.com>
Content-Type: multipart/alternative; boundary="0000000000004a724505cb5de215"

--0000000000004a724505cb5de215
Content-Type: text/plain; charset="UTF-8"

Design Session notes for: VirtIO Cross-Project BoF (Birds of a Feather) for
Xen and Guest OS (Linux, Windows, FreeBSD) developers
---------------------------
Xen Design & Developer Summit, 27th May 2021
Session Host: Juergen Gross
Notes by: Christopher Clark, with thanks to Rich Persaud

Apologies for the delay in posting these, solely my responsibility.
- Christopher

============================================================
Session Context:

There are three separate recent approaches within the Xen community to
enabling
use of VirtIO device drivers in guest virtual machines with the Xen
hypervisor,
and a fourth older completed project.
(Placeholder names are assigned to each of these below for ease of
reference.)

In addition, Linaro has an active project 'Stratos' pursuing:
    "Establish virtio as the standard interface between hypervisors,
    freeing a mobile, industrial or automotive platform to migrate between
    hypervisors and reuse the backend implementation."

    - https://linaro.atlassian.net/wiki/spaces/STR/overview
    - https://projects.linaro.org/projects/STR/summary
    - https://op-lists.linaro.org/mailman/listinfo/stratos-dev

--------------------
* 'VirtIO-EPAM': enabling existing VirtIO-MMIO transport on Xen, using
foreign
mappings and an IOREQ server.
by EPAM and others, with focus on Xen on Arm platforms.

Enables use of the existing standardized VirtIO-MMIO transport driver,
which is
present in the mainline Linux kernel, using Xen's IOREQ emulation
infrastructure and use of privileged foreign mappings to establish shared
memory for access to guest data by the device model backend.

Status: Patches are in progress towards Xen on the xen-devel mailing list.
The presentation at Linaro Connect 2021 includes a working demonstration.

VirtIO on Xen hypervisor (Arm), Oleksandr Tyshchenko, EPAM, Linaro Connect
2021
https://static.linaro.org/connect/lvc21/presentations/lvc21-314.pdf
https://www.youtube.com/watch?v=XE5Rn8KFunk

--------------------
* 'VirtIO-SuSE': introducing a new VirtIO transport driver that uses Xen
grants.
by SuSE, presented at this Xen Summit.

A new VirtIO transport device driver is added to the guest kernel, to
translate guest physical addresses into grant references, enabling VirtIO
data
path communication over mutually-negociated shared memory regions between
the
guest virtual machine and the device model backend. Improves isolation as
backend does not need privilege over the guest to perform foreign mappings.
Grant references are a Xen-specific interface. Design supports driver
domains.

Status: A prototype is described in the presentation at this Xen Summit
2021.

VirtIO and Xen with Full Grant Support:
https://static.sched.com/hosted_files/xen2021/bf/Thursday_2021-Xen-Summit-virtio.pdf
https://www.youtube.com/watch?v=IrlEdaIUDPk&list=PLYyw7IQjL-zGcRPN6EjiTuFVGo4A6KCNf&index=25

--------------------
* VirtIO-Argo: introducing a new VirtIO transport driver that uses Argo for
interdomain communication, supporting isolation and Mandatory Access
Control.
Design and analysis performed within the OpenXT and Xen communities.

A new VirtIO transport device driver is added to the guest kernel to
transmit
data between the guest domain and the domain hosting the device model via
Argo
rings: a Hypervisor-Mediated data eXchange protocol where the hypervisor
transfers the data, being trusted to strictly adhere to the delivery
protocol.
Supports stronger isolation properties and enforcement of Mandatory Access
Control security policy over interdomain communication. Does not use shared
memory between domains.
Development of a Hypervisor-agnostic interface for Argo has been proposed
and discussed within the Xen community. Design supports driver domains.

Status: Design and analysis published; funding required for development to
proceed.

VirtIO-Argo: Documentation at the OpenXT wiki:
https://openxt.atlassian.net/wiki/spaces/DC/pages/1348763698/VirtIO%2BArgo
VirtIO-Argo Development:
https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo%2BDevelopment%2BPhase%2B1
Minutes from the Argo HMX Transport for VirtIO topic call, 14th January
2021:
https://lists.xenproject.org/archives/html/xen-devel/2021-02/msg01422.html

--------------------
* 'VirtIO-Xen-GSoC': 2011 VirtIO on Xen student project
A Google Summer of Code project by Wei Liu investigated enabling VirtIO on
Xen.

A working prototype was produced for both PV and HVM guests, using XenBus
and
the Qemu VirtIO backends. PV guests require a guest kernel patch to
translate
guest physical addresses to machine addresses in VirtIO rings.

Status: project completed.

https://wiki.xenproject.org/wiki/Virtio_On_Xen

============================================================
Summary of the VirtIO Design Session:

xl toolstack guest config file syntax for VirtIO devices:
    - Recommend: mix of: device-specific config (eg. disk, net) plus
support for
                 generic VirtIO device config (eg. esoteric devices)

VirtIO spec:
    - spec change needed? understood as not mandatory
    - v1.1 has a platform feature for DMA addr translation: enables
transport
      driver to use any of grants, pre-shared memory, Argo in the data path
        - ie. does not force use of (guest) physical addrs in the ring
    - open question re: Linux and qemu acceptance of non-standardized driver

Guest access to new VirtIO transport
    - for Argo or grants, add new transport driver (eg. out of tree module)

Performance, standardization
    - different characteristics on different architectures; motivates
      development and deployment of different transports for separate cases
    - difficulty of ensuring correctness with shared memory vs. performance
      achievable with some configurations

Atomics in shared memory, Arm, "Fat Virtqueue" development
    - Arm and RISC-V have challenges with atomic inst in shared memory
    - VirtIO-SuSE (using grants) useful enough for consideration
    - Wind River preshared-memory memcpy approach (OpenAMP/kvmtool)
    - Linaro "Fat Virtqueue" under development: pass data within enlarged
rings

Data copies with Argo and shared memory transports
    - discussion of copies made by different transports, different
conditions
    - data copies performed to protect correctness in communication

Ecosystems, differentiation
    - standarization of VirtIO shifted economics for hypervisor developers
    - Mandatory Access Control with Xen technologies will be a Xen advantage


============================================================
Detailed notes for the Design Session:

Rich (OpenXT): introducing session; to talk about:
    - how any solution will be ratified by the VirtIO/OASIS community
        - esp automotive use cases: a lot of attention paid to formal
          acceptance of any VirtIO solution

    - non-Linux guest VMs
        - Windows is used in OpenXT, Qubes
        - FreeBSD is popular for networking and storage

Roger (Citrix; x86 maintainer) [chat]: I wanted to ask whether the Linux
kernel
/QEMU code could be accepted without any spec change?

--- topic: xl toolstack guest config file syntax for VirtIO devices

Juergen (SUSE; PV interfaces maintainer): shared window with VM config:
------------------------
disk=[ 'file:/home/vm/upstream/image,hda,w', ]
vif=[ 'mac:00:16:3e:06:a7:21,bridge=br0', ]
vfb=[ 'vnclisten=localhost:0', ]
# device_model_args=[ '-drive',
'file=/home/vm/sle15sp3/image,if=virtio,index=1,media=disk,format=raw,cache=writeback'
]
device_model_args=[ '-drive',
'file=/home/vm/sle15sp3/image,if=none,id=drive-virtio-disk0,format=raw',
'-device',
'virtio-blk-pci,scsi=off,drive=drive-virtio-disk0,id=virtio-disk0,bootindex=0,disable-legacy=on'
]
------------------------

Juergen: Request for input on xl config file syntax for configuring VirtIO
devices
    - see device_model_args in example (force VirtIO block to non-legacy
mode)
    - alt option: add a 'virtio' specifier to the disk line
        - see recent patch by Artem
    - need to consider generic devices: non-network, non-disk device classes

Q: Should VirtIO disk be added under 'disk', or a new special VirtIO disk?

Julien (Amazon; Arm maintainer):
    - want to avoid having one vif, one framebuffer, one gps, etc.
        - so instead have generic device options (eg. block, gps)
            - ie. similar to Qemu

Marek (Qubes; Python bindings maintainer):
    - libvirt bindings perspective: Preference for the other way
        - don't want duplicated eg. disk handling, for the VirtIO case
        - unified handling for a device class is more convenient for API
users

Stefano (Xilinx; Arm maintainer):
    - Disk is a special case: config already has a line for disk,
      already have a way to specify different types - network may be similar
    - alt method is better for other devices, eg. virtio-rng
        - for those, device_model_arg is probably the best

Andy (Citrix, x86 maintainer):
    - a lot of this is PCI-based, even if non-DMA transport so:
        - need to preserve support for multi-IOREQ servers
        - feasible to have VirtIO backends that are not Qemu
    - so: don't tie the configuration to Qemu

OleksandrT (EPAM) [chat]: Initially I created a new "vdisk" property for
virto.disk, but was asked to reuse existing "disk" configuration in libxl
if possible.
https://lists.xenproject.org/archives/html/xen-devel/2021-05/msg01174.html

Juergen: ack; esp for Arm, mmio-based config: so we should be flexible.
Aiming to determine:
  1: Configuration format for VirtIO devices in guests
  2: Surfacing VirtIO devices in guest VMs:
        - tie it to the PCI specification or not?
        - challenge if guests do not have PCI detection

    - Responses:
        - PCI is fairly standard
        - issue with mmio: hotplugging devices
              - ranges to be configured => need number of devices in advance
              - hotplug already requires upfront work, due to grants, events
        - PCI and mmio are similar; choice depends on guest and ecosystem

George (Citrix; Xen Community Manager):
    - makes sense for a case to standardize on Argo?
    - Argo vs grant table vs shared memory : why duplicate the extra effort?
    - how much effort duplicated for multiple? is it pretty easy to swap
them
      out?

Rich [chat]: Important for automotive, FuSA, security

Christopher (Apertus/Star Lab; Argo maintainer):
    - Options are not exclusive: VirtIO can use different transports
per-device
    - Transports orthogonal eg. Argo devices enumerable via the VirtIO-Argo
      driver; Argo enables Mandatory Access Control over the data transport


--- topic: VirtIO spec change; addresses on VirtIO rings

Concern: requirement for a VirtIO spec change

- Discussion re: is spec change mandatory?
    - may be needed: VirtIO spec says pass guest physical addr on ring
    - may not be: translation step in the transport layer;
                  enables translation so don't need to change spec
    - is spec change needed for config negotiation, to announce feature?
    - response: no; transport driver does enumerations, so up to the driver

Stefano: "VirtIO" means different things: spec, transport, drivers
    - since transports are part of the spec: VirtIO-PCI, VirtIO-MMIO, ...,
      adding one (VirtIO-Argo) means adding to the spec
Daniel: no ..

Juergen: VirtIO spec does not demand physical addresses on the ring pages
    - DMA addresses are allowed
    - eg. a special DMA mechanism, which happens to be grants, is fine.
        - ie. We have a special DMA engine.
Andy: Yes. DMA addresses != identity map onto physical or guest phys
addresses

Daniel: there is a spec for the transports: if implementing a PCI
transport, or
  a MMIO transport, has certain characteristics of how those should behave;
  so the driver-to-transport interface is fixed.
  It doesn't fix the transport back, which was the analysis that
Christopher and
  I were looking at.
  Fixed from front-end perspective: interface between the driver and
transport.
  If the transport presents as a PCI device transport, there's an interface
that
  the driver expects that transport to provide.
     - It doesn't fix how it happens from the transport back.

George: Frontend VirtIO driver hands phys addr to frontend transport and the
       frontend transport can convert it to eg. grant tables to do what it
wants

Daniel: right
    - plus more behaviours, esp for PCI: eg. structures expected to be there
      so the drivers can expect a common behaviour for any PCI transport
        - transport is translation layer, can handle dealing with actual
          physical backend mechanism that you're going over

Stefano: so plan is to add new transport: would that need to be in the spec?
Daniel: no


--- topic: Guest access to new VirtIO transport

George: VirtIO frontend drivers would work with the new transport.
    - a current VM image won't have transport implemented
        - have to update to a new version of kernel, or
        - a new version of image to get new transport?

Daniel: Well, that's one way; for Argo, can present as either a PCI
transport or
a MMIO transport to the driver, so the driver understands how to interact
with
the transport; and the transport handles moving data back. For Argo, we move
everything onto Argo rings.
To gain that on Linux, can do an out of tree kernel module, and load that
without having to recompile the entire kernel (unless they don't have
loadable
module support).
- responses:
    - needs the frontend transport in the guest;
    - so can't just use an existing image unmodified -- need the compiled
      kernel driver loaded to make the transport available
    - objective will be to add it to the upstream Linux kernel

Andy: might be able to get a frontend Windows driver somewhere useful

Stefano: fewer changes to the spec are better: looks like nothing, fantastic
Second is changes to the code; seems limited to transport driver, is a lot
better than having to change all the frontend drivers

    - Christopher: yes; point is to keep all of those and should be able to
                   plug them into backend drivers in the Qemu
implementation.
    - Juergen: Yes. Actual backends unchanged and only lower levels of
               transport layer need some modifications.
        - ie. for all implementations of backend infrastructure:
            - Qemu
            - the kernel for the vhost backends
            - vhost-user, all the user daemons implementing the backend
    - Andy: sounds great overall

---- topic: Performance

George: whether to use Argo or grant tables or something else:
    - Andy: think the answer is that we need both
    - Juergen: Yes.
    - Andy: there are people that need to not have shared memory, and Argo
is an
            option there, and there are people who will want shared memory
            because its faster.
    - ...: Is it?
    - Andy: Yes.

Damien Thenot [chat]: Shared memory would be interesting for DPU too

Stefano: Performance is a good metric;
- Able to convince third party proprietary vendor to add a driver?
    - some sort of shared memory useful as a last resort, fallback:
        - ie. easier to say "just add a memcpy" and to copy to the
pre-shared
          memory region

George: Ian Pratt presentation said:
    - copying is faster than sharing memory
    - sharing memory is so difficult that noone is smart enough to do it,
and we
      were all fools back in the 2000s to think we were smart enough to do
it

Christopher [chat]: https://platformsecuritysummit.com/2018/speaker/pratt

Andy: Not using shared memory can get around a lot of common bugs, but if
you
      know how to do shared memory, it is still faster than data copying in
      enough cases for it to be relevant, for us to care.
Marek: if you can avoid mapping and unmapping all the time
      eg. can use well known regions.

Andy: a lot of network performance in XenServer is from not mapping
    - dom0 constructs a scatter-gather over the guest memory
      (a granted area, so permissions work) - never actually touched
    - Can't do that with copying mechanism; would force a memcpy into a
      zero overhead transmit path

Stefano: measurements so far always demonstrated grant table is slower than
any
         memcpy mechanisms
    - Julien: related to atomic instructions, ref: the previous talk?
    - Stefano: could be; all my latest measurements are on Arm.
    - Andy: Different architectures will make massive differences here

Jason Andryuk (OpenXT) [chat]: @Andrew, you use netfront/back but your dom0
nic
                               scatter/gathers over the guest's granted
network
                               frames directly?
Andy [chat]: Yeah. A consequence is that dom0 never touches the mapping, so
             never sets the A bit, so you can skip the TLB flush on the
unmap
             side and this is great for performance
Roger [chat]: Note you need to patch Xen to not do the flush on unmap if
the A
              bit isn't set


---- topic: Atomics in shared memory, Arm, "Fat Virtqueue" development

Juergen: regarding Arm and shared pages: how does VirtIO and KVM on Arm
work?

Julien: don't do atomics in shared page. Lesson learned a while ago.
- Xen has many uses of atomics in shared pages, eg. evtchn, etc.
  For VirtIO, would be nicer to avoid doing the same again.

Stefano: Could we require Arm 8.1? (Is 8.1 introduces the new atomics, or
8.2?)

Julien: Yes, but limited hardware available today
- latest may have it, but not Qemu
- looks like RISC-V may have the same issues

Demi Marie (Qubes OS) [chat]: RISC-V only has 32-bit atomics

Andy: VirtIO-Grant [ie. VirtIO-SuSE in these notes] may not be perfect for
all
      future use cases and other options exist - but still enough cases
that it
      is worth considering

Demi Marie [chat]: Long-term fix is probably to change the guest-visible
ABI to
                   not require atomics in shared memory

Julien: how can it be used with other hypervisors?
- eg. for Argo, looking at something that can be used in other hypervisors
- not possible with grant table, because of the problems I mentioned.
- want to avoid having a Xen-specific driver, ie. tying VirtIO transport to
Xen
  due to use of grant table

Stefano: two related activities, both based on shared memory:
    - one driven by Wind River: memcpy-based approach
        - presharing memory, and picking addresses off the shared region

Stefano [chat]: This is WindRiver KVMtools that does shared memory for
Virtio
https://github.com/OpenAMP/kvmtool

Stefano: second approach is from Linaro: "Fat Virtqueue"
        - increase the ring size and pick addresses within the ring only
            - So the shared memory region is only the ring, and the buffers
are
              within the ring. Pointer points to things within the ring.

George: summarizing:
- on Arm copying might be faster, and there are other advantages as well;
- on x86, things may be different
so:
- SuSE and Citrix may work on the grant table one, and
- Epam and Arm, etc. may work on the Argo one
and people can understand why they're choosing which one.

George: Can you also do driver domain things with Argo?
Daniel: Yes


--- topic: Data copies with Argo and shared memory transports

Stefano: with Argo is there a memcpy, or more than one memcpy? who would do
it?

Christopher: hypervisor does the copy for the transport.
- guest hypercall op to register a ring, allows hypervisor to blit data in;
    - can think of as a DMA-style operation to deliver data to the guest

Juergen: So for each I/O data, there are three copies:
    - first, into the ring, then by the hypervisor to the other domain,
      and then out of the ring of the other domain to the target address,
right?
Andy: That's correct if both the source and destination are buffering the
I/O in
      and out of the transport.
Daniel: Right

Andy: Buffering is probably because the backend is normally shared memory.
If you've got a guarantee that it's not shared memory between frontend and
backend, then neither the front or the back VirtIO driver need to buffer in
and
out of the transport

Juergen: ok, for a disk I/O: have user data in the guest, want to write to
disk
Arbitrary data in memory, needs to be written to the Argo ring buffer,
right?
That's copy one.
Andy: No; only destination has an Argo ring. Source just passes arbitrary
      addresses, like scatter-gather DMA.
Juergen: OK, so like grant copy
Andy: Yes.

Julien: With Argo, are the pages always mapped in Xen?
    - Christopher: Yes, for the rings the way that Argo works at the moment
is,
                   yes, once you register a ring that mapping is retained so
                   the hypervisor can send to it when a hypercall is
invoked.
    - Julien: OK

Demi Marie: is it possible for Argo to copy memory from guest one userspace
to
            the ring in guest two?
    - re: disk I/O: from ZFS issue tracker: have to take copies because is
not
      safe to operate on data shared with untrusted parties
    - So most cases you're going to have to have a copy.
        - Only exception: extremely carefully written data sources,
destinations
            - careful to only make loads exactly once
            - or tools like everparse, or another tool that generates
              formally-verified binary parsers, immune to double-fetch bugs
        - so: prefer to just take the copy
            - because memcpy on modern processors is very, very fast
            - especially while it's stayed in cache

George: Andy was saying: some people definitely going to want Argo, because
it's copying instead of shared memory, and double-fetch issues with shared
memory is definitely an issue

Andy: Yes. A lot of reasons why using shared memory is hard to do correctly;
not impossible but it is hard.


--- topic: Configuration syntax (continued)

Juergen: choice: generic virtio device configuration, vs individual
         device-specific stuff, or just mix variants?

Roger [chat]: I think both

Christopher: good to have generic + allow specialization if you care

Marek: Yes; eg. for network devices, might want a different copying
mechanism if
you can avoid copies for network. Same may not be doable for disk, so might
want
different mechanisms for disk and network devices.

Juergen: Should VirtIO disk be labelled under the disk item of the guest
config,
or a specific virtio disk item? Or virtio-device type = disk, or whatever.

Roger:
- keep the old disk options, expand to support VirtIO
- add a generic VirtIO option for more esoteric devices that we don't
support in
  any other way.
Disks and vifs need a type parameter to select VirtIO as backend.

Juergen: then have a transport layer specification:
(eg. don't care, or grants, or Argo, or whatever)

George: We have the same thing for PCI (strict, relaxed, ...)
ie. Set a global default for xl, plus override in specific domain config


--- topic: Interface to adapt to platform transport

Juergen: spec bit is: VIRTIO_F_ACCESS_PLATFORM feature bit
- indicates "the device can be used on a platform where the device
  access to data memory is limited, and/or translated"
  Exactly what we want; works for grants, etc.
    - is a generic bit from newer virtio spec, not a Xen-specific bit
    - in current impl, assumes running on Xen and means grants, because
      assumes that everything is done for addresses going into the ring


--- topic: Ecosystems, differentiation

Rich: On standardization of VirtIO: it commoditized the driver interface -
now
all hypervisors implement VirtIO because it's too expensive to do otherwise.
- using Argo transport to add Mandatory Access Control (needed by many
guests)
  is an advantage for Xen, since only with Xen will you get the strong
  guarantees from Argo. Especially with Hyperlaunch, and all the other
  integrity pieces.
    - Challenging for other hypervisors to do MAC transport for VirtIO.


End of session

============================================================
Open Issues / Technical questions:

- Method of discovery of available transport drivers, negociation which to
use
    - OASIS/VirtIO Standardization required? (eg. feature bits needed?)

- Upstreaming path for different pieces to: Linux kernel, Qemu, elsewhere
    - including enabling guest support for FreeBSD, Windows, etc.

- Development of VirtIO "Fat Virtqueues": how does this affect system
design?

- Design for interaction with guest virtual IOMMU
    - ref: VirtIO-iommu

- VFIO for device model backends

- Support for complex VirtIO drivers: eg. framebuffers (shared memory
regions)


============================================================
Areas suitable for investment to support VirtIO on Xen:

- Development of the Hypervisor-agnostic interface for Argo
Ref: Xen and OpenXT community discussion minutes:
https://lists.xenproject.org/archives/html/xen-devel/2021-02/msg01422.html

- Development of the VirtIO-Argo system
Project analysis and design documentation:

https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo%2BDevelopment%2BPhase%2B1

- VirtIO-focussed test cases for the Xen Test Framework
    - to provide coverage of the hypervisor interfaces used by VirtIO
transports
    - extend the framework capabilities to enable new tests (eg. multi-VM
cases)
  https://xenbits.xen.org/docs/xtf/index.html
    - development of support for Arm platforms with XTF

- Rust and Go languages toolstack development for Xen
    - Investment in the Xen toolstack is needed to support hypervisor
feature
      development. Toolstack support is necessary for enabling VirtIO
guests.
    - Work towards enabling Xen tools in Rust has started:
        https://github.com/xcp-ng/xenopsd-ng
    - Work towards enabling Xen tools in Go has started:

https://lists.xenproject.org/archives/html/xen-devel/2021-04/msg01744.html

- System image test integration with Yocto/Openembedded and Qemu
    - Xen and the Xen Test Framework can already be run within Qemu for x86
      in the standard meta-virtualization environment; Arm platform support
      needs to be completed, with coverage for VirtIO guests, and Continuous
      Integration enabled
    https://lists.yoctoproject.org/g/meta-virtualization/message/6405
    - to evaluate: VirtIO as a DISTRO_FEATURE or MACHINE_FEATURE

- Creation of documentation for Argo
    - implementation documentation exists:
      https://xenbits.xen.org/docs/4.15-testing/designs/argo.html

https://static.sched.com/hosted_files/xensummit19/92/Argo%20and%20HMX%20-%20OpenXT%20-%20Christopher%20Clark%20-%20Xen%20Summit%202019.pdf
      https://www.youtube.com/watch?v=cnC0Tg3jqJQ
    - user interface / client / kernel developer documentation is needed

- Development items for Argo:

https://openxt.atlassian.net/wiki/spaces/DC/pages/737345538/Argo+Hypervisor-Mediated+data+eXchange+Development

- Performance profiling of VirtIO-on-Xen systems across hardware
architectures

============================================================
Additional References:

VirtIO Specification v1.1, OASIS, 11th April 2019:
https://docs.oasis-open.org/virtio/virtio/v1.1/virtio-v1.1.html
VirtIO spec maintainers repository:
https://github.com/oasis-tcs/virtio-spec
Organization for the Advancement of Structured Information Standards
https://www.oasis-open.org
ACPI Virtal I/O Translation Table (VIOT) DRAFT v9, December 2020:
https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf
https://lore.kernel.org/linux-acpi/20210610075130.67517-2-jean-philippe@linaro.org/T/

Linaro: Stratos Project: Auto / Industrial Demonstrable Milestones
https://linaro.atlassian.net/wiki/spaces/STR/pages/28503377401/Demonstrable+artifacts

OpenXT: VirtIO and Argo:
https://openxt.atlassian.net/wiki/spaces/DC/pages/1348763698/VirtIO%2BArgo

OpenXT: VirtIO-Argo Development:
https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo%2BDevelopment%2BPhase%2B1

OpenXT: Analysis of Argo as a transport medium for VirtIO:
https://openxt.atlassian.net/wiki/spaces/DC/pages/1333428225/Analysis+of+Argo+as+a+transport+medium+for+VirtIO

Virtio with Argo for Xen, Mandatory Access Control
Meeting of Virtualization Experts Group of Automotive Grade Linux, 18th
Aug, 2020
https://lists.automotivelinux.org/g/agl-dev-community/attachment/8595/0/Argo%20and%20VirtIO.pdf

VirtIO on Xen hypervisor (Arm), Oleksandr Tyshchenko, EPAM, Linaro Connect
2021
https://static.linaro.org/connect/lvc21/presentations/lvc21-314.pdf
https://www.youtube.com/watch?v=XE5Rn8KFunk

Xen wiki: Argo
https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)_for_Xen

OpenXT: Argo: Hypervisor-Mediated data eXchange: Development:
https://openxt.atlassian.net/wiki/spaces/DC/pages/737345538/Argo%2BHypervisor-Mediated%2Bdata%2BeXchange%2BDevelopment

Xen wiki: Virtio On Xen
https://wiki.xenproject.org/wiki/Virtio_On_Xen

XCP-ng: IOREQ Server: Device Emulation in the Xen Hypervisor
https://xcp-ng.org/blog/2020/06/03/device-emulation-in-the-xen-hypervisor/

DEMU
https://xenbits.xen.org/gitweb/?p=people/pauldu/demu.git

Video for this Design Session:
https://www.youtube.com/watch?v=Ib0OdpHZ-G0&list=PLYyw7IQjL-zGcRPN6EjiTuFVGo4A6KCNf&index=29

--0000000000004a724505cb5de215
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Design Session notes for: VirtIO Cross-Project BoF (Birds =
of a Feather) for Xen and Guest OS (Linux, Windows, FreeBSD) developers<br>=
---------------------------<br>Xen Design &amp; Developer Summit, 27th May =
2021<br>Session Host: Juergen Gross<br>Notes by: Christopher Clark, with th=
anks to Rich Persaud<br><br>Apologies for the delay in posting these, solel=
y my responsibility.<br>- Christopher<div><br><div>=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>Session Context:<div><br></div><div>There are three separate rece=
nt approaches within the Xen community to enabling<br>use of VirtIO device =
drivers in guest virtual machines with the Xen hypervisor,<br>and a fourth =
older completed project.<br>(Placeholder names are assigned to each of thes=
e below for ease of reference.)<br><br>In addition, Linaro has an active pr=
oject &#39;Stratos&#39; pursuing:<br>=C2=A0 =C2=A0 &quot;Establish virtio a=
s the standard interface between hypervisors,<br>=C2=A0 =C2=A0 freeing a mo=
bile, industrial or automotive platform to migrate between<br>=C2=A0 =C2=A0=
 hypervisors and reuse the backend implementation.&quot;<br><br>=C2=A0 =C2=
=A0 - <a href=3D"https://linaro.atlassian.net/wiki/spaces/STR/overview">htt=
ps://linaro.atlassian.net/wiki/spaces/STR/overview</a><br>=C2=A0 =C2=A0 - <=
a href=3D"https://projects.linaro.org/projects/STR/summary">https://project=
s.linaro.org/projects/STR/summary</a><br>=C2=A0 =C2=A0 - <a href=3D"https:/=
/op-lists.linaro.org/mailman/listinfo/stratos-dev">https://op-lists.linaro.=
org/mailman/listinfo/stratos-dev</a><br><br>--------------------<br>* &#39;=
VirtIO-EPAM&#39;: enabling existing VirtIO-MMIO transport on Xen, using for=
eign<br>mappings and an IOREQ server.<br>by EPAM and others, with focus on =
Xen on Arm platforms.<br><br>Enables use of the existing standardized VirtI=
O-MMIO transport driver, which is<br>present in the mainline Linux kernel, =
using Xen&#39;s IOREQ emulation<br>infrastructure and use of privileged for=
eign mappings to establish shared<br>memory for access to guest data by the=
 device model backend.<br><br>Status: Patches are in progress towards Xen o=
n the xen-devel mailing list.<br>The presentation at Linaro Connect 2021 in=
cludes a working demonstration.<br><br>VirtIO on Xen hypervisor (Arm), Olek=
sandr Tyshchenko, EPAM, Linaro Connect 2021<br><a href=3D"https://static.li=
naro.org/connect/lvc21/presentations/lvc21-314.pdf">https://static.linaro.o=
rg/connect/lvc21/presentations/lvc21-314.pdf</a><br><a href=3D"https://www.=
youtube.com/watch?v=3DXE5Rn8KFunk">https://www.youtube.com/watch?v=3DXE5Rn8=
KFunk</a><br><br>--------------------<br>* &#39;VirtIO-SuSE&#39;: introduci=
ng a new VirtIO transport driver that uses Xen grants.<br>by SuSE, presente=
d at this Xen Summit.<br><br>A new VirtIO transport device driver is added =
to the guest kernel, to<br>translate guest physical addresses into grant re=
ferences, enabling VirtIO data<br>path communication over mutually-negociat=
ed shared memory regions between the<br>guest virtual machine and the devic=
e model backend. Improves isolation as<br>backend does not need privilege o=
ver the guest to perform foreign mappings.<br>Grant references are a Xen-sp=
ecific interface. Design supports driver domains.<br><br>Status: A prototyp=
e is described in the presentation at this Xen Summit 2021.<br><br>VirtIO a=
nd Xen with Full Grant Support:<br><a href=3D"https://static.sched.com/host=
ed_files/xen2021/bf/Thursday_2021-Xen-Summit-virtio.pdf">https://static.sch=
ed.com/hosted_files/xen2021/bf/Thursday_2021-Xen-Summit-virtio.pdf</a><br><=
a href=3D"https://www.youtube.com/watch?v=3DIrlEdaIUDPk&amp;list=3DPLYyw7IQ=
jL-zGcRPN6EjiTuFVGo4A6KCNf&amp;index=3D25">https://www.youtube.com/watch?v=
=3DIrlEdaIUDPk&amp;list=3DPLYyw7IQjL-zGcRPN6EjiTuFVGo4A6KCNf&amp;index=3D25=
</a><br><br>--------------------<br>* VirtIO-Argo: introducing a new VirtIO=
 transport driver that uses Argo for<br>interdomain communication, supporti=
ng isolation and Mandatory Access Control.<br>Design and analysis performed=
 within the OpenXT and Xen communities.<br><br>A new VirtIO transport devic=
e driver is added to the guest kernel to transmit<br>data between the guest=
 domain and the domain hosting the device model via Argo<br>rings: a Hyperv=
isor-Mediated data eXchange protocol where the hypervisor<br>transfers the =
data, being trusted to strictly adhere to the delivery protocol.<br>Support=
s stronger isolation properties and enforcement of Mandatory Access<br>Cont=
rol security policy over interdomain communication. Does not use shared<br>=
memory between domains.<br>Development of a Hypervisor-agnostic interface f=
or Argo has been proposed<br>and discussed within the Xen community. Design=
 supports driver domains.<br><br>Status: Design and analysis published; fun=
ding required for development to<br>proceed.<br><br>VirtIO-Argo: Documentat=
ion at the OpenXT wiki:<br><a href=3D"https://openxt.atlassian.net/wiki/spa=
ces/DC/pages/1348763698/VirtIO%2BArgo">https://openxt.atlassian.net/wiki/sp=
aces/DC/pages/1348763698/VirtIO%2BArgo</a><br>VirtIO-Argo Development:<br><=
a href=3D"https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/Virt=
IO-Argo%2BDevelopment%2BPhase%2B1">https://openxt.atlassian.net/wiki/spaces=
/DC/pages/1696169985/VirtIO-Argo%2BDevelopment%2BPhase%2B1</a><br>Minutes f=
rom the Argo HMX Transport for VirtIO topic call, 14th January 2021:<br><a =
href=3D"https://lists.xenproject.org/archives/html/xen-devel/2021-02/msg014=
22.html">https://lists.xenproject.org/archives/html/xen-devel/2021-02/msg01=
422.html</a><br><br>--------------------<br>* &#39;VirtIO-Xen-GSoC&#39;: 20=
11 VirtIO on Xen student project<br>A Google Summer of Code project by Wei =
Liu investigated enabling VirtIO on Xen.<br><br>A working prototype was pro=
duced for both PV and HVM guests, using XenBus and<br>the Qemu VirtIO backe=
nds. PV guests require a guest kernel patch to translate<br>guest physical =
addresses to machine addresses in VirtIO rings.<br><br>Status: project comp=
leted.<br><br><a href=3D"https://wiki.xenproject.org/wiki/Virtio_On_Xen">ht=
tps://wiki.xenproject.org/wiki/Virtio_On_Xen</a><br><br>=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>Summary of the VirtIO Design Session:<br><br>xl toolstack g=
uest config file syntax for VirtIO devices:<br>=C2=A0 =C2=A0 - Recommend: m=
ix of: device-specific config (eg. disk, net) plus support for<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0generic VirtIO devic=
e config (eg. esoteric devices)<br><br>VirtIO spec:<br>=C2=A0 =C2=A0 - spec=
 change needed? understood as not mandatory<br>=C2=A0 =C2=A0 - v1.1 has a p=
latform feature for DMA addr translation: enables transport<br>=C2=A0 =C2=
=A0 =C2=A0 driver to use any of grants, pre-shared memory, Argo in the data=
 path<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - ie. does not force use of (guest) ph=
ysical addrs in the ring<br>=C2=A0 =C2=A0 - open question re: Linux and qem=
u acceptance of non-standardized driver<br><br>Guest access to new VirtIO t=
ransport<br>=C2=A0 =C2=A0 - for Argo or grants, add new transport driver (e=
g. out of tree module)<br><br>Performance, standardization<br>=C2=A0 =C2=A0=
 - different characteristics on different architectures; motivates<br>=C2=
=A0 =C2=A0 =C2=A0 development and deployment of different transports for se=
parate cases<br>=C2=A0 =C2=A0 - difficulty of ensuring correctness with sha=
red memory vs. performance<br>=C2=A0 =C2=A0 =C2=A0 achievable with some con=
figurations<br><br>Atomics in shared memory, Arm, &quot;Fat Virtqueue&quot;=
 development<br>=C2=A0 =C2=A0 - Arm and RISC-V have challenges with atomic =
inst in shared memory<br>=C2=A0 =C2=A0 - VirtIO-SuSE (using grants) useful =
enough for consideration<br>=C2=A0 =C2=A0 - Wind River preshared-memory mem=
cpy approach (OpenAMP/kvmtool)<br>=C2=A0 =C2=A0 - Linaro &quot;Fat Virtqueu=
e&quot; under development: pass data within enlarged rings<br><br>Data copi=
es with Argo and shared memory transports<br>=C2=A0 =C2=A0 - discussion of =
copies made by different transports, different conditions<br>=C2=A0 =C2=A0 =
- data copies performed to protect correctness in communication<br><br>Ecos=
ystems, differentiation<br>=C2=A0 =C2=A0 - standarization of VirtIO shifted=
 economics for hypervisor developers<br>=C2=A0 =C2=A0 - Mandatory Access Co=
ntrol with Xen technologies will be a Xen advantage<br><br><br>=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<br>Detailed notes for the Design Session:<br><br>Rich (O=
penXT): introducing session; to talk about:<br>=C2=A0 =C2=A0 - how any solu=
tion will be ratified by the VirtIO/OASIS community<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 - esp automotive use cases: a lot of attention paid to formal<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acceptance of any VirtIO solution<br><br=
>=C2=A0 =C2=A0 - non-Linux guest VMs<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Windo=
ws is used in OpenXT, Qubes<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - FreeBSD is pop=
ular for networking and storage<br><br>Roger (Citrix; x86 maintainer) [chat=
]: I wanted to ask whether the Linux kernel<br>/QEMU code could be accepted=
 without any spec change?<br><br>--- topic: xl toolstack guest config file =
syntax for VirtIO devices<br><br>Juergen (SUSE; PV interfaces maintainer): =
shared window with VM config:<br>------------------------<br>disk=3D[ &#39;=
file:/home/vm/upstream/image,hda,w&#39;, ]<br>vif=3D[ &#39;mac:00:16:3e:06:=
a7:21,bridge=3Dbr0&#39;, ]<br>vfb=3D[ &#39;vnclisten=3Dlocalhost:0&#39;, ]<=
br># device_model_args=3D[ &#39;-drive&#39;, &#39;file=3D/home/vm/sle15sp3/=
image,if=3Dvirtio,index=3D1,media=3Ddisk,format=3Draw,cache=3Dwriteback&#39=
; ]<br>device_model_args=3D[ &#39;-drive&#39;, &#39;file=3D/home/vm/sle15sp=
3/image,if=3Dnone,id=3Ddrive-virtio-disk0,format=3Draw&#39;, &#39;-device&#=
39;, &#39;virtio-blk-pci,scsi=3Doff,drive=3Ddrive-virtio-disk0,id=3Dvirtio-=
disk0,bootindex=3D0,disable-legacy=3Don&#39; ]<br>------------------------<=
br><br>Juergen: Request for input on xl config file syntax for configuring =
VirtIO<br>devices<br>=C2=A0 =C2=A0 - see device_model_args in example (forc=
e VirtIO block to non-legacy mode)<br>=C2=A0 =C2=A0 - alt option: add a &#3=
9;virtio&#39; specifier to the disk line<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - s=
ee recent patch by Artem<br>=C2=A0 =C2=A0 - need to consider generic device=
s: non-network, non-disk device classes<br><br>Q: Should VirtIO disk be add=
ed under &#39;disk&#39;, or a new special VirtIO disk?<br><br>Julien (Amazo=
n; Arm maintainer):<br>=C2=A0 =C2=A0 - want to avoid having one vif, one fr=
amebuffer, one gps, etc.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - so instead have g=
eneric device options (eg. block, gps)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 - ie. similar to Qemu<br><br>Marek (Qubes; Python bindings maint=
ainer):<br>=C2=A0 =C2=A0 - libvirt bindings perspective: Preference for the=
 other way<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - don&#39;t want duplicated eg. d=
isk handling, for the VirtIO case<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - unified =
handling for a device class is more convenient for API users<br><br>Stefano=
 (Xilinx; Arm maintainer):<br>=C2=A0 =C2=A0 - Disk is a special case: confi=
g already has a line for disk,<br>=C2=A0 =C2=A0 =C2=A0 already have a way t=
o specify different types - network may be similar<br>=C2=A0 =C2=A0 - alt m=
ethod is better for other devices, eg. virtio-rng<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 - for those, device_model_arg is probably the best<br><br>Andy (Citr=
ix, x86 maintainer):<br>=C2=A0 =C2=A0 - a lot of this is PCI-based, even if=
 non-DMA transport so:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - need to preserve su=
pport for multi-IOREQ servers<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - feasible to =
have VirtIO backends that are not Qemu<br>=C2=A0 =C2=A0 - so: don&#39;t tie=
 the configuration to Qemu<br><br>OleksandrT (EPAM) [chat]: Initially I cre=
ated a new &quot;vdisk&quot; property for<br>virto.disk, but was asked to r=
euse existing &quot;disk&quot; configuration in libxl<br>if possible.<br><a=
 href=3D"https://lists.xenproject.org/archives/html/xen-devel/2021-05/msg01=
174.html">https://lists.xenproject.org/archives/html/xen-devel/2021-05/msg0=
1174.html</a><br><br>Juergen: ack; esp for Arm, mmio-based config: so we sh=
ould be flexible.<br>Aiming to determine:<br>=C2=A0 1: Configuration format=
 for VirtIO devices in guests<br>=C2=A0 2: Surfacing VirtIO devices in gues=
t VMs:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - tie it to the PCI specification or =
not?<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - challenge if guests do not have PCI d=
etection<br><br>=C2=A0 =C2=A0 - Responses:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
 PCI is fairly standard<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - issue with mmio: h=
otplugging devices<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - ra=
nges to be configured =3D&gt; need number of devices in advance<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - hotplug already requires upfron=
t work, due to grants, events<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - PCI and mmio=
 are similar; choice depends on guest and ecosystem<br><br>George (Citrix; =
Xen Community Manager):<br>=C2=A0 =C2=A0 - makes sense for a case to standa=
rdize on Argo? <br>=C2=A0 =C2=A0 - Argo vs grant table vs shared memory : w=
hy duplicate the extra effort?<br>=C2=A0 =C2=A0 - how much effort duplicate=
d for multiple? is it pretty easy to swap them<br>=C2=A0 =C2=A0 =C2=A0 out?=
<br><br>Rich [chat]: Important for automotive, FuSA, security<br><br>Christ=
opher (Apertus/Star Lab; Argo maintainer):<br>=C2=A0 =C2=A0 - Options are n=
ot exclusive: VirtIO can use different transports per-device<br>=C2=A0 =C2=
=A0 - Transports orthogonal eg. Argo devices enumerable via the VirtIO-Argo=
<br>=C2=A0 =C2=A0 =C2=A0 driver; Argo enables Mandatory Access Control over=
 the data transport<br><br><br>--- topic: VirtIO spec change; addresses on =
VirtIO rings<br><br>Concern: requirement for a VirtIO spec change<br><br>- =
Discussion re: is spec change mandatory?<br>=C2=A0 =C2=A0 - may be needed: =
VirtIO spec says pass guest physical addr on ring<br>=C2=A0 =C2=A0 - may no=
t be: translation step in the transport layer;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enables translation so don&#39;t nee=
d to change spec<br>=C2=A0 =C2=A0 - is spec change needed for config negoti=
ation, to announce feature?<br>=C2=A0 =C2=A0 - response: no; transport driv=
er does enumerations, so up to the driver<br><br>Stefano: &quot;VirtIO&quot=
; means different things: spec, transport, drivers<br>=C2=A0 =C2=A0 - since=
 transports are part of the spec: VirtIO-PCI, VirtIO-MMIO, ...,<br>=C2=A0 =
=C2=A0 =C2=A0 adding one (VirtIO-Argo) means adding to the spec<br>Daniel: =
no ..<br><br>Juergen: VirtIO spec does not demand physical addresses on the=
 ring pages<br>=C2=A0 =C2=A0 - DMA addresses are allowed<br>=C2=A0 =C2=A0 -=
 eg. a special DMA mechanism, which happens to be grants, is fine.<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 - ie. We have a special DMA engine.<br>Andy: Yes. =
DMA addresses !=3D identity map onto physical or guest phys addresses<br><b=
r>Daniel: there is a spec for the transports: if implementing a PCI transpo=
rt, or<br>=C2=A0 a MMIO transport, has certain characteristics of how those=
 should behave;<br>=C2=A0 so the driver-to-transport interface is fixed.<br=
>=C2=A0 It doesn&#39;t fix the transport back, which was the analysis that =
Christopher and<br>=C2=A0 I were looking at.<br>=C2=A0 Fixed from front-end=
 perspective: interface between the driver and transport.<br>=C2=A0 If the =
transport presents as a PCI device transport, there&#39;s an interface that=
<br>=C2=A0 the driver expects that transport to provide.<br>=C2=A0 =C2=A0 =
=C2=A0- It doesn&#39;t fix how it happens from the transport back.<br><br>G=
eorge: Frontend VirtIO driver hands phys addr to frontend transport and the=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0frontend transport can convert it to eg. gra=
nt tables to do what it wants<br><br>Daniel: right<br>=C2=A0 =C2=A0 - plus =
more behaviours, esp for PCI: eg. structures expected to be there<br>=C2=A0=
 =C2=A0 =C2=A0 so the drivers can expect a common behaviour for any PCI tra=
nsport<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - transport is translation layer, can=
 handle dealing with actual<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physical =
backend mechanism that you&#39;re going over<br><br>Stefano: so plan is to =
add new transport: would that need to be in the spec?<br>Daniel: no<br><br>=
<br>--- topic: Guest access to new VirtIO transport<br><br>George: VirtIO f=
rontend drivers would work with the new transport.<br>=C2=A0 =C2=A0 - a cur=
rent VM image won&#39;t have transport implemented<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 - have to update to a new version of kernel, or<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 - a new version of image to get new transport?<br><br>Daniel: We=
ll, that&#39;s one way; for Argo, can present as either a PCI transport or<=
br>a MMIO transport to the driver, so the driver understands how to interac=
t with<br>the transport; and the transport handles moving data back. For Ar=
go, we move<br>everything onto Argo rings. =C2=A0<br>To gain that on Linux,=
 can do an out of tree kernel module, and load that<br>without having to re=
compile the entire kernel (unless they don&#39;t have loadable<br>module su=
pport).<br>- responses:<br>=C2=A0 =C2=A0 - needs the frontend transport in =
the guest;<br>=C2=A0 =C2=A0 - so can&#39;t just use an existing image unmod=
ified -- need the compiled<br>=C2=A0 =C2=A0 =C2=A0 kernel driver loaded to =
make the transport available<br>=C2=A0 =C2=A0 - objective will be to add it=
 to the upstream Linux kernel<br><br>Andy: might be able to get a frontend =
Windows driver somewhere useful<br><br>Stefano: fewer changes to the spec a=
re better: looks like nothing, fantastic<br>Second is changes to the code; =
seems limited to transport driver, is a lot<br>better than having to change=
 all the frontend drivers<br><br>=C2=A0 =C2=A0 - Christopher: yes; point is=
 to keep all of those and should be able to<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plug them into backend drivers in =
the Qemu implementation.<br>=C2=A0 =C2=A0 - Juergen: Yes. Actual backends u=
nchanged and only lower levels of<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0transport layer need some modifications.<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 - ie. for all implementations of backend infrastructure:<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Qemu<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 - the kernel for the vhost backends<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - vhost-user, all the user daemons implementing=
 the backend<br>=C2=A0 =C2=A0 - Andy: sounds great overall<br><br>---- topi=
c: Performance<br><br>George: whether to use Argo or grant tables or someth=
ing else:<br>=C2=A0 =C2=A0 - Andy: think the answer is that we need both<br=
>=C2=A0 =C2=A0 - Juergen: Yes.<br>=C2=A0 =C2=A0 - Andy: there are people th=
at need to not have shared memory, and Argo is an<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 option there, and there are people who will want share=
d memory<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 because its faster.<b=
r>=C2=A0 =C2=A0 - ...: Is it?<br>=C2=A0 =C2=A0 - Andy: Yes.<br><br>Damien T=
henot [chat]: Shared memory would be interesting for DPU too<br><br>Stefano=
: Performance is a good metric;<br>- Able to convince third party proprieta=
ry vendor to add a driver?<br>=C2=A0 =C2=A0 - some sort of shared memory us=
eful as a last resort, fallback:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - ie. easie=
r to say &quot;just add a memcpy&quot; and to copy to the pre-shared<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memory region<br><br>George: Ian Pratt pres=
entation said:<br>=C2=A0 =C2=A0 - copying is faster than sharing memory<br>=
=C2=A0 =C2=A0 - sharing memory is so difficult that noone is smart enough t=
o do it, and we<br>=C2=A0 =C2=A0 =C2=A0 were all fools back in the 2000s to=
 think we were smart enough to do it<br><br>Christopher [chat]: <a href=3D"=
https://platformsecuritysummit.com/2018/speaker/pratt">https://platformsecu=
ritysummit.com/2018/speaker/pratt</a><br><br>Andy: Not using shared memory =
can get around a lot of common bugs, but if you<br>=C2=A0 =C2=A0 =C2=A0 kno=
w how to do shared memory, it is still faster than data copying in<br>=C2=
=A0 =C2=A0 =C2=A0 enough cases for it to be relevant, for us to care.<br>Ma=
rek: if you can avoid mapping and unmapping all the time<br>=C2=A0 =C2=A0 =
=C2=A0 eg. can use well known regions.<br><br>Andy: a lot of network perfor=
mance in XenServer is from not mapping<br>=C2=A0 =C2=A0 - dom0 constructs a=
 scatter-gather over the guest memory<br>=C2=A0 =C2=A0 =C2=A0 (a granted ar=
ea, so permissions work) - never actually touched<br>=C2=A0 =C2=A0 - Can&#3=
9;t do that with copying mechanism; would force a memcpy into a<br>=C2=A0 =
=C2=A0 =C2=A0 zero overhead transmit path<br><br>Stefano: measurements so f=
ar always demonstrated grant table is slower than any <br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0memcpy mechanisms<br>=C2=A0 =C2=A0 - Julien: related to at=
omic instructions, ref: the previous talk?<br>=C2=A0 =C2=A0 - Stefano: coul=
d be; all my latest measurements are on Arm.<br>=C2=A0 =C2=A0 - Andy: Diffe=
rent architectures will make massive differences here<br><br>Jason Andryuk =
(OpenXT) [chat]: @Andrew, you use netfront/back but your dom0 nic<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scatter/gathers over the guest&#39;s granted=
 network<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frames directly?<br>Andy [c=
hat]: Yeah. A consequence is that dom0 never touches the mapping, so<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0never sets the A bit, so you c=
an skip the TLB flush on the unmap<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0side and this is great for performance<br>Roger [chat]: Note y=
ou need to patch Xen to not do the flush on unmap if the A<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bit isn&#39;t set<br><br><br>---- topic=
: Atomics in shared memory, Arm, &quot;Fat Virtqueue&quot; development<br><=
br>Juergen: regarding Arm and shared pages: how does VirtIO and KVM on Arm =
work?<br><br>Julien: don&#39;t do atomics in shared page. Lesson learned a =
while ago.<br>- Xen has many uses of atomics in shared pages, eg. evtchn, e=
tc.<br>=C2=A0 For VirtIO, would be nicer to avoid doing the same again.<br>=
<br>Stefano: Could we require Arm 8.1? (Is 8.1 introduces the new atomics, =
or 8.2?)<br><br>Julien: Yes, but limited hardware available today<br>- late=
st may have it, but not Qemu<br>- looks like RISC-V may have the same issue=
s<br><br>Demi Marie (Qubes OS) [chat]: RISC-V only has 32-bit atomics<br><b=
r>Andy: VirtIO-Grant [ie. VirtIO-SuSE in these notes] may not be perfect fo=
r all<br>=C2=A0 =C2=A0 =C2=A0 future use cases and other options exist - bu=
t still enough cases that it<br>=C2=A0 =C2=A0 =C2=A0 is worth considering<b=
r><br>Demi Marie [chat]: Long-term fix is probably to change the guest-visi=
ble ABI to<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0not require atomics in shared memory<br><br>Julien: how can it be=
 used with other hypervisors?<br>- eg. for Argo, looking at something that =
can be used in other hypervisors<br>- not possible with grant table, becaus=
e of the problems I mentioned.<br>- want to avoid having a Xen-specific dri=
ver, ie. tying VirtIO transport to Xen<br>=C2=A0 due to use of grant table<=
br><br>Stefano: two related activities, both based on shared memory:<br>=C2=
=A0 =C2=A0 - one driven by Wind River: memcpy-based approach<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 - presharing memory, and picking addresses off the shared=
 region<br><br>Stefano [chat]: This is WindRiver KVMtools that does shared =
memory for Virtio<br><a href=3D"https://github.com/OpenAMP/kvmtool">https:/=
/github.com/OpenAMP/kvmtool</a><br><br>Stefano: second approach is from Lin=
aro: &quot;Fat Virtqueue&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - increase th=
e ring size and pick addresses within the ring only<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 - So the shared memory region is only the ring, and t=
he buffers are<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 within t=
he ring. Pointer points to things within the ring.<br><br>George: summarizi=
ng:<br>- on Arm copying might be faster, and there are other advantages as =
well;<br>- on x86, things may be different<br>so:<br>- SuSE and Citrix may =
work on the grant table one, and <br>- Epam and Arm, etc. may work on the A=
rgo one<br>and people can understand why they&#39;re choosing which one.<br=
><br>George: Can you also do driver domain things with Argo?<br>Daniel: Yes=
<br><br><br>--- topic: Data copies with Argo and shared memory transports<b=
r><br>Stefano: with Argo is there a memcpy, or more than one memcpy? who wo=
uld do it?<br><br>Christopher: hypervisor does the copy for the transport. =
<br>- guest hypercall op to register a ring, allows hypervisor to blit data=
 in;<br>=C2=A0 =C2=A0 - can think of as a DMA-style operation to deliver da=
ta to the guest<br><br>Juergen: So for each I/O data, there are three copie=
s:<br>=C2=A0 =C2=A0 - first, into the ring, then by the hypervisor to the o=
ther domain,<br>=C2=A0 =C2=A0 =C2=A0 and then out of the ring of the other =
domain to the target address, right?<br>Andy: That&#39;s correct if both th=
e source and destination are buffering the I/O in<br>=C2=A0 =C2=A0 =C2=A0 a=
nd out of the transport.<br>Daniel: Right<br><br>Andy: Buffering is probabl=
y because the backend is normally shared memory.<br>If you&#39;ve got a gua=
rantee that it&#39;s not shared memory between frontend and<br>backend, the=
n neither the front or the back VirtIO driver need to buffer in and <br>out=
 of the transport<br><br>Juergen: ok, for a disk I/O: have user data in the=
 guest, want to write to disk<br>Arbitrary data in memory, needs to be writ=
ten to the Argo ring buffer, right?<br>That&#39;s copy one.<br>Andy: No; on=
ly destination has an Argo ring. Source just passes arbitrary<br>=C2=A0 =C2=
=A0 =C2=A0 addresses, like scatter-gather DMA.<br>Juergen: OK, so like gran=
t copy<br>Andy: Yes.<br><br>Julien: With Argo, are the pages always mapped =
in Xen?<br>=C2=A0 =C2=A0 - Christopher: Yes, for the rings the way that Arg=
o works at the moment is, <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0yes, once you register a ring that mapping is retai=
ned so<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0the hypervisor can send to it when a hypercall is invoked.<br>=C2=A0 =
=C2=A0 - Julien: OK<br><br>Demi Marie: is it possible for Argo to copy memo=
ry from guest one userspace to<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 the ring in guest two?<br>=C2=A0 =C2=A0 - re: disk I/O: from ZFS issue tra=
cker: have to take copies because is not <br>=C2=A0 =C2=A0 =C2=A0 safe to o=
perate on data shared with untrusted parties<br>=C2=A0 =C2=A0 - So most cas=
es you&#39;re going to have to have a copy.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
- Only exception: extremely carefully written data sources, destinations<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - careful to only make loads exa=
ctly once<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - or tools like ever=
parse, or another tool that generates<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 formally-verified binary parsers, immune to double-fetch bug=
s<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - so: prefer to just take the copy<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - because memcpy on modern processor=
s is very, very fast<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - especia=
lly while it&#39;s stayed in cache<br><br>George: Andy was saying: some peo=
ple definitely going to want Argo, because<br>it&#39;s copying instead of s=
hared memory, and double-fetch issues with shared<br>memory is definitely a=
n issue<br><br>Andy: Yes. A lot of reasons why using shared memory is hard =
to do correctly;<br>not impossible but it is hard.<br><br><br>--- topic: Co=
nfiguration syntax (continued)<br><br>Juergen: choice: generic virtio devic=
e configuration, vs individual<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device-=
specific stuff, or just mix variants?<br><br>Roger [chat]: I think both<br>=
<br>Christopher: good to have generic + allow specialization if you care<br=
><br>Marek: Yes; eg. for network devices, might want a different copying me=
chanism if<br>you can avoid copies for network. Same may not be doable for =
disk, so might want<br>different mechanisms for disk and network devices.<b=
r><br>Juergen: Should VirtIO disk be labelled under the disk item of the gu=
est config,<br>or a specific virtio disk item? Or virtio-device type =3D di=
sk, or whatever.<br><br>Roger:<br>- keep the old disk options, expand to su=
pport VirtIO<br>- add a generic VirtIO option for more esoteric devices tha=
t we don&#39;t support in<br>=C2=A0 any other way.<br>Disks and vifs need a=
 type parameter to select VirtIO as backend.<br><br>Juergen: then have a tr=
ansport layer specification:<br>(eg. don&#39;t care, or grants, or Argo, or=
 whatever)<br><br>George: We have the same thing for PCI (strict, relaxed, =
...)<br>ie. Set a global default for xl, plus override in specific domain c=
onfig<br><br><br>--- topic: Interface to adapt to platform transport<br><br=
>Juergen: spec bit is: VIRTIO_F_ACCESS_PLATFORM feature bit<br>- indicates =
&quot;the device can be used on a platform where the device<br>=C2=A0 acces=
s to data memory is limited, and/or translated&quot;<br>=C2=A0 Exactly what=
 we want; works for grants, etc.<br>=C2=A0 =C2=A0 - is a generic bit from n=
ewer virtio spec, not a Xen-specific bit<br>=C2=A0 =C2=A0 - in current impl=
, assumes running on Xen and means grants, because<br>=C2=A0 =C2=A0 =C2=A0 =
assumes that everything is done for addresses going into the ring<br><br><b=
r>--- topic: Ecosystems, differentiation<br><br>Rich: On standardization of=
 VirtIO: it commoditized the driver interface - now<br>all hypervisors impl=
ement VirtIO because it&#39;s too expensive to do otherwise.<br>- using Arg=
o transport to add Mandatory Access Control (needed by many guests)<br>=C2=
=A0 is an advantage for Xen, since only with Xen will you get the strong<br=
>=C2=A0 guarantees from Argo. Especially with Hyperlaunch, and all the othe=
r<br>=C2=A0 integrity pieces.<br>=C2=A0 =C2=A0 - Challenging for other hype=
rvisors to do MAC transport for VirtIO.<br><br><br>End of session<br><br>=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>Open Issues / Technical questions:<br><br=
>- Method of discovery of available transport drivers, negociation which to=
 use<br>=C2=A0 =C2=A0 - OASIS/VirtIO Standardization required? (eg. feature=
 bits needed?)<br><br>- Upstreaming path for different pieces to: Linux ker=
nel, Qemu, elsewhere<br>=C2=A0 =C2=A0 - including enabling guest support fo=
r FreeBSD, Windows, etc.<br><br>- Development of VirtIO &quot;Fat Virtqueue=
s&quot;: how does this affect system design?<br><br>- Design for interactio=
n with guest virtual IOMMU<br>=C2=A0 =C2=A0 - ref: VirtIO-iommu<br><br>- VF=
IO for device model backends<br><br>- Support for complex VirtIO drivers: e=
g. framebuffers (shared memory regions)<br><br><br>=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>Areas suitable for investment to support VirtIO on Xen:<br><br>- =
Development of the Hypervisor-agnostic interface for Argo<br>Ref: Xen and O=
penXT community discussion minutes:<br><a href=3D"https://lists.xenproject.=
org/archives/html/xen-devel/2021-02/msg01422.html">https://lists.xenproject=
.org/archives/html/xen-devel/2021-02/msg01422.html</a><br><br>- Development=
 of the VirtIO-Argo system<br>Project analysis and design documentation:<br=
>=C2=A0 <a href=3D"https://openxt.atlassian.net/wiki/spaces/DC/pages/169616=
9985/VirtIO-Argo%2BDevelopment%2BPhase%2B1">https://openxt.atlassian.net/wi=
ki/spaces/DC/pages/1696169985/VirtIO-Argo%2BDevelopment%2BPhase%2B1</a><br>=
<br>- VirtIO-focussed test cases for the Xen Test Framework<br>=C2=A0 =C2=
=A0 - to provide coverage of the hypervisor interfaces used by VirtIO trans=
ports<br>=C2=A0 =C2=A0 - extend the framework capabilities to enable new te=
sts (eg. multi-VM cases)<br>=C2=A0 <a href=3D"https://xenbits.xen.org/docs/=
xtf/index.html">https://xenbits.xen.org/docs/xtf/index.html</a><br>=C2=A0 =
=C2=A0 - development of support for Arm platforms with XTF<br><br>- Rust an=
d Go languages toolstack development for Xen<br>=C2=A0 =C2=A0 - Investment =
in the Xen toolstack is needed to support hypervisor feature<br>=C2=A0 =C2=
=A0 =C2=A0 development. Toolstack support is necessary for enabling VirtIO =
guests.<br>=C2=A0 =C2=A0 - Work towards enabling Xen tools in Rust has star=
ted:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/xcp-ng/xe=
nopsd-ng">https://github.com/xcp-ng/xenopsd-ng</a><br>=C2=A0 =C2=A0 - Work =
towards enabling Xen tools in Go has started:<br>=C2=A0 =C2=A0 =C2=A0 <a hr=
ef=3D"https://lists.xenproject.org/archives/html/xen-devel/2021-04/msg01744=
.html">https://lists.xenproject.org/archives/html/xen-devel/2021-04/msg0174=
4.html</a><br><br>- System image test integration with Yocto/Openembedded a=
nd Qemu<br>=C2=A0 =C2=A0 - Xen and the Xen Test Framework can already be ru=
n within Qemu for x86<br>=C2=A0 =C2=A0 =C2=A0 in the standard meta-virtuali=
zation environment; Arm platform support<br>=C2=A0 =C2=A0 =C2=A0 needs to b=
e completed, with coverage for VirtIO guests, and Continuous<br>=C2=A0 =C2=
=A0 =C2=A0 Integration enabled<br>=C2=A0 =C2=A0 <a href=3D"https://lists.yo=
ctoproject.org/g/meta-virtualization/message/6405">https://lists.yoctoproje=
ct.org/g/meta-virtualization/message/6405</a><br>=C2=A0 =C2=A0 - to evaluat=
e: VirtIO as a DISTRO_FEATURE or MACHINE_FEATURE<br><br>- Creation of docum=
entation for Argo<br>=C2=A0 =C2=A0 - implementation documentation exists:<b=
r>=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://xenbits.xen.org/docs/4.15-testing=
/designs/argo.html">https://xenbits.xen.org/docs/4.15-testing/designs/argo.=
html</a><br>=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://static.sched.com/hosted=
_files/xensummit19/92/Argo%20and%20HMX%20-%20OpenXT%20-%20Christopher%20Cla=
rk%20-%20Xen%20Summit%202019.pdf">https://static.sched.com/hosted_files/xen=
summit19/92/Argo%20and%20HMX%20-%20OpenXT%20-%20Christopher%20Clark%20-%20X=
en%20Summit%202019.pdf</a><br>=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://www.y=
outube.com/watch?v=3DcnC0Tg3jqJQ">https://www.youtube.com/watch?v=3DcnC0Tg3=
jqJQ</a><br>=C2=A0 =C2=A0 - user interface / client / kernel developer docu=
mentation is needed<br><br>- Development items for Argo:<br>=C2=A0 <a href=
=3D"https://openxt.atlassian.net/wiki/spaces/DC/pages/737345538/Argo+Hyperv=
isor-Mediated+data+eXchange+Development">https://openxt.atlassian.net/wiki/=
spaces/DC/pages/737345538/Argo+Hypervisor-Mediated+data+eXchange+Developmen=
t</a><br><br>- Performance profiling of VirtIO-on-Xen systems across hardwa=
re architectures<br><br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>Additional Refere=
nces:<br><br>VirtIO Specification v1.1, OASIS, 11th April 2019:<br><a href=
=3D"https://docs.oasis-open.org/virtio/virtio/v1.1/virtio-v1.1.html">https:=
//docs.oasis-open.org/virtio/virtio/v1.1/virtio-v1.1.html</a><br>VirtIO spe=
c maintainers repository:<br><a href=3D"https://github.com/oasis-tcs/virtio=
-spec">https://github.com/oasis-tcs/virtio-spec</a><br>Organization for the=
 Advancement of Structured Information Standards<br><a href=3D"https://www.=
oasis-open.org">https://www.oasis-open.org</a><br>ACPI Virtal I/O Translati=
on Table (VIOT) DRAFT v9, December 2020:<br><a href=3D"https://jpbrucker.ne=
t/virtio-iommu/viot/viot-v9.pdf">https://jpbrucker.net/virtio-iommu/viot/vi=
ot-v9.pdf</a><br><a href=3D"https://lore.kernel.org/linux-acpi/202106100751=
30.67517-2-jean-philippe@linaro.org/T/">https://lore.kernel.org/linux-acpi/=
20210610075130.67517-2-jean-philippe@linaro.org/T/</a><br><br>Linaro: Strat=
os Project: Auto / Industrial Demonstrable Milestones<br><a href=3D"https:/=
/linaro.atlassian.net/wiki/spaces/STR/pages/28503377401/Demonstrable+artifa=
cts">https://linaro.atlassian.net/wiki/spaces/STR/pages/28503377401/Demonst=
rable+artifacts</a><br><br>OpenXT: VirtIO and Argo:<br><a href=3D"https://o=
penxt.atlassian.net/wiki/spaces/DC/pages/1348763698/VirtIO%2BArgo">https://=
openxt.atlassian.net/wiki/spaces/DC/pages/1348763698/VirtIO%2BArgo</a><br><=
br>OpenXT: VirtIO-Argo Development:<br><a href=3D"https://openxt.atlassian.=
net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo%2BDevelopment%2BPhase%2B1">=
https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo%2B=
Development%2BPhase%2B1</a><br><br>OpenXT: Analysis of Argo as a transport =
medium for VirtIO:<br><a href=3D"https://openxt.atlassian.net/wiki/spaces/D=
C/pages/1333428225/Analysis+of+Argo+as+a+transport+medium+for+VirtIO">https=
://openxt.atlassian.net/wiki/spaces/DC/pages/1333428225/Analysis+of+Argo+as=
+a+transport+medium+for+VirtIO</a><br><br>Virtio with Argo for Xen, Mandato=
ry Access Control<br>Meeting of Virtualization Experts Group of Automotive =
Grade Linux, 18th Aug, 2020<br><a href=3D"https://lists.automotivelinux.org=
/g/agl-dev-community/attachment/8595/0/Argo%20and%20VirtIO.pdf">https://lis=
ts.automotivelinux.org/g/agl-dev-community/attachment/8595/0/Argo%20and%20V=
irtIO.pdf</a><br><br>VirtIO on Xen hypervisor (Arm), Oleksandr Tyshchenko, =
EPAM, Linaro Connect 2021<br><a href=3D"https://static.linaro.org/connect/l=
vc21/presentations/lvc21-314.pdf">https://static.linaro.org/connect/lvc21/p=
resentations/lvc21-314.pdf</a><br><a href=3D"https://www.youtube.com/watch?=
v=3DXE5Rn8KFunk">https://www.youtube.com/watch?v=3DXE5Rn8KFunk</a><br><br>X=
en wiki: Argo<br><a href=3D"https://wiki.xenproject.org/wiki/Argo:_Hypervis=
or-Mediated_Exchange_(HMX)_for_Xen">https://wiki.xenproject.org/wiki/Argo:_=
Hypervisor-Mediated_Exchange_(HMX)_for_Xen</a><br><br>OpenXT: Argo: Hypervi=
sor-Mediated data eXchange: Development:<br><a href=3D"https://openxt.atlas=
sian.net/wiki/spaces/DC/pages/737345538/Argo%2BHypervisor-Mediated%2Bdata%2=
BeXchange%2BDevelopment">https://openxt.atlassian.net/wiki/spaces/DC/pages/=
737345538/Argo%2BHypervisor-Mediated%2Bdata%2BeXchange%2BDevelopment</a><br=
><br>Xen wiki: Virtio On Xen<br><a href=3D"https://wiki.xenproject.org/wiki=
/Virtio_On_Xen">https://wiki.xenproject.org/wiki/Virtio_On_Xen</a><br><br>X=
CP-ng: IOREQ Server: Device Emulation in the Xen Hypervisor<br><a href=3D"h=
ttps://xcp-ng.org/blog/2020/06/03/device-emulation-in-the-xen-hypervisor/">=
https://xcp-ng.org/blog/2020/06/03/device-emulation-in-the-xen-hypervisor/<=
/a><br><br>DEMU<br><a href=3D"https://xenbits.xen.org/gitweb/?p=3Dpeople/pa=
uldu/demu.git">https://xenbits.xen.org/gitweb/?p=3Dpeople/pauldu/demu.git</=
a><br><br>Video for this Design Session:<br><a href=3D"https://www.youtube.=
com/watch?v=3DIb0OdpHZ-G0&amp;list=3DPLYyw7IQjL-zGcRPN6EjiTuFVGo4A6KCNf&amp=
;index=3D29">https://www.youtube.com/watch?v=3DIb0OdpHZ-G0&amp;list=3DPLYyw=
7IQjL-zGcRPN6EjiTuFVGo4A6KCNf&amp;index=3D29</a><br></div></div></div></div=
>

--0000000000004a724505cb5de215--

