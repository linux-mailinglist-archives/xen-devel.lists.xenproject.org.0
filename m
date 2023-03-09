Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8F76B2726
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 15:39:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508301.782861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paHQX-0005gN-Tf; Thu, 09 Mar 2023 14:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508301.782861; Thu, 09 Mar 2023 14:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paHQX-0005dE-QA; Thu, 09 Mar 2023 14:39:29 +0000
Received: by outflank-mailman (input) for mailman id 508301;
 Thu, 09 Mar 2023 14:39:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZdn=7B=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1paHQV-0005d4-PR
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 14:39:27 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30eda378-be88-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 15:39:26 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id l1so2072982wry.12
 for <xen-devel@lists.xenproject.org>; Thu, 09 Mar 2023 06:39:26 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.143.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.143]) by smtp.gmail.com with ESMTPSA id
 p7-20020a5d4e07000000b002c5694aef92sm18008070wrt.21.2023.03.09.06.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:39:25 -0800 (PST)
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
X-Inumbo-ID: 30eda378-be88-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678372766;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4xqnqzy+5ITck08I5hNAADaO358PVyDr57aVU/e2kFM=;
        b=A2JJBryF2zGZ82ISFwwm06DgOkTYaKQt7uaMt4dHwHmpNnN4kUPE/5+6w52fqjn4MO
         rdRGvRjvNv23uF89iSDn/0UvgfwkhPzeYXVE2B3XbNiGrBpc926+SpKoSOvBNoI4tZK0
         c398UF5dVT26poBHfysdwvPYrbDhnQ8V3Yr9UiebHzXyqq4VkBZW17+tk3YyOjWjRG0a
         YVVd9GO8CKMqnpLf6p3X3ydBoqJyLJOiYzv2pWJIghO9RAIzi8TVDYDZ5o/7nYILk9Du
         4Ik0BSVGpgDAb6AI0yEOhby3ZqXRO2L4vugUY7CGzplxMbKI/B16X6TtHNCGitsOUeFj
         sh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678372766;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4xqnqzy+5ITck08I5hNAADaO358PVyDr57aVU/e2kFM=;
        b=nryS9tsNnFuno8p74aj3AxSOCAkVFaf0Ws+wjt+pm72Y70kSb86bIblWLqJZDgoC1o
         UMICoEn3d8ZKP9WaictvVOsElNBMvoutM0kimr2fO4odCtWO7Tc6hn3rUz2iOmrVSMd6
         ENXL8mvmtPIRikiXthgeEFwj7ev8hpXYm1WunIU3KiQKBMSqjDJJK1i1D/nx/Kh/ck6g
         Su98TEB6ZnSOj2Fcg9MHifIdKw/eH4GGrjvoYa7R67expnKcw/lisaZeaFd+s+VSJqc6
         9xlOijJ2DbiQPjRHpnoC9Zv7Zv7A4cO/cuPiciCZPMkf6kPdkPBDr6rvtgaeiRQquOqN
         Bwwg==
X-Gm-Message-State: AO0yUKXK9NxoU+KUVSa7lYbXFdX2yijGQk+ZrVSaxvUBKjCzS2PIffLo
	XddexInRyakFBnYrQ5hefPM=
X-Google-Smtp-Source: AK7set8V7tfDrADHYXqiLCz14PFBloX+Tg+Ik5M09vBeE4Hjg6NUr9OiMl2WgDzVLm/4EDaW9f5MMQ==
X-Received: by 2002:adf:f812:0:b0:2c7:17a2:b70 with SMTP id s18-20020adff812000000b002c717a20b70mr14035832wrp.69.1678372765968;
        Thu, 09 Mar 2023 06:39:25 -0800 (PST)
Message-ID: <b1d55c78e739c1d21b3b29a473ab58af5c0fb374.camel@gmail.com>
Subject: Re: [PATCH v1 2/3] xen/riscv: setup initial pagetables
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>, Julien
 Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Date: Thu, 09 Mar 2023 16:39:24 +0200
In-Reply-To: <e724aac7-1ea0-0d71-c0da-5c01e37f864c@suse.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
	 <83444f8f90cf2adf431762d919ba958a25ff8ce4.1677250203.git.oleksii.kurochko@gmail.com>
	 <52072f1b-0cf8-a218-eefc-a8c1b4cecf43@xen.org>
	 <e2a1968767e7a0f1535920ada14ec2f323e0f9c5.camel@gmail.com>
	 <b8dd2333-5f3b-10ea-7ddd-47bd5f84ca5f@xen.org>
	 <94f5059a4e31ddd29141fa8fe5156b560575ab1e.camel@gmail.com>
	 <9e6a76f1-73c6-9a6e-3444-f3e1cb2d71dc@suse.com>
	 <70c292e708708463ed83ebaf562d51179e9f7f99.camel@gmail.com>
	 <e724aac7-1ea0-0d71-c0da-5c01e37f864c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-03-09 at 10:46 +0100, Jan Beulich wrote:
> On 08.03.2023 17:16, Oleksii wrote:
> > On Wed, 2023-03-08 at 16:17 +0100, Jan Beulich wrote:
> > > On 08.03.2023 15:54, Oleksii wrote:
> > > > Actually after my latest experiments it looks that we don't
> > > > need to
> > > > calculate that things at all because for RISC-V it is=C2=A0 used
> > > > everywhere
> > > > PC-relative access.
> > > > Thereby it doesn't matter what is an address where Xen was
> > > > loaded
> > > > and
> > > > linker address.
> > > > Right now I found only to cases which aren't PC-relative.
> > > > Please look at the patch below:
> > > > diff --git a/xen/arch/riscv/include/asm/config.h
> > > > b/xen/arch/riscv/include/asm/config.h
> > > > index 763a922a04..e1ba613d81 100644
> > > > --- a/xen/arch/riscv/include/asm/config.h
> > > > +++ b/xen/arch/riscv/include/asm/config.h
> > > > @@ -39,7 +39,7 @@
> > > > =C2=A0=C2=A0 name:
> > > > =C2=A0#endif
> > > > =C2=A0
> > > > -#define XEN_VIRT_START=C2=A0 _AT(UL, 0x80200000)
> > > > +#define XEN_VIRT_START=C2=A0 _AT(UL, 0x00200000)
> > >=20
> > > I think this wants to remain the address where Xen actually runs,
> > > and
> > > where Xen is linked to. This ...
> > >=20
> > > > --- a/xen/arch/riscv/traps.c
> > > > +++ b/xen/arch/riscv/traps.c
> > > > @@ -123,8 +123,14 @@ int do_bug_frame(const struct
> > > > cpu_user_regs
> > > > *regs,
> > > > vaddr_t pc)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 const char *filename, *predicate;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 int lineno;
> > > > =C2=A0
> > > > -=C2=A0=C2=A0=C2=A0 static const struct bug_frame* bug_frames[] =3D=
 {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__start_bug_frames[0],
> > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * force fill bug_frames array using auipc=
/addi
> > > > instructions
> > > > to
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * make addresses in bug_frames PC-relativ=
e.
> > > > +=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 const struct bug_frame * force =3D (const struc=
t bug_frame
> > > > *)
> > > > &__start_bug_frames[0];
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 const struct bug_frame* bug_frames[] =3D {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 force,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames=
_0[0],
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames=
_1[0],
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames=
_2[0],
> > >=20
> > > ... array would better be static anyway, and ...
> > >=20
> > > > The changes related to <asm/config.h> are=C2=A0 only to make
> > > > linker_addr
> > > > !=3D
> > > > load_address. So:
> > > > 1. The first issue with cpu0_boot_stack in the head.S file.
> > > > When we
> > > > do:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sp,=
 cpu0_boot_stack
> > > > =C2=A0=C2=A0 Pseudo-instruction la will be transformed to auipc/add=
i OR
> > > > auipc/l{w|d}.
> > > > =C2=A0=C2=A0 It depends on an option: nopic, pic. [1]
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 So the solution can be the following:
> > > > =C2=A0=C2=A0 * As it is done in the patch: add to the start of head=
.S
> > > > ".option=C2=A0=20
> > > > nopic"
> > > > =C2=A0=C2=A0 * Change la to lla thereby it will be always generated
> > > > "auipc/addi"
> > > > to get an address of variable.
> > > >=20
> > > > 2. The second issue is with the code in do_bug_frame() with
> > > > bug_frames
> > > > array:
> > > > =C2=A0=C2=A0 const struct bug_frame* bug_frames[] =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__start_bug_frames[0],
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_0[0],
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_1[0],
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_2[0],
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_3[0],
> > > > =C2=A0=C2=A0=C2=A0 };
> > > > =C2=A0 In this case &{start,stop}bug_frames{,{0-3}} will be changed
> > > > to=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > linker address. In case of when load_addr is 0x80200000 and
> > > > linker_addr
> > > > is 0x00200000 then &{start,stop}bug_frames{,{0-3}} will be
> > > > equal to
> > > > 0x00200000 + X.
> > >=20
> > > ... this "solution" to a problem you introduce by wrongly
> > > modifying
> > > the linked address would then need applying to any other similar
> > > code
> > > pattern found in Xen. Which is (I hope obviously) not a viable
> > > route.
> > > Instead code running before address translation is enable needs
> > > to be
> > > extra careful in what code and data items it accesses, and how.
> > >=20
> > I modified the linked address only for the experiment ( when
> > load_addr
> > !=3D linker_addr to emulate situation Julien told me about), so it's
> > not
> > something I planned to send as a part of the final patch, and I
> > probably forgot to mention that in my previous mail.
> >=20
> > It is only one place where we have to do a kind of 'force' and is
> > needed to make the current state of RISC-V Xen work in case we
> > don't
> > have MMU enabled yet and linker_addr !=3D load_addr. All other cases
> > where it is used something from the range (linker_start,
> > linker_end)
> > will be managed by MMU.
> >=20
> > If we can't use mentioned above solution, we still need to handle
> > the
> > situation when linker_addr !=3D load_addr and MMU isn't enabled yet.
> > Other options to do that:
> > 1. add phys_offset ( | load_addr - linker_addr | ) everywhere where
> > bug_frames array is used: bug_frames[id] + phys_offset
>=20
> Well, that again special cases a certain data structure. As said
> before,
> you need to be very careful with any C code involved before
> translation
> is enabled. Unless you want to retain relocations (so you can "move"
> from load-time to link time addresses alongside enabling translation,
> like we do on x86 in xen.efi), you want to constrain code paths as
> much
> as possible. One approach is to move enabling of translation to early
> assembly code (like we do on x86 for xen.gz). The other is to amend
> involved code paths with something like what you say above.
>=20
> > 2. Check somewhere at the start if linker_addr !=3D load_addr, then
> > throw
> > an error and panic().
>=20
> That's not really an option if the boot loader isn't required to
> place
> the image at its linked address (which would be odd if translation
> isn't expected to be enabled yet at that point). Plus no matter what
> linked address you choose, I guess there may be systems where that
> address range simply isn't (fully) populated with RAM.
>=20
> > Other options might exist. So I would appreciate it if you could
> > suggest me some.
> >=20
> > Could you let me know if any options are suitable for handling a
> > case
> > when linker_addr?
>=20
> Main question is how tied you are to doing this in C. x86 and both
> Arm flavors do it in assembly, with - as said - the exception of
> x86's xen.efi where instead we retain (or generate) and process base
> relocations (see efi_arch_relocate_image(), called by
> efi_arch_post_exit_boot() immediately before switching to the "real"
> page tables).

Thanks for the clarification.

I will look at xen.efi & xen.gz, but I think I will follow scenario 1
or similar to it ( as I did in the path diff with the introduction of
force variable) for now, it is required only to make addresses relative
to phys_offset in one array.

After that, I will enable MMU, and it won't be necessary to add
phys_offset or make similar changes to the introduction of force
variable mentioned in the patch diff.

~ Oleksii

