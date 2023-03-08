Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98306B0E66
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 17:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508103.782402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZwTF-0001hc-68; Wed, 08 Mar 2023 16:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508103.782402; Wed, 08 Mar 2023 16:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZwTF-0001eX-21; Wed, 08 Mar 2023 16:16:53 +0000
Received: by outflank-mailman (input) for mailman id 508103;
 Wed, 08 Mar 2023 16:16:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Glg8=7A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pZwTC-0001eR-V7
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 16:16:51 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f8d0b3c-bdcc-11ed-956e-85ef70e17bfa;
 Wed, 08 Mar 2023 17:16:47 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id g3so15911444wri.6
 for <xen-devel@lists.xenproject.org>; Wed, 08 Mar 2023 08:16:46 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.143.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.143]) by smtp.gmail.com with ESMTPSA id
 h6-20020a1ccc06000000b003e118684d56sm20691068wmb.45.2023.03.08.08.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:16:45 -0800 (PST)
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
X-Inumbo-ID: 9f8d0b3c-bdcc-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678292206;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kxyjWgJnFPSr/BgXFkcPNKNmsro2p3qO2lUxvmZP/vI=;
        b=Tf1kn/s53Md9n7YMzYQcukadzF58Sk+ELMkGZUMj7xsaqTCf/SRQOt+Fl/JsV9XNX8
         Ab3xtOOL4I0G539oc4N9DfjIdI54sdhx9NgzApHM2Lj4AhAOJuPRtijCyPO6XmFcXqIs
         u7pEj+fvyaJuHIGB79lYcgTO3TczXu5fyTMNl+pSrnVGz0fuwmzY2Anyd+kTWzhbEECn
         0n9kALqgHX6oO87qjlql/6w2IJE6HzVFmgbTafPx38gUonIMB56D45RqVq3fPAwe4yLZ
         I+cF4/TaWlNHgsXLCZRSyzw3Kok9+Mn/ra6FSS1xSZsdbHUF0VZUMkgciGwPrm+lXTRm
         bMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678292206;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxyjWgJnFPSr/BgXFkcPNKNmsro2p3qO2lUxvmZP/vI=;
        b=RDqL69TMytSUZqI/mvjA5IROmwNIv++TAXesfDjeL5QW8F92BpERQDBoNsQ4ktbr30
         +lwEfJOr0D4tmTetrGuhDppCN892PKsRF420uJuBBlwYjr0qGce6HLwJTgoHLl+MzNka
         XL4pPk3DIE1P2Kt/2tNu055hpeAt4zMbmzRg5PiqSxwUxdZ4/tgCH4RVUOYYM62YhC/e
         LOYMl4c3s+tWGKl0gjvbx94MRJBAn5bBNVTTJk9fhyO3g1J7U9N9RtdoBJ5Nqz0MgX1v
         VJTTh2+UekdYcB/eYWEphs1yICWeDEcSHE0Dxw125TFVs40KK3eR2iFiG18jO9NlClsH
         dWtQ==
X-Gm-Message-State: AO0yUKUemDY82roHt93vPp7QVhfn3dOzuz5DyAiv1vEq2O1I4FMeoryb
	1eUC9OixSQv1EtuOt7lcJc8=
X-Google-Smtp-Source: AK7set9nJmmA2Q5ZBQM5SDrj0CQITEIHAH1OqSw8D1cEpMUPLl9Lz1X8r6Qa494zhOtXKICvBQwl0Q==
X-Received: by 2002:a5d:65cb:0:b0:2c5:5ec7:43bc with SMTP id e11-20020a5d65cb000000b002c55ec743bcmr16227368wrw.18.1678292206116;
        Wed, 08 Mar 2023 08:16:46 -0800 (PST)
Message-ID: <70c292e708708463ed83ebaf562d51179e9f7f99.camel@gmail.com>
Subject: Re: [PATCH v1 2/3] xen/riscv: setup initial pagetables
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>, Julien
 Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Date: Wed, 08 Mar 2023 18:16:44 +0200
In-Reply-To: <9e6a76f1-73c6-9a6e-3444-f3e1cb2d71dc@suse.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
	 <83444f8f90cf2adf431762d919ba958a25ff8ce4.1677250203.git.oleksii.kurochko@gmail.com>
	 <52072f1b-0cf8-a218-eefc-a8c1b4cecf43@xen.org>
	 <e2a1968767e7a0f1535920ada14ec2f323e0f9c5.camel@gmail.com>
	 <b8dd2333-5f3b-10ea-7ddd-47bd5f84ca5f@xen.org>
	 <94f5059a4e31ddd29141fa8fe5156b560575ab1e.camel@gmail.com>
	 <9e6a76f1-73c6-9a6e-3444-f3e1cb2d71dc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-08 at 16:17 +0100, Jan Beulich wrote:
> On 08.03.2023 15:54, Oleksii wrote:
> > Actually after my latest experiments it looks that we don't need to
> > calculate that things at all because for RISC-V it is=C2=A0 used
> > everywhere
> > PC-relative access.
> > Thereby it doesn't matter what is an address where Xen was loaded
> > and
> > linker address.
> > Right now I found only to cases which aren't PC-relative.
> > Please look at the patch below:
> > diff --git a/xen/arch/riscv/include/asm/config.h
> > b/xen/arch/riscv/include/asm/config.h
> > index 763a922a04..e1ba613d81 100644
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -39,7 +39,7 @@
> > =C2=A0=C2=A0 name:
> > =C2=A0#endif
> > =C2=A0
> > -#define XEN_VIRT_START=C2=A0 _AT(UL, 0x80200000)
> > +#define XEN_VIRT_START=C2=A0 _AT(UL, 0x00200000)
>=20
> I think this wants to remain the address where Xen actually runs, and
> where Xen is linked to. This ...
>=20
> > --- a/xen/arch/riscv/traps.c
> > +++ b/xen/arch/riscv/traps.c
> > @@ -123,8 +123,14 @@ int do_bug_frame(const struct cpu_user_regs
> > *regs,
> > vaddr_t pc)
> > =C2=A0=C2=A0=C2=A0=C2=A0 const char *filename, *predicate;
> > =C2=A0=C2=A0=C2=A0=C2=A0 int lineno;
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0 static const struct bug_frame* bug_frames[] =3D {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__start_bug_frames[0],
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * force fill bug_frames array using auipc/add=
i instructions
> > to
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * make addresses in bug_frames PC-relative.
> > +=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 const struct bug_frame * force =3D (const struct bu=
g_frame *)
> > &__start_bug_frames[0];
> > +
> > +=C2=A0=C2=A0=C2=A0 const struct bug_frame* bug_frames[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 force,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_0[0=
],
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_1[0=
],
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_2[0=
],
>=20
> ... array would better be static anyway, and ...
>=20
> > The changes related to <asm/config.h> are=C2=A0 only to make linker_add=
r
> > !=3D
> > load_address. So:
> > 1. The first issue with cpu0_boot_stack in the head.S file. When we
> > do:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sp, cpu=
0_boot_stack
> > =C2=A0=C2=A0 Pseudo-instruction la will be transformed to auipc/addi OR
> > auipc/l{w|d}.
> > =C2=A0=C2=A0 It depends on an option: nopic, pic. [1]
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 So the solution can be the following:
> > =C2=A0=C2=A0 * As it is done in the patch: add to the start of head.S
> > ".option=C2=A0=20
> > nopic"
> > =C2=A0=C2=A0 * Change la to lla thereby it will be always generated
> > "auipc/addi"
> > to get an address of variable.
> >=20
> > 2. The second issue is with the code in do_bug_frame() with
> > bug_frames
> > array:
> > =C2=A0=C2=A0 const struct bug_frame* bug_frames[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__start_bug_frames[0],
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_0[0],
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_1[0],
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_2[0],
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &__stop_bug_frames_3[0],
> > =C2=A0=C2=A0=C2=A0 };
> > =C2=A0 In this case &{start,stop}bug_frames{,{0-3}} will be changed
> > to=C2=A0=C2=A0=C2=A0=C2=A0=20
> > linker address. In case of when load_addr is 0x80200000 and
> > linker_addr
> > is 0x00200000 then &{start,stop}bug_frames{,{0-3}} will be equal to
> > 0x00200000 + X.
>=20
> ... this "solution" to a problem you introduce by wrongly modifying
> the linked address would then need applying to any other similar code
> pattern found in Xen. Which is (I hope obviously) not a viable route.
> Instead code running before address translation is enable needs to be
> extra careful in what code and data items it accesses, and how.
>=20
I modified the linked address only for the experiment ( when load_addr
!=3D linker_addr to emulate situation Julien told me about), so it's not
something I planned to send as a part of the final patch, and I
probably forgot to mention that in my previous mail.

It is only one place where we have to do a kind of 'force' and is
needed to make the current state of RISC-V Xen work in case we don't
have MMU enabled yet and linker_addr !=3D load_addr. All other cases
where it is used something from the range (linker_start, linker_end)
will be managed by MMU.

If we can't use mentioned above solution, we still need to handle the
situation when linker_addr !=3D load_addr and MMU isn't enabled yet.
Other options to do that:
1. add phys_offset ( | load_addr - linker_addr | ) everywhere where
bug_frames array is used: bug_frames[id] + phys_offset
2. Check somewhere at the start if linker_addr !=3D load_addr, then throw
an error and panic().

Other options might exist. So I would appreciate it if you could
suggest me some.

Could you let me know if any options are suitable for handling a case
when linker_addr?
> > =C2=A0=C2=A0=C2=A0 To force using addresses related to load_addr=C2=A0 =
in bug_frames,
> > it is
> > necessary to declare a variable with getting an address of
> > &__{start,stop}bug_frames{,{0-3}} thereby it will generate the
> > code:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2002c2:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 00001797=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 auipc=C2=A0=C2=A0 a5,0x1
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02002c6:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 d3e78793=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addi=C2=A0=C2=A0=C2=A0 a5,a5,=
-706 #
> > 201000 <__start_bug_frames>
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02002ca:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 faf43c23=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sd=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 a5,-72(s0)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02002ce:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 00001797=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 auipc=C2=A0=C2=A0 a5,0x1
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02002d2:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 d3a78793=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addi=C2=A0=C2=A0=C2=A0 a5,a5,=
-710 #
> > 201008 <__stop_bug_frames_
>=20
~ Oleksii

