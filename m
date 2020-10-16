Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE84529099F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 18:24:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8174.21766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTSW2-0007pn-BR; Fri, 16 Oct 2020 16:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8174.21766; Fri, 16 Oct 2020 16:23:38 +0000
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
	id 1kTSW2-0007pO-7H; Fri, 16 Oct 2020 16:23:38 +0000
Received: by outflank-mailman (input) for mailman id 8174;
 Fri, 16 Oct 2020 16:23:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eysm=DX=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kTSW1-0007pJ-9c
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:23:37 +0000
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89ef93da-93bb-446b-ab50-c1488e0c2f65;
 Fri, 16 Oct 2020 16:23:35 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h6so3684560lfj.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 09:23:35 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eysm=DX=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kTSW1-0007pJ-9c
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:23:37 +0000
X-Inumbo-ID: 89ef93da-93bb-446b-ab50-c1488e0c2f65
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 89ef93da-93bb-446b-ab50-c1488e0c2f65;
	Fri, 16 Oct 2020 16:23:35 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h6so3684560lfj.3
        for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 09:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BCXz6neigo3liGVlp6o6t2wQp799QnNlGiCjoMhPnzU=;
        b=jHE3B/2eU4MYhsjWEaaTOGlDhKWaPAhz41rC2NSjHBRa0Tn5p+W61XfSJpE/Ew55M+
         heP8qz40FqafP9SmUSx5fQ4ZanLSPCzircSzfpIX/Bxh1kmUMsoRMhDqMdTQGcxtbb8C
         Jtzu6TCNPV60D8+JyvDN06XvGOwXw11V6mcw3iFPTQFFaKEnNN9O+gtDX43yC8IXfcOL
         kbV1Ft3y+TRWSb8mW6vtIO3FqK1Z8cLJe2IRJf3PEbb5RHDFgrgAt5JfHjOK3vvsU4yM
         jmzryDnW03FfAAIU5BR+hhAqAdv3J8GY2jf9lGD1R+RJCFxPx2UuniNbxWG7k2lZOo/G
         vzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BCXz6neigo3liGVlp6o6t2wQp799QnNlGiCjoMhPnzU=;
        b=mx/YicowdtFIvYOUntfArvGTQskKY+LcBFv1EXTLkW4+KTdBxbGFRVs/3tcpz0AJCd
         NNaDJd+58CJ19uMrY+cyXRCrhouOGtVHZ4uDErtyqGEVe2ETq5NM4vDcIkbVsSZsXI/2
         EcNlY6LAxes5Cnm1RGlMy2CPv2UB2zByoAEUF8humdYND25SnSYpwdyOWMyH04llYXuV
         x9frE2byjla8W0QtI6vFTXqOKKtnljm/qVgtdlmFW3GfLFHKFP/71kHCimZzLybcITxD
         hvnWd8ONbERN5xL/UmDxB+VtVbAxHuiLMKwh3RsZibrh194FUT5sQrvtWfQZp3vPJ+Mh
         NaGg==
X-Gm-Message-State: AOAM533zAjd6vFRMDvUVqDSLKYGTEmQu6tz0B7J7SCy6WDNTtYRg2qKW
	hrCodYDZbZVaSS7/d0A+hVlusNBXkNXdA1YsrW4=
X-Google-Smtp-Source: ABdhPJw3bv4nvYyUMgbs1gm5/tteyYKn9I4ruFRWvTKBJuJ0Rmo2gug2vVwh8Sv9o91YbI8q2yooUwbDm8DNfp1g39A=
X-Received: by 2002:ac2:52b7:: with SMTP id r23mr1574011lfm.30.1602865414058;
 Fri, 16 Oct 2020 09:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
 <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com> <20201015113109.GA68032@Air-de-Roger>
 <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com>
In-Reply-To: <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 16 Oct 2020 12:23:22 -0400
Message-ID: <CAKf6xps1q9zMBeFg7C7ZhD-JcwQ6EG6+bYvvA9QT8PzzxKqMNg@mail.gmail.com>
Subject: Re: i915 dma faults on Xen
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, intel-gfx@lists.freedesktop.org, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2020 at 11:16 AM Jason Andryuk <jandryuk@gmail.com> wrote:
>
> On Thu, Oct 15, 2020 at 7:31 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.co=
m> wrote:
> >
> > On Wed, Oct 14, 2020 at 08:37:06PM +0100, Andrew Cooper wrote:
> > > On 14/10/2020 20:28, Jason Andryuk wrote:
> > > > Hi,
> > > >
> > > > Bug opened at https://gitlab.freedesktop.org/drm/intel/-/issues/257=
6
> > > >
> > > > I'm seeing DMA faults for the i915 graphics hardware on a Dell
> > > > Latitude 5500. These were captured when I plugged into a Dell
> > > > Thunderbolt dock with two DisplayPort monitors attached.  Xen 4.12.=
4
> > > > staging and Linux 5.4.70 (and some earlier versions).
> > > >
> > > > Oct 14 18:41:49.056490 kernel:[   85.570347] [drm:gen8_de_irq_handl=
er
> > > > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > > > Oct 14 18:41:49.056494 kernel:[   85.570395] [drm:gen8_de_irq_handl=
er
> > > > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > > > Oct 14 18:41:49.056589 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
> > > > Request device [0000:00:02.0] fault addr 39b5845000, iommu reg =3D
> > > > ffff82c00021d000
> > > > Oct 14 18:41:49.056594 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
> > > > PTE Read access is not set
> > > > Oct 14 18:41:49.056784 kernel:[   85.570668] [drm:gen8_de_irq_handl=
er
> > > > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > > > Oct 14 18:41:49.056789 kernel:[   85.570687] [drm:gen8_de_irq_handl=
er
> > > > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > > > Oct 14 18:41:49.056885 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
> > > > Request device [0000:00:02.0] fault addr 4238d0a000, iommu reg =3D
> > > > ffff82c00021d000
> > > > Oct 14 18:41:49.056890 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
> > > > PTE Read access is not set
> > > >
> > > > They repeat. In the log attached to
> > > > https://gitlab.freedesktop.org/drm/intel/-/issues/2576, they start =
at
> > > > "Oct 14 18:41:49.056589" and continue until I unplug the dock aroun=
d
> > > > "Oct 14 18:41:54.801802".
> > > >
> > > > I've also seen similar messages when attaching the laptop's HDMI po=
rt
> > > > to a 4k monitor. The eDP display by itself seems okay.
> > > >
> > > > I tried Fedora 31 & 32 live images with intel_iommu=3Don, so no Xen=
, and
> > > > didn't see any errors
> > > >
> > > > This is a kernel & xen log with drm.debug=3D0x1e. It also includes =
some
> > > > application (glass) logging when it changes resolutions which seems=
 to
> > > > set off the DMA faults. 5500-igfx-messages-kern-xen-glass
> > > >
> > > > Running xen with iommu=3Dno-igfx disables the iommu for the i915
> > > > graphics and no faults are reported. However, that breaks some othe=
r
> > > > devices (Dell Latitude 7200 and 5580) giving a black screen with:
> > > >
> > > > Oct 10 13:24:37.022117 kernel:[   14.884759] i915 0000:00:02.0: Fai=
led
> > > > to idle engines, declaring wedged!
> > > > Oct 10 13:24:37.022118 kernel:[   14.964794] i915 0000:00:02.0: Fai=
led
> > > > to initialize GPU, declaring it wedged!
> > > >
> > > > Any suggestions welcome.
> > >
> > > Presumably this is with a PV dom0.  What are 39b5845000 and 4238d0a00=
0
> > > in the machine memory map?
>
> They are bogus?
> End of RAM is 0x47c800000
> Thats:
> 0x047c800000
> vs.
> 0x39b5845000
> 0x4238d0a000
>
> > > This smells like a missing RMRR in the ACPI tables.

The RMRRs are:
(XEN) [VT-D]Host address width 39
(XEN) [VT-D]found ACPI_DMAR_DRHD:
(XEN) [VT-D]  dmaru->address =3D fed90000
(XEN) [VT-D]drhd->address =3D fed90000 iommu->reg =3D ffff82c00021d000
(XEN) [VT-D]cap =3D 1c0000c40660462 ecap =3D 19e2ff0505e
(XEN) [VT-D] endpoint: 0000:00:02.0
(XEN) [VT-D]found ACPI_DMAR_DRHD:
(XEN) [VT-D]  dmaru->address =3D fed91000
(XEN) [VT-D]drhd->address =3D fed91000 iommu->reg =3D ffff82c00021f000
(XEN) [VT-D]cap =3D d2008c40660462 ecap =3D f050da
(XEN) [VT-D] IOAPIC: 0000:00:1e.7
(XEN) [VT-D] MSI HPET: 0000:00:1e.6
(XEN) [VT-D]  flags: INCLUDE_ALL
(XEN) [VT-D]found ACPI_DMAR_RMRR:
(XEN) [VT-D] endpoint: 0000:00:14.0
(XEN) [VT-D]dmar.c:615:   RMRR region: base_addr 78863000 end_addr 78882fff
(XEN) [VT-D]found ACPI_DMAR_RMRR:
(XEN) [VT-D] endpoint: 0000:00:02.0
(XEN) [VT-D]dmar.c:615:   RMRR region: base_addr 7d000000 end_addr 7f7fffff
(XEN) [VT-D]found ACPI_DMAR_RMRR:
(XEN) [VT-D] endpoint: 0000:00:16.7
(XEN) [VT-D]dmar.c:581:  Non-existent device (0000:00:16.7) is
reported in RMRR (78907000, 78986fff)'s scope!
(XEN) [VT-D]dmar.c:596:   Ignore the RMRR (78907000, 78986fff) due to
devices under its scope are not PCI discoverable!

> > I agree.
> >
> > Can you paste the memory map as printed by Xen when booting, and what
> > command line are you using to boot Xen.
>
> So this is OpenXT, and it's booting EFI -> xen -> tboot -> xen
>
> There's the memory map
> (XEN) TBOOT RAM map:
> (XEN)  0000000000000000 - 0000000000060000 (usable)
> (XEN)  0000000000060000 - 0000000000068000 (reserved)
> (XEN)  0000000000068000 - 000000000009e000 (usable)
> (XEN)  000000000009e000 - 000000000009f000 (reserved)
> (XEN)  000000000009f000 - 00000000000a0000 (usable)
> (XEN)  00000000000a0000 - 0000000000100000 (reserved)
> (XEN)  0000000000100000 - 0000000040000000 (usable)
> (XEN)  0000000040000000 - 0000000040400000 (reserved)
> (XEN)  0000000040400000 - 000000007024b000 (usable)
> (XEN)  000000007024b000 - 000000007024c000 (ACPI NVS)
> (XEN)  000000007024c000 - 000000007024d000 (reserved)
> (XEN)  000000007024d000 - 0000000077f19000 (usable)
> (XEN)  0000000077f19000 - 0000000078987000 (reserved)
> (XEN)  0000000078987000 - 0000000078a04000 (ACPI data)
> (XEN)  0000000078a04000 - 0000000078ea3000 (ACPI NVS)
> (XEN)  0000000078ea3000 - 000000007acff000 (reserved)
> (XEN)  000000007acff000 - 000000007ad00000 (usable)
> (XEN)  000000007ad00000 - 000000007f800000 (reserved)
> (XEN)  00000000f0000000 - 00000000f8000000 (reserved)
> (XEN)  00000000fe000000 - 00000000fe011000 (reserved)
> (XEN)  00000000fec00000 - 00000000fec01000 (reserved)
> (XEN)  00000000fee00000 - 00000000fee01000 (reserved)
> (XEN)  00000000ff000000 - 0000000100000000 (reserved)
> (XEN)  0000000100000000 - 000000047c800000 (usable)
> (XEN) EFI memory map:
> (XEN)  0000000000000-000000009dfff type=3D7 attr=3D000000000000000f
> (XEN)  000000009e000-000000009efff type=3D0 attr=3D000000000000000f
> (XEN)  000000009f000-000000009ffff type=3D3 attr=3D000000000000000f
> (XEN)  0000000100000-000003fffffff type=3D7 attr=3D000000000000000f
> (XEN)  0000040000000-00000403fffff type=3D0 attr=3D000000000000000f
> (XEN)  0000040400000-000005e359fff type=3D7 attr=3D000000000000000f
> (XEN)  000005e35a000-000005e399fff type=3D4 attr=3D000000000000000f
> (XEN)  000005e39a000-000006a47dfff type=3D7 attr=3D000000000000000f
> (XEN)  000006a47e000-000006c3eefff type=3D2 attr=3D000000000000000f
> (XEN)  000006c3ef000-000006d5eefff type=3D1 attr=3D000000000000000f
> (XEN)  000006d5ef000-000006d86cfff type=3D2 attr=3D000000000000000f
> (XEN)  000006d86d000-000006d978fff type=3D1 attr=3D000000000000000f
> (XEN)  000006d979000-000006dc7afff type=3D4 attr=3D000000000000000f
> (XEN)  000006dc7b000-000006dc98fff type=3D3 attr=3D000000000000000f
> (XEN)  000006dc99000-000006dcc7fff type=3D4 attr=3D000000000000000f
> (XEN)  000006dcc8000-000006dccdfff type=3D3 attr=3D000000000000000f
> (XEN)  000006dcce000-00000701a5fff type=3D4 attr=3D000000000000000f
> (XEN)  00000701a6000-00000701c8fff type=3D3 attr=3D000000000000000f
> (XEN)  00000701c9000-00000701edfff type=3D4 attr=3D000000000000000f
> (XEN)  00000701ee000-0000070204fff type=3D3 attr=3D000000000000000f
> (XEN)  0000070205000-000007022cfff type=3D4 attr=3D000000000000000f
> (XEN)  000007022d000-000007024afff type=3D3 attr=3D000000000000000f
> (XEN)  000007024b000-000007024bfff type=3D10 attr=3D000000000000000f
> (XEN)  000007024c000-000007024cfff type=3D6 attr=3D800000000000000f
> (XEN)  000007024d000-000007024dfff type=3D4 attr=3D000000000000000f
> (XEN)  000007024e000-0000070282fff type=3D3 attr=3D000000000000000f
> (XEN)  0000070283000-00000702c3fff type=3D4 attr=3D000000000000000f
> (XEN)  00000702c4000-00000702c8fff type=3D3 attr=3D000000000000000f
> (XEN)  00000702c9000-00000702defff type=3D4 attr=3D000000000000000f
> (XEN)  00000702df000-0000070307fff type=3D3 attr=3D000000000000000f
> (XEN)  0000070308000-0000070317fff type=3D4 attr=3D000000000000000f
> (XEN)  0000070318000-0000070319fff type=3D3 attr=3D000000000000000f
> (XEN)  000007031a000-0000070331fff type=3D4 attr=3D000000000000000f
> (XEN)  0000070332000-0000070349fff type=3D3 attr=3D000000000000000f
> (XEN)  000007034a000-0000070356fff type=3D2 attr=3D000000000000000f
> (XEN)  0000070357000-0000070357fff type=3D7 attr=3D000000000000000f
> (XEN)  0000070358000-0000070358fff type=3D2 attr=3D000000000000000f
> (XEN)  0000070359000-0000076f3efff type=3D4 attr=3D000000000000000f
> (XEN)  0000076f3f000-00000772affff type=3D7 attr=3D000000000000000f
> (XEN)  00000772b0000-0000077f18fff type=3D3 attr=3D000000000000000f
> (XEN)  0000077f19000-0000078986fff type=3D0 attr=3D000000000000000f
> (XEN)  0000078987000-0000078a03fff type=3D9 attr=3D000000000000000f
> (XEN)  0000078a04000-0000078ea2fff type=3D10 attr=3D000000000000000f
> (XEN)  0000078ea3000-000007ab22fff type=3D6 attr=3D800000000000000f
> (XEN)  000007ab23000-000007acfefff type=3D5 attr=3D800000000000000f
> (XEN)  000007acff000-000007acfffff type=3D4 attr=3D000000000000000f
> (XEN)  0000100000000-000047c7fffff type=3D7 attr=3D000000000000000f
> (XEN)  00000000a0000-00000000fffff type=3D0 attr=3D0000000000000000
> (XEN)  000007ad00000-000007adfffff type=3D0 attr=3D070000000000000f
> (XEN)  000007ae00000-000007f7fffff type=3D0 attr=3D0000000000000000
> (XEN)  00000f0000000-00000f7ffffff type=3D11 attr=3D800000000000100d
> (XEN)  00000fe000000-00000fe010fff type=3D11 attr=3D8000000000000001
> (XEN)  00000fec00000-00000fec00fff type=3D11 attr=3D8000000000000001
> (XEN)  00000fee00000-00000fee00fff type=3D11 attr=3D8000000000000001
> (XEN)  00000ff000000-00000ffffffff type=3D11 attr=3D800000000000100d
>
> Command line
> console=3Dcom1 dom0_mem=3Dmin:420M,max:420M,420M efi=3Dno-rs,attr=3Duc
> com1=3D115200,8n1,pci mbi-video vga=3Dcurrent flask=3Denforcing loglvl=3D=
debug
> guest_loglvl=3Ddebug smt=3D0 ucode=3D-1 bootscrub=3D1
> argo=3Dyes,mac-permissive=3D1 iommu=3Dforce,igfx
>
> iommu=3Dforce,igfx was to force igfx back on.  I added a dmi quirk to
> set no-igfx on this platform as a temporary workaround.
>
> > Have you tried adding dom0-iommu=3Dmap-inclusive to the Xen command
> > line?

Still seeing faults with dom0-iommu=3Dmap-inclusive.  At a different
address this time:
Oct 16 15:58:05.110768 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
Request device [0000:00:02.0] fault addr ea0c4f000, iommu reg =3D ffff
82c00021d000
Oct 16 15:58:05.110774 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
PTE Read access is not set
Oct 16 15:58:05.110777 VM hypervisor: (XEN) print_vtd_entries: iommu
#0 dev 0000:00:02.0 gmfn ea0c4f
Oct 16 15:58:05.110780 VM hypervisor: (XEN)     root_entry[00] =3D 46e12900=
1
Oct 16 15:58:05.110782 VM hypervisor: (XEN)     context[10] =3D 2_46e128001
Oct 16 15:58:05.110785 VM hypervisor: (XEN)     l4[000] =3D 46e11b003
Oct 16 15:58:05.110787 VM hypervisor: (XEN)     l3[03a] =3D 0
Oct 16 15:58:05.110789 VM hypervisor: (XEN)     l3[03a] not present

The previous posting, the two faulting addresses repeated in pairs.
Here it is only this one address repeating.

I plugged and unplugged and a different address was repeating with a
few other random addresses with 1 or 2 faults.  Here is uniq -c output
of the address and count pulled from the logs:
0x1ce9d6b000 2007
0x31b50d5000 1
0x1ce9d6b000 882
0x707741000 1
0x1ce9d6b000 1114
0x20d2099000 1
0x1ce9d6b000 3489
0xeb98eb000 1
0x1ce9d6b000 2430
0xeb98eb000 1
0x1ce9d6b000 1300
0x22f20bb000 1
0x1ce9d6b000 269
0x22f20bb000 1
0x1ce9d6b000 5091
0x6c99ec9000 1
0x1ce9d6b000 29
0xeb98eb000 1
0x1ce9d6b000 4599
0x6c99ec9000 1
0x1ce9d6b000 1989

In the i915 bug report, LAKSHMINARAYANA VUDUM commented "We have a
similar issue on SKL on our CI system
https://gitlab.freedesktop.org/drm/intel/-/issues/2017"

Regards,
Jason

