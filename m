Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7CD46F4C7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 21:19:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243355.420975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPsZ-0002wt-Q1; Thu, 09 Dec 2021 20:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243355.420975; Thu, 09 Dec 2021 20:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPsZ-0002v2-N0; Thu, 09 Dec 2021 20:18:59 +0000
Received: by outflank-mailman (input) for mailman id 243355;
 Thu, 09 Dec 2021 20:18:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HnwN=Q2=linaro.org=mathieu.poirier@srs-se1.protection.inumbo.net>)
 id 1mvPsX-0002uw-U7
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 20:18:58 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c2ee1ec-592d-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 21:18:56 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id r11so22845247edd.9
 for <xen-devel@lists.xenproject.org>; Thu, 09 Dec 2021 12:18:56 -0800 (PST)
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
X-Inumbo-ID: 3c2ee1ec-592d-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nGBDKmd1xBPIz31XWadzq8ArnogmXldarGq8hv549d8=;
        b=a73D1SCtqUOt3np9xdZHH/V64JXdb7CE5YMO0STQp+9Wr+IIqJx5sXDXWKLr/Q3EgQ
         iEjEaOMhxeDLxAOgmymMn1d+Q3dErLsaFRXTd4zonC6rvERPZrcsF4CdbYZnOUAkbRgo
         oEHAAP+7Az/wflwLX/WrVghiZ0FsrWFlaLO/is59Z89WSobi6kfmRuBhR0o166KiqvcP
         G9oFhHjQuKsuDkiFC1jRmE/9qrXDjmc9V0KnBIiiMAXFNkDa6WhNnnuLMUr55YZtvZL7
         w16l5yPuBuYdVk9+BnKZk2cEeYWvrYrShv/hkr7INZ5dxYUbTVPW6eH6hrp1UkJ01F0c
         HhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nGBDKmd1xBPIz31XWadzq8ArnogmXldarGq8hv549d8=;
        b=rtFBB0zc3Sg16ThT7GUurSGSURYtlQNjYGN7xE+vPYnoVVq5fpAVBrUf6lCHc0WuqD
         XmnR7Yrgnm06yQAW6WedybfOWiYUyhKqMBOfCZl5TOmxEh2qYyBFhKmAFi+KX4FBellP
         wXx0PMB6YgLrICfcZ/Sh09SLmKdTHN1mAorynkv9yFcnIeiL2qA6njnxCE+MefLSBy6b
         0A2fPhzpL7/wRTeXuwd0WvwF5UkcqZRTEOadkxuRX082Imqepe1QupiDBaBXKbc15PIk
         qc21DVgMQ+ZEFyIMNDncDGnvvs9+EZWbrsXlz4ajNQ/1j+CYIHwbtyAkplFWdA9gemlO
         W+MQ==
X-Gm-Message-State: AOAM533ycdvaSgvTxhStZemJfCCidIu8NIsXSON48eGsl9XXJ+QLEsf9
	Cr246PoaR28IHxowy5HtspTzTfCkNK2yBqS5OlZvbxsghAo=
X-Google-Smtp-Source: ABdhPJy00RMAQyUq+H97wg32S5wcAzgYszXxJ162OCHCt/JcFX29SjaU80z88lAXsBYb1PGUyol1VC9D7tHZGhj6Vfk=
X-Received: by 2002:a17:906:6a0a:: with SMTP id qw10mr18246252ejc.547.1639081135334;
 Thu, 09 Dec 2021 12:18:55 -0800 (PST)
MIME-Version: 1.0
References: <CANLsYkzKn7Nkika=KpHtSyi9=FQwS7Wt94Odbg2HuH+1PFUTzA@mail.gmail.com>
 <B34490D7-5FE3-41D4-9792-41E2BD25EF05@arm.com> <CANLsYkywEbLHhxsAJQ8_HPnjdsDXZMO+5-+zbSuqmcUV1Dr4iA@mail.gmail.com>
 <074326cc-f910-2cad-be1f-e27480f53b67@arm.com> <CANLsYkyF4Mv+MhyKJ-B4-56G=RVu6U3=OAraK5ZtnOx6TaW1UQ@mail.gmail.com>
 <877a84bc-b550-a22b-d3ab-1f81b1b78c6f@arm.com>
In-Reply-To: <877a84bc-b550-a22b-d3ab-1f81b1b78c6f@arm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 9 Dec 2021 13:18:43 -0700
Message-ID: <CANLsYkwBXa7Gi7cdBSwAWqokNsc7iFanw9RMJAMOxouEghwvcQ@mail.gmail.com>
Subject: Re: Aarch64 stand-alone application for Xen
To: Michal Orzel <michal.orzel@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Dec 2021 at 00:19, Michal Orzel <michal.orzel@arm.com> wrote:
>
> Hi Mathieu,
>
> On 08.12.2021 22:23, Mathieu Poirier wrote:
> > On Wed, 8 Dec 2021 at 07:19, Michal Orzel <michal.orzel@arm.com> wrote:
> >>
> >> Hi Mathieu,
> >>
> >> On 08.12.2021 01:06, Mathieu Poirier wrote:
> >>> Hi Bertrand,
> >>>
> >>> On Fri, 26 Nov 2021 at 03:32, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
> >>>>
> >>>> Hi Mathieu,
> >>>>
> >>>>> On 25 Nov 2021, at 22:59, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> >>>>>
> >>>>> Good day,
> >>>>>
> >>>>> I am in the process of adding support for aarch64 to the xen-sys
> >>>>> crate[1].  The crate currently supports x86_64 and includes a
> >>>>> stand-alone "oxerun" application that can be used to validate
> >>>>> hypercalls.  My goal is to provide the same functionality on arm64.  I
> >>>>> am looking for a stand-alone aarch64 example, something like an "hello
> >>>>> world" to help me with the assembler startup code.
> >>>>
> >>>> We are working on porting XTF to arm64 and already have something running.
> >>>> I think it could be a good starting point for you:
> >>>> https://github.com/orzelmichal/xtf/tree/arm-devel
> >>>
> >>> Quick one - have you been able to get the "test-arm-64le-example"
> >>> application to run?  So far Xen gives me the following error:
> >>>
> >>> (XEN) ****************************************
> >>> (XEN) Panic on CPU 0:
> >>> (XEN) Unable to copy the kernel in the hwdom memory
> >>> (XEN) ****************************************
> >>>
> >>> I wanted to check with you before starting to dig into it.
> >>>
> >>
> >> ICYDK, 64le environment is used to create non-MMU domain in contrast to mmu64le.
> >
> > Right.
> >
> >> It lacks support for PV console and other important features of Xen.
> >
> > I'm good with that - for now all I want is to test hypervisor calls I
> > developed in Rust.
> >
> >> But we are able to run it without any issue.
> >> Please keep in mind that as there is no MMU you need to pay attention to the load address.
> >> By default for non-MMU domain, the address is 0x40000000 which is the correct address if you use XTF as a guest.
> >
> > I was trying to boot XTF as dom0 using the default address
> > (0x40000000), which lead to the output depicted above.
> >
> >> If you want to run non-MMU XTF as dom0, you need to specify the correct load address by passing CONFIG_LOAD_ADDRESS=<address>
> >> when invoking make. For example on QEMU it would be CONFIG_LOAD_ADDRESS=0x80000000.
> >>
> >
> > When adding the compilation flag "CONFIG_LOAD_ADDRESS=0x80000000" I
> > get further [1].  For my own education, why is address 0x80000000
> > required when running a non-MMU XTF as dom0?  Is this a Xen thing?
> >
> > The application crashes in the loop on line 135 [2] and I am wondering
> > if it wouldn't be related to the QEMU emulation. My setup is as
> > follow:
> >
> > . QEMU startup command [3]
> > . XTF baseline: "c14f7dd289a4 (xtf: Add arm support into xtf-runner)"
> > . Xen baseline: "c76cfada1cfa (tools/libacpi: Use 64-byte alignment for FACS)"
> >
> > Best regards,
> > Mathieu
> >
> > [1]. https://pastebin.com/3AVXRGXD
> > [2]. https://github.com/orzelmichal/xtf/blob/arm-devel/arch/arm/arm64/head.S#L135
> > [3]. https://pastebin.com/52aVAFha
> >
>
> For the setup you provided just compile XTF with CONFIG_LOAD_ADDRESS=0x60000000.
> This will fix your problem.

It definitely does - I officially owe you a beer.

> When using non-MMU dom0, the microkernel must be compiled with the load address that
> is within the memory bank allocated by Xen. You can see it in your logs:
> (XEN) BANK[0] 0x00000060000000-0x00000080000000 (512MB)
>

Very interesting.

> You did not specify dom0_mem parameter, so Xen defaults to 512MB for dom0.
> You can see it in your logs:
> (XEN) PLEASE SPECIFY dom0_mem PARAMETER - USING 512M FOR NOW
>
> FWICS you are passing Xen command line arguments through -append but i'm not sure it works.
> The best way is to use dtb.
>

Ok.

>
> >>> Thanks,
> >>> Mathieu
> >>>
> >>>>
> >>>> Regards
> >>>> Bertrand
> >>>>
> >>>>>
> >>>>> Many thanks for the consideration,
> >>>>> Mathieu
> >>>>>
> >>>>> [1]. https://crates.io/crates/xen-sys
> >>>>>
> >>>>
> >>>
> >> Cheers,
> >> Michal
>
> Cheers,
> Michal

