Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB146BBBFA
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 19:24:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510170.787424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcVme-0007UY-8d; Wed, 15 Mar 2023 18:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510170.787424; Wed, 15 Mar 2023 18:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcVme-0007SQ-5f; Wed, 15 Mar 2023 18:23:32 +0000
Received: by outflank-mailman (input) for mailman id 510170;
 Wed, 15 Mar 2023 18:23:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ux93=7H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcVmc-0007SK-Dq
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 18:23:30 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79bb67a0-c35e-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 19:23:26 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id h8so35274403ede.8
 for <xen-devel@lists.xenproject.org>; Wed, 15 Mar 2023 11:23:25 -0700 (PDT)
Received: from [192.168.8.114] (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 kk1-20020a170907766100b0092b8c1f41ebsm2827543ejc.24.2023.03.15.11.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 11:23:24 -0700 (PDT)
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
X-Inumbo-ID: 79bb67a0-c35e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678904605;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FdfnZppe0CIozqZQsvk6mx6ROijCjVTsdoIh6BbMsRc=;
        b=HCY96oS06l4iCC+A68KE5L8ufz/bkvlF3azySSb6UEWgh8KZP+Om+WocQxjOYtuIeh
         dBUQ2T7diEj+fre8n6MW4s9tsvcBcUnf3Fxk+pH85MafrY42UTv0eOYlIZpJXcJcxtNn
         pW8SrroS0XzBSAxS0jPysHBcLZVxW7dhMJAG7vjTkcp6h5Lml/B9tciw0UIvm08jUnDI
         TOmF3vAYtf0Ug9o3jci22JdRlnADlffDOAg8446y3AJKGBPwK/gjdqU0jWZgvMwwDbkO
         Zzp3hfGRk1IlZcReQm95yqTSdV/N6Li8XG1nsECi4GpDrLNbma57DFYFOgvf0whwlbyt
         J53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678904605;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FdfnZppe0CIozqZQsvk6mx6ROijCjVTsdoIh6BbMsRc=;
        b=ZcUohSCG/SNMGRo5qptmhn3uvXfT6HFPQpH7/T04B2inkmnRWLxSjG12zVfrXCNM4M
         aPunLqea2xoPJWQ3h5z+tfYTXPab9sF3ImYf45hsvVrr6NpJRyfgT83/TjjPzEEJc0hO
         +7RiiY+7jmtE2cjLtmCddxF/8mX0EX6eZwbWzMd9DYqo/xKHocPyTRNisaZw4XGUnbyO
         5vKWpV7jJ/pQ4GZpfkEfC0uqZ6yNyw5AW7GLdl3qcjddhKmsgebll0bR5GrX4zsYm3sD
         +7e4JmNkKXua1EDDZPL8QobcZsBqh/DUxesMV8SJ1YvmFIGYESRbjn0xurZRFhsGW+Ko
         qfIA==
X-Gm-Message-State: AO0yUKVX9USBFUz2d+j3Fr2kjgAR9lDNhNF113NbJ7ywDMqj7GbL0a0y
	xxnEGcWrpSpp6wQ+HqISY0Y=
X-Google-Smtp-Source: AK7set9OWB0GuCGdT1RaiQ0XE/g2yToPhFa9PKD6vGu0/eVPm8bTJXNK2NP0sfQIGSA2H2tUBjrxSg==
X-Received: by 2002:aa7:d943:0:b0:4ac:bd84:43d9 with SMTP id l3-20020aa7d943000000b004acbd8443d9mr3803723eds.2.1678904605091;
        Wed, 15 Mar 2023 11:23:25 -0700 (PDT)
Message-ID: <b81cddfce06628dc1e0cf373c323c74d1b256313.camel@gmail.com>
Subject: Re: [PATCH v1] xen/riscv: make calculation of stack address
 PC-relative
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 15 Mar 2023 20:23:23 +0200
In-Reply-To: <966c19e3-d255-db73-9bb4-7abe0a745396@suse.com>
References: 
	<ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
	 <9c5ec3f3-c909-8f45-4460-1b29ce333d10@citrix.com>
	 <e7c42fc7561b88b1a18463b9b28d0b09cd6553c4.camel@gmail.com>
	 <966c19e3-d255-db73-9bb4-7abe0a745396@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-15 at 08:59 +0100, Jan Beulich wrote:
> On 14.03.2023 21:16, Oleksii wrote:
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
>=20
> Looking into why you see different code generated than I: Nothing in
> here directs gcc to pass -fpic to gas; in upstream gcc (consistent
> from gcc7 through gcc12, which are the versions I've checked; the
> actual range may be wider) there is
>=20
> #define ASM_SPEC "\
> %(subtarget_asm_debugging_spec) \
> %{" FPIE_OR_FPIC_SPEC ":-fpic} \
> ...
>=20
> Can you check whether your gcc passes -fpic to gas even when there's
> no -fPIC / -fPIE (or alike) on the gcc command line?
I am not sure that I know how to check specifically if -fpic flag
passes to gas.
Could you please tell me?

>  Or whether your
> gas (unlike upstream's) defaults to PIC mode? (For .S files ASM_SPEC
> is all that counts. For .c files gcc is redundantly passing -fpic
> along with also emitting ".option pic" or, in the opposite case, it
> is omitting -fpic along with emitting ".option nopic".)
it looks like it should be by default -fpic because if look at gcc spec
file for the RISC-V architecture:

[user@49295ae49cbe build]$ riscv64-linux-gnu-gcc -dumpspecs | grep -i
pic
--traditional-format %(subtarget_asm_debugging_spec) %{fno-pie|fno-
PIE|fno-pic|fno-PIC:;:-fpic} %{march=3D*} %{mabi=3D*} %{mno-relax} %{mbig-
endian} %{mlittle-endian} %(subtarget_asm_spec)%{misa-spec=3D*}

which means that -fpic is enabled if none of the following options are
present on the command line:
    -fno-pie
    -fno-PIE
    -fno-pic
    -fno-PIC

>=20
> You gcc may have been configured with --enable-default-pie, while I
> know mine hasn't been (simply because that's the default).
You are right my gcc is configured with --enable-default-pie:

[user@49295ae49cbe build]$ riscv64-linux-gnu-gcc -v=20
Using built-in specs.
COLLECT_GCC=3Driscv64-linux-gnu-gcc
COLLECT_LTO_WRAPPER=3D/usr/lib/gcc/riscv64-linux-gnu/12.2.0/lto-wrapper
Target: riscv64-linux-gnu
Configured with: /build/riscv64-linux-gnu-gcc/src/gcc-12.2.0/configure
--prefix=3D/usr --program-prefix=3Driscv64-linux-gnu- --with-local-
prefix=3D/usr/riscv64-linux-gnu --with-sysroot=3D/usr/riscv64-linux-gnu --
with-build-sysroot=3D/usr/riscv64-linux-gnu --libdir=3D/usr/lib --
libexecdir=3D/usr/lib --target=3Driscv64-linux-gnu --host=3Dx86_64-pc-linux=
-
gnu --build=3Dx86_64-pc-linux-gnu --with-system-zlib --with-isl --with-
linker-hash-style=3Dgnu --disable-nls --disable-libunwind-exceptions --
disable-libstdcxx-pch --disable-libssp --disable-multilib --disable-
werror --enable-languages=3Dc,c++ --enable-shared --enable-threads=3Dposix
--enable-__cxa_atexit --enable-clocale=3Dgnu --enable-gnu-unique-object -
-enable-linker-build-id --enable-lto --enable-plugin --enable-install-
libiberty --enable-gnu-indirect-function --enable-default-pie --enable-
checking=3Drelease
Thread model: posix
Supported LTO compression algorithms: zlib zstd
gcc version 12.2.0 (GCC)

So should we pass to CFLAGS and AFLAGS at least for RISC-V -fno-PIE?

~ Oleksii

