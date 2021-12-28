Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BC54808D5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Dec 2021 12:38:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252205.433205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2An5-00063s-UP; Tue, 28 Dec 2021 11:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252205.433205; Tue, 28 Dec 2021 11:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2An5-00060R-RP; Tue, 28 Dec 2021 11:37:15 +0000
Received: by outflank-mailman (input) for mailman id 252205;
 Tue, 28 Dec 2021 11:37:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Zee=RN=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1n2An4-00060L-PV
 for xen-devel@lists.xenproject.org; Tue, 28 Dec 2021 11:37:14 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8023fc81-67d2-11ec-9e60-abaf8a552007;
 Tue, 28 Dec 2021 12:37:13 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id by39so30267304ljb.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Dec 2021 03:37:13 -0800 (PST)
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
X-Inumbo-ID: 8023fc81-67d2-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=U/NUykAyec1wy3uv/a1feJuKj6Ex7MYQxPOYhYu7ptM=;
        b=IMgAVwWZjNtSbACdlRHLYb6qY+H6GwWvtLFCVzYSQ9YZ4m9qqFKbZtyoBiwpkvgyCw
         S5SENc/+W0Zx5TJB8e3vChrHOZunIuV+7JJxSm0JfSfuzE6zOXq75Ohco5pIGv0Pvgiw
         p3LzR6F5CLC4w5UoAMoTHVBiA3a1JL8IGlXtZ2RBIpKE7TQtDWwEVUf211PidcYmkTj/
         v+HOGUzAbxuWpeKAPeXshqfdzS9vvAkRHg0OvM02nIJaYkplhBrSUxjEPfF7CUJrjMWs
         B472juvz6uJyuJqZQHkrIxXdfuPgMmVEww5FQaRZdj4xSrR3HmG0A5BrDilmjWHX7eHO
         qPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=U/NUykAyec1wy3uv/a1feJuKj6Ex7MYQxPOYhYu7ptM=;
        b=zqAEjUB9FR6zeXMmAYFfxI7PFkyJZv1+xFGLBsUSlECcymtNNxn/Y/yC20UTzaIB2M
         KdZnorO61mrhOk3L4lH5UVRzanEeUF+iB68CjEVV8VXWvoDQ82gdZA4lG5KdN01wOofX
         Zadcb8R+Ovs09uO6dzpfynF0prasq/MCliEc1inWSn1aD9bd8xt3NfhUSvIOBvDQUzNk
         38ZKQgZXqY3yup8EG8fJtBbEyTAdXebttl+PJe2pbFCgMw5hbeZJOcmSdu8gdlJGkaaN
         anrxUdLSQ2VZh8yc0DvqsFxf1/Je6TtJzm31C2ktgr3xA8at62BiV9OrWzJUqcjsVUI0
         o6GA==
X-Gm-Message-State: AOAM531PLydXh/0y9VeXeupjpJ8TgLfKCzxGVu0D6pqs9ngkDKTjQGdP
	i49HHU7HRbPo95fAk+6UDGSgQhLzIWN01wFIEeQ=
X-Google-Smtp-Source: ABdhPJz5zn2g+4ocIg97nPHGiYFBDkhk5qYNqJZcZo7VQIxIhEHAK/N6CA9vSgnlLPH0KCy8z645Ox05bAgztuFNffI=
X-Received: by 2002:a2e:aa9b:: with SMTP id bj27mr9536076ljb.23.1640691432887;
 Tue, 28 Dec 2021 03:37:12 -0800 (PST)
MIME-Version: 1.0
References: <20211224122451.1210382-1-gengdongjiu1@gmail.com>
 <22172c85-b024-a28a-e351-82038cf0efa1@xen.org> <CABSBigQjy2jvW6czAXHMvVc9DmHRED5HWz-5At6FN9gPLnzsng@mail.gmail.com>
 <9a1edb02-ad32-4229-6baf-dbe69d7e718b@xen.org> <CABSBigTZ--z_ZCGd6-VQEvfyu+166WA2C_Ns7qFiWPay9A=hUA@mail.gmail.com>
 <CAJ=z9a1o_-3A3=NKkbBT-s2EGM+WKJPiwxSt3q45PWs_9udcdw@mail.gmail.com>
In-Reply-To: <CAJ=z9a1o_-3A3=NKkbBT-s2EGM+WKJPiwxSt3q45PWs_9udcdw@mail.gmail.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Tue, 28 Dec 2021 19:37:02 +0800
Message-ID: <CABSBigTyZ46OjvANi23e3sgL8+AKk73=3AOQnfvwhWcXhM-pgQ@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: fix the build error for GIC on ARM64 QEMU Platform
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Julien Grall <julien.grall.oss@gmail.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=88=
28=E6=97=A5=E5=91=A8=E4=BA=8C 18:27=E5=86=99=E9=81=93=EF=BC=9A
>
> Hello,
>
> On Sun, 26 Dec 2021 at 11:07, Dongjiu Geng <gengdongjiu1@gmail.com> wrote=
:
> >
> > Julien Grall <julien@xen.org> =E4=BA=8E2021=E5=B9=B412=E6=9C=8824=E6=97=
=A5=E5=91=A8=E4=BA=94 22:21=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > Hi,
> > >
> > > I am not sure why you dropped the others. I have added them back.
> >
> > sorry, it is my mistake
> >
> > >
> > > On 24/12/2021 14:36, Dongjiu Geng wrote:
> > > > Julien Grall <julien@xen.org> =E4=BA=8E2021=E5=B9=B412=E6=9C=8824=
=E6=97=A5=E5=91=A8=E4=BA=94 21:25=E5=86=99=E9=81=93=EF=BC=9A
> > > >>
> > > >> Hi,
> > > >>
> > > >> On 24/12/2021 13:24, Dongjiu Geng wrote:
> > > >>> when enable CONFIG_NEW_VGIC in ARM64 QEMU Platform, it will build=
 failed.
> > > >>> so fix it and make it can select GICV2.
> > > >>
> > > >> As I said in v1, last time I checked QEMU was only able to support
> > > >> virtualization with GICv3. This is why we added a depends on.
> > > >
> > > > I enabled CONFIG_NEW_VGIC, then it will use GICv2. In my check, it
> > > > does not report an error.
> > > > My QEMU emulator version is 4.0.0.  What is the QEMU version that y=
ou used?
> > >
> > > I am using a more recent QEMU. However, I have always only used GICv3
> > > becuase it was IIRC there first.
> > >
> > > >
> > > >>
> > > >> If you want to remove it, then I think you ought to explain in the
> > > >> commit message why this is fine. A pointer to the commit or a QEMU
> > > >> version used would be useful.
> > > >
> > > > OK=EF=BC=8Cthanks. Can you check if QEMU 4.0.0 is workable with GIC=
v2 on your side?
> > >
> > > I don't have direct access to my QEMU setup at the moment. However,
> > > looking at the history.
> > >
> > > So I would suggest the following commit message:
> > >
> > > "
> > > xen/arm: Allow QEMU platform to be built with GICv2
> > >
> > > Trying to select PLATFORM_QEMU with NEW_VGIC will result to Kconfig
> > > complain about unmet dependencies:
> > >
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
> > >
> > >
> > > It turns out that QEMU has been supporting GICv2 virtualization since
> > > v3.1.0. So an easy way to solve the issue and allow more custom suppo=
rt
> > > is to remove the dependencies on GICv3.
> > > "
> >
> > Ok, thanks very much for your suggestion.
> >
> > >
> > > > It is workable on my side.
> > > >
> > > >
> > > >>
> > > >>>
> > > >>> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> > > >>> ---
> > > >>> $ make dist-xen XEN_TARGET_ARCH=3Darm64 CROSS_COMPILE=3Daarch64-l=
inux-gnu- -j10
> > > >>> make -C xen install
> > > >>> make[1]: Entering directory '/home/workspace/gengdongjiu/old_mach=
ine/XEN/xen/xen'
> > > >>> make -f /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools=
/kconfig/Makefile.kconfig ARCH=3Darm64 SRCARCH=3Darm HOSTCC=3D"gcc" HOSTCXX=
=3D"g++" syncconfig
> > > >>> make[2]: Entering directory '/home/workspace/gengdongjiu/old_mach=
ine/XEN/xen/xen'
> > > >>> gcc -Wp,-MD,tools/kconfig/.conf.o.d      -c -o tools/kconfig/conf=
.o tools/kconfig/conf.c
> > > >>> gcc -Wp,-MD,tools/kconfig/.confdata.o.d      -c -o tools/kconfig/=
confdata.o tools/kconfig/confdata.c
> > > >>> gcc -Wp,-MD,tools/kconfig/.expr.o.d      -c -o tools/kconfig/expr=
.o tools/kconfig/expr.c
> > > >>> flex -otools/kconfig/lexer.lex.c -L tools/kconfig/lexer.l
> > > >>> bison -o tools/kconfig/parser.tab.c --defines=3Dtools/kconfig/par=
ser.tab.h -t -l tools/kconfig/parser.y
> > > >>> gcc -Wp,-MD,tools/kconfig/.preprocess.o.d      -c -o tools/kconfi=
g/preprocess.o tools/kconfig/preprocess.c
> > > >>> gcc -Wp,-MD,tools/kconfig/.symbol.o.d      -c -o tools/kconfig/sy=
mbol.o tools/kconfig/symbol.c
> > > >>> gcc -Wp,-MD,tools/kconfig/.lexer.lex.o.d     -I /home/workspace/g=
engdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o tools/kconfig/lexer.=
lex.o tools/kconfig/lexer.lex.c
> > > >>> gcc -Wp,-MD,tools/kconfig/.parser.tab.o.d     -I /home/workspace/=
gengdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o tools/kconfig/parse=
r.tab.o tools/kconfig/parser.tab.c
> > > >>> gcc  -o tools/kconfig/conf tools/kconfig/conf.o tools/kconfig/con=
fdata.o tools/kconfig/expr.o tools/kconfig/lexer.lex.o tools/kconfig/parser=
.tab.o tools/kconfig/preprocess.o tools/kconfig/symbol.o
> > > >>> tools/kconfig/conf  --syncconfig Kconfig
> > > >>>
> > > >>> WARNING: unmet direct dependencies detected for GICV3
> > > >>>     Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> > > >>>     Selected by [y]:
> > > >>>     - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> > > >>>
> > > >>> WARNING: unmet direct dependencies detected for GICV3
> > > >>>     Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> > > >>>     Selected by [y]:
> > > >>>     - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> > > >>>
> > > >>> WARNING: unmet direct dependencies detected for GICV3
> > > >>>     Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> > > >>>     Selected by [y]:
> > > >>>     - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> > > >>> make[2]: Leaving directory '/home/workspace/gengdongjiu/old_machi=
ne/XEN/xen/xen'
> > > >>> make -f Rules.mk _install
> > > >>> make[2]: Entering directory '/home/workspace/gengdongjiu/old_mach=
ine/XEN/xen/xen'
> > > >>> ---
> > > >>>    xen/arch/arm/Kconfig           | 5 +++--
> > > >>>    xen/arch/arm/platforms/Kconfig | 1 -
> > > >>>    2 files changed, 3 insertions(+), 3 deletions(-)
> > > >>>
> > > >>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > >>> index ecfa6822e4..373c698018 100644
> > > >>> --- a/xen/arch/arm/Kconfig
> > > >>> +++ b/xen/arch/arm/Kconfig
> > > >>
> > > >> The change in arch/arm/Kconfig is not really related to this patch=
.
> > > >> Technically the part in platforms/Kconfig is sufficient. I still t=
hink
> > > >> the change is good to have but it should be in a separate patch.
> > > >
> > > > sure
> > > >
> > > >>
> > > >>> @@ -35,7 +35,7 @@ config ACPI
> > > >>>
> > > >>>    config GICV3
> > > >>>        bool "GICv3 driver"
> > > >>> -     depends on ARM_64 && !NEW_VGIC
> > > >>> +     depends on ARM_64
> > > >>>        default y
> > > >>>        ---help---
> > > >>>
> > > >>> @@ -44,13 +44,14 @@ config GICV3
> > > >>>
> > > >>>    config HAS_ITS
> > > >>>            bool "GICv3 ITS MSI controller support (UNSUPPORTED)" =
if UNSUPPORTED
> > > >>> -        depends on GICV3 && !NEW_VGIC
> > > >>> +        depends on GICV3
> > > >>>
> > > >>>    config HVM
> > > >>>            def_bool y
> > > >>>
> > > >>>    config NEW_VGIC
> > > >>>        bool "Use new VGIC implementation"
> > > >>> +     depends on !GICV3
> > > >>>        ---help---
> > > >>>
> > > >>>        This is an alternative implementation of the ARM GIC inter=
rupt
> > > >>> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platfo=
rms/Kconfig
> > > >>> index c93a6b2756..6d3ee99456 100644
> > > >>> --- a/xen/arch/arm/platforms/Kconfig
> > > >>> +++ b/xen/arch/arm/platforms/Kconfig
> > > >>> @@ -15,7 +15,6 @@ config ALL_PLAT
> > > >>>    config QEMU
> > > >>>        bool "QEMU aarch virt machine support"
> > > >>>        depends on ARM_64
> > > >>> -     select GICV3
> > > >>>        select HAS_PL011
> > > >>>        ---help---
> > > >>>        Enable all the required drivers for QEMU aarch64 virt emul=
ated
> > >
> > > While writing a proposal for the commit message, I remembered that th=
e
> > > goal of CONFIG_QEMU was to select all the required drivers to be able=
 to
> > > boot Xen on QEMU.
> > >
> > > AFAICT, if you start from tiny64_defconfig, you would not have GICv3
> > > selected. So we would technically break users of QEMU with GICv3.
> >
> > I think I can add CONFIG_GICV3=3Dy in arch/arm/configs/tiny64_defconfig
> > to this patch, if it must to use GICV3.
>
> Please don't update tiny64_defconfig. The goal of tiny64_defconfig is to
> have a config with only the bare-minimum. If add CONFIG_GICV3=3Dy, then i=
t will
> be enabled when it is not necessary.

Ok=EF=BC=8Cwe can let the user configure the CONFIG_GICV3 in tiny64_defconf=
ig
according his neccesary.
So I think my modification does not affect the tiny64_defconfig. what
is your concern about it?

>
> Cheers,

