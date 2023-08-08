Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E962773927
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 10:49:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579446.907422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIOa-0001WK-8P; Tue, 08 Aug 2023 08:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579446.907422; Tue, 08 Aug 2023 08:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIOa-0001Tm-4y; Tue, 08 Aug 2023 08:48:52 +0000
Received: by outflank-mailman (input) for mailman id 579446;
 Tue, 08 Aug 2023 08:48:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IVOA=DZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qTIOY-0001Te-Lu
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 08:48:50 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64c7b750-35c8-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 10:48:49 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b9cdbf682eso82908921fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 01:48:49 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a2e978f000000b002b6c56fe862sm2143390lji.63.2023.08.08.01.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 01:48:48 -0700 (PDT)
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
X-Inumbo-ID: 64c7b750-35c8-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691484529; x=1692089329;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xeyk9j8uv9IEWoHvsDNlnRdPsM1L1t/cJx4iovXa6Cw=;
        b=hbm4+6WZyNd22/aR7q1VUxf3J4RtUAIX+IZfx6nrZ2RxmTLFC5IhQQSFd6Xaqekqv9
         KHaq1b/TNO39Va9ajYlzia0O5C6f/mNHpsvL/iA0EmPXqwG/5TV4VuapiGigJV8p7WEs
         NZ9aA/qnPpRhaXCAjL+LwAulfkWlo8Bi3yqJOGetOt8enY1IjRw/dbsqVgQaBn5Ko11/
         cmiXPpjW8fZJCp5sO8qr0S0FQN2hmfUuQoQw4bBaggCrog3Ho0jOafE5/4PUinZ2Kv6A
         uyVQnrPrL16zi23sepQOYqobMjOUCUHQl/h9lALoxeWYit63JVpdOzA4c5P+Lo4GYpAR
         Iaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691484529; x=1692089329;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xeyk9j8uv9IEWoHvsDNlnRdPsM1L1t/cJx4iovXa6Cw=;
        b=YOCw+7yVFNL+qh7pWWGrJbl8Srkb7xTVcLs0YjdIWzKQhrDnOhg0wbmPCd7DGipU93
         hCgHPFhsAWbDKKn58zp0Ruy9xXanm5rzf261GClRMl6w2YNX6dH1lKKJ0+UwDMiwSM4d
         rZDzdwFaFmpiDS3FqFzlw+lZDVgMGNpj+8HEySjd8ijyNik1FEk9qUDcR81LQLrF1a/F
         AKaq8FgpoCKFyuSNt64XapOWBbnTerzb4Xon3h+uoiebGNyvQt1jyxGQY5U+hmHzzLCD
         PafOnvTfn3ErhB4sQDXbeiP/Mk+NP6j2XghLnAoF6/oWR5LTU0sv0PCtsoprRg/8zG7S
         YYuw==
X-Gm-Message-State: AOJu0YwBaNwFuPvNLTJ7U1QxRwQSEyMnkphB+kgv31zF59Ur83wb4pD2
	rJU9R56h4TIdWM7pTj6DFRk=
X-Google-Smtp-Source: AGHT+IGHFaT9cExJYQOkXw2FUwPED/U1cRarZnRifSNetksyPjjKE7QeHrhbz7uPJslDOUiac1x+0Q==
X-Received: by 2002:a2e:9254:0:b0:2b6:da1e:d063 with SMTP id v20-20020a2e9254000000b002b6da1ed063mr7670245ljg.45.1691484528946;
        Tue, 08 Aug 2023 01:48:48 -0700 (PDT)
Message-ID: <b31d2838bb331c216348ae478e7841d7bce48a88.camel@gmail.com>
Subject: Re: [PATCH v7 5/6] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 08 Aug 2023 11:48:47 +0300
In-Reply-To: <8098e465-d25c-7fe4-dd97-2f44a689c9a6@suse.com>
References: <cover.1691063432.git.oleksii.kurochko@gmail.com>
	 <9fdda7716faf412f1e2cdf9a990c98e64c4b21f3.1691063432.git.oleksii.kurochko@gmail.com>
	 <8098e465-d25c-7fe4-dd97-2f44a689c9a6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-08-07 at 15:29 +0200, Jan Beulich wrote:
> On 03.08.2023 14:05, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/traps.c
> > +++ b/xen/arch/riscv/traps.c
> > @@ -5,6 +5,8 @@
> > =C2=A0 * RISC-V Trap handlers
> > =C2=A0 */
> > =C2=A0
> > +#include <xen/bug.h>
> > +#include <xen/errno.h>
> > =C2=A0#include <xen/lib.h>
> > =C2=A0
> > =C2=A0#include <asm/csr.h>
> > @@ -12,6 +14,8 @@
> > =C2=A0#include <asm/processor.h>
> > =C2=A0#include <asm/traps.h>
> > =C2=A0
> > +#define cast_to_bug_frame(addr) ((const struct bug_frame *)(addr))
> > +
> > =C2=A0/*
> > =C2=A0 * Initialize the trap handling.
> > =C2=A0 *
> > @@ -101,7 +105,131 @@ static void do_unexpected_trap(const struct
> > cpu_user_regs *regs)
> > =C2=A0=C2=A0=C2=A0=C2=A0 die();
> > =C2=A0}
> > =C2=A0
> > +void show_execution_state(const struct cpu_user_regs *regs)
> > +{
> > +=C2=A0=C2=A0=C2=A0 printk("implement show_execution_state(regs)\n");
> > +}
> > +
> > +/*
> > + * TODO: generic do_bug_frame() should be used instead of current
> > + * implementation panic(), printk() and find_text_region()
> > + * (virtual memory?) will be ready/merged
> > + */
> > +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
> > +{
> > +=C2=A0=C2=A0=C2=A0 const struct bug_frame *start, *end;
> > +=C2=A0=C2=A0=C2=A0 const struct bug_frame *bug =3D NULL;
> > +=C2=A0=C2=A0=C2=A0 unsigned int id =3D 0;
>=20
> Pointless initializer.
Agree. Thanks. I'll remove it.

>=20
> > +=C2=A0=C2=A0=C2=A0 const char *filename, *predicate;
> > +=C2=A0=C2=A0=C2=A0 int lineno;
> > +
> > +=C2=A0=C2=A0=C2=A0 static const struct bug_frame *bug_frames[] =3D {
>=20
> You likely want another const here.
Yes, I will add it.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__start_bug_frames[0],
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_0[0],
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_1[0],
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_2[0],
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_3[0],
> > +=C2=A0=C2=A0=C2=A0 };
> > +
> > +=C2=A0=C2=A0=C2=A0 for ( id =3D 0; id < BUGFRAME_NR; id++ )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start =3D cast_to_bug_frame=
(bug_frames[id]);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 end=C2=A0=C2=A0 =3D cast_to=
_bug_frame(bug_frames[id + 1]);
>=20
> Why these casts (and then even hidden in a macro)? The array elements
> look to already be of appropriate type.
There is no any sense for these casts. It looks like that before
bug_frames array has a different type.

>=20
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
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Xen WARN at %s:%d\n=
", filename, lineno);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_state(regs);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto end;
> > +
> > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_bug:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Xen BUG at %s:%d\n"=
, filename, lineno);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_state(regs);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("change wait_for_int=
errupt to panic() when common
> > is available\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 die();
> > +
> > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_assert:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* ASSERT: decode the predi=
cate string pointer. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 predicate =3D bug_msg(bug);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Assertion %s failed=
 at %s:%d\n", predicate,
> > filename, lineno);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_state(regs);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("change wait_for_int=
errupt to panic() when common
> > is available\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 die();
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > +
> > + end:
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +static bool is_valid_bugaddr(uint32_t insn)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return insn =3D=3D BUG_INSN_32 ||
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (insn & C=
OMPRESSED_INSN_MASK) =3D=3D BUG_INSN_16;
> > +}
>=20
> Why "addr" in the name when this takes an insn as argument?
In the earliest patch series it was an address. But now it should be
changed. Thanks.
>=20
> > +/* Should be used only in Xen code ? */
>=20
> What is this question about? With ...
I meant that it's not safe to use in guest code.

>=20
> > +static uint32_t read_instr(unsigned long pc)
> > +{
> > +=C2=A0=C2=A0=C2=A0 uint16_t instr16 =3D *(uint16_t *)pc;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( GET_INSN_LENGTH(instr16) =3D=3D 2 )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (uint32_t)instr16;
>=20
> (I don't think this cast is needed.)
>=20
> > +=C2=A0=C2=A0=C2=A0 else
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return *(uint32_t *)pc;
> > +}
>=20
> ... there still being a double read here, do you perhaps mean to
> make a statement (that this code isn't safe to use on guest code)?
I wonder if it'll be safe to read 16 bytes at a time then we won't have
double read ( if you meant that first 16 bytes are read twice ):

static uint32_t read_instr(unsigned long pc)
{
    uint16_t instr16 =3D *(uint16_t *)pc;

    if ( GET_INSN_LENGTH(instr16) =3D=3D 2 )
        return (uint32_t)instr16;
    else{
        // return *(uint32_t *)pc;

        uint16_t next_16 =3D *((uint16_t *)pc + 1);
        return ((uint32_t)instr16 << sizeof(instr16)) + next_16;
    }
}
>=20
> > =C2=A0void do_trap(struct cpu_user_regs *cpu_regs)
> > =C2=A0{
> > +=C2=A0=C2=A0=C2=A0 register_t pc =3D cpu_regs->sepc;
> > +=C2=A0=C2=A0=C2=A0 uint32_t instr =3D read_instr(pc);
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( is_valid_bugaddr(instr) )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !do_bug_frame(cpu_regs=
, pc) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu=
_regs->sepc +=3D GET_INSN_LENGTH(instr);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 do_unexpected_trap(cpu_regs);
> > =C2=A0}
>=20

~ Oleksii


