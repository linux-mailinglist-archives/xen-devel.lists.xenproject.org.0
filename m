Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D776ED121
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 17:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525482.816711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxvl-0002jE-DC; Mon, 24 Apr 2023 15:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525482.816711; Mon, 24 Apr 2023 15:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxvl-0002fo-9i; Mon, 24 Apr 2023 15:16:41 +0000
Received: by outflank-mailman (input) for mailman id 525482;
 Mon, 24 Apr 2023 15:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIvg=AP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pqxvj-0002fi-UF
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 15:16:40 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 025cfaeb-e2b3-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 17:16:38 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4ec9c7c6986so4749713e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Apr 2023 08:16:38 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056512014600b004efd3c2b746sm1297463lfo.162.2023.04.24.08.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 08:16:37 -0700 (PDT)
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
X-Inumbo-ID: 025cfaeb-e2b3-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682349398; x=1684941398;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d24bZOk6Pj50vCvUQOlE/p+ytm74tbHWHSWQcyWROMU=;
        b=IDDsrE4w6TkNxZQBPmYvYL6M5Q5tzrYtIoPpZMZkZWtfpWmKd5cCaqKUMdKlhs7u8c
         ANlvRltB4uNCMnWCfjT4cWwJ+DxQehWRQDyBtVvRAAkUCYWP2nfNlCxfu4u0V+pmEFKy
         prjQ/kgxSbt2IMEgnKq0aYqQg81dd31HDFo0Ngt5323w4O6Bmm1gVRw/Hsoufzi4P9BO
         C5Z1WqHnyo0I6zxnBrp+clpOWRDi2QzJSYKL1GgzIAzRlhU6LRxs59omJKMAVEzOmRnj
         p7D676pWroHdaeSc8Ai+NjfpzPrBltT3lxrQ8sxsVo3h/2Tta2ctIzc0ugit7v7Ji70o
         sVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682349398; x=1684941398;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d24bZOk6Pj50vCvUQOlE/p+ytm74tbHWHSWQcyWROMU=;
        b=UxRKGIFodB7QbVoEM3BtSsTZMjS7DM6f6+cpK3YFyiKyrp31F9hdmgTOn4Om3gd+U+
         9EEdnsDxcn+MYxOufaMX9+eiEi/rbiauJcC38Kh1V14HRO9YyN1juV7Vc+WtYnc0Vgdf
         Curv9UM8Fr9AJZXMBw+W7I4OQc5b9dxGxb9aIZg4RB1CugvvOXr2UZsep2K2ZuN+/wRv
         KmDIRqtVdIHc4fbQN0vNgAQzbvy+Sg6v9QWFF5Xz9wgA8kbhQV2skBSMB3TpTNxkjFCi
         vyfVHEYhub54CRQcw6UGqsfTCqpk54NS+YrweWKMhtRAHScGQsH6+l+OIIpb2Jv90eFs
         wo+Q==
X-Gm-Message-State: AC+VfDzshJKeX1rSQqL916uADgTlYuH/hIrqTE8jYkiMxTsnv1/jw7WU
	JSud/vchveXSGc2GsYRMfR8=
X-Google-Smtp-Source: ACHHUZ4uq3bCFiT9y+9htoE+Wn4hqG2R4xyFcx7lGQFBszBntU4By9mWiLUqrBdyOg0lGyMWYVmmdQ==
X-Received: by 2002:ac2:5282:0:b0:4ef:f509:1186 with SMTP id q2-20020ac25282000000b004eff5091186mr640773lfm.1.1682349397746;
        Mon, 24 Apr 2023 08:16:37 -0700 (PDT)
Message-ID: <3d440048717892fe5d3ed7fe3255dc8c9f5d38a3.camel@gmail.com>
Subject: Re: [PATCH v5 2/4] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Mon, 24 Apr 2023 18:16:36 +0300
In-Reply-To: <53257ae8-d306-8c7e-35ff-f3bc3947849b@suse.com>
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
	 <5b27693bcdf6d64381314aeef72cfe03dee8d73a.1681918194.git.oleksii.kurochko@gmail.com>
	 <67d8574f-2e0d-4eb6-19aa-67fe7645e35a@suse.com>
	 <ea2d5cfabb9ada64eb975369779ca430f38e9eec.camel@gmail.com>
	 <53257ae8-d306-8c7e-35ff-f3bc3947849b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0 (3.48.0-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-04-24 at 12:18 +0200, Jan Beulich wrote:
> On 21.04.2023 18:01, Oleksii wrote:
> > On Thu, 2023-04-20 at 16:36 +0200, Jan Beulich wrote:
> > > On 19.04.2023 17:42, Oleksii Kurochko wrote:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 panic(), <asm/bug.h> aren't ready
> > > > now.
> > > > */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 di=
e();
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Point to next page *=
/
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page_addr +=3D XEN_PT_L=
EVEL_SIZE(0);
> > >=20
> > > Seeing this as well as the loop heading - maybe more suitable as
> > > a
> > > for(;;) loop?
> > I am not sure that I understand the benefits of changing "while (
> > page_addr < map_end )" to "for(;;)".
> > Could you please explain me what the benefits are?
>=20
> The common case of using while() is in situations where one cannot
> use for(). for() is (imo) preferable in all cases where the third of
> the controlling expressions isn't empty (and is to be carried out
> after every iteration): Any use of "continue" inside the loop will
> then properly effect loop progress. (Of course there are cases where
> this behavior isn't wanted; that's where while() may come into play
> then.)
Thanks for clarification. Now it is more clear.
>=20
> > > > +=C2=A0=C2=A0=C2=A0 csr_write(CSR_SATP,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ((unsigned long)stage1_pgtbl_root >> PAGE_SHIFT)
> > > > |
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 satp_mode << SATP_MODE_SHIFT);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( (csr_read(CSR_SATP) >> SATP_MODE_SHIFT) =
=3D=3D satp_mode
> > > > )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is_mode_supported =3D t=
rue;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /* Clean MMU root page table and disable MMU */
> > > > +=C2=A0=C2=A0=C2=A0 stage1_pgtbl_root[index] =3D paddr_to_pte(0x0, =
0x0);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 csr_write(CSR_SATP, 0);
> > > > +=C2=A0=C2=A0=C2=A0 asm volatile("sfence.vma");
> > >=20
> > > I guess what you do in this function could do with some more
> > > comments.
> > > Looks like you're briefly enabling the MMU to check that what you
> > > wrote
> > > to SATP you can also read back. (Isn't there a register reporting
> > > whether the feature is available?)
> > I supposed that it has to be but I couldn't find a register in
> > docs.
>=20
> Well, yes, interestingly the register is marked WARL, so apparently
> intended to by used for probing like you do. (I find the definition
> of
> WARL a little odd though, as such writes supposedly aren't
> necessarily
> value preserving. For SATP this might mean that translation is
> enabled
> by a write of an unsupported mode, with a different number of levels.
> This isn't going to work very well, I'm afraid.)
Agree. It will be an issue in case of a different number of levels.

Then it looks there is no way to check if SATP mode is supported.

So we have to rely on the fact that the developer specified
RV_STAGE1_MODE correctly in the config file.

>=20
> > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Stack should be re-inited as:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * 1. Right now an address of the stack is=
 relative to
> > > > load
> > > > time
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 addresses what will c=
ause an issue in case of load
> > > > start
> > > > address
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 isn't equal to linker=
 start address.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * 2. Addresses in stack are all load time=
 relative which
> > > > can
> > > > be an
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 issue in case when lo=
ad start address isn't equal to
> > > > linker
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 start address.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 asm volatile ("mv sp, %0" : : "r"((unsigned
> > > > long)cpu0_boot_stack + STACK_SIZE));
> > >=20
> > > Nit: Style (overly long line).
> > >=20
> > > What's worse - I don't think it is permitted to alter sp in the
> > > middle of
> > > a function. The compiler may maintain local variables on the
> > > stack
> > > which
> > > don't correspond to any programmer specified ones, including
> > > pointer
> > > ones
> > > which point into the stack frame. This is specifically why both
> > > x86
> > > and
> > > Arm have switch_stack_and_jump() macros.
> > but the macros (from ARM) looks equal to the code mentioned above:
> > #define switch_stack_and_jump(stack, fn) do
> > {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=20
> > \
> > =C2=A0=C2=A0=C2=A0 asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack=
), "X" (fn)
> > :
> > "memory" ); \
>=20
> Note how writing SP and branch are contained in a single asm() there.
> By checking ...
>=20
> > =C2=A0=C2=A0=C2=A0
> > unreachable();=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=20
> > \
> > } while ( false )
> >=20
> > Here is part of disassembled enable_mmu():
> >=20
> > ffffffffc004aedc:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 18079073=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 csrw=C2=A0=C2=A0=C2=A0 satp,a5
> > ffffffffc004aee0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00016797=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 auipc=C2=A0=C2=A0 a5,0x16
> > ffffffffc004aee4:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12078793=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 addi=C2=A0=C2=A0=C2=A0 a5,a5,288
> > ffffffffc004aee8:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 813e=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sp,a5
> > ffffffffc004af00:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0f4000ef=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 jal=C2=A0=C2=A0=C2=A0=20
> > ra,ffffffffc004aff4 <cont_after_mmu_is_enabled>
> > ...
>=20
> ... what the generated code in your case is you won't guarantee that
> things remain that way with future (or simply different) compilers.
Agree. Thanks for clarification. I'll take into account during the next
version of patch series.

>=20
> > > > --- a/xen/arch/riscv/riscv64/head.S
> > > > +++ b/xen/arch/riscv/riscv64/head.S
> > > > @@ -1,4 +1,5 @@
> > > > =C2=A0#include <asm/asm.h>
> > > > +#include <asm/asm-offsets.h>
> > > > =C2=A0#include <asm/riscv_encoding.h>
> > > > =C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .section .text.hea=
der, "ax", %progbits
> > > > @@ -32,3 +33,4 @@ ENTRY(start)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=
=A0=C2=A0 sp, sp, t0
> > > > =C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tail=C2=A0=C2=A0=
=C2=A0 start_xen
> > > > +
> > >=20
> > > ???
> > Shouldn't it be the one empty line at the end of a file?
>=20
> There should be a newline at the end of a file, but not normally a
> blank one. When you introduce a new file, it can be viewed as a
> matter
> of taste whether to have an empty last line, but when you have a
> seemingly unrelated change to a file like the one here, this is at
> least odd.
Agree. Then I'll remove this change from the patch series.

>=20
> > > > --- a/xen/arch/riscv/xen.lds.S
> > > > +++ b/xen/arch/riscv/xen.lds.S
> > > > @@ -136,6 +136,7 @@ SECTIONS
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_ALIGN);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 __init_end =3D .;
> > > > =C2=A0
> > > > +=C2=A0=C2=A0=C2=A0 . =3D ALIGN(PAGE_SIZE);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 .bss : {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* BSS */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __bss_start =3D .;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bss.stack_align=
ed)
> > >=20
> > > Why do you need this? You properly use __aligned(PAGE_SIZE) for
> > > the
> > > page tables you define, and PAGE_SIZE wouldn't be enough here
> > > anyway
> > > if STACK_SIZE > PAGE_SIZE (as .bss.stack_aligned comes first).
> > > The
> > > only time you'd need such an ALIGN() is if the following label
> > > (__bss_start in this case) needed to be aligned at a certain
> > > boundary. (I'm a little puzzled though that __bss_start isn't
> > > [immediately] preceded by ". =3D ALIGN(POINTER_ALIGN);" - didn't
> > > .bss
> > > clearing rely on such alignment?)
> > ALIGN(PAGE_SIZE)=C2=A0 isn't needed anymore.
> > I used it to have 4k aligned physical address for PTE when I mapped
> > each section separately ( it was so in the previous verstion of MMU
> > patch series )
> >=20
> > Regarding ". =3D ALIGN(POINTER_ALIGN);" I would say that it is enough
> > to
> > have aligned __bss_end ( what was done ) to be sure that we can
> > clear
> > __SIZEOF_POINTER__ bytes each iteration of .bss clearing loop and
> > don't
> > worry that size of .bss section may not be divisible by
> > __SIZEOF_POINTER__.
>=20
> How would guaranteeing this only for __bss_end help? __bss_start
> could
> still be misaligned, and then you'd
> (a) use misaligned stores for clearing and
> (b) extend clearing to outside of the .bss (as the last of the
> misaligned
> stores would cross the __bss_end boundary).
It seems you are right. I'll create a separate commit to align
__bss_start properly.

~ Oleksii

