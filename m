Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E0294AE8
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 11:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9937.26215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVAt0-00024H-3Q; Wed, 21 Oct 2020 09:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9937.26215; Wed, 21 Oct 2020 09:58:26 +0000
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
	id 1kVAsz-00023s-W5; Wed, 21 Oct 2020 09:58:25 +0000
Received: by outflank-mailman (input) for mailman id 9937;
 Wed, 21 Oct 2020 09:58:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVAsy-00023n-Hp
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 09:58:24 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59e28261-7df4-4bfd-a099-de01a6f872b6;
 Wed, 21 Oct 2020 09:58:22 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVAsy-00023n-Hp
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 09:58:24 +0000
X-Inumbo-ID: 59e28261-7df4-4bfd-a099-de01a6f872b6
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 59e28261-7df4-4bfd-a099-de01a6f872b6;
	Wed, 21 Oct 2020 09:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603274303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=O29350yNgiHYjXb3qrigNg8xxVDACGF1x6pzlHVVpQk=;
  b=N66B1oAgd7QE18kSD88oqA3I+5H4C33+scrZBAAkSG/Dmn//BZppbhVc
   V8dYWrSYZr2DaDp1JymVSnt9ZXybQVCDRhlh0rcZNGm6+Q9rNvYLYYs2i
   O7ONL1jHyWo86ls3KnGY9EL1otO/jIKtv8ljKU6C1G/mUq1EJiwFlIeg5
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WJ9qrBzI4wb5PDRnwJ8d6vwtT4H+i5G4WN1cj774c14rWpnFEGwNM3brmK9We5kd6PZu8QJSZQ
 Gn2eAJTDSYrsPq+U/nHwd9woMJaYgTmm6qqQ1PuSOqQcspURX0C242MOSbRpGEAbo3c+CaWQpb
 oniLk1HEGkq9UqR8t5gaD3x1ymm+mOrbY6437GV2UOCnfLAMZ2/F7wrOMtg1VLQAikHslL0rEZ
 KTvSunuW+/cbw7J+cQ6xH4icz8kSQamyDyBUGtkKC9Zjc7FqJWEaL2CV+DT5iuNxppYJRnq5wh
 KHs=
X-SBRS: 2.5
X-MesageID: 29468608
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="29468608"
Date: Wed, 21 Oct 2020 11:58:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<intel-gfx@lists.freedesktop.org>, xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: i915 dma faults on Xen
Message-ID: <20201021095809.o53b6hpvjl2lbqsi@Air-de-Roger>
References: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
 <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com>
 <20201015113109.GA68032@Air-de-Roger>
 <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com>
 <CAKf6xps1q9zMBeFg7C7ZhD-JcwQ6EG6+bYvvA9QT8PzzxKqMNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xps1q9zMBeFg7C7ZhD-JcwQ6EG6+bYvvA9QT8PzzxKqMNg@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Fri, Oct 16, 2020 at 12:23:22PM -0400, Jason Andryuk wrote:
> On Thu, Oct 15, 2020 at 11:16 AM Jason Andryuk <jandryuk@gmail.com> wrote:
> >
> > On Thu, Oct 15, 2020 at 7:31 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > >
> > > On Wed, Oct 14, 2020 at 08:37:06PM +0100, Andrew Cooper wrote:
> > > > On 14/10/2020 20:28, Jason Andryuk wrote:
> > > > > Hi,
> > > > >
> > > > > Bug opened at https://gitlab.freedesktop.org/drm/intel/-/issues/2576
> > > > >
> > > > > I'm seeing DMA faults for the i915 graphics hardware on a Dell
> > > > > Latitude 5500. These were captured when I plugged into a Dell
> > > > > Thunderbolt dock with two DisplayPort monitors attached.  Xen 4.12.4
> > > > > staging and Linux 5.4.70 (and some earlier versions).
> > > > >
> > > > > Oct 14 18:41:49.056490 kernel:[   85.570347] [drm:gen8_de_irq_handler
> > > > > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > > > > Oct 14 18:41:49.056494 kernel:[   85.570395] [drm:gen8_de_irq_handler
> > > > > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > > > > Oct 14 18:41:49.056589 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
> > > > > Request device [0000:00:02.0] fault addr 39b5845000, iommu reg =
> > > > > ffff82c00021d000
> > > > > Oct 14 18:41:49.056594 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
> > > > > PTE Read access is not set
> > > > > Oct 14 18:41:49.056784 kernel:[   85.570668] [drm:gen8_de_irq_handler
> > > > > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > > > > Oct 14 18:41:49.056789 kernel:[   85.570687] [drm:gen8_de_irq_handler
> > > > > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > > > > Oct 14 18:41:49.056885 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
> > > > > Request device [0000:00:02.0] fault addr 4238d0a000, iommu reg =
> > > > > ffff82c00021d000
> > > > > Oct 14 18:41:49.056890 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
> > > > > PTE Read access is not set
> > > > >
> > > > > They repeat. In the log attached to
> > > > > https://gitlab.freedesktop.org/drm/intel/-/issues/2576, they start at
> > > > > "Oct 14 18:41:49.056589" and continue until I unplug the dock around
> > > > > "Oct 14 18:41:54.801802".
> > > > >
> > > > > I've also seen similar messages when attaching the laptop's HDMI port
> > > > > to a 4k monitor. The eDP display by itself seems okay.
> > > > >
> > > > > I tried Fedora 31 & 32 live images with intel_iommu=on, so no Xen, and
> > > > > didn't see any errors
> > > > >
> > > > > This is a kernel & xen log with drm.debug=0x1e. It also includes some
> > > > > application (glass) logging when it changes resolutions which seems to
> > > > > set off the DMA faults. 5500-igfx-messages-kern-xen-glass
> > > > >
> > > > > Running xen with iommu=no-igfx disables the iommu for the i915
> > > > > graphics and no faults are reported. However, that breaks some other
> > > > > devices (Dell Latitude 7200 and 5580) giving a black screen with:
> > > > >
> > > > > Oct 10 13:24:37.022117 kernel:[   14.884759] i915 0000:00:02.0: Failed
> > > > > to idle engines, declaring wedged!
> > > > > Oct 10 13:24:37.022118 kernel:[   14.964794] i915 0000:00:02.0: Failed
> > > > > to initialize GPU, declaring it wedged!
> > > > >
> > > > > Any suggestions welcome.
> > > >
> > > > Presumably this is with a PV dom0.  What are 39b5845000 and 4238d0a000
> > > > in the machine memory map?
> >
> > They are bogus?
> > End of RAM is 0x47c800000
> > Thats:
> > 0x047c800000
> > vs.
> > 0x39b5845000
> > 0x4238d0a000
> >
> > > > This smells like a missing RMRR in the ACPI tables.
> 
> The RMRRs are:
> (XEN) [VT-D]Host address width 39
> (XEN) [VT-D]found ACPI_DMAR_DRHD:
> (XEN) [VT-D]  dmaru->address = fed90000
> (XEN) [VT-D]drhd->address = fed90000 iommu->reg = ffff82c00021d000
> (XEN) [VT-D]cap = 1c0000c40660462 ecap = 19e2ff0505e
> (XEN) [VT-D] endpoint: 0000:00:02.0
> (XEN) [VT-D]found ACPI_DMAR_DRHD:
> (XEN) [VT-D]  dmaru->address = fed91000
> (XEN) [VT-D]drhd->address = fed91000 iommu->reg = ffff82c00021f000
> (XEN) [VT-D]cap = d2008c40660462 ecap = f050da
> (XEN) [VT-D] IOAPIC: 0000:00:1e.7
> (XEN) [VT-D] MSI HPET: 0000:00:1e.6
> (XEN) [VT-D]  flags: INCLUDE_ALL
> (XEN) [VT-D]found ACPI_DMAR_RMRR:
> (XEN) [VT-D] endpoint: 0000:00:14.0
> (XEN) [VT-D]dmar.c:615:   RMRR region: base_addr 78863000 end_addr 78882fff
> (XEN) [VT-D]found ACPI_DMAR_RMRR:
> (XEN) [VT-D] endpoint: 0000:00:02.0
> (XEN) [VT-D]dmar.c:615:   RMRR region: base_addr 7d000000 end_addr 7f7fffff
> (XEN) [VT-D]found ACPI_DMAR_RMRR:
> (XEN) [VT-D] endpoint: 0000:00:16.7
> (XEN) [VT-D]dmar.c:581:  Non-existent device (0000:00:16.7) is
> reported in RMRR (78907000, 78986fff)'s scope!
> (XEN) [VT-D]dmar.c:596:   Ignore the RMRR (78907000, 78986fff) due to

This is also part of a reserved region, so should be added to the
iommu page tables anyway regardless of this message.

> devices under its scope are not PCI discoverable!
> 
> > > I agree.
> > >
> > > Can you paste the memory map as printed by Xen when booting, and what
> > > command line are you using to boot Xen.
> >
> > So this is OpenXT, and it's booting EFI -> xen -> tboot -> xen
> >
> > There's the memory map
> > (XEN) TBOOT RAM map:
> > (XEN)  0000000000000000 - 0000000000060000 (usable)
> > (XEN)  0000000000060000 - 0000000000068000 (reserved)
> > (XEN)  0000000000068000 - 000000000009e000 (usable)
> > (XEN)  000000000009e000 - 000000000009f000 (reserved)
> > (XEN)  000000000009f000 - 00000000000a0000 (usable)
> > (XEN)  00000000000a0000 - 0000000000100000 (reserved)
> > (XEN)  0000000000100000 - 0000000040000000 (usable)
> > (XEN)  0000000040000000 - 0000000040400000 (reserved)
> > (XEN)  0000000040400000 - 000000007024b000 (usable)
> > (XEN)  000000007024b000 - 000000007024c000 (ACPI NVS)
> > (XEN)  000000007024c000 - 000000007024d000 (reserved)
> > (XEN)  000000007024d000 - 0000000077f19000 (usable)
> > (XEN)  0000000077f19000 - 0000000078987000 (reserved)
> > (XEN)  0000000078987000 - 0000000078a04000 (ACPI data)
> > (XEN)  0000000078a04000 - 0000000078ea3000 (ACPI NVS)
> > (XEN)  0000000078ea3000 - 000000007acff000 (reserved)
> > (XEN)  000000007acff000 - 000000007ad00000 (usable)
> > (XEN)  000000007ad00000 - 000000007f800000 (reserved)
> > (XEN)  00000000f0000000 - 00000000f8000000 (reserved)
> > (XEN)  00000000fe000000 - 00000000fe011000 (reserved)
> > (XEN)  00000000fec00000 - 00000000fec01000 (reserved)
> > (XEN)  00000000fee00000 - 00000000fee01000 (reserved)
> > (XEN)  00000000ff000000 - 0000000100000000 (reserved)
> > (XEN)  0000000100000000 - 000000047c800000 (usable)
> > (XEN) EFI memory map:
> > (XEN)  0000000000000-000000009dfff type=7 attr=000000000000000f
> > (XEN)  000000009e000-000000009efff type=0 attr=000000000000000f
> > (XEN)  000000009f000-000000009ffff type=3 attr=000000000000000f
> > (XEN)  0000000100000-000003fffffff type=7 attr=000000000000000f
> > (XEN)  0000040000000-00000403fffff type=0 attr=000000000000000f
> > (XEN)  0000040400000-000005e359fff type=7 attr=000000000000000f
> > (XEN)  000005e35a000-000005e399fff type=4 attr=000000000000000f
> > (XEN)  000005e39a000-000006a47dfff type=7 attr=000000000000000f
> > (XEN)  000006a47e000-000006c3eefff type=2 attr=000000000000000f
> > (XEN)  000006c3ef000-000006d5eefff type=1 attr=000000000000000f
> > (XEN)  000006d5ef000-000006d86cfff type=2 attr=000000000000000f
> > (XEN)  000006d86d000-000006d978fff type=1 attr=000000000000000f
> > (XEN)  000006d979000-000006dc7afff type=4 attr=000000000000000f
> > (XEN)  000006dc7b000-000006dc98fff type=3 attr=000000000000000f
> > (XEN)  000006dc99000-000006dcc7fff type=4 attr=000000000000000f
> > (XEN)  000006dcc8000-000006dccdfff type=3 attr=000000000000000f
> > (XEN)  000006dcce000-00000701a5fff type=4 attr=000000000000000f
> > (XEN)  00000701a6000-00000701c8fff type=3 attr=000000000000000f
> > (XEN)  00000701c9000-00000701edfff type=4 attr=000000000000000f
> > (XEN)  00000701ee000-0000070204fff type=3 attr=000000000000000f
> > (XEN)  0000070205000-000007022cfff type=4 attr=000000000000000f
> > (XEN)  000007022d000-000007024afff type=3 attr=000000000000000f
> > (XEN)  000007024b000-000007024bfff type=10 attr=000000000000000f
> > (XEN)  000007024c000-000007024cfff type=6 attr=800000000000000f
> > (XEN)  000007024d000-000007024dfff type=4 attr=000000000000000f
> > (XEN)  000007024e000-0000070282fff type=3 attr=000000000000000f
> > (XEN)  0000070283000-00000702c3fff type=4 attr=000000000000000f
> > (XEN)  00000702c4000-00000702c8fff type=3 attr=000000000000000f
> > (XEN)  00000702c9000-00000702defff type=4 attr=000000000000000f
> > (XEN)  00000702df000-0000070307fff type=3 attr=000000000000000f
> > (XEN)  0000070308000-0000070317fff type=4 attr=000000000000000f
> > (XEN)  0000070318000-0000070319fff type=3 attr=000000000000000f
> > (XEN)  000007031a000-0000070331fff type=4 attr=000000000000000f
> > (XEN)  0000070332000-0000070349fff type=3 attr=000000000000000f
> > (XEN)  000007034a000-0000070356fff type=2 attr=000000000000000f
> > (XEN)  0000070357000-0000070357fff type=7 attr=000000000000000f
> > (XEN)  0000070358000-0000070358fff type=2 attr=000000000000000f
> > (XEN)  0000070359000-0000076f3efff type=4 attr=000000000000000f
> > (XEN)  0000076f3f000-00000772affff type=7 attr=000000000000000f
> > (XEN)  00000772b0000-0000077f18fff type=3 attr=000000000000000f
> > (XEN)  0000077f19000-0000078986fff type=0 attr=000000000000000f
> > (XEN)  0000078987000-0000078a03fff type=9 attr=000000000000000f
> > (XEN)  0000078a04000-0000078ea2fff type=10 attr=000000000000000f
> > (XEN)  0000078ea3000-000007ab22fff type=6 attr=800000000000000f
> > (XEN)  000007ab23000-000007acfefff type=5 attr=800000000000000f
> > (XEN)  000007acff000-000007acfffff type=4 attr=000000000000000f
> > (XEN)  0000100000000-000047c7fffff type=7 attr=000000000000000f
> > (XEN)  00000000a0000-00000000fffff type=0 attr=0000000000000000
> > (XEN)  000007ad00000-000007adfffff type=0 attr=070000000000000f
> > (XEN)  000007ae00000-000007f7fffff type=0 attr=0000000000000000
> > (XEN)  00000f0000000-00000f7ffffff type=11 attr=800000000000100d
> > (XEN)  00000fe000000-00000fe010fff type=11 attr=8000000000000001
> > (XEN)  00000fec00000-00000fec00fff type=11 attr=8000000000000001
> > (XEN)  00000fee00000-00000fee00fff type=11 attr=8000000000000001
> > (XEN)  00000ff000000-00000ffffffff type=11 attr=800000000000100d
> >
> > Command line
> > console=com1 dom0_mem=min:420M,max:420M,420M efi=no-rs,attr=uc
> > com1=115200,8n1,pci mbi-video vga=current flask=enforcing loglvl=debug
> > guest_loglvl=debug smt=0 ucode=-1 bootscrub=1
> > argo=yes,mac-permissive=1 iommu=force,igfx
> >
> > iommu=force,igfx was to force igfx back on.  I added a dmi quirk to
> > set no-igfx on this platform as a temporary workaround.

I assume setting no-igfx fixed the issue and the card works fine in
that case?

> > > Have you tried adding dom0-iommu=map-inclusive to the Xen command
> > > line?
> 
> Still seeing faults with dom0-iommu=map-inclusive.  At a different
> address this time:
> Oct 16 15:58:05.110768 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
> Request device [0000:00:02.0] fault addr ea0c4f000, iommu reg = ffff

That's also past the end of RAM.

> 82c00021d000
> Oct 16 15:58:05.110774 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
> PTE Read access is not set
> Oct 16 15:58:05.110777 VM hypervisor: (XEN) print_vtd_entries: iommu
> #0 dev 0000:00:02.0 gmfn ea0c4f
> Oct 16 15:58:05.110780 VM hypervisor: (XEN)     root_entry[00] = 46e129001
> Oct 16 15:58:05.110782 VM hypervisor: (XEN)     context[10] = 2_46e128001
> Oct 16 15:58:05.110785 VM hypervisor: (XEN)     l4[000] = 46e11b003
> Oct 16 15:58:05.110787 VM hypervisor: (XEN)     l3[03a] = 0
> Oct 16 15:58:05.110789 VM hypervisor: (XEN)     l3[03a] not present
> 
> The previous posting, the two faulting addresses repeated in pairs.
> Here it is only this one address repeating.
> 
> I plugged and unplugged and a different address was repeating with a
> few other random addresses with 1 or 2 faults.  Here is uniq -c output
> of the address and count pulled from the logs:
> 0x1ce9d6b000 2007
> 0x31b50d5000 1
> 0x1ce9d6b000 882
> 0x707741000 1
> 0x1ce9d6b000 1114
> 0x20d2099000 1
> 0x1ce9d6b000 3489
> 0xeb98eb000 1
> 0x1ce9d6b000 2430
> 0xeb98eb000 1
> 0x1ce9d6b000 1300
> 0x22f20bb000 1
> 0x1ce9d6b000 269
> 0x22f20bb000 1
> 0x1ce9d6b000 5091
> 0x6c99ec9000 1
> 0x1ce9d6b000 29
> 0xeb98eb000 1
> 0x1ce9d6b000 4599
> 0x6c99ec9000 1
> 0x1ce9d6b000 1989

Hm, it's hard to tell what's going on. My limited experience with
IOMMU faults on broken systems there's a small range that initially
triggers those, and then the device goes wonky and starts accessing a
whole load of invalid addresses.

You could try adding those manually using the rmrr Xen command line
option [0], maybe you can figure out which range(s) are missing?

Roger.

[0] https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#rmrr

