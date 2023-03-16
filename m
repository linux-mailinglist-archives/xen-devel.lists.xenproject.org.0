Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B651C6BC781
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 08:43:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510327.787802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pciFZ-0001Mj-Dv; Thu, 16 Mar 2023 07:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510327.787802; Thu, 16 Mar 2023 07:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pciFZ-0001Kc-AU; Thu, 16 Mar 2023 07:42:13 +0000
Received: by outflank-mailman (input) for mailman id 510327;
 Thu, 16 Mar 2023 07:42:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pciFY-0001KT-7S
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 07:42:12 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0eec087d-c3ce-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 08:42:10 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id eh3so3871801edb.11
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 00:42:10 -0700 (PDT)
Received: from [192.168.8.114] (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 v1-20020a170906488100b008d8f1b238fdsm3485397ejq.149.2023.03.16.00.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 00:42:09 -0700 (PDT)
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
X-Inumbo-ID: 0eec087d-c3ce-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678952529;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MrlBBYukRr3Nu/f0mpSH6rFGy6cqWFTE2hcrBiLlips=;
        b=EdsohTY0FzXf70GRmUGqUiwDBtyA/BgBmTOn08BPWMZzqYMt5hUiqE+JnJt15AEIkR
         oSVW+CnRA18DGVfEKvNRFoOIzymoXOWsFtBllTyO4ZzpcO7j7teF1NEtfu8/m8eTdIu2
         zGik+UZY+EM+9dAUrfXP4UIyp57k9oLXlFCBWVTNUQJlH0AuKE9tPh+/fI/CsW4ktaaI
         YUE0WgsOa3JILdbVJJmYcIt3/Jcf/BuZcg+Dxf8S8rZjJL/L96EZdRdxn5LVenVbOQ5/
         LE5Z7KJ8UpTQWceFVroenstzfT1ZzL9MemoQGfgeVhslRdwoKXKSeF9t9BGdtrx1Hdt8
         qu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678952529;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MrlBBYukRr3Nu/f0mpSH6rFGy6cqWFTE2hcrBiLlips=;
        b=HSohxyMFtya1akKIHgvwJh22SAmketeEYD3Q89+R11nmdlyJPHp6xYtP19fUlCAVLw
         RVJF6G0J/Gisvki0PWZ0euGdFQML+66m2FkjiQhoOVzweRo6hD5kREpm5AAZ3OFricCr
         0hj/noyRs9/4s/yHL+l2i+wryX+hYjoWX3m1t/NeegfcaTBIDSgZPGS+q2UBqyorytjU
         zGiMFG1OODMna86qdqUIYVcCzxH/WuRad92RRf98TV7DcGnkw42VgcNp+SLSStzYzt2q
         jxWat/6Cncw8RkmVG5hNv5+d8JnsIhTtIkQ/nHfoO+zv6w9+I7ANyJsWp39ZtR0tbOxD
         EZPg==
X-Gm-Message-State: AO0yUKVW//pQNbEx0OyIQTmRPytKK7OzZCRTKHkg7lO1sl9dB1CiePGL
	+6KLxC0APD1OrYvxmUbyXDE=
X-Google-Smtp-Source: AK7set8sfEEOGynDz000LF95F/z/5EurZW+Ffa4400f2BRuX0ZE6BICZYLy1fRtMhv8mt3qPSG4cuA==
X-Received: by 2002:a17:906:f914:b0:88c:6345:d0e7 with SMTP id lc20-20020a170906f91400b0088c6345d0e7mr8767790ejb.36.1678952529413;
        Thu, 16 Mar 2023 00:42:09 -0700 (PDT)
Message-ID: <00fc9016252e656be257671aa5c2c4e102df240a.camel@gmail.com>
Subject: Re: [PATCH v1] xen/riscv: make calculation of stack address
 PC-relative
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
	Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	xen-devel@lists.xenproject.org
Date: Thu, 16 Mar 2023 09:42:07 +0200
In-Reply-To: <ac357f76-653f-9dbd-dc54-6e31db28de9b@citrix.com>
References: 
	<ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
	 <9c5ec3f3-c909-8f45-4460-1b29ce333d10@citrix.com>
	 <e7c42fc7561b88b1a18463b9b28d0b09cd6553c4.camel@gmail.com>
	 <966c19e3-d255-db73-9bb4-7abe0a745396@suse.com>
	 <ac357f76-653f-9dbd-dc54-6e31db28de9b@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-15 at 21:12 +0000, Andrew Cooper wrote:
> On 15/03/2023 7:59 am, Jan Beulich wrote:
> > On 14.03.2023 21:16, Oleksii wrote:
> > > I checked in Linux binary how 'la' instruction is transformed,
> > > and it
> > > looks like it is translated as I expect to auipc/addi pair:
> > > ffffffe000001066: 00027517 auipc a0,0x27
> > > ffffffe00000106a: f9a50513 addi a0,a0,-102 # ffffffe000028000
> > > <early_pg_dir>
> > >=20
> > > I checked compiler flags between Xen and Linux. The difference is
> > > in-
> > > fno-PIE (Linux also adds -mabi and -march to AFLAGS):
> > >=20
> > > 1. Linux build command of head.S: riscv64-linux-gnu-gcc -Wp,-
> > > MD,arch/riscv/kernel/.head.o.d -nostdinc -isystem /usr/lib/gcc-
> > > cross/riscv64-linux-gnu/9/include -I./arch/riscv/include -
> > > I./arch/riscv/include/generated -I./include -
> > > I./arch/riscv/include/uapi
> > > -I./arch/riscv/include/generated/uapi -I./include/uapi -
> > > I./include/generated/uapi -include ./include/linux/kconfig.h -
> > > D__KERNEL__ -D__ASSEMBLY__ -fno-PIE -mabi=3Dlp64 -march=3Drv64imafdc
> > > -c -o
> > > arch/riscv/kernel/head.o arch/riscv/kernel/head.S
> > >=20
> > > 2. Xen build command of head.S:riscv64-linux-gnu-gcc -MMD -MP -MF
> > > arch/riscv/riscv64/.head.o.d -D__ASSEMBLY__ -Wa,--noexecstack -
> > > DBUILD_ID -fno-strict-aliasing -Wall -Wstrict-prototypes -
> > > Wdeclaration-
> > > after-statement -Wno-unused-but-set-variable -Wno-unused-local-
> > > typedefs
> > > -O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -
> > > Werror
> > > -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -
> > > include
> > > ./include/xen/config.h -Wa,--strip-local-absolute -g -mabi=3Dlp64 -
> > > I./include -I./arch/riscv/include -march=3Drv64gc -mstrict-align -
> > > mcmodel=3Dmedany - -c arch/riscv/riscv64/head.S -o
> > > arch/riscv/riscv64/head.o
> > Looking into why you see different code generated than I: Nothing
> > in
> > here directs gcc to pass -fpic to gas; in upstream gcc (consistent
> > from gcc7 through gcc12, which are the versions I've checked; the
> > actual range may be wider) there is
> >=20
> > #define ASM_SPEC "\
> > %(subtarget_asm_debugging_spec) \
> > %{" FPIE_OR_FPIC_SPEC ":-fpic} \
> > ...
> >=20
> > Can you check whether your gcc passes -fpic to gas even when
> > there's
> > no -fPIC / -fPIE (or alike) on the gcc command line? Or whether
> > your
> > gas (unlike upstream's) defaults to PIC mode? (For .S files
> > ASM_SPEC
> > is all that counts. For .c files gcc is redundantly passing -fpic
> > along with also emitting ".option pic" or, in the opposite case, it
> > is omitting -fpic along with emitting ".option nopic".)
> >=20
> > You gcc may have been configured with --enable-default-pie, while I
> > know mine hasn't been (simply because that's the default).
>=20
> From the thread, the difference is clearly around the pie option, but
> I
> have to admit that I'm confused.
>=20
> With GCC 10 from Debian repos and current staging (modulo the build
> fix), we end up with:
>=20
> 0000000080200000 <_start>:
> =C2=A0=C2=A0=C2=A0 80200000:=C2=A0=C2=A0 10401073=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csrw=C2=
=A0=C2=A0=C2=A0 sie,zero
> =C2=A0=C2=A0=C2=A0 80200004:=C2=A0=C2=A0 00002117=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 auipc=C2=
=A0=C2=A0 sp,0x2
> =C2=A0=C2=A0=C2=A0 80200008:=C2=A0=C2=A0 00413103=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ld=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 sp,4(sp) # 80202008
> <_GLOBAL_OFFSET_TABLE_+0x8>
> =C2=A0=C2=A0=C2=A0 8020000c:=C2=A0=C2=A0 6285=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 lui=C2=A0=C2=A0=C2=A0=C2=A0 t0,0x1
> =C2=A0=C2=A0=C2=A0 8020000e:=C2=A0=C2=A0 9116=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=C2=A0 sp,sp,t0
> =C2=A0=C2=A0=C2=A0 80200010:=C2=A0=C2=A0 7f10206f=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 80203000 <start_xen>
>=20
> In this case, the auipc/ld pair makes a PC-relative reference into
> the
> GOT, but the pointer spilled into the GOT is the link time address of
> cpu0_boot_stack.
>=20
> For the executable as a whole, we've got:
>=20
> [ 6] .got=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 PROGBITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000000=
80202000 003000 000010
> 08=C2=A0 WA=C2=A0 0=C2=A0=C2=A0 0=C2=A0 8
> [ 7] .got.plt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PROGB=
ITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0000000080202010 003010 00001=
0
> 08=C2=A0 WA=C2=A0 0=C2=A0=C2=A0 0=C2=A0 8
>=20
> i.e. both nonzero in size, so presumably with expectations of
> something
> else to fix up the references.
>=20
> I suspect we want to extend the x86 section asserts into the other
> architectures too, alongside figuring out how exactly to disable code
> generation of this form.
>=20
But AFAIU it is expected that it will use GOT sections with the link
time address of cpu0_boot_stack inside them because of pie option.

If we need to work with pie option that we can fix all address in
.got{.plt} somewhere at the start of head.S but why we can't go with -
fno-pie as it is done for other architectures:
Config.mk:
	EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie -fno-stack-protector -fno-
stack-protector-all
EMBEDDED_EXTRA_CFLAGS +=3D -fno-exceptions -fno-asynchronous-unwind-
tables

arch.mk:
    $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))


Could you please explain what is x86 section asserts?

~ Oleksii


