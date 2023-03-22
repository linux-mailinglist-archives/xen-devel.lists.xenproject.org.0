Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5416C4C0B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 14:41:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513453.794460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyi0-0007rt-Gm; Wed, 22 Mar 2023 13:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513453.794460; Wed, 22 Mar 2023 13:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyi0-0007os-Do; Wed, 22 Mar 2023 13:40:56 +0000
Received: by outflank-mailman (input) for mailman id 513453;
 Wed, 22 Mar 2023 13:40:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhKM=7O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1peyhz-0007om-3M
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 13:40:55 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a2ed530-c8b7-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 14:40:53 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id w11so10522368wmo.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 06:40:53 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c354600b003ede6540190sm10730717wmq.0.2023.03.22.06.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 06:40:52 -0700 (PDT)
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
X-Inumbo-ID: 2a2ed530-c8b7-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679492452;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y+G0KtFzysICluopv7X2KW6OxCJL6m3/E/EFH5wez8s=;
        b=iEXJ+XcM3sfGlMgRs5nL9jBW6XPKiNSkja/fD6QRXniD5zpiNvxhCaJX4WEFtEKZ1w
         WsmaNnEGQv5l4v47j31sn0RCuqVlG8DvDNgov6EG3Ph3n+ibQZhi1zzP3qy9471/XAgw
         skaDbEkhJ3jwo/DkEWceUsrGcpP4Dqy41kRSWbcU951XIZ7S/PG5y4FN0A05mpD8etCO
         PRrdhy0NSd4Tg/hXeKQaq1b+q46VWzDCfD6bmJXmeYCgWv2BABvXMPolEUqLcwIA2Ux9
         PisHUZll7fO/pSX83k82HSUB9vUaXcGXradjKpnUzPDhxTQAfnL9N227FC9sY+0Swm33
         yEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679492452;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+G0KtFzysICluopv7X2KW6OxCJL6m3/E/EFH5wez8s=;
        b=3xEdxVNlZXvOt/hhcZismXEx/xQK9xzWr6zssA3R9bEmAtYp3WWRk4JOjV92TMDTig
         u2fmXRDdHpniuj0dXXplIlFq6iJ269IiQp4mVCI5Wda6kCxNtFYrUSZt43tPHDepMq+B
         TCaXwHxtUqbTmCOvyXEcbO/FGKFTzK9nsvmGqyBp/8hvuwOwS31jpm1VuJQQftFJUGKW
         TFuF1TDnTquprSt0Lzpo6Y9cKH3YC5frK3z1DJYLP9owY6jr4/9P7Wvn3UCOwP8Agyub
         ceQHjTbpZkI4MOpo5gibBIqp+ZGLf/eKnuElyhZgut2dzwQmF4dDX2mlcT5vmGsr02Az
         Cwrg==
X-Gm-Message-State: AO0yUKVt/s2oWRAm/DaK0p4HreOuUUvDIsksOP4EbgbaUXQ7sMxcHMk9
	0WkzXFG8cZ/E4sSyHiVXyiU=
X-Google-Smtp-Source: AK7set9hIG+H5sCrXr8NjZ7iEHN1VjlqsuXj33KBhuLs3+cfgObHrGHwkP979drRZMMPqV/JVlhf1Q==
X-Received: by 2002:a05:600c:2110:b0:3eb:f59f:6daf with SMTP id u16-20020a05600c211000b003ebf59f6dafmr5431541wml.34.1679492452608;
        Wed, 22 Mar 2023 06:40:52 -0700 (PDT)
Message-ID: <370a6e223d8db5f2d075ca8aba31db198a3aefce.camel@gmail.com>
Subject: Re: [PATCH v5 5/7] xen/riscv: introduce trap_init()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Wed, 22 Mar 2023 15:40:49 +0200
In-Reply-To: <fb5632f9-d749-4396-930e-9f2a601720d8@xen.org>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
	 <91b0284d20f530f2795a119ccb7436ee0b800256.1678976127.git.oleksii.kurochko@gmail.com>
	 <5a2c6f35-373a-de3c-1db2-aeeb1b39635f@xen.org>
	 <520d64f0b6cd283416aa4fb7b9baa5f83454c4a8.camel@gmail.com>
	 <fb5632f9-d749-4396-930e-9f2a601720d8@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-22 at 12:14 +0000, Julien Grall wrote:
>=20
>=20
> On 22/03/2023 11:33, Oleksii wrote:
> > Hi Julien,
>=20
> Hi Oleksii,
>=20
> >=20
> > On Tue, 2023-03-21 at 17:42 +0000, Julien Grall wrote:
> > > Hi Oleksii,
> > >=20
> > > On 16/03/2023 14:39, Oleksii Kurochko wrote:
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > > Changes in V5:
> > > > =C2=A0=C2=A0=C2=A0 - Nothing changed
> > > > ---
> > > > Changes in V4:
> > > > =C2=A0=C2=A0=C2=A0 - Nothing changed
> > > > ---
> > > > Changes in V3:
> > > > =C2=A0=C2=A0=C2=A0 - Nothing changed
> > > > ---
> > > > Changes in V2:
> > > > =C2=A0=C2=A0=C2=A0 - Rename setup_trap_handler() to trap_init().
> > > > =C2=A0=C2=A0=C2=A0 - Add Reviewed-by to the commit message.
> > > > ---
> > > > =C2=A0=C2=A0 xen/arch/riscv/include/asm/traps.h | 1 +
> > > > =C2=A0=C2=A0 xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++++
> > > > =C2=A0=C2=A0 xen/arch/riscv/traps.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 +++++++
> > > > =C2=A0=C2=A0 3 files changed, 13 insertions(+)
> > > >=20
> > > > diff --git a/xen/arch/riscv/include/asm/traps.h
> > > > b/xen/arch/riscv/include/asm/traps.h
> > > > index f3fb6b25d1..f1879294ef 100644
> > > > --- a/xen/arch/riscv/include/asm/traps.h
> > > > +++ b/xen/arch/riscv/include/asm/traps.h
> > > > @@ -7,6 +7,7 @@
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 void do_trap(struct cpu_user_regs *cpu_regs);
> > > > =C2=A0=C2=A0 void handle_trap(void);
> > > > +void trap_init(void);
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 #endif /* __ASSEMBLY__ */
> > > > =C2=A0=C2=A0=20
> > > > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > > > index 36556eb779..b44d105b5f 100644
> > > > --- a/xen/arch/riscv/setup.c
> > > > +++ b/xen/arch/riscv/setup.c
> > > > @@ -3,7 +3,9 @@
> > > > =C2=A0=C2=A0 #include <xen/kernel.h>
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 #include <asm/boot-info.h>
> > > > +#include <asm/csr.h>
> > > > =C2=A0=C2=A0 #include <asm/early_printk.h>
> > > > +#include <asm/traps.h>
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 /* Xen stack for bringing up the first CPU. */
> > > > =C2=A0=C2=A0 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
> > > > @@ -32,7 +34,10 @@ void __init noreturn start_xen(unsigned long
> > > > bootcpu_id,
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fill_boot_info();
> > > > =C2=A0=C2=A0=20
> > > > +=C2=A0=C2=A0=C2=A0 trap_init();
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("All set up\n");
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ( ;; )
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm vo=
latile ("wfi");
> > > > =C2=A0=C2=A0=20
> > > > diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> > > > index 8a1529e0c5..581f34efbc 100644
> > > > --- a/xen/arch/riscv/traps.c
> > > > +++ b/xen/arch/riscv/traps.c
> > > > @@ -13,6 +13,13 @@
> > > > =C2=A0=C2=A0 #include <asm/processor.h>
> > > > =C2=A0=C2=A0 #include <asm/traps.h>
> > > > =C2=A0=C2=A0=20
> > > > +void trap_init(void)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long addr =3D (unsigned long)&handle_t=
rap;
> > >=20
> > > It is not super clear to me whether this is going to store the
> > > virtual
> > > or physical address.
> > Actually it is going to store both the virtual and physical
> > address.
> > Depending on if MMU is enabled or not.
>=20
> I think some comment in the code would be really good because this
> is...
>=20
> > >=20
> > > Depending on the answer, the next would be whether the value
> > > would
> > > still
> > > be valid after the MMU is turned on?
> > It would still be valid because for addr will be generated PC-
> > relative
> > address.
>=20
> ... not clear to me what would guarantee that Xen is compiled with=20
> -noPIE. Is the cmodel?
There is a patch:
https://lore.kernel.org/xen-devel/2785518800dce64fafb3096480a5ae4c4e026bcb.=
1678970065.git.oleksii.kurochko@gmail.com/
Which guarantees that Xen is complied with -noPIE.

The cmodel determines which software addressing mode is used, and,
therefore, what constraints are enforced on the linked program.

>=20
> A suggestion for the top of the function:
>=20
> "Initialize the trap handling. This is called twice (before and after
> the MMU)."
>=20
> And for on top of 'addr', I would add:
>=20
> "When the MMU is off, this will be a physical address otherwise it
> would=20
> be a virtual address. This is guarantee because [fill the blank]".
Thanks for the recommendations.
I will take them into account.

~ Oleksii

