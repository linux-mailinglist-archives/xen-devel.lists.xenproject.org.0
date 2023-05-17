Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD3706D73
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 17:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535969.834063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzJWB-00056M-O0; Wed, 17 May 2023 15:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535969.834063; Wed, 17 May 2023 15:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzJWB-000539-JT; Wed, 17 May 2023 15:56:47 +0000
Received: by outflank-mailman (input) for mailman id 535969;
 Wed, 17 May 2023 15:56:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAjd=BG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pzJW9-00052x-TB
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 15:56:45 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b77f47f-f4cb-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 17:56:43 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ad89c7a84fso9611931fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 May 2023 08:56:43 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a19a41a000000b004eb018fac57sm3406499lfc.191.2023.05.17.08.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 08:56:42 -0700 (PDT)
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
X-Inumbo-ID: 6b77f47f-f4cb-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684339003; x=1686931003;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yrXiaGV5bMoTvPTJVgpLRTHo1+SVMXCCTl8SFepVr6M=;
        b=FLaEdSNgpcIhsGuOwWgGedh1nc//l8SQal6Yay2U368yHRWyVbs4/ts3Wq07GbUOXe
         OztW+K7SmXc5++SbwkEX/yifkhPp33VsuEY3oqRJP5b1he/9nLEFcX3epy6BnN0HeDMO
         51wgv4YcG98PW2+FTILZsaIZN7xCsZ5qqAfk9LMRtWtjY2dxS6g0rGepAotXzakcOfn6
         RdhwLQFzozxHbWjhEWcmc2Tbt/uqd9W1RxpNnvQHZTPSKgP3BtqTtNvd8Y39bqSEfLaL
         1K4vWtwV1Lv5AWaF+6BMfvS9DAZMILE5GkYRhJvzaKvpplp0nmLCwYyqYnyGBnCVFy1E
         gwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684339003; x=1686931003;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrXiaGV5bMoTvPTJVgpLRTHo1+SVMXCCTl8SFepVr6M=;
        b=G8Zruvjp/RI2xzUfZ1EpZuAdhUM66yzkp0uFfmEyIDpdjWr+QSbnrop05qpq72VlMs
         HT169g5WSB9xT2sXIhfiS1orwHN62E6H395N+Dvkl8odwlXJ+hqYuS4gMABhSq7v1kHT
         UsC8shvnTX/2fcMjnSiLcLExrm1f0iOqylD2I7sdWFHupplYw3VcvkEWmPvXv7LqEMwN
         m6qMFUZi1D58ehl8ghy34hcmppZRmrcEENROjHL+ZdjfhSxRcwOUPab0duMBjSqHLSeQ
         D954FgUShLyW8M6jZnRnezx/Jo2Wshnd3xF64XAiI+A+yNEJ+XzXaxovHspWz4AzUVb4
         u7pg==
X-Gm-Message-State: AC+VfDxgmqDjEYOFjPvpl4DfsHJqQv3pQU3/zavFEG+D8WgddhEiEaJy
	9xjHFuLFXbTD3m91k109LMg=
X-Google-Smtp-Source: ACHHUZ4jOJt012HmLvZ1XfmUeqBxM2DLoU/u/sI42TxpSPdM4va+BfCdw1IqCLeQkmZeYcWJk8su+w==
X-Received: by 2002:ac2:44a8:0:b0:4f2:5e21:2e2a with SMTP id c8-20020ac244a8000000b004f25e212e2amr341624lfm.9.1684339002912;
        Wed, 17 May 2023 08:56:42 -0700 (PDT)
Message-ID: <eef94bf6e8b67a98ad175125e221c75aeb4ba013.camel@gmail.com>
Subject: Re: [PATCH v7 1/5] xen/riscv: add VM space layout
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 17 May 2023 18:56:41 +0300
In-Reply-To: <d1529686-ce06-a707-de9e-a4b28c9f2e02@suse.com>
References: <cover.1683824347.git.oleksii.kurochko@gmail.com>
	 <7b03dbf21718ed9c05859a629f4442167d74553c.1683824347.git.oleksii.kurochko@gmail.com>
	 <d1529686-ce06-a707-de9e-a4b28c9f2e02@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-05-16 at 17:42 +0200, Jan Beulich wrote:
> On 11.05.2023 19:09, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -4,6 +4,42 @@
> > =C2=A0#include <xen/const.h>
> > =C2=A0#include <xen/page-size.h>
> > =C2=A0
> > +/*
> > + * RISC-V64 Layout:
> > + *
> > + * #ifdef SV39
>=20
> I did point you at x86'es similar #ifdef. Unlike here, there we use a
> symbol which actually has a meaning, allowing to spot this comment in
> e.g. grep output when looking for uses of that symbol. Hence here
> e.g.
>=20
> #ifdef RV_STAGE1_MODE =3D=3D SATP_MODE_SV39
>=20
> ? (I would also recommend to use the same style as x86 does, such
> that
> the #ifdef and #endif look like normal directives [e.g. again in grep
> output], leaving aside that they're inside a comment.)
It would be better. Thanks.
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
> > + * 0000003200000000 |=C2=A0 0000007f40000000 | 309 GB | L2 200-509 |
> > Direct map
>=20
> The upper bound here is 0000007f80000000 afaict,=C2=A0
It should be 0000007f80000000. 0000007f40000000 is start address of 509
slot.

> which then also makes
> the earlier gap 1Gb in size.
do you mean that it is better to write start and end address (
0000007f80000000 - 7FC0000000 ) of L2 510 slot explicitly?

~ Oleksii

