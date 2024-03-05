Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1AF8725C5
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 18:35:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688877.1073591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhYgq-0004Vu-3P; Tue, 05 Mar 2024 17:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688877.1073591; Tue, 05 Mar 2024 17:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhYgp-0004TK-W2; Tue, 05 Mar 2024 17:34:55 +0000
Received: by outflank-mailman (input) for mailman id 688877;
 Tue, 05 Mar 2024 17:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4c3Q=KL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rhYgo-0004TE-PS
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 17:34:54 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac889ac3-db16-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 18:34:52 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so11672044a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 09:34:52 -0800 (PST)
Received: from [172.20.10.2] (public-gprs207207.centertel.pl. [46.134.148.168])
 by smtp.gmail.com with ESMTPSA id
 lx25-20020a170906af1900b00a45a73caa00sm943841ejb.43.2024.03.05.09.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 09:34:51 -0800 (PST)
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
X-Inumbo-ID: ac889ac3-db16-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709660092; x=1710264892; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HLosnp2LjVLREBlCJNw5iVKzbG6ssOMWLMLkl+Dfa8E=;
        b=MIQyiwh9yVjyEisj8g/d9aGjiHJDWVkH4Xxh1jLIC/sMXyzX1MNGhgeGX3fd4hRIWQ
         813eWovZYOWM1qGz7vxaAZmqetpbiaVQk4AjdO5hcxFcN1lMHlkvtr3snEvxTKjOmiTZ
         h6E/yBx/Jlam+mp5kzeu1U4S3H8yu5k0VfBK4CSaTjZTuKUFjXvoo0S2/tBz0I2RG5bK
         F/ZLJJcYSZFKlQGEijduG0rfsFmGK7c0xumAYq6c2MGkY0hzONAXO5hDFcX2zIgl/DJj
         aFrqorhumCRFNVzd1uDjEmSptvhJtk9QQfe0HKjR9drp/Zn4Dxj17d6N8B97hB38oCri
         NhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709660092; x=1710264892;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HLosnp2LjVLREBlCJNw5iVKzbG6ssOMWLMLkl+Dfa8E=;
        b=WAKCS8XR3nYVfexgns9BfZUAgCKXnRp0dmRpe16i5x4PY5hFrqL5fnz415aGv3U22m
         ecK96qJIXpcO5Tdo/5qp2VorNxvkOCBMfTLO5YT82Pb1P+G7EaZcwCUJS41btFqj3f5r
         FdjqfaHcC7e5zbzeP7tkHck5gFUeOKRGM0+MwlLTVGLHwDoCZRP/DaPCQeUTVJtu1wiO
         mas6RDj//yxGPG1N1FJfKvHGQcqynwD27CJ/pIw8J38Tc13w8w23r84nUn7AYr0z5zzB
         rA1RRvbpxNUUok6MRXxQcLPxVydt///mkuwNNorEsDVhk2YgvYrPbppEWV2cg/W0wOju
         zRYA==
X-Forwarded-Encrypted: i=1; AJvYcCV/Sx3qoGdBHVZR6KoBiav4cM/GDhUKoYrNJOMQznAp+UgeunM8Ri4cMdq+Oumnp3J2vYVOo6MW8JRPtcRj3Gg/4nT61SEinHVKzg6owes=
X-Gm-Message-State: AOJu0YwQne/T7iL1tqORQ4xfBmn+BngReHTeHBL6uFp1yJJZGBZvLRSM
	GReaAVKK1/0jHZZIPkS1Q44bzUWiUbrmQMNSTvE1b+2kgXmuJShV
X-Google-Smtp-Source: AGHT+IFZqMoUCVE4SOi3MgnmLmNQvKP+K0JhwyYqGFXo7Y4R4d+UEn2aXMTSoz+DWXcrBSCcsIjx4g==
X-Received: by 2002:a17:906:e4c:b0:a44:b96:2811 with SMTP id q12-20020a1709060e4c00b00a440b962811mr3518384eji.29.1709660092038;
        Tue, 05 Mar 2024 09:34:52 -0800 (PST)
Message-ID: <35595505b2733f7200a62177338cc3ba98f6afaa.camel@gmail.com>
Subject: Re: [PATCH v5 18/23] xen/riscv: add minimal stuff to processor.h to
 build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Alistair Francis
 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 05 Mar 2024 18:34:50 +0100
In-Reply-To: <bd916469-f764-4d2e-bce6-52e3ed5e74d1@suse.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <4e1ee99a9ad71015b5e8860d20b63337b526d0e9.1708962629.git.oleksii.kurochko@gmail.com>
	 <bd916469-f764-4d2e-bce6-52e3ed5e74d1@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-03-05 at 09:05 +0100, Jan Beulich wrote:
> On 26.02.2024 18:39, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/docs/misc/riscv/booting.txt
> > @@ -0,0 +1,8 @@
> > +System requirements
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The following extensions are expected to be supported by a system
> > on which
> > +Xen is run:
> > +- Zihintpause:
> > +=C2=A0 On a system that doesn't have this extension, cpu_relax() shoul=
d
> > be
> > +=C2=A0 implemented properly. Otherwise, an illegal instruction
> > exception will arise.
>=20
> This decision wants justifying in the (presently once again empty)
> description.
>=20
> Furthermore - will there really be an illegal instruction exception
> otherwise?
> Isn't it the nature of hints that they are NOPs if not serving their
> designated
> purpose?
You are right, they are NOPs, so I will drop the part about an illegal
instruction exception.

> > --- a/xen/arch/riscv/arch.mk
> > +++ b/xen/arch/riscv/arch.mk
> > @@ -5,6 +5,12 @@ $(call cc-options-
> > add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> > =C2=A0
> > =C2=A0CFLAGS-$(CONFIG_RISCV_64) +=3D -mabi=3Dlp64
> > =C2=A0
> > +ifeq ($(CONFIG_RISCV_64),y)
> > +has_zihintpause =3D $(call as-insn,$(CC) -mabi=3Dlp64 -
> > march=3Drv64i_zihintpause, "pause",_zihintpause,)
> > +else
> > +has_zihintpause =3D $(call as-insn,$(CC) -mabi=3Dilp32 -
> > march=3Drv32i_zihintpause, "pause",_zihintpause,)
> > +endif
>=20
> Considering that down the road likely more such tests will want
> adding, I think
> this wants further abstracting for the rv32/rv64 difference (ideally
> in a way
> that wouldn't make future RV128 wrongly and silently take the RV32
> branch).
> This would include eliminating the -mabi=3Dlp64 redundancy with what's
> visible in
> context, perhaps by way of introducing a separate helper macro, e.g.
>=20
> riscv-abi-$(CONFIG_RISCV_32) :=3D -mabi=3Dilp32
> riscv-abi-$(CONFIG_RISCV_64) :=3D -mabi=3Dlp64
>=20
> I further see nothing wrong with also using $(riscv-march-y) here.
> I.e.
> overall
>=20
> _zihintpause :=3D $(call as-insn,$(CC) $(riscv-abi-y) $(riscv-march-
> y)_zihintpause,"pause",_zihintpause)
>=20
> (still with potential of abstracting further through another macro
> such
> that not every such construct would need to spell out the ABI and
> arch
> compiler options).
>=20
> Plus a macro named has_* imo can be expected to expand to y or n. I
> would
> suggest to simply drop the "has", thus ...
>=20
> > @@ -12,7 +18,7 @@ riscv-march-$(CONFIG_RISCV_ISA_C)=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 :=3D
> > $(riscv-march-y)c
> > =C2=A0# into the upper half _or_ the lower half of the address space.
> > =C2=A0# -mcmodel=3Dmedlow would force Xen into the lower half.
> > =C2=A0
> > -CFLAGS +=3D -march=3D$(riscv-march-y) -mstrict-align -mcmodel=3Dmedany
> > +CFLAGS +=3D -march=3D$(riscv-march-y)$(has_zihintpause) -mstrict-align
> > -mcmodel=3Dmedany
>=20
> ... also making the use site look=20
>=20
> > --- a/xen/arch/riscv/include/asm/processor.h
> > +++ b/xen/arch/riscv/include/asm/processor.h
> > @@ -12,6 +12,9 @@
> > =C2=A0
> > =C2=A0#ifndef __ASSEMBLY__
> > =C2=A0
> > +/* TODO: need to be implemeted */
> > +#define smp_processor_id() 0
> > +
> > =C2=A0/* On stack VCPU state */
> > =C2=A0struct cpu_user_regs
> > =C2=A0{
> > @@ -53,6 +56,26 @@ struct cpu_user_regs
> > =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pregs;
> > =C2=A0};
> > =C2=A0
> > +/* TODO: need to implement */
> > +#define cpu_to_core(cpu)=C2=A0=C2=A0 (0)
> > +#define cpu_to_socket(cpu) (0)
>=20
> Nit: Like above in smp_processor_id() no need for parentheses here.
>=20
> > +static inline void cpu_relax(void)
> > +{
> > +#ifdef __riscv_zihintpause
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * Reduce instruction retirement.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * This assumes the PC changes.
>=20
> What is this 2nd sentence about?
cpu_relax() function was copied from Linux kernel and this comment
exists there, but I couldn't find in zihintpause spec how it affects PC
/IP, so it seems to me it can be dropped.

My guess that the 2nd sentece was added because of the following words
from the spec:
   The PAUSE instruction is a HINT that indicates the current hart=E2=80=99=
s
   rate of instruction retirement should be temporarily reduced or
   paused. The duration of its effect must be bounded and may be zero.
  =20
So it says reduced or pause, but still doesn't make sense as no matter
how long pause takes to complete, it will still advance PC.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ ( "pause" );
> > +#else
> > +=C2=A0=C2=A0=C2=A0 /* Encoding of the pause instruction */
> > +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ ( ".insn 0x100000F" );
>=20
> May I ask that you spell out the leading zero here, to make clear
> there
> aren't, by mistake, one to few zeroes in the middle?
I will add a leading zero. The encoding is correct, I've verified with
disassembler:
   c:   0100000f                pause   =20

~ Oleksii

