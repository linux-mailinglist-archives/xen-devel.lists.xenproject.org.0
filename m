Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7366908F6
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 13:36:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492427.761953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ696-0007P8-Oj; Thu, 09 Feb 2023 12:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492427.761953; Thu, 09 Feb 2023 12:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ696-0007Mj-Lx; Thu, 09 Feb 2023 12:35:24 +0000
Received: by outflank-mailman (input) for mailman id 492427;
 Thu, 09 Feb 2023 12:35:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A2pk=6F=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pQ695-0007MN-FW
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 12:35:23 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36d2090b-a876-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 13:35:20 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id az16so782604wrb.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 04:35:19 -0800 (PST)
Received: from [192.168.8.199] (46.204.104.21.nat.umts.dynamic.t-mobile.pl.
 [46.204.104.21]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b003da28dfdedcsm1998948wmq.5.2023.02.09.04.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 04:35:19 -0800 (PST)
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
X-Inumbo-ID: 36d2090b-a876-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=riU3/BjBr4ZRmoxCxftod6B1mftUjCR8AN/UhtyxNHg=;
        b=n7fZld7HMYMtJ+GUyuIcR3EWrBhMI5RamoN7cY9ytltaryUCH75Q+tCxZoMhlqagMO
         /OjukcvSVw56N5ShI+ABOWyQzX+UgH/yMMI6+eJqt/gDBLfEBKH7hnw0PEiN3L5StAPs
         1lGYpuzfRqIAxMoLBbyszh80Cr1Yy4PBUg5IfeOxUT0LizAQtUYk+OSSZpe45soqUe7s
         hV6n9+OS4FUAlAbH2dzXUgSeRTm/Z48BAgq/0nQkghpEjGHsZVT91DZ0L0aXrI48p72L
         2Xbqu2EsefM2DtWDQfJSdADVUsmtoe7x/0wK35ZEopIrmWFnQkhC1PNgbMZNPS2eSqfo
         1igQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=riU3/BjBr4ZRmoxCxftod6B1mftUjCR8AN/UhtyxNHg=;
        b=q2tfFYBjGUPG8g3sQ5X8akEk5IzLKlNQ9WHipvXau6KSrCZ7YeZk9sGb2Y6Ou7iiVH
         2DiPRxGdtCdAyiSR2MFA3AitxZ8t5aojDV/qXqZUlcNdr6tz2CH5fG+XVXMisADtUmI6
         dxFJFXNH7bDFS4fyNSclUn99e0Kn2tSwributjhzcv3N8O/R5WMsIFTwq2W6J3o45/g0
         qLlPjPfcT9dl53tYiOyltDuS4Mcl0STh/oTbuuGrUHrVMJNgsC6bxkKULe7UKvTbkNiQ
         k1xnFJV+VP7URVjK2rickequXJiDHISbg+74JRQSeLcjUV2HfJq1RV2LYjbbGS6f8XU0
         6SiQ==
X-Gm-Message-State: AO0yUKXwjSpwROZ5Q5m+Jkf/Gmd2FKKVDj2DU84bkDygGAYSFrs9P4YM
	/ecOFTwhEfEGmMhKbItAi/w=
X-Google-Smtp-Source: AK7set/8E7DBXdICQURPYH0qpape6O6ogFkK+POXlXkny4SSpyjjjD1aZuDYZ2WUjRNAIfc/uVq7tg==
X-Received: by 2002:adf:e40c:0:b0:2c3:ec55:b1b5 with SMTP id g12-20020adfe40c000000b002c3ec55b1b5mr11500640wrm.15.1675946119358;
        Thu, 09 Feb 2023 04:35:19 -0800 (PST)
Message-ID: <25bd709316631ceac04876b40898d3c970e4ba50.camel@gmail.com>
Subject: Re: [PATCH v3 12/14] xen/riscv: introduce an implementation of
 macros from <asm/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Thu, 09 Feb 2023 14:35:17 +0200
In-Reply-To: <1331e8eb-652a-3bdd-2c98-ee695b03d12a@suse.com>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
	 <404a4d6621a2e5eb276d2fa61188429294d682ba.1675779308.git.oleksii.kurochko@gmail.com>
	 <bee6af5c-6000-461b-7642-2864d412e351@suse.com>
	 <e69eb6695310ed63eb68291f76ba1ec96626d68b.camel@gmail.com>
	 <1331e8eb-652a-3bdd-2c98-ee695b03d12a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-02-08 at 15:01 +0100, Jan Beulich wrote:
> On 08.02.2023 13:00, Oleksii wrote:
> > On Tue, 2023-02-07 at 16:07 +0100, Jan Beulich wrote:
> > > On 07.02.2023 15:46, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/include/asm/bug.h
> > > > @@ -0,0 +1,38 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +/*
> > > > + * Copyright (C) 2012 Regents of the University of California
> > > > + * Copyright (C) 2021-2023 Vates
> > > > + *
> > > > + */
> > > > +#ifndef _ASM_RISCV_BUG_H
> > > > +#define _ASM_RISCV_BUG_H
> > > > +
> > > > +#include <xen/types.h>
> > > > +
> > > > +#ifndef __ASSEMBLY__
> > > > +
> > > > +#define BUG_FN_REG t0
> > > > +
> > > > +#define BUG_INSTR "ebreak"
> > > > +
> > > > +#define INSN_LENGTH_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 _UL(0x3)
> > > > +#define INSN_LENGTH_32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 _UL(0x3)
> > >=20
> > > I assume these are deliberately over-simplified (not accounting
> > > for
> > > wider than 32-bit insns in any way)?
> > The base instruction set has a fixed length of 32-bit naturally
> > aligned
> > instructions.
> >=20
> > There are extensions of variable length ( where each instruction
> > can be
> > any number of 16-bit parcels in length ) but they aren't used in
> > Xen
> > and Linux kernel ( where these definitions were taken from ).
>=20
> Can there then please be a comment here about this (current)
> assumption?
>=20
Sure, I'll do it.

> > > > +#define BUG_INSN_32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 _UL(0x00100073) /* ebreak */
> > > > +#define BUG_INSN_16=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 _UL(0x9002)=C2=A0=C2=A0=C2=A0=C2=A0 /* c.ebreak=
 */
> > > > +#define COMPRESSED_INSN_MASK=C2=A0=C2=A0=C2=A0 _UL(0xffff)
> > > > +
> > > > +#define GET_INSN_LENGTH(insn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long len;=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 len =3D ((insn & INSN_LENGTH_MASK) =3D=3D INSN_=
LENGTH_32) ?=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4UL : 2UL;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 len;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > >=20
> > > Any reason for the use of "unsigned long" (not "unsigned int")
> > > here?
> > >=20
> > There is no specific reason (at least I don't see it now). It looks
> > like it can be used here even smaller type than 'unsigned int' as
> > len,
> > in current case, can be either 4 or 2.
>=20
> Often working with more narrow types isn't as efficient, so using
> (signed/unsigned) int is generally best unless there are specific
> reasons to use a wider or more narrow type.
>=20
Thanks for explaining.

> > > > @@ -97,7 +98,136 @@ static void do_unexpected_trap(const struct
> > > > cpu_user_regs *regs)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 die();
> > > > =C2=A0}
> > > > =C2=A0
> > > > +void show_execution_state(const struct cpu_user_regs *regs)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 early_printk("implement show_execution_state(re=
gs)\n");
> > > > +}
> > > > +
> > > > +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 struct bug_frame *start, *end;
> > > > +=C2=A0=C2=A0=C2=A0 struct bug_frame *bug =3D NULL;
> > >=20
> > > const?
> > regs aren't changed in the function so I decided to put it as
> > const.
>=20
> Hmm, a misunderstanding? I was asking whether there is a reason not
> to have the three local variables be "pointer to const". As a rule
> of thumb, const should be added to pointed-to types whenever
> possible.
> That way it's very obvious even when looking only in passing that the
> value/array pointed to isn't supposed to be modified through the
> variable (or function parameter).
Oh, got it. I though that you wrote about const in "const struct
cpu_user_regs *regs".
>=20
> > > > +=C2=A0=C2=A0=C2=A0 unsigned int id =3D 0;
> > > > +=C2=A0=C2=A0=C2=A0 const char *filename, *predicate;
> > > > +=C2=A0=C2=A0=C2=A0 int lineno;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long bug_frames[] =3D {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (unsigned long)&__start=
_bug_frames[0],
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (unsigned long)&__stop_=
bug_frames_0[0],
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (unsigned long)&__stop_=
bug_frames_1[0],
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (unsigned long)&__stop_=
bug_frames_2[0],
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (unsigned long)&__stop_=
bug_frames_3[0],
> > > > +=C2=A0=C2=A0=C2=A0 };
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 for ( id =3D 0; id < BUGFRAME_NR; id++ )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start =3D (struct=C2=A0=
 bug_frame *)bug_frames[id];
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 end =3D (struct=C2=A0 b=
ug_frame *)bug_frames[id + 1];
> > >=20
> > > Nit: Stray double blanks. But I'd like to suggest that you get
> > > away
> > > without casts here in the first place. Such casts are always a
> > > certain
> > > risk going forward.
> > Do you mean that it is better to re-write bug_frame[] to:
> > =C2=A0=C2=A0=C2=A0 struct bug_frane bug_frames[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__start_bug_frame[0],
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
>=20
> Yes - the fewer casts the better. Also as per above, as much const as
> possible. And I expect the array can actually also be static rather
> than living on the stack.
Thanks. I'll update with the proposed changes.
>=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while ( start !=3D end =
)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if ( (vaddr_t)bug_loc(start) =3D=3D pc )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 bug =3D start;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 goto found;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 start++;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > + found:
> > > > +=C2=A0=C2=A0=C2=A0 if ( bug =3D=3D NULL )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOENT;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( id =3D=3D BUGFRAME_run_fn )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*fn)(const struct=
 cpu_user_regs *) =3D (void
> > > > *)regs-
> > > > > BUG_FN_REG;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn(regs);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto end;
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /* WARN, BUG or ASSERT: decode the filename poi=
nter and
> > > > line
> > > > number. */
> > > > +=C2=A0=C2=A0=C2=A0 filename =3D bug_file(bug);
> > > > +=C2=A0=C2=A0=C2=A0 lineno =3D bug_line(bug);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 switch ( id )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_warn:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * TODO: change ea=
rly_printk's function to
> > > > early_printk
> > > > with format
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 when s(n)printf() will be added.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("Xen WARN =
at ");
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk(filename);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk(":");
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // early_printk_hnum(li=
neno);
> > >=20
> > > What's this? At the very least the comment is malformed.
> > It's an old code that should be removed.
>=20
> Removed? I.e. the line number will never be logged?
It will, but:
1. I decided not to provide early_printk_hnum() and focus on getting
printk() working.
2. I introduced generic do_bug_frame() [1] (at least, for ARM and RISC-
V) so the current implementation will be switched to generic one when
panic, printk and find_text_region() (virtual memory) will be
ready/merged. It is what I am going to do next.

[2] - is a link to patch series with introduction of generic
implementation of macros from bug.h. Probably you can look at it too
when you will have free time. Thank you so much for your attention and
participation.

[1]
https://lore.kernel.org/xen-devel/8adf4aeff96750982e3d670cb3aed11553d546d5.=
1675441720.git.oleksii.kurochko@gmail.com/
[2]
https://lore.kernel.org/xen-devel/?q=3D%22introduce+generic+implementation+=
of+macros+from+bug.h%22
>=20
> Jan

~ Oleksii


