Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E56D1FCFED
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 16:46:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlZJq-0003wb-8y; Wed, 17 Jun 2020 14:45:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6bdl=76=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jlZJo-0003wW-J6
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 14:45:36 +0000
X-Inumbo-ID: 33cd197c-b0a9-11ea-8496-bc764e2007e4
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33cd197c-b0a9-11ea-8496-bc764e2007e4;
 Wed, 17 Jun 2020 14:45:35 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id p20so2569549ejd.13
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m/yTYmzvGFtcBQEKmS/Xh/GNgdePSsbD/508KjACywo=;
 b=RqVGOyfSrVeas8FRVfJTSlg9mbdJxEIrrPU7+OT4ZK2PKQSHh9HXQ4PS3ksXvaPOu8
 LzRKp3A3XKUwBpQr+aKZD2qNA89BE+VnIMi1iRQwrauFle39YYEhYkimdWFO21c73F41
 TphO64F2kV+jLJ21fpxAbL4daTy5WPGAFkhgNQqTxkxKcsUlPjElpJQ3fnQR+VwWwAoF
 eW/sotwvS9wYbG7AB4lBUO1qNyPpom8dtc1ZP0fFgl/zI9f085o4I1Rg/B7T1bXR/7Eb
 ZJBV1xknmoDVJRIQOmo7ZzCSy+O1V5gXru8MLI8P7WJ95dgzjGxeyEvuyoMTThLOQXnc
 IenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m/yTYmzvGFtcBQEKmS/Xh/GNgdePSsbD/508KjACywo=;
 b=sLm82PrVShUrt1BPJ8iPWeJULqbwb18udY/mCp97BBbXei4qGXn9d4Nk/biucKV0jV
 pcANfgmGPMufzroX2MbCDbELh8WqRGN3kOhg/Ty3nGs2hLDbVzRDiVans42X4qXy/0aL
 Ckqsq0wsh68ffqXZj1cOXTV9GdtN+fi/5dGEH5IdqDn3VYZBl2SbfQYWvBU1JK2EtBIV
 wyXvOHMzj3SMcKtzmhJu/4WA322QBlOIfbeN7HbV5JmFbb3u68tT798MnnHjnP5DLKcC
 Pz3uYVBCt5jEmTYiqUYHscIcb2qQ8ycEzlSkHjjNdTcJkTiTRSp27AWePL2kFTdKSIFy
 5PFA==
X-Gm-Message-State: AOAM532ck7+/WFQRpN4GlnGHqzeC1luVHTEbcKWXkyVHy9kBYBjsLZfy
 0bgyzAJNrYyTraxN20qzGA3toRrJcIbxKYVUEhk=
X-Google-Smtp-Source: ABdhPJwNeRoE4PzD0OzZnE8QsGMbHIQMzpIn0fEOIrCHnEyG0RXaJzMPs0vvY6vdjGdAlHHZyNKYdkKXMm1ARhRqZ6Q=
X-Received: by 2002:a17:906:fa86:: with SMTP id
 lt6mr8296147ejb.148.1592405134931; 
 Wed, 17 Jun 2020 07:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
 <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
 <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
 <14244e49-e1ac-a29d-bbd9-bd4c202bf186@xen.org>
 <CALYbLDjCdDvwja1VoahJmnrKDfKyw7DNhYBBcmJv70QDA4+6Ag@mail.gmail.com>
 <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
 <CALYbLDheT8jWSAqJJZvvjzWGvygJaJ6UG7ejgpLLYeQB-tCsJA@mail.gmail.com>
 <CALYbLDjZu-YzqZPjCk785=4hpd3BRsoXeotd3ygESD_Ezm63Yg@mail.gmail.com>
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
In-Reply-To: <bd3fade765bf21342a4ce6b952a5ca00@kernel.org>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Wed, 17 Jun 2020 10:45:21 -0400
Message-ID: <CALYbLDhbRO=FeK21FLTMbt=eMciTW4hhjJUVhpmPUJ0D1ELeqA@mail.gmail.com>
Subject: Re: Keystone Issue
To: Marc Zyngier <maz@kernel.org>
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
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 16, 2020 at 2:23 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-06-16 19:13, CodeWiz2280 wrote:
> > On Tue, Jun 16, 2020 at 4:11 AM Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On 2020-06-15 20:14, CodeWiz2280 wrote:
> >>
> >> [...]
> >>
> >> > Also, the latest linux kernel still has the X-Gene storm distributor
> >> > address as "0x78010000" in the device tree, which is what the Xen code
> >> > considers a match with the old firmware.  What were the addresses for
> >> > the device tree supposed to be changed to?
> >>
> >> We usually don't care, as the GIC address is provided by the
> >> bootloader,
> >> whether via DT or ACPI (this is certainly what happens on Mustang).
> >> Whatever is still in the kernel tree is just as dead as the platform
> >> it
> >> describes.
> >>
> >> > Is my understanding
> >> > correct that there is a different base address required to access the
> >> > "non-secure" region instead of the "secure" 0x78010000 region?  I'm
> >> > trying to see if there are corresponding different addresses for the
> >> > keystone K2E, but haven't found them yet in the manuals.
> >>
> >> There is no such address. Think of the NS bit as an *address space*
> >> identifier.
> >>
> >> The only reason XGene presents the NS part of the GIC at a different
> >> address is because XGene is broken enough not to have EL3, hence no
> >> secure mode. To wire the GIC (and other standard ARM IPs) to the core,
> >> the designers simply used the CPU NS signal as an address bit.
> >>
> >> On your platform, the NS bit does exist. I strongly suppose that it
> >> isn't wired to the GIC. Please talk to your SoC vendor for whether iot
> >> is possible to work around this.
> >>
> > I do have a question about this out to TI, but at least this method
> > gives me something to work with in the meantime.  I was just looking
> > to confirm that there wouldn't be any other undesirable side effects
> > with Dom0 or DomU when using it.  Was there an actual FPGA for the
> > X-Gene that needed to be updated which controlled the GIC access?  Or
> > by firmware do you mean the boot loader (e.g. uboot).  Thanks for the
> > support so far to all.
>
> As I said, the specific case of XGene was just a matter of picking the
> right address, as the NS bit is used as an address bit on this platform.
> This was possible because this machine doesn't have any form of
> security. So no HW was changed, no FPGA reprogrammed. Only a firmware
> table was fixed to point to the right spot. Not even u-boot or EFI was
> changed.
Ok, thank you for clarifying.  I have one more question if you don't
mind.  I'm aware that dom0 can share physical memory with dom1 via
grant tables.
However, is it possible to reserve a chunk of contiguous physical
memory and directly allocate it only to dom1?
For example, if I wanted dom1 to have access to 8MB of contiguous
memory at 0x8200_0000 (in addition to whatever virtual memory Xen
gives it).
How would one go about doing this on ARM?  Is there something in the
guest config or device tree that can be set?  Thanks for you help.
>
>          M.
> --
> Jazz is not dead. It just smells funny...

