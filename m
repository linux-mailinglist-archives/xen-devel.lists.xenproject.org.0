Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077B26A6F24
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 16:17:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504093.776616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXOBu-0004Tj-S6; Wed, 01 Mar 2023 15:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504093.776616; Wed, 01 Mar 2023 15:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXOBu-0004Qm-P5; Wed, 01 Mar 2023 15:16:26 +0000
Received: by outflank-mailman (input) for mailman id 504093;
 Wed, 01 Mar 2023 15:16:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXOBt-0004Qg-9b
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 15:16:25 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0785f9e0-b844-11ed-96a6-2f268f93b82a;
 Wed, 01 Mar 2023 16:16:24 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id j17so14298655ljq.11
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 07:16:24 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 f2-20020a2eb5a2000000b0029474e94ac6sm1714521ljn.12.2023.03.01.07.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:16:23 -0800 (PST)
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
X-Inumbo-ID: 0785f9e0-b844-11ed-96a6-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677683783;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ontny9vISXNNebavwee74ki0qDJWWpixho5Zea+1bcU=;
        b=YXj1oRJZJ3n7BfDsAN/86bzUIjaLzS9VoR+77vyU1ki8bEz/SNv7gnFmRJ+uOWEOx3
         5fpvXMudBT1ozcxrK/f/SgjO4oS4YTfy4aqOLJnPvImKSNEHsl5CFD2i0ZK7MBmlk7tW
         /Ya3XBxsn+cgK8wo1cur6AQEb1HcaLOihuMt9bmn3oPuaWaMHRy63yrhTxvTVjQSLB+l
         H9JwT+rit991NMdnRMCHNrrUGqHGT+n0/7gUtY0eBItIL4vut7SYdQCuFcxat85JDezW
         glviszEIoUa8Wr4ww7tfXxdKHSzu8X5BUzhKdZy9nOayqKkv0ur9S+NL8VvWdNtWPuWJ
         /AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677683783;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ontny9vISXNNebavwee74ki0qDJWWpixho5Zea+1bcU=;
        b=3r5UJTckXMol/fcpEuDbNZ27xcluPQeqNnnd2MZYxb+uX6dAUVhhvimyOYd6tQtOrp
         XAbfaF2exc4/dZ1ng9BCK1sy/EW1j1ygMKnEtdBd/drlQxIWUn3aKKD97+7wsV1LXJP/
         Nqhp2lkNtB3W6DQHwFsn9AVtTO6u29icm1Gsg7p06NJCp6B1MqW8hiXPPnrua44Pcx6o
         0ncDMi68mFAyBi+JzyAgtXucnTLwTEK/aaMCV5aZuJEkPuT+BDBpxMsA+q7uLVxGaFjH
         TeI+CrRrM78T0eAMypRQxpNjUYv7Sb5WiL7+EemBoSqiQtWMAXE5o2CzolLDjpvzR9rf
         g3JQ==
X-Gm-Message-State: AO0yUKUMiuUSsI12i8tYkIPgmvOuP/t/01GR2X+/SO9CFVhl3rqqrGtW
	iFaDUD+FZHmeF3ju+1O9E5g=
X-Google-Smtp-Source: AK7set/vzuZ9qgFfDCUFWo/+eQo29mpfy3neg/WqbyTp2Nkt7ZRa5BE4a00/NNALeQ3Ql2L+3Y3ZSQ==
X-Received: by 2002:a2e:981a:0:b0:28b:6f21:d929 with SMTP id a26-20020a2e981a000000b0028b6f21d929mr1968745ljj.32.1677683783496;
        Wed, 01 Mar 2023 07:16:23 -0800 (PST)
Message-ID: <bb5105f462a79bc0136348302407574f1d9f792b.camel@gmail.com>
Subject: Re: [PATCH v3 3/4] xen/arm: switch ARM to use generic
 implementation of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Wed, 01 Mar 2023 17:16:21 +0200
In-Reply-To: <297fb314-7752-fdf6-3003-f5bd1396c1e3@xen.org>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
	 <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
	 <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
	 <ae96eb36-aeba-86f0-3b72-a8b62f4dce60@xen.org>
	 <6735859208c6dcb7320f89664ae298005f70827b.camel@gmail.com>
	 <75df5a86-5d64-d219-c25c-644748a88302@xen.org>
	 <3f108af54c7d824f59a7dc1daf7d4d0c23f617ec.camel@gmail.com>
	 <297fb314-7752-fdf6-3003-f5bd1396c1e3@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-01 at 13:58 +0000, Julien Grall wrote:
> On 01/03/2023 12:31, Oleksii wrote:
> > Hi Julien,
>=20
> Hi,
>=20
> > > > >=20
> > > > > > On 24/02/2023 11:31, Oleksii Kurochko wrote:
> > > > > > > The following changes were made:
> > > > > > > * make GENERIC_BUG_FRAME mandatory for ARM
> > > > > >=20
> > > > > > I have asked in patch #1 but will ask it again because I
> > > > > > think
> > > > > > this
> > > > > > should be recorded in the commit message. Can you outline
> > > > > > why
> > > > > > it is
> > > > > > not
> > > > > > possible to completely switch to the generic version?
> > > > >=20
> > > > > I have just tried to remove it on arm64 and it seems to work.
> > > > > This
> > > > > was
> > > > > only tested with GCC 10 though. But given the generic version
> > > > > is
> > > > > not
> > > > > not
> > > > > using the %c modifier, then I wouldn't expect any issue.
> > > > >=20
> > > > > Cheers,
> > > > >=20
> > > >=20
> > > > I tried to switch ARM to generic implementation.
> > > >=20
> > > > Here is the patch: [1]
> > >=20
> > > This is similar to the patch I wrote to test with generic
> > > implementation
> > > on Arm (see my other reply).
> > >=20
> > > [...]
> > >=20
> > > > (it will be merged with patch 3 if it is OK )
> > > >=20
> > > > And looks like we can switch ARM to generic implementation as
> > > > all
> > > > tests
> > > > passed:
> > > > https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/7915493=
96
> > >=20
> > > Thanks for checking with the gitlab CI!
> > >=20
> > > >=20
> > > > The only issue is with yocto-arm:
> > > > https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/7915493=
96/failures
> > > > But I am not sure that it is because of my patch
> > >=20
> > > This looks unrelated to me. This is happening because there is a
> > > data
> > > abort before PSCI (used to reboot the platform) is properly
> > > setup. I
> > > think we should consider to only print once the error rather than
> > > every
> > > few iterations (not a request for you).
> > >=20
> > > That said, I am a bit puzzled why this issue is only happening in
> > > the
> > > Yocto test (the Debian one pass). Do you know if the test is
> > > passing
> > > in
> > > the normal CI?
> > I checked several pipelines on the normal CI and it is fine.
> > >=20
> > > If yes, what other modifications did you do?
> > It looks like the issue happens after switch ARM to generic
> > implementation of bug.h:
> > -
> > https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/792379063/f=
ailures
> > [ failure ]
> > -
> > https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/792381665/f=
ailures
> > [ passed ]
> >=20
> > The difference between builds is only in the commit ' check if ARM
> > can
> > be fully switched to generic implementation '.
> > For second one it is reverted so it looks like we can't switch ARM
> > to
> > generic implementation now as it is required addiotional
> > investigation.
>=20
> Thanks. Looking at the error again, it looks like the data abort is=20
> because we are accessing an unaligned address.
>=20
> =C2=A0From a brief look at arch/arm/xen.lds.S, I can at least see one cas=
e
> of=20
> misalignment (not clear why it would only happen now though). Can you
> try:
>=20
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 3f7ebd19f3ed..fb8155bd729f 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -67,6 +67,7 @@ SECTIONS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.data.rel.ro)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.data.rel.ro.*)
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(4);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __proc_info_start =3D .;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.proc.info)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __proc_info_end =3D .;
>=20
> >=20
> > There is no other significant changes ( only the changes mentioned
> > in
> > the current mail thread ).
> >=20
> > Could we go ahead without switching ARM to generic implementation
> > to
> > not block other RISC-V patch series?
>=20
> Given this is an alignment issue (Arm32 is more sensible to this than
> the other architecture, but this is still a potential problem for the
> other archs), I would really like to understand whether this is an
> issue=20
> in the common code or in the Arm linker script.
I have a good news.

Alignment of "*(.proc.info)" helps but I checked only yocto-qemuarm:
https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/792923264

I ran all tests here:
https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/792953524

Should I create a separate patch with ALIGN if the tests are passed?

~ Oleksii

