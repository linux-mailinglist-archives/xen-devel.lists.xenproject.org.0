Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 267F24805E9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Dec 2021 04:51:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252115.433109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n23VC-0007yX-Gh; Tue, 28 Dec 2021 03:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252115.433109; Tue, 28 Dec 2021 03:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n23VC-0007wN-Cj; Tue, 28 Dec 2021 03:50:18 +0000
Received: by outflank-mailman (input) for mailman id 252115;
 Tue, 28 Dec 2021 03:50:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Zee=RN=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1n23V9-0007wH-O2
 for xen-devel@lists.xenproject.org; Tue, 28 Dec 2021 03:50:16 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4283c690-6791-11ec-9e60-abaf8a552007;
 Tue, 28 Dec 2021 04:50:13 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id g26so38628735lfv.11
 for <xen-devel@lists.xenproject.org>; Mon, 27 Dec 2021 19:50:12 -0800 (PST)
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
X-Inumbo-ID: 4283c690-6791-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0yz3CfWTnZ2MXKEK2VSRUIJs2UtkFLPNo94f4f4fXfk=;
        b=pVXkhqLsHm1YfaUXAzJd99TXiU0SlbvI/6KtzQ2sr+HHTPdHCVEJpt3HILj6lJESF4
         E/omQ3WrOQYzGbo7SkYE8kyr1O/OqROAnBhX9wSGuWkIjiedV9l2aFt8wWPVxr/VO5F5
         kbcwsY4JZAtw2C6c++wTBxnGqWjH9/lYD5USi8z0oURBw1Cu4VkXAKw0mTcNjET48Jrx
         OlfkJilxbyNmR87sSCslNBwvdF16xRT8I2I3Ovmiucbv02qfMIszRGWnw4pkH0Z0Vqix
         xvGLxGtVom214Ga8ugkPm/4/deRm/2l3voznuneWxmK4vJ2/ggtJ4oETKasp+RARi7Um
         w30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0yz3CfWTnZ2MXKEK2VSRUIJs2UtkFLPNo94f4f4fXfk=;
        b=tAR3gRBkKdHEkxS70oUiSdFpMVp1El9VmtMybEM0VhioQaPdfuZbHBmGjqF/YVWEXz
         kN7rNuCL8BQv5diPusNIEIiCtUC6vU3X/LwtCakSPwg3FerKO3G1EPucU2Lc68wkJdVp
         avliq4QH7rl7U+T+d8GYHe4FRxZnTomm0a/JcbLY8zOtMS2vriVcqh565ysQlHQiIOfl
         AtL68+drRpXldlQwXMLVPWXtx4CPUiv+Q5heuKiG7e7rs/RXkAdEmvKoNok2jlba312I
         C0iV9SDkxYavGK015zaiB//xK/Jn8f1fs151FTrgl3gj7QDLz4UJFhfEMF5TCFjtyaDJ
         cXyA==
X-Gm-Message-State: AOAM5312cOF9//eKsWzCyQkrd9lHw6c7fq50vI0B8Y5gQPrB/RER9HlJ
	tnl2OU4y183aN8m4AS0vvBUb2c3Wd1aV+AxKHX0=
X-Google-Smtp-Source: ABdhPJw1mBY/GDTKzwz4WNrjd32WcvCL5pGnw7hW+FxbooY1p+DnSGdKPLDWNRA13Ezn8i3pyjzXjPfYZNPEHI2K19s=
X-Received: by 2002:a05:6512:2356:: with SMTP id p22mr13639413lfu.490.1640663412079;
 Mon, 27 Dec 2021 19:50:12 -0800 (PST)
MIME-Version: 1.0
References: <20211224122451.1210382-1-gengdongjiu1@gmail.com>
 <22172c85-b024-a28a-e351-82038cf0efa1@xen.org> <CABSBigQjy2jvW6czAXHMvVc9DmHRED5HWz-5At6FN9gPLnzsng@mail.gmail.com>
 <9a1edb02-ad32-4229-6baf-dbe69d7e718b@xen.org> <CABSBigTZ--z_ZCGd6-VQEvfyu+166WA2C_Ns7qFiWPay9A=hUA@mail.gmail.com>
In-Reply-To: <CABSBigTZ--z_ZCGd6-VQEvfyu+166WA2C_Ns7qFiWPay9A=hUA@mail.gmail.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Tue, 28 Dec 2021 11:50:01 +0800
Message-ID: <CABSBigTgh+0uoUCVAZTU=VLR5gMcxYQq7UjkU5GQfwvS2VaFrA@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: fix the build error for GIC on ARM64 QEMU Platform
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dongjiu Geng <gengdongjiu1@gmail.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=8826=
=E6=97=A5=E5=91=A8=E6=97=A5 18:06=E5=86=99=E9=81=93=EF=BC=9A
>
> Julien Grall <julien@xen.org> =E4=BA=8E2021=E5=B9=B412=E6=9C=8824=E6=97=
=A5=E5=91=A8=E4=BA=94 22:21=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi,
> >
> > I am not sure why you dropped the others. I have added them back.
>
> sorry, it is my mistake
>
> >
> > On 24/12/2021 14:36, Dongjiu Geng wrote:
> > > Julien Grall <julien@xen.org> =E4=BA=8E2021=E5=B9=B412=E6=9C=8824=E6=
=97=A5=E5=91=A8=E4=BA=94 21:25=E5=86=99=E9=81=93=EF=BC=9A
> > >>
> > >> Hi,
> > >>
> > >> On 24/12/2021 13:24, Dongjiu Geng wrote:
> > >>> when enable CONFIG_NEW_VGIC in ARM64 QEMU Platform, it will build f=
ailed.
> > >>> so fix it and make it can select GICV2.
> > >>
> > >> As I said in v1, last time I checked QEMU was only able to support
> > >> virtualization with GICv3. This is why we added a depends on.
> > >
> > > I enabled CONFIG_NEW_VGIC, then it will use GICv2. In my check, it
> > > does not report an error.
> > > My QEMU emulator version is 4.0.0.  What is the QEMU version that you=
 used?
> >
> > I am using a more recent QEMU. However, I have always only used GICv3
> > becuase it was IIRC there first.
> >
> > >
> > >>
> > >> If you want to remove it, then I think you ought to explain in the
> > >> commit message why this is fine. A pointer to the commit or a QEMU
> > >> version used would be useful.
> > >
> > > OK=EF=BC=8Cthanks. Can you check if QEMU 4.0.0 is workable with GICv2=
 on your side?
> >
> > I don't have direct access to my QEMU setup at the moment. However,
> > looking at the history.
> >
> > So I would suggest the following commit message:
> >
> > "
> > xen/arm: Allow QEMU platform to be built with GICv2
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
> >
> > It turns out that QEMU has been supporting GICv2 virtualization since
> > v3.1.0. So an easy way to solve the issue and allow more custom support
> > is to remove the dependencies on GICv3.
> > "
>
> Ok, thanks very much for your suggestion.
>
> >
> > > It is workable on my side.
> > >
> > >
> > >>
> > >>>
> > >>> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> > >>> ---
> > >>> $ make dist-xen XEN_TARGET_ARCH=3Darm64 CROSS_COMPILE=3Daarch64-lin=
ux-gnu- -j10
> > >>> make -C xen install
> > >>> make[1]: Entering directory '/home/workspace/gengdongjiu/old_machin=
e/XEN/xen/xen'
> > >>> make -f /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/k=
config/Makefile.kconfig ARCH=3Darm64 SRCARCH=3Darm HOSTCC=3D"gcc" HOSTCXX=
=3D"g++" syncconfig
> > >>> make[2]: Entering directory '/home/workspace/gengdongjiu/old_machin=
e/XEN/xen/xen'
> > >>> gcc -Wp,-MD,tools/kconfig/.conf.o.d      -c -o tools/kconfig/conf.o=
 tools/kconfig/conf.c
> > >>> gcc -Wp,-MD,tools/kconfig/.confdata.o.d      -c -o tools/kconfig/co=
nfdata.o tools/kconfig/confdata.c
> > >>> gcc -Wp,-MD,tools/kconfig/.expr.o.d      -c -o tools/kconfig/expr.o=
 tools/kconfig/expr.c
> > >>> flex -otools/kconfig/lexer.lex.c -L tools/kconfig/lexer.l
> > >>> bison -o tools/kconfig/parser.tab.c --defines=3Dtools/kconfig/parse=
r.tab.h -t -l tools/kconfig/parser.y
> > >>> gcc -Wp,-MD,tools/kconfig/.preprocess.o.d      -c -o tools/kconfig/=
preprocess.o tools/kconfig/preprocess.c
> > >>> gcc -Wp,-MD,tools/kconfig/.symbol.o.d      -c -o tools/kconfig/symb=
ol.o tools/kconfig/symbol.c
> > >>> gcc -Wp,-MD,tools/kconfig/.lexer.lex.o.d     -I /home/workspace/gen=
gdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o tools/kconfig/lexer.le=
x.o tools/kconfig/lexer.lex.c
> > >>> gcc -Wp,-MD,tools/kconfig/.parser.tab.o.d     -I /home/workspace/ge=
ngdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o tools/kconfig/parser.=
tab.o tools/kconfig/parser.tab.c
> > >>> gcc  -o tools/kconfig/conf tools/kconfig/conf.o tools/kconfig/confd=
ata.o tools/kconfig/expr.o tools/kconfig/lexer.lex.o tools/kconfig/parser.t=
ab.o tools/kconfig/preprocess.o tools/kconfig/symbol.o
> > >>> tools/kconfig/conf  --syncconfig Kconfig
> > >>>
> > >>> WARNING: unmet direct dependencies detected for GICV3
> > >>>     Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> > >>>     Selected by [y]:
> > >>>     - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> > >>>
> > >>> WARNING: unmet direct dependencies detected for GICV3
> > >>>     Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> > >>>     Selected by [y]:
> > >>>     - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> > >>>
> > >>> WARNING: unmet direct dependencies detected for GICV3
> > >>>     Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> > >>>     Selected by [y]:
> > >>>     - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> > >>> make[2]: Leaving directory '/home/workspace/gengdongjiu/old_machine=
/XEN/xen/xen'
> > >>> make -f Rules.mk _install
> > >>> make[2]: Entering directory '/home/workspace/gengdongjiu/old_machin=
e/XEN/xen/xen'
> > >>> ---
> > >>>    xen/arch/arm/Kconfig           | 5 +++--
> > >>>    xen/arch/arm/platforms/Kconfig | 1 -
> > >>>    2 files changed, 3 insertions(+), 3 deletions(-)
> > >>>
> > >>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > >>> index ecfa6822e4..373c698018 100644
> > >>> --- a/xen/arch/arm/Kconfig
> > >>> +++ b/xen/arch/arm/Kconfig
> > >>
> > >> The change in arch/arm/Kconfig is not really related to this patch.
> > >> Technically the part in platforms/Kconfig is sufficient. I still thi=
nk
> > >> the change is good to have but it should be in a separate patch.
> > >
> > > sure
> > >
> > >>
> > >>> @@ -35,7 +35,7 @@ config ACPI
> > >>>
> > >>>    config GICV3
> > >>>        bool "GICv3 driver"
> > >>> -     depends on ARM_64 && !NEW_VGIC
> > >>> +     depends on ARM_64
> > >>>        default y
> > >>>        ---help---
> > >>>
> > >>> @@ -44,13 +44,14 @@ config GICV3
> > >>>
> > >>>    config HAS_ITS
> > >>>            bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if=
 UNSUPPORTED
> > >>> -        depends on GICV3 && !NEW_VGIC
> > >>> +        depends on GICV3
> > >>>
> > >>>    config HVM
> > >>>            def_bool y
> > >>>
> > >>>    config NEW_VGIC
> > >>>        bool "Use new VGIC implementation"
> > >>> +     depends on !GICV3
> > >>>        ---help---
> > >>>
> > >>>        This is an alternative implementation of the ARM GIC interru=
pt
> > >>> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platform=
s/Kconfig
> > >>> index c93a6b2756..6d3ee99456 100644
> > >>> --- a/xen/arch/arm/platforms/Kconfig
> > >>> +++ b/xen/arch/arm/platforms/Kconfig
> > >>> @@ -15,7 +15,6 @@ config ALL_PLAT
> > >>>    config QEMU
> > >>>        bool "QEMU aarch virt machine support"
> > >>>        depends on ARM_64
> > >>> -     select GICV3
> > >>>        select HAS_PL011
> > >>>        ---help---
> > >>>        Enable all the required drivers for QEMU aarch64 virt emulat=
ed
> >
> > While writing a proposal for the commit message, I remembered that the
> > goal of CONFIG_QEMU was to select all the required drivers to be able t=
o
> > boot Xen on QEMU.
> >
> > AFAICT, if you start from tiny64_defconfig, you would not have GICv3
> > selected. So we would technically break users of QEMU with GICv3.

Hi, Julien

I revert my patch and generate the .config file using this comand :
"make tiny64_defconfig CROSS_COMPILE=3Daarch64-linux-gnu-
XEN_TARGET_ARCH=3Darm64"
The generated  .config[1] also does not select CONFIG_GICV3 and
CONFIG_NEW_VGIC.  I think you metioned issue does not related with my
changes.  thanks.


[1]
#
# Architecture Features
#
CONFIG_64BIT=3Dy
CONFIG_NR_CPUS=3D128
# CONFIG_GICV3 is not set
CONFIG_HVM=3Dy
# CONFIG_NEW_VGIC is not set



>
> I think I can add CONFIG_GICV3=3Dy in arch/arm/configs/tiny64_defconfig
> to this patch, if it must to use GICV3.
>
> >
> > I am not entirely sure how to approach it. I can think of 2 options:
> >
> >   1) Use 'select GICv3 if !NEW_VGIC'
> >   2) Add a specific platform for QEMU new vGIC
> >
> > I have the feeling that 1) will result to same unmet dependency issue.
> > Stefano any opinions?
>
> Stefano?
>
> >
> > Cheers,
> >
> > --
> > Julien Grall

