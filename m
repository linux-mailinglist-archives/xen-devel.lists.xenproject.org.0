Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4DE1EF754
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 14:26:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhBPz-0004Yt-97; Fri, 05 Jun 2020 12:25:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Us8T=7S=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jhBPy-0004Yo-JE
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 12:25:50 +0000
X-Inumbo-ID: b040c8f4-a727-11ea-ba62-bc764e2007e4
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b040c8f4-a727-11ea-ba62-bc764e2007e4;
 Fri, 05 Jun 2020 12:25:49 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id l12so6127542ejn.10
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2020 05:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f2LAqKOptg+KacV4p0Xdmg+M+FNYWQVRRgYfWTzbnYo=;
 b=a/K45qyX1YAgqK+s6WPHbjFUStj52TCRaQGYmmpe8qzIwG17BbY9mEG/o+EtV4WLzF
 diQ8LzQ9xJnMfz6ZazRLmWZC4DwkviIOwMnmSR5+11hRVc7D3AzA8ETtbMRm36HRgqW0
 /CsOfk0BzqAhgQOHStCqRlpUWYam6NZhBP1JWHOy0hEqbyteWeM5xmkw6fDbnMkH0OtC
 RDLoyfT31gl/87V2wfUuqP90Tl7O77v+Trkq+9db3ww7ECtC3PNFBhKQQdbA5yVB6LdJ
 7Qg4zU+8SahrmDVwwQLDz66uQMjYtr/9Hjw/M6/ouQFB9ri1OcQIXcQ9j7UJIwKM7V8E
 TSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f2LAqKOptg+KacV4p0Xdmg+M+FNYWQVRRgYfWTzbnYo=;
 b=bl2iX9mfG8IkcnOF3rijpZA2je91Tt7SXJoLh+ADfNnLrI/iQ3OeD1xF99oOlTlmS2
 ER50+tkulTj36/aARiPFTRYsNei1nbzn09sUknTGOaWBX0d3S2w7m4xge3mvjlL39QYi
 a8DjBLL1Zq2xxXbBHppi7tTlwfkl5z9x9KOibIOXx86KPaCr4+aanVhRvxBD8xbL9BCi
 EFqYpJ5gns0xFqq7a7CAWF2eN2hrrtxr1CnEnsAH67tr43pS9ZHYkzYfkxr4yzFWdLy/
 gDNT7lrBu173nxRWEeLwVV8Ey5t8hw8tQMAZtWu2++hsb2fQp+xKRt002NVwGCfbGEPS
 +KFA==
X-Gm-Message-State: AOAM530fWNEj5pleGNKyxGexQ6hBLRVCJyX73Csbo7mDKCjmR0gyEyIA
 3XIRtl3SiQVMc1M6enVGkkA48mI7Mlr04XPJey4=
X-Google-Smtp-Source: ABdhPJwCFXVCpyYlwn2irhMpkBJs3xwaIS9By65SJehmMSk5qRUy7/8C2YmCTWhM8tnCAcOqXlb+LdIykqLTLv1tBGE=
X-Received: by 2002:a17:906:11d9:: with SMTP id
 o25mr8182151eja.377.1591359948627; 
 Fri, 05 Jun 2020 05:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
 <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
 <CALYbLDit9mx=DHbUAu2mTrKTvkxt3RfPhV1xQPRVP1gPmxU6aw@mail.gmail.com>
 <25953300-f69d-19a4-9215-49cfedbd16ed@xen.org>
 <CALYbLDh3C02+CV88LqR2zv+ggRgup-Qhi+udGzgePmkdM0KcFw@mail.gmail.com>
 <deee1523-cfb5-f186-11a3-33fa1f7b94c1@xen.org>
 <8C39F9D0-8351-4671-9A39-D5D4BFF02BD6@arm.com>
 <3ff17aa9-0aae-d598-40ce-4e90d4e50cc7@xen.org>
 <00E14EAD-BD23-4A3A-872E-0C47C26B7B41@arm.com>
 <c2466674-a56e-08a4-7f3f-2438d5565953@xen.org>
 <CALYbLDjNptWfVMGjw801y6f0zu40b2pzBnLS+w2Zx5eVStCUYQ@mail.gmail.com>
 <da23ecc8-60f0-8a26-58d5-ea692dcf0102@xen.org>
 <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
 <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
In-Reply-To: <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Fri, 5 Jun 2020 08:25:34 -0400
Message-ID: <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
Subject: Re: Keystone Issue
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 5, 2020 at 3:37 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi,
>
> > On 5 Jun 2020, at 03:29, CodeWiz2280 <codewiz2280@gmail.com> wrote:
> >
> > On Thu, Jun 4, 2020 at 2:24 PM Julien Grall <julien@xen.org> wrote:
> >>
> >> Hi,
> >>
> >> On 04/06/2020 13:07, CodeWiz2280 wrote:
> >>> On Thu, Jun 4, 2020 at 6:16 AM Julien Grall <julien@xen.org> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> On 04/06/2020 10:08, Bertrand Marquis wrote:
> >>>>> I would have thought that linux would have need some memory, even s=
mall in the 32bit space in order to boot.
> >>>>
> >>>> Yes it needs some, but then they are switching to use the high memor=
y
> >>>> alias after the MMU has been switch on.
> >>>>
> >>>>  From my understanding, the only difference is the page-tables will
> >>>> point to the high memory alias address rather than the low memory on=
e.
> >>>> Linux will still be located at the same place but now accessed from =
the
> >>>> high memory alias rather than the low one.
> >>>>
> >>>> Note that AFAICT the secondary CPUs will still be brought-up using t=
he
> >>>> low memory alias.
> >>>>
> >>>>> I could understand that some memory in the low address space needs =
to be reserved by Linux as DMA area for peripherals not supporting 36-bit a=
ddresses, but the whole low memory sounds like a big restriction.
> >>>> Many platforms have devices only supporting 32-bit DMA, but none of =
them
> >>>> require such aliasing. So this doesn't look to be the issue here.
> >>>>
> >>>> TBH, this code is only used by Keystone and switching address space =
is
> >>>> expensive (you have to turn off the MMU, updates page-tables, flush =
the
> >>>> cache...). I find hard to believe a developper would have come up wi=
th
> >>>> this complexity if it were possible to always use the low memory add=
ress
> >>>> range. It is even harder to believe Linux community would have accep=
ted it.
> >>>>
> >>>>>
> >>>>> Would it be possible to have a bit more information on the =E2=80=
=9Cproblem with peripherals=E2=80=9D here ?
> >>>>
> >>>> I am curious as well, so I looked in more depth :). Going through th=
e
> >>>> Linux history, one of the commit message [1] suggests they are switc=
hing
> >>>> to a coherent address space. The datasheet [2] (page 75) also confir=
m
> >>>> that the low region is not IO coherent.
> >>>>
> >>>> So I think you would not be able to do DMA without flush the cache w=
hich
> >>>> can be pretty expensive. For a PoC, it might be possible to force Li=
nux
> >>>> flushing the area before and after each DMA request. This should be
> >>>> possible by marking the devices as not coherent.
> >>>>
> >>>> Although, I am not entirely sure if there is any fallout.
> >>>>
> >>>> @Dave, do you think it is possible for you to have a try? I can prov=
ide
> >>>> the patch for Linux to disable DMA coherency if possible.
> >>> I attempted to do that, where I removed the "dma-coherent" flags from
> >>> the device tree.  There are likely other issues, but the most glaring
> >>> problem that I ran into is that the ethernet does not work.  Eth0
> >>> shows up in ifconfig but there is no activity on it after a small
> >>> handful of message exchanges, whereas booting without Xen it seems to
> >>> work fine even if left in 32-bit mode (with the dma-coherent
> >>> disabled).  I don't know what implications behind the scenes there ar=
e
> >>> trying to stay in the lower 0x8000_0000 alias range either though.
> >>
> >> Thank you for the answer. As wrote, Linux is working fine in 32-bit mo=
de
> >> when dma-coherent is left in 32-bit mode. So this suggest a different
> >> issue on the platform.
> >>
> >> Given that you receive an handful of packet and then nothing, this wou=
ld
> >> lead to maybe an interrupt problem. Can you check whether the number o=
f
> >> interrupts increments the same way on baremetal and on Xen?
> >>
> >> Dumping /proc/interrupts should be sufficient.
> >>
> > I am able to ping the board from itself, do you think it could still
> > be an interrupt issue?  It just cannot seem to ping out to a different
> > host (or ping from
> > my pc).  Unfortunately, the interrupts for the netcp Ethernet driver
> > on this board don't show up in the cat /proc/interrupts output under
> > the non-Xen kernel or
> > Xen loaded kernel from what I can tell.  I'm not sure how I would confi=
rm that.
>
> Could you check the content of /proc/interrupts ?
>
> I did raise an issue several years ago on the keystone 2 related to inter=
rupts and virtualization (no with Xen but the context should still be right=
):
> https://e2e.ti.com/support/processors/f/791/t/462126?Keystone-2-no-interr=
upts-received-out-of-80-and-92-
>
> There might be something to check in regards to level vs front interrupts=
 for forwarded interrupts.
>
The Keystone uses the netcp driver, which has interrupts from 40-79
listed in the device tree (arch/arm/boot/keystone-k2e-netcp.dtsi).
I'm using the same device tree between my non-xen standalone kernel
and my dom0 kernel booted by xen.  In the standalone (non-xen) kernel
the ethernet works fine, but I don't see any of its interrupts in the
output of /proc/iomem.  I'm not seeing them in /proc/iomem when
running dom0 under Xen either.  When booting with Xen I get this
behavior where the ifconfig output shows 1 RX message and 1 TX
message, and then nothing else.

> Regards
> Bertrand
>
>
>
> >
> >>> I
> >>> would rather run it as intended by switching to the upper
> >>> 0x8_0000_0000 alias region.
> >>
> >> I agree this would be ideal :).
> >>
> >> Cheers,
> >>
> >> --
> >> Julien Grall
>

