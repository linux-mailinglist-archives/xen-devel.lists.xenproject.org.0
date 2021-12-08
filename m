Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7D246DD95
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 22:24:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242620.419601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv4Q3-00085y-Kp; Wed, 08 Dec 2021 21:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242620.419601; Wed, 08 Dec 2021 21:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv4Q3-00082v-HJ; Wed, 08 Dec 2021 21:24:07 +0000
Received: by outflank-mailman (input) for mailman id 242620;
 Wed, 08 Dec 2021 21:24:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aoc2=QZ=linaro.org=mathieu.poirier@srs-se1.protection.inumbo.net>)
 id 1mv4Q2-00082p-6a
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 21:24:06 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b6277f0-586d-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 22:24:04 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id y13so12738539edd.13
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 13:24:04 -0800 (PST)
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
X-Inumbo-ID: 2b6277f0-586d-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JrYOi4lbhFPKxumTZaVTTwLIJ849fzGNHXgMbyyfS7M=;
        b=HCcIq0tXA3gM2D+IjYT55I0ZFL76TjmjvqqbYX6+rArCitKzwncgIE/ggLlrXDp4mA
         vJBjL1UESFH6staSbffun56vUTAE2h0cChvX+GCRxrHis16pqcVl+9Z/D0ggmnvl2Qge
         pBMamdTe7SpT/a118wewxTOEgjGavfzd/UatU9hnluc42fKOlrITXUk84Ye260bo2qP4
         XclNn0dhfiDwa7OA6iRkHGx3cqTAoasGl8aBPS/1KZ625YTWye1vlaLd3I/xWUrG2oMR
         VEUXGM4ULz2sfH2Hx5al7smD70Wya8LVaCtWSIyT9jVLHMEa3SxhIJBPKLXL4SzIeVdn
         ZPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JrYOi4lbhFPKxumTZaVTTwLIJ849fzGNHXgMbyyfS7M=;
        b=3lt5NRHSpfekktNRHiRywr3wrFyDO0V1hjP9TVcvae58+b4fy2LXQ/bDs6kQLakC3H
         kQpQmJndc8fWaHf7PDzt16x/HCN6MmEoQvE+o2w6n+2diFSHap+qfkW9qp3MsfhhmOhC
         oR4WTrlye35oRoluw/wEDueLAAE6GVk9zJYAWfVyX/z/Vh71u/SPdj7PMxX7ntYSAIx5
         Cwt5G/4Ks7ejOZQygBtmsNBFaJ7l3ei6V0z6TCIfspbO1dGWvhngd4i/cpTMdxyjYdib
         9BtL8KS1SyiClIAQ8BOqEI1wPk4ln9NOki+yi/5IT7oiSy+cL4N3MJWRjEWFGIaJvXsg
         Q3OQ==
X-Gm-Message-State: AOAM530S83ExpOR+77tkZZbUJj6VeXGuBlrluZqo55YrPcu1EwRuAqTE
	3osK+fwt23mRZeAGHYipg409ydMxmsjOviKAsfXjzo57oTeHyQ==
X-Google-Smtp-Source: ABdhPJyCFGiWRrVY+EcijPysiRmXqBNXoqeJ0A+C7fvjhieuN9s/A/ln6v1NtLksxklWZux95hI/0EXQHudcBJ2L6ic=
X-Received: by 2002:a05:6402:3459:: with SMTP id l25mr23184346edc.137.1638998644034;
 Wed, 08 Dec 2021 13:24:04 -0800 (PST)
MIME-Version: 1.0
References: <CANLsYkzKn7Nkika=KpHtSyi9=FQwS7Wt94Odbg2HuH+1PFUTzA@mail.gmail.com>
 <B34490D7-5FE3-41D4-9792-41E2BD25EF05@arm.com> <CANLsYkywEbLHhxsAJQ8_HPnjdsDXZMO+5-+zbSuqmcUV1Dr4iA@mail.gmail.com>
 <074326cc-f910-2cad-be1f-e27480f53b67@arm.com>
In-Reply-To: <074326cc-f910-2cad-be1f-e27480f53b67@arm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 8 Dec 2021 14:23:52 -0700
Message-ID: <CANLsYkyF4Mv+MhyKJ-B4-56G=RVu6U3=OAraK5ZtnOx6TaW1UQ@mail.gmail.com>
Subject: Re: Aarch64 stand-alone application for Xen
To: Michal Orzel <michal.orzel@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Dec 2021 at 07:19, Michal Orzel <michal.orzel@arm.com> wrote:
>
> Hi Mathieu,
>
> On 08.12.2021 01:06, Mathieu Poirier wrote:
> > Hi Bertrand,
> >
> > On Fri, 26 Nov 2021 at 03:32, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Mathieu,
> >>
> >>> On 25 Nov 2021, at 22:59, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> >>>
> >>> Good day,
> >>>
> >>> I am in the process of adding support for aarch64 to the xen-sys
> >>> crate[1].  The crate currently supports x86_64 and includes a
> >>> stand-alone "oxerun" application that can be used to validate
> >>> hypercalls.  My goal is to provide the same functionality on arm64.  I
> >>> am looking for a stand-alone aarch64 example, something like an "hello
> >>> world" to help me with the assembler startup code.
> >>
> >> We are working on porting XTF to arm64 and already have something running.
> >> I think it could be a good starting point for you:
> >> https://github.com/orzelmichal/xtf/tree/arm-devel
> >
> > Quick one - have you been able to get the "test-arm-64le-example"
> > application to run?  So far Xen gives me the following error:
> >
> > (XEN) ****************************************
> > (XEN) Panic on CPU 0:
> > (XEN) Unable to copy the kernel in the hwdom memory
> > (XEN) ****************************************
> >
> > I wanted to check with you before starting to dig into it.
> >
>
> ICYDK, 64le environment is used to create non-MMU domain in contrast to mmu64le.

Right.

> It lacks support for PV console and other important features of Xen.

I'm good with that - for now all I want is to test hypervisor calls I
developed in Rust.

> But we are able to run it without any issue.
> Please keep in mind that as there is no MMU you need to pay attention to the load address.
> By default for non-MMU domain, the address is 0x40000000 which is the correct address if you use XTF as a guest.

I was trying to boot XTF as dom0 using the default address
(0x40000000), which lead to the output depicted above.

> If you want to run non-MMU XTF as dom0, you need to specify the correct load address by passing CONFIG_LOAD_ADDRESS=<address>
> when invoking make. For example on QEMU it would be CONFIG_LOAD_ADDRESS=0x80000000.
>

When adding the compilation flag "CONFIG_LOAD_ADDRESS=0x80000000" I
get further [1].  For my own education, why is address 0x80000000
required when running a non-MMU XTF as dom0?  Is this a Xen thing?

The application crashes in the loop on line 135 [2] and I am wondering
if it wouldn't be related to the QEMU emulation. My setup is as
follow:

. QEMU startup command [3]
. XTF baseline: "c14f7dd289a4 (xtf: Add arm support into xtf-runner)"
. Xen baseline: "c76cfada1cfa (tools/libacpi: Use 64-byte alignment for FACS)"

Best regards,
Mathieu

[1]. https://pastebin.com/3AVXRGXD
[2]. https://github.com/orzelmichal/xtf/blob/arm-devel/arch/arm/arm64/head.S#L135
[3]. https://pastebin.com/52aVAFha

> > Thanks,
> > Mathieu
> >
> >>
> >> Regards
> >> Bertrand
> >>
> >>>
> >>> Many thanks for the consideration,
> >>> Mathieu
> >>>
> >>> [1]. https://crates.io/crates/xen-sys
> >>>
> >>
> >
> Cheers,
> Michal

