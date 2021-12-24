Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D35E47EECD
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 13:27:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251353.432645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0jfX-0002bY-8Q; Fri, 24 Dec 2021 12:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251353.432645; Fri, 24 Dec 2021 12:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0jfX-0002ZU-4V; Fri, 24 Dec 2021 12:27:31 +0000
Received: by outflank-mailman (input) for mailman id 251353;
 Fri, 24 Dec 2021 12:27:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pHI=RJ=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1n0jfV-0002ZO-LR
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 12:27:29 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db80bf3b-64b4-11ec-bb0b-79c175774b5d;
 Fri, 24 Dec 2021 13:27:28 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id bt1so18717518lfb.13
 for <xen-devel@lists.xenproject.org>; Fri, 24 Dec 2021 04:27:28 -0800 (PST)
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
X-Inumbo-ID: db80bf3b-64b4-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l2B6pmDPPPwS4sjVPtyOTR7JrcIeGRAtm9EI1i9aZJY=;
        b=NCKTSxjrI6Bxbvhtc3A3dLRMuvUWW0a37j3Z4yUCkJadbAl6nk5SI41ocy5O+E6jDb
         0z8XFR+d7NWrjyPyo+V9Xqn3Oc8rFMxvWNet3DhNeySvqA/TC55su8OHdo1Z/0OpduR4
         YrJRnwuVeczuoqi2ih/WvHxtKTJ14sWS3sDkFjXKcfI5NP6gtL0pMqcKDt4ZS/t7X4Fq
         Y9SvLInhc0+bNeo3dUw1MnaRTZNxcIfZ/lZp7KrLviD5Dav88tjxqI0QMS3lPa9gg0y6
         vY63wdxgPeckLY30bdtudtF/koEkgyqX+5Aoou2mdy+0Je2Q5yxEDm3Xe9pvH7b3P78w
         0RNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l2B6pmDPPPwS4sjVPtyOTR7JrcIeGRAtm9EI1i9aZJY=;
        b=BayuK1b7noYLezX0nDSnOl0YBdWLutr29WbbxAcnnYRorxUzsFjSzjVCStYMq3aIOH
         n+YzDdQRzxtB12hASjKyK7NKDBges8q6rSrU8HoX96+lQGuy41/I1//+oJ0kVKgwJ+b/
         ragQovd9IuSvMpCmYsldzv7XFOJ5J/rEjmZBlMRY6Ur+rCQMIrn1IXCmA/MPa4OYkdYj
         gaLenwZzB+GOT2PWBMi3nIVS29zuLIRQ0/kWXMnIWReFmS8VhyBY4+ZWwHvHdaBm2bPu
         vPQ1GcAYNZ2p/ZOGMKhUpSYuG0qfo0XnUjh/pd2rlvGUmqcq3o4vRG+uQU8g9tIwupR7
         BnXA==
X-Gm-Message-State: AOAM530DGXOl/u4tyORjcfigxkaYdWbItWPnxWdtG7ZdF6UFhVxNH7v0
	genwURgiEiGJSzeH77wcSFXqCi//qKb9RlYbDto=
X-Google-Smtp-Source: ABdhPJz8kDg3RK7/GWiJq/kLijP6KroHjI6ocef9c8nmAmztRVZDXflOIiR4hm8cOjnU7gsupV0j2KhnN6Q6k/mLEpA=
X-Received: by 2002:ac2:5c43:: with SMTP id s3mr5291492lfp.260.1640348847861;
 Fri, 24 Dec 2021 04:27:27 -0800 (PST)
MIME-Version: 1.0
References: <20211222083825.2918045-1-gengdongjiu1@gmail.com>
 <6aabf7fe-81ea-0fbc-a640-75f9ac59806b@xen.org> <alpine.DEB.2.22.394.2112231606420.2060010@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2112231606420.2060010@ubuntu-linux-20-04-desktop>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Fri, 24 Dec 2021 20:27:15 +0800
Message-ID: <CABSBigTouOAdV=FZ3oSTtK9zZyvm4TQ2WfN-Ef307vBAVcWYVw@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: fix the build error for GIC
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Stefano Stabellini <sstabellini@kernel.org> =E4=BA=8E2021=E5=B9=B412=E6=9C=
=8824=E6=97=A5=E5=91=A8=E4=BA=94 08:08=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 22 Dec 2021, Julien Grall wrote:
> > Hello,
> >
> > On 22/12/2021 09:38, Dongjiu Geng wrote:
> > > when enable CONFIG_NEW_VGIC in ARM64 QEMU Platform, it will build fai=
led.
> > > so fix it and make it can select GICV2.
> >
> > Last time I checked QEMU, it was only able to support GICv3 virtualizat=
ion.
> > Has it changed since?
> >
> > >
> > > Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> > > ---
> > > $ make dist-xen XEN_TARGET_ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux=
-gnu- -j10
> > > make -C xen install
> > > make[1]: Entering directory
> > > '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
> > > make -f
> > > /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig/Mak=
efile.kconfig
> > > ARCH=3Darm64 SRCARCH=3Darm HOSTCC=3D"gcc" HOSTCXX=3D"g++" syncconfig
> > > make[2]: Entering directory
> > > '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
> > > gcc -Wp,-MD,tools/kconfig/.conf.o.d      -c -o tools/kconfig/conf.o
> > > tools/kconfig/conf.c
> > > gcc -Wp,-MD,tools/kconfig/.confdata.o.d      -c -o tools/kconfig/conf=
data.o
> > > tools/kconfig/confdata.c
> > > gcc -Wp,-MD,tools/kconfig/.expr.o.d      -c -o tools/kconfig/expr.o
> > > tools/kconfig/expr.c
> > > flex -otools/kconfig/lexer.lex.c -L tools/kconfig/lexer.l
> > > bison -o tools/kconfig/parser.tab.c --defines=3Dtools/kconfig/parser.=
tab.h -t
> > > -l tools/kconfig/parser.y
> > > gcc -Wp,-MD,tools/kconfig/.preprocess.o.d      -c -o
> > > tools/kconfig/preprocess.o tools/kconfig/preprocess.c
> > > gcc -Wp,-MD,tools/kconfig/.symbol.o.d      -c -o tools/kconfig/symbol=
.o
> > > tools/kconfig/symbol.c
> > > gcc -Wp,-MD,tools/kconfig/.lexer.lex.o.d     -I
> > > /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c =
-o
> > > tools/kconfig/lexer.lex.o tools/kconfig/lexer.lex.c
> > > gcc -Wp,-MD,tools/kconfig/.parser.tab.o.d     -I
> > > /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c =
-o
> > > tools/kconfig/parser.tab.o tools/kconfig/parser.tab.c
> > > gcc  -o tools/kconfig/conf tools/kconfig/conf.o tools/kconfig/confdat=
a.o
> > > tools/kconfig/expr.o tools/kconfig/lexer.lex.o tools/kconfig/parser.t=
ab.o
> > > tools/kconfig/preprocess.o tools/kconfig/symbol.o
> > > tools/kconfig/conf  --syncconfig Kconfig
> > >
> > > WARNING: unmet direct dependencies detected for GICV3
> > >    Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> > >    Selected by [y]:
> > >    - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> > >
> > > WARNING: unmet direct dependencies detected for GICV3
> > >    Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> > >    Selected by [y]:
> > >    - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> > >
> > > WARNING: unmet direct dependencies detected for GICV3
> > >    Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> > >    Selected by [y]:
> > >    - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> > > make[2]: Leaving directory
> > > '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
> > > make -f Rules.mk _install
> > > make[2]: Entering directory
> > > '/home/workspace/gengdongjiu/old_machine/XEN/xen/xen'
> > > ---
> > >   xen/arch/arm/platforms/Kconfig | 1 -
> > >   1 file changed, 1 deletion(-)
> > >
> > > diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/=
Kconfig
> > > index c93a6b2756..6d3ee99456 100644
> > > --- a/xen/arch/arm/platforms/Kconfig
> > > +++ b/xen/arch/arm/platforms/Kconfig
> > > @@ -15,7 +15,6 @@ config ALL_PLAT
> > >   config QEMU
> > >     bool "QEMU aarch virt machine support"
> > >     depends on ARM_64
> > > -   select GICV3
> >
> > Assuming you can use Xen with GICv2 on QEMU, then this change is OK. Bu=
t we
> > are at risk to expose it again via another platform.
> >
> > So I think it would be better to also to add a dependency !GICV3 for NE=
W_VGIC.
>
> I agree. I gave it a try and turns out it is not possible to simply add:
>
> depends on !GICV3
>
> under NEW_VGIC because there is already a !NEW_VGIC under GICV3.
> Apparently it creates a circular dependency. Instead, I did the
> following and it looks like it is behaving the way we want.
>
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..373c698018 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -35,7 +35,7 @@ config ACPI
>
>  config GICV3
>         bool "GICv3 driver"
> -       depends on ARM_64 && !NEW_VGIC
> +       depends on ARM_64
>         default y
>         ---help---
>
> @@ -44,13 +44,14 @@ config GICV3
>
>  config HAS_ITS
>          bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPO=
RTED
> -        depends on GICV3 && !NEW_VGIC
> +        depends on GICV3
>
>  config HVM
>          def_bool y
>
>  config NEW_VGIC
>         bool "Use new VGIC implementation"
> +       depends on !GICV3
>         ---help---

Thanks for the suggestion, I have updated it and resumbit patch v2,
please review it again.

>
>         This is an alternative implementation of the ARM GIC interrupt

