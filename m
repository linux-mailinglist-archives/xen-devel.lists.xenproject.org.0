Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F08406BBC00
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 19:25:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510172.787435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcVon-00083N-L1; Wed, 15 Mar 2023 18:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510172.787435; Wed, 15 Mar 2023 18:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcVon-00081g-Hp; Wed, 15 Mar 2023 18:25:45 +0000
Received: by outflank-mailman (input) for mailman id 510172;
 Wed, 15 Mar 2023 18:25:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ux93=7H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcVom-00081K-Dv
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 18:25:44 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cba8e139-c35e-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 19:25:43 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id x13so31746399edd.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Mar 2023 11:25:43 -0700 (PDT)
Received: from [192.168.8.114] (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 zk6-20020a17090733c600b00927e0fb3e50sm2847209ejb.100.2023.03.15.11.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 11:25:42 -0700 (PDT)
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
X-Inumbo-ID: cba8e139-c35e-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678904742;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EsfNJzGXFo+wfWbp9Tuz/H0Bn24OppdY5vSVwfN72E4=;
        b=E/vZ25uC+ptFzWNFBxsDe7QqCROMthI/kn3jMx7wH+Qqi/8y2bgQqA4X9EhDAtkNnF
         +dlEuRGvp/rbBfIIVCu/6c50pQBJ87mUDB2svzQHSWxyfQU4nSKSnIv1CaqMljGGMENh
         KrCnAxQW0INV/z/iGTnVsIgpMEyrQ0r5jqW4gKT2mF4QECIhhzPTn4T579pZmZupWQke
         JOXeurtaqEWLX6+vPPX+ZwkVLQ2c595J+7KdpFTbSJmegupnGfmhHfx/0uCl4vOqLQq9
         V+19AKlSrrA4aNgQwjOpFLFNryDYKafeBF6qMIIXt+JEeJ0fo/MOGErK3qgeAQnO60Xh
         vrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678904742;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EsfNJzGXFo+wfWbp9Tuz/H0Bn24OppdY5vSVwfN72E4=;
        b=a8XHQeENdTgphl+c8i7xZ/JUXt3dVSdwOR4OaQUaGLq4Ie1oee1bgybjgJA+4lr2yU
         1ln6PoqN9I84LG/nv5On6ikcSIueMRIZTHYVArcjlzMSZ15stecq3sUuXcLmGZygax04
         fWV9kiQm4FdYTq2BjFc2uzIfH9ZAfloLkKhujkAHgDKwhaBu+/C7TosHKIMt92FDehBk
         L/N71Mm8VaSzjzVdVXfH3DDtlvOPBI5v6FnQYkfzg8SXHY9b0b1EUtUnAthwqsZHIQ0y
         sCp20sT1QDoxaA0wWWgYgCNUqRYqZbLzNWc4NY/dhwn9uf7AcGZChRWusgzvYQd8+rCr
         nDBQ==
X-Gm-Message-State: AO0yUKV0gqsU/R+IDcPvFNq/oNkJOLuS2jx/IIavQ5owrF15rrZSMErY
	Pf6EUh/hyjIInJTJhtGxov8=
X-Google-Smtp-Source: AK7set8GP727gEUbidUkB7iEgmVpmAp8iIhnMb4RbCWEPhVkqYYPSu0Jt2GF5D0Kenbu1PkF0aOHyQ==
X-Received: by 2002:a17:906:743:b0:92b:4f8e:dddb with SMTP id z3-20020a170906074300b0092b4f8edddbmr8981648ejb.34.1678904742485;
        Wed, 15 Mar 2023 11:25:42 -0700 (PDT)
Message-ID: <2a7fbb0495833ad686f260091024966f8b003dcb.camel@gmail.com>
Subject: Re: [PATCH v1] xen/riscv: make calculation of stack address
 PC-relative
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 15 Mar 2023 20:25:40 +0200
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
Why don't we should see different code?

Do you use CONTAINER=3Driscv64 to build RISC-V Xen?
If yes, probably, we see different code because you have more up-to-
date CONTAINER. I am using CONTAINER_NO_PULL=3D1 for a long time so it
might happen that we have different gcc version.


~ Oleksii

