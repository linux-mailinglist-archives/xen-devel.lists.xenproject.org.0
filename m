Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1C9490753
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 12:50:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258134.444208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9QWK-00054R-9f; Mon, 17 Jan 2022 11:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258134.444208; Mon, 17 Jan 2022 11:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9QWK-00052b-68; Mon, 17 Jan 2022 11:49:56 +0000
Received: by outflank-mailman (input) for mailman id 258134;
 Mon, 17 Jan 2022 11:49:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d+jO=SB=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1n9QWI-00052V-Mm
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 11:49:54 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95978a99-778b-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 12:49:53 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id s30so56589173lfo.7
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jan 2022 03:49:53 -0800 (PST)
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
X-Inumbo-ID: 95978a99-778b-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BtzJu75aIjrWjEqLqSrYepGaeIMc333zzSgoZOnDF7Y=;
        b=oBnWJLmZeN+FS14wLaOouNJ4+iUSEuZqbeMx9lQ956f2J8Q13Fr2OcAzHg28adFGMe
         N/+V1i5b0tc8xTevLG1ZJO5pxTvxwp+UGO0laglnJGa6o9TfkHNgrzrMe7zcBxmGUrAT
         tfuJtEuFi5OQYSsr+dZ5A1B2njEzV17fAGletFhkLXNXuEHeNvgerBCZlXkh+8d8Upcx
         qb6yJsvgZgfgclED8daykgAMy6R0qpwC8/H2NC5V3HTXxDlQAwGK7gtvyTbjA/x5Wgzb
         Bd3db2FbcK2a/kcbWFsPnODhwv9ie30Uh5oWVMMTf/z+i7iD5q1LQwGGUNKy9jsoc0Pr
         KsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BtzJu75aIjrWjEqLqSrYepGaeIMc333zzSgoZOnDF7Y=;
        b=BzX2QgYkVxtyOIP1JqF86oVPh7h4E7PjC6YP8Bfe0cKnR7hRLbmzxE5WshAKav8fk0
         97m8LhmILJui+eol7jynzMu9sTzTH6lWit7ZTXqLqPz8G19VrbVqCv04J5NjBhmRRduw
         BsFZ9eheFDFeNEQVwsLEU3lOCjjwnm47h3CnjvxlBCan2/EeOS+G/osNLwsJmCtWY6Ah
         IXFxsV2njZ2rwQsQZX3G9/yCg4lOoRt2OfzRrPObLMGseLjlIJ9vjH6I3Ok+u9UiuWxK
         fSGvu2UlP1dTX35irvx1DvkpqMgMCuaBH2qhEbgcg0nPNuDj2DbSk6wjGvREQSK19iYD
         w/UA==
X-Gm-Message-State: AOAM530vQInyY3OeXx7JxwTy354CcqZw57kbqq1P6OyNpPQHZfKcpmyJ
	IAtd3Usb58QK+nOWre4tEwXKd0pvJmy8yEH4Ua8=
X-Google-Smtp-Source: ABdhPJxQIe6sFt34yX8Dqg/zlMsvBTUqMaWdc2sQquCHAdntGPuTwDCBRXqCYEub7o4QaFDMcFmwCJmzhQ8OfyneMDU=
X-Received: by 2002:a05:651c:b0b:: with SMTP id b11mr13257896ljr.26.1642420193138;
 Mon, 17 Jan 2022 03:49:53 -0800 (PST)
MIME-Version: 1.0
References: <20220117064003.3367188-1-gengdongjiu1@gmail.com>
 <94945C70-A608-47E9-890E-8CA6882D7379@arm.com> <CABSBigTdLbV4b8uB-MyoBuU2uFe2xc8ML4WizsHD80A3nygtCg@mail.gmail.com>
 <ADF7B9AE-9E44-475A-A678-C6F81F1C9049@arm.com>
In-Reply-To: <ADF7B9AE-9E44-475A-A678-C6F81F1C9049@arm.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Mon, 17 Jan 2022 19:49:43 +0800
Message-ID: <CABSBigSy+8fedZCqFS5z3-RfWxDrzjB7ScjsjwCibCpNnpCbug@mail.gmail.com>
Subject: Re: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, 
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bertrand Marquis <Bertrand.Marquis@arm.com> =E4=BA=8E2022=E5=B9=B41=E6=9C=
=8817=E6=97=A5=E5=91=A8=E4=B8=80 19:38=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> > On 17 Jan 2022, at 11:12, Dongjiu Geng <gengdongjiu1@gmail.com> wrote:
> >
> > Bertrand Marquis <Bertrand.Marquis@arm.com> =E4=BA=8E2022=E5=B9=B41=E6=
=9C=8817=E6=97=A5=E5=91=A8=E4=B8=80 17:00=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> Hi,
> >>
> >>> On 17 Jan 2022, at 06:40, Dongjiu Geng <gengdongjiu1@gmail.com> wrote=
:
> >>>
> >>> It turns out that QEMU has been supporting GICv2 virtualization since
> >>> v3.1.0. So remove the dependencies on GICv3. If we want to use GICv3,
> >>> we can select the QEMU_LEGACY configuration.
> >>
> >> I am bit puzzled by this change introducing a legacy option actually s=
electing the newest GIC interface.
> >>
> >> Can=E2=80=99t we do the opposite and introduce a QEMU_GICV2 instead ?
> >>
> >> Also why do we need to remove gic-v3 support ? The code should actuall=
y select which gic to use depending on the device tree.
> >
> > QEMU platfrom only select GICv3,  so I remove this limitation,  let
> > user or developer selects gic version is better.
>
> This is where I am lost, the code is actually always compiling gic-v2 sup=
port in unless new vgic is selected (see arch/arm/Makefile).

Yes=EF=BC=8C so can I think you do not have concern for this patch?

>
> Cheers
> Bertrand
>
> >
> >>
> >> Regards
> >> Bertrand
> >>
> >>>
> >>> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> >>> ---
> >>> xen/arch/arm/platforms/Kconfig | 10 +++++++++-
> >>> 1 file changed, 9 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/=
Kconfig
> >>> index c93a6b2756..41e82a42ee 100644
> >>> --- a/xen/arch/arm/platforms/Kconfig
> >>> +++ b/xen/arch/arm/platforms/Kconfig
> >>> @@ -13,7 +13,15 @@ config ALL_PLAT
> >>>      automatically select any of the related drivers.
> >>>
> >>> config QEMU
> >>> -     bool "QEMU aarch virt machine support"
> >>> +     bool "QEMU aarch virt machine support >=3D v3.1.0"
> >>> +     depends on ARM_64
> >>> +     select HAS_PL011
> >>> +     ---help---
> >>> +     Enable all the required drivers for QEMU aarch64 virt emulated
> >>> +     machine.
> >>> +
> >>> +config QEMU_LEGACY
> >>> +     bool "QEMU aarch virt machine support < v3.1.0"
> >>>      depends on ARM_64
> >>>      select GICV3
> >>>      select HAS_PL011
> >>> --
> >>> 2.25.1
>

