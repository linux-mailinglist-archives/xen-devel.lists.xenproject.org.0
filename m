Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB61148C360
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 12:42:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256589.440459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7c0Z-0007KC-B5; Wed, 12 Jan 2022 11:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256589.440459; Wed, 12 Jan 2022 11:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7c0Z-0007HN-6K; Wed, 12 Jan 2022 11:41:39 +0000
Received: by outflank-mailman (input) for mailman id 256589;
 Wed, 12 Jan 2022 11:41:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5D/a=R4=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1n7c0X-0007HH-1y
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 11:41:37 +0000
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [2a00:1450:4864:20::144])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98e2285f-739c-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 12:41:36 +0100 (CET)
Received: by mail-lf1-x144.google.com with SMTP id g11so7146932lfu.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jan 2022 03:41:35 -0800 (PST)
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
X-Inumbo-ID: 98e2285f-739c-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IGgAt/PWazfQwU3PnIY7iPY3NZ1CTqfiuRT63o+wriU=;
        b=Oo1UehApEUTtMunr4M36JbZhxG/saEPDRW7g8yQavNDCxG9XwGKXBljEyaIV8xLxj0
         HDcFJfja0iDz6T9rsaIPzlQn74BSufRuEPWUIl28xKI44yL927Lu+EhVSDOGjFXfSP8F
         SOm6IYVY7yk+dis/8HaFJ78xBBO3evbcN+nZIcIouIlBw67QN8EJ0c5NkhCxaUU4JVmY
         fOmlGJPVDIm5PYuCjbCHMMjsuCIl+vSyF5v9zZVnFcQxbNQI62hmEs6eMdsMHsmuBhxd
         VR4qEZaCU4sZdptjCqMrGZ9vRPMi/kRHVT3qJr6KPbtGbyFly3R3i/+L2F6nH93pZROk
         iSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IGgAt/PWazfQwU3PnIY7iPY3NZ1CTqfiuRT63o+wriU=;
        b=1hVM1jGVcI4t2IDpjMqfXHqxuwCVXDiGnngSUo5N/vHZxhWtXzV1F+7bteC59461S5
         pwPIb8r8OhQpb7oX82ix3XyYSUfocXVCbo+6rPWw2qsNqyf7cuayBqxFCSZ/AjakYMzK
         5guxnb835e/cukIzyNMFosW5rOukE3O8kca2J4qWZqENCy1r7q9TjfKtpke33TF4ev0f
         J8iNELN7yHfT9+Vxp1/yz4VE4iUGinpNmerYfsBiQzUD9+WQYTM+ILScUFuBmIbBok1o
         If9oXogAEAXWfdTXzkEXpomCE2MJallyPE7vc6KUblNtRvQUbz4fb2kdECAQ5N1/FT4o
         +m5Q==
X-Gm-Message-State: AOAM5306w0g8bHbWc3abGQ8GTO58/BHYCiwd0+Q5W++LYiLOI65KTqUn
	55360ZykA/lWlfTqt1T5E2NoXE10JxPOkBKq8R4=
X-Google-Smtp-Source: ABdhPJxD8KFMoaH0J4Pw4qiU2YoM4pIrbUWq3KhxMUhreCwlxKAXaC+O4qqWYsVPREc/EJmcgtu/QcnyHZWA3Gc0AfI=
X-Received: by 2002:a05:6512:2314:: with SMTP id o20mr5934287lfu.257.1641987695601;
 Wed, 12 Jan 2022 03:41:35 -0800 (PST)
MIME-Version: 1.0
References: <20211228041423.2231598-1-gengdongjiu1@gmail.com> <CAJ=z9a2ww3OptqQn+KDdOMrRB_sSAicnVFQJ2UAySq5xZZjhTQ@mail.gmail.com>
In-Reply-To: <CAJ=z9a2ww3OptqQn+KDdOMrRB_sSAicnVFQJ2UAySq5xZZjhTQ@mail.gmail.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Wed, 12 Jan 2022 19:41:23 +0800
Message-ID: <CABSBigRyDr4GstZjwJVrM64f57PZKL_Dmq0N+BiKYW3fuXxWYg@mail.gmail.com>
Subject: Re: [PATCH v3] xen/arm: Allow QEMU platform to be built with GICv2
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Julien Grall <julien.grall.oss@gmail.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=88=
28=E6=97=A5=E5=91=A8=E4=BA=8C 18:39=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Tue, 28 Dec 2021 at 05:14, Dongjiu Geng <gengdongjiu1@gmail.com> wrote=
:
> >
> > Trying to select PLATFORM_QEMU with NEW_VGIC will result to Kconfig
> > complain about unmet dependencies:
> >
> > tools/kconfig/conf  --syncconfig Kconfig
> >
> > WARNING: unmet direct dependencies detected for GICV3
> >    Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> >    Selected by [y]:
> >    - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> >
> > WARNING: unmet direct dependencies detected for GICV3
> >    Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> >    Selected by [y]:
> >    - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> >
> > WARNING: unmet direct dependencies detected for GICV3
> >    Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> >    Selected by [y]:
> >    - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> >
> > It turns out that QEMU has been supporting GICv2 virtualization since
> > v3.1.0. So an easy way to solve the issue and allow more custom support
> > is to remove the dependencies on GICv3.
>
> You took my proposed commit message but the diff in
> this version doesn't match it.
>
> >
> > Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> > ---
> > change since v1:
> > 1. Address Stefano's comments to add dependency
> >
> > change since v2:
> > 1. Address Julien's comments to update the commit messages.
> > 2. enable GICV3 in arch/arm/configs/tiny64_defconfig
> > ---
> >  xen/arch/arm/Kconfig                  | 5 +++--
> >  xen/arch/arm/configs/tiny64_defconfig | 2 +-
> >  xen/arch/arm/platforms/Kconfig        | 2 +-
> >  3 files changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index ecfa6822e4..373c698018 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
>
> Are the changes necessary in arch/arm/Kconfig to solve the issue on QEMU?
> If not, then they should be in a separate patch.
> If yes, then they ought to be explained in the commit message.
>
> > @@ -35,7 +35,7 @@ config ACPI
> >
> >  config GICV3
> >         bool "GICv3 driver"
> > -       depends on ARM_64 && !NEW_VGIC
> > +       depends on ARM_64
> >         default y
> >         ---help---
> >
> > @@ -44,13 +44,14 @@ config GICV3
> >
> >  config HAS_ITS
> >          bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUP=
PORTED
> > -        depends on GICV3 && !NEW_VGIC
> > +        depends on GICV3
> >
> >  config HVM
> >          def_bool y
> >
> >  config NEW_VGIC
> >         bool "Use new VGIC implementation"
> > +       depends on !GICV3
> >         ---help---
> >
> >         This is an alternative implementation of the ARM GIC interrupt
> > diff --git a/xen/arch/arm/configs/tiny64_defconfig b/xen/arch/arm/confi=
gs/tiny64_defconfig
> > index cc6d93f2f8..165603f7e0 100644
> > --- a/xen/arch/arm/configs/tiny64_defconfig
> > +++ b/xen/arch/arm/configs/tiny64_defconfig
> > @@ -4,7 +4,7 @@ CONFIG_ARM=3Dy
> >  #
> >  # Architecture Features
> >  #
> > -# CONFIG_GICV3 is not set
> > +CONFIG_GICV3=3Dy
>
> The goal of tiny64_defconfig is to have nothing enabled by default.
> So we should not enable GICV3 here.
>
> >  # CONFIG_MEM_ACCESS is not set
> >  # CONFIG_SBSA_VUART_CONSOLE is not set
> >
> > diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kc=
onfig
> > index c93a6b2756..925f6ef8da 100644
> > --- a/xen/arch/arm/platforms/Kconfig
> > +++ b/xen/arch/arm/platforms/Kconfig
> > @@ -15,7 +15,7 @@ config ALL_PLAT
> >  config QEMU
> >         bool "QEMU aarch virt machine support"
> >         depends on ARM_64
> > -       select GICV3
> > +       select GICv3 if !NEW_VGIC
>
> There was an open question in v2. In general, it is better to wait
> until the discussion is closed or you mention it after ---. This
> avoids being lost.

Sorry for the noise, Stefano,  do you have any suggestion for this
patch?  thanks a lot.

>
> Cheers,
>
> --
> Julien Grall

