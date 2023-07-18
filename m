Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 577A0757F59
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 16:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565313.883358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLlaP-0003cs-WB; Tue, 18 Jul 2023 14:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565313.883358; Tue, 18 Jul 2023 14:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLlaP-0003bD-Sp; Tue, 18 Jul 2023 14:21:57 +0000
Received: by outflank-mailman (input) for mailman id 565313;
 Tue, 18 Jul 2023 14:21:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CPt9=DE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qLlaO-0003b5-H4
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 14:21:56 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7286d1e0-2576-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 16:21:55 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b708e49059so90133331fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jul 2023 07:21:55 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a2e86d4000000b002b6e121cf1fsm517683ljj.4.2023.07.18.07.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 07:21:54 -0700 (PDT)
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
X-Inumbo-ID: 7286d1e0-2576-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689690115; x=1692282115;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k8HIMpvtruNXSZvbqPmqYdW1IxWDth5PLXIw8/iOSRY=;
        b=KI9zDtfFBYljQNES+q32ai0AAvauta4/td27XyZ49rd9degHAKZ8j6PBtVvYE54nqq
         uoNOecNbTKHFHntke2wPwzRp/kk7W21nmIzPfa0NADMwKD0mhaiOttF/HyP4k5i+fLsA
         qjAg4WsrNxmJEvO5jAgoyJSsQxfmMhavLZgVx641e4UZidJk7z7sIgWqu/qt4TLSMF11
         02riH4+o6nzx6cMryCziupFwQcwrE60UrtTEFgyqLF8DgKtxt9W87S+Dzu6PWx5JR2FA
         /SoeP5vfdfF6p3r05kFOVr7vsh381nARXWe9KIDSK1ViUTxwsTbj0YBTW+rTBWHHRsbG
         FwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690115; x=1692282115;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k8HIMpvtruNXSZvbqPmqYdW1IxWDth5PLXIw8/iOSRY=;
        b=cL45RnDH7x40yV7KPYjd0X6JJYG5twb3wTTvI+G+P+vwenYX16Giq+iNYT7zXhU0oY
         5tyiIYmqZzQGlnr7zf/vgbpAsgObjxR1OOPEBFTRjYmxLFdJBNITKfCglZzc/0bOkW2Y
         azWNYpTIlup8nBrfFqB4VjrPVFE1Qhga7RVjT+19oW+6esTu+F6LnZ2Djtw0QYJHUFVE
         YNoB2s+U6mh931UnW7nb31risQ97xoEmH5nmBok5bZROWkWehXMsJ8XCzFX2sWLTBbO4
         alqTA2cCVq3SX2lnhPv9ym9rhjRxy6JvkWAMw+4/+6giXTiG/7tECI05BGa/PEMA4c6Q
         q4kw==
X-Gm-Message-State: ABy/qLa/2U33nZtTxWRUXm68y23ONKVwJHmJr1brcj/o6dmirH0KjZtb
	lbJqGR4eOG2SPIwF8WhNHf8=
X-Google-Smtp-Source: APBJJlH2KzFyzXcRyaaFRga1jCq+pv5MHz2pXT8Sq6ayTrHV1wKbMtlehGKtmsKiL18GuYaqtvahQg==
X-Received: by 2002:a2e:9d83:0:b0:2b6:de6d:8148 with SMTP id c3-20020a2e9d83000000b002b6de6d8148mr10321396ljj.31.1689690114676;
        Tue, 18 Jul 2023 07:21:54 -0700 (PDT)
Message-ID: <b40e6b9752ab013381ac65da7ade1351cf63eaaa.camel@gmail.com>
Subject: Re: [PATCH v3 2/3] xen/riscv: introduce function for physical
 offset calculation
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 18 Jul 2023 17:21:53 +0300
In-Reply-To: <5cec8802-a109-2a0c-10e2-803fdfcb9cf1@suse.com>
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
	 <f86724014bf5234f22cd18e7b3da8e8aa83e1e08.1689604562.git.oleksii.kurochko@gmail.com>
	 <5cec8802-a109-2a0c-10e2-803fdfcb9cf1@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-07-17 at 16:58 +0200, Jan Beulich wrote:
> On 17.07.2023 16:40, Oleksii Kurochko wrote:
> > The function was introduced to calculate and save physical
> > offset before MMU is enabled because access to start() is
> > PC-relative and in case of linker_addr !=3D load_addr it will
> > result in incorrect value in phys_offset.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V3:
> > =C2=A0- save/restore of a0/a1 registers before C first function call.
> > ---
> > Changes in V2:
> > =C2=A0 - add __ro_after_init for phys_offset variable.
> > =C2=A0 - remove double blank lines.
> > =C2=A0 - add __init for calc_phys_offset().
> > =C2=A0 - update the commit message.
> > =C2=A0 - declaring variable phys_off as non static as it will be used i=
n
> > head.S.
> > ---
> > =C2=A0xen/arch/riscv/include/asm/mm.h |=C2=A0 2 ++
> > =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++++++++++++---
> > =C2=A0xen/arch/riscv/riscv64/head.S=C2=A0=C2=A0 | 14 ++++++++++++++
> > =C2=A03 files changed, 31 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/xen/arch/riscv/include/asm/mm.h
> > b/xen/arch/riscv/include/asm/mm.h
> > index 5e3ac5cde3..d9c4205103 100644
> > --- a/xen/arch/riscv/include/asm/mm.h
> > +++ b/xen/arch/riscv/include/asm/mm.h
> > @@ -15,4 +15,6 @@ void setup_initial_pagetables(void);
> > =C2=A0void enable_mmu(void);
> > =C2=A0void cont_after_mmu_is_enabled(void);
> > =C2=A0
> > +void calc_phys_offset(void);
> > +
> > =C2=A0#endif /* _ASM_RISCV_MM_H */
> > diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> > index fddb3cd0bd..c84a8a7c3c 100644
> > --- a/xen/arch/riscv/mm.c
> > +++ b/xen/arch/riscv/mm.c
> > @@ -1,5 +1,6 @@
> > =C2=A0/* SPDX-License-Identifier: GPL-2.0-only */
> > =C2=A0
> > +#include <xen/cache.h>
> > =C2=A0#include <xen/compiler.h>
> > =C2=A0#include <xen/init.h>
> > =C2=A0#include <xen/kernel.h>
> > @@ -19,9 +20,10 @@ struct mmu_desc {
> > =C2=A0=C2=A0=C2=A0=C2=A0 pte_t *pgtbl_base;
> > =C2=A0};
> > =C2=A0
> > -#define PHYS_OFFSET ((unsigned long)_start - XEN_VIRT_START)
> > -#define LOAD_TO_LINK(addr) ((addr) - PHYS_OFFSET)
> > -#define LINK_TO_LOAD(addr) ((addr) + PHYS_OFFSET)
> > +unsigned long __ro_after_init phys_offset;
> > +
> > +#define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
> > +#define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
> > =C2=A0
> > =C2=A0/*
> > =C2=A0 * It is expected that Xen won't be more then 2 MB.
> > @@ -273,3 +275,13 @@ void __init noreturn noinline enable_mmu()
> > =C2=A0=C2=A0=C2=A0=C2=A0 switch_stack_and_jump((unsigned long)cpu0_boot=
_stack +
> > STACK_SIZE,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 cont_after_mmu_is_enabled);
> > =C2=A0}
> > +
> > +/*
> > + * calc_phys_offset() should be used before MMU is enabled because
> > access to
> > + * start() is PC-relative and in case when load_addr !=3D
> > linker_addr phys_offset
> > + * will have an incorrect value
> > + */
> > +void __init calc_phys_offset(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 phys_offset =3D (unsigned long)start - XEN_VIRT_STA=
RT;
> > +}
> > diff --git a/xen/arch/riscv/riscv64/head.S
> > b/xen/arch/riscv/riscv64/head.S
> > index 2c0304646a..9015d06233 100644
> > --- a/xen/arch/riscv/riscv64/head.S
> > +++ b/xen/arch/riscv/riscv64/head.S
> > @@ -29,6 +29,20 @@ ENTRY(start)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=A0=C2=A0=
=C2=A0 reset_stack
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * save hart_id and dt=
b_base as a0 and a1 register can be
> > used
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * by C code ( f.e. se=
tup_initial_pagetables will update
> > a0 and
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * a1 )
>=20
> I'd recommend dropping the part in parentheses - for one the function
> doesn't exist yet, and then you're merely restating what the ABI has.
Thanks. I'll do that.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 s0, a0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 s1, a1
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=A0=C2=A0=C2=A0=
 calc_phys_offset
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* restore bootcpu_id and d=
tb address */
>=20
> Is the first name here intentionally different from that in the other
> comment (where it's "hart_id")?
Only one reason for that is that bootcpu_id is used an argument of
start_xen() function. But generally I missed it to sync with the name
above.

Probably it would be better to use 'bootcpu' everywhere instead of
'hart_id' as it is 'architecture independent way' to name CPU.

So I can update the comment above to: 'hart_id ( bootcpu_id )' ( as it
was done in the comment above ENTRY(start) ) or just bootcpu_id.

~ Oleksii

