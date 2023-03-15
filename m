Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B178B6BBC1D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 19:33:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510177.787448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcVw5-0001Nj-Hf; Wed, 15 Mar 2023 18:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510177.787448; Wed, 15 Mar 2023 18:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcVw5-0001LU-Eg; Wed, 15 Mar 2023 18:33:17 +0000
Received: by outflank-mailman (input) for mailman id 510177;
 Wed, 15 Mar 2023 18:33:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ux93=7H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcVw4-0001LO-F6
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 18:33:16 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8a225b8-c35f-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 19:33:14 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id eg48so19933718edb.13
 for <xen-devel@lists.xenproject.org>; Wed, 15 Mar 2023 11:33:14 -0700 (PDT)
Received: from [192.168.8.114] (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 ja19-20020a170907989300b008cf8c6f5c43sm2832659ejc.83.2023.03.15.11.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 11:33:13 -0700 (PDT)
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
X-Inumbo-ID: d8a225b8-c35f-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678905194;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zfxFJ6dZWvXaXmRqKhnE6CK1wnsP+2gVVJCnEq3zeq0=;
        b=phnGZaqw0cmvTdktl11lqCpPQCK1HhYgZyZaaWNp9eFpTVQGdDJ8vV+xC8aZN7vrUo
         sZz02wzgOcA3zA7QiSb+RbYofbl5oRWtPcFixlcKTRiAqIw+z3iXscKqpq/SGVUFyOBM
         TRYEtZbJ7Pr8/gQEEwhOAgzfvCiKj7g/TYRB0HDhgRhN6GQKtKLYUuEl7PjzyOrl04KD
         /LOl1PH4GtxfQ7VCq6hwvlfwc4CGcQ1VbfW3YTjtHapVfMX2itqld20UZVw1Ie9KThEt
         Ir8f2X8U0FEeKb6Cp4J99ScecvY+oHtXAdCqVwQXjFX2uMHFa/Hu/RR50Nhp4vcd+yY2
         rcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678905194;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zfxFJ6dZWvXaXmRqKhnE6CK1wnsP+2gVVJCnEq3zeq0=;
        b=bNsZGEYXJ/ljZUTmcOYr3DyLzI3qFau9wLKFQ31eyLlnV9uYcPh1DfqwjLhRSfhtlc
         FI5jlBoJH41S/L/jIKFlDJ0aVb6GRRDv5FnLiFraUkUVje5ChKUYiFwxidHKW1iH2HEJ
         JkRnVzB8afTM+um44ZU7zlA2zWzvFzxyGsj1KrYTsG0QBCsog9hpF3UbD7f4n7NqHpHB
         4lPppKyRmSzvk6VYabUQSxtPX/oCd1CEkbvbyWxLMr5HWp6bt1kpELIBNDPI4fkROuzO
         XuaMqZfAvu9kYuapDS31vjwcjjCLrHK+LutTtaH3/OHNBaNtxRLQEpVY+6moNofZ66aS
         bmXQ==
X-Gm-Message-State: AO0yUKXNVB6xBJCptdPYpCKpW6Fr9xGiIAuLo2RZQgXZFCi5zGsFUwJf
	pSY87y0h32PASSqzWvFQxu4=
X-Google-Smtp-Source: AK7set/bfnSrJhBwV0Gn10XKGbJC+hGL6zNgSIJjx5PjI+PKUdDQkMVGCl5Q3oDzwJo8yDth1oJ0lw==
X-Received: by 2002:a17:906:2e89:b0:91e:7063:f558 with SMTP id o9-20020a1709062e8900b0091e7063f558mr7315282eji.37.1678905193769;
        Wed, 15 Mar 2023 11:33:13 -0700 (PDT)
Message-ID: <009b20a71738e8a33fe4044be10a456c4fd37b68.camel@gmail.com>
Subject: Re: [PATCH v1] xen/riscv: make calculation of stack address
 PC-relative
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 15 Mar 2023 20:33:11 +0200
In-Reply-To: <4a8d7292-38b3-1c32-4037-1c94b94b6f46@suse.com>
References: 
	<ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
	 <9c5ec3f3-c909-8f45-4460-1b29ce333d10@citrix.com>
	 <e7c42fc7561b88b1a18463b9b28d0b09cd6553c4.camel@gmail.com>
	 <4a8d7292-38b3-1c32-4037-1c94b94b6f46@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-15 at 08:35 +0100, Jan Beulich wrote:
> On 14.03.2023 21:16, Oleksii wrote:
> > On Tue, 2023-03-14 at 17:09 +0000, Andrew Cooper wrote:
> > > On 14/03/2023 4:00 pm, Oleksii Kurochko wrote:
> > > > The patch is needed to keep all addresses PC-relative.
> > > >=20
> > > > Pseudoinstruction 'la' can be transformed to 'auipc/addi' or
> > > > 'auipc/l{w|d}'. It depends on the .option directive: nopic and
> > > > pic.
> > > >=20
> > > > Right now, 'la' transforms to 'auipc/l{w|d}', which in case of
> > > > cpu0_boot_stack[] will lead to the usage of
> > > > _GLOBAL_OFFSET_TABLE_
> > > > where all addresses will be without counting that it might
> > > > happen
> > > > that linker address !=3D load address.
> > > >=20
> > > > To be sure that SP is loaded always PC-relative address
> > > > 'la' should be changed to 'lla', which always transforms to
> > > > 'auipc/addi'.
> > > >=20
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > =C2=A0xen/arch/riscv/riscv64/head.S | 2 +-
> > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/xen/arch/riscv/riscv64/head.S
> > > > b/xen/arch/riscv/riscv64/head.S
> > > > index 8887f0cbd4..e12d2a7cf3 100644
> > > > --- a/xen/arch/riscv/riscv64/head.S
> > > > +++ b/xen/arch/riscv/riscv64/head.S
> > > > @@ -27,7 +27,7 @@ ENTRY(start)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=
=A0=C2=A0 t3, t3, __SIZEOF_POINTER__
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bltu=C2=A0=C2=A0=
=C2=A0 t3, t4, .L_clear_bss
> > > > =C2=A0
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 sp, cpu0_boot_stack
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lla=C2=A0=C2=A0=C2=A0=
=C2=A0 sp, cpu0_boot_stack
> > >=20
> > > I don't think this is the appropriate way forward.=C2=A0 It's very
> > > much
> > > smells like duct tape hiding the real bug.
> > >=20
> > As an option, I thought to add in head.S '.option nopic' directive
> > to
> > make la translated to auipc/addi [1] pair.
> > As an alternative option, adds to AFLAGS +=3D -fno-PIC... but
> > still...
> >=20
> > I checked in Linux binary how 'la' instruction is transformed, and
> > it
> > looks like it is translated as I expect to auipc/addi pair:
> > ffffffe000001066: 00027517 auipc a0,0x27
> > ffffffe00000106a: f9a50513 addi a0,a0,-102 # ffffffe000028000
> > <early_pg_dir>
> >=20
> > I checked compiler flags between Xen and Linux. The difference is
> > in-
> > fno-PIE (Linux also adds -mabi and -march to AFLAGS):
> >=20
> > 1. Linux build command of head.S: riscv64-linux-gnu-gcc -Wp,-
> > MD,arch/riscv/kernel/.head.o.d -nostdinc -isystem /usr/lib/gcc-
> > cross/riscv64-linux-gnu/9/include -I./arch/riscv/include -
> > I./arch/riscv/include/generated -I./include -
> > I./arch/riscv/include/uapi
> > -I./arch/riscv/include/generated/uapi -I./include/uapi -
> > I./include/generated/uapi -include ./include/linux/kconfig.h -
> > D__KERNEL__ -D__ASSEMBLY__ -fno-PIE -mabi=3Dlp64 -march=3Drv64imafdc -c
> > -o
> > arch/riscv/kernel/head.o arch/riscv/kernel/head.S
> >=20
> > 2. Xen build command of head.S:riscv64-linux-gnu-gcc -MMD -MP -MF
> > arch/riscv/riscv64/.head.o.d -D__ASSEMBLY__ -Wa,--noexecstack -
> > DBUILD_ID -fno-strict-aliasing -Wall -Wstrict-prototypes -
> > Wdeclaration-
> > after-statement -Wno-unused-but-set-variable -Wno-unused-local-
> > typedefs
> > -O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -
> > Werror
> > -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -include
> > ./include/xen/config.h -Wa,--strip-local-absolute -g -mabi=3Dlp64 -
> > I./include -I./arch/riscv/include -march=3Drv64gc -mstrict-align -
> > mcmodel=3Dmedany - -c arch/riscv/riscv64/head.S -o
> > arch/riscv/riscv64/head.o
> >=20
> > So can we update AFLAGS in xen/arch/riscv/arch.mk with -fno-PIE or
> > will
> > it still be an incorrect fix?
>=20
> Leaving aside the question of why you and I see different code being
> generated, isn't it simply a matter of RISC-V, unlike Arm and x86,
> not presently consuming EMBEDDED_EXTRA_CFLAGS in its arch.mk?
No, it doesn't.

Could we consider cosuming EMBEDDED_EXTRA_CFALGS as a solution?

~ Oleksii

