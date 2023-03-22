Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDC46C4E7B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 15:50:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513498.794577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pezmj-0004pY-Hw; Wed, 22 Mar 2023 14:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513498.794577; Wed, 22 Mar 2023 14:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pezmj-0004nC-Dy; Wed, 22 Mar 2023 14:49:53 +0000
Received: by outflank-mailman (input) for mailman id 513498;
 Wed, 22 Mar 2023 14:49:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhKM=7O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pezmh-0004n6-EB
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 14:49:51 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb48679d-c8c0-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 15:49:49 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 t17-20020a05600c451100b003edc906aeeaso688901wmo.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 07:49:49 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c1d8b00b003daffc2ecdesm22922510wms.13.2023.03.22.07.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 07:49:47 -0700 (PDT)
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
X-Inumbo-ID: cb48679d-c8c0-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679496588;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5+O595nJfW/ul+a9+wvbJvHblIpilkzfopMuW5JZfyU=;
        b=b0AhV3Nl8BRdEld7RgzxdXc6JxsRlqjHjKnrYyGy2dPssE0XdXpc3MOFOglpQuYsT3
         /qH9AqxHibyZiGHVCqRisGtW8oGXzvQw+Yf7af7hhEXCmOGiRbD6bbsHipnqqDb7Tn8X
         g/vLsjczfjVRQsCIbcnVaQaISKg4pWn0I54IL2OktJDXWLPYNehJCZCCtkcvCzvGH52V
         DD84W/OOu11C4ERK7raxAD9BrFyWGOa+WcsJAftd3HgGpjDvZvlLhljSsz4FfStZaI2L
         jqblTfCtbG9RNNzIxjXAzdSdrkaJpBBvrISPxq6X1SRyzCCOQXoX+JR/2yPGsxZEkcFs
         f7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679496588;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5+O595nJfW/ul+a9+wvbJvHblIpilkzfopMuW5JZfyU=;
        b=rAOtadqwGFRJNU4BUZKbkont1/ayUuRACbO8xJ5z1R/MCgxskRDLyziKUcf7+eydhk
         5dGNKXe+dff+f18u7XfaDzTjwyMSH5D6J3RiVR3WZtQZQGJEJJXXtG2gc/1qRXjSpIDM
         2JVL5ETPupOE5afSwiBOQ0z6qS0M3IbmVF+HFwwrovcxmOulFSGtHyWeNl7GYWVcA6zC
         dxKpnzDP7LEUmNwcXnZ7TEGAyBQhQt/iDycmsuvHpD1Etl+Kz2cUsMSpiegxtOlgaN7X
         JbzRcOxLwOQ+0x+R3fLLa9akcVhOggPvZQOWtaHM4yZsoQjsYhJmbEKp6hEmQg2ybQXD
         PJZw==
X-Gm-Message-State: AO0yUKXplHVEChSauLu461o1Ub7R4rV2qbz2mxySrIbGa4pE2sLElb36
	K5YucqGakLJbPbw/C5/E1/8=
X-Google-Smtp-Source: AK7set+7wVV9lqCYp7Bvkxg3Bqp9/ZJilC1DfX609BB/RPcj2IpV/aDe2NMETAL6U+H5+In/jMOf/A==
X-Received: by 2002:a05:600c:ad4:b0:3ed:2709:2edf with SMTP id c20-20020a05600c0ad400b003ed27092edfmr6239884wmr.13.1679496588184;
        Wed, 22 Mar 2023 07:49:48 -0700 (PDT)
Message-ID: <59742220a7c167cd0fcec44b8ad30202737d47d7.camel@gmail.com>
Subject: Re: [PATCH v5 5/7] xen/riscv: introduce trap_init()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Wed, 22 Mar 2023 16:49:45 +0200
In-Reply-To: <af0d3509-9be4-19d7-8f5d-1c0596a63d15@xen.org>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
	 <91b0284d20f530f2795a119ccb7436ee0b800256.1678976127.git.oleksii.kurochko@gmail.com>
	 <5a2c6f35-373a-de3c-1db2-aeeb1b39635f@xen.org>
	 <520d64f0b6cd283416aa4fb7b9baa5f83454c4a8.camel@gmail.com>
	 <fb5632f9-d749-4396-930e-9f2a601720d8@xen.org>
	 <370a6e223d8db5f2d075ca8aba31db198a3aefce.camel@gmail.com>
	 <af0d3509-9be4-19d7-8f5d-1c0596a63d15@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-22 at 13:51 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 22/03/2023 13:40, Oleksii wrote:
> > On Wed, 2023-03-22 at 12:14 +0000, Julien Grall wrote:
> > >=20
> > >=20
> > > On 22/03/2023 11:33, Oleksii wrote:
> > > > Hi Julien,
> > >=20
> > > Hi Oleksii,
> > >=20
> > > >=20
> > > > On Tue, 2023-03-21 at 17:42 +0000, Julien Grall wrote:
> > > > > Hi Oleksii,
> > > > >=20
> > > > > On 16/03/2023 14:39, Oleksii Kurochko wrote:
> > > > > > Signed-off-by: Oleksii Kurochko
> > > > > > <oleksii.kurochko@gmail.com>
> > > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > ---
> > > > > > Changes in V5:
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 - Nothing changed
> > > > > > ---
> > > > > > Changes in V4:
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 - Nothing changed
> > > > > > ---
> > > > > > Changes in V3:
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 - Nothing changed
> > > > > > ---
> > > > > > Changes in V2:
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 - Rename setup_trap_handler() to trap_=
init().
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 - Add Reviewed-by to the commit messag=
e.
> > > > > > ---
> > > > > > =C2=A0=C2=A0=C2=A0 xen/arch/riscv/include/asm/traps.h | 1 +
> > > > > > =C2=A0=C2=A0=C2=A0 xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++++
> > > > > > =C2=A0=C2=A0=C2=A0 xen/arch/riscv/traps.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 +++++++
> > > > > > =C2=A0=C2=A0=C2=A0 3 files changed, 13 insertions(+)
> > > > > >=20
> > > > > > diff --git a/xen/arch/riscv/include/asm/traps.h
> > > > > > b/xen/arch/riscv/include/asm/traps.h
> > > > > > index f3fb6b25d1..f1879294ef 100644
> > > > > > --- a/xen/arch/riscv/include/asm/traps.h
> > > > > > +++ b/xen/arch/riscv/include/asm/traps.h
> > > > > > @@ -7,6 +7,7 @@
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0 void do_trap(struct cpu_user_regs *cpu_regs)=
;
> > > > > > =C2=A0=C2=A0=C2=A0 void handle_trap(void);
> > > > > > +void trap_init(void);
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0 #endif /* __ASSEMBLY__ */
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > diff --git a/xen/arch/riscv/setup.c
> > > > > > b/xen/arch/riscv/setup.c
> > > > > > index 36556eb779..b44d105b5f 100644
> > > > > > --- a/xen/arch/riscv/setup.c
> > > > > > +++ b/xen/arch/riscv/setup.c
> > > > > > @@ -3,7 +3,9 @@
> > > > > > =C2=A0=C2=A0=C2=A0 #include <xen/kernel.h>
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0 #include <asm/boot-info.h>
> > > > > > +#include <asm/csr.h>
> > > > > > =C2=A0=C2=A0=C2=A0 #include <asm/early_printk.h>
> > > > > > +#include <asm/traps.h>
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0 /* Xen stack for bringing up the first CPU. =
*/
> > > > > > =C2=A0=C2=A0=C2=A0 unsigned char __initdata cpu0_boot_stack[STA=
CK_SIZE]
> > > > > > @@ -32,7 +34,10 @@ void __init noreturn start_xen(unsigned
> > > > > > long
> > > > > > bootcpu_id,
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fill_boot_info();
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > +=C2=A0=C2=A0=C2=A0 trap_init();
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("All se=
t up\n");
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ( ;; )
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 asm volatile ("wfi");
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > diff --git a/xen/arch/riscv/traps.c
> > > > > > b/xen/arch/riscv/traps.c
> > > > > > index 8a1529e0c5..581f34efbc 100644
> > > > > > --- a/xen/arch/riscv/traps.c
> > > > > > +++ b/xen/arch/riscv/traps.c
> > > > > > @@ -13,6 +13,13 @@
> > > > > > =C2=A0=C2=A0=C2=A0 #include <asm/processor.h>
> > > > > > =C2=A0=C2=A0=C2=A0 #include <asm/traps.h>
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > +void trap_init(void)
> > > > > > +{
> > > > > > +=C2=A0=C2=A0=C2=A0 unsigned long addr =3D (unsigned long)&hand=
le_trap;
> > > > >=20
> > > > > It is not super clear to me whether this is going to store
> > > > > the
> > > > > virtual
> > > > > or physical address.
> > > > Actually it is going to store both the virtual and physical
> > > > address.
> > > > Depending on if MMU is enabled or not.
> > >=20
> > > I think some comment in the code would be really good because
> > > this
> > > is...
> > >=20
> > > > >=20
> > > > > Depending on the answer, the next would be whether the value
> > > > > would
> > > > > still
> > > > > be valid after the MMU is turned on?
> > > > It would still be valid because for addr will be generated PC-
> > > > relative
> > > > address.
> > >=20
> > > ... not clear to me what would guarantee that Xen is compiled
> > > with
> > > -noPIE. Is the cmodel?
>=20
> There is a missing "given" after "that".
>=20
> > There is a patch:
> > https://lore.kernel.org/xen-devel/2785518800dce64fafb3096480a5ae4c4e026=
bcb.1678970065.git.oleksii.kurochko@gmail.com/
> > Which guarantees that Xen is complied with -noPIE.
> I am a bit puzzled with what you wrote. From my understanding, with=20
> -noPIE, the compiler would be free to use absolute address rather
> than=20
> pc-relative one.=C2=A0Do you have any pointer to documentation that would=
=20
> back your reasoning?

https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf
If look at pseudoinstructions (p110 in pdf) which work with addresses
they are always pc-relative ( they all use AUIPC instruction ). The
only question is that if .got is used or not ( which depends on
pie,pic, etc... )
>=20
> I have already mentioned before, but I think it would really useful
> if=20
> you start adding more documentation (in particular of such behavior)
> in=20
> the code or docs/ (for more wide). This would help everyone to=20
> understand how everything is meant to work.
Sure. I will add more documentation for such kind of code.

~ Oleksii

