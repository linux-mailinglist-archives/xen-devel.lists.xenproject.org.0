Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A366B0BF6
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 15:55:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508068.782312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZvBj-0003jI-3d; Wed, 08 Mar 2023 14:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508068.782312; Wed, 08 Mar 2023 14:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZvBi-0003g3-Vz; Wed, 08 Mar 2023 14:54:42 +0000
Received: by outflank-mailman (input) for mailman id 508068;
 Wed, 08 Mar 2023 14:54:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Glg8=7A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pZvBh-0003fw-2z
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 14:54:41 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 236852de-bdc1-11ed-956e-85ef70e17bfa;
 Wed, 08 Mar 2023 15:54:34 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id j3so9994363wms.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Mar 2023 06:54:34 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.143.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.143]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c351100b003e4326a6d53sm21663915wmq.35.2023.03.08.06.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 06:54:32 -0800 (PST)
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
X-Inumbo-ID: 236852de-bdc1-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678287273;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3gxK2ZCB/HNTyuplUWcLOAMGqZ7xQi+JNU9BBv0l8f4=;
        b=ChlOcUqsTpAXIs+cZMdsdiuMRbN8BFlW5++CfDIckorFVPRegnB41Kv2+RhEW0591V
         +gISUQ0I167BMRnnfZCXuJB30blNzOLEgXqINfKvIW+8cYrxMThH6GLptp6IXkMDcMij
         rZ2rjoBiEVoQ0N6L0/ytUsRUCPkS0p+oFj81HNmN6MjvC8aZynJd2gL+3kIoiRx9Lgd5
         GAzJv7sUyNmuhWEvuWmxxgDj//f0uYC9QIj0yfHPLqmBz4aIuBVMYmT+WKs6DHeC36uH
         VvKHA5BK1ZLE7vfULbDALks9cFPqq0sgwJM8g6XwPM3RL/SRcuKUPMeaWa3vxixv8gUD
         AWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678287273;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3gxK2ZCB/HNTyuplUWcLOAMGqZ7xQi+JNU9BBv0l8f4=;
        b=XyZ/P7jISR++QLNRf89pdENPgHfV0eLE4uxEXjmX3xoyybUGZ2yjaZwN+KJbhz3/3Q
         dXtOI6Qt4dIKVlIqHZmZR2OVsQMCGj7rM67Fk5KvF/24Gm7HBiijT3tEXoaSykHLy+Lo
         7QDXR1DMZ4Oy6CEnH66c+Hz4hW7b0kP35EF0WMUuadr2vrz3daImNLRPOPBTQDOIMGYo
         kmtxRq5JO14SxmSduwIb8XhbXiP2oCTizMekiZBkzGgZ0WX8OAbOmBoE5FuCU46VsvJv
         AMUWf6mXaVIrqalSN15/njFfIb7H9n41KsLdMBgiN7yCOb50sjuK2kP71dGpXiZiyNbO
         cLUw==
X-Gm-Message-State: AO0yUKXb9gox7SNz/9UQRZEdS4SNk0rxsRLverQ9cXqZ06sb39FB6gxM
	4+z1FyEv9lwZsUc5erIjUUw=
X-Google-Smtp-Source: AK7set8xndYhnwmXx1yICLxn/kcHhPeVDujlJFBY1YbntJDFwtaJC5KYxAILDCOfqa91RvReqq3Fiw==
X-Received: by 2002:a05:600c:3c8a:b0:3ea:dc39:e8b1 with SMTP id bg10-20020a05600c3c8a00b003eadc39e8b1mr16580458wmb.12.1678287273246;
        Wed, 08 Mar 2023 06:54:33 -0800 (PST)
Message-ID: <94f5059a4e31ddd29141fa8fe5156b560575ab1e.camel@gmail.com>
Subject: Re: [PATCH v1 2/3] xen/riscv: setup initial pagetables
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>
Date: Wed, 08 Mar 2023 16:54:31 +0200
In-Reply-To: <b8dd2333-5f3b-10ea-7ddd-47bd5f84ca5f@xen.org>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
	 <83444f8f90cf2adf431762d919ba958a25ff8ce4.1677250203.git.oleksii.kurochko@gmail.com>
	 <52072f1b-0cf8-a218-eefc-a8c1b4cecf43@xen.org>
	 <e2a1968767e7a0f1535920ada14ec2f323e0f9c5.camel@gmail.com>
	 <b8dd2333-5f3b-10ea-7ddd-47bd5f84ca5f@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-02-27 at 17:45 +0000, Julien Grall wrote:
> Hi,
>=20
> On 27/02/2023 17:17, Oleksii wrote:
> > On Sat, 2023-02-25 at 18:05 +0000, Julien Grall wrote:
> > > Hi,
> > >=20
> > > On 24/02/2023 15:06, Oleksii Kurochko wrote:
> > > > Calculate load and linker linker image addresses and
> > > > setup initial pagetables.
> > > >=20
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > =C2=A0=C2=A0 xen/arch/riscv/setup.c | 11 +++++++++++
> > > > =C2=A0=C2=A0 1 file changed, 11 insertions(+)
> > > >=20
> > > > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > > > index b7cd438a1d..f69bc278bb 100644
> > > > --- a/xen/arch/riscv/setup.c
> > > > +++ b/xen/arch/riscv/setup.c
> > > > @@ -1,9 +1,11 @@
> > > > =C2=A0=C2=A0 #include <xen/bug.h>
> > > > =C2=A0=C2=A0 #include <xen/compile.h>
> > > > =C2=A0=C2=A0 #include <xen/init.h>
> > > > +#include <xen/kernel.h>
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 #include <asm/csr.h>
> > > > =C2=A0=C2=A0 #include <asm/early_printk.h>
> > > > +#include <asm/mm.h>
> > > > =C2=A0=C2=A0 #include <asm/traps.h>
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 /* Xen stack for bringing up the first CPU. */
> > > > @@ -43,6 +45,11 @@ static void __init disable_fpu(void)
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 void __init noreturn start_xen(void)
> > > > =C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long load_start=C2=A0=C2=A0=C2=A0 =3D =
(unsigned long)start;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long load_end=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D load_start + (unsigned
> > > > long)(_end - _start);
> > >=20
> > > I am a bit puzzled, on top of load_addr() and linker_addr(), you
> > > wrote
> > > it can't use global variable/function. But here... you are using
> > > them.
> > > So how is this different?
> > I don't use load_addr() and linker_addr() macros here.
>=20
> I understand that. But my comment was related to:
>=20
> /*
> =C2=A0 * WARNING: load_addr() and linker_addr() are to be called only whe=
n
> the MMU is
> =C2=A0 * disabled and only when executed by the primary CPU.=C2=A0 They c=
annot=20
> refer to
> =C2=A0 * any global variable or functions.
> =C2=A0 */
>=20
> _start and _end are global variables. So why can you use them here
> but=20
> not there?
>=20
> If you could use them in load_addr() then you could simplify a lot
> your=20
> logic.
>=20
I experimented with it and it seems to me that the macros can be used
with functions&global variables so the comment is incorrect.
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long linker_start=C2=A0 =3D (unsigned =
long)_start;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long linker_end=C2=A0=C2=A0=C2=A0 =3D =
(unsigned long)_end;
> > >=20
> > > I am a bit confused with how you define the start/end for both
> > > the
> > > linker and load. In one you use _start and the other _end.
> > >=20
> > > Both are fixed at compile time, so I assume the values will be a
> > > linked
> > > address rather than the load address. So how is this meant to
> > > how?
> > >=20
> > _start, _end - it is label from linker script so I use them to
> > define
> > linker_start and linker_end addresses.
> >=20
> > load_start is defined as an address of start() function from head.S
> > and
> > load_end is the load_start + the size=C2=A0 (_end - _start)
>=20
> I think you misunderstood my comment. I understand what the variables
> are for. But I don't understand the computation because Xen could be=20
> loaded at a different address than the runtime address.
>=20
What do you mean here by the runtime address? Do you mean an address
where boot loader put Xen? Or an address after relocation, or something
else?

Actually after my latest experiments it looks that we don't need to
calculate that things at all because for RISC-V it is  used everywhere
PC-relative access.
Thereby it doesn't matter what is an address where Xen was loaded and
linker address.
Right now I found only to cases which aren't PC-relative.
Please look at the patch below:
diff --git a/xen/arch/riscv/include/asm/config.h
b/xen/arch/riscv/include/asm/config.h
index 763a922a04..e1ba613d81 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -39,7 +39,7 @@
   name:
 #endif
=20
-#define XEN_VIRT_START  _AT(UL, 0x80200000)
+#define XEN_VIRT_START  _AT(UL, 0x00200000)
=20
 #define SMP_CACHE_BYTES (1 << 6)
=20
diff --git a/xen/arch/riscv/riscv64/head.S
b/xen/arch/riscv/riscv64/head.S
index ffd95f9f89..87842632e9 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,5 +1,7 @@
 #include <asm/riscv_encoding.h>
=20
+        .option nopic
+
         .section .text.header, "ax", %progbits
=20
 ENTRY(start)
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index d87a9cfd2c..cd0acdee51 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -123,8 +123,14 @@ int do_bug_frame(const struct cpu_user_regs *regs,
vaddr_t pc)
     const char *filename, *predicate;
     int lineno;
=20
-    static const struct bug_frame* bug_frames[] =3D {
-        &__start_bug_frames[0],
+    /*
+     * force fill bug_frames array using auipc/addi instructions to
+     * make addresses in bug_frames PC-relative.
+    */
+    const struct bug_frame * force =3D (const struct bug_frame *)
&__start_bug_frames[0];
+
+    const struct bug_frame* bug_frames[] =3D {
+        force,
         &__stop_bug_frames_0[0],
         &__stop_bug_frames_1[0],
         &__stop_bug_frames_2[0],

The changes related to <asm/config.h> are  only to make linker_addr !=3D
load_address. So:
1. The first issue with cpu0_boot_stack in the head.S file. When we do:
      la      sp, cpu0_boot_stack
   Pseudo-instruction la will be transformed to auipc/addi OR
auipc/l{w|d}.
   It depends on an option: nopic, pic. [1]
  =20
   So the solution can be the following:
   * As it is done in the patch: add to the start of head.S ".option =20
nopic"
   * Change la to lla thereby it will be always generated "auipc/addi"
to get an address of variable.

2. The second issue is with the code in do_bug_frame() with bug_frames
array:
   const struct bug_frame* bug_frames[] =3D {
        &__start_bug_frames[0],
        &__stop_bug_frames_0[0],
        &__stop_bug_frames_1[0],
        &__stop_bug_frames_2[0],
        &__stop_bug_frames_3[0],
    };
  In this case &{start,stop}bug_frames{,{0-3}} will be changed to    =20
linker address. In case of when load_addr is 0x80200000 and linker_addr
is 0x00200000 then &{start,stop}bug_frames{,{0-3}} will be equal to
0x00200000 + X.
  =20
    To force using addresses related to load_addr  in bug_frames, it is
necessary to declare a variable with getting an address of
&__{start,stop}bug_frames{,{0-3}} thereby it will generate the code:
        2002c2:       00001797                auipc   a5,0x1
	2002c6:       d3e78793                addi    a5,a5,-706 #
201000 <__start_bug_frames>
	2002ca:       faf43c23                sd      a5,-72(s0)
	2002ce:       00001797                auipc   a5,0x1
	2002d2:       d3a78793                addi    a5,a5,-710 #
201008 <__stop_bug_frames_

> >=20
> > > Furthermore, I would expect linker_start and load_start to point
> > > to
> > > the
> > > same symbol (the only different is one store the virtual address
> > > whereas
> > > the other the physical address). But here you are technically
> > > using
> > > two
> > > different symbol. Can you explain why?
> > It is used to make identity mapping for the range [load_addr,
> > load_end]
> > and [linker_addr, linker_end]. It was done so because in Bobby's
> > patches in the linker script XEN_VIRT_START is defined as
> > _AT(vaddr_t,0x00200000) but bootloader loads Xen at 0x80200000 and
> > so
> > in this case loadr_addr !=3D linker_addr.
> > But I have changed XEN_VIRT_START to 0x8020...00 so they are equal
> > now.
>=20
> So this will be broken as soon as this code will be tested on an=20
> hardware where there is no RAM at 0x8020...00. I would strongly=20
> recommend for you to test your code with XEN_VIRT_START !=3D load
> address.
I've added the check to the new version of the patch but please the
comments above.
>=20
> > >=20
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The following things a=
re passed by bootloader:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 a0 -> hart=
_id
> > > > @@ -65,6 +72,10 @@ void __init noreturn start_xen(void)
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_macros_from_bug_h();
> > > > =C2=A0=C2=A0=20
> > > > +=C2=A0=C2=A0=C2=A0 setup_initial_pagetables(load_start, load_end,
> > > > linker_start,
> > > > linker_end);
> > >=20
> > > Shouldn't this happen earlier in start_xen()?
> > It can. If to be honest I don't know if it should. I added at the
> > end
> > only because it was the last thing I worked on...
>=20
> I think we should enable the MMU and switch to the runtime mapping as
> early as possible.
I realized that during the mentioned above experiments.

~ Oleksii


