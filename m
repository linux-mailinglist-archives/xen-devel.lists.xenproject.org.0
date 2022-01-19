Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2243F493983
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 12:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258807.446144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA9Ak-0005VW-6C; Wed, 19 Jan 2022 11:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258807.446144; Wed, 19 Jan 2022 11:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA9Ak-0005T7-3B; Wed, 19 Jan 2022 11:30:38 +0000
Received: by outflank-mailman (input) for mailman id 258807;
 Wed, 19 Jan 2022 11:30:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kB+X=SD=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1nA9Ai-0005T1-D1
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 11:30:36 +0000
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [2a00:1450:4864:20::143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 379ea793-791b-11ec-a115-11989b9578b4;
 Wed, 19 Jan 2022 12:30:34 +0100 (CET)
Received: by mail-lf1-x143.google.com with SMTP id bu18so8119661lfb.5
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jan 2022 03:30:35 -0800 (PST)
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
X-Inumbo-ID: 379ea793-791b-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q43cqyxfEmnMEIhCkOcgzroAj3DW/hzFJmxRaO8jgQU=;
        b=i5g4BrZGC4dMIuAxySXpTW62RPr4TBWFiIsBiidRNF0qnwW/bhmVzjfoRfkqWUlssM
         rtkoCQTLtjIySf3hWAp0b3G3QU2suvA9cw/hZNmvlD/jj+aCxE1HzwfSKg9m6NSaWcmV
         SX48Nwys3duAC5XZZrvkK3Z4ZXkiJXqg16inG/gOjHY6T0w7VzIki7gcgjTmhd63U0KB
         KwNJTt1HP1RnPdc0b1SwfphwlcIkUCk5bCTCc2FnOiwSjn+7PquF3Md4IgyxyrkhcdLn
         /wkln19K69Esjaf/dnjog0YIlHPDAD9eIQO8pzvQRj7K1AYUoi0yI3BLKZTrM6EW7Q6F
         gXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q43cqyxfEmnMEIhCkOcgzroAj3DW/hzFJmxRaO8jgQU=;
        b=IsmHYrcYpF0T1QxdshBzUSYnDQaSDYWK19ZbpNUdMojMsQa6u13NVI/EVYrCZy81TR
         grXRoBUlzBwzk1Gyhg7fmp2iZRqkJrNKzep4WrFR6PNFLVc6f7LjDMJQfdtQdy029GcH
         2UpqUXqfWx3mjAD8V9fKNMwV++OGdBaDpyO06qKCg43/1aYxs0foUUZaxpdTd4vtWmAs
         Tklz7QtjYMjW3B6eF+0H0fI2S64Qd59fF2yI7q7WWXtz8KtmZ0YFMyVibo5yLAgQgmmk
         LX+kyWQBh5fGObwvRfQY3sGz9mCEoyyA0BFW/9FTBYF43bPMbEf65ziJ+1bllFjWsldH
         wi2g==
X-Gm-Message-State: AOAM531KyYGsxqSlyiYmITvqXILRkxckwiP5dCZn1cXWHtPMM3zMVSKV
	IQn4Fi1fDaV/YHHqjhoVX/J0ygEQDCuDmP9GVeA=
X-Google-Smtp-Source: ABdhPJztgSNQZy6W5424hDrR5WPdPGPOq4jNSA8ZUAMfspWSAsig4EZ+vYfva4Zo4bXGBH9Pc3CmHSlARAM0Y7PFuSY=
X-Received: by 2002:a2e:968e:: with SMTP id q14mr23978075lji.404.1642591834264;
 Wed, 19 Jan 2022 03:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20220117064003.3367188-1-gengdongjiu1@gmail.com>
 <2a1a0dd5-b8a7-8072-2961-b1fbe9ec746a@xen.org> <CABSBigSOjoXABoYoe+SahQyX0P045YjgK3A=7yyxw_aX8nzTqg@mail.gmail.com>
 <9A7FAD16-3D4A-4C22-8288-A4719A993CDD@arm.com> <CABSBigSba0ENZ-AvDN7bPGNqS5zQKceL901BxhjR8pkRntgnrw@mail.gmail.com>
 <A5AC5212-A9FD-4027-893D-24A5A8DFD825@arm.com>
In-Reply-To: <A5AC5212-A9FD-4027-893D-24A5A8DFD825@arm.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Wed, 19 Jan 2022 19:30:23 +0800
Message-ID: <CABSBigRR+QEbPcibGmHAi1egY1XegPDZ_n2zmJftG49+-dOk4w@mail.gmail.com>
Subject: Re: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bertrand Marquis <Bertrand.Marquis@arm.com> =E4=BA=8E2022=E5=B9=B41=E6=9C=
=8818=E6=97=A5=E5=91=A8=E4=BA=8C 17:17=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Dongju,
>
> > On 18 Jan 2022, at 08:58, Dongjiu Geng <gengdongjiu1@gmail.com> wrote:
> >
> > Bertrand Marquis <Bertrand.Marquis@arm.com> =E4=BA=8E2022=E5=B9=B41=E6=
=9C=8818=E6=97=A5=E5=91=A8=E4=BA=8C 16:48=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> Hi Dongju,
> >>
> >>> On 18 Jan 2022, at 08:45, Dongjiu Geng <gengdongjiu1@gmail.com> wrote=
:
> >>>
> >>> Julien Grall <julien@xen.org> =E4=BA=8E2022=E5=B9=B41=E6=9C=8817=E6=
=97=A5=E5=91=A8=E4=B8=80 22:16=E5=86=99=E9=81=93=EF=BC=9A
> >>>>
> >>>> Hi,
> >>>>
> >>>> On 17/01/2022 10:40, Dongjiu Geng wrote:
> >>>>> It turns out that QEMU has been supporting GICv2 virtualization sin=
ce
> >>>>> v3.1.0. So remove the dependencies on GICv3.
> >>>>
> >>>>
> >>>> Technically, the current form of CONFIG_QEMU allows the same binary =
to
> >>>> boot on QEMU with GICv2 or GICv3.
> >>>>
> >>>>> If we want to use GICv3,
> >>>>> we can select the QEMU_LEGACY configuration.
> >>>>
> >>>> AFAIK, GICv3 is not a legacy feature... So it feels a bit odd to nam=
e it
> >>>> like that (see more below).
> >>>
> >>> Legacy means QEMU platform only supports GICV3, now it can support
> >>> both GICv2 and GICv3. The scope of support has been expanded
> >>> Not mean GICv3 is a legacy feature.
> >>
> >> You might be misleading a bit here.
> >> In the current configuration, Xen support GICv2, GICv3 and vgic.
> >> The only thing not supported is actually the new VGIC but this is an u=
nsupported feature not fully functional which shall be used with caution.
> >>
> >> What issue exactly do you have in Qemu configured for gicv2 when you u=
se the default configuration ?
> >
> > I want to use NEW_VGIC with GICv2, but QEMU only select GICV3,  when
> > GICv3 is select, the NEW_VGIC can not be used.   I try the NEW_VGIC
> > with GICv2, not found issue. so I want to remove this limitation.
> > If  you think we should not support NEW_VGIC feature,  we can ignore
> > this patch.  thanks!
>
> Supporting GICv2 makes sense but using NEW_VGIC in Xen might not as it is=
 not security supported and does not support ITS and MSIs.
   It is surely that NEW_VGIC not support ITS and MSI.  but I think
QEMU platform should not limit user select it.  Selecting GICv2=E3=80=81GIC=
v3
or NEW_VGIC may be chosen by users. But I find user can select it at
all.

>
> Do you have a reason to use the NEW_VGIC implementation instead of the st=
andard one ?

I add some features which is ported from KVM,  NEW_VGIC is refereed to
KVM=EF=BC=8Cso it easily integrate


>
> Cheers
> Bertrand
>
> >
> >>
> >> Cheers
> >> Bertrand
> >>
> >>>
> >>>>
> >>>>>
> >>>>> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> >>>>> ---
> >>>>> xen/arch/arm/platforms/Kconfig | 10 +++++++++-
> >>>>> 1 file changed, 9 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platform=
s/Kconfig
> >>>>> index c93a6b2756..41e82a42ee 100644
> >>>>> --- a/xen/arch/arm/platforms/Kconfig
> >>>>> +++ b/xen/arch/arm/platforms/Kconfig
> >>>>> @@ -13,7 +13,15 @@ config ALL_PLAT
> >>>>>     automatically select any of the related drivers.
> >>>>>
> >>>>> config QEMU
> >>>>> -     bool "QEMU aarch virt machine support"
> >>>>> +     bool "QEMU aarch virt machine support >=3D v3.1.0"
> >>>>
> >>>> This is a bit misleading. A user may select this thinking that this =
will
> >>>> select GICv3. However, this will not.
> >>>>
> >>>> This also raises the question of what is the default GIC version in =
QEMU
> >>>> (i.e. if you don't pass anything on the command line)? If this is GI=
Cv3,
> >>>> then I am afraid that this patch would be a no-go for me.
> >>>>
> >>>> Looking at overall discussion, you seem to push the patch only to al=
low
> >>>> building a tiny Xen for QEMU and the new vGIC.
> >>>>
> >>>> The default Xen (i.e. make defconfig) will also work on QEMU. Given =
that
> >>>> the new vGIC is a still in development, I am seriously considering t=
o
> >>>> say that if you want to try it then you have to use the default
> >>>> configuration.
> >>>>
> >>>> @Dongjiu, is there any reason why you want to use the tiny QEMU conf=
ig
> >>>> rather than the default configuration?
> >>>
> >>> Hi Julien, thanks for the reply, I do not use the tiny QEMU config. I
> >>> used the default configuration and selected the platform as QEMU.
> >>> But QEMU platform only slects GICV3, so I submit this patch to remove
> >>> the limitation because I want to use VGIC. VGIC can already support
> >>> GICv2 now.
> >>>
> >>>>
> >>>> @Bertrand, @Stefano, what do you think?
> >>>>
> >>>> Cheers,
> >>>>
> >>>> --
> >>>> Julien Grall
>

