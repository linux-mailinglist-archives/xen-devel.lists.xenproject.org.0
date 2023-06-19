Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE9A735FF4
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 01:04:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551349.860853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBNu5-0005wh-ES; Mon, 19 Jun 2023 23:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551349.860853; Mon, 19 Jun 2023 23:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBNu5-0005uJ-BD; Mon, 19 Jun 2023 23:03:21 +0000
Received: by outflank-mailman (input) for mailman id 551349;
 Mon, 19 Jun 2023 23:03:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=igq6=CH=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBNu3-0005tm-RX
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 23:03:20 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79f51a91-0ef5-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 01:03:17 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f86dbce369so2439007e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jun 2023 16:03:17 -0700 (PDT)
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
X-Inumbo-ID: 79f51a91-0ef5-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687215797; x=1689807797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vW8jSRue/z1TykYz+Zr0TF+SGVDBrrMmGcWMjLrd3Ys=;
        b=OTsZNCFcMGPy0j+QH8UDzuO2C9aWIkWqNJxS1b2nLgkdH06LILNSTG5EapS47dCHzG
         2Ul8i6RI8iOcqkdUqFADfr7dQ3EopfZj5iZYukzkv9yrtCud8TO+yA1EpH/2n2EDE1ri
         iNVFLkqVYq3pOGYRHhTwjfDA14wh0wPn9nSDDU9VtBIIkt3CA2aWogsXXNfs7nWFKPq0
         VWfmN+pjgnRtNiQGCHoYFjoFU0KmPFs/4bHTWyxvHalt561jK5Mz/KOfHGCyNfw22rnj
         T/NOncGjXXOIugnovsdo8HQ9IBg9EksoNFyKgaBb8T0WosW82udp2qziSnh+U9F6ITGo
         WCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687215797; x=1689807797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vW8jSRue/z1TykYz+Zr0TF+SGVDBrrMmGcWMjLrd3Ys=;
        b=ZIhCi1/Qu3jBj0FobzpvoEV2IE+eKql/Dho+9+mz5gkCNFgybJKJ3ntHH53anQdGnS
         r+gxoX1n5L6DeBgqOPGKTMQ2nEVnLBTDsSMC/9EdQhUNMGjZ66vsWoRVjERqpzWqGoUW
         6NOtjaN9/IGTZR82lt/dbOPdSmovRF3jw9KcC0Z0KfBeOG0C13/evdIfz79EsnByQnpE
         axWm7m760vQkHxJVAxQxf56xiDHkDqNhqyiidxX944O+ay5p4qJUzozpnBQj0LfrPjBE
         9cA3zYsZ/wQcCgCsNAEX9Zi5+qj1MacuS0joKv1TgDMdtwlZtwTbbVtrZhwNv8rSwoaB
         JhVw==
X-Gm-Message-State: AC+VfDwqcuYGIbGUnaWmpsNQGn/NQt75MyvGV829bnzGhGMrMf0OIgZm
	RB43mfL/Lx5fwWc5n5/GE3oVhz3bel+KBY1GxuY=
X-Google-Smtp-Source: ACHHUZ5ob+U6XyZVuG4RmITic0ZsXLGF5sFMDssbyJ9MF3xBquaUfmXwI/DFT2fd3/V+9lJPfRPv88OeeTlm2rYHfe8=
X-Received: by 2002:a19:7b06:0:b0:4f3:a051:58df with SMTP id
 w6-20020a197b06000000b004f3a05158dfmr5826343lfc.59.1687215796226; Mon, 19 Jun
 2023 16:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687121835.git.jupham125@gmail.com> <ZJA6ZGPlqX4pZ/d4@MacBook-Air-de-Roger.local>
In-Reply-To: <ZJA6ZGPlqX4pZ/d4@MacBook-Air-de-Roger.local>
From: Joel Upham <jupham125@gmail.com>
Date: Mon, 19 Jun 2023 19:03:05 -0400
Message-ID: <CADPhr0mO9GxWwgDAuPMH+Ysktc26XkF+drkipzdWMSjuy++Y0w@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] Q35 Support
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000318dea05fe838a46"

--000000000000318dea05fe838a46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I actually realized that after submitting yesterday and have been splitting
them like the original had done for both Qemu and Xen. Thanks again for
getting back to me.

-Joel

On Mon, Jun 19, 2023 at 7:22 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
wrote:

> On Sun, Jun 18, 2023 at 06:22:01PM -0400, Joel Upham wrote:
> > Q35 support using Qemu's device emulation.  I based the patches from 20=
17
> > found on the mailing list here:
> >
> https://lists.xenproject.org/archives/html/xen-devel/2018-03/msg01176.htm=
l
> >
> > I have been using a version of these patches on Xen 4.16 with Qemu
> > version 4.1 for over 6 months.  The guest VMs are very stable, and PCIe
> > PT is working as was designed (all of the PCIe devices are on the root
> > PCIe device).  I have successfully passed through GPUs, NICs, etc. I wa=
s
> > asked by those in the community to attempt to once again upstream the
> > patches.  I have them working with Seabios and OVMF (patches are needed
> > to OVMF which I will be sending to the mailing list).  I will be sendin=
g
> > my Qemu patches to their mailing list in hopes of getting everything
> > upstreamed. The Qemu patches allow for the xenvbd to properly unplug th=
e
> > AHCI SATA device, and all xen pv windows drivers work as intended.
> >
> > I used the original author of the patches to get a majority of this to
> work:
> > Alexey Gerasimenko.  I fixed the patches to be in line with the upstrea=
m
> > Qemu and Xen versions.  Any original issues may still exist; however, I
> > am sure in time they can be improved. If the code doesn't exist then
> they
> > can't be actively looked at by the community.
> >
> > I am not an expert on the Q35 chipset or PCIe technology.  This is my
> > first patch to this mailing list.
> >
> > Recap of changes to Qemu, only here for reference:
> >   pc/xen: Xen Q35 support: provide IRQ handling for PCI devices
> >   pc/q35: Apply PCI bus BSEL property for Xen PCI device hotplug
> >   acpi/ich9: Multiple fixes for S3 support
> >   acpi/pcihp: Allow for machines to hotplug when using Xen
> >   isa/lpc_ich9: Write lpc configuration for xen IRQs
> >   q35/acpi/xen: Provide ACPI PCI hotplug interface for Xen on Q35
> >   q35/xen: Add Xen platform device support for Q35
> >   q35: Fix incorrect values for PCIEXBAR masks
> >   xen/pt: XenHostPCIDevice: provide functions for PCI Capabilities and
> >     PCIe Extended Capabilities enumeration
> >   xen/pt: avoid reading PCIe device type and cap version multiple times
> >   xen/pt: determine the legacy/PCIe mode for a passed through device
> >   xen/pt: Xen PCIe passthrough support for Q35: bypass PCIe topology
> >     check
> >   xen/pt: add support for PCIe Extended Capabilities and larger config
> >     space
> >   xen/pt: handle PCIe Extended Capabilities Next register
> >   xen/pt: allow to hide PCIe Extended Capabilities
> >   xen/pt: add Vendor-specific PCIe Extended Capability descriptor and
> >     sizing
> >   xen/pt: add fixed-size PCIe Extended Capabilities descriptors
> >   xen/pt: add AER PCIe Extended Capability descriptor and sizing
> >   xen/pt: add descriptors and size calculation for
> >     RCLD/ACS/PMUX/DPA/MCAST/TPH/DPC PCIe Extended Capabilities
> >   xen/pt: add Resizable BAR PCIe Extended Capability descriptor and
> >     sizing
> >   xen/pt: add VC/VC9/MFVC PCIe Extended Capabilities descriptors and
> >     sizing
> >
> > Changes that would be going to upstream Qemu:
> >  hw/acpi/ich9.c                |   22 +-
> >  hw/acpi/pcihp.c               |    6 +-
> >  hw/core/machine.c             |   19 +
> >  hw/i386/pc_piix.c             |    3 +-
> >  hw/i386/pc_q35.c              |   39 +-
> >  hw/i386/xen/xen-hvm.c         |    7 +-
> >  hw/i386/xen/xen_platform.c    |   19 +-
> >  hw/ide/ahci.c                 |    2 +-
> >  hw/isa/lpc_ich9.c             |   53 +-
> >  hw/isa/piix3.c                |    2 +-
> >  hw/pci-host/q35.c             |   28 +-
> >  hw/pci/pci.c                  |   17 +
> >  hw/xen/xen-host-pci-device.c  |  106 +++-
> >  hw/xen/xen-host-pci-device.h  |    6 +-
> >  hw/xen/xen_pt.c               |   49 +-
> >  hw/xen/xen_pt.h               |   19 +-
> >  hw/xen/xen_pt_config_init.c   | 1103 ++++++++++++++++++++++++++++++---
> >  include/hw/acpi/ich9.h        |    1 +
> >  include/hw/acpi/pcihp.h       |    2 +
> >  include/hw/boards.h           |    1 +
> >  include/hw/i386/pc.h          |    3 +
> >  include/hw/pci-host/q35.h     |    4 +-
> >  include/hw/pci/pci.h          |    3 +
> >  include/hw/southbridge/ich9.h |    1 +
> >  include/hw/xen/xen.h          |    4 +-
> >  qemu-options.hx               |    1 +
> >  softmmu/datadir.c             |    1 -
> >  softmmu/qdev-monitor.c        |    3 +-
> >  stubs/xen-hw-stub.c           |    4 +-
> >  29 files changed, 1396 insertions(+), 132 deletions(-)
> > *** These patches are not found in this series, if they are supposed to
> > be I will send them here as well. ***
>
> It's unclear, do the QEMU patches depend on the Xen side?  I have a
> suspicion you likely want to post them mostly at the same time, but
> using two different patch series (one for Xen and one for QEMU).
>
> > Recap of changes to Xen:
> >   libacpi: new DSDT ACPI table for Q35
> >   Makefile: build and use new DSDT table for Q35
> >   hvmloader: add function to query an emulated machine type (i440/Q35)
> >   hvmloader: add ACPI enabling for Q35
> >   hvmloader: add Q35 DSDT table loading
> >   hvmloader: add basic Q35 support
> >   hvmloader: allocate MMCONFIG area in the MMIO hole + minor code
> >     refactoring
> >   hvmloader: seabios dsdt set to load correct config
> >   hvmloader: ovmf dsdt set to load correct config
> >   libxl: Q35 support (new option device_model_machine)
> >   libxl: Xen Platform device support for Q35
> >   libacpi: build ACPI MCFG table if requested
> >   hvmloader: use libacpi to build MCFG table
> >   docs: provide description for device_model_machine option
> >
> > Joel Upham (1):
> >   Q35 support
>
> I'm afraid this needs to be split into a patch series, with proper
> commit messages in order to be considered for review.  The current
> huge patch is impossible to review at all.
>
> Also you need to keep the Signed-off-by of the original author in the
> patches.
>
> Thanks, Roger.
>

--000000000000318dea05fe838a46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I actually realized that after submitting yesterday and h=
ave been splitting them like the original had done for both Qemu and Xen. T=
hanks again for getting back to me.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">-Joel</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, Jun 19, 2023 at 7:22 AM Roger Pau Monn=C3=A9 =
&lt;<a href=3D"mailto:roger.pau@citrix.com">roger.pau@citrix.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">On Sun, Jun 18, 2023 at 06:22:=
01PM -0400, Joel Upham wrote:<br>
&gt; Q35 support using Qemu&#39;s device emulation.=C2=A0 I based the patch=
es from 2017<br>
&gt; found on the mailing list here:<br>
&gt; <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2018-0=
3/msg01176.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproj=
ect.org/archives/html/xen-devel/2018-03/msg01176.html</a><br>
&gt; <br>
&gt; I have been using a version of these patches on Xen 4.16 with Qemu<br>
&gt; version 4.1 for over 6 months.=C2=A0 The guest VMs are very stable, an=
d PCIe<br>
&gt; PT is working as was designed (all of the PCIe devices are on the root=
<br>
&gt; PCIe device).=C2=A0 I have successfully passed through GPUs, NICs, etc=
. I was<br>
&gt; asked by those in the community to attempt to once again upstream the<=
br>
&gt; patches.=C2=A0 I have them working with Seabios and OVMF (patches are =
needed<br>
&gt; to OVMF which I will be sending to the mailing list).=C2=A0 I will be =
sending<br>
&gt; my Qemu patches to their mailing list in hopes of getting everything<b=
r>
&gt; upstreamed. The Qemu patches allow for the xenvbd to properly unplug t=
he<br>
&gt; AHCI SATA device, and all xen pv windows drivers work as intended.<br>
&gt; <br>
&gt; I used the original author of the patches to get a majority of this to=
 work:<br>
&gt; Alexey Gerasimenko.=C2=A0 I fixed the patches to be in line with the u=
pstream<br>
&gt; Qemu and Xen versions.=C2=A0 Any original issues may still exist; howe=
ver, I<br>
&gt; am sure in time they can be improved. If the code doesn&#39;t exist th=
en they <br>
&gt; can&#39;t be actively looked at by the community.<br>
&gt; <br>
&gt; I am not an expert on the Q35 chipset or PCIe technology.=C2=A0 This i=
s my<br>
&gt; first patch to this mailing list.<br>
&gt; <br>
&gt; Recap of changes to Qemu, only here for reference:<br>
&gt;=C2=A0 =C2=A0pc/xen: Xen Q35 support: provide IRQ handling for PCI devi=
ces<br>
&gt;=C2=A0 =C2=A0pc/q35: Apply PCI bus BSEL property for Xen PCI device hot=
plug<br>
&gt;=C2=A0 =C2=A0acpi/ich9: Multiple fixes for S3 support<br>
&gt;=C2=A0 =C2=A0acpi/pcihp: Allow for machines to hotplug when using Xen<b=
r>
&gt;=C2=A0 =C2=A0isa/lpc_ich9: Write lpc configuration for xen IRQs<br>
&gt;=C2=A0 =C2=A0q35/acpi/xen: Provide ACPI PCI hotplug interface for Xen o=
n Q35<br>
&gt;=C2=A0 =C2=A0q35/xen: Add Xen platform device support for Q35<br>
&gt;=C2=A0 =C2=A0q35: Fix incorrect values for PCIEXBAR masks<br>
&gt;=C2=A0 =C2=A0xen/pt: XenHostPCIDevice: provide functions for PCI Capabi=
lities and<br>
&gt;=C2=A0 =C2=A0 =C2=A0PCIe Extended Capabilities enumeration<br>
&gt;=C2=A0 =C2=A0xen/pt: avoid reading PCIe device type and cap version mul=
tiple times<br>
&gt;=C2=A0 =C2=A0xen/pt: determine the legacy/PCIe mode for a passed throug=
h device<br>
&gt;=C2=A0 =C2=A0xen/pt: Xen PCIe passthrough support for Q35: bypass PCIe =
topology<br>
&gt;=C2=A0 =C2=A0 =C2=A0check<br>
&gt;=C2=A0 =C2=A0xen/pt: add support for PCIe Extended Capabilities and lar=
ger config<br>
&gt;=C2=A0 =C2=A0 =C2=A0space<br>
&gt;=C2=A0 =C2=A0xen/pt: handle PCIe Extended Capabilities Next register<br=
>
&gt;=C2=A0 =C2=A0xen/pt: allow to hide PCIe Extended Capabilities<br>
&gt;=C2=A0 =C2=A0xen/pt: add Vendor-specific PCIe Extended Capability descr=
iptor and<br>
&gt;=C2=A0 =C2=A0 =C2=A0sizing<br>
&gt;=C2=A0 =C2=A0xen/pt: add fixed-size PCIe Extended Capabilities descript=
ors<br>
&gt;=C2=A0 =C2=A0xen/pt: add AER PCIe Extended Capability descriptor and si=
zing<br>
&gt;=C2=A0 =C2=A0xen/pt: add descriptors and size calculation for<br>
&gt;=C2=A0 =C2=A0 =C2=A0RCLD/ACS/PMUX/DPA/MCAST/TPH/DPC PCIe Extended Capab=
ilities<br>
&gt;=C2=A0 =C2=A0xen/pt: add Resizable BAR PCIe Extended Capability descrip=
tor and<br>
&gt;=C2=A0 =C2=A0 =C2=A0sizing<br>
&gt;=C2=A0 =C2=A0xen/pt: add VC/VC9/MFVC PCIe Extended Capabilities descrip=
tors and<br>
&gt;=C2=A0 =C2=A0 =C2=A0sizing<br>
&gt; <br>
&gt; Changes that would be going to upstream Qemu:<br>
&gt;=C2=A0 hw/acpi/ich9.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A022 +-<br>
&gt;=C2=A0 hw/acpi/pcihp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 6 +-<br>
&gt;=C2=A0 hw/core/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A019 +<br>
&gt;=C2=A0 hw/i386/pc_piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 3 +-<br>
&gt;=C2=A0 hw/i386/pc_q35.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A039 +-<br>
&gt;=C2=A0 hw/i386/xen/xen-hvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 7 +-<br>
&gt;=C2=A0 hw/i386/xen/xen_platform.c=C2=A0 =C2=A0 |=C2=A0 =C2=A019 +-<br>
&gt;=C2=A0 hw/ide/ahci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 hw/isa/lpc_ich9.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A053 +-<br>
&gt;=C2=A0 hw/isa/piix3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 hw/pci-host/q35.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A028 +-<br>
&gt;=C2=A0 hw/pci/pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A017 +<br>
&gt;=C2=A0 hw/xen/xen-host-pci-device.c=C2=A0 |=C2=A0 106 +++-<br>
&gt;=C2=A0 hw/xen/xen-host-pci-device.h=C2=A0 |=C2=A0 =C2=A0 6 +-<br>
&gt;=C2=A0 hw/xen/xen_pt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A049 +-<br>
&gt;=C2=A0 hw/xen/xen_pt.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A019 +-<br>
&gt;=C2=A0 hw/xen/xen_pt_config_init.c=C2=A0 =C2=A0| 1103 +++++++++++++++++=
+++++++++++++---<br>
&gt;=C2=A0 include/hw/acpi/ich9.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
 1 +<br>
&gt;=C2=A0 include/hw/acpi/pcihp.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
 2 +<br>
&gt;=C2=A0 include/hw/boards.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 1 +<br>
&gt;=C2=A0 include/hw/i386/pc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 3 +<br>
&gt;=C2=A0 include/hw/pci-host/q35.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +-=
<br>
&gt;=C2=A0 include/hw/pci/pci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 3 +<br>
&gt;=C2=A0 include/hw/southbridge/ich9.h |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 include/hw/xen/xen.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 4 +-<br>
&gt;=C2=A0 qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 softmmu/datadir.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 1 -<br>
&gt;=C2=A0 softmmu/qdev-monitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
 3 +-<br>
&gt;=C2=A0 stubs/xen-hw-stub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 4 +-<br>
&gt;=C2=A0 29 files changed, 1396 insertions(+), 132 deletions(-)<br>
&gt; *** These patches are not found in this series, if they are supposed t=
o<br>
&gt; be I will send them here as well. ***<br>
<br>
It&#39;s unclear, do the QEMU patches depend on the Xen side?=C2=A0 I have =
a<br>
suspicion you likely want to post them mostly at the same time, but<br>
using two different patch series (one for Xen and one for QEMU).<br>
<br>
&gt; Recap of changes to Xen:<br>
&gt;=C2=A0 =C2=A0libacpi: new DSDT ACPI table for Q35<br>
&gt;=C2=A0 =C2=A0Makefile: build and use new DSDT table for Q35<br>
&gt;=C2=A0 =C2=A0hvmloader: add function to query an emulated machine type =
(i440/Q35)<br>
&gt;=C2=A0 =C2=A0hvmloader: add ACPI enabling for Q35<br>
&gt;=C2=A0 =C2=A0hvmloader: add Q35 DSDT table loading<br>
&gt;=C2=A0 =C2=A0hvmloader: add basic Q35 support<br>
&gt;=C2=A0 =C2=A0hvmloader: allocate MMCONFIG area in the MMIO hole + minor=
 code<br>
&gt;=C2=A0 =C2=A0 =C2=A0refactoring<br>
&gt;=C2=A0 =C2=A0hvmloader: seabios dsdt set to load correct config<br>
&gt;=C2=A0 =C2=A0hvmloader: ovmf dsdt set to load correct config<br>
&gt;=C2=A0 =C2=A0libxl: Q35 support (new option device_model_machine)<br>
&gt;=C2=A0 =C2=A0libxl: Xen Platform device support for Q35<br>
&gt;=C2=A0 =C2=A0libacpi: build ACPI MCFG table if requested<br>
&gt;=C2=A0 =C2=A0hvmloader: use libacpi to build MCFG table<br>
&gt;=C2=A0 =C2=A0docs: provide description for device_model_machine option<=
br>
&gt; <br>
&gt; Joel Upham (1):<br>
&gt;=C2=A0 =C2=A0Q35 support<br>
<br>
I&#39;m afraid this needs to be split into a patch series, with proper<br>
commit messages in order to be considered for review.=C2=A0 The current<br>
huge patch is impossible to review at all.<br>
<br>
Also you need to keep the Signed-off-by of the original author in the<br>
patches.<br>
<br>
Thanks, Roger.<br>
</blockquote></div></div>

--000000000000318dea05fe838a46--

