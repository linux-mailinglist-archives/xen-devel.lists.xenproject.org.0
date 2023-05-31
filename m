Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0878717D46
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 12:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541722.844752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4JG3-00015p-8N; Wed, 31 May 2023 10:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541722.844752; Wed, 31 May 2023 10:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4JG3-00013Q-4K; Wed, 31 May 2023 10:40:47 +0000
Received: by outflank-mailman (input) for mailman id 541722;
 Wed, 31 May 2023 10:40:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X43w=BU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q4JG1-00013K-73
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 10:40:45 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 988ce7ba-ff9f-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 12:40:44 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2af24ee004dso58475171fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 03:40:44 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a2eb607000000b002a8a5afb87csm3234962ljn.20.2023.05.31.03.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 03:40:43 -0700 (PDT)
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
X-Inumbo-ID: 988ce7ba-ff9f-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685529644; x=1688121644;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s36fIqkklfoaLHBmkviR4gy89G1RdQE5efQmscEOmYs=;
        b=JgLCl8W0p9zYhZtlhhIyutTIYZYputA7jckJ2u4Oiv5/M5zOOq8C0WqYRMa10FmN8i
         RJSV/fhvcr5NIbD8opw87DcNxUHktKX49fL7WwYt14TVTdABkQ8xU/WbNrWfTEEepzh5
         MjSRVJL8otknD0bZbbZNo0r9GjAmnWzcvOzkW+PUIUcMPtSWOV5/mfV/63IL6rzwi6pq
         gMixsHSJ48SLDQqfps1ou+r1AYpD5vm2ok/96BxOPgSdrTFWt5y/wSNefxmKGx0l8iHq
         b4OLZElUlt941+KwtPkJO0BG9frJ6JSiQ8B+Cz/rLT0n2ry4QZ4MndRH/u3wYZCF0rcU
         n4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685529644; x=1688121644;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s36fIqkklfoaLHBmkviR4gy89G1RdQE5efQmscEOmYs=;
        b=lAKNYV2uLntx+66cB+jc4gVtqcd2X33FuuQ/GXSu8pWJ6g6qfEbfU+dC+9dU4gBqW3
         h+alHGFnIcFM82PDGjQ6Ur+W3MwwDl1Gi6CCTKfBYFNfMYULE3zNPOm4KsE1t3wlMJHG
         62SttxwtZWK6+9hfaJbs1zKfiBD2lMaOd1Ymo16BrU8LAbLD+yxvpCiYlAYuH4M/d5Te
         Z9vHJt55IFPCxkOBz0CsLSNisFXHHtnAUfjltfJ19f0pS1GW2q5Ka2QkRXRaFffVS2NQ
         2Stb7jiPAHcGpQnV6txQdTl91r+scfj2v1aZmXk4mu8XXeutHRt4R57PA3njVNQY7OR+
         QE/A==
X-Gm-Message-State: AC+VfDw7vUsd0aST7lPabs6w5sc33K4vfIm5RUQHtdDaB5mKqT0JddGo
	y4Jv29zQiCEX4ZatnlpoMUg=
X-Google-Smtp-Source: ACHHUZ6NmqW2m7ClcRjyC27sf/AlPk46kflA46HImX3xALKY1DZQb7L2AzZCgPe4hWcZvgkMgD0sLQ==
X-Received: by 2002:a2e:9b82:0:b0:2b0:2976:172d with SMTP id z2-20020a2e9b82000000b002b02976172dmr2629919lji.9.1685529643663;
        Wed, 31 May 2023 03:40:43 -0700 (PDT)
Message-ID: <f3bf3a483f7282eb365cf04f27e1c7a4e84f5aae.camel@gmail.com>
Subject: Re: [PATCH v6 5/6] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
 xen-devel@lists.xenproject.org
Date: Wed, 31 May 2023 13:40:42 +0300
In-Reply-To: <92580a6f-e97a-c4a9-435c-bd95a84d4306@suse.com>
References: <cover.1685359848.git.oleksii.kurochko@gmail.com>
	 <bd2dd42c778714f25e7e98f74ff5e98eee1cd0a5.1685359848.git.oleksii.kurochko@gmail.com>
	 <92580a6f-e97a-c4a9-435c-bd95a84d4306@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.2 (3.48.2-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-05-30 at 18:00 +0200, Jan Beulich wrote:
> On 29.05.2023 14:13, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/bug.h
> > +++ b/xen/arch/riscv/include/asm/bug.h
> > @@ -7,4 +7,32 @@
> > =C2=A0#ifndef _ASM_RISCV_BUG_H
> > =C2=A0#define _ASM_RISCV_BUG_H
> > =C2=A0
> > +#ifndef __ASSEMBLY__
> > +
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
>=20
> This, at least to some degree, looks to contradict ...
>=20
> > + * Compressed ISA is used now where the instruction length is 16
> > bit=C2=A0 and
> > + * 'ebreak' instruction, in this case, can be either 16 or 32 bit
> > (
> > + * depending on if compressed ISA is used or not )
>=20
> ... this. Plus there already is CONFIG_RISCV_ISA_C, so compressed
> insns
> can very well be used in Xen.
Thanks. You are right. The comment should be updated.

>=20
> > @@ -114,7 +116,134 @@ static void do_unexpected_trap(const struct
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
> > + * TODO: change early_printk's function to early_printk with
> > format
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 when s(n)printf() will be added=
.
>=20
> What is this comment about? I don't think I understand what it says
> needs doing.
I meant that it would be nice to introduce the second version of
early_printk() function which will take 'format', as printk() does.

But there is no any sense in this comment because all early_printk() in
do_bug_frame() were changed to printk().

Thereby I will update the comment.

>=20
> > + * Probably the TODO won't be needed as generic do_bug_frame()
> > + * has been introduced and current implementation will be replaced
> > + * with generic one when panic(), printk() and find_text_region()
> > + * (virtual memory?) will be ready/merged
> > + */
> > +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
>=20
> While it's going to be the maintainers to judge, I continue to be
> unconvinced that introducing copies of common functions (also in
> patch 1) is a good idea.
Generally I agree with you but as I mentioned before and in the comment
above the function do_bug_frame() the reason not to use generic
implementation of do_bug_frame() now as it will require to introduce
compilation of whole Xen's common code. ( there is no way to enable
just necessary parts for the current one function ).=20

I think that after this patch series I'll introduce compilation of
Xen's common code and after it'll be merged do_bug_frame() can be
removed.

>=20
> > +{
> > +=C2=A0=C2=A0=C2=A0 const struct bug_frame *start, *end;
> > +=C2=A0=C2=A0=C2=A0 const struct bug_frame *bug =3D NULL;
> > +=C2=A0=C2=A0=C2=A0 unsigned int id =3D 0;
> > +=C2=A0=C2=A0=C2=A0 const char *filename, *predicate;
> > +=C2=A0=C2=A0=C2=A0 int lineno;
> > +
> > +=C2=A0=C2=A0=C2=A0 static const struct bug_frame* bug_frames[] =3D {
>=20
> Nit: * and blank want to swap places. I would also expect another
> "const".
Thanks. I'll update that.

>=20
> > +static uint32_t read_instr(unsigned long pc)
> > +{
> > +=C2=A0=C2=A0=C2=A0 uint16_t instr16 =3D *(uint16_t *)pc;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( GET_INSN_LENGTH(instr16) =3D=3D 2 )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (uint32_t)instr16;
> > +=C2=A0=C2=A0=C2=A0 else
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return *(uint32_t *)pc;
> > +}
>=20
> As long as this function is only used on Xen code, it's kind of okay.
> There you/we control whether code can change behind our backs. But as
> soon as you might use this on guest code, the double read is going to
> be a problem (I think; I wonder how hardware is supposed to deal with
> the situation: Maybe they indeed fetch in 16-bit quantities?).
I'll check how the hardware fetches instructions.

I am trying to figure out why the double-read can be a problem. It
looks pretty safe to read 16 bits ( they will be available for any
instruction length with the assumption that the minimal instruction
length is 16 ), then check the length of the instruction, and if it is
32-bit instruction, read it as uint32_t.
>=20
> > --- a/xen/arch/riscv/xen.lds.S
> > +++ b/xen/arch/riscv/xen.lds.S
> > @@ -40,6 +40,16 @@ SECTIONS
> > =C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(PAGE_SIZE);
> > =C2=A0=C2=A0=C2=A0=C2=A0 .rodata : {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _srodata =3D .;=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Read-only data */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Bug frames table */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __start_bug_frames =3D .;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bug_frames.0)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __stop_bug_frames_0 =3D .;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bug_frames.1)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __stop_bug_frames_1 =3D .;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bug_frames.2)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __stop_bug_frames_2 =3D .;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bug_frames.3)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __stop_bug_frames_3 =3D .;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.rodata)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.rodata.*)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.data.rel.ro)
>=20
> Nit: There looks to be an off-by-one in how you indent your addition
> (except for the comment).
Thanks. One space is really absent...

~ Oleksii

