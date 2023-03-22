Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C0E6C4BD6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 14:32:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513448.794451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyZh-000636-Fx; Wed, 22 Mar 2023 13:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513448.794451; Wed, 22 Mar 2023 13:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyZh-0005zv-Cx; Wed, 22 Mar 2023 13:32:21 +0000
Received: by outflank-mailman (input) for mailman id 513448;
 Wed, 22 Mar 2023 13:32:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhKM=7O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1peyZf-0005zn-RU
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 13:32:19 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f77cad05-c8b5-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 14:32:18 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id m35so11547880wms.4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 06:32:18 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 e24-20020a05600c219800b003ed1f111fdesm16583999wme.20.2023.03.22.06.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 06:32:17 -0700 (PDT)
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
X-Inumbo-ID: f77cad05-c8b5-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679491938;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7lhGIn8eAEzPuaiud0oZzfCoKovwdc6vpYKQWfJj/uo=;
        b=AhjmzWX6EO1uFc6cdeXv1+WK6gD5YZ+puR1JQPNHSR8Ecl7GrTorjv0Iu3rF/vXyqK
         qFpp4uaLkxb4hTsjOjmxLvT+bXDSj5LxN4V6/H8Bl5xPLB8YLV8QldmecGCUwHwhjSe+
         yblo4QrOrO4VofDhEMC49v4Q7GrXOwc9FETBNn2eukO+lRCFjPyamDF1krBoA1Aj9qD8
         O2afo3BDq5nR/VWrXQGH3Mrr9qVOgcxj5171J8ToAMUJrv6jmzG4vVNWZLgInVuL4lxy
         EsIcDdirVu3GPuNYbF1im6ZRJNx1f0hl+G95NA61Gc3ZQ9/pmgBdTANpuYG6Q/ZnzJnO
         XOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679491938;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lhGIn8eAEzPuaiud0oZzfCoKovwdc6vpYKQWfJj/uo=;
        b=uQ4fSNoGI34YlaW1Y/vHE91b5CFvqzcOVNyZyTxUP6LziLo4deFK+h6P29Df5JBqLD
         VumaurqO0rJTKOpEs/U9Lyn4JEogMz3yFmxceLm+jGtANbYpvRw9DKjCO7kpNdopieIh
         qFbLQbHPOcI17Kj7sDt4Tk+GH5Z+VAtUhg6Qa84Ic4/Kr4twzdIGty+4dPworwhxl+Vp
         Fz1jh3y2VGWGq5FGTS8Ip4IQXUupfQAygQWxTb5oshZpQktFAZFusRbbS9xQG178UO7+
         mD2kPRVshVUbY75wRlCGpPvuUv9LPiKqiMzMN/zzm7Zb0efp75JREh/v17OLqc+nVCVy
         J94A==
X-Gm-Message-State: AO0yUKU0WslZndpdC48bW2jj6MCc8QNHXwMpQLcWNO5H6qW7+d5XLAhJ
	tvaN296yfHtGfg7zVqKEwIU=
X-Google-Smtp-Source: AK7set/MXFF53mbfD7KcP+G76SxBwqJavpW9O4bi/PCmCJOfBHCnATS1r9gapFHTbmW3XY4iI6BVuA==
X-Received: by 2002:a7b:cb90:0:b0:3ed:31fa:f563 with SMTP id m16-20020a7bcb90000000b003ed31faf563mr5121535wmi.20.1679491938126;
        Wed, 22 Mar 2023 06:32:18 -0700 (PDT)
Message-ID: <98a891792446e72d910ee49a62c7e3b3d2d6c186.camel@gmail.com>
Subject: Re: [PATCH v5 4/7] xen/riscv: introduce decode_cause() stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>, Julien
 Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Date: Wed, 22 Mar 2023 15:32:14 +0200
In-Reply-To: <771418cf-9515-cc93-14c7-4bea60c30b2b@suse.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
	 <8c7b4a5d328be8b1cd2aa99c8d9a7883e4969600.1678976127.git.oleksii.kurochko@gmail.com>
	 <0b94be57-b8fb-6c38-9ed8-dc8482694153@xen.org>
	 <cf883a86eac88c11d02768eb64adb2b418c6ba2e.camel@gmail.com>
	 <771418cf-9515-cc93-14c7-4bea60c30b2b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-22 at 13:26 +0100, Jan Beulich wrote:
> On 22.03.2023 11:20, Oleksii wrote:
> > On Tue, 2023-03-21 at 17:33 +0000, Julien Grall wrote:
> > > On 16/03/2023 14:39, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/riscv/traps.c
> > > > +++ b/xen/arch/riscv/traps.c
> > > > @@ -4,10 +4,95 @@
> > > > =C2=A0=C2=A0 *
> > > > =C2=A0=C2=A0 * RISC-V Trap handlers
> > > > =C2=A0=C2=A0 */
> > > > +
> > > > +#include <xen/lib.h>
> > > > +
> > > > +#include <asm/boot-info.h>
> > > > +#include <asm/csr.h>
> > > > +#include <asm/early_printk.h>
> > > > =C2=A0 #include <asm/processor.h>
> > > > =C2=A0 #include <asm/traps.h>
> > > > =C2=A0=20
> > > > -void do_trap(struct cpu_user_regs *cpu_regs)
> > > > +static const char *decode_trap_cause(unsigned long cause)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 static const char *const trap_causes[] =3D {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_MISALIGNED_FETCH=
] =3D "Instruction Address
> > > > Misaligned",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_FETCH_ACCESS] =
=3D "Instruction Access Fault",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_ILLEGAL_INSTRUCT=
ION] =3D "Illegal Instruction",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_BREAKPOINT] =3D =
"Breakpoint",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_MISALIGNED_LOAD]=
 =3D "Load Address Misaligned",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_LOAD_ACCESS] =3D=
 "Load Access Fault",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_MISALIGNED_STORE=
] =3D "Store/AMO Address
> > > > Misaligned",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_STORE_ACCESS] =
=3D "Store/AMO Access Fault",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_USER_ECALL] =3D =
"Environment Call from U-Mode",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_SUPERVISOR_ECALL=
] =3D "Environment Call from S-
> > > > Mode",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_MACHINE_ECALL] =
=3D "Environment Call from M-
> > > > Mode",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_FETCH_PAGE_FAULT=
] =3D "Instruction Page Fault",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_LOAD_PAGE_FAULT]=
 =3D "Load Page Fault",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_STORE_PAGE_FAULT=
] =3D "Store/AMO Page Fault",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_FETCH_GUEST_PAGE=
_FAULT] =3D "Instruction Guest
> > > > Page
> > > > Fault",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_LOAD_GUEST_PAGE_=
FAULT] =3D "Load Guest Page
> > > > Fault",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_VIRTUAL_INST_FAU=
LT] =3D "Virtualized Instruction
> > > > Fault",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_STORE_GUEST_PAGE=
_FAULT] =3D "Guest Store/AMO Page
> > > > Fault",
> > > > +=C2=A0=C2=A0=C2=A0 };
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( cause < ARRAY_SIZE(trap_causes) && trap_ca=
uses[cause]
> > > > )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return trap_causes[caus=
e];
> > > > +=C2=A0=C2=A0=C2=A0 return "UNKNOWN";
> > > > +}
> > > > +
> > > > +static const char *decode_reserved_interrupt_cause(unsigned
> > > > long
> > > > irq_cause)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 switch ( irq_cause )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0 case IRQ_M_SOFT:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "M-mode Software=
 Interrupt";
> > > > +=C2=A0=C2=A0=C2=A0 case IRQ_M_TIMER:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "M-mode TIMER In=
terrupt";
> > > > +=C2=A0=C2=A0=C2=A0 case IRQ_M_EXT:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "M-mode External=
 Interrupt";
> > > > +=C2=A0=C2=A0=C2=A0 default:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "UNKNOWN IRQ typ=
e";
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +}
> > > > +
> > > > +static const char *decode_interrupt_cause(unsigned long cause)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long irq_cause =3D cause & ~CAUSE_IRQ_=
FLAG;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 switch ( irq_cause )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0 case IRQ_S_SOFT:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "Supervisor Soft=
ware Interrupt";
> > > > +=C2=A0=C2=A0=C2=A0 case IRQ_S_TIMER:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "Supervisor Time=
r Interrupt";
> > > > +=C2=A0=C2=A0=C2=A0 case IRQ_S_EXT:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "Supervisor Exte=
rnal Interrupt";
> > > > +=C2=A0=C2=A0=C2=A0 default:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return decode_reserved_=
interrupt_cause(irq_cause);
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +}
> > > > +
> > > > +static const char *decode_cause(unsigned long cause)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 if ( cause & CAUSE_IRQ_FLAG )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return decode_interrupt=
_cause(cause);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 return decode_trap_cause(cause);
> > > > +}
> > > > +
> > > > +static void do_unexpected_trap(const struct cpu_user_regs
> > > > *regs)
> > > > =C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long cause =3D csr_read(CSR_SCAUSE);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 early_printk("Unhandled exception: ");
> > > > +=C2=A0=C2=A0=C2=A0 early_printk(LINK_TO_LOAD(decode_cause(cause)))=
;
> > >=20
> > > The use of LINK_TO_LOAD is the sort of things that is worth
> > > documenting=20
> > > because this would raise quite a few questions.
> > >=20
> > > The comment on top of LINK_TO_LOAD suggests the macro can only be
> > > used=20
> > > while the MMU is off. But I would expect do_unexpected_trap() to
> > > be
> > > used=20
> > > also after the MMU is on. Isn't it going to be the case?
> > Yes, you are right. it will be an issue now. It was not an issue
> > before
> > when it was used 1:1 mapping. So I have to add a check 'if (
> > is_mmu_enabled ) ... ' inside LINK_TO_LOAD macros.
>=20
> I don't think that's going to be enough: What decode_cause() returns
> may be a link-time value when a result of reading from trap_causes[],
> but - as Julien did say already - it can also be a runtime value when
> coming from any of the "return <string-literal>", calculated in a PC-
> relative way. I guess you will need to apply LINK_TO_LOAD() to the
> trap_causes[] access itself.
Probably you are right here.

>=20
> But as said before - I'm unconvinced this approach will scale,
> because
> you'll need to apply the wrapper to anything which can be reached
> prior
> to you enabling the MMU. Whether you can contain this to RISC-V-only
> code is unclear; I don't think it'll be acceptable to change any part
> of common code to meet your special needs.
But it looks like it is only two places where it should be done:
1. As you mentioned LINK_TO_LOAD() should be applied for trap_causes.
2. And it should be applied inside do_bug_frame() for getting an
start/end address of bug_frame. I want to note that do_bug_frame() will
be removed after RISC-V is ready to switch to generic bug
implementation.

The next step after the current patch series is merged is to enable
MMU, so it shouldn't be new use cases where it is needed to use
LINK_TO_LOAD().

If it is not acceptable to change any part of common code ( as I
understand in this case it is do_unexpected_trap() and all that is
called inside it ) have I to introduce two types of function
do_unexpected_trap() for when MMU is enabled and not?

I have a strong feeling that I misunderstood you...

~ Oleksii

