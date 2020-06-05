Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767A11EEF81
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 04:31:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh276-00030o-Nx; Fri, 05 Jun 2020 02:29:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Us8T=7S=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jh274-00030j-Of
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 02:29:42 +0000
X-Inumbo-ID: 68f6ee68-a6d4-11ea-9dbe-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68f6ee68-a6d4-11ea-9dbe-bc764e2007e4;
 Fri, 05 Jun 2020 02:29:41 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id e2so8320139eje.13
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2020 19:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t2NFtE9sz42OOu0h+GgXPWg/xv0bMlss/DfefnWMZYk=;
 b=VOLo/rMpfj0CPqsnUN4/Yn14PGO8Fa23WQvfhNDvAtGRdmSUbNnOEH+O0qyGWhj0a5
 h/Uv89WcnuwjlyEGwMcXzuY3JiSpMLLmm3kSJJ5LKKTgrAVZ4JegO/Zr7pYA36kcocoK
 4bcMprcXZ+sUqLebHAwHv8dUR5f/mFH961dtEhbi5vhBjNEKRdfM+xWDid9GzZ3N1Lwa
 sjFoB3dTf9Wh0ci230G6BkO+CeujMYjI+xweHgxqD8kppYpzv5LIxSr+K0K2wgGm46Hw
 Lz7sSaiy6T65G/HAEDX+NzsJ6h5mgOwxKHAxEjilavjZurNkSrmXKoWxk/einCxibrHK
 WbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t2NFtE9sz42OOu0h+GgXPWg/xv0bMlss/DfefnWMZYk=;
 b=YJvpGZpHw10fEGKd3VvsTuPP/5XvPc9XtMvRDnsNC0SbDe2NotcmPpSf4kgAe5pnkF
 FoxVfZpVN3BCFiBSOtk/8gQ1rZI+XehJf0N5uO7FsYzVswuLHdrJAI7bhLkA+urukWVx
 kviaDgFjBQGRngA96O48TVA/fU2ib4pXWSwUgW8u+t44pIhNrts9AXBX7ddw++m0X4nQ
 kxy0ikke3QIpKzc6rbXEj0gfQ44R/Fj6uVoSFmjnd1Z+YwhhttCixd4NmYf3180ipkSF
 ym0d06lyvitduKJVkr+3l221Uf+oSjFTo8Wt5fhoD1cAPYpx4n20tnOnWlsPRH6dn93C
 5K7Q==
X-Gm-Message-State: AOAM533Bcvw07zHv3GbwERgrFaK22HBSMPyUbBVqauj8htt/35frqfZ6
 CceiUhM9/X/eXqmy1TULfq+1kpDZhssuQc0QBC8=
X-Google-Smtp-Source: ABdhPJx+jgGQH5nSmZzWNGsn0gRLTNmFwkPn7uFYKFceyB7Gwxhi0Xdece7coAO/YjkWA0lCDqCLnZmO9FLEFPKk2Xw=
X-Received: by 2002:a17:906:11d9:: with SMTP id
 o25mr6335701eja.377.1591324180865; 
 Thu, 04 Jun 2020 19:29:40 -0700 (PDT)
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
In-Reply-To: <da23ecc8-60f0-8a26-58d5-ea692dcf0102@xen.org>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Thu, 4 Jun 2020 22:29:28 -0400
Message-ID: <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
Subject: Re: Keystone Issue
To: Julien Grall <julien@xen.org>
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 4, 2020 at 2:24 PM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 04/06/2020 13:07, CodeWiz2280 wrote:
> > On Thu, Jun 4, 2020 at 6:16 AM Julien Grall <julien@xen.org> wrote:
> >>
> >> Hi,
> >>
> >> On 04/06/2020 10:08, Bertrand Marquis wrote:
> >>> I would have thought that linux would have need some memory, even sma=
ll in the 32bit space in order to boot.
> >>
> >> Yes it needs some, but then they are switching to use the high memory
> >> alias after the MMU has been switch on.
> >>
> >>   From my understanding, the only difference is the page-tables will
> >> point to the high memory alias address rather than the low memory one.
> >> Linux will still be located at the same place but now accessed from th=
e
> >> high memory alias rather than the low one.
> >>
> >> Note that AFAICT the secondary CPUs will still be brought-up using the
> >> low memory alias.
> >>
> >>> I could understand that some memory in the low address space needs to=
 be reserved by Linux as DMA area for peripherals not supporting 36-bit add=
resses, but the whole low memory sounds like a big restriction.
> >> Many platforms have devices only supporting 32-bit DMA, but none of th=
em
> >> require such aliasing. So this doesn't look to be the issue here.
> >>
> >> TBH, this code is only used by Keystone and switching address space is
> >> expensive (you have to turn off the MMU, updates page-tables, flush th=
e
> >> cache...). I find hard to believe a developper would have come up with
> >> this complexity if it were possible to always use the low memory addre=
ss
> >> range. It is even harder to believe Linux community would have accepte=
d it.
> >>
> >>>
> >>> Would it be possible to have a bit more information on the =E2=80=9Cp=
roblem with peripherals=E2=80=9D here ?
> >>
> >> I am curious as well, so I looked in more depth :). Going through the
> >> Linux history, one of the commit message [1] suggests they are switchi=
ng
> >> to a coherent address space. The datasheet [2] (page 75) also confirm
> >> that the low region is not IO coherent.
> >>
> >> So I think you would not be able to do DMA without flush the cache whi=
ch
> >> can be pretty expensive. For a PoC, it might be possible to force Linu=
x
> >> flushing the area before and after each DMA request. This should be
> >> possible by marking the devices as not coherent.
> >>
> >> Although, I am not entirely sure if there is any fallout.
> >>
> >> @Dave, do you think it is possible for you to have a try? I can provid=
e
> >> the patch for Linux to disable DMA coherency if possible.
> > I attempted to do that, where I removed the "dma-coherent" flags from
> > the device tree.  There are likely other issues, but the most glaring
> > problem that I ran into is that the ethernet does not work.  Eth0
> > shows up in ifconfig but there is no activity on it after a small
> > handful of message exchanges, whereas booting without Xen it seems to
> > work fine even if left in 32-bit mode (with the dma-coherent
> > disabled).  I don't know what implications behind the scenes there are
> > trying to stay in the lower 0x8000_0000 alias range either though.
>
> Thank you for the answer. As wrote, Linux is working fine in 32-bit mode
> when dma-coherent is left in 32-bit mode. So this suggest a different
> issue on the platform.
>
> Given that you receive an handful of packet and then nothing, this would
> lead to maybe an interrupt problem. Can you check whether the number of
> interrupts increments the same way on baremetal and on Xen?
>
> Dumping /proc/interrupts should be sufficient.
>
I am able to ping the board from itself, do you think it could still
be an interrupt issue?  It just cannot seem to ping out to a different
host (or ping from
my pc).  Unfortunately, the interrupts for the netcp Ethernet driver
on this board don't show up in the cat /proc/interrupts output under
the non-Xen kernel or
Xen loaded kernel from what I can tell.  I'm not sure how I would confirm t=
hat.

> > I
> > would rather run it as intended by switching to the upper
> > 0x8_0000_0000 alias region.
>
> I agree this would be ideal :).
>
> Cheers,
>
> --
> Julien Grall

