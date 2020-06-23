Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFE7206110
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 22:52:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnpse-0002fe-Ml; Tue, 23 Jun 2020 20:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/qXv=AE=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jnpsd-0002fZ-H0
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 20:50:55 +0000
X-Inumbo-ID: 3a9ff262-b593-11ea-8496-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a9ff262-b593-11ea-8496-bc764e2007e4;
 Tue, 23 Jun 2020 20:50:54 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id rk21so171087ejb.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2020 13:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=olXzDIxg7DPSTwRADY40Q7k7wanWon/Ex1VZ+Ph7Lx8=;
 b=e2GvLRtgoPlq8bHrPoeTlRstt/S/Y0E2unfvKi56j1k+ojEHIRQP9A6+RhMVp1e0eE
 3mSt/5OC5grQpFzT/osGXWfWSV78RUujdL47ACQEyae4Nyh7H7d/H/WHI6lBLh3wjt6F
 t11ynqBfHhO3ByTvWPa3UBqipDajSm8kOxnkGtwpyfukNBtD1WG0quosvT0UWHIGcnVP
 KhOF5+eVgXRIWPrgJZ9gJwv3YoMM6RjIigWq2b2u6GlsMlYPx8u/ydfNivGQvUeIxqPB
 uKJrqzeVVicVgpa3EoulvCKYhQduNTg+EXWv4aNo4zQ0gIQNUQRNb7L8tc5qB71vrhkj
 Om5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=olXzDIxg7DPSTwRADY40Q7k7wanWon/Ex1VZ+Ph7Lx8=;
 b=EM2puSt61pKy73fKAyDiCU+H47w5QGAeCpXS8EwpzkVb9BgeQAVtuMHZsfl+7eQUyr
 hK5pzK/T5U1v8XIKh/iBxOD6+eI1ZSsqRl1jTL7dLMcQqxYhtCoKEupJ2L2BNjYdmfeT
 Q7SU+iHThNzU33KP/1EUxqbkKdxPbxHE2AVsJubmEWveE4NM/PpWI3TyMB95CqnMX7+L
 43npz/1djqEiAZvS+V5+hba0LtMJvkcf2Wyvb7yDE9rSWbiiAbkH4nerKBDwyTf6i5LN
 F7PvBaFre1e/pzyhO70qVXeG7OXqYvHuac47cMWBFbwX2/V0ShuawvgtDQPZ5kIBgocE
 pnvA==
X-Gm-Message-State: AOAM530fW27lpHI4YnhcgCy6CUJdP8Wzo5SRE88DhaZenoLs6tA+7kU3
 ZES7j3xDw8sGmZxS/zTAKKBzaF5BR1ORYXlV0XY=
X-Google-Smtp-Source: ABdhPJy6hQP9zD6hUHx84zELkM+HK8eOOExLoE+eFi/D9IG4BGoapdT40RSIgxXLbc5Fiwq5W7SysAT1GQoPN7Nq9SI=
X-Received: by 2002:a17:906:848b:: with SMTP id
 m11mr6086294ejx.10.1592945453219; 
 Tue, 23 Jun 2020 13:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <99E77330-049F-4471-ABF9-13F9AB4E95B5@arm.com>
 <CALYbLDizxgaXJzhNVeKVZ6q-Hbttm1T+ZPP7f-1PDvi49VFOjA@mail.gmail.com>
 <alpine.DEB.2.21.2006080911500.2815@sstabellini-ThinkPad-T480s>
 <CALYbLDh8F0JuGmRY0C1Nhp_b4FP041KMa14pOmyoSBtHcz=A2A@mail.gmail.com>
 <363A05E0-61C6-4AE4-9C84-EEAC466989D8@arm.com>
 <b28cbead-c7ce-7848-4e21-109a022e64da@xen.org>
 <03607739-A4FF-486A-899A-F5F36870225A@arm.com>
 <2ec6255c-9d28-92e7-bd0a-59edb9fc078a@xen.org>
 <6033f9cecbf10f50f4a713ce52105426@kernel.org>
 <CAJ=z9a1k606A+sA467eY8iPuHnptMUFzxEFithpe=JKHogjt0g@mail.gmail.com>
 <CALYbLDjF8_eoNB_pSfbD73LkC3Ppyxpi0MxHgtS5y_wc-TVfzQ@mail.gmail.com>
 <4bab90465acfddae5868ce2311bd9889@kernel.org>
 <CALYbLDjNF5s2SXkunjJNv4x9jQAcDfoMBWp3WFHBkjnNdfT3Sg@mail.gmail.com>
 <bd3fade765bf21342a4ce6b952a5ca00@kernel.org>
 <CALYbLDhbRO=FeK21FLTMbt=eMciTW4hhjJUVhpmPUJ0D1ELeqA@mail.gmail.com>
 <alpine.DEB.2.21.2006171134350.14005@sstabellini-ThinkPad-T480s>
 <CALYbLDjX=aDTT0oazOkSDthd_p1H2ygunbdur935+2HYpF5Pow@mail.gmail.com>
In-Reply-To: <CALYbLDjX=aDTT0oazOkSDthd_p1H2ygunbdur935+2HYpF5Pow@mail.gmail.com>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Tue, 23 Jun 2020 16:50:37 -0400
Message-ID: <CALYbLDj9SCmxPZN1Tn6+YntkFyD69iKo2AGq=tG2Cnx4o=PBtg@mail.gmail.com>
Subject: Re: Keystone Issue
To: Stefano Stabellini <sstabellini@kernel.org>
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
Cc: Marc Zyngier <maz@kernel.org>, nd <nd@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Is it possible to passthrough PCI devices to domU on the 32-bit arm
keystone?  Any info is appreciated.

I found some old information online that "gic-v2m" is required.  I'm
not sure if the GIC-400 on the K2E supports "gic_v2m".  Based on the
fact that there is no "gic-v2m-frame" tag in the K2E device tree i'm
guessing that it does not.

If it is possible, is there a good example for arm that I can follow?

On Wed, Jun 17, 2020 at 7:52 PM CodeWiz2280 <codewiz2280@gmail.com> wrote:
>
> On Wed, Jun 17, 2020 at 2:46 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
> >
> > On Wed, 17 Jun 2020, CodeWiz2280 wrote:
> > > On Tue, Jun 16, 2020 at 2:23 PM Marc Zyngier <maz@kernel.org> wrote:
> > > >
> > > > On 2020-06-16 19:13, CodeWiz2280 wrote:
> > > > > On Tue, Jun 16, 2020 at 4:11 AM Marc Zyngier <maz@kernel.org> wrote:
> > > > >>
> > > > >> On 2020-06-15 20:14, CodeWiz2280 wrote:
> > > > >>
> > > > >> [...]
> > > > >>
> > > > >> > Also, the latest linux kernel still has the X-Gene storm distributor
> > > > >> > address as "0x78010000" in the device tree, which is what the Xen code
> > > > >> > considers a match with the old firmware.  What were the addresses for
> > > > >> > the device tree supposed to be changed to?
> > > > >>
> > > > >> We usually don't care, as the GIC address is provided by the
> > > > >> bootloader,
> > > > >> whether via DT or ACPI (this is certainly what happens on Mustang).
> > > > >> Whatever is still in the kernel tree is just as dead as the platform
> > > > >> it
> > > > >> describes.
> > > > >>
> > > > >> > Is my understanding
> > > > >> > correct that there is a different base address required to access the
> > > > >> > "non-secure" region instead of the "secure" 0x78010000 region?  I'm
> > > > >> > trying to see if there are corresponding different addresses for the
> > > > >> > keystone K2E, but haven't found them yet in the manuals.
> > > > >>
> > > > >> There is no such address. Think of the NS bit as an *address space*
> > > > >> identifier.
> > > > >>
> > > > >> The only reason XGene presents the NS part of the GIC at a different
> > > > >> address is because XGene is broken enough not to have EL3, hence no
> > > > >> secure mode. To wire the GIC (and other standard ARM IPs) to the core,
> > > > >> the designers simply used the CPU NS signal as an address bit.
> > > > >>
> > > > >> On your platform, the NS bit does exist. I strongly suppose that it
> > > > >> isn't wired to the GIC. Please talk to your SoC vendor for whether iot
> > > > >> is possible to work around this.
> > > > >>
> > > > > I do have a question about this out to TI, but at least this method
> > > > > gives me something to work with in the meantime.  I was just looking
> > > > > to confirm that there wouldn't be any other undesirable side effects
> > > > > with Dom0 or DomU when using it.  Was there an actual FPGA for the
> > > > > X-Gene that needed to be updated which controlled the GIC access?  Or
> > > > > by firmware do you mean the boot loader (e.g. uboot).  Thanks for the
> > > > > support so far to all.
> > > >
> > > > As I said, the specific case of XGene was just a matter of picking the
> > > > right address, as the NS bit is used as an address bit on this platform.
> > > > This was possible because this machine doesn't have any form of
> > > > security. So no HW was changed, no FPGA reprogrammed. Only a firmware
> > > > table was fixed to point to the right spot. Not even u-boot or EFI was
> > > > changed.
> > > Ok, thank you for clarifying.  I have one more question if you don't
> > > mind.  I'm aware that dom0 can share physical memory with dom1 via
> > > grant tables.
> > > However, is it possible to reserve a chunk of contiguous physical
> > > memory and directly allocate it only to dom1?
> > > For example, if I wanted dom1 to have access to 8MB of contiguous
> > > memory at 0x8200_0000 (in addition to whatever virtual memory Xen
> > > gives it).
> > > How would one go about doing this on ARM?  Is there something in the
> > > guest config or device tree that can be set?  Thanks for you help.
> >
> > There isn't a "proper" way to do it, only a workaround.
> >
> > It is possible to do it by using the iomem option, which is meant for
> > device MMIO regions.
> >
> > We have patches in the Xilinx Xen tree (not upstream) to allow for
> > specifying the cacheability that you want for the iomem mapping so that
> > you can map it as normal memory. This is the latest branch:
> >
> > https://github.com/Xilinx/xen.git xilinx/release-2020.1
> >
> > The relevant commits are the ones from:
> > https://github.com/Xilinx/xen/commit/a5c76ac1c5dc14d3e9ccedc5c1e7dd2ddc1397b6
> > to:
> > https://github.com/Xilinx/xen/commit/b4b7e91c1524f9cf530b81b7ba95df2bf50c78e4
> >
> > You might want to make sure that the page is not used by the normal
> > memory allocator. This document explains how to something along those
> > lines:
> >
> > https://github.com/Xilinx/xen/commit/35f72d9130448272e07466bd73cc30406f33135e
>
> Thank you.  I appreciate it.

