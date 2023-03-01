Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FE86A6BE6
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 12:52:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503995.776462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXL0B-0003Mg-52; Wed, 01 Mar 2023 11:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503995.776462; Wed, 01 Mar 2023 11:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXL0B-0003Kx-2C; Wed, 01 Mar 2023 11:52:07 +0000
Received: by outflank-mailman (input) for mailman id 503995;
 Wed, 01 Mar 2023 11:52:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXL09-0003Kr-TI
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 11:52:06 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a13e221-b827-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 12:52:01 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id g18so11523504ljl.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 03:52:01 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 s6-20020a05651c200600b002934b8d115csm1636569ljo.51.2023.03.01.03.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 03:51:59 -0800 (PST)
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
X-Inumbo-ID: 7a13e221-b827-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677671520;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=olw9rm9zn0wV2yqmIiZD7aZrS98nXaVMyzhTVfpQ8DI=;
        b=M0pWpaybG4OvM7USJuIqd6nmoMxmjMfve6qrNH/Hp0b1xOybju9FYrj2JfrVx7jFV6
         JI1v8RtahJimgd6xXJP7aG+Ux7egZhCZmL7e68aSj6dWNXrAxVSayHASJmQczAd1nbYv
         2M1OhkE8MkNj3mF3kMp53JkvICj3Vk3sdKEQC7Vk930ZjLUyHVVTdh3oU3Fj7hmfns5m
         VhoM8x5fbpDBxI0iSWhaFswUjKHEFtgtDi3jwTqhZlU+8WSZSXBuHDN8O7ldcrnm9gZi
         ety4LeEkqvk0iRnqJHqzMSsAiaXxHY4sKBGCf+DFrlpMHye2O/KTtrXNBEgsge51karS
         PmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677671520;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=olw9rm9zn0wV2yqmIiZD7aZrS98nXaVMyzhTVfpQ8DI=;
        b=jfc44jb2r56rQYnQhulCjco2m6Zcpj6yh5IjIFMjpf/XNL5NqX8ljODy2JkMF3H5Dc
         ruL7lx/pCU9SdhXAiJosGK+IezpIsXtXLp4Te/uyxNHVE/mu8yD4FnA39SPyb8UoA59+
         faBw3U+wu2TumD6fMdbrRlAZwx2RV46n1xXxIOlrCJPJa7RPdcdjPNlj7tcpHlskG+Y+
         Tcsjf5QH+/5qCiZowIwrGvq9XaeXZn+BLnvi+snJQvUotIkwVPunrpMVgT9iOy/vLDV4
         VucDSsatfn/ZwX18aMFtAKPCliynciflBMH8I7lqvCexJ2Al4MrB1hBsHgjm0RIpuIb3
         9y/g==
X-Gm-Message-State: AO0yUKXtbMyV1Vl+o4zlu0dbOhsNJRvFw4u92OGa2ReyVEa7MnzMRwHF
	i9bfScJxLMWRPJc521Cw0t8=
X-Google-Smtp-Source: AK7set/EgXknEpS+xEC5m8k8WijkJUDua4Ye43Er3LR4yXKqEZldeKD4+uXIZU7oGv0KirNo0LAnJg==
X-Received: by 2002:a2e:a4a9:0:b0:295:a932:f40d with SMTP id g9-20020a2ea4a9000000b00295a932f40dmr2125027ljm.8.1677671520328;
        Wed, 01 Mar 2023 03:52:00 -0800 (PST)
Message-ID: <87902639b4d80c82833be96689f101a3ff151646.camel@gmail.com>
Subject: Re: [PATCH v4 3/5] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 01 Mar 2023 13:51:58 +0200
In-Reply-To: <e34c0315-dfd0-c176-52bf-64780befedb0@suse.com>
References: <cover.1677237653.git.oleksii.kurochko@gmail.com>
	 <a70ce0599da9549b5c4e601e5b410cfec5fc185b.1677237653.git.oleksii.kurochko@gmail.com>
	 <e34c0315-dfd0-c176-52bf-64780befedb0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-02-27 at 13:59 +0100, Jan Beulich wrote:
> On 24.02.2023 12:35, Oleksii Kurochko wrote:
> > The patch introduces macros: BUG(), WARN(), run_in_exception(),
> > assert_failed.
> >=20
> > The implementation uses "ebreak" instruction in combination with
> > diffrent bug frame tables (for each type) which contains useful
> > information.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V4:
> > =C2=A0 - Updates in RISC-V's <asm/bug.h>:
> > =C2=A0=C2=A0=C2=A0 * Add explanatory comment about why there is only de=
fined for
> > 32-bits length
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 instructions and 16/32-bits BUG_INSN_{16=
,32}.
> > =C2=A0=C2=A0=C2=A0 * Change 'unsigned long' to 'unsigned int' inside
> > GET_INSN_LENGTH().
> > =C2=A0=C2=A0=C2=A0 * Update declaration of is_valid_bugaddr(): switch r=
eturn type
> > from int to bool
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and the argument from 'unsigned int' to =
'vaddr'.
> > =C2=A0 - Updates in RISC-V's traps.c:
> > =C2=A0=C2=A0=C2=A0 * replace /xen and /asm includes=20
> > =C2=A0=C2=A0=C2=A0 * update definition of is_valid_bugaddr():switch ret=
urn type
> > from int to bool
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and the argument from 'unsigned int' to =
'vaddr'. Code style
> > inside function
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 was updated too.
> > =C2=A0=C2=A0=C2=A0 * do_bug_frame() refactoring:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * local variables start and bug became '=
const struct
> > bug_frame'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * bug_frames[] array became 'static cons=
t struct bug_frame[]
> > =3D ...'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * remove all casts
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * remove unneeded comments and add an ex=
planatory comment
> > that the do_bug_frame()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 will be switched to a generi=
c one.
> > =C2=A0=C2=A0=C2=A0 * do_trap() refactoring:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * read 16-bits value instead of 32-bits =
as compressed
> > instruction can
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 be used and it might happen =
than only 16-bits may be
> > accessible.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * code style updates
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * re-use instr variable instead of re-re=
ading instruction.
> > =C2=A0 - Updates in setup.c:
> > =C2=A0=C2=A0=C2=A0 * add blank line between xen/ and asm/ includes.
> > ---
> > Changes in V3:
> > =C2=A0 - Rebase the patch "xen/riscv: introduce an implementation of
> > macros
> > =C2=A0=C2=A0=C2=A0 from <asm/bug.h>" on top of patch series [introduce =
generic
> > implementation
> > =C2=A0=C2=A0=C2=A0 of macros from bug.h]
> > ---
> > Changes in V2:
> > =C2=A0 - Remove __ in define namings
> > =C2=A0 - Update run_in_exception_handler() with
> > =C2=A0=C2=A0=C2=A0 register void *fn_ asm(__stringify(BUG_FN_REG)) =3D =
(fn);
> > =C2=A0 - Remove bug_instr_t type and change it's usage to uint32_t
> > ---
> > =C2=A0xen/arch/riscv/include/asm/bug.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 48 ++++++++++
> > =C2=A0xen/arch/riscv/include/asm/processor.h |=C2=A0=C2=A0 2 +
> > =C2=A0xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0xen/arch/riscv/traps.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 125
> > +++++++++++++++++++++++++
> > =C2=A0xen/arch/riscv/xen.lds.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 ++
> > =C2=A05 files changed, 186 insertions(+)
> > =C2=A0create mode 100644 xen/arch/riscv/include/asm/bug.h
> >=20
> > diff --git a/xen/arch/riscv/include/asm/bug.h
> > b/xen/arch/riscv/include/asm/bug.h
> > new file mode 100644
> > index 0000000000..67ade6f895
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/bug.h
> > @@ -0,0 +1,48 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2012 Regents of the University of California
> > + * Copyright (C) 2021-2023 Vates
> > + *
> > + */
> > +#ifndef _ASM_RISCV_BUG_H
> > +#define _ASM_RISCV_BUG_H
> > +
> > +#include <xen/types.h>
> > +
> > +#ifndef __ASSEMBLY__
>=20
> This #ifndef contradicts the xen/types.h inclusion. Either the
> #include
> moves down below here, or the #ifndef goes away as pointless. This is
> because xen/types.h cannot be include in assembly files.
I will remove it. It looks like it leave when as generic implementation
was taken ARM.
>=20
> > +#define BUG_INSTR "ebreak"
> > +
> > +/*
> > + * The base instruction set has a fixed length of 32-bit naturally
> > aligned
> > + * instructions.
> > + *
> > + * There are extensions of variable length ( where each
> > instruction can be
> > + * any number of 16-bit parcels in length ) but they aren't used
> > in Xen
> > + * and Linux kernel ( where these definitions were taken from ).
> > + *
> > + * Compressed ISA is used now where the instruction length is 16
> > bit=C2=A0 and
> > + * 'ebreak' instruction, in this case, can be either 16 or 32 bit
> > (
> > + * depending on if compressed ISA is used or not )
> > + */
> > +#define INSN_LENGTH_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _UL=
(0x3)
> > +#define INSN_LENGTH_32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 _UL(0x3)
> > +
> > +#define BUG_INSN_32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 _UL(0x00100073) /* ebreak */
> > +#define BUG_INSN_16=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 _UL(0x9002)=C2=A0=C2=A0=C2=A0=C2=A0 /* c.ebreak */
> > +#define COMPRESSED_INSN_MASK=C2=A0=C2=A0=C2=A0 _UL(0xffff)
> > +
> > +#define GET_INSN_LENGTH(insn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 unsigned int len;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 len =3D ((insn & INSN_LENGTH_MASK) =3D=3D INSN_LENG=
TH_32) ?=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4UL : 2UL;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>=20
> Why the UL suffixes?
>=20
> > +=C2=A0=C2=A0=C2=A0 len;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +})
>=20
> And anyway - can't the whole macro be written without using any
> extension:
>=20
> #define GET_INSN_LENGTH(insn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0 (((insn) & INSN_LENGTH_MASK) =3D=3D INSN_LENGTH_32 ? 4=
 : 2) \
>=20
> ? (Note also that uses of macro parameters should be properly
> parenthesized.)
It can. I'll update the macros.
>=20
> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -1,3 +1,4 @@
> > +#include <xen/bug.h>
> > =C2=A0#include <xen/compile.h>
> > =C2=A0#include <xen/init.h>
>=20
> Why? Eventually this will be needed, I agree, but right now?
Agree. <xen/bug.h> should be removed fro the current patch.
Probably merge error during rebase.
>=20
> > @@ -99,7 +100,131 @@ static void do_unexpected_trap(const struct
> > cpu_user_regs *regs)
> > =C2=A0=C2=A0=C2=A0=C2=A0 die();
> > =C2=A0}
> > =C2=A0
> > +void show_execution_state(const struct cpu_user_regs *regs)
> > +{
> > +=C2=A0=C2=A0=C2=A0 early_printk("implement show_execution_state(regs)\=
n");
> > +}
> > +
> > +/*
> > + * TODO: change early_printk's function to early_printk with
> > format
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 when s(n)printf() will be added=
.
> > + *
> > + * Probably the TODO won't be needed as generic do_bug_frame() (at
> > + * least, for ARM and RISC-V) has been introduced and current
> > + * implementation will be replaced with generic one when panic(),
> > + * printk() and find_text_region() (virtual memory?) will be
> > + * ready/merged
> > + */
> > +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
> > +{
> > +=C2=A0=C2=A0=C2=A0 const struct bug_frame *start, *end;
> > +=C2=A0=C2=A0=C2=A0 const struct bug_frame *bug =3D NULL;
> > +=C2=A0=C2=A0=C2=A0 unsigned int id =3D 0;
> > +=C2=A0=C2=A0=C2=A0 const char *filename, *predicate;
> > +=C2=A0=C2=A0=C2=A0 int lineno;
> > +
> > +=C2=A0=C2=A0=C2=A0 static const struct bug_frame* bug_frames[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__start_bug_frames[0],
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_0[0],
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_1[0],
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_2[0],
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_3[0],
> > +=C2=A0=C2=A0=C2=A0 };
> > +
> > +=C2=A0=C2=A0=C2=A0 for ( id =3D 0; id < BUGFRAME_NR; id++ )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start =3D bug_frames[id];
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 end=C2=A0=C2=A0 =3D bug_fra=
mes[id + 1];
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while ( start !=3D end )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
( (vaddr_t)bug_loc(start) =3D=3D pc )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 bug =3D start;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 goto found;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sta=
rt++;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > + found:
> > +=C2=A0=C2=A0=C2=A0 if ( bug =3D=3D NULL )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOENT;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( id =3D=3D BUGFRAME_run_fn )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*fn)(const struct cpu=
_user_regs *) =3D bug_ptr(bug);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn(regs);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto end;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /* WARN, BUG or ASSERT: decode the filename pointer=
 and line
> > number. */
> > +=C2=A0=C2=A0=C2=A0 filename =3D bug_ptr(bug);
> > +=C2=A0=C2=A0=C2=A0 lineno =3D bug_line(bug);
> > +
> > +=C2=A0=C2=A0=C2=A0 switch ( id )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_warn:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("Xen WARN at "=
);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk(filename);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("\n");
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_state(regs);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto end;
> > +
> > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_bug:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("Xen BUG at ")=
;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk(filename);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("\n");
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_state(regs);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("change wait_f=
or_interrupt to panic() when
> > common is available\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 die();
> > +
> > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_assert:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* ASSERT: decode the predi=
cate string pointer. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 predicate =3D bug_msg(bug);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("Assertion \'"=
);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk(predicate);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("\' failed at =
");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk(filename);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("\n");
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_state(regs);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("change wait_f=
or_interrupt to panic() when
> > common is available\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 die();
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > +
> > + end:
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
>=20
> Wasn't the goal to use the generic do_bug_frame()?
It's the goal but at the current stage we can't switch to
do_bug_frame() because it is based on function from xen/common which we
don't have now for RISC-V. So it will be switched when xen/common will
be available.
>=20
> > +bool is_valid_bugaddr(vaddr_t insn)
>=20
> Why is insn of type vaddr_t?
Initially address of insn was passed here. But now we should change
vaddr_t to 'uint32_t' as the instruction length can be either 16 or 32
and update instr variable inside do_trap():

  static uint32_t read_instr(unsigned long pc)
  {
      uint16_t instr16 =3D *(uint16_t *)pc;
=20
      if ( GET_INSN_LENGTH(instr16) =3D=3D 2 )
          return (uint32_t)instr16;
      else
          return *(uint32_t *)pc;
  }

  void do_trap(struct cpu_user_regs *cpu_regs)
  {
      register_t pc =3D cpu_regs->sepc;
      uint32_t instr =3D read_instr(pc);
  ...

>=20
> > +{
> > +=C2=A0=C2=A0=C2=A0 if ( (insn & INSN_LENGTH_MASK) =3D=3D INSN_LENGTH_3=
2 )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ( insn =3D=3D BUG_IN=
SN_32 );
> > +=C2=A0=C2=A0=C2=A0 else
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ( (insn & COMPRESSED=
_INSN_MASK) =3D=3D BUG_INSN_16 );
>=20
> Nit (style): The kind-of-operand to return is an expression. Hence
> you have stray blanks there immediately inside the parentheses.
> (This is unlike e.g. if(), where you've formatted things correctly.)
To be 100% sure, should it be:=20
  return ( ( insn & COMPRESSED_INSN_MASK ) =3D=3D BUG_INSN_16 );
> > +}
> > +
> > =C2=A0void do_trap(struct cpu_user_regs *cpu_regs)
> > =C2=A0{
> > +=C2=A0=C2=A0=C2=A0 register_t pc =3D cpu_regs->sepc;
> > +=C2=A0=C2=A0=C2=A0 uint16_t instr =3D *(uint16_t *)pc;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( is_valid_bugaddr(instr) ) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !do_bug_frame(cpu_regs=
, cpu_regs->sepc) ) {
>=20
> Nit: Brace placement (twice).
Thanks. I'll update then.
>=20
> Jan


