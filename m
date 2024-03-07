Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFDA874C86
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 11:37:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689748.1074990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riB6U-0006VI-Kr; Thu, 07 Mar 2024 10:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689748.1074990; Thu, 07 Mar 2024 10:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riB6U-0006Tc-HV; Thu, 07 Mar 2024 10:35:58 +0000
Received: by outflank-mailman (input) for mailman id 689748;
 Thu, 07 Mar 2024 10:35:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqh0=KN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1riB6T-0006TR-CL
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 10:35:57 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a27cf35-dc6e-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 11:35:55 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-513173e8191so890714e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 02:35:55 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q28-20020ac2515c000000b005116d8eec66sm2996532lfd.216.2024.03.07.02.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 02:35:53 -0800 (PST)
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
X-Inumbo-ID: 7a27cf35-dc6e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709807754; x=1710412554; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uADE57dssii6EGqzuzhOShPjg2S28MNK0B3pGlSsvyI=;
        b=ZZG6hgVs45EFNTDMttUOB+TsrXNVuL+gcG188rd3OtwV2WpXJoAS+UR/3NGanINKC6
         Rczljv/53LTGQvmQUNRizscp9WxSaWUheNng8B+6LA04+3/9yS+EM2ICKc4oBBXyqLh6
         3btd7JeIqBILEGehNpxYAHANszslvFZ9PcXh06nTX5j+BMeUgArERfUtIQbhy67fg2JP
         VxYDgqqfr6EEttRkI1nXPEcVjvHHu/2HHxcClaG3O7TlkEQPLlp79H/b5SV3vZP3+kQy
         mKV5/NQlYFvJ0RnW62s/e13ST/XBI+fzgiJwrh7t5yBe/f+b7mtaQnEMh+vtnabuQ8CE
         Q89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709807754; x=1710412554;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uADE57dssii6EGqzuzhOShPjg2S28MNK0B3pGlSsvyI=;
        b=Lg6nJM6PchpXfH+qUEiDRe6AGmoG6MZeC3Qoj69NRaraonLYLQEaKHVFBMqZerxb0D
         Vm8byWkIftlpjuC9dmhUR3ctn3eAB0sNQVOaCo/8j6nhfyDyQgjyo1VBi2BC91JEaQTL
         UzqTkxrBv2HKl8glzEZ7e4JZ8RiAfTgxKX+5LThryK6XAu4F/Ie9cuSyOtup4fK1hcTj
         tUuK6atCWx13GaEjeqaEGajat4HbrMlVKflPHlvAOXTnSTuk58u75Mmun+m3zC6grknC
         vWpZjMg/P96JJ5gzFfTEHzUSilhbeGYrOFhUwe31631/wOU0ICzz8e0AfWW1Uyx0M9fj
         eoEw==
X-Forwarded-Encrypted: i=1; AJvYcCX+tLEa2/lp51YSe1Lmcx0ZfhRyC9n5RpdzX9DXX3drScAb8DIMF12bLs0XwYYSubyv2cLDUIYjlcUavLDPdqm9Ud35IcxjVcdfhR72YRc=
X-Gm-Message-State: AOJu0Yw4TeaIjzWrgOpETrj2/8xK+zPgxLDUUq7XfbguM53cxrAQJcu4
	Dt+ijSkChMNKSk7SPl+MajEHybmf8nqjialNxK2eirszjZBdHk1T
X-Google-Smtp-Source: AGHT+IGcdHiQQ0pnaYTmHaTmRYuQ3eucUUnTxNuaSlBl83o9Tvxa8o/jYKCwmAoZ2tq+D7kNmrNd2Q==
X-Received: by 2002:a05:6512:308d:b0:513:5e6b:a191 with SMTP id z13-20020a056512308d00b005135e6ba191mr1236557lfd.50.1709807753932;
        Thu, 07 Mar 2024 02:35:53 -0800 (PST)
Message-ID: <f6e16589bfbcd94d6f62c34f080cbcd3406eca6f.camel@gmail.com>
Subject: Re: [PATCH v5 11/23] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 07 Mar 2024 11:35:52 +0100
In-Reply-To: <23ff1c20-91f3-4c60-9562-7f1cd57c1043@suse.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <ce7604de39b3480553eeaeafc11138494016983f.1708962629.git.oleksii.kurochko@gmail.com>
	 <23ff1c20-91f3-4c60-9562-7f1cd57c1043@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-03-06 at 15:56 +0100, Jan Beulich wrote:
> On 26.02.2024 18:38, Oleksii Kurochko wrote:
> > The header was taken from Linux kernl 6.4.0-rc1.
> >=20
> > Addionally, were updated:
> > * add emulation of {cmp}xchg for 1/2 byte types using 32-bit atomic
> > =C2=A0 access.
> > * replace tabs with spaces
> > * replace __* variale with *__
> > * introduce generic version of xchg_* and cmpxchg_*.
> >=20
> > Implementation of 4- and 8-byte cases were left as it is done in
> > Linux kernel as according to the RISC-V spec:
> > ```
> > Table A.5 ( only part of the table was copied here )
> >=20
> > Linux Construct=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RVWMO Mapping
> > atomic <op> relaxed=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}
> > atomic <op> acquire=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}.aq
> > atomic <op> release=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}.rl
> > atomic <op>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 amo<op>.{w|d}.aqrl
> >=20
> > Linux Construct=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RVWMO LR/SC Mapping
> > atomic <op> relaxed=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}; <op>; sc.{w|d}; b=
nez loop
> > atomic <op> acquire=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}.aq; <op>; sc.{w|d}=
; bnez loop
> > atomic <op> release=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}; <op>; sc.{w|d}.aq=
rl=E2=88=97 ; bnez
> > loop OR
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence.tso; =
loop: lr.{w|d}; <op>; sc.{w|d}=E2=88=97 ;
> > bnez loop
> > atomic <op>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl; bnez
> > loop
> >=20
> > The Linux mappings for release operations may seem stronger than
> > necessary,
> > but these mappings are needed to cover some cases in which Linux
> > requires
> > stronger orderings than the more intuitive mappings would provide.
> > In particular, as of the time this text is being written, Linux is
> > actively
> > debating whether to require load-load, load-store, and store-store
> > orderings
> > between accesses in one critical section and accesses in a
> > subsequent critical
> > section in the same hart and protected by the same synchronization
> > object.
> > Not all combinations of FENCE RW,W/FENCE R,RW mappings with aq/rl
> > mappings
> > combine to provide such orderings.
> > There are a few ways around this problem, including:
> > 1. Always use FENCE RW,W/FENCE R,RW, and never use aq/rl. This
> > suffices
> > =C2=A0=C2=A0 but is undesirable, as it defeats the purpose of the aq/rl
> > modifiers.
> > 2. Always use aq/rl, and never use FENCE RW,W/FENCE R,RW. This does
> > not
> > =C2=A0=C2=A0 currently work due to the lack of load and store opcodes w=
ith aq
> > and rl
> > =C2=A0=C2=A0 modifiers.
>=20
> As before I don't understand this point. Can you give an example of
> what
> sort of opcode / instruction is missing?
If I understand the spec correctly then l{b|h|w|d} and s{b|h|w|d}
instructions don't have aq or rl annotation. Here is text from the
spec:
   ARM Operation                  RVWMO Mapping
   Load                           l{b|h|w|d}
   Load-Acquire                   fence rw, rw; l{b|h|w|d}; fence r,rw=20
   Load-Exclusive                 lr.{w|d}
   Load-Acquire-Exclusive         lr.{w|d}.aqrl
   Store                          s{b|h|w|d}
   Store-Release                  fence rw,w; s{b|h|w|d}
   Store-Exclusive                sc.{w|d}
   Store-Release-Exclusive        sc.{w|d}.rl
   dmb                            fence rw,rw
   dmb.ld                         fence r,rw
   dmb.st                         fence w,w
   isb                            fence.i; fence r,r
     Table A.4: Mappings from ARM operations to RISC-V operations

   Table A.4 provides a mapping from ARM memory operations onto RISC-V
   memory instructions.
   Since RISC-V does not currently have plain load and store opcodes with
   aq or rl annotations, ARM
   load-acquire and store-release operations should be mapped using fences
   instead.

>=20
> > 3. Strengthen the mappings of release operations such that they
> > would
> > =C2=A0=C2=A0 enforce sufficient orderings in the presence of either typ=
e of
> > acquire mapping.
> > =C2=A0=C2=A0 This is the currently-recommended solution, and the one sh=
own in
> > Table A.5.
> > ```
> >=20
> > But in Linux kenrel atomics were strengthen with fences:
> > ```
> > Atomics present the same issue with locking: release and acquire
> > variants need to be strengthened to meet the constraints defined
> > by the Linux-kernel memory consistency model [1].
> >=20
> > Atomics present a further issue: implementations of atomics such
> > as atomic_cmpxchg() and atomic_add_unless() rely on LR/SC pairs,
> > which do not give full-ordering with .aqrl; for example, current
> > implementations allow the "lr-sc-aqrl-pair-vs-full-barrier" test
> > below to end up with the state indicated in the "exists" clause.
> >=20
> > In order to "synchronize" LKMM and RISC-V's implementation, this
> > commit strengthens the implementations of the atomics operations
> > by replacing .rl and .aq with the use of ("lightweigth") fences,
> > and by replacing .aqrl LR/SC pairs in sequences such as:
> >=20
> > 0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lr.w.aqrl=C2=A0 %0, %addr
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bne=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 %0, %old, 1f
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc.w.aqrl=C2=A0 %1, %new, %a=
ddr
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bnez=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 %1, 0b
> > 1:
> >=20
> > with sequences of the form:
> >=20
> > 0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lr.w=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 %0, %addr
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bne=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 %0, %old, 1f
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ...
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc.w.rl=C2=A0=C2=A0=C2=A0 %1=
, %new, %addr=C2=A0=C2=A0 /* SC-release=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bnez=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 %1, 0b
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 rw, rw=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /* "full" fence */
> > 1:
> >=20
> > following Daniel's suggestion.
> >=20
> > These modifications were validated with simulation of the RISC-V
> > memory consistency model.
> >=20
> > C lr-sc-aqrl-pair-vs-full-barrier
> >=20
> > {}
> >=20
> > P0(int *x, int *y, atomic_t *u)
> > {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r0;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r1;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WRITE_ONCE(*x, 1);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r0 =3D atomic_cmpxchg(u, 0, =
1);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r1 =3D READ_ONCE(*y);
> > }
> >=20
> > P1(int *x, int *y, atomic_t *v)
> > {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r0;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r1;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WRITE_ONCE(*y, 1);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r0 =3D atomic_cmpxchg(v, 0, =
1);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r1 =3D READ_ONCE(*x);
> > }
> >=20
> > exists (u=3D1 /\ v=3D1 /\ 0:r1=3D0 /\ 1:r1=3D0)
>=20
> While I'm entirely willing to trust this can happen, I can't bring
> this
> in line with the A extension spec.
>=20
> Additionally it's not clear to me in how far all of this applies when
> you don't really use LR/SC in the 4- and 8-byte cases (and going
> forward
> likely also not in the 1- and 2-byte case, utilizing Zahba when
> available).
It just explain what combination of fences, lr/sc, amoswap, .aq and .rl
annotation can be combined, and why combinations introduced in this
patch are used.

>=20
> > ---
> > Changes in V5:
> > =C2=A0- update the commit message.
> > =C2=A0- drop ALIGN_DOWN().
> > =C2=A0- update the definition of emulate_xchg_1_2():=20
> > =C2=A0=C2=A0 - lr.d -> lr.w, sc.d -> sc.w.
> > =C2=A0=C2=A0 - drop ret argument.
> > =C2=A0=C2=A0 - code style fixes around asm volatile.
> > =C2=A0=C2=A0 - update prototype.
> > =C2=A0=C2=A0 - use asm named operands.
> > =C2=A0=C2=A0 - rename local variables.
> > =C2=A0=C2=A0 - add comment above the macros
> > =C2=A0- update the definition of __xchg_generic:
> > =C2=A0=C2=A0 - drop local ptr__ variable.
> > =C2=A0=C2=A0 - code style fixes around switch()
> > =C2=A0=C2=A0 - update prototype.
> > =C2=A0- introduce RISCV_FULL_BARRIES.
> > =C2=A0- redefine cmpxchg()
> > =C2=A0- update emulate_cmpxchg_1_2():
> > =C2=A0=C2=A0 - update prototype
> > =C2=A0=C2=A0 - update local variables names and usage of them
> > =C2=A0=C2=A0 - use name asm operands.
> > =C2=A0=C2=A0 - add comment above the macros
> > ---
> > Changes in V4:
> > =C2=A0- Code style fixes.
> > =C2=A0- enforce in __xchg_*() has the same type for new and *ptr, also
> > "\n"
> > =C2=A0=C2=A0 was removed at the end of asm instruction.
> > =C2=A0- dependency from
> > https://lore.kernel.org/xen-devel/cover.1706259490.git.federico.serafin=
i@bugseng.com/
> > =C2=A0- switch from ASSERT_UNREACHABLE to STATIC_ASSERT_UNREACHABLE().
> > =C2=A0- drop xchg32(ptr, x) and xchg64(ptr, x) as they aren't used.
> > =C2=A0- drop cmpxcg{32,64}_{local} as they aren't used.
> > =C2=A0- introduce generic version of xchg_* and cmpxchg_*.
> > =C2=A0- update the commit message.
> > ---
> > Changes in V3:
> > =C2=A0- update the commit message
> > =C2=A0- add emulation of {cmp}xchg_... for 1 and 2 bytes types
> > ---
> > Changes in V2:
> > =C2=A0- update the comment at the top of the header.
> > =C2=A0- change xen/lib.h to xen/bug.h.
> > =C2=A0- sort inclusion of headers properly.
> > ---
> > =C2=A0xen/arch/riscv/include/asm/cmpxchg.h | 258
> > +++++++++++++++++++++++++++
> > =C2=A01 file changed, 258 insertions(+)
> > =C2=A0create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h
> >=20
> > diff --git a/xen/arch/riscv/include/asm/cmpxchg.h
> > b/xen/arch/riscv/include/asm/cmpxchg.h
> > new file mode 100644
> > index 0000000000..66cbe26737
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> > @@ -0,0 +1,258 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/* Copyright (C) 2014 Regents of the University of California */
> > +
> > +#ifndef _ASM_RISCV_CMPXCHG_H
> > +#define _ASM_RISCV_CMPXCHG_H
> > +
> > +#include <xen/compiler.h>
> > +#include <xen/lib.h>
> > +
> > +#include <asm/fence.h>
> > +#include <asm/io.h>
> > +#include <asm/system.h>
> > +
> > +#define __amoswap_generic(ptr, new, ret, sfx, pre, post) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 asm volatile( \
>=20
> Nit: In Xen style this is lacking a blank ahead of the opening
> parenthesis.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pre \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " amoswap" sfx " %0, %2, %1=
\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 post \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (ret), "+A" (*ptr)=
 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (new) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory" ); \
> > +})
> > +
> > +/*
> > + * For LR and SC, the A extension requires that the address held
> > in rs1 be
> > + * naturally aligned to the size of the operand (i.e., eight-byte
> > aligned
> > + * for 64-bit words and four-byte aligned for 32-bit words).
> > + * If the address is not naturally aligned, an address-misaligned
> > exception
> > + * or an access-fault exception will be generated.
> > + *=20
> > + * Thereby:
> > + * - for 1-byte xchg access the containing word by clearing low
> > two bits
> > + * - for 2-byte xchg ccess the containing word by clearing first
> > bit.
>=20
> "first bit" can still be ambiguous. Better say "bit 1".
>=20
> > + *=20
>=20
> Here and apparently also elsewhere: Stray trailing blank. Git has a
> config
> setting to warn you about (maybe even to automatically strip? such.
It  would be useful for me. Thanks a lot for such recommendation.

>=20
> > + * If resulting 4-byte access is still misalgined, it will fault
> > just as
> > + * non-emulated 4-byte access would.
> > + */
> > +#define emulate_xchg_1_2(ptr, new, sc_sfx, pre, post) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 uint32_t *aligned_ptr =3D (uint32_t *)((unsigned lo=
ng)ptr &
> > ~(0x4 - sizeof(*ptr))); \
>=20
> Here and elsewhere: sizeof(*(ptr)) (i.e. the inner parentheses are
> needed
> also there).
>=20
> > +=C2=A0=C2=A0=C2=A0 uint8_t new_val_pos =3D ((unsigned long)(ptr) & (0x=
4 -
> > sizeof(*ptr))) * BITS_PER_BYTE; \
>=20
> Why uint8_t?
It is enough to cover possible start bit position of value that should
be updated, so I decided to use uint8_t.

>=20
> > +=C2=A0=C2=A0=C2=A0 unsigned long mask =3D GENMASK(((sizeof(*ptr)) * BI=
TS_PER_BYTE)
> > - 1, 0) << new_val_pos; \
> > +=C2=A0=C2=A0=C2=A0 unsigned int new_ =3D new << new_val_pos; \
> > +=C2=A0=C2=A0=C2=A0 unsigned int old_val; \
> > +=C2=A0=C2=A0=C2=A0 unsigned int xchged_val; \
> > +=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 asm volatile ( \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pre \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0: lr.w %[op_oldval], %[op=
_aligned_ptr]\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 and=C2=A0 %[o=
p_xchged_val], %[op_oldval], %z[op_nmask]\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 or=C2=A0=C2=
=A0 %[op_xchged_val], %[op_xchged_val], %z[op_new]\n"
> > \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 sc.w" sc_sfx =
" %[op_xchged_val], %[op_xchged_val],
> > %[op_aligned_ptr]\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 bnez %[op_xch=
ged_val], 0b\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 post \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : [op_oldval] "=3D&r" (old_=
val), [op_xchged_val] "=3D&r"
> > (xchged_val), [op_aligned_ptr]"+A" (*aligned_ptr) \
>=20
> Too long line. Partly because you have op_ prefixes here which I
> can't
> recognized what they would be good for. The val / _val suffixes also
> don't appear to carry much useful information. And "xchged", being
> explicitly past tense, doesn't look to fit even up and until the SC,
> not to speak of afterwards. Anything wrong with calling this just
> tmp,
> aux, or scratch?
op_ can be dropped and named operand can be equal to local variable
name, I thought it would be useful to understand that it is named
operand, but after rethinking it looks like unneeded overhead.

In case of emulate_xchg_1_2() there is no sense in val/_val suffixes as
local variables don't intersect with macros variable, and the suffixes
were added just to be in sync with emulate_cmpxchg_1_2 macros, but in
case of emulate_cmpxchg_1_2(ptr, old, new, sc_sfx, pre, post), the
macros has old argument, so to distinguish them _val was added.
Probably, it would be better to rename it to read or read_old.


>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : [op_new] "rJ" (new_), [op=
_nmask] "rJ" (~mask) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory" ); \
> > +=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr)))((old_val & mask) >> new_val_po=
s); \
> > +})
> > +
> > +#define __xchg_generic(ptr, new, size, sfx, pre, post) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) new__ =3D (new); \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) ret__; \
> > +=C2=A0=C2=A0=C2=A0 switch ( size ) \
>=20
> Can't this use sizeof(*(ptr)), allowing for one less macro parameter?
>=20
> > +=C2=A0=C2=A0=C2=A0 { \
> > +=C2=A0=C2=A0=C2=A0 case 1: \
> > +=C2=A0=C2=A0=C2=A0 case 2: \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret__ =3D emulate_xchg_1_2(=
ptr, new__, sfx, pre, post); \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break; \
> > +=C2=A0=C2=A0=C2=A0 case 4: \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __amoswap_generic(ptr, new_=
_, ret__,\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ".w" sfx,=C2=A0 pre, post); \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break; \
> > +=C2=A0=C2=A0=C2=A0 case 8: \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __amoswap_generic(ptr, new_=
_, ret__,\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ".d" sfx,=C2=A0 pre, post); \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break; \
>=20
> In io.h you make sure to avoid rv64-only insns. Here you don't. The
> build
> would fail either way, but this still looks inconsistent.
>=20
> Also nit: Stray double blands (twice) ahead of "pre". Plus with this
> style
> of line continuation you want to consistently have exactly one blank
> ahead
> of each backslash.
>=20
> > +=C2=A0=C2=A0=C2=A0 default: \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 STATIC_ASSERT_UNREACHABLE()=
; \
> > +=C2=A0=C2=A0=C2=A0 } \
> > +=C2=A0=C2=A0=C2=A0 ret__; \
> > +})
> > +
> > +#define xchg_relaxed(ptr, x) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) x_ =3D (x); \
>=20
> What is the purpose of this, when __xchg_generic() already does this
> same
> type conversion?
>=20
> > +=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(=
*(ptr)),
> > "", "", ""); \
> > +})
> > +
> > +#define xchg_acquire(ptr, x) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) x_ =3D (x); \
> > +=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(=
*(ptr)), \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "", "",
> > RISCV_ACQUIRE_BARRIER); \
> > +})
> > +
> > +#define xchg_release(ptr, x) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) x_ =3D (x); \
> > +=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(=
*(ptr)),\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "", RISCV_RELEASE_BARRIER,
> > ""); \
> > +})
>=20
> As asked before: Are there going to be any uses of these three?
> Common
> code doesn't require them. And not needing to provide them would
> simplify things quite a bit, it seems.
I checked my private branches and it looks to me that I introduced them
only for the correspondent atomic operations ( which was copied from
Linux Kernel ) which are not also used.

So we could definitely drop these macros for now, but should
xchg_generic() be updated as well? If to look at:
 #define xchg(ptr, x) __xchg_generic(ptr, (unsigned long)(x), sizeof(*
(ptr)), \
                                    ".aqrl", "", "")
Last two arguments start to be unneeded, but I've wanted to leave them,
in case someone will needed to back xchg_{release, acquire, ...}. Does
it make any sense?

>=20
> > +#define xchg(ptr, x) __xchg_generic(ptr, (unsigned long)(x),
> > sizeof(*(ptr)), \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".aqrl",=
 "", "")
>=20
> According to the earlier comment (where I don't follow the example
> given),
> is .aqrl sufficient here? And even if it was for the 4- and 8-byte
> cases,
> is it sufficient in the 1- and 2-byte emulation case (where it then
> is
> appended to just the SC)?
If I understand your question correctly then accroding to the spec.,
.aqrl is enough for amo<op>.{w|d} instructions:
   Linux Construct        RVWMO AMO Mapping
   atomic <op> relaxed    amo<op>.{w|d}
   atomic <op> acquire    amo<op>.{w|d}.aq
   atomic <op> release    amo<op>.{w|d}.rl
   atomic <op>            amo<op>.{w|d}.aqrl
but in case of lr/sc you are right sc requires suffix too:
   Linux Construct        RVWMO LR/SC Mapping
   atomic <op> relaxed    loop: lr.{w|d}; <op>; sc.{w|d}; bnez loop
   atomic <op> acquire    loop: lr.{w|d}.aq; <op>; sc.{w|d}; bnez loop
   atomic <op> release    loop: lr.{w|d}; <op>; sc.{w|d}.aqrl=E2=88=97 ; bn=
ez=20
   loop OR fence.tso; loop: lr.{w|d}; <op>; sc.{w|d}=E2=88=97 ; bnez loop
   atomic <op>            loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl; bnez
   loop
  =20
I will add sc_sfx to emulate_xchg_1_2(). The only question is left if
__xchg_generic(ptr, new, size, sfx, pre, post) should be changed to:
__xchg_generic(ptr, new, size, sfx1, sfx2, pre, post) to cover both
cases amo<op>.{w|d}.sfx1 and lr.{w|d}.sfx1 ... sc.{w|d}.sfx2?

~ Oleksii

>=20
> > +#define __generic_cmpxchg(ptr, old, new, ret, lr_sfx, sc_sfx, pre,
> > post)	\
> > + ({ \
> > +=C2=A0=C2=A0=C2=A0 register unsigned int rc; \
> > +=C2=A0=C2=A0=C2=A0 asm volatile( \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pre \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0: lr" lr_sfx " %0, %2\n" =
\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 bne=C2=A0 %0,=
 %z3, 1f\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 sc" sc_sfx " =
%1, %z4, %2\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 bnez %1, 0b\n=
" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 post \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1:\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3D&r" (ret), "=3D&r" (r=
c), "+A" (*ptr) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "rJ" (old), "rJ" (new) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory"); \
> > + })
> > +
> > +/*
> > + * For LR and SC, the A extension requires that the address held
> > in rs1 be
> > + * naturally aligned to the size of the operand (i.e., eight-byte
> > aligned
> > + * for 64-bit words and four-byte aligned for 32-bit words).
> > + * If the address is not naturally aligned, an address-misaligned
> > exception
> > + * or an access-fault exception will be generated.
> > + *=20
> > + * Thereby:
> > + * - for 1-byte xchg access the containing word by clearing low
> > two bits
> > + * - for 2-byte xchg ccess the containing word by clearing first
> > bit.
> > + *=20
> > + * If resulting 4-byte access is still misalgined, it will fault
> > just as
> > + * non-emulated 4-byte access would.
> > + *
> > + * old_val was casted to unsigned long at the end of the define
> > because of
> > + * the following issue:
> > + * ./arch/riscv/include/asm/cmpxchg.h:166:5: error: cast to
> > pointer from integer of different size [-Werror=3Dint-to-pointer-
> > cast]
> > + * 166 |=C2=A0=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr)))(old_val >> new_v=
al_pos); \
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^
> > + * ./arch/riscv/include/asm/cmpxchg.h:184:17: note: in expansion
> > of macro 'emulate_cmpxchg_1_2'
> > + * 184 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret__ =3D emu=
late_cmpxchg_1_2(ptr, old, new, \
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
> > + * ./arch/riscv/include/asm/cmpxchg.h:227:5: note: in expansion of
> > macro '__cmpxchg_generic'
> > + * 227 |=C2=A0=C2=A0=C2=A0=C2=A0 __cmpxchg_generic(ptr, (unsigned long=
)(o), (unsigned
> > long)(n), \
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~
> > + * ./include/xen/lib.h:141:26: note: in expansion of macro
> > '__cmpxchg'
> > + * 141 |=C2=A0=C2=A0=C2=A0=C2=A0 ((__typeof__(*(ptr)))__cmpxchg(ptr, (=
unsigned
> > long)o_,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~
> > + * common/event_channel.c:109:13: note: in expansion of macro
> > 'cmpxchgptr'
> > + * 109 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 cmpxchgptr(&xen_consumers[i], NULL, fn);
> > + */
>=20
> This is too much detail on the compile issue. Just mentioning that
> said
> cast is needed for cmpxchgptr() ought to be sufficient.
>=20
> > +#define emulate_cmpxchg_1_2(ptr, old, new, sc_sfx, pre, post) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 uint32_t *aligned_ptr =3D (uint32_t *)((unsigned lo=
ng)ptr &
> > ~(0x4 - sizeof(*ptr))); \
> > +=C2=A0=C2=A0=C2=A0 uint8_t new_val_pos =3D ((unsigned long)(ptr) & (0x=
4 -
> > sizeof(*ptr))) * BITS_PER_BYTE; \
> > +=C2=A0=C2=A0=C2=A0 unsigned long mask =3D GENMASK(((sizeof(*ptr)) * BI=
TS_PER_BYTE)
> > - 1, 0) << new_val_pos; \
> > +=C2=A0=C2=A0=C2=A0 unsigned int old_ =3D old << new_val_pos; \
> > +=C2=A0=C2=A0=C2=A0 unsigned int new_ =3D new << new_val_pos; \
> > +=C2=A0=C2=A0=C2=A0 unsigned int old_val; \
> > +=C2=A0=C2=A0=C2=A0 unsigned int xchged_val; \
> > +=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ ( \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pre \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0: lr.w %[op_xchged_val], =
%[op_aligned_ptr]\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 and=C2=A0 %[o=
p_oldval], %[op_xchged_val], %z[op_mask]\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 bne=C2=A0 %[o=
p_oldval], %z[op_old], 1f\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 xor=C2=A0 %[o=
p_xchged_val], %[op_oldval],
> > %[op_xchged_val]\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 or=C2=A0=C2=
=A0 %[op_xchged_val], %[op_xchged_val], %z[op_new]\n"
> > \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 sc.w" sc_sfx =
" %[op_xchged_val], %[op_xchged_val],
> > %[op_aligned_ptr]\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 bnez %[op_xch=
ged_val], 0b\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 post \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1:\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : [op_oldval] "=3D&r" (old_=
val), [op_xchged_val] "=3D&r"
> > (xchged_val), [op_aligned_ptr] "+A" (*aligned_ptr) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : [op_old] "rJ" (old_), [op=
_new] "rJ" (new_), \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [op_mask] "rJ" =
(mask) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory" ); \
> > +=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr)))((unsigned long)old_val >> new_=
val_pos); \
> > +})
> > +
> > +/*
> > + * Atomic compare and exchange.=C2=A0 Compare OLD with MEM, if
> > identical,
> > + * store NEW in MEM.=C2=A0 Return the initial value in MEM.=C2=A0 Succ=
ess is
> > + * indicated by comparing RETURN with OLD.
> > + */
> > +#define __cmpxchg_generic(ptr, old, new, size, sc_sfx, pre, post)
> > \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(ptr) ptr__ =3D (ptr); \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) old__ =3D (__typeof__(*(ptr)))(o=
ld); \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) new__ =3D (__typeof__(*(ptr)))(n=
ew); \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) ret__; \
> > +=C2=A0=C2=A0=C2=A0 switch ( size ) \
> > +=C2=A0=C2=A0=C2=A0 { \
> > +=C2=A0=C2=A0=C2=A0 case 1: \
> > +=C2=A0=C2=A0=C2=A0 case 2: \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret__ =3D emulate_cmpxchg_1=
_2(ptr, old, new, \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 sc_sfx, pre, post); \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break; \
> > +=C2=A0=C2=A0=C2=A0 case 4: \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __generic_cmpxchg(ptr__, ol=
d__, new__, ret__, \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ".w", ".w"sc_sfx, pre, post); \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break; \
> > +=C2=A0=C2=A0=C2=A0 case 8: \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __generic_cmpxchg(ptr__, ol=
d__, new__, ret__, \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ".d", ".d"sc_sfx, pre, post); \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break; \
> > +=C2=A0=C2=A0=C2=A0 default: \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 STATIC_ASSERT_UNREACHABLE()=
; \
> > +=C2=A0=C2=A0=C2=A0 } \
> > +=C2=A0=C2=A0=C2=A0 ret__; \
> > +})
> > +
> > +#define cmpxchg_relaxed(ptr, o, n) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) o_ =3D (o); \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) n_ =3D (n); \
> > +=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr)))__cmpxchg_generic(ptr, \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 o_, n_, sizeof(*(ptr)), "", "=
", ""); \
> > +})
> > +
> > +#define cmpxchg_acquire(ptr, o, n) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) o_ =3D (o); \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) n_ =3D (n); \
> > +=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr)))__cmpxchg_generic(ptr, o_, n_,
> > sizeof(*(ptr)), \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "", "",
> > RISCV_ACQUIRE_BARRIER); \
> > +})
> > +
> > +#define cmpxchg_release(ptr, o, n) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) o_ =3D (o); \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) n_ =3D (n); \
> > +=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr)))__cmpxchg_release(ptr, o_, n_,
> > sizeof(*(ptr)), \
>=20
> There's no __cmpxchg_release() afaics; dym __cmpxchg_generic()?
>=20
> Jan


