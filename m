Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7471294CF9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 14:46:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10060.26491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVDUq-0002ml-VS; Wed, 21 Oct 2020 12:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10060.26491; Wed, 21 Oct 2020 12:45:40 +0000
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
	id 1kVDUq-0002mM-SG; Wed, 21 Oct 2020 12:45:40 +0000
Received: by outflank-mailman (input) for mailman id 10060;
 Wed, 21 Oct 2020 12:45:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=286h=D4=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kVDUq-0002mH-6R
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 12:45:40 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdd37b36-e955-41b7-8bdd-950c3ddd4dae;
 Wed, 21 Oct 2020 12:45:38 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l28so2887382lfp.10
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2020 05:45:38 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=286h=D4=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kVDUq-0002mH-6R
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 12:45:40 +0000
X-Inumbo-ID: fdd37b36-e955-41b7-8bdd-950c3ddd4dae
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fdd37b36-e955-41b7-8bdd-950c3ddd4dae;
	Wed, 21 Oct 2020 12:45:38 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l28so2887382lfp.10
        for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2020 05:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8q1bxnQpOzUjFsYj7y5zeYUNO8C/aL6+R6t4O3DmJrE=;
        b=faMO7zxo1+6GUlcNFfAb+UjM8HEFLZHUVRdR0WGR7/GoK6KxmWlFuZznfx+WgnQwxB
         EnzZBVLZNRCfx/Z36/Uqi5XHiIAOCx8rgptx4srRxViTNbTFmZjdCaFAaq1yj8Ue4jU5
         QB64oIjBtR/hwIWQs6rknajj00KyTldbfDK9gyvm2FohmjanGgilgbxBv6UTpsGXPE6P
         y1PyIJOYSc/HjLpK7ZQHY72uIWH+39cXsx4PfZNoerr155IRBjjqTJxuflwp4MacXSEz
         lLP+ogyUKUmQVl905x9lA3wFtV94KPEQrU9s3er93JbHy4ADsdBBkKW1dltStAkVt6A7
         +/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8q1bxnQpOzUjFsYj7y5zeYUNO8C/aL6+R6t4O3DmJrE=;
        b=HolQDVuhOZXFoQooHa7LXuG4uAs+P1AwYNC9MIc/yG+EYwYIDZ0NkU2YavEGYevByx
         Uck8J/S9EXLxQdDmIioL0pjCQ4cAFxbtD3hfBQDbS1mGyDEIKgP/S5FL689Agf/mb5EN
         lED2QEzkcy5+ovbZSMVsi+0hRu1E5siBdcOnO4AvA/+5NPA7R1mjO3HJixRG3C+lM6rf
         qX/rC+LiE0aLc6pALelXbqNVvgFoYTzQliwBMhyzaYbbsUj+kCagjDMjuALD7WH0qFbS
         FPpudgikZceQESZFZB6MOabVmOY/I/+jIXgXJVpG1BVKliiGGiQA3Vam79Hw8+SUxsfF
         h0zQ==
X-Gm-Message-State: AOAM532EGyl17AqcX/x8hg53QF6gVaZ7LflYNqdDt9luibY/GO9BaqgS
	L5340kR/bIFwqXhri+E63rhO9VWbH9Ys5BVpjgk=
X-Google-Smtp-Source: ABdhPJx7uwr7l+T8x9VhEwwwahy+m8BtASpeKWoVnO/SJkiEF+g5Iv36IO9teBJE0Ezkj5EvjWOBTtmBK41oET3NsBk=
X-Received: by 2002:ac2:47fc:: with SMTP id b28mr1122588lfp.454.1603284337480;
 Wed, 21 Oct 2020 05:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
 <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com> <20201015113109.GA68032@Air-de-Roger>
 <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com>
 <CAKf6xps1q9zMBeFg7C7ZhD-JcwQ6EG6+bYvvA9QT8PzzxKqMNg@mail.gmail.com> <20201021095809.o53b6hpvjl2lbqsi@Air-de-Roger>
In-Reply-To: <20201021095809.o53b6hpvjl2lbqsi@Air-de-Roger>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 21 Oct 2020 08:45:25 -0400
Message-ID: <CAKf6xpuTE4gBNe4YXPYh_hAMLaJduDuKL5_6aC4H=y6DRxaxvw@mail.gmail.com>
Subject: Re: i915 dma faults on Xen
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, intel-gfx@lists.freedesktop.org, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2020 at 5:58 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Fri, Oct 16, 2020 at 12:23:22PM -0400, Jason Andryuk wrote:
> >
> > The RMRRs are:
> > (XEN) [VT-D]Host address width 39
> > (XEN) [VT-D]found ACPI_DMAR_DRHD:
> > (XEN) [VT-D]  dmaru->address =3D fed90000
> > (XEN) [VT-D]drhd->address =3D fed90000 iommu->reg =3D ffff82c00021d000
> > (XEN) [VT-D]cap =3D 1c0000c40660462 ecap =3D 19e2ff0505e
> > (XEN) [VT-D] endpoint: 0000:00:02.0
> > (XEN) [VT-D]found ACPI_DMAR_DRHD:
> > (XEN) [VT-D]  dmaru->address =3D fed91000
> > (XEN) [VT-D]drhd->address =3D fed91000 iommu->reg =3D ffff82c00021f000
> > (XEN) [VT-D]cap =3D d2008c40660462 ecap =3D f050da
> > (XEN) [VT-D] IOAPIC: 0000:00:1e.7
> > (XEN) [VT-D] MSI HPET: 0000:00:1e.6
> > (XEN) [VT-D]  flags: INCLUDE_ALL
> > (XEN) [VT-D]found ACPI_DMAR_RMRR:
> > (XEN) [VT-D] endpoint: 0000:00:14.0
> > (XEN) [VT-D]dmar.c:615:   RMRR region: base_addr 78863000 end_addr 7888=
2fff
> > (XEN) [VT-D]found ACPI_DMAR_RMRR:
> > (XEN) [VT-D] endpoint: 0000:00:02.0
> > (XEN) [VT-D]dmar.c:615:   RMRR region: base_addr 7d000000 end_addr 7f7f=
ffff
> > (XEN) [VT-D]found ACPI_DMAR_RMRR:
> > (XEN) [VT-D] endpoint: 0000:00:16.7
> > (XEN) [VT-D]dmar.c:581:  Non-existent device (0000:00:16.7) is
> > reported in RMRR (78907000, 78986fff)'s scope!
> > (XEN) [VT-D]dmar.c:596:   Ignore the RMRR (78907000, 78986fff) due to
>
> This is also part of a reserved region, so should be added to the
> iommu page tables anyway regardless of this message.

I wonder if this is for the Intel AMT PCI device?  I assumed it is
disabled, but I actually can't find it listed in the BIOS
configuration to verify.

> > devices under its scope are not PCI discoverable!
> >
> > > > I agree.
> > > >
> > > > Can you paste the memory map as printed by Xen when booting, and wh=
at
> > > > command line are you using to boot Xen.
> > >
> > > So this is OpenXT, and it's booting EFI -> xen -> tboot -> xen
> > >
> > > There's the memory map
> > > (XEN) TBOOT RAM map:
> > > (XEN)  0000000000000000 - 0000000000060000 (usable)
> > > (XEN)  0000000000060000 - 0000000000068000 (reserved)
> > > (XEN)  0000000000068000 - 000000000009e000 (usable)
> > > (XEN)  000000000009e000 - 000000000009f000 (reserved)
> > > (XEN)  000000000009f000 - 00000000000a0000 (usable)
> > > (XEN)  00000000000a0000 - 0000000000100000 (reserved)
> > > (XEN)  0000000000100000 - 0000000040000000 (usable)
> > > (XEN)  0000000040000000 - 0000000040400000 (reserved)
> > > (XEN)  0000000040400000 - 000000007024b000 (usable)
> > > (XEN)  000000007024b000 - 000000007024c000 (ACPI NVS)
> > > (XEN)  000000007024c000 - 000000007024d000 (reserved)
> > > (XEN)  000000007024d000 - 0000000077f19000 (usable)
> > > (XEN)  0000000077f19000 - 0000000078987000 (reserved)
> > > (XEN)  0000000078987000 - 0000000078a04000 (ACPI data)
> > > (XEN)  0000000078a04000 - 0000000078ea3000 (ACPI NVS)
> > > (XEN)  0000000078ea3000 - 000000007acff000 (reserved)
> > > (XEN)  000000007acff000 - 000000007ad00000 (usable)
> > > (XEN)  000000007ad00000 - 000000007f800000 (reserved)
> > > (XEN)  00000000f0000000 - 00000000f8000000 (reserved)
> > > (XEN)  00000000fe000000 - 00000000fe011000 (reserved)
> > > (XEN)  00000000fec00000 - 00000000fec01000 (reserved)
> > > (XEN)  00000000fee00000 - 00000000fee01000 (reserved)
> > > (XEN)  00000000ff000000 - 0000000100000000 (reserved)
> > > (XEN)  0000000100000000 - 000000047c800000 (usable)
> > > (XEN) EFI memory map:
> > > (XEN)  0000000000000-000000009dfff type=3D7 attr=3D000000000000000f
> > > (XEN)  000000009e000-000000009efff type=3D0 attr=3D000000000000000f
> > > (XEN)  000000009f000-000000009ffff type=3D3 attr=3D000000000000000f
> > > (XEN)  0000000100000-000003fffffff type=3D7 attr=3D000000000000000f
> > > (XEN)  0000040000000-00000403fffff type=3D0 attr=3D000000000000000f
> > > (XEN)  0000040400000-000005e359fff type=3D7 attr=3D000000000000000f
> > > (XEN)  000005e35a000-000005e399fff type=3D4 attr=3D000000000000000f
> > > (XEN)  000005e39a000-000006a47dfff type=3D7 attr=3D000000000000000f
> > > (XEN)  000006a47e000-000006c3eefff type=3D2 attr=3D000000000000000f
> > > (XEN)  000006c3ef000-000006d5eefff type=3D1 attr=3D000000000000000f
> > > (XEN)  000006d5ef000-000006d86cfff type=3D2 attr=3D000000000000000f
> > > (XEN)  000006d86d000-000006d978fff type=3D1 attr=3D000000000000000f
> > > (XEN)  000006d979000-000006dc7afff type=3D4 attr=3D000000000000000f
> > > (XEN)  000006dc7b000-000006dc98fff type=3D3 attr=3D000000000000000f
> > > (XEN)  000006dc99000-000006dcc7fff type=3D4 attr=3D000000000000000f
> > > (XEN)  000006dcc8000-000006dccdfff type=3D3 attr=3D000000000000000f
> > > (XEN)  000006dcce000-00000701a5fff type=3D4 attr=3D000000000000000f
> > > (XEN)  00000701a6000-00000701c8fff type=3D3 attr=3D000000000000000f
> > > (XEN)  00000701c9000-00000701edfff type=3D4 attr=3D000000000000000f
> > > (XEN)  00000701ee000-0000070204fff type=3D3 attr=3D000000000000000f
> > > (XEN)  0000070205000-000007022cfff type=3D4 attr=3D000000000000000f
> > > (XEN)  000007022d000-000007024afff type=3D3 attr=3D000000000000000f
> > > (XEN)  000007024b000-000007024bfff type=3D10 attr=3D000000000000000f
> > > (XEN)  000007024c000-000007024cfff type=3D6 attr=3D800000000000000f
> > > (XEN)  000007024d000-000007024dfff type=3D4 attr=3D000000000000000f
> > > (XEN)  000007024e000-0000070282fff type=3D3 attr=3D000000000000000f
> > > (XEN)  0000070283000-00000702c3fff type=3D4 attr=3D000000000000000f
> > > (XEN)  00000702c4000-00000702c8fff type=3D3 attr=3D000000000000000f
> > > (XEN)  00000702c9000-00000702defff type=3D4 attr=3D000000000000000f
> > > (XEN)  00000702df000-0000070307fff type=3D3 attr=3D000000000000000f
> > > (XEN)  0000070308000-0000070317fff type=3D4 attr=3D000000000000000f
> > > (XEN)  0000070318000-0000070319fff type=3D3 attr=3D000000000000000f
> > > (XEN)  000007031a000-0000070331fff type=3D4 attr=3D000000000000000f
> > > (XEN)  0000070332000-0000070349fff type=3D3 attr=3D000000000000000f
> > > (XEN)  000007034a000-0000070356fff type=3D2 attr=3D000000000000000f
> > > (XEN)  0000070357000-0000070357fff type=3D7 attr=3D000000000000000f
> > > (XEN)  0000070358000-0000070358fff type=3D2 attr=3D000000000000000f
> > > (XEN)  0000070359000-0000076f3efff type=3D4 attr=3D000000000000000f
> > > (XEN)  0000076f3f000-00000772affff type=3D7 attr=3D000000000000000f
> > > (XEN)  00000772b0000-0000077f18fff type=3D3 attr=3D000000000000000f
> > > (XEN)  0000077f19000-0000078986fff type=3D0 attr=3D000000000000000f
> > > (XEN)  0000078987000-0000078a03fff type=3D9 attr=3D000000000000000f
> > > (XEN)  0000078a04000-0000078ea2fff type=3D10 attr=3D000000000000000f
> > > (XEN)  0000078ea3000-000007ab22fff type=3D6 attr=3D800000000000000f
> > > (XEN)  000007ab23000-000007acfefff type=3D5 attr=3D800000000000000f
> > > (XEN)  000007acff000-000007acfffff type=3D4 attr=3D000000000000000f
> > > (XEN)  0000100000000-000047c7fffff type=3D7 attr=3D000000000000000f
> > > (XEN)  00000000a0000-00000000fffff type=3D0 attr=3D0000000000000000
> > > (XEN)  000007ad00000-000007adfffff type=3D0 attr=3D070000000000000f
> > > (XEN)  000007ae00000-000007f7fffff type=3D0 attr=3D0000000000000000
> > > (XEN)  00000f0000000-00000f7ffffff type=3D11 attr=3D800000000000100d
> > > (XEN)  00000fe000000-00000fe010fff type=3D11 attr=3D8000000000000001
> > > (XEN)  00000fec00000-00000fec00fff type=3D11 attr=3D8000000000000001
> > > (XEN)  00000fee00000-00000fee00fff type=3D11 attr=3D8000000000000001
> > > (XEN)  00000ff000000-00000ffffffff type=3D11 attr=3D800000000000100d
> > >
> > > Command line
> > > console=3Dcom1 dom0_mem=3Dmin:420M,max:420M,420M efi=3Dno-rs,attr=3Du=
c
> > > com1=3D115200,8n1,pci mbi-video vga=3Dcurrent flask=3Denforcing loglv=
l=3Ddebug
> > > guest_loglvl=3Ddebug smt=3D0 ucode=3D-1 bootscrub=3D1
> > > argo=3Dyes,mac-permissive=3D1 iommu=3Dforce,igfx
> > >
> > > iommu=3Dforce,igfx was to force igfx back on.  I added a dmi quirk to
> > > set no-igfx on this platform as a temporary workaround.
>
> I assume setting no-igfx fixed the issue and the card works fine in
> that case?

Yes, it seems to work.  The internal and 2 external monitors are
displaying and seem okay.  If I unplug the dock with those 2 displays,
then go plug in a different dock with a different monitor, I've seen
(unclear how often) the i915 report errors with configuring it's
"pipe" and the built in display (eDP) is black.  But it may recover
sometimes?

> > > > Have you tried adding dom0-iommu=3Dmap-inclusive to the Xen command
> > > > line?
> >
> > Still seeing faults with dom0-iommu=3Dmap-inclusive.  At a different
> > address this time:
> > Oct 16 15:58:05.110768 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
> > Request device [0000:00:02.0] fault addr ea0c4f000, iommu reg =3D ffff
>
> That's also past the end of RAM.
>
> > 82c00021d000
> > Oct 16 15:58:05.110774 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
> > PTE Read access is not set
> > Oct 16 15:58:05.110777 VM hypervisor: (XEN) print_vtd_entries: iommu
> > #0 dev 0000:00:02.0 gmfn ea0c4f
> > Oct 16 15:58:05.110780 VM hypervisor: (XEN)     root_entry[00] =3D 46e1=
29001
> > Oct 16 15:58:05.110782 VM hypervisor: (XEN)     context[10] =3D 2_46e12=
8001
> > Oct 16 15:58:05.110785 VM hypervisor: (XEN)     l4[000] =3D 46e11b003
> > Oct 16 15:58:05.110787 VM hypervisor: (XEN)     l3[03a] =3D 0
> > Oct 16 15:58:05.110789 VM hypervisor: (XEN)     l3[03a] not present
> >
> > The previous posting, the two faulting addresses repeated in pairs.
> > Here it is only this one address repeating.
> >
> > I plugged and unplugged and a different address was repeating with a
> > few other random addresses with 1 or 2 faults.  Here is uniq -c output
> > of the address and count pulled from the logs:
> > 0x1ce9d6b000 2007
> > 0x31b50d5000 1
> > 0x1ce9d6b000 882
> > 0x707741000 1
> > 0x1ce9d6b000 1114
> > 0x20d2099000 1
> > 0x1ce9d6b000 3489
> > 0xeb98eb000 1
> > 0x1ce9d6b000 2430
> > 0xeb98eb000 1
> > 0x1ce9d6b000 1300
> > 0x22f20bb000 1
> > 0x1ce9d6b000 269
> > 0x22f20bb000 1
> > 0x1ce9d6b000 5091
> > 0x6c99ec9000 1
> > 0x1ce9d6b000 29
> > 0xeb98eb000 1
> > 0x1ce9d6b000 4599
> > 0x6c99ec9000 1
> > 0x1ce9d6b000 1989
>
> Hm, it's hard to tell what's going on. My limited experience with
> IOMMU faults on broken systems there's a small range that initially
> triggers those, and then the device goes wonky and starts accessing a
> whole load of invalid addresses.
>
> You could try adding those manually using the rmrr Xen command line
> option [0], maybe you can figure out which range(s) are missing?

They seem to change, so it's hard to know.  Would there be harm in
adding one to cover the end of RAM ( 0x04,7c80,0000 ) to (
0xff,ffff,ffff )?  Maybe that would just quiet the pointless faults
while leaving the IOMMU enabled?

Thanks for taking a look.

Regards,
Jason

