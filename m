Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC50B6A84AF
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 15:55:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504988.777483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkKv-0008JH-Nk; Thu, 02 Mar 2023 14:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504988.777483; Thu, 02 Mar 2023 14:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkKv-0008II-Jw; Thu, 02 Mar 2023 14:55:13 +0000
Received: by outflank-mailman (input) for mailman id 504988;
 Thu, 02 Mar 2023 14:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rfr=62=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXkKu-0008HR-Lj
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 14:55:12 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3acb4e16-b90a-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 15:55:10 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id i9so22471888lfc.6
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 06:55:10 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 m4-20020a195204000000b004d023090504sm2143283lfb.84.2023.03.02.06.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 06:55:09 -0800 (PST)
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
X-Inumbo-ID: 3acb4e16-b90a-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677768910;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LaPa202ZbYeI1r6tXlRRzL0J9HxRdYo4iVkR3jD4HjA=;
        b=T+IAnSmtyL+OkhtJ1OgpcNSN8xXpeprWcXUGakJfLvEa/iXpYgrUC1/RgixtZtlANu
         phBsns+WBrCqS6XIrIfzRq6azdSvRLVMjkWZKoujwDxBd5ZIoNJBRknc4ZPqpSzYRfKM
         0w26Xd8rDifH58D1nIFBa058LEF0P69pjol01fJBeyCaDvjB+XY3kv27gLWZePvzP5P1
         nnJLc1p3Vq55MWwchoPDUUMtoczinXsMcc246F2fabR3UNq2Z+zRtmxntiCXk8Njg5UK
         7UFtzeoXhz4tQpvIFykbFndqAIrdDmQNluQB5+ldmBvj5Negz6o70NdPhgKEoC90S4/p
         UGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677768910;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LaPa202ZbYeI1r6tXlRRzL0J9HxRdYo4iVkR3jD4HjA=;
        b=a6DN2TmEb0E9vGl1h2cBy0XGlNwPrmpNQxPGCG+yOdRbwcHwe7g13VhFzsq9Q01iPP
         hQ/sFbSoa+rMXg8YfSMT2i9g8CGJiBYnwBXtYZE0u80FhWJLNMwJFziXBQN43VKL6WRI
         OcgZ4qSen5vBAD8z31m9U2ARW9WBm1LPhXQERpOJCc6d3GU7uruKmI+DJm6jCC0Xg+jc
         /FwjGMa+J0Gx451ZXe0vFILGRaPeKm8LBC3TgWg02DEOcmmh8n4TEJCk8HuM4FY+Xtfr
         BYncsgRiUCInHGwco8MdVy3KpPwaeIeG2YZrhVPrzKK/Url0inyKLoFAYXOmibx5RGmB
         4nxg==
X-Gm-Message-State: AO0yUKU7LslUulEYULH7lUTSmzecdXOpHeVD7MPu0WppLwOOA9dVMNb1
	J2j9HGmsmlFpIKSe/sndYhk=
X-Google-Smtp-Source: AK7set8qSxU5P0J9z16Ui8IVYEfIILkxvbd02qCp6OcGvQ7qUbcIv90OT3+/npy/vvC4Ad6HTsiBVA==
X-Received: by 2002:a19:5213:0:b0:4d5:a689:e965 with SMTP id m19-20020a195213000000b004d5a689e965mr2789439lfb.51.1677768910277;
        Thu, 02 Mar 2023 06:55:10 -0800 (PST)
Message-ID: <2f64e60244a0c549f20782e5f57c3ff3c558736d.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] xen/riscv: initialize .bss section
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Thu, 02 Mar 2023 16:55:08 +0200
In-Reply-To: <092579ae-edcc-f04b-b9ab-fc97b78d0053@citrix.com>
References: <cover.1677762812.git.oleksii.kurochko@gmail.com>
	 <495bd1d7fc2becdd48bd00253c079971e2231e99.1677762812.git.oleksii.kurochko@gmail.com>
	 <092579ae-edcc-f04b-b9ab-fc97b78d0053@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-03-02 at 14:12 +0000, Andrew Cooper wrote:
> On 02/03/2023 1:23 pm, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes since v1:
> > =C2=A0* initialization of .bss was moved to head.S
> > ---
> > =C2=A0xen/arch/riscv/include/asm/asm.h | 4 ++++
> > =C2=A0xen/arch/riscv/riscv64/head.S=C2=A0=C2=A0=C2=A0 | 9 +++++++++
> > =C2=A02 files changed, 13 insertions(+)
> >=20
> > diff --git a/xen/arch/riscv/include/asm/asm.h
> > b/xen/arch/riscv/include/asm/asm.h
> > index 6d426ecea7..5208529cb4 100644
> > --- a/xen/arch/riscv/include/asm/asm.h
> > +++ b/xen/arch/riscv/include/asm/asm.h
> > @@ -26,14 +26,18 @@
> > =C2=A0#if __SIZEOF_POINTER__ =3D=3D 8
> > =C2=A0#ifdef __ASSEMBLY__
> > =C2=A0#define RISCV_PTR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dword
> > +#define RISCV_SZPTR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A08
> > =C2=A0#else
> > =C2=A0#define RISCV_PTR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0".dword"
> > +#define RISCV_SZPTR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A08
> > =C2=A0#endif
> > =C2=A0#elif __SIZEOF_POINTER__ =3D=3D 4
> > =C2=A0#ifdef __ASSEMBLY__
> > =C2=A0#define RISCV_PTR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.word
> > +#define RISCV_SZPTR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A04
> > =C2=A0#else
> > =C2=A0#define RISCV_PTR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0".word"
> > +#define RISCV_SZPTR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A04
>=20
> This an extremely verbose way of saying that __SIZEOF_POINTER__ is
> the
> right value to use...
>=20
> Just drop the change here.=C2=A0 The code is better without this
> indirection.
>=20
> > =C2=A0#endif
> > =C2=A0#else
> > =C2=A0#error "Unexpected __SIZEOF_POINTER__"
> > diff --git a/xen/arch/riscv/riscv64/head.S
> > b/xen/arch/riscv/riscv64/head.S
> > index 851b4691a5..b139976b7a 100644
> > --- a/xen/arch/riscv/riscv64/head.S
> > +++ b/xen/arch/riscv/riscv64/head.S
> > @@ -13,6 +13,15 @@ ENTRY(start)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lla=C2=A0=C2=A0=C2=A0=
=C2=A0 a6, _dtb_base
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 a1, =
(a6)
> > =C2=A0
>=20
> /* Clear the BSS */
>=20
> The comments (even just oneliners) will become increasingly useful as
> the logic here grows.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 a3, __bss_start
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 a4, __bss_end
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ble=C2=A0=C2=A0=C2=A0=C2=A0=
 a4, a3, clear_bss_done
> > +clear_bss:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 zero, (a3=
)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=C2=A0=
 a3, a3, RISCV_SZPTR
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 blt=C2=A0=C2=A0=C2=A0=C2=A0=
 a3, a4, clear_bss
> > +clear_bss_done:
>=20
> You should use t's here, not a's.=C2=A0 What we are doing here is
> temporary
> and not constructing arguments to a function.=C2=A0 Furthermore we want t=
o
> preserve the a's where possible to avoid spilling the parameters.
>=20
> Finally, the symbols should have an .L_ prefix to make the local
> symbols.
>=20
> It really doesn't matter now, but will when you're retrofitting elf
> metadata to asm code to make livepatching work.=C2=A0 (I'm doing this on
> x86
> and it would have been easier if people had written the code nicely
> the
> first time around.)
Thanks. I'll update the code.
>=20
> ~Andrew


