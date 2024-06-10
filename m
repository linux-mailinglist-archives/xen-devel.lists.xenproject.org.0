Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6238D902070
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 13:37:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737199.1143393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdL4-0000au-Na; Mon, 10 Jun 2024 11:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737199.1143393; Mon, 10 Jun 2024 11:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdL4-0000ZD-K8; Mon, 10 Jun 2024 11:37:26 +0000
Received: by outflank-mailman (input) for mailman id 737199;
 Mon, 10 Jun 2024 11:37:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruA2=NM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sGdL2-0000Z5-OY
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 11:37:24 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce1d197c-271d-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 13:37:23 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52bc0a9cea4so2300652e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 04:37:23 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c8a301adbsm492170e87.270.2024.06.10.04.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 04:37:22 -0700 (PDT)
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
X-Inumbo-ID: ce1d197c-271d-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718019443; x=1718624243; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M5MI3l7/fYMSuNh4hcT3Z44ssiaoPkKOh+q8gStjpmE=;
        b=kS7WDCoW7JPWqyQK/50/mVgIGJMAvxXtlIM9Cjdxp+SxaWgNOUMwcEeCBtfHtv3slX
         VGgunTsq+bSJpiCDDE7BH8qqSOQer1akq4i1yhLXzT6hsZUsobJg54kDppptqRAJyGQo
         zscr7Ogjx6rAOZyoGDhccjqEwEW/Y6mC8MnQsaaV6feNagFutTpZ+gbvyPH+wY2x3dFS
         Rsnybejy/sakqiecyCAU0jqA66zSTs8lmfkRRBBoHdF5Vd5haejaOzyq03KW+ENoDgR4
         Mg/Y/w/A68IWQw2YG539twh7NSoQdikvum9X2Uk95+/UpTzhs3CahmDlCe2ynE4Fvw22
         BqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718019443; x=1718624243;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5MI3l7/fYMSuNh4hcT3Z44ssiaoPkKOh+q8gStjpmE=;
        b=Q0v72mCOcWvvndHsafP6bbqHwzvuONn4nh1FD1R3qqvmnimK0XxxfU7AgOgQqk1vzj
         1PXY00YBLDONX82njOnQYuqoDePDH49fg/rWItI+dZUOwfYK426QxNexslFQ2VXQHc4E
         UWL4kZgHsKK+DmeJzNZ73fzO0Xvbvusz2edNvtKfq/RSWjgHtm7KNZMZDNPeLknqRHkn
         0kDVDss+PAUYBbCYyxIZeqFcD6agyUcKkxJg4tkVj4dEwUCYyMVMIivIrJ5ro4FaL6Ac
         2Z4fPH3qL7f8p8r5OserS1pQ98Xa1J3MD0OkzK2/SpyytVNATJUS9yvTJUM+EAZABhha
         nkYg==
X-Forwarded-Encrypted: i=1; AJvYcCUY/1f6MAhFXf6DlXG6eA0LTbL/X09XysP/GuJfsl4Mlzj3CsTaJY0sKN5Zf/56gRxziTBWS2/S8hYBr/P7mmvvKLWzrDPxxb0Az2FU1is=
X-Gm-Message-State: AOJu0YxBiFqZ+k7BTNoFADZhy3gbDAflJmtSuIZpQidx09F3jDPr8I2y
	rmnqmslcsfDusKmzrTGIedq9njUhjuclq8iMTxdrTcceM5aVYyCf
X-Google-Smtp-Source: AGHT+IGIhBwAwXM1G+r+gzDKb7v55p/TZQ8OhDY9VGOn9t897k86CYkyx+Xr7ATiKgue/Z+sctH8/g==
X-Received: by 2002:a19:8c5b:0:b0:52c:8906:4415 with SMTP id 2adb3069b0e04-52c890644fbmr780742e87.1.1718019442854;
        Mon, 10 Jun 2024 04:37:22 -0700 (PDT)
Message-ID: <1a1a5605a77fef5b2926a606673ad8458161c577.camel@gmail.com>
Subject: Re: [PATCH v12 8/8] xen/README: add compiler and binutils versions
 for RISC-V64
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>
Date: Mon, 10 Jun 2024 13:37:22 +0200
In-Reply-To: <d4e5b4c8-d494-440b-8970-488b49bee12e@citrix.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
	 <c6ff49af9a107965f8121862e6b32c24548956e6.1717008161.git.oleksii.kurochko@gmail.com>
	 <d4e5b4c8-d494-440b-8970-488b49bee12e@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-30 at 20:52 +0100, Andrew Cooper wrote:
> On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
> > diff --git a/README b/README
> > index c8a108449e..30da5ff9c0 100644
> > --- a/README
> > +++ b/README
> > @@ -48,6 +48,10 @@ provided by your OS distributor:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - For ARM 64-bit:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GCC 5.1 or later
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GNU Binutils 2.24 or=
 later
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - For RISC-V 64-bit:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GCC 12.2 or later
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GNU Binutils 2.39 or late=
r
>=20
> I would like to petition for GCC 10 and Binutils 2.35.
>=20
> These are the versions provided as cross-compilers by Debian, and
> therefore are the versions I would prefer to do smoke testing with.
We can consider that, but I prefer to make a separate patch series for
that.

~ Oleksii

>=20
> One issue is in cpu_relax(), needing this diff to fix:
>=20
> diff --git a/xen/arch/riscv/include/asm/processor.h
> b/xen/arch/riscv/include/asm/processor.h
> index 6846151717f7..830a05dd8e3a 100644
> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -67,7 +67,7 @@ static inline void cpu_relax(void)
> =C2=A0=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ ( "pause" );
> =C2=A0#else
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Encoding of the pause instruction */
> -=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ ( ".insn 0x0100000F" );
> +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ ( ".4byte 0x0100000F" );
> =C2=A0#endif
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 barrier();
>=20
> The .insn directive appears to check that the byte pattern is a known
> extension, where .4byte doesn't.=C2=A0 AFAICT, this makes .insn pretty
> useless for what I'd expect is it's main purpose...
>=20
>=20
> The other problem is a real issue in cmpxchg.h, already committed to
> staging (51dabd6312c).
>=20
> RISC-V does a conditional toolchain for the Zbb extension
> (xen/arch/riscv/rules.mk), but unconditionally uses the ANDN
> instruction
> in emulate_xchg_1_2().
>=20
> Nevertheless, this is also quite easy to fix:
>=20
> diff --git a/xen/arch/riscv/include/asm/cmpxchg.h
> b/xen/arch/riscv/include/asm/cmpxchg.h
> index d5e678c03678..12ecb0950701 100644
> --- a/xen/arch/riscv/include/asm/cmpxchg.h
> +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> @@ -18,6 +18,20 @@
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (new) \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory" );
> =C2=A0
> +/*
> + * Binutils < 2.37 doesn't understand ANDN.=C2=A0 If the toolchain is to=
o
> old, form
> + * it of a NOT+AND pair
> + */
> +#ifdef __riscv_zbb
> +#define ANDN_INSN(rd, rs1, rs2)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 "andn " rd ", " rs1 ", " rs2 "\n"
> +#else
> +#define ANDN_INSN(rd, rs1, rs2)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 "not " rd ", " rs2 "\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 "and " rd ", " rs1 ", " rd "\n"
> +#endif
> +
> +
> =C2=A0/*
> =C2=A0 * For LR and SC, the A extension requires that the address held in
> rs1 be
> =C2=A0 * naturally aligned to the size of the operand (i.e., eight-byte
> aligned
> @@ -48,7 +62,7 @@
> =C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ( \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0: lr.w" lr_sfx " %[old=
], %[ptr_]\n" \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 andn=C2=A0 %[sc=
ratch], %[old], %[mask]\n" \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ANDN_INSN("%[scratch]", "%[ol=
d]", "%[mask]") \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 or=C2=A0=
=C2=A0 %[scratch], %[scratch], %z[new_]\n" \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 sc.w" sc_s=
fx " %[scratch], %[scratch], %[ptr_]\n" \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 bnez %[scr=
atch], 0b\n" \
>=20
>=20
>=20
> And with that, everything builds... but doesn't link.=C2=A0 I've got this=
:
>=20
> =C2=A0 LDS=C2=A0=C2=A0=C2=A0=C2=A0 arch/riscv/xen.lds
> riscv64-linux-gnu-ld=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -T arch/riscv/xen.lds =
-N prelink.o \
> =C2=A0=C2=A0=C2=A0 ./common/symbols-dummy.o -o ./.xen-syms.0
> riscv64-linux-gnu-ld: prelink.o: in function
> `keyhandler_crash_action':
> /local/xen.git/xen/common/keyhandler.c:552: undefined reference to
> `guest_physmap_remove_page'
> riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol
> `guest_physmap_remove_page' isn't defined
> riscv64-linux-gnu-ld: final link failed: bad value
>=20
> which is completely bizarre.
>=20
> keyhandler_crash_action() has no actual reference to
> guest_physmap_remove_page(), and keyhandler.o has no such relocation.
>=20
> I'm still investigating this one.
>=20
> ~Andrew


