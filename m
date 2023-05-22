Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8682F70C0F7
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 16:25:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537981.837678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16Su-0007hp-Vt; Mon, 22 May 2023 14:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537981.837678; Mon, 22 May 2023 14:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16Su-0007fD-Si; Mon, 22 May 2023 14:24:48 +0000
Received: by outflank-mailman (input) for mailman id 537981;
 Mon, 22 May 2023 14:24:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ae2Q=BL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q16St-0007c2-KY
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 14:24:47 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6710a44c-f8ac-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 16:24:46 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2af1822b710so55133761fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 May 2023 07:24:46 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w4-20020ac25984000000b004f379affcb3sm1004023lfn.61.2023.05.22.07.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 07:24:45 -0700 (PDT)
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
X-Inumbo-ID: 6710a44c-f8ac-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684765486; x=1687357486;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zcpO8eW1Mk6fAPCsU4piHEsYJz56kctFY4VPQ5xr6ZA=;
        b=C1XQb5fiHax/Bubm7iAmFXdchkz4wpQQ69seIz/7zOUq/ESR5ytZHqkt6CCd2pb8nv
         pGN827SrrGQCR4FpvOCjT9kAFRMNM99Rcl5fbahu76RMZrqSwQff89smbiKKMPn2kYwg
         WW8350oquliZXmjVIj6FPFCagqqAP49h3l32O2zZI98wIDPtCA/WoXhXoeBadWQMPpLZ
         xUYDGfqQbewuv2UvXdYmn6NJQrB2ZXB3I/souDrKFBUtZ4gmD+NRnRAtesA4Vy/vGOjB
         9N3X8Mhi2fxZl/SE0a1T1S8JpQDUzAON4EcLRhj/G7dDXB7DMJ3L8uIPPv+xjmEjiQQ/
         auKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684765486; x=1687357486;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zcpO8eW1Mk6fAPCsU4piHEsYJz56kctFY4VPQ5xr6ZA=;
        b=OUKicVVEXwXixFy7bcKlo8+JHwkgqWSoVlWcE19syfRt4V3wCUXa//N6vFX46kyBx/
         3p2PcXKAfl/02iFODvpA0H6OebqzyhyT978Hu+iEsaTK2W4REVIe4YBJ37V5FhYmhwbf
         9+RwL1zLdMohvfLGdI5xftqH1juMR/fYIS0dKTMB+zr0q1ThIXmRvGOJX1YjOZ0VylgB
         +yX4U8MaCzp1ha+rtVERtxG8nZVmVyccBTvx9gDQqq01vxt1AAi+4RFzXSMEfiHpX6vp
         G9zHLVR70hUD+1hO97KWK+H0OR8rzqIrTMIItsfKTpnrKhbOQ8epYNwezitVjZ7E5GFb
         5c4Q==
X-Gm-Message-State: AC+VfDw7Nd73O10V3MWT/NHg9e2DWpgO7BwmvJXikI5+8GQmoga3sJE5
	ylUnKzym6CSHirbfcyt++ew=
X-Google-Smtp-Source: ACHHUZ7UAzPRP0MomOAUTQ3GDJEqmKzvWTZ5Lb+cO+KtV4Ue89XvWCyZsU02WmtoahfUIIuewgW1ug==
X-Received: by 2002:a2e:8615:0:b0:2ad:b01b:d458 with SMTP id a21-20020a2e8615000000b002adb01bd458mr3893325lji.30.1684765485873;
        Mon, 22 May 2023 07:24:45 -0700 (PDT)
Message-ID: <d87557e4a82419fc881182a03f39bb13cacf1384.camel@gmail.com>
Subject: Re: [PATCH v8 1/5] xen/riscv: add VM space layout
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
 xen-devel@lists.xenproject.org
Date: Mon, 22 May 2023 17:24:45 +0300
In-Reply-To: <13494185-96c5-24ff-7ae6-a57d706420f2@suse.com>
References: <cover.1684757267.git.oleksii.kurochko@gmail.com>
	 <bbdfbf59db6d329d65956839c79e6e42bbf13bb7.1684757267.git.oleksii.kurochko@gmail.com>
	 <13494185-96c5-24ff-7ae6-a57d706420f2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-05-22 at 14:47 +0200, Jan Beulich wrote:
> On 22.05.2023 14:18, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -4,6 +4,42 @@
> > =C2=A0#include <xen/const.h>
> > =C2=A0#include <xen/page-size.h>
> > =C2=A0
> > +/*
> > + * RISC-V64 Layout:
> > + *
> > + * #ifdef RV_STAGE1_MODE =3D=3D SATP_MODE_SV39
>=20
> Nit: #if please, not #ifdef. Also may I stress again that ideally
> this
> would be formatted such that when e.g. grep-ing for SATP_MODE_SV39,
> the
> matching line here would _not_ give the impression of being "a
> comment
> only" (making people possibly pay less attention)? My referral to the
> x86 way of doing things remains.
Oh, I double checked the x86's config.h and understood ( my editor's
colour scheme draw it as a comment so I missed that there is no=C2=A0'*' at
the start if "#ifndef CONFIG_BIGMEM" line ) what you mean:
  '*' should be removed at the start of "#ifdef RV..." line.
>=20
> > + * From the riscv-privileged doc:
> > + *=C2=A0=C2=A0 When mapping between narrower and wider addresses,
> > + *=C2=A0=C2=A0 RISC-V zero-extends a narrower physical address to a wi=
der
> > size.
> > + *=C2=A0=C2=A0 The mapping between 64-bit virtual addresses and the 39=
-bit
> > usable
> > + *=C2=A0=C2=A0 address space of Sv39 is not based on zero-extension bu=
t
> > instead
> > + *=C2=A0=C2=A0 follows an entrenched convention that allows an OS to u=
se one
> > or
> > + *=C2=A0=C2=A0 a few of the most-significant bits of a full-size (64-b=
it)
> > virtual
> > + *=C2=A0=C2=A0 address to quickly distinguish user and supervisor addr=
ess
> > regions.
> > + *
> > + * It means that:
> > + *=C2=A0=C2=A0 top VA bits are simply ignored for the purpose of trans=
lating
> > to PA.
> > + *
> > + *
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > + *=C2=A0=C2=A0=C2=A0 Start addr=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 End ad=
dr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 Size=C2=A0 | Slot=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > |area description
> > + *
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > + * FFFFFFFFC0800000 |=C2=A0 FFFFFFFFFFFFFFFF |1016 MB | L2 511=C2=A0=
=C2=A0=C2=A0=C2=A0 |
> > Unused
> > + * FFFFFFFFC0600000 |=C2=A0 FFFFFFFFC0800000 |=C2=A0 2 MB=C2=A0 | L2 5=
11=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Fixmap
> > + * FFFFFFFFC0200000 |=C2=A0 FFFFFFFFC0600000 |=C2=A0 4 MB=C2=A0 | L2 5=
11=C2=A0=C2=A0=C2=A0=C2=A0 |
> > FDT
> > + * FFFFFFFFC0000000 |=C2=A0 FFFFFFFFC0200000 |=C2=A0 2 MB=C2=A0 | L2 5=
11=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Xen
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 G=
B=C2=A0 | L2 510=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Unused
> > + * 0000003200000000 |=C2=A0 0000007f80000000 | 309 GB | L2 200-509 |
> > Direct map
>=20
> And another, yet more minor nit: Would be nice if all addresses here
> were spelled uniformly, i.e. also with upper vs lower case of hex
> digit letter consistent.
Sure. I will make all upper case. Thanks.
>=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 G=
B=C2=A0 | L2 199=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Unused
> > + * 0000003100000000 |=C2=A0 00000031C0000000 |=C2=A0 3 GB=C2=A0 | L2 1=
96-198 |
> > Frametable
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 G=
B=C2=A0 | L2 195=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Unused
> > + * 0000003080000000 |=C2=A0 00000030C0000000 |=C2=A0 1 GB=C2=A0 | L2 1=
94=C2=A0=C2=A0=C2=A0=C2=A0 |
> > VMAP
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 194 GB | =
L2 0 - 193 |
> > Unused
> > + *
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > + *
> > + * #endif
> > + */
> > +
> > =C2=A0#if defined(CONFIG_RISCV_64)
> > =C2=A0# define LONG_BYTEORDER 3
> > =C2=A0# define ELFSIZE 64
>=20

~ Oleksii

