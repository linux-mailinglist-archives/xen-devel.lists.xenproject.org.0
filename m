Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4496832669
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 10:17:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668965.1041479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQkzc-000736-Pk; Fri, 19 Jan 2024 09:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668965.1041479; Fri, 19 Jan 2024 09:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQkzc-00070a-Mx; Fri, 19 Jan 2024 09:16:52 +0000
Received: by outflank-mailman (input) for mailman id 668965;
 Fri, 19 Jan 2024 09:16:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePSo=I5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rQkza-0006zW-SW
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 09:16:50 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79a026f6-b6ab-11ee-9b0f-b553b5be7939;
 Fri, 19 Jan 2024 10:16:49 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50e7e55c0f6so683866e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 01:16:49 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a056512119600b0050e7a97ae32sm903075lfr.78.2024.01.19.01.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 01:16:48 -0800 (PST)
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
X-Inumbo-ID: 79a026f6-b6ab-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705655809; x=1706260609; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eyoZO+bmF/YBvavD8DvX/SVdsTD2uXFDUFXYDReg7co=;
        b=dCgbGGpwHbJfJguiHVbM91OQdJ1D8VS0nV2P2htbfrFeiz6OXif4hYf4RxvOozcPc1
         4AQy7aNEoVR4EXfx04aie3EQMFl6jYB36NkpCxodNUDvsfTMw8dBoIYFJgyIQrAeFjEK
         g3Ae28I4PaxUx9sAKFFHE4f4mIyRYfNdy7WeCACc3FgwQ9GijFoIhARusp9CYluOaa1k
         FQRt5ZSH88N1zsSdZet9NVzQteWjQNK3ivPBQJ7dtIb7JJUhH+BjzTt51jfZMzWApY4I
         xKfS1AhwRE4cWNg5Kiooz4BB3Xp6CRz8WmXI80PsvunkHiJo1DjvGnVUE7gSVLB8+qCi
         MvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705655809; x=1706260609;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eyoZO+bmF/YBvavD8DvX/SVdsTD2uXFDUFXYDReg7co=;
        b=XfXNeTVcNNeXa245/GUQ6KaX6YjplEqL6nDExMzjYNrntpApQBX7rj15evhgJTjKeU
         qepD2kaBehfG0S5kNNvhVjRd2EXyP7XS+zklR0OEaR+rryB6B1hTm2ubwm2MACVaXFIl
         S7xS2bXH9RsHnLs2ZR8xspzvNZGC7l0oAELwm4DcwN3JZ9FjxUBYQTMG0DEpddfomjuU
         AoV4CN8aZ0nGKhaY4veQXFIyBUbbPzTZoMjTxkOsEYcJzm6Upzva0cCUzUm/20fXFHD3
         eyNcoCNW1eFZxF/wek7J4X3tUcNQrXHZZf017I+WF2BFpzDT5/y2k5dqxJ7btLK+8h/T
         kUxg==
X-Gm-Message-State: AOJu0YwAIU5fa5gu/SkT/L6xepJSFSVmGGcXgEOSgGmTvz7I08+Xzerp
	AiOh4uwyVoparoeeg6nEat8s14lFmWskpNuCIwX2G+XYoD/hr7RH
X-Google-Smtp-Source: AGHT+IGpiw524WYe1ebF4McY3svRwsWP+vURiltjJbnyttM98Ucu0F/I4mtv/zUKDNb2qsEKV3Sqhg==
X-Received: by 2002:ac2:52b6:0:b0:50e:7f8b:ec51 with SMTP id r22-20020ac252b6000000b0050e7f8bec51mr229384lfm.210.1705655808372;
        Fri, 19 Jan 2024 01:16:48 -0800 (PST)
Message-ID: <ba1dbfbdd84811b09593425664f02a0cfe9430c3.camel@gmail.com>
Subject: Re: [PATCH v3 10/34] xen/riscv: introduce bitops.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 19 Jan 2024 11:16:46 +0200
In-Reply-To: <ac43d7a3-f662-4985-9aaf-4cad1c517f35@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <841d59c3950970f4937da200cf8f04aa39132e14.1703255175.git.oleksii.kurochko@gmail.com>
	 <23f1212a-66a8-47b0-904b-08b2ab54c72b@suse.com>
	 <17d9fe474e244a15aa5955e630d553a62b0080fd.camel@gmail.com>
	 <88df7ccd-8d14-4b00-900d-04cc87d9f230@suse.com>
	 <863b09f03d37e96d737ab6bda4cc8923f75550fd.camel@gmail.com>
	 <2e10b170-5a75-4ae0-8d2f-c6c1ad9951a5@suse.com>
	 <1b20fefd125598e2bb62d516495783650da75271.camel@gmail.com>
	 <23955665-8bd8-4872-a1a5-e3a3711c9512@suse.com>
	 <1c0eb1cdef1fac7695c4fc416128e2bb81cf13aa.camel@gmail.com>
	 <ac43d7a3-f662-4985-9aaf-4cad1c517f35@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-01-18 at 12:01 +0100, Jan Beulich wrote:
> On 18.01.2024 10:43, Oleksii wrote:
> > On Wed, 2024-01-17 at 14:42 +0100, Jan Beulich wrote:
> > > On 17.01.2024 12:37, Oleksii wrote:
> > > > > > >=20
> > > > > > > > > Also you want to make sure asm-generic/bitops/bitops-
> > > > > > > > > bits.h
> > > > > > > > > is
> > > > > > > > > really in use here, or else an arch overriding / not
> > > > > > > > > using
> > > > > > > > > that
> > > > > > > > > header may end up screwed.
> > > > > > > > I am not really understand what do you mean. Could you
> > > > > > > > please
> > > > > > > > explain a
> > > > > > > > little bit more.
> > > > > > >=20
> > > > > > > Whichever type you use here, it needs to be in sync with
> > > > > > > BITOP_BITS_PER_WORD. Hence you want to include the
> > > > > > > _local_
> > > > > > > bitops-
> > > > > > > bits.h
> > > > > > > here, such that in case of an inconsistent override by an
> > > > > > > arch
> > > > > > > the
> > > > > > > compiler would complain about the two differring #define-
> > > > > > > s.
> > > > > > > (IOW
> > > > > > > an
> > > > > > > arch overriding BITOP_BITS_PER_WORD cannot re-use this
> > > > > > > header
> > > > > > > as-
> > > > > > > is.)
> > > > > > >=20
> > > > > > > The same may, btw, be true for others of the new headers
> > > > > > > you
> > > > > > > add
> > > > > > > -
> > > > > > > the
> > > > > > > same #include would therefore be needed there as well.
> > > > > > Now it clear to me.
> > > > > >=20
> > > > > >=20
> > > > > > It seems like BITOP_BITS_PER_WORD, BITOP_MASK, BITOP_WORD,
> > > > > > and
> > > > > > BITS_PER_BYTE are defined in {arm, ppc,
> > > > > > riscv}/include/asm/bitops.h.
> > > > > > I expected that any architecture planning to use asm-
> > > > > > generic/bitops/bitops-bits.h would include it at the
> > > > > > beginning
> > > > > > of
> > > > > > <arch>/include/asm/bitops.h, similar to what is done for
> > > > > > RISC-
> > > > > > V:
> > > > > > =C2=A0=C2=A0 #ifndef _ASM_RISCV_BITOPS_H
> > > > > > =C2=A0=C2=A0 #define _ASM_RISCV_BITOPS_H
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0 #include <asm/system.h>
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0 #include <asm-generic/bitops/bitops-bits.h>
> > > > > > =C2=A0=C2=A0 ...
> > > > > >=20
> > > > > > But in this case, to allow architecture overrides macros,
> > > > > > it is
> > > > > > necessary to update asm-generic/bitops/bitops-bits.h:
> > > > > > =C2=A0=C2=A0=C2=A0 #ifndef BITOP_BITS_PER_WORD
> > > > > > =C2=A0=C2=A0=C2=A0 #define BITOP_BITS_PER_WORD=C2=A0=C2=A0=C2=
=A0=C2=A0 32
> > > > > > =C2=A0=C2=A0=C2=A0 #endif
> > > > > > =C2=A0=C2=A0 ...
> > > > > > Therefore,=C2=A0 if an architecture needs to override something=
,
> > > > > > it
> > > > > > will
> > > > > > add
> > > > > > #define ... before #include <asm-generic/bitops/bitops-
> > > > > > bits.h>.
> > > > > >=20
> > > > > > Does it make sense?
> > > > >=20
> > > > > Sure. But then the arch also needs to provide a corresponding
> > > > > typedef
> > > > > (and bitops-bits.h the fallback one), for use wherever you
> > > > > use
> > > > > any of
> > > > > those #define-s.
> > > > Which one typedef is needed to provide?
> > > > <asm-generic/bitops/bitops-bits.h> contains only macros.
> > >=20
> > > A new one, to replace where right now you use "unsigned int" and
> > > I
> > > initially said you need to use "uint32_t" instead. With what you
> > > said
> > > earlier, uint32_t won't work there (anymore).
> > Wouldn't it be enough just to "#include <xen/types.h>" in headers
> > where
> > "uint32_t" is used?
>=20
> No, my point wasn't to make uint32_t available. We need a _separate_
> typedef which matches the #define-s. Otherwise, if an arch defines
> BITOP_BITS_PER_WORD to, say, 64, this generic code would do the wrong
> thing.
Oh, yeah this is true.

We have to introduce in bitops-bits.h:
   typedef uint_32t bitops_type;=20

And then use it in function such as test_bit:
   static inline int test_bit(int nr, const volatile void *addr)
   {
       const volatile bitops_type *p =3D addr;
       return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD -
   1)));
   }

Thanks for clarification.

~ Oleksii

