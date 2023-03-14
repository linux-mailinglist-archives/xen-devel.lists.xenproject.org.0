Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5006BA08A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 21:17:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509822.786378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcB4c-0004t5-5a; Tue, 14 Mar 2023 20:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509822.786378; Tue, 14 Mar 2023 20:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcB4c-0004rN-2q; Tue, 14 Mar 2023 20:16:42 +0000
Received: by outflank-mailman (input) for mailman id 509822;
 Tue, 14 Mar 2023 20:16:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snfi=7G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcB4Z-0004r9-PT
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 20:16:39 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f98d079-c2a5-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 21:16:38 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id cn21so36836194edb.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Mar 2023 13:16:37 -0700 (PDT)
Received: from [192.168.8.114] (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 br7-20020a170906d14700b008c979c74732sm1520701ejb.156.2023.03.14.13.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 13:16:36 -0700 (PDT)
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
X-Inumbo-ID: 1f98d079-c2a5-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678824997;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2nEz2dpMPbvL8ON3mDc6ZbiUBwMkCNptBtABAlbR4bc=;
        b=LpfISWhaGDuUUXnu0ZK3knLJA3URBqgF5AhxOIvJ9JfHg91Ns5b9fVcAEu4L2fbYkS
         uhw9yl7UxBIpYb2++Gebx0S5jhAtgKFXC4bDMLlIigERSsI4zd2pBTmtMIrPiXRCpJsd
         49niiWDoknIhPT7JmCdPcDla4OlcMfHe4hirRkhAK9s83Fn8eUvl9w2SoDj+U5wv3AO/
         3iPmfA63GfiZH8mDwbzJR/JrVU70zjTPnDUKomcdJ6FaIlV+lU7BXpWsM7KEJUOwJ18J
         3tch9Q8WJvixY5YW+t7dDaNBVxdGyp7q8Iwu0A/o8HJJPh2ZAEMdLzVLCFm5I/9NDWQZ
         Xq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678824997;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2nEz2dpMPbvL8ON3mDc6ZbiUBwMkCNptBtABAlbR4bc=;
        b=0JZgMV4j/X53bg+M19tR9MNVquqPLZuofBRPryKWCDW3g9uIeGw+REh6dk1CBwG1pP
         KBKRgTLYkaXXyf+NaGnspcPkoV1Acxvqx9sDU1/Yf5K7biEExZtlY+6OQXEretuk+Cd8
         pAkS2r1qV7NeN1Lf+GzcegdQGLVtQZQjkOZNgSqt5ZEZnNUwHLmz5HGxvx3M0Z+eyNaR
         xHGKMyPhXMie7eLm3/T1D573yHgUxuCD0qkqnXqeV/oJZ6vQ6hetcDaAtjam648IZddV
         qFoTDp5jQt8bntQwfjxSWlYqug1/E/nmXsACKLJv7IM3ipPaU3XgK6AXSaOTGeeF836p
         5OdA==
X-Gm-Message-State: AO0yUKW00/fHCSEBzndBcMkdmOoWRJke58+cqrT3NOCz2uxKPLH3E7sR
	ADsfpY65cZCVTysMl40J39Y=
X-Google-Smtp-Source: AK7set+Ty+7Z3xgwWokHWZwB+s1Aky+zamPEQOLabnC4NN3/mQ2K+Sv6IW0gNyyJiFTvWerfRYs2sw==
X-Received: by 2002:a17:906:ae51:b0:921:5cce:6592 with SMTP id lf17-20020a170906ae5100b009215cce6592mr3543652ejb.59.1678824996857;
        Tue, 14 Mar 2023 13:16:36 -0700 (PDT)
Message-ID: <e7c42fc7561b88b1a18463b9b28d0b09cd6553c4.camel@gmail.com>
Subject: Re: [PATCH v1] xen/riscv: make calculation of stack address
 PC-relative
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
	Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Tue, 14 Mar 2023 22:16:34 +0200
In-Reply-To: <9c5ec3f3-c909-8f45-4460-1b29ce333d10@citrix.com>
References: 
	<ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
	 <9c5ec3f3-c909-8f45-4460-1b29ce333d10@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-03-14 at 17:09 +0000, Andrew Cooper wrote:
> On 14/03/2023 4:00 pm, Oleksii Kurochko wrote:
> > The patch is needed to keep all addresses PC-relative.
> >=20
> > Pseudoinstruction 'la' can be transformed to 'auipc/addi' or
> > 'auipc/l{w|d}'. It depends on the .option directive: nopic and pic.
> >=20
> > Right now, 'la' transforms to 'auipc/l{w|d}', which in case of
> > cpu0_boot_stack[] will lead to the usage of _GLOBAL_OFFSET_TABLE_
> > where all addresses will be without counting that it might happen
> > that linker address !=3D load address.
> >=20
> > To be sure that SP is loaded always PC-relative address
> > 'la' should be changed to 'lla', which always transforms to
> > 'auipc/addi'.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/arch/riscv/riscv64/head.S | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/xen/arch/riscv/riscv64/head.S
> > b/xen/arch/riscv/riscv64/head.S
> > index 8887f0cbd4..e12d2a7cf3 100644
> > --- a/xen/arch/riscv/riscv64/head.S
> > +++ b/xen/arch/riscv/riscv64/head.S
> > @@ -27,7 +27,7 @@ ENTRY(start)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=
=C2=A0 t3, t3, __SIZEOF_POINTER__
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bltu=C2=A0=C2=A0=C2=A0=
 t3, t4, .L_clear_bss
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 sp, cpu0_boot_stack
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lla=C2=A0=C2=A0=C2=A0=C2=A0=
 sp, cpu0_boot_stack
>=20
> I don't think this is the appropriate way forward.=C2=A0 It's very much
> smells like duct tape hiding the real bug.
>=20
As an option, I thought to add in head.S '.option nopic' directive to
make la translated to auipc/addi [1] pair.
As an alternative option, adds to AFLAGS +=3D -fno-PIC... but still...

I checked in Linux binary how 'la' instruction is transformed, and it
looks like it is translated as I expect to auipc/addi pair:
ffffffe000001066: 00027517 auipc a0,0x27
ffffffe00000106a: f9a50513 addi a0,a0,-102 # ffffffe000028000
<early_pg_dir>

I checked compiler flags between Xen and Linux. The difference is in-
fno-PIE (Linux also adds -mabi and -march to AFLAGS):

1. Linux build command of head.S: riscv64-linux-gnu-gcc -Wp,-
MD,arch/riscv/kernel/.head.o.d -nostdinc -isystem /usr/lib/gcc-
cross/riscv64-linux-gnu/9/include -I./arch/riscv/include -
I./arch/riscv/include/generated -I./include -I./arch/riscv/include/uapi
-I./arch/riscv/include/generated/uapi -I./include/uapi -
I./include/generated/uapi -include ./include/linux/kconfig.h -
D__KERNEL__ -D__ASSEMBLY__ -fno-PIE -mabi=3Dlp64 -march=3Drv64imafdc -c -o
arch/riscv/kernel/head.o arch/riscv/kernel/head.S

2. Xen build command of head.S:riscv64-linux-gnu-gcc -MMD -MP -MF
arch/riscv/riscv64/.head.o.d -D__ASSEMBLY__ -Wa,--noexecstack -
DBUILD_ID -fno-strict-aliasing -Wall -Wstrict-prototypes -Wdeclaration-
after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs
-O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -Werror
-Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -include
./include/xen/config.h -Wa,--strip-local-absolute -g -mabi=3Dlp64 -
I./include -I./arch/riscv/include -march=3Drv64gc -mstrict-align -
mcmodel=3Dmedany - -c arch/riscv/riscv64/head.S -o
arch/riscv/riscv64/head.o

So can we update AFLAGS in xen/arch/riscv/arch.mk with -fno-PIE or will
it still be an incorrect fix?

[1]
https://github.com/riscv-non-isa/riscv-asm-manual/blob/master/riscv-asm.md#=
pseudoinstructions

~ Oleksii

