Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1159E92E2B9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 10:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757180.1165936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRpVI-0000G6-Kt; Thu, 11 Jul 2024 08:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757180.1165936; Thu, 11 Jul 2024 08:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRpVI-0000EM-H4; Thu, 11 Jul 2024 08:50:16 +0000
Received: by outflank-mailman (input) for mailman id 757180;
 Thu, 11 Jul 2024 08:50:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRpVG-0000EG-8y
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 08:50:14 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 959b9a4c-3f62-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 10:50:12 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58b966b41fbso721830a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 01:50:12 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bda310a4sm3189990a12.90.2024.07.11.01.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 01:50:11 -0700 (PDT)
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
X-Inumbo-ID: 959b9a4c-3f62-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720687812; x=1721292612; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NC/EJlTb4djABXHevBCwBYU8+nGumnqibnOq6D99iso=;
        b=MaEgGsR86fXFWxfEAGncno85PMo6CHc+g4/7iPCCtm6cub7G8tT54rchfyAymPwp4M
         EMOPkGK3+DMvVCcZH1nddZUH4y7mLEkpNaFG+8ToNpQwc0Vvqe2LNgV5mA7ffwhVfz63
         +hl7xx3TBtGDwyANvlqd+81iiq8e5brJifVHbui7TJa+8Bnih/A4Oqnfs2xRZs2GC9ro
         DhfipYcpdGguwLX7B/oFe3G8KLY1aB08XG+jbkduNjJad2fPMuwc54LCPa21bU89Ffv+
         fkcWDsC3Au77degyNDYT6OagzHrgmr8Ggcw/m3tpHyC1He3UMpgmy4hQ53BFSCcBj37e
         Lgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720687812; x=1721292612;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NC/EJlTb4djABXHevBCwBYU8+nGumnqibnOq6D99iso=;
        b=AlDjy4iDgY5eBH0kslIVFfSczFt/uG2BH0ajPrc+Viq/IZ7m9ZHVNhj387g91Fuhji
         Kyx/Y/o/VP1k3T+CYLuQIp5HLCV5rNcqKyvgTPEWjxyLksihlN5X9KqKe2aCjU+vTGJm
         RzGK/JfY6UwfKNHjaenG2KZoQeAZtp17DakkVqPRYcIUEOR0J3Fk3pFRl0C62CXlO/47
         1XOq2EB6BNjCrX+W3LLJRfnfRwCrAIEblcs7ZSbX0dRkwNofgBb5oE1WI7ZSeC5n2XZP
         fXBowvEJjXzJGRUMHt3hlqQuYj9k8AsJHFomiQc4fZ5DVYPkdp+/uoUksc5dI07kmkhx
         dUag==
X-Forwarded-Encrypted: i=1; AJvYcCWIj6y5+h8FeoCWaBE0Bko3KbrGqKa/WGPHKmzxAUwiG4cjbQXiIHJhDW7osKDcOK5Qzjg+6Is+jdZsg0yzfSlLNz/xi9ZCl5ETBR3WLhg=
X-Gm-Message-State: AOJu0Yx0MrjMOwquyKJCINf1uODezQsZooF77PgFl1y8kSyRMKQn+0o3
	9pbAc7bER/4ryQrDZKv6AxsB+fuMj2gXt5nc2bo53OFOvw04Sm93
X-Google-Smtp-Source: AGHT+IGU7B0BRkEbWFRJdY/FZezhR+PeONszoujjl3Y3IoSCX9284GiSpPj8djjUG5FsVjjxGpuh9w==
X-Received: by 2002:a05:6402:3196:b0:58b:9561:650b with SMTP id 4fb4d7f45d1cf-594bb580796mr4462809a12.25.1720687811571;
        Thu, 11 Jul 2024 01:50:11 -0700 (PDT)
Message-ID: <a1224198ef6845f8f81baaaebe1d436726460c0e.camel@gmail.com>
Subject: Re: [PATCH v9 4/5] xen/riscv: enable GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 11 Jul 2024 10:50:10 +0200
In-Reply-To: <ca373d42-22f1-41a2-bdbb-4733145c635a@suse.com>
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
	 <c51c485bac43b7589961aabec8af1b82d4673b94.1719918148.git.oleksii.kurochko@gmail.com>
	 <ca373d42-22f1-41a2-bdbb-4733145c635a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-10 at 12:01 +0200, Jan Beulich wrote:
> On 02.07.2024 13:23, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/arch/riscv/Kconfig |=C2=A0 1 +
> > =C2=A0xen/arch/riscv/traps.c | 31 +++++++++++++++++++++++++++++++
> > =C2=A0xen/common/bug.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A03 files changed, 33 insertions(+)
> >=20
> > diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
> > index b4b354a778..74ad019fe7 100644
> > --- a/xen/arch/riscv/Kconfig
> > +++ b/xen/arch/riscv/Kconfig
> > @@ -5,6 +5,7 @@ config RISCV
> > =C2=A0config RISCV_64
> > =C2=A0	def_bool y
> > =C2=A0	select 64BIT
> > +	select GENERIC_BUG_FRAME
>=20
> Any particular reason to put this here, and not higher up with RISCV?
Yes, you are right it would be better to put it inside "config RISCV".

>=20
> > @@ -101,8 +102,38 @@ static void do_unexpected_trap(const struct
> > cpu_user_regs *regs)
> > =C2=A0=C2=A0=C2=A0=C2=A0 die();
> > =C2=A0}
> > =C2=A0
> > +static bool is_valid_bug_insn(uint32_t insn)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return insn =3D=3D BUG_INSN_32 ||
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (insn & C=
OMPRESSED_INSN_MASK) =3D=3D BUG_INSN_16;
> > +}
> > +
> > +/* Should be used only on Xen code */
> > +static uint32_t read_instr(unsigned long pc)
> > +{
> > +=C2=A0=C2=A0=C2=A0 uint16_t instr16 =3D *(uint16_t *)pc;
> > +
> > +=C2=A0=C2=A0=C2=A0 ASSERT(is_kernel_text(pc + 1) || is_kernel_inittext=
(pc + 1));
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( GET_INSN_LENGTH(instr16) =3D=3D 2 )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return instr16;
> > +
> > +=C2=A0=C2=A0=C2=A0 ASSERT(is_kernel_text(pc + 3) || is_kernel_inittext=
(pc + 3));
> > +
> > +=C2=A0=C2=A0=C2=A0 return *(uint32_t *)pc;
> > +}
>=20
> Related to the point made further down: If either of these assertions
> fails,
> won't we come back again right here? If either of the
> is_kernel_*text()
> wasn't working quite right, wouldn't we be at risk of entering an
> infinite
> loop (presumably not quite infinite because of the stack overflowing
> at some
> point)?
It is really possible to have infinite loop here so it should be better
to use 'if' with die() or panic().

>=20
> > =C2=A0void do_trap(struct cpu_user_regs *cpu_regs)
> > =C2=A0{
> > +=C2=A0=C2=A0=C2=A0 register_t pc =3D cpu_regs->sepc;
> > +=C2=A0=C2=A0=C2=A0 uint32_t instr =3D read_instr(pc);
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( ( is_valid_bug_insn(instr) ) && ( do_bug_frame=
(cpu_regs,
> > pc) >=3D 0 ) )
>=20
> No consideration of the kind of exception? I'd expect it is one very
> specific one which the BUG insn would raise, and then there's no
> point
> fetching the insn when it's a different kind of exception.
Good point.

We should have 0x3 ( breakpoint exception ) in scause register. We can
just check that without reading instruction and then also
is_valid_bug_insn could be dropped too.


>=20
> Further, nit: Certainly no need for the parentheses on the lhs of the
> &&.
> Having them on the rhs is a matter of taste, so okay, but then the
> blanks immediately inside will want dropping.

>=20
>=20
> > --- a/xen/common/bug.c
> > +++ b/xen/common/bug.c
> > @@ -1,6 +1,7 @@
> > =C2=A0#include <xen/bug.h>
> > =C2=A0#include <xen/errno.h>
> > =C2=A0#include <xen/kernel.h>
> > +#include <xen/lib.h>
> > =C2=A0#include <xen/livepatch.h>
> > =C2=A0#include <xen/string.h>
> > =C2=A0#include <xen/types.h>
>=20
> Unrelated change? Or did you simply forget to mention in the
> description
> why it's needed?
I added it to "Changes in ..." which I forgot to add, but I will add an
explanation to the description. It is better place for it.

<xen/lib.h> is needed to be included for the reason that panic() and
printk() is used in common/bug.c and RISC-V fails if it is not included
with the following errors:
   common/bug.c:69:9: error: implicit declaration of function 'printk'
   [-Werror=3Dimplicit-function-declaration]
      69 |         printk("Xen WARN at %s%s:%d\n", prefix, filename,
   lineno);
         |         ^~~~~~
   common/bug.c:77:9: error: implicit declaration of function 'panic'
   [-Werror=3Dimplicit-function-declaration]
      77 |         panic("Xen BUG at %s%s:%d\n", prefix, filename,
   lineno);
>=20
> ~ Oleksii


