Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31AB662108
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 10:10:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473429.734028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEoAW-0005Mg-Po; Mon, 09 Jan 2023 09:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473429.734028; Mon, 09 Jan 2023 09:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEoAW-0005JG-Mr; Mon, 09 Jan 2023 09:10:12 +0000
Received: by outflank-mailman (input) for mailman id 473429;
 Mon, 09 Jan 2023 09:10:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEoAV-0005J8-FG
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 09:10:11 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a6727c9-8ffd-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 10:10:09 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id cf42so11974699lfb.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 01:10:09 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 i7-20020ac25227000000b004ac6a444b26sm1514062lfl.141.2023.01.09.01.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 01:10:08 -0800 (PST)
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
X-Inumbo-ID: 6a6727c9-8ffd-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ESdRJf7ipG0u+2VSciQ+mY4GL0Sloy+alwrd7Z0FJHQ=;
        b=caekt8SUz767Ip7U2HWOV+cA9HA8AlxKV6Y4vgom8TF4riKxo+KpDzTSEUzmNe596D
         DIqAak1XhGCuLAO2RLnEgrrOG/ZPhHXbiIg0+3OequXDPxMVsb699Qmqy+z2tUWGtxuq
         GpkN9JfbrobXUcXZyv28GvTVyHpuVOfzdgGsxwVm4d6DkSTdzqgivTYMBAQE+fbz6hgY
         WGh8Cqd7TYeBbnTFTxCvJChIeKJcDrYas2gNhxYxAxu/0epTHKzPu/rSC+uigo0xdKHz
         E6m3z+sgqhsL+FRusBfxrtb3GPp+N+b35SF1ELHK/CcmsSxTCnIt+jg0xIlEbna5qDnm
         Afyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ESdRJf7ipG0u+2VSciQ+mY4GL0Sloy+alwrd7Z0FJHQ=;
        b=zvhq4kTZfby0Ny6V3JwaKeBog7Nr4FM0R7UmyeYPnukKeAuXYkJGS9+IrKkPpgJIeO
         fyzk6Yjj/UMD104nC1125ywrERBbevtQuF+yH+soN04qm6rTKk65TNgWLiJhVPnzFVx8
         1FaUg+9apb0PNvXuGuIlMQZd46cJZlbjBj39RnM2e5ya06jsz0HD5iy3G61pIXYRH3uy
         7StIHV9NeCY3tzy5zS7yKre0on3Dje466wXx3LB1e+VZl62AYx8G1qOHcKhjkqNId4Cg
         izX3E8cLeGOVrsvitPDPJ7UJMlHMU0ZiwHsLiCNmfwGUqL/GK1ChJ3EIkhB/CLlB00sV
         ZEaQ==
X-Gm-Message-State: AFqh2kqrlmGSRN28PwctwZP1g4jUBFcVdn0ZE0WeKoFva8wRWkDaDXem
	4p3lEZbRhP+ZWrB7aoCdzx0=
X-Google-Smtp-Source: AMrXdXsrX12RVMgm7xzFs7RLSnMQdkqbrqYByDYOSg8cvE8JP2MqZEmQYYRjVlmj8Q8zvtYSzgqFQg==
X-Received: by 2002:a05:6512:2356:b0:4cb:4416:1e7d with SMTP id p22-20020a056512235600b004cb44161e7dmr8781564lfu.48.1673255409001;
        Mon, 09 Jan 2023 01:10:09 -0800 (PST)
Message-ID: <c197037c48921c3bbfd797172829ffa5d01609c2.camel@gmail.com>
Subject: Re: [PATCH v1 6/8] xen/riscv: introduce early_printk basic stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>
Date: Mon, 09 Jan 2023 11:10:07 +0200
In-Reply-To: <e7e66208-5a4f-f37a-6368-29489e93aad9@xen.org>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
	 <3f30a60729b45ee01adc2d4c0eec5a89bb083abd.1673009740.git.oleksii.kurochko@gmail.com>
	 <e7e66208-5a4f-f37a-6368-29489e93aad9@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

Hi,

On Fri, 2023-01-06 at 13:51 +0000, Julien Grall wrote:
> Hi,
>=20
> On 06/01/2023 13:14, Oleksii Kurochko wrote:
> > The patch introduces a basic stuff of early_printk functionality
> > which will be enough to print 'hello from C environment"
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0 xen/arch/riscv/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++++++
> > =C2=A0 xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> > =C2=A0 xen/arch/riscv/early_printk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 27
> > +++++++++++++++++++++++
> > =C2=A0 xen/arch/riscv/include/asm/early_printk.h | 12 ++++++++++
> > =C2=A0 4 files changed, 47 insertions(+)
> > =C2=A0 create mode 100644 xen/arch/riscv/early_printk.c
> > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/early_printk.h
> >=20
> > diff --git a/xen/arch/riscv/Kconfig.debug
> > b/xen/arch/riscv/Kconfig.debug
> > index e69de29bb2..940630fd62 100644
> > --- a/xen/arch/riscv/Kconfig.debug
> > +++ b/xen/arch/riscv/Kconfig.debug
> > @@ -0,0 +1,7 @@
> > +config EARLY_PRINTK
> > +=C2=A0=C2=A0=C2=A0 bool "Enable early printk config"
> > +=C2=A0=C2=A0=C2=A0 default DEBUG
> > +=C2=A0=C2=A0=C2=A0 depends on RISCV_64
>=20
> OOI, why can't this be used for RISCV_32?
>=20
We can. It's my fault we wanted to start from RISCV_64 support so I
totally forgot about RISCV_32 =3D)
> > +=C2=A0=C2=A0=C2=A0 help
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enables early printk debug messages
> > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> > index 60db415654..e8630fe68d 100644
> > --- a/xen/arch/riscv/Makefile
> > +++ b/xen/arch/riscv/Makefile
> > @@ -1,6 +1,7 @@
> > =C2=A0 obj-$(CONFIG_RISCV_64) +=3D riscv64/
> > =C2=A0 obj-y +=3D setup.o
> > =C2=A0 obj-y +=3D sbi.o
> > +obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
>=20
> Please order the files alphabetically.
>=20
> > =C2=A0=20
> > =C2=A0 $(TARGET): $(TARGET)-syms
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(OBJCOPY) -O binary -S=
 $< $@
> > diff --git a/xen/arch/riscv/early_printk.c
> > b/xen/arch/riscv/early_printk.c
> > new file mode 100644
> > index 0000000000..f357f3220b
> > --- /dev/null
> > +++ b/xen/arch/riscv/early_printk.c
> > @@ -0,0 +1,27 @@
>=20
> Please add an SPDX license (the default for Xen is GPLv2).
>=20
> > +/*
> > + * RISC-V early printk using SBI
> > + *
> > + * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
>=20
> So the copyright here is from Bobby. But I don't see any mention in
> the=20
> commit message. Where is this coming from?
>=20
Could you please share with me an example how it should be look like?
Signed-off: ... ? Or "this file was taken from patch series ..."?
> > + */
> > +#include <asm/sbi.h>
> > +#include <asm/early_printk.h>
>=20
> Please order the files alphabetically.
>=20
> > +
> > +void early_puts(const char *s, size_t nr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 while ( nr-- > 0 )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*s =3D=3D '\n')
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sbi=
_console_putchar('\r');
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sbi_console_putchar(*s);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s++;
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +void early_printk(const char *str)
> > +{
> > +=C2=A0=C2=A0=C2=A0 while (*str)
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_puts(str, 1);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 str++;
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > diff --git a/xen/arch/riscv/include/asm/early_printk.h
> > b/xen/arch/riscv/include/asm/early_printk.h
> > new file mode 100644
> > index 0000000000..05106e160d
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/early_printk.h
> > @@ -0,0 +1,12 @@
> > +#ifndef __EARLY_PRINTK_H__
> > +#define __EARLY_PRINTK_H__
> > +
> > +#include <xen/early_printk.h>
> > +
> > +#ifdef CONFIG_EARLY_PRINTK
> > +void early_printk(const char *str);
> > +#else
> > +static inline void early_printk(const char *s) {};
> > +#endif
> > +
> > +#endif /* __EARLY_PRINTK_H__ */
>=20


