Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EF28547B9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:06:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680550.1058532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raD5m-00018X-9N; Wed, 14 Feb 2024 11:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680550.1058532; Wed, 14 Feb 2024 11:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raD5m-00015Q-6B; Wed, 14 Feb 2024 11:06:18 +0000
Received: by outflank-mailman (input) for mailman id 680550;
 Wed, 14 Feb 2024 11:06:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raD5k-00015K-Fw
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:06:16 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11ef4286-cb29-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 12:06:15 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a2d7e2e7fe0so120082166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:06:15 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 sn24-20020a170906629800b00a3d192cd673sm1176508ejc.23.2024.02.14.03.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:06:13 -0800 (PST)
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
X-Inumbo-ID: 11ef4286-cb29-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707908774; x=1708513574; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c0cfZ3TFaEvZA/ZDs4WJzdUjn9E8fJmzc/CjQGrqM9U=;
        b=EjIS3rVEeKqGPn5qs4k2spfERI/IdEFxCL0qlHUQPGMNq4Bk2RZ2JYCF9x5QcOmxMe
         HvOoZFA+zUkFEY32TV0l+dSDiUN8yDgWcCR5tpUqENaS61gLcgL7y3HJhKJluNc44MGK
         NKUyK9u2m7kY5vKljl7kQ5BAKxSFR2BbmWcTc0pic/CnoK+UHNejh/9aYTLg1jvvmhwW
         LBRaBN+vVdJsv0xGlGzN9GR0rc12oE4mveihjMjdlJA/+fIVhLfxqaTybzIpb+mxNfe9
         G2JgF84+sk1dCxMWVefDwzCYoyJBuIr+nPaXUHP0b0ojLZam7icgteiuOBVtbcu3VSWe
         nXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707908774; x=1708513574;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0cfZ3TFaEvZA/ZDs4WJzdUjn9E8fJmzc/CjQGrqM9U=;
        b=mpPjuu+YF/+IX4D7P8RYPefjOhpFehj8JN78hiPz2YNIPuB64WcU3uDfrg0oHJQt6q
         ZwqxMgm/Xva4pn1KDOR+eSBeAyTY191OmvINyodE0VXOrb2QqJTVE5LnxbaWqSy9QAbY
         XCc49ixCwsqgsjBspCP8n2KfxyQTPmFt66iNPeHVy2i/eNpG27XN+Ea2WSzF3zTMnt3W
         Ztb/E7wAnLvSFXyvm5ihaLRJ3FcIcRKMTE6QprG5u4euZOH+kOA0MhnlB4r7RXi3ddAf
         tkIqsAUawepliaI2/HZUA/mGdBEBzYNBNp0jGX2jHcMTi6ihjUvTMUPCHAGkxXuYjnCZ
         T3Pw==
X-Forwarded-Encrypted: i=1; AJvYcCV3+EK5XISs8HP0R1n7xvCd0eIg4ODAlcM4cGvDkVAhUYNHxnTpy/jM0vYVR3vmgoNqnDdsWPoAHpCfjyty6lZB1VC/hebxJNvWHzeiNAM=
X-Gm-Message-State: AOJu0YyQMK0Mz71gn4uI3H7QV7oRiCs34g8HNR8TUqU8nQ8QzNLtMtBO
	6A0Zl6wfOrQODQ58XQEag91Squ3z251GlnLkeOQ9ydrDAc8x7bSmTts621X9
X-Google-Smtp-Source: AGHT+IH+K7ErbMMneHIoG5Z/2ZxZplbe52w3+arJvZx3aaUz/6oPItHxP2Z2cg4zSWnYwERG+7+YpA==
X-Received: by 2002:a17:907:6d0c:b0:a3d:37a4:809d with SMTP id sa12-20020a1709076d0c00b00a3d37a4809dmr1819373ejc.7.1707908774249;
        Wed, 14 Feb 2024 03:06:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8pPfDepDBwwOJMrC623U/2BvCS6mQvqUQf81BppRwqu5dhEGrJ3meOlqQ9Jo4YPuoJa3vrz48oC53M62PKxIteHUhHfASNElY2NlVrs+mm7e+dmm5txZCvijN4508Z6Y1Ag3U/7Aomuy66rfeMlkA8Vp6B1s3LmfMz4QIA2e7anVBB9hOPCgtFmEfqguDzIq2ah1GzIW/qonvAXxYJM1uvBSx/Fy2W3I5ImA0WcHMNTTbloBzG9K0XNSlselUNc3ihXGeQpR1GqZNZcL6fGA2S8EKsvPWFOWKUiiKxDRQ7W1W+LWFv98=
Message-ID: <655eed7d1af08936ee3f42a0b88eeb2e197434e2.camel@gmail.com>
Subject: Re: [PATCH v4 09/30] xen/riscv: introduce bitops.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 14 Feb 2024 12:06:12 +0100
In-Reply-To: <b13fd044-c6db-45ab-83d0-3d02221967ed@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <f76bd85f4b64a47c59c0b306ce425036819fa380.1707146506.git.oleksii.kurochko@gmail.com>
	 <b13fd044-c6db-45ab-83d0-3d02221967ed@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-12 at 16:58 +0100, Jan Beulich wrote:
> On 05.02.2024 16:32, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/bitops.h
> > @@ -0,0 +1,164 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/* Copyright (C) 2012 Regents of the University of California */
> > +
> > +#ifndef _ASM_RISCV_BITOPS_H
> > +#define _ASM_RISCV_BITOPS_H
> > +
> > +#include <asm/system.h>
> > +
> > +#include <asm-generic/bitops/bitops-bits.h>
>=20
> Especially with ...
>=20
> > +/* Based on linux/arch/include/linux/bits.h */
> > +
> > +#define BIT_MASK(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1UL <<=
 ((nr) % BITS_PER_LONG))
> > +#define BIT_WORD(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((nr) /=
 BITS_PER_LONG)
>=20
> ... these it's not entirely obvious why bitops-bits.h would be needed
> here.
They are needed as __test_and_op_bit_ord(), __op_bit_ord() macros are
used them, but probably it makes sense to drop BIT_MASK() and
BIT_WORD(), and just use BITOPS_MASK() and BITOPS_WORD() from asm-
generic/bitops-bits.h or re-define BITOPS_MASK() and BITOPS_WORD()
before inclusion of bitops-bits.h in the way as BIT_MASK and BIT_WORD
macros are defined now to be aligned with Linux.

>=20
> > +#define __set_bit(n,p)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_bit(n,p)
> > +#define __clear_bit(n,p)=C2=A0=C2=A0=C2=A0 clear_bit(n,p)
>=20
> Nit (as before?): Missing blanks after commas.
Thanks. I'll add blanks.

>=20
> > +/* Based on linux/arch/include/asm/bitops.h */
> > +
> > +#if ( BITS_PER_LONG =3D=3D 64 )
>=20
> Imo the parentheses here make things only harder to read.
I can drop them, this part was copied from Linux, so it was decided to
leave it as is.

>=20
> > +#define __AMO(op)=C2=A0=C2=A0 "amo" #op ".d"
> > +#elif ( BITS_PER_LONG =3D=3D 32 )
> > +#define __AMO(op)=C2=A0=C2=A0 "amo" #op ".w"
> > +#else
> > +#error "Unexpected BITS_PER_LONG"
> > +#endif
> > +
> > +#define __test_and_op_bit_ord(op, mod, nr, addr, ord)=C2=A0=C2=A0 \
>=20
> The revision log says __test_and_* were renamed. Same anomaly for
> __test_and_op_bit() then.
I'll double check the namings. Thanks.
>=20
> > +({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 unsigned long __res, __mask;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>=20
> Leftover leading underscores?
It is how it was defined in Linux, so I thought that I've to leave it
as it, but I am OK to rename this variables in next patch version.

>=20
> > +=C2=A0=C2=A0=C2=A0 __mask =3D BIT_MASK(nr);=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ (=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __AMO(op) #ord " %0, %2, %1=
"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__res), "+A" (add=
r[BIT_WORD(nr)])=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (mod(__mask))=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 ((__res & __mask) !=3D 0);=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +})
> > +
> > +#define __op_bit_ord(op, mod, nr, addr, ord)=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ (=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __AMO(op) #ord " zero, %1, =
%0"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+A" (addr[BIT_WORD(nr)])=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (mod(BIT_MASK(nr)))=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");
> > +
> > +#define __test_and_op_bit(op, mod, nr, addr)=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 __test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
> > +#define __op_bit(op, mod, nr, addr) \
> > +=C2=A0=C2=A0=C2=A0 __op_bit_ord(op, mod, nr, addr, )
> > +
> > +/* Bitmask modifiers */
> > +#define __NOP(x)=C2=A0=C2=A0=C2=A0 (x)
> > +#define __NOT(x)=C2=A0=C2=A0=C2=A0 (~(x))
>=20
> Here the (double) leading underscores are truly worrying: Simple
> names like this aren't impossible to be assigned meaninb by a
> compiler.
I am not really understand what is the difference for a compiler
between NOP and __NOP? Do you mean that the leading double underscores
(__) are often used to indicate that these macros are implementation-
specific and might be reserved for the compiler or the standard
library?

>=20
> > +/**
> > + * __test_and_set_bit - Set a bit and return its old value
> > + * @nr: Bit to set
> > + * @addr: Address to count from
> > + *
> > + * This operation may be reordered on other architectures than
> > x86.
> > + */
> > +static inline int test_and_set_bit(int nr, volatile void *p)
> > +{
> > +=C2=A0=C2=A0=C2=A0 volatile uint32_t *addr =3D p;
>=20
> With BIT_WORD() / BIT_MASK() being long-based, is the use of uint32_t
> here actually correct?
No, it is not correct. It seems to me it would be better to use
BITOPS_WORD(), BITOPS_MASK() and bitops_uint_t() and just redefine them
before inclusion of bitops-bit.h to be aligned with Linux
implementation.

>=20
> > +=C2=A0=C2=A0=C2=A0 return __test_and_op_bit(or, __NOP, nr, addr);
> > +}
> > +
> > +/**
> > + * __test_and_clear_bit - Clear a bit and return its old value
> > + * @nr: Bit to clear
> > + * @addr: Address to count from
> > + *
> > + * This operation can be reordered on other architectures other
> > than x86.
>=20
> Nit: double "other" (and I think it's the 1st one that wants
> dropping,
> not - as the earlier comment suggests - the 2nd one). Question is:
> Are
> the comments correct? Both resolve to something which is (also) at
> least a compiler barrier. Same concern also applies further down, to
> at least set_bit() and clear_bit().
It looks like comments aren't correct as operation inside is atomic,
also it implies compiler memory barrier. So the comments related to
'reordering' should be dropped.
I am not sure that I know why in Linux these comments were left.

>=20
> > + */
> > +static inline int test_and_clear_bit(int nr, volatile void *p)
> > +{
> > +=C2=A0=C2=A0=C2=A0 volatile uint32_t *addr =3D p;
> > +
> > +=C2=A0=C2=A0=C2=A0 return __test_and_op_bit(and, __NOT, nr, addr);
> > +}
> > +
> > +/**
> > + * set_bit - Atomically set a bit in memory
> > + * @nr: the bit to set
> > + * @addr: the address to start counting from
> > + *
> > + * Note: there are no guarantees that this function will not be
> > reordered
> > + * on non x86 architectures, so if you are writing portable code,
> > + * make sure not to rely on its reordering guarantees.
> > + *
> > + * Note that @nr may be almost arbitrarily large; this function is
> > not
> > + * restricted to acting on a single-word quantity.
> > + */
> > +static inline void set_bit(int nr, volatile void *p)
> > +{
> > +=C2=A0=C2=A0=C2=A0 volatile uint32_t *addr =3D p;
> > +
> > +=C2=A0=C2=A0=C2=A0 __op_bit(or, __NOP, nr, addr);
> > +}
> > +
> > +/**
> > + * clear_bit - Clears a bit in memory
> > + * @nr: Bit to clear
> > + * @addr: Address to start counting from
> > + *
> > + * Note: there are no guarantees that this function will not be
> > reordered
> > + * on non x86 architectures, so if you are writing portable code,
> > + * make sure not to rely on its reordering guarantees.
> > + */
> > +static inline void clear_bit(int nr, volatile void *p)
> > +{
> > +=C2=A0=C2=A0=C2=A0 volatile uint32_t *addr =3D p;
> > +
> > +=C2=A0=C2=A0=C2=A0 __op_bit(and, __NOT, nr, addr);
> > +}
> > +
> > +/**
> > + * test_and_change_bit - Change a bit and return its old value
>=20
> How come this one's different? I notice the comments are the same
> (and
> hence as confusing) in Linux; are you sure they're applicable there?
No, I am not sure. As I mentioned above, all this functions are atomic
and uses compiler memory barrier, so it looks like the comment for=20
clear_bit isn't really correct.
In case if all such functions are uses __test_and_op_bit_ord() and
__op_bit_ord() which are atomic and with compiler barrier, it seems
that we can just drop all such comments or even all the comments. I am
not sure that anyone is needed the comment as by default this function
is safe to use:
 * This operation is atomic and cannot be reordered.
 * It also implies a memory barrier.

>=20
> > + * @nr: Bit to change
> > + * @addr: Address to count from
> > + *
> > + * This operation is atomic and cannot be reordered.
> > + * It also implies a memory barrier.
> > + */
> > +static inline int test_and_change_bit(int nr, volatile unsigned
> > long *addr)
> > +{
> > +	return __test_and_op_bit(xor, __NOP, nr, addr);
> > +}
> > +
> > +#undef __test_and_op_bit
> > +#undef __op_bit
> > +#undef __NOP
> > +#undef __NOT
> > +#undef __AMO
> > +
> > +#include <asm-generic/bitops/generic-non-atomic.h>
> > +
> > +#define __test_and_set_bit generic___test_and_set_bit
> > +#define __test_and_clear_bit generic___test_and_clear_bit
> > +#define __test_and_change_bit generic___test_and_change_bit
> > +
> > +#include <asm-generic/bitops/fls.h>
> > +#include <asm-generic/bitops/flsl.h>
> > +#include <asm-generic/bitops/__ffs.h>
> > +#include <asm-generic/bitops/ffs.h>
> > +#include <asm-generic/bitops/ffsl.h>
> > +#include <asm-generic/bitops/ffz.h>
> > +#include <asm-generic/bitops/find-first-set-bit.h>
> > +#include <asm-generic/bitops/hweight.h>
> > +#include <asm-generic/bitops/test-bit.h>
>=20
> To be honest there's too much stuff being added here to asm-generic/,
> all in one go. I'll see about commenting on the remaining parts here,
> but I'd like to ask that you seriously consider splitting.
Would it be better to send it outside of this patch series? I can
create a separate patch series with a separate patch for each asm-
generic/bitops/*.h

~ Oleksii

