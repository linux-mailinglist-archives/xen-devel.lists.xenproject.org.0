Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C628763B06
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 17:29:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570548.892411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgRA-0001O8-Vf; Wed, 26 Jul 2023 15:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570548.892411; Wed, 26 Jul 2023 15:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgRA-0001MU-Sa; Wed, 26 Jul 2023 15:28:28 +0000
Received: by outflank-mailman (input) for mailman id 570548;
 Wed, 26 Jul 2023 15:28:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEth=DM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qOgR9-0001MO-AX
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 15:28:27 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1084d88a-2bc9-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 17:28:26 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-992dcae74e0so1106002966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 08:28:26 -0700 (PDT)
Received: from [192.168.202.116] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ci13-20020a170906c34d00b0099bca8b9a31sm728399ejb.100.2023.07.26.08.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 08:28:24 -0700 (PDT)
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
X-Inumbo-ID: 1084d88a-2bc9-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690385306; x=1690990106;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SG7ScnTYDVuAu5vg3c2uyxalkGm6IEfVezzFndoNadk=;
        b=WpVQz+kws12+VEM15Oq1QLm7N/ylPFFIbQFXfwegphq5RVgGngfOhzyA292ME8hFn8
         SqgAFiH/KEKv2h8SXJTGAp5dAWUVpwwHPbITA291PBGYcVdTuehz0XozcvXsFDvvAtko
         9xujukbBpqZBR/GzxU1hCUk9d1TR4mJJrYU5xEtqyDV5WdElxFfXPVAzAvGY3QeI3YRD
         EcsmPUf5zvACNPz9dUD7JcIqKl8i2H4vlVW6QwiQvHGGGm6Q23PVjk4VQM27uMcK33sV
         HnUVctqHekS1JivcBiLjwr7FCrN881h6kQyKHnlLkA9VN9JjEvBHzagqrdAWVLLEsBzZ
         dOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690385306; x=1690990106;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SG7ScnTYDVuAu5vg3c2uyxalkGm6IEfVezzFndoNadk=;
        b=GejTCqG2ENcGG2PwNI5yR9Rfxmyf0bEDfSygQGFzYxVH92ZzFDrImAyyWktS6iKplH
         ugOAEALhAJONxU0Qfh2VH2obpTT4vYvyShBAzte8WXDdCr38BOrKFBjH1xZX0y2H78Fc
         o1uy0UMdns1R6vsCwxzXXqmllCdrkvYTWrlq3wV3z3N8j/U0687v4H/VUS7bFru1C1xl
         sQQk+3yKC1cM+wp91V9dOj9G4QNx9T8telw/A0AiYgrs31vVI+6gNgUt5tXiYOJhAnJl
         qEGU7AFHyj7RB77+ZpJfQUwGH95kCj4RgdvocIi0jRqvFJYZXs0lBsiN2PrvicPuA8Ak
         BEhQ==
X-Gm-Message-State: ABy/qLZ6kjqHRmPgfM7PGubHXr2d2GR+Prz+vIN3aQh3EULRyY9xWgDC
	5f8KnL0AHqY/MEFdCYgzYVo=
X-Google-Smtp-Source: APBJJlEDpK3dmPXFq4Dd5q2lydQzZ+v6FTdT5HYrm5zvTMY8PvGAyvCfohVY+kzEgBlu9sgVz8lMWA==
X-Received: by 2002:a17:906:74d8:b0:987:e23f:6d7a with SMTP id z24-20020a17090674d800b00987e23f6d7amr2232341ejl.25.1690385305357;
        Wed, 26 Jul 2023 08:28:25 -0700 (PDT)
Message-ID: <de4204862d2912611b004a9b2067b3743c0fbfbf.camel@gmail.com>
Subject: Re: [PATCH v3 6/8] RISC-V: annotate entry points with type and size
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Wed, 26 Jul 2023 18:28:23 +0300
In-Reply-To: <60e57a9b-8091-0e6a-6066-2364d7d5441a@suse.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
	 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
	 <959bdb6d-9b6c-cde0-9459-c83cd3f58b18@suse.com>
	 <60e57a9b-8091-0e6a-6066-2364d7d5441a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-07-10 at 10:58 +0200, Jan Beulich wrote:
> On 10.07.2023 10:56, Jan Beulich wrote:
> > Use the generic framework in xen/linkage.h. No change in generated
> > code
> > except of course the converted symbols change to be hidden ones and
> > gain
> > a valid size.
> >=20
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> I'm sorry, the Cc list was incomplete here. Adding back the remaining
> REST
> maintainers.
>=20
> Jan
>=20
> > ---
> > Probably count_args_exp() should move to macros.h, but I first
> > wanted to
> > see whether anyone can suggest any better approach for checking
> > whether
> > a defined macro expands to nothing.
What about introduction of conditional macros ?
Something similar to:
#include <stdio.h>

#define CONDITIONAL_RETURN(arg1, arg2) CONDITIONAL_RETURN_IMPL(arg1,
arg2, EMPTY)

#define EMPTY(...) ""

#define CONDITIONAL_RETURN_IMPL(arg1, arg2, empty_check) \
    CONDITIONAL_RETURN_##empty_check(arg1, arg2)

#define CONDITIONAL_RETURN_EMPTY(arg1, arg2) \
    CONDITIONAL_RETURN_ARG1(arg1, arg2)

#define CONDITIONAL_RETURN_ARG1(arg1, arg2) arg1, arg2

#define CONDITIONAL_RETURN_ARG2(arg1, arg2) arg1

int main() {
    int a =3D 42;
    const char* b =3D "hello";

    // Second argument is not empty, both arguments are returned
    printf("Case 1: %d, %s\n", CONDITIONAL_RETURN(a, b));  // Prints:
Case 1: 42, hello

    // Second argument is empty, only the first argument is returned
    printf("Case 2: %d, %s\n", CONDITIONAL_RETURN(a, "")); // Prints:
Case 2: 42,

    return 0;
}

and then define DO_CODE_ALIGN using CONDITIONAL_RETURN?


~ Oleksii

> > ---
> > v3: New.
> >=20
> > --- a/xen/arch/riscv/entry.S
> > +++ b/xen/arch/riscv/entry.S
> > @@ -5,7 +5,7 @@
> > =C2=A0#include <asm/traps.h>
> > =C2=A0
> > =C2=A0/* WIP: only works while interrupting Xen context */
> > -ENTRY(handle_trap)
> > +FUNC(handle_trap)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 /* Exceptions from xen */
> > =C2=A0save_to_stack:
> > @@ -92,3 +92,4 @@ restore_registers:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_L=C2=A0=C2=A0 sp, =
CPU_USER_REGS_SP(sp)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sret
> > +END(handle_trap)
> > --- a/xen/arch/riscv/include/asm/asm.h
> > +++ b/xen/arch/riscv/include/asm/asm.h
> > @@ -7,6 +7,7 @@
> > =C2=A0#define _ASM_RISCV_ASM_H
> > =C2=A0
> > =C2=A0#ifdef __ASSEMBLY__
> > +#include <xen/linkage.h>
> > =C2=A0#define __ASM_STR(x)=C2=A0=C2=A0=C2=A0x
> > =C2=A0#else
> > =C2=A0#define __ASM_STR(x)=C2=A0=C2=A0=C2=A0#x
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -67,12 +67,8 @@
> > =C2=A0
> > =C2=A0/* Linkage for RISCV */
> > =C2=A0#ifdef __ASSEMBLY__
> > -#define ALIGN .align 4
> > -
> > -#define ENTRY(name)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > -=C2=A0 .globl name;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > -=C2=A0 ALIGN;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > -=C2=A0 name:
> > +#define CODE_ALIGN 16
> > +#define CODE_FILL /* empty */
> > =C2=A0#endif
> > =C2=A0
> > =C2=A0#ifdef CONFIG_RISCV_64
> > --- a/xen/arch/riscv/riscv64/head.S
> > +++ b/xen/arch/riscv/riscv64/head.S
> > @@ -8,7 +8,7 @@
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 a0=
 -> hart_id ( bootcpu_id )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 a1=
 -> dtb_base=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -ENTRY(start)
> > +FUNC(start)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Mask all interrupts=
 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csrw=C2=A0=C2=A0=C2=A0=
 CSR_SIE, zero
> > =C2=A0
> > @@ -30,13 +30,14 @@ ENTRY(start)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=A0=C2=A0=
=C2=A0 reset_stack
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tail=C2=A0=C2=A0=C2=A0=
 start_xen
> > +END(start)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .section .text, "ax", =
%progbits
> > =C2=A0
> > -ENTRY(reset_stack)
> > +FUNC(reset_stack)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 sp, cpu0_boot_stack
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 t0, STACK_SIZE
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=
=C2=A0 sp, sp, t0
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret
> > -
> > +END(reset_stack)
> > --- a/xen/include/xen/linkage.h
> > +++ b/xen/include/xen/linkage.h
> > @@ -37,17 +37,28 @@
> > =C2=A0
> > =C2=A0#define END(name) .size name, . - name
> > =C2=A0
> > +/*
> > + * CODE_FILL in particular may need to expand to nothing (e.g. for
> > RISC-V), in
> > + * which case we also need to get rid of the comma in the .balign
> > directive.
> > + */
> > +#define count_args_exp(args...) count_args(args)
> > +#if count_args_exp(CODE_FILL)
> > +# define DO_CODE_ALIGN(algn...) LASTARG(CODE_ALIGN, ## algn),
> > CODE_FILL
> > +#else
> > +# define DO_CODE_ALIGN(algn...) LASTARG(CODE_ALIGN, ## algn)
> > +#endif
> > +
> > =C2=A0#define FUNC(name, algn...) \
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYM(name, FUNC, GLOBAL, LAS=
TARG(CODE_ALIGN, ## algn),
> > CODE_FILL)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYM(name, FUNC, GLOBAL, DO_=
CODE_ALIGN(algn))
> > =C2=A0#define LABEL(name, algn...) \
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYM(name, NONE, GLOBAL, LAS=
TARG(CODE_ALIGN, ## algn),
> > CODE_FILL)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYM(name, NONE, GLOBAL, DO_=
CODE_ALIGN(algn))
> > =C2=A0#define DATA(name, algn...) \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYM(name, DATA, GLOBAL=
, LASTARG(DATA_ALIGN, ## algn),
> > DATA_FILL)
> > =C2=A0
> > =C2=A0#define FUNC_LOCAL(name, algn...) \
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYM(name, FUNC, LOCAL, LAST=
ARG(CODE_ALIGN, ## algn),
> > CODE_FILL)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYM(name, FUNC, LOCAL, DO_C=
ODE_ALIGN(algn))
> > =C2=A0#define LABEL_LOCAL(name, algn...) \
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYM(name, NONE, LOCAL, LAST=
ARG(CODE_ALIGN, ## algn),
> > CODE_FILL)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYM(name, NONE, LOCAL, DO_C=
ODE_ALIGN(algn))
> > =C2=A0#define DATA_LOCAL(name, algn...) \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SYM(name, DATA, LOCAL,=
 LASTARG(DATA_ALIGN, ## algn),
> > DATA_FILL)
> > =C2=A0


