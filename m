Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF78682C96
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 13:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487612.755284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMpmR-0005n4-3v; Tue, 31 Jan 2023 12:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487612.755284; Tue, 31 Jan 2023 12:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMpmR-0005l9-15; Tue, 31 Jan 2023 12:30:31 +0000
Received: by outflank-mailman (input) for mailman id 487612;
 Tue, 31 Jan 2023 12:30:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0fq0=54=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pMpmO-0005l3-SA
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 12:30:28 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b16727f-a163-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 13:30:27 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id ud5so41136989ejc.4
 for <xen-devel@lists.xenproject.org>; Tue, 31 Jan 2023 04:30:27 -0800 (PST)
Received: from pc-879.home (83.29.147.144.ipv4.supernova.orange.pl.
 [83.29.147.144]) by smtp.gmail.com with ESMTPSA id
 l3-20020a056402230300b0049f29a7c0d6sm8328170eda.34.2023.01.31.04.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 04:30:27 -0800 (PST)
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
X-Inumbo-ID: 0b16727f-a163-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pCmLGAI5vdHBS0eYH6qCqi6roe/ilfkfoE+bpcz9Jog=;
        b=fFVQI4lrSpdvK270rKm/WdXqSIbMcxBu1UYdrvsbnL85EKJ1Gyqersvi8rbTFOu9ML
         AV8Ivb/KYIyM42OmZnei5Vp4a+d/aEtZGS0olnpDIo54YAPQLDZnSCdMSQvUE5PfyYWG
         vFZk6xOHMi5NK0p9GvF3eNa9y8aRzr57zwIdO7LuZR0GvDKHW/D67bNTjuxLji1F9bz6
         yvr22NsU4qK54YOQw25hXn/VwUQ7Gx/4xBN3nMXa30o7dKyCm/sLZ+HeS3gLKYOxbeRE
         1VdDSSlO4o7ocAAbsmYIld41j55AmUI7Mx8BKDCdQfuw5Ctar6KKUDeQE4Or0ulqKKcC
         RP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pCmLGAI5vdHBS0eYH6qCqi6roe/ilfkfoE+bpcz9Jog=;
        b=UZZTkGMSRU91lm30f4vvxc6h97oa+xTbzOI37mzE8yRI7UMXa3jSnWXRowj85jffkJ
         GsEHaecsJUVeT4FQdSwSSLjNqtcX6Z6fRU5G4nRy+Vj3g8JzD4fm4h+0rFbai+fgQf+v
         r5wwrs6a5w4lE54PRDz7ssUbJ7Q/do4zwjzWy34s6fbng4I4LHDL1E+jOJXY0A7GWvCD
         A4fq3rIkpwPUAtD92XP8WjnNPYs57JikCF+DTX93HXG1MTzKJdCxcS/Anb9BL13A0Mau
         QmtzL4LVI6J0DEcJ8v8jvYRa/Kqi5D5qQcgSmEtNkfxarsCwYqcuJ+2bHmw1eS+I7Vqq
         UpGA==
X-Gm-Message-State: AO0yUKWUpxbdGsLt+wQ/KIgxSsoa/ueYtd4HGd0U+fV7mRtmZiLnukTm
	0rlskiXLZQE0VSaeVQego6U=
X-Google-Smtp-Source: AK7set+V/QAdvwc377Dd9bPYcjGsDrMH/7bjzENkzEIziofx99wtg+61HlS/+oAlUhGP0gdhSeigIg==
X-Received: by 2002:a17:907:97d3:b0:889:33ca:70c6 with SMTP id js19-20020a17090797d300b0088933ca70c6mr7928894ejc.2.1675168227442;
        Tue, 31 Jan 2023 04:30:27 -0800 (PST)
Message-ID: <1bb7d9d3580311888aa97c8ad50aa93c09c46fce.camel@gmail.com>
Subject: Re: [PATCH v1 01/14] xen/riscv: add _zicsr to CFLAGS
From: Oleksii <oleksii.kurochko@gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>,  Gianluca Guida
 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Tue, 31 Jan 2023 14:30:26 +0200
In-Reply-To: <CAKmqyKOecoz91e-4-KZUdgT5HNhuwuN83tpFR+HmwkUPb2r3ew@mail.gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
	 <3617dc882193166580ae7e5d122447e924cab524.1674226563.git.oleksii.kurochko@gmail.com>
	 <d5d9a305-3501-cbc4-1c8a-1a62bd08d588@citrix.com>
	 <d3e2c18e443439d18f8ece31c9419e30a19be8c5.camel@gmail.com>
	 <CAKmqyKOecoz91e-4-KZUdgT5HNhuwuN83tpFR+HmwkUPb2r3ew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-01-31 at 21:49 +1000, Alistair Francis wrote:
> On Mon, Jan 23, 2023 at 8:43 PM Oleksii <oleksii.kurochko@gmail.com>
> wrote:
> >=20
> > On Fri, 2023-01-20 at 15:29 +0000, Andrew Cooper wrote:
> > > On 20/01/2023 2:59 pm, Oleksii Kurochko wrote:
> > > > Work with some registers requires csr command which is part of
> > > > Zicsr.
> > > >=20
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > =C2=A0xen/arch/riscv/arch.mk | 2 +-
> > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> > > > index 012dc677c3..95b41d9f3e 100644
> > > > --- a/xen/arch/riscv/arch.mk
> > > > +++ b/xen/arch/riscv/arch.mk
> > > > @@ -10,7 +10,7 @@ riscv-march-$(CONFIG_RISCV_ISA_C)=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 :=3D
> > > > $(riscv-march-y)c
> > > > =C2=A0# into the upper half _or_ the lower half of the address
> > > > space.
> > > > =C2=A0# -mcmodel=3Dmedlow would force Xen into the lower half.
> > > >=20
> > > > -CFLAGS +=3D -march=3D$(riscv-march-y) -mstrict-align -
> > > > mcmodel=3Dmedany
> > > > +CFLAGS +=3D -march=3D$(riscv-march-y)_zicsr -mstrict-align -
> > > > mcmodel=3Dmedany
> > >=20
> > > Should we just go straight for G, rather than bumping it along
> > > every
> > > time we make a tweak?
> > >=20
> > I didn't go straight for G as it represents the =E2=80=9CIMAFDZicsr
> > Zifencei=E2=80=9D
> > base and extensions thereby it will be needed to add support for
> > FPU
> > (at least it requires {save,restore}_fp_state) but I am not sure
> > that
> > we need it in general.
>=20
> That seems fair enough. I don't see a reason to restrict ourselves if
> we aren't using something. Although we probably will hit a
> requirement
> on G at some point anyway.
>=20
Thanks for your notes so I will change it to G.

> Alistair
>=20
> >=20
> > Another one reason is that Linux kernel introduces _zicsr
> > extenstion
> > separately (but I am not sure that it can be considered as a
> > serious
> > argument):
> > https://elixir.bootlin.com/linux/latest/source/arch/riscv/Makefile#L58
> > https://lore.kernel.org/all/20221024113000.891820486@linuxfoundation.or=
g/
> >=20
> > > ~Andrew
> > ~Oleksii
> >=20
> >=20


