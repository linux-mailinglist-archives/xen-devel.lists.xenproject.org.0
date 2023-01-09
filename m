Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3396620F3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 10:07:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473423.734017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEo6t-0003vS-9f; Mon, 09 Jan 2023 09:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473423.734017; Mon, 09 Jan 2023 09:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEo6t-0003sf-6Z; Mon, 09 Jan 2023 09:06:27 +0000
Received: by outflank-mailman (input) for mailman id 473423;
 Mon, 09 Jan 2023 09:06:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEo6r-0003sZ-UL
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 09:06:25 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e480c940-8ffc-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 10:06:24 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id y25so11929278lfa.9
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 01:06:24 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a056512114500b004a6f66eed7fsm1515230lfg.165.2023.01.09.01.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 01:06:23 -0800 (PST)
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
X-Inumbo-ID: e480c940-8ffc-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ldZV+qH6ZXr7RZBH0qLzar7l+uCmbf1eTyBjBz70T8Q=;
        b=hfIQEM3gqJz9V4DD8KXaZPv58twh+RjCL0/BOjTcMCh21W8Sm5c/S+l8mgdA/uupb8
         CHOEJ2AI/dsVqnYpam1DP2uduywm42l+0g7yzcM2gxzcN0P362+xm5cHQBS7vvQVwN49
         OYXWDcuXqBtFYUdIbSK/6lgOisZO5d9Bke7NEMX0+NhpT1FeubVEHjuQvcreETHuj8hA
         tHFbbjK6PBjm0fcJ3JAutv0uhy+25vm/9V6iAC8mLzEB4ICpl7cTweaRHqEfLNj+TMeL
         Ds8Q/MI/qrURLjus36Fr6DZ+m4aA9kPe6vSh9LNd0fPGuiQnTeI0JNN6QoIszh07734l
         DV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldZV+qH6ZXr7RZBH0qLzar7l+uCmbf1eTyBjBz70T8Q=;
        b=vJDMnCbfW5+O1FcYKlZFqoXjc/k9JXeiEBof7VrMbLcjoQ4LMg/0hKd//Xoc5np++D
         qfn8cFXexLdW23EutjSSg07E0fCFxCmCxMcjLdeNHmCo2k1NwNuj3TRtTWHjqFDi4wre
         UrKyCAffPNzXOiFivImL7bjC/nIXav1aa+iCfFXuoRrmZ+NAgjrepI+Ht0AfKA6aAaGM
         au0bCXAnWT6T1xgtIndaKd0OAm0K3F00dtokCJiGATLRsoCjgnHPuEpcR9Y6haFvlh+a
         k6DDUoQ9lbvL2rX7Wns9QSaLoq4ZUws8ZPUyCKTxscBaMcqaBoDYDHqBy+PQFX3foZc5
         N6UQ==
X-Gm-Message-State: AFqh2krJkrOCevFB5uUGotcTDaewh4gaNZmjak/FHlsLHqug3bYTIc4N
	NXxSlXQxdLagpxR+9CmZp78=
X-Google-Smtp-Source: AMrXdXtYq5nJUVungVZkOKVSlDy4VxKpUU5/JWi9bv9wdziHsqW6Peis4hX9djXGZ69UQnpY+m0Z5w==
X-Received: by 2002:a05:6512:318d:b0:4b5:70e0:f2e6 with SMTP id i13-20020a056512318d00b004b570e0f2e6mr22776856lfe.24.1673255184192;
        Mon, 09 Jan 2023 01:06:24 -0800 (PST)
Message-ID: <ce77619047e452bd7950bdc4e3c772f98464bf1f.camel@gmail.com>
Subject: Re: [PATCH v1 4/8] xen/riscv: introduce sbi call to putchar to
 console
From: Oleksii <oleksii.kurochko@gmail.com>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>
Date: Mon, 09 Jan 2023 11:06:22 +0200
In-Reply-To: <420e9747-09ba-b6e4-d3c5-14f0f174c1d7@amd.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
	 <09da5a3184242152af6af060720a007738a55d6e.1673009740.git.oleksii.kurochko@gmail.com>
	 <420e9747-09ba-b6e4-d3c5-14f0f174c1d7@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

Hi Michal,

On Fri, 2023-01-06 at 16:19 +0100, Michal Orzel wrote:
> Hi Oleksii,
>=20
> On 06/01/2023 14:14, Oleksii Kurochko wrote:
> >=20
> >=20
> > The patch introduce sbi_putchar() SBI call which is necessary
> > to implement initial early_printk
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0xen/arch/riscv/include/asm/sbi.h | 34 ++++++++++++++++++++++++
> > =C2=A0xen/arch/riscv/sbi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 44
> > ++++++++++++++++++++++++++++++++
> > =C2=A03 files changed, 79 insertions(+)
> > =C2=A0create mode 100644 xen/arch/riscv/include/asm/sbi.h
> > =C2=A0create mode 100644 xen/arch/riscv/sbi.c
> >=20
> > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> > index 5a67a3f493..60db415654 100644
> > --- a/xen/arch/riscv/Makefile
> > +++ b/xen/arch/riscv/Makefile
> > @@ -1,5 +1,6 @@
> > =C2=A0obj-$(CONFIG_RISCV_64) +=3D riscv64/
> > =C2=A0obj-y +=3D setup.o
> > +obj-y +=3D sbi.o
> >=20
> > =C2=A0$(TARGET): $(TARGET)-syms
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(OBJCOPY) -O binary -S $< $=
@
> > diff --git a/xen/arch/riscv/include/asm/sbi.h
> > b/xen/arch/riscv/include/asm/sbi.h
> > new file mode 100644
> > index 0000000000..34b53f8eaf
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/sbi.h
> > @@ -0,0 +1,34 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-or-later) */
> > +/*
> > + * Copyright (c) 2021 Vates SAS.
> > + *
> > + * Taken from xvisor, modified by Bobby Eshleman
> > (bobby.eshleman@gmail.com).
> > + *
> > + * Taken/modified from Xvisor project with the following
> > copyright:
> > + *
> > + * Copyright (c) 2019 Western Digital Corporation or its
> > affiliates.
> > + */
> > +
> > +#ifndef __CPU_SBI_H__
> > +#define __CPU_SBI_H__
> I wonder where does CPU come from. Shouldn't this be called
> __ASM_RISCV_SBI_H__ ?
>=20
I missed that when get this files from Bobby's patch series.
It makes sense to rename the define.
Thanks.
> > +
> > +#define SBI_EXT_0_1_CONSOLE_PUTCHAR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1
> > +
> > +struct sbiret {
> > +=C2=A0=C2=A0=C2=A0 long error;
> > +=C2=A0=C2=A0=C2=A0 long value;
> > +};
> > +
> > +struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
> > unsigned long arg0,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long arg1, unsigne=
d long arg2,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long arg3, unsigne=
d long arg4,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long arg5);
> The arguments needs to be aligned.
>=20
> > +
> > +/**
> > + * Writes given character to the console device.
> > + *
> > + * @param ch The data to be written to the console.
> > + */
> > +void sbi_console_putchar(int ch);
> > +
> > +#endif // __CPU_SBI_H__
> // should be replaced with /* */
>=20
> > diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
> > new file mode 100644
> > index 0000000000..67cf5dd982
> > --- /dev/null
> > +++ b/xen/arch/riscv/sbi.c
> > @@ -0,0 +1,44 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Taken and modified from the xvisor project with the copyright
> > Copyright (c)
> > + * 2019 Western Digital Corporation or its affiliates and author
> > Anup Patel
> > + * (anup.patel@wdc.com).
> > + *
> > + * Modified by Bobby Eshleman (bobby.eshleman@gmail.com).
> > + *
> > + * Copyright (c) 2019 Western Digital Corporation or its
> > affiliates.
> > + * Copyright (c) 2021 Vates SAS.
> > + */
> > +
> > +#include <xen/errno.h>
> > +#include <asm/sbi.h>
> > +
> > +struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
> > unsigned long arg0,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long arg1, unsigned long arg2,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long arg3, unsigned long arg4,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long arg5)
> The arguments needs to be aligned.
>=20
It looks that I mixed tabs with space or vice versa.
Will double check.
Thanks.
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct sbiret ret;
> Could you please add an empty line here.
>=20
> > +=C2=A0=C2=A0=C2=A0 register unsigned long a0 asm ("a0") =3D arg0;
> > +=C2=A0=C2=A0=C2=A0 register unsigned long a1 asm ("a1") =3D arg1;
> > +=C2=A0=C2=A0=C2=A0 register unsigned long a2 asm ("a2") =3D arg2;
> > +=C2=A0=C2=A0=C2=A0 register unsigned long a3 asm ("a3") =3D arg3;
> > +=C2=A0=C2=A0=C2=A0 register unsigned long a4 asm ("a4") =3D arg4;
> > +=C2=A0=C2=A0=C2=A0 register unsigned long a5 asm ("a5") =3D arg5;
> > +=C2=A0=C2=A0=C2=A0 register unsigned long a6 asm ("a6") =3D fid;
> > +=C2=A0=C2=A0=C2=A0 register unsigned long a7 asm ("a7") =3D ext;
> > +
> > +=C2=A0=C2=A0=C2=A0 asm volatile ("ecall"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : "+r" (a0), "+r" (a1)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6),
> > "r" (a7)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : "memory");
> > +=C2=A0=C2=A0=C2=A0 ret.error =3D a0;
> > +=C2=A0=C2=A0=C2=A0 ret.value =3D a1;
> > +
> > +=C2=A0=C2=A0=C2=A0 return ret;
> > +}
> > +
> > +void sbi_console_putchar(int ch)
> > +{
> > +=C2=A0=C2=A0=C2=A0 sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch, 0, 0,=
 0, 0, 0);
> > +}
> > --
> > 2.38.1
> >=20
> >=20
>=20
> ~Michal
~Oleksii

