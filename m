Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6E61EE42D
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 14:08:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgoef-0001Tu-8H; Thu, 04 Jun 2020 12:07:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u/Ru=7R=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jgoee-0001Tp-1W
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 12:07:28 +0000
X-Inumbo-ID: f4d4c8a2-a65b-11ea-81bc-bc764e2007e4
Received: from mail-ej1-x62d.google.com (unknown [2a00:1450:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4d4c8a2-a65b-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 12:07:27 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gl26so5786170ejb.11
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2020 05:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t8SM/nW4BgsQUF9t4J8KD3LG9JTs+VZPVRCmaFf19EA=;
 b=OnPLxcVONbZ7KuTqzhXnAMGZiE8s67E1GRJBdYggpQaX6fyfNHOza3L8RJ7kyYH/JF
 hAOVJy6pC/XtBWtayokLeNipZkB4IQQVia02SIZbPwORzg94P0GHKHTISobYggfJDEdz
 zYsKVD4JO0rTViTwpFUVRb9Z+V4uh9Bmrza3hKSU/pjPAh+kgu0fNa278Z04oa6LMnKy
 Ps7pIEPsG04fqlMPFvPZYBKxijY6pUc2/Cieui1146bhaTohMNpNN7HqsDbHiZFACKaS
 ExCcVyaLGBsEy9y8dkkLGblF/wYRkWadn6B0HaY6CfLhHpl+LkqF8JL6iAYcrW0kkKyz
 ja9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t8SM/nW4BgsQUF9t4J8KD3LG9JTs+VZPVRCmaFf19EA=;
 b=gPqlAVSKJSuMEVSSrZQqkPGtQfbcDHk4WIsADs9CroAxR0Uk3Vs0UvaEdcDzZtppNr
 q9ICd5rS/Qosu3zPvnFBaqxbQ16zytLQ2sKezBnwjJy3QALIUYegjuA60dSIjExT0e9J
 xh1bjjw5iSEUD6+wtwc0JJeZP4CtAj0CHcjaRXNPwiorj43tPC7VqIdcXtuMOHybxsER
 oTqnJ0cyv+KkwcP9sRzokapbPg8y6mS2OrDss5jDUoVrrBoNsJsmL2epNqi01rAktQOk
 ARk2XqAx1QR7xrjjL8IvJPaUtlsajrP8kC2cNBSCdVlrZWcqGPSc+GnmqWBDH3IEZgMj
 XSZA==
X-Gm-Message-State: AOAM531lpqr8KX1eokWuUmu06xcEisjAoHyzoqJ6oHTvlHqE1hwrrYH7
 xf+jCgCWrk5ciY5UUZG8YS+ypBBbgE1GiFABnas=
X-Google-Smtp-Source: ABdhPJzAHrGLZ4/teiEH9hBk2XKVEV8+V4SSypNIyKR8OnSBQ/4gRRtI48+JwLfz+HR71aUWp8xv/O+HGU37p8ShCyw=
X-Received: by 2002:a17:906:11d9:: with SMTP id
 o25mr3420151eja.377.1591272446418; 
 Thu, 04 Jun 2020 05:07:26 -0700 (PDT)
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
In-Reply-To: <c2466674-a56e-08a4-7f3f-2438d5565953@xen.org>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Thu, 4 Jun 2020 08:07:12 -0400
Message-ID: <CALYbLDjNptWfVMGjw801y6f0zu40b2pzBnLS+w2Zx5eVStCUYQ@mail.gmail.com>
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

On Thu, Jun 4, 2020 at 6:16 AM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 04/06/2020 10:08, Bertrand Marquis wrote:
> > I would have thought that linux would have need some memory, even small=
 in the 32bit space in order to boot.
>
> Yes it needs some, but then they are switching to use the high memory
> alias after the MMU has been switch on.
>
>  From my understanding, the only difference is the page-tables will
> point to the high memory alias address rather than the low memory one.
> Linux will still be located at the same place but now accessed from the
> high memory alias rather than the low one.
>
> Note that AFAICT the secondary CPUs will still be brought-up using the
> low memory alias.
>
> > I could understand that some memory in the low address space needs to b=
e reserved by Linux as DMA area for peripherals not supporting 36-bit addre=
sses, but the whole low memory sounds like a big restriction.
> Many platforms have devices only supporting 32-bit DMA, but none of them
> require such aliasing. So this doesn't look to be the issue here.
>
> TBH, this code is only used by Keystone and switching address space is
> expensive (you have to turn off the MMU, updates page-tables, flush the
> cache...). I find hard to believe a developper would have come up with
> this complexity if it were possible to always use the low memory address
> range. It is even harder to believe Linux community would have accepted i=
t.
>
> >
> > Would it be possible to have a bit more information on the =E2=80=9Cpro=
blem with peripherals=E2=80=9D here ?
>
> I am curious as well, so I looked in more depth :). Going through the
> Linux history, one of the commit message [1] suggests they are switching
> to a coherent address space. The datasheet [2] (page 75) also confirm
> that the low region is not IO coherent.
>
> So I think you would not be able to do DMA without flush the cache which
> can be pretty expensive. For a PoC, it might be possible to force Linux
> flushing the area before and after each DMA request. This should be
> possible by marking the devices as not coherent.
>
> Although, I am not entirely sure if there is any fallout.
>
> @Dave, do you think it is possible for you to have a try? I can provide
> the patch for Linux to disable DMA coherency if possible.
I attempted to do that, where I removed the "dma-coherent" flags from
the device tree.  There are likely other issues, but the most glaring
problem that I ran into is that the ethernet does not work.  Eth0
shows up in ifconfig but there is no activity on it after a small
handful of message exchanges, whereas booting without Xen it seems to
work fine even if left in 32-bit mode (with the dma-coherent
disabled).  I don't know what implications behind the scenes there are
trying to stay in the lower 0x8000_0000 alias range either though.  I
would rather run it as intended by switching to the upper
0x8_0000_0000 alias region.

>
> For a proper solution, I think we need to implement something similar to
> what I wrote earlier.
>
> Cheers,
>
> [1] 5eb3da7246a5b2dfac9f38a7be62b1a0295584c7
> [2] https://www.ti.com/lit/ds/symlink/tci6638k2k.pdf?ts=3D1591183242813
>
>
> --
> Julien Grall

