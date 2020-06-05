Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7B01EFC27
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 17:06:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhDv8-0005IZ-8c; Fri, 05 Jun 2020 15:06:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Us8T=7S=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jhDv6-0005IU-3I
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 15:06:08 +0000
X-Inumbo-ID: 120253bc-a73e-11ea-9ad7-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 120253bc-a73e-11ea-9ad7-bc764e2007e4;
 Fri, 05 Jun 2020 15:06:02 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id k11so10473640ejr.9
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2020 08:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JcnrW+4OtBFehwzMUvyDhu5hsC2RiI9k0jFaO/yViHM=;
 b=m1e3cxZy7634q/AXhXKti6gqoXLr4wS44BoZTvaAp/DdjGxiieEwW6IJZ8mLn5/+dU
 ZpQ/Fs2rvQ+o5z0vV9TYRrvoF6RUd4886rEVu40sQMtgZohf4OdnXiD35gXz1idzNPLb
 UqX1LQJE1PCpo4EZ5m1Sl9s7NcJ7qEAAa/Su0TlBCjn842xMwXFpbla5sJ0E6lXfG3en
 EA0Nz9JMQlJvcvmQzJHphqUZT79rYKVU4cm85C/5/hxIJJf1gewflOSIYNZLKGwgydJd
 Z8FI9e9nFmJjk51U6E5RTVupTJnfNV1iROUmKCWc5GBIGxYba6XmayTaEKlAbl8yI0yf
 gcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JcnrW+4OtBFehwzMUvyDhu5hsC2RiI9k0jFaO/yViHM=;
 b=LhPQJt8WlJR9GMTTdMptEeW3wXua8V1Hvf9cALWDsVNCoiS588hacXtQGWledx6oyo
 EnSToWbaER1LWRSG3okPeAsbb/wX5P0zTM95wkNiONNfHqqVTVdDRWOO4D4eotv/7tI5
 nSAnVp3WajhHXSqXqNeDSRlXjOCavB0ZoWnIAUgE13nKXjBakFHhOiBUJ3dfGwJEX3Pt
 eD32iJsank7BG+RwWxXARve4YJOM+WobnnOfNaiLKMtvcGg/N+wvr9kMbyNOOMPGW32S
 WcLtJwX3r8w7TlM2TjJZCsohxXde5/+vawUdevProLpyKoIUPxqyHiyGlap5feU/YjYN
 qC8Q==
X-Gm-Message-State: AOAM533tAjWYO1LjLbDscLoC/KjiexfscpSlvAnFWe0eUC2R6r0YCDq0
 zwqaY0vheLnsJFvy4BnnPtAbn0ZPWltPWBZ8pMk=
X-Google-Smtp-Source: ABdhPJxMbXvAclte20t8Ns5/tDNTJ/QX2JoXQ2V0XkqUP8ugA9QCXVPG76LoVxVXBbH/EnzvxRAPP7hSaf+q5O96yPM=
X-Received: by 2002:a17:906:4ecf:: with SMTP id
 i15mr9576364ejv.515.1591369561590; 
 Fri, 05 Jun 2020 08:06:01 -0700 (PDT)
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
 <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
 <14244e49-e1ac-a29d-bbd9-bd4c202bf186@xen.org>
 <CALYbLDjCdDvwja1VoahJmnrKDfKyw7DNhYBBcmJv70QDA4+6Ag@mail.gmail.com>
 <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
In-Reply-To: <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Fri, 5 Jun 2020 11:05:49 -0400
Message-ID: <CALYbLDheT8jWSAqJJZvvjzWGvygJaJ6UG7ejgpLLYeQB-tCsJA@mail.gmail.com>
Subject: Re: Keystone Issue
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Jun 5, 2020 at 8:47 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
>
>
> > On 5 Jun 2020, at 13:42, CodeWiz2280 <codewiz2280@gmail.com> wrote:
> >
> > On Fri, Jun 5, 2020 at 8:30 AM Julien Grall <julien@xen.org> wrote:
> >>
> >> Hi,
> >>
> >> On 05/06/2020 13:25, CodeWiz2280 wrote:
> >>> The Keystone uses the netcp driver, which has interrupts from 40-79
> >>> listed in the device tree (arch/arm/boot/keystone-k2e-netcp.dtsi).
> >>> I'm using the same device tree between my non-xen standalone kernel
> >>> and my dom0 kernel booted by xen.  In the standalone (non-xen) kernel
> >>> the ethernet works fine, but I don't see any of its interrupts in the
> >>> output of /proc/iomem.  I'm not seeing them in /proc/iomem when
> >>> running dom0 under Xen either.  When booting with Xen I get this
> >>> behavior where the ifconfig output shows 1 RX message and 1 TX
> >>> message, and then nothing else.
> >>
> >> I am not sure whether this is a typo in the e-mail. /proc/iomem is
> >> listing the list of the MMIO regions. You want to use /proc/interrupts.
> >>
> >> Can you confirm which path you are dumping?
> > Yes, that was a typo.  Sorry about that.  I meant that I am dumping
> > /proc/interrupts and do not
> > see them under the non-xen kernel or xen booted dom0.
>
> Could you post both /proc/interrupts content ?

Standalone non-xen kernel (Ethernet works)
# cat /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
 17:          0          0          0          0     GICv2  29 Level
  arch_timer
 18:       9856       1202        457        650     GICv2  30 Level
  arch_timer
 21:          0          0          0          0     GICv2 142 Edge
  timer-keystone
 22:          0          0          0          0     GICv2  52 Edge      arm-pmu
 23:          0          0          0          0     GICv2  53 Edge      arm-pmu
 24:          0          0          0          0     GICv2  54 Edge      arm-pmu
 25:          0          0          0          0     GICv2  55 Edge      arm-pmu
 26:          0          0          0          0     GICv2  36 Edge
  26202a0.keystone_irq
 27:       1435          0          0          0     GICv2 309 Edge      ttyS0
 29:          0          0          0          0     GICv2 315 Edge
  2530000.i2c
 30:          1          0          0          0     GICv2 318 Edge
  2530400.i2c
 31:          0          0          0          0     GICv2 321 Edge
  2530800.i2c
 32:         69          0          0          0     GICv2 324 Edge
  21000400.spi
 33:          0          0          0          0     GICv2 328 Edge
  21000600.spi
 34:          0          0          0          0     GICv2 332 Edge
  21000800.spi
 70:          0          0          0          0     GICv2 417 Edge
  ks-pcie-error-irq
 79:          0          0          0          0   PCI-MSI   0 Edge
  PCIe PME, aerdrv
 88:         57          0          0          0     GICv2  80 Level
  hwqueue-528
 89:         57          0          0          0     GICv2  81 Level
  hwqueue-529
 90:         47          0          0          0     GICv2  82 Level
  hwqueue-530
 91:         41          0          0          0     GICv2  83 Level
  hwqueue-531
IPI0:          0          0          0          0  CPU wakeup interrupts
IPI1:          0          0          0          0  Timer broadcast interrupts
IPI2:        730        988       1058        937  Rescheduling interrupts
IPI3:          2          3          4          6  Function call interrupts
IPI4:          0          0          0          0  CPU stop interrupts
IPI5:          0          0          0          0  IRQ work interrupts
IPI6:          0          0          0          0  completion interrupts

Xen dom0 (Ethernet stops)
# cat /proc/interrupts
           CPU0
 18:      10380     GIC-0  27 Level     arch_timer
 19:          0     GIC-0 142 Edge      timer-keystone
 20:         88     GIC-0  16 Level     events
 21:          0   xen-dyn     Edge    -event     xenbus
 22:          0     GIC-0  36 Edge      26202a0.keystone_irq
 23:          1     GIC-0 312 Edge      ttyS0
 25:          1     GIC-0 318 Edge
 27:          1     GIC-0 324 Edge      21000400.spi
 28:          0     GIC-0 328 Edge      21000600.spi
 29:          0     GIC-0 332 Edge      21000800.spi
 65:          0     GIC-0 417 Edge      ks-pcie-error-irq
 74:          0   PCI-MSI   0 Edge      PCIe PME, aerdrv
 83:          1     GIC-0  80 Level     hwqueue-528
 84:          1     GIC-0  81 Level     hwqueue-529
 85:          1     GIC-0  82 Level     hwqueue-530
 86:          1     GIC-0  83 Level     hwqueue-531
115:         87   xen-dyn     Edge    -virq      hvc_console
IPI0:          0  CPU wakeup interrupts
IPI1:          0  Timer broadcast interrupts
IPI2:          0  Rescheduling interrupts
IPI3:          0  Function call interrupts
IPI4:          0  CPU stop interrupts
IPI5:          0  IRQ work interrupts
IPI6:          0  completion interrupts
Err:          0

>
> Cheers
> Bertrand
>

