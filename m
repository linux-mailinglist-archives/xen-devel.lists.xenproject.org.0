Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812AD6BCA4C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 10:04:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510395.787975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjWm-0003gA-2k; Thu, 16 Mar 2023 09:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510395.787975; Thu, 16 Mar 2023 09:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjWl-0003eN-V0; Thu, 16 Mar 2023 09:04:03 +0000
Received: by outflank-mailman (input) for mailman id 510395;
 Thu, 16 Mar 2023 09:04:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcjWk-0003eH-Hl
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 09:04:02 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d4f9de3-c3d9-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 10:03:59 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id x13so4763469edd.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 02:03:59 -0700 (PDT)
Received: from [192.168.8.114] (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 a28-20020a50c31c000000b004af6c5f1805sm3537785edb.52.2023.03.16.02.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 02:03:58 -0700 (PDT)
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
X-Inumbo-ID: 7d4f9de3-c3d9-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678957439;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hauFOO9sAmamPCKucwYf2lzt8zo4QOFnBbxSv2d050U=;
        b=TaMMXu57Sb1McQ3oC422gNTmizbd/0Lt9NI4FzX3zENff7cvYH6hJDY4ijhmFdpqBl
         X38iKrUdSsJXYUJdNxRbAz7g6BW1Fhpp11Hlf65S+QP+pkAla6lUh4ac732nEx3RCS59
         x6HxLZWWJFaa/cRTlW55UEjqPp0br3sByhcMSCk3FDkaQqdq9H5+lx0gFL6WU5mq+TSu
         IqKr7Tr6Aixh/cO6oGmq2Ds1INnH7CGwmjhR5UzvChB3AELz9fq/j8a2yaw8Qv6Z96I1
         t6dV+nFSFMd5AZOTRMaCUvKCoHA/heyg1jk9cDlCN9TzNM11mjHO7buImU0/rGmm5m2S
         T9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678957439;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hauFOO9sAmamPCKucwYf2lzt8zo4QOFnBbxSv2d050U=;
        b=YybqPSAa1JZvuYPIXrO7pF+OqEDzwMy7LCrj/Arj5e3U8IqO8ZMeW3/aeMcW2VScED
         6BX4JgPpPC8DBXrua+asyJIwSpTVzHNYjr7vkirOtBSl8TDZzY2KbKHNHrnXkl8cNHyB
         4+TLUOE1BXCSBaL5pzBjb+Llfm2dWE1ORariZ3jZK6Vgo9FEgk+CcyLFZEDq827xQ88L
         VRbFFwJvwsEUu7tRZ6yzoQQmpXJeinh3090aWu4TUXl+a96hsVqoBn9RGSzcSZLuIPo1
         EREVbfPsV5vc6QJplA0GQUrTKFlIsND3RdHUSb8y5EiwhOU7RzgZws1pAPDo1hP3pjKX
         GdFA==
X-Gm-Message-State: AO0yUKVeaoxchp5pZ9n9+nj6djO3Tw7h0MbTJjdS6lGWOjqJsvCG9ncl
	+5n5ro+7DqY0JQulRDGbBWA=
X-Google-Smtp-Source: AK7set9dE3zKjIIwJ+q+iu5QPLd9nE0ykfU3h9doXN/7bZaJD4uIE1QzLc7mhrpIWf7vaiAsZEruSg==
X-Received: by 2002:a17:906:6816:b0:930:1914:88fe with SMTP id k22-20020a170906681600b00930191488femr2285543ejr.68.1678957439150;
        Thu, 16 Mar 2023 02:03:59 -0700 (PDT)
Message-ID: <dc4845a3c78c6eb3787db73daf0ade40cd1433d1.camel@gmail.com>
Subject: Re: [PATCH v1] xen/riscv: make calculation of stack address
 PC-relative
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
	Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Date: Thu, 16 Mar 2023 11:03:57 +0200
In-Reply-To: <4cee4508-7250-9a27-a186-8cc2000dc3ce@suse.com>
References: 
	<ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
	 <9c5ec3f3-c909-8f45-4460-1b29ce333d10@citrix.com>
	 <e7c42fc7561b88b1a18463b9b28d0b09cd6553c4.camel@gmail.com>
	 <966c19e3-d255-db73-9bb4-7abe0a745396@suse.com>
	 <ac357f76-653f-9dbd-dc54-6e31db28de9b@citrix.com>
	 <00fc9016252e656be257671aa5c2c4e102df240a.camel@gmail.com>
	 <4cee4508-7250-9a27-a186-8cc2000dc3ce@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-03-16 at 09:45 +0100, Jan Beulich wrote:
> On 16.03.2023 08:42, Oleksii wrote:
> > On Wed, 2023-03-15 at 21:12 +0000, Andrew Cooper wrote:
> > > On 15/03/2023 7:59 am, Jan Beulich wrote:
> > > > On 14.03.2023 21:16, Oleksii wrote:
> > > > > I checked in Linux binary how 'la' instruction is
> > > > > transformed,
> > > > > and it
> > > > > looks like it is translated as I expect to auipc/addi pair:
> > > > > ffffffe000001066: 00027517 auipc a0,0x27
> > > > > ffffffe00000106a: f9a50513 addi a0,a0,-102 # ffffffe000028000
> > > > > <early_pg_dir>
> > > > >=20
> > > > > I checked compiler flags between Xen and Linux. The
> > > > > difference is
> > > > > in-
> > > > > fno-PIE (Linux also adds -mabi and -march to AFLAGS):
> > > > >=20
> > > > > 1. Linux build command of head.S: riscv64-linux-gnu-gcc -Wp,-
> > > > > MD,arch/riscv/kernel/.head.o.d -nostdinc -isystem
> > > > > /usr/lib/gcc-
> > > > > cross/riscv64-linux-gnu/9/include -I./arch/riscv/include -
> > > > > I./arch/riscv/include/generated -I./include -
> > > > > I./arch/riscv/include/uapi
> > > > > -I./arch/riscv/include/generated/uapi -I./include/uapi -
> > > > > I./include/generated/uapi -include ./include/linux/kconfig.h
> > > > > -
> > > > > D__KERNEL__ -D__ASSEMBLY__ -fno-PIE -mabi=3Dlp64 -
> > > > > march=3Drv64imafdc
> > > > > -c -o
> > > > > arch/riscv/kernel/head.o arch/riscv/kernel/head.S
> > > > >=20
> > > > > 2. Xen build command of head.S:riscv64-linux-gnu-gcc -MMD -MP
> > > > > -MF
> > > > > arch/riscv/riscv64/.head.o.d -D__ASSEMBLY__ -Wa,--noexecstack
> > > > > -
> > > > > DBUILD_ID -fno-strict-aliasing -Wall -Wstrict-prototypes -
> > > > > Wdeclaration-
> > > > > after-statement -Wno-unused-but-set-variable -Wno-unused-
> > > > > local-
> > > > > typedefs
> > > > > -O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-
> > > > > common -
> > > > > Werror
> > > > > -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -
> > > > > include
> > > > > ./include/xen/config.h -Wa,--strip-local-absolute -g -
> > > > > mabi=3Dlp64 -
> > > > > I./include -I./arch/riscv/include -march=3Drv64gc -mstrict-
> > > > > align -
> > > > > mcmodel=3Dmedany - -c arch/riscv/riscv64/head.S -o
> > > > > arch/riscv/riscv64/head.o
> > > > Looking into why you see different code generated than I:
> > > > Nothing
> > > > in
> > > > here directs gcc to pass -fpic to gas; in upstream gcc
> > > > (consistent
> > > > from gcc7 through gcc12, which are the versions I've checked;
> > > > the
> > > > actual range may be wider) there is
> > > >=20
> > > > #define ASM_SPEC "\
> > > > %(subtarget_asm_debugging_spec) \
> > > > %{" FPIE_OR_FPIC_SPEC ":-fpic} \
> > > > ...
> > > >=20
> > > > Can you check whether your gcc passes -fpic to gas even when
> > > > there's
> > > > no -fPIC / -fPIE (or alike) on the gcc command line? Or whether
> > > > your
> > > > gas (unlike upstream's) defaults to PIC mode? (For .S files
> > > > ASM_SPEC
> > > > is all that counts. For .c files gcc is redundantly passing -
> > > > fpic
> > > > along with also emitting ".option pic" or, in the opposite
> > > > case, it
> > > > is omitting -fpic along with emitting ".option nopic".)
> > > >=20
> > > > You gcc may have been configured with --enable-default-pie,
> > > > while I
> > > > know mine hasn't been (simply because that's the default).
> > >=20
> > > From the thread, the difference is clearly around the pie option,
> > > but
> > > I
> > > have to admit that I'm confused.
> > >=20
> > > With GCC 10 from Debian repos and current staging (modulo the
> > > build
> > > fix), we end up with:
> > >=20
> > > 0000000080200000 <_start>:
> > > =C2=A0=C2=A0=C2=A0 80200000:=C2=A0=C2=A0 10401073=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cs=
rw=C2=A0=C2=A0=C2=A0 sie,zero
> > > =C2=A0=C2=A0=C2=A0 80200004:=C2=A0=C2=A0 00002117=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 au=
ipc=C2=A0=C2=A0 sp,0x2
> > > =C2=A0=C2=A0=C2=A0 80200008:=C2=A0=C2=A0 00413103=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ld=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sp,4(sp) #
> > > 80202008
> > > <_GLOBAL_OFFSET_TABLE_+0x8>
> > > =C2=A0=C2=A0=C2=A0 8020000c:=C2=A0=C2=A0 6285=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 lui=C2=A0=C2=A0=C2=A0=C2=A0 t0,0x1
> > > =C2=A0=C2=A0=C2=A0 8020000e:=C2=A0=C2=A0 9116=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=C2=A0 sp,sp,t0
> > > =C2=A0=C2=A0=C2=A0 80200010:=C2=A0=C2=A0 7f10206f=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 80203000
> > > <start_xen>
> > >=20
> > > In this case, the auipc/ld pair makes a PC-relative reference
> > > into
> > > the
> > > GOT, but the pointer spilled into the GOT is the link time
> > > address of
> > > cpu0_boot_stack.
> > >=20
> > > For the executable as a whole, we've got:
> > >=20
> > > [ 6] .got=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 PROGBITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000=
00080202000 003000
> > > 000010
> > > 08=C2=A0 WA=C2=A0 0=C2=A0=C2=A0 0=C2=A0 8
> > > [ 7] .got.plt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 P=
ROGBITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0000000080202010 003010
> > > 000010
> > > 08=C2=A0 WA=C2=A0 0=C2=A0=C2=A0 0=C2=A0 8
> > >=20
> > > i.e. both nonzero in size, so presumably with expectations of
> > > something
> > > else to fix up the references.
> > >=20
> > > I suspect we want to extend the x86 section asserts into the
> > > other
> > > architectures too, alongside figuring out how exactly to disable
> > > code
> > > generation of this form.
> > >=20
> > But AFAIU it is expected that it will use GOT sections with the
> > link
> > time address of cpu0_boot_stack inside them because of pie option.
> >=20
> > If we need to work with pie option that we can fix all address in
> > .got{.plt} somewhere at the start of head.S
>=20
> While .got is very sensible in "normal" binaries, I think its use
> should
> be avoided in kernels and alike.
>=20
> > but why we can't go with -
> > fno-pie as it is done for other architectures:
>=20
> Why do you ask this repeatedly when the suggestion was to actually
> use EMBEDDED_EXTRA_CFLAGS?
Sorry for that.
I will update the current one patch with EMBEDDED_EXTRA_CFLAGS and back
'lla' to 'la'.
>=20
> > Config.mk:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0EMBEDDED_EXTRA_CFLAGS :=
=3D -fno-pie -fno-stack-protector -
> > fno-
> > stack-protector-all
> > EMBEDDED_EXTRA_CFLAGS +=3D -fno-exceptions -fno-asynchronous-unwind-
> > tables
> >=20
> > arch.mk:
> > =C2=A0=C2=A0=C2=A0 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFL=
AGS))
> >=20
> >=20
> > Could you please explain what is x86 section asserts?
>=20
> If you look at the bottom of x86's xen.lds.S you'll find a number of
> assertions, among them one towards .got being empty. Some of the
> sections checked there may indeed not be applicable on arbitrary
> architectures, but I think .got is sufficiently universal. So I agree
> with Andrew that it may be worthwhile making some of this generic.
>=20
Thanks for the clarification.

~ Oleksii


