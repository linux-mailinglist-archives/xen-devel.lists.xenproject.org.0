Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E1B948C9F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 12:12:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772721.1183166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbHAg-0002tm-Ll; Tue, 06 Aug 2024 10:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772721.1183166; Tue, 06 Aug 2024 10:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbHAg-0002rL-JE; Tue, 06 Aug 2024 10:12:02 +0000
Received: by outflank-mailman (input) for mailman id 772721;
 Tue, 06 Aug 2024 10:12:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPS5=PF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sbHAf-0002rF-9r
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 10:12:01 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 510b71d8-53dc-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 12:11:59 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52f00ad303aso854924e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 03:11:59 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c6627esm535870466b.95.2024.08.06.03.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 03:11:57 -0700 (PDT)
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
X-Inumbo-ID: 510b71d8-53dc-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722939118; x=1723543918; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1XwduJp1zaq5JLdw8QoROqS1iDa5pAJHna5xKRYNEZo=;
        b=SgA9SLS/VO2i2FmoU4ofYE2XWUhDkB25fmj4bdqpylURU4WWSjtPbTMoILxENPnWxa
         RWffxYU4yK1NyoJ8TYuJE8sPDzx7jGo6etjTlTAWPVo0QGTCbIawXcb9XAGqw2aqUgwI
         vLpA541MgXsyZehBsayhWe1ptT30gYZlaD4OFyZ0yC1YI0v20UAyUa4uZF/xHoA4vy0b
         0vE4Rumo20im9l+POgODpYVf8DiAcGwR83/+jd6pOwHmhze5QHt1qR2HrzbeybKOWt3Y
         OFGei7r3jcQH8MHMTmHLiZHuD2jvCKwgIVEi6TRUQCDteXq3Ic+UCpj0ryTubtFKa/9+
         YqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722939118; x=1723543918;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XwduJp1zaq5JLdw8QoROqS1iDa5pAJHna5xKRYNEZo=;
        b=GHhGDooZUpyBiaGt5050OSVsQM3GSIXwAy5BBgqxDLBGdLbeta9xR2ZtERbt5CzkIa
         qb9g606b7WuuZ2MwLxwt/C6I0ZeyLYf1pReADNx7uorTCnrcTENwoONbur27FbrDljr2
         hq1J28+dA7kTvAFXWd0HUqbYqDM+DBZKID09ZPEfk2JCzBfVdzfOz63JZ9wIR9MoM/Ze
         soKwFG1TPd2t63mRCWOpFYpWm204cj6llBwztpWudU+qwuK+zqVouPkUAK3XTCpxlOf3
         dnYww67dC97rsi5U3d5dknaQoyuidR4tlv1pGczbzyvq2bTbGQGI0csxA6LIb/JMgd2X
         BnTA==
X-Forwarded-Encrypted: i=1; AJvYcCWA7GhRQ/kBDjv7Z4xPLyyZLJzjaxkTQoMPJSuCy8INlvqLg6fg1ZZfbtBFe9F0YG40pO0gp4DWfLZ4hk/fYldjLja+SGNRjewqdennN7s=
X-Gm-Message-State: AOJu0YxjhfvAxnt6B2VrM30NNA575oJDgaRS6M57YkkdVZo8ncgxqy9U
	4n3JgUiiMEBh3+JfTWk/C/EYBo6jEgN7ibDCzIQPwyWNP16HfJM/
X-Google-Smtp-Source: AGHT+IHRY+xNoJ0f8yJ6AZhRE8v+X6Y/g0y1pCMvfoSnd/zYE0xZix7n5Q/ZyUWPhy/spd6Ch33Xpg==
X-Received: by 2002:a05:6512:3d20:b0:530:9d86:6322 with SMTP id 2adb3069b0e04-530bb3ca42cmr10572274e87.41.1722939118036;
        Tue, 06 Aug 2024 03:11:58 -0700 (PDT)
Message-ID: <89d6b01ac85899c85f1dbfdaa907435e12de75c2.camel@gmail.com>
Subject: Re: [PATCH v12 1/3] xen/riscv: enable GENERIC_BUG_FRAME
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 06 Aug 2024 12:11:56 +0200
In-Reply-To: <0245feaa-6cf2-4f44-843f-38cdcc6b7a42@suse.com>
References: <cover.1722605952.git.oleksii.kurochko@gmail.com>
	 <3d507ce45606d22e9fa07dd6087870c16b5c4a4e.1722605952.git.oleksii.kurochko@gmail.com>
	 <0245feaa-6cf2-4f44-843f-38cdcc6b7a42@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-08-05 at 17:41 +0200, Jan Beulich wrote:
> On 02.08.2024 15:54, Oleksii Kurochko wrote:
> > Enable GENERIC_BUG_FRAME to support BUG(), WARN(), ASSERT,
> > and run_in_exception_handler().
> >=20
> > The 0x0000 opcode is used for BUG_INSTR, which, when macros from
> > <xen/bug.h> are used, triggers an exception with the
> > ILLEGAL_INSTRUCTION cause.
> > This opcode is encoded as a 2-byte instruction and is invalid if
> > CONFIG_RISCV_ISA_C is enabled or not.
>=20
> Yes, but there's a caveat: Without the C extension instructions have
> to be aligned on 32-bit boundaries. You can't just go and insert a
> 16-bit item there. When RISCV_ISA_C is not set, I think you want to
> insert two such 16-bit zeroes. Beware of an alignment handling bug
> in the assembler - don't think of using an alignment directive here.
Then probably it will be better to define BUG_INSTR as:
 #define BUG_INSTR "UNIMP"
and let compiler to provide proper opcode.

Or define BUG_INSTRT always as 0x00000000 will be better?
>=20
>=20
> > --- a/xen/arch/riscv/include/asm/bug.h
> > +++ b/xen/arch/riscv/include/asm/bug.h
> > @@ -9,7 +9,11 @@
> > =C2=A0
> > =C2=A0#ifndef __ASSEMBLY__
> > =C2=A0
> > -#define BUG_INSTR "ebreak"
> > +#include <xen/stringify.h>
> > +
> > +#define BUG_OPCODE=C2=A0 0x0000
>=20
> You don't really use this other than ...
>=20
> > +#define BUG_INSTR ".hword " __stringify(BUG_OPCODE)
>=20
> ... here - does this really warrant a separate #define _and_
> inclusion of
> stringify.h?
>=20
> Furthermore you want to avoid using .hword (or any data generating
> directive), to avoid disturbing disassembly. Please use .insn if at
> all
> possible. I understand though that in certain cases you won't be able
> to
> use .insn. Yet for the common case (more recent binutils) you'd still
> better avoid .hword or alike, imo.
>=20
> > @@ -103,7 +104,29 @@ static void do_unexpected_trap(const struct
> > cpu_user_regs *regs)
> > =C2=A0
> > =C2=A0void do_trap(struct cpu_user_regs *cpu_regs)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0 do_unexpected_trap(cpu_regs);
> > +=C2=A0=C2=A0=C2=A0 register_t pc =3D cpu_regs->sepc;
> > +=C2=A0=C2=A0=C2=A0 unsigned long cause =3D csr_read(CSR_SCAUSE);
> > +
> > +=C2=A0=C2=A0=C2=A0 switch ( cause )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0 case CAUSE_ILLEGAL_INSTRUCTION:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( do_bug_frame(cpu_regs,=
 pc) >=3D 0 )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
( !(is_kernel_text(pc) || is_kernel_inittext(pc)) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 printk("Something wrong with PC: %#lx\n", pc);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 die();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu=
_regs->sepc +=3D GET_INSN_LENGTH(*(uint16_t *)pc);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 default:
>=20
> The falling-through here wants annotating, preferably with the
> pseudo-
> keyword.
What kind of pseudo-keyword? I though about /* goto default */ to
underline that CAUSE_ILLEGAL_INSTRUCTION should be close to "default:".

~ Oleksii
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do_unexpected_trap(cpu_regs=
);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > +=C2=A0=C2=A0=C2=A0 }
> > =C2=A0}
>=20


