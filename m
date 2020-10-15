Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D017C28F5AC
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:16:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7487.19589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4zP-0002Qw-Q8; Thu, 15 Oct 2020 15:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7487.19589; Thu, 15 Oct 2020 15:16:23 +0000
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
	id 1kT4zP-0002QS-Mf; Thu, 15 Oct 2020 15:16:23 +0000
Received: by outflank-mailman (input) for mailman id 7487;
 Thu, 15 Oct 2020 15:16:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Un/f=DW=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kT4zN-0002Q2-Uf
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:16:22 +0000
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3898e9b7-0fff-45de-b312-cf77ddb844c5;
 Thu, 15 Oct 2020 15:16:20 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m20so3547187ljj.5
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 08:16:20 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Un/f=DW=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kT4zN-0002Q2-Uf
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:16:22 +0000
X-Inumbo-ID: 3898e9b7-0fff-45de-b312-cf77ddb844c5
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3898e9b7-0fff-45de-b312-cf77ddb844c5;
	Thu, 15 Oct 2020 15:16:20 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m20so3547187ljj.5
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 08:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EO3Pq/O9VK6xNin3xKMxdHsOCMg9IBLz2CPySgXeILA=;
        b=R882uVN07sZSNnnQOaXiTsFAJzI11bA/kvOZ0stS65DI1vTNl0AUsJ3WkHw4RPMSO9
         B96KIHxgScUpB3FRTUrdCgKGDQLgrHnCPZ9lUWlH1CdMdDhehpXR970515G74w+0MYov
         7+iVbw+MtBoSYX9qUQAQ/C1lC91ot1JVbMOQjk/q2Fo/7VK/V6I3sOnKu/WBFxdmlnHy
         IvB2gZV0tsqB0bw7b+Z7WN6uNyLaxDbpZh6Zb8ALiELYs+rK0xJo3iFhqWwL/Lq99tD7
         LBmvtUdTBn/igSkWt36pmP+min85tz9+kU+ohwqvD8yPhYejRKjuMBJC3yaUmh2N3fPP
         +58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EO3Pq/O9VK6xNin3xKMxdHsOCMg9IBLz2CPySgXeILA=;
        b=uZDFVZlUPpnBND6SFQo1BUebtsJ6bHS6w2eCLSUdi6DpK+EIK2J90D4pP+4hLYpnMy
         EptsM6C5a7GxUffW9ZY5M1xWI/iXgzgAHVoKzBEokhSyRxIE7REyF4UuhiSSdt8Ra+ID
         M9dheGpUz2iyCia1lQ55DXK8gj9SSWgjAIVMBdOfMVgExMGzlPsABRR9/ET0VdhcqxQy
         yasi+uiMrMq5C1pqURzC7ZbgHXxzJP0zQ3sNuaqrDVxwyn7f6Qmx8mF7KRoSdBTJgGnS
         rJsbydCavd9Rq4mcbnA8ryi+eRyE8mXFVUVCVwWc8zF+RnQc6N3PwIN5tP5q+JF6n1fR
         sfIg==
X-Gm-Message-State: AOAM533RS8mY6LiatwdbVYMe7srYbrHtEsHrlarRot5bS5pZvlS6Biw8
	jckKKXBppnhnSqB/rOt/Lg+e9TKZ0AvqkUIqDQc=
X-Google-Smtp-Source: ABdhPJxO61tN56k8WsMx+OlUMGaTnPo5KMLMC9qnlkNooaRsP7rjCS0Rw21MllusQl2jFsvwQESW/Kq9/9guT2/BUqc=
X-Received: by 2002:a2e:b0c7:: with SMTP id g7mr1403613ljl.433.1602774979413;
 Thu, 15 Oct 2020 08:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
 <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com> <20201015113109.GA68032@Air-de-Roger>
In-Reply-To: <20201015113109.GA68032@Air-de-Roger>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 15 Oct 2020 11:16:07 -0400
Message-ID: <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com>
Subject: Re: i915 dma faults on Xen
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, intel-gfx@lists.freedesktop.org, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2020 at 7:31 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Wed, Oct 14, 2020 at 08:37:06PM +0100, Andrew Cooper wrote:
> > On 14/10/2020 20:28, Jason Andryuk wrote:
> > > Hi,
> > >
> > > Bug opened at https://gitlab.freedesktop.org/drm/intel/-/issues/2576
> > >
> > > I'm seeing DMA faults for the i915 graphics hardware on a Dell
> > > Latitude 5500. These were captured when I plugged into a Dell
> > > Thunderbolt dock with two DisplayPort monitors attached.  Xen 4.12.4
> > > staging and Linux 5.4.70 (and some earlier versions).
> > >
> > > Oct 14 18:41:49.056490 kernel:[   85.570347] [drm:gen8_de_irq_handler
> > > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > > Oct 14 18:41:49.056494 kernel:[   85.570395] [drm:gen8_de_irq_handler
> > > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > > Oct 14 18:41:49.056589 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
> > > Request device [0000:00:02.0] fault addr 39b5845000, iommu reg =3D
> > > ffff82c00021d000
> > > Oct 14 18:41:49.056594 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
> > > PTE Read access is not set
> > > Oct 14 18:41:49.056784 kernel:[   85.570668] [drm:gen8_de_irq_handler
> > > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > > Oct 14 18:41:49.056789 kernel:[   85.570687] [drm:gen8_de_irq_handler
> > > [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> > > Oct 14 18:41:49.056885 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
> > > Request device [0000:00:02.0] fault addr 4238d0a000, iommu reg =3D
> > > ffff82c00021d000
> > > Oct 14 18:41:49.056890 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
> > > PTE Read access is not set
> > >
> > > They repeat. In the log attached to
> > > https://gitlab.freedesktop.org/drm/intel/-/issues/2576, they start at
> > > "Oct 14 18:41:49.056589" and continue until I unplug the dock around
> > > "Oct 14 18:41:54.801802".
> > >
> > > I've also seen similar messages when attaching the laptop's HDMI port
> > > to a 4k monitor. The eDP display by itself seems okay.
> > >
> > > I tried Fedora 31 & 32 live images with intel_iommu=3Don, so no Xen, =
and
> > > didn't see any errors
> > >
> > > This is a kernel & xen log with drm.debug=3D0x1e. It also includes so=
me
> > > application (glass) logging when it changes resolutions which seems t=
o
> > > set off the DMA faults. 5500-igfx-messages-kern-xen-glass
> > >
> > > Running xen with iommu=3Dno-igfx disables the iommu for the i915
> > > graphics and no faults are reported. However, that breaks some other
> > > devices (Dell Latitude 7200 and 5580) giving a black screen with:
> > >
> > > Oct 10 13:24:37.022117 kernel:[   14.884759] i915 0000:00:02.0: Faile=
d
> > > to idle engines, declaring wedged!
> > > Oct 10 13:24:37.022118 kernel:[   14.964794] i915 0000:00:02.0: Faile=
d
> > > to initialize GPU, declaring it wedged!
> > >
> > > Any suggestions welcome.
> >
> > Presumably this is with a PV dom0.  What are 39b5845000 and 4238d0a000
> > in the machine memory map?

They are bogus?
End of RAM is 0x47c800000
Thats:
0x047c800000
vs.
0x39b5845000
0x4238d0a000

> > This smells like a missing RMRR in the ACPI tables.
>
> I agree.
>
> Can you paste the memory map as printed by Xen when booting, and what
> command line are you using to boot Xen.

So this is OpenXT, and it's booting EFI -> xen -> tboot -> xen

There's the memory map
(XEN) TBOOT RAM map:
(XEN)  0000000000000000 - 0000000000060000 (usable)
(XEN)  0000000000060000 - 0000000000068000 (reserved)
(XEN)  0000000000068000 - 000000000009e000 (usable)
(XEN)  000000000009e000 - 000000000009f000 (reserved)
(XEN)  000000000009f000 - 00000000000a0000 (usable)
(XEN)  00000000000a0000 - 0000000000100000 (reserved)
(XEN)  0000000000100000 - 0000000040000000 (usable)
(XEN)  0000000040000000 - 0000000040400000 (reserved)
(XEN)  0000000040400000 - 000000007024b000 (usable)
(XEN)  000000007024b000 - 000000007024c000 (ACPI NVS)
(XEN)  000000007024c000 - 000000007024d000 (reserved)
(XEN)  000000007024d000 - 0000000077f19000 (usable)
(XEN)  0000000077f19000 - 0000000078987000 (reserved)
(XEN)  0000000078987000 - 0000000078a04000 (ACPI data)
(XEN)  0000000078a04000 - 0000000078ea3000 (ACPI NVS)
(XEN)  0000000078ea3000 - 000000007acff000 (reserved)
(XEN)  000000007acff000 - 000000007ad00000 (usable)
(XEN)  000000007ad00000 - 000000007f800000 (reserved)
(XEN)  00000000f0000000 - 00000000f8000000 (reserved)
(XEN)  00000000fe000000 - 00000000fe011000 (reserved)
(XEN)  00000000fec00000 - 00000000fec01000 (reserved)
(XEN)  00000000fee00000 - 00000000fee01000 (reserved)
(XEN)  00000000ff000000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 000000047c800000 (usable)
(XEN) EFI memory map:
(XEN)  0000000000000-000000009dfff type=3D7 attr=3D000000000000000f
(XEN)  000000009e000-000000009efff type=3D0 attr=3D000000000000000f
(XEN)  000000009f000-000000009ffff type=3D3 attr=3D000000000000000f
(XEN)  0000000100000-000003fffffff type=3D7 attr=3D000000000000000f
(XEN)  0000040000000-00000403fffff type=3D0 attr=3D000000000000000f
(XEN)  0000040400000-000005e359fff type=3D7 attr=3D000000000000000f
(XEN)  000005e35a000-000005e399fff type=3D4 attr=3D000000000000000f
(XEN)  000005e39a000-000006a47dfff type=3D7 attr=3D000000000000000f
(XEN)  000006a47e000-000006c3eefff type=3D2 attr=3D000000000000000f
(XEN)  000006c3ef000-000006d5eefff type=3D1 attr=3D000000000000000f
(XEN)  000006d5ef000-000006d86cfff type=3D2 attr=3D000000000000000f
(XEN)  000006d86d000-000006d978fff type=3D1 attr=3D000000000000000f
(XEN)  000006d979000-000006dc7afff type=3D4 attr=3D000000000000000f
(XEN)  000006dc7b000-000006dc98fff type=3D3 attr=3D000000000000000f
(XEN)  000006dc99000-000006dcc7fff type=3D4 attr=3D000000000000000f
(XEN)  000006dcc8000-000006dccdfff type=3D3 attr=3D000000000000000f
(XEN)  000006dcce000-00000701a5fff type=3D4 attr=3D000000000000000f
(XEN)  00000701a6000-00000701c8fff type=3D3 attr=3D000000000000000f
(XEN)  00000701c9000-00000701edfff type=3D4 attr=3D000000000000000f
(XEN)  00000701ee000-0000070204fff type=3D3 attr=3D000000000000000f
(XEN)  0000070205000-000007022cfff type=3D4 attr=3D000000000000000f
(XEN)  000007022d000-000007024afff type=3D3 attr=3D000000000000000f
(XEN)  000007024b000-000007024bfff type=3D10 attr=3D000000000000000f
(XEN)  000007024c000-000007024cfff type=3D6 attr=3D800000000000000f
(XEN)  000007024d000-000007024dfff type=3D4 attr=3D000000000000000f
(XEN)  000007024e000-0000070282fff type=3D3 attr=3D000000000000000f
(XEN)  0000070283000-00000702c3fff type=3D4 attr=3D000000000000000f
(XEN)  00000702c4000-00000702c8fff type=3D3 attr=3D000000000000000f
(XEN)  00000702c9000-00000702defff type=3D4 attr=3D000000000000000f
(XEN)  00000702df000-0000070307fff type=3D3 attr=3D000000000000000f
(XEN)  0000070308000-0000070317fff type=3D4 attr=3D000000000000000f
(XEN)  0000070318000-0000070319fff type=3D3 attr=3D000000000000000f
(XEN)  000007031a000-0000070331fff type=3D4 attr=3D000000000000000f
(XEN)  0000070332000-0000070349fff type=3D3 attr=3D000000000000000f
(XEN)  000007034a000-0000070356fff type=3D2 attr=3D000000000000000f
(XEN)  0000070357000-0000070357fff type=3D7 attr=3D000000000000000f
(XEN)  0000070358000-0000070358fff type=3D2 attr=3D000000000000000f
(XEN)  0000070359000-0000076f3efff type=3D4 attr=3D000000000000000f
(XEN)  0000076f3f000-00000772affff type=3D7 attr=3D000000000000000f
(XEN)  00000772b0000-0000077f18fff type=3D3 attr=3D000000000000000f
(XEN)  0000077f19000-0000078986fff type=3D0 attr=3D000000000000000f
(XEN)  0000078987000-0000078a03fff type=3D9 attr=3D000000000000000f
(XEN)  0000078a04000-0000078ea2fff type=3D10 attr=3D000000000000000f
(XEN)  0000078ea3000-000007ab22fff type=3D6 attr=3D800000000000000f
(XEN)  000007ab23000-000007acfefff type=3D5 attr=3D800000000000000f
(XEN)  000007acff000-000007acfffff type=3D4 attr=3D000000000000000f
(XEN)  0000100000000-000047c7fffff type=3D7 attr=3D000000000000000f
(XEN)  00000000a0000-00000000fffff type=3D0 attr=3D0000000000000000
(XEN)  000007ad00000-000007adfffff type=3D0 attr=3D070000000000000f
(XEN)  000007ae00000-000007f7fffff type=3D0 attr=3D0000000000000000
(XEN)  00000f0000000-00000f7ffffff type=3D11 attr=3D800000000000100d
(XEN)  00000fe000000-00000fe010fff type=3D11 attr=3D8000000000000001
(XEN)  00000fec00000-00000fec00fff type=3D11 attr=3D8000000000000001
(XEN)  00000fee00000-00000fee00fff type=3D11 attr=3D8000000000000001
(XEN)  00000ff000000-00000ffffffff type=3D11 attr=3D800000000000100d

Command line
console=3Dcom1 dom0_mem=3Dmin:420M,max:420M,420M efi=3Dno-rs,attr=3Duc
com1=3D115200,8n1,pci mbi-video vga=3Dcurrent flask=3Denforcing loglvl=3Dde=
bug
guest_loglvl=3Ddebug smt=3D0 ucode=3D-1 bootscrub=3D1
argo=3Dyes,mac-permissive=3D1 iommu=3Dforce,igfx

iommu=3Dforce,igfx was to force igfx back on.  I added a dmi quirk to
set no-igfx on this platform as a temporary workaround.

> Have you tried adding dom0-iommu=3Dmap-inclusive to the Xen command
> line?

I have not.  I can try that tomorrow when I have access to the system again=
.

Thanks,
Jason

