Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D116682EF62
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 14:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667756.1039330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPj9j-0001SY-PP; Tue, 16 Jan 2024 13:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667756.1039330; Tue, 16 Jan 2024 13:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPj9j-0001QX-Ma; Tue, 16 Jan 2024 13:07:03 +0000
Received: by outflank-mailman (input) for mailman id 667756;
 Tue, 16 Jan 2024 13:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvQ1=I2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rPj9h-0001QR-Ix
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 13:07:01 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21b58ee9-b470-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 14:06:59 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50e835800adso10932326e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 05:06:59 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a19ca01000000b0050e7e38c9e0sm1785608lfg.62.2024.01.16.05.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 05:06:57 -0800 (PST)
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
X-Inumbo-ID: 21b58ee9-b470-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705410418; x=1706015218; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3hYmjyF6K9EWZ2YodORW05YvWQdogkkc8JZfnWUDGqM=;
        b=lcNGNTD0ZqRo/9k96aYEASxXyYIl99kjHMPD2nZrswaSnHHgW0qAVrZub4aZbXm8GR
         CxRfJ1rKs67PKYiuvK3GM6unqqyUx4JC34+V8YpDhlMhBX2vREefIxJB53nFBArlpVfF
         zzad06YO8yydkK/b6QPvdJotmOfec+21IcacFkmCuMo3Xr6DFPm1Cbpp/d8KIK2Nj5wA
         B1oKNMyCm51tYsvHBvPeMhwDhCljjWw7PetkSRduCGuqmDN57Ywde8A8K00Cy85rly21
         JLZV/g0kzkLx54oLmBCoZ1Sh1xdLvVNa3P8cJy66EzG3nHhG9pSmZUSRLk3OXBqK2slh
         iWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705410418; x=1706015218;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3hYmjyF6K9EWZ2YodORW05YvWQdogkkc8JZfnWUDGqM=;
        b=orJMPwo/eRsGK6pI1nPYmfH0n+S2XDgcqDN0pf2/32SlEpOToJaRVgKo8ex0W3/lRW
         K1IOdU5LxftxdBjuy6O+kwvy8Q3ctmJfq8wjeGck3e/oWnHAA3zCBpX5QkOdxASo0dbH
         b62JBB/Pc+BmRsAZSoQrmhJsvxcCjVmUp9istGjIV4YGtZRT+2ZCkqS2ieVn1vs4kFf4
         ZIsKDp+hs4QPQXM71w70RIY/PGcSgJQXueZW5qFqstCMpUAosesw+6I4ke3WEdNESOW2
         82goNI7K3eNRMdNmtr2YyUCWBBl6rc9OPES2xf+1fg1+eDcUzfoPAQJTxLjQjCzpZJ+f
         HWCA==
X-Gm-Message-State: AOJu0YzXZCIy8EpTTP8+Z3LQ0rsMKmq72luSmFd7quHhp4jnpqhBnlt+
	htGK7TW4jDE8cS22IMl3cM8=
X-Google-Smtp-Source: AGHT+IFEQSo8/+xrcumqa5RMCzORj5wyaQVGx90l2ylPCX4eIEkk8JD5wKqYCM5lwInIC3h84rw7Uw==
X-Received: by 2002:a05:6512:b1e:b0:50e:4437:142b with SMTP id w30-20020a0565120b1e00b0050e4437142bmr2714109lfu.38.1705410418262;
        Tue, 16 Jan 2024 05:06:58 -0800 (PST)
Message-ID: <17d9fe474e244a15aa5955e630d553a62b0080fd.camel@gmail.com>
Subject: Re: [PATCH v3 10/34] xen/riscv: introduce bitops.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 16 Jan 2024 15:06:55 +0200
In-Reply-To: <23f1212a-66a8-47b0-904b-08b2ab54c72b@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <841d59c3950970f4937da200cf8f04aa39132e14.1703255175.git.oleksii.kurochko@gmail.com>
	 <23f1212a-66a8-47b0-904b-08b2ab54c72b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-01-15 at 17:44 +0100, Jan Beulich wrote:
> On 22.12.2023 16:12, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/bitops.h
> > @@ -0,0 +1,267 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/* Copyright (C) 2012 Regents of the University of California */
> > +
> > +#ifndef _ASM_RISCV_BITOPS_H
> > +#define _ASM_RISCV_BITOPS_H
> > +
> > +#include <asm/system.h>
> > +
> > +#include <asm-generic/bitops/bitops-bits.h>
> > +
> > +/* Based on linux/arch/include/linux/bits.h */
> > +
> > +#define BIT_MASK(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1UL <<=
 ((nr) % BITS_PER_LONG))
> > +#define BIT_WORD(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((nr) /=
 BITS_PER_LONG)
> > +
> > +#define __set_bit(n,p)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_bit(n,p)
> > +#define __clear_bit(n,p)=C2=A0=C2=A0=C2=A0 clear_bit(n,p)
> > +
> > +/* Based on linux/arch/include/asm/bitops.h */
> > +
> > +#if ( BITS_PER_LONG =3D=3D 64 )
> > +#define __AMO(op)=C2=A0=C2=A0 "amo" #op ".d"
> > +#elif ( BITS_PER_LONG =3D=3D 32 )
> > +#define __AMO(op)=C2=A0=C2=A0 "amo" #op ".w"
> > +#else
> > +#error "Unexpected BITS_PER_LONG"
> > +#endif
> > +
> > +#define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
> > +({								\
> > +=C2=A0=C2=A0=C2=A0 unsigned long __res, __mask;				\
> > +=C2=A0=C2=A0=C2=A0 __mask =3D BIT_MASK(nr);					\
> > +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ (					\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __AMO(op) #ord " %0, %2, %1=
"			\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (__res), "+A" (add=
r[BIT_WORD(nr)])	\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (mod(__mask))				\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");					\
> > +=C2=A0=C2=A0=C2=A0 ((__res & __mask) !=3D 0);				\
> > +})
>=20
> Despite the taking from Linux I think the overall result wants to be
> consistent formatting-wise: You switched to blank indentation (which
> is fine), but you left tabs as padding for the line continuation
> characters.
I think it is because of my IDE. I will be consistent in next patch
version.

Thanks.

>=20
> > +#define __op_bit_ord(op, mod, nr, addr, ord)			\
> > +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ (					\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __AMO(op) #ord " zero, %1, =
%0"			\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+A" (addr[BIT_WORD(nr)])=
			\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (mod(BIT_MASK(nr)))		=
	\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");
> > +
> > +#define __test_and_op_bit(op, mod, nr, addr)=C2=A0			\
>=20
> (At least) here you even use a mix.
>=20
> > +=C2=A0=C2=A0=C2=A0 __test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
> > +#define __op_bit(op, mod, nr, addr)				\
> > +=C2=A0=C2=A0=C2=A0 __op_bit_ord(op, mod, nr, addr, )
> > +
> > +/* Bitmask modifiers */
> > +#define __NOP(x)	(x)
> > +#define __NOT(x)	(~(x))
> > +
> > +/**
> > + * __test_and_set_bit - Set a bit and return its old value
> > + * @nr: Bit to set
> > + * @addr: Address to count from
> > + *
> > + * This operation may be reordered on other architectures than
> > x86.
> > + */
> > +static inline int __test_and_set_bit(int nr, volatile void *p)
> > +{
> > +=C2=A0=C2=A0=C2=A0 volatile uint32_t *addr =3D p;
> > +
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
> > + */
> > +static inline int __test_and_clear_bit(int nr, volatile void *p)
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
> > +#undef __test_and_op_bit
> > +#undef __op_bit
> > +#undef __NOP
> > +#undef __NOT
> > +#undef __AMO
> > +
> > +#define test_and_set_bit=C2=A0=C2=A0 __test_and_set_bit
> > +#define test_and_clear_bit __test_and_clear_bit
>=20
> I realize test-and-change have no present users, despite being made
> available by Arm and x86, but I think they would better be provided
> right away, rather than someone introducing a use then needing to
> fiddle with RISC-V (and apparently also PPC) code.
Sure, it makes sense. I'll add test-and-change too.

>=20
> I'm also puzzled by this aliasing: Aren't there cheaper non-atomic
> insn forms that could be used for the double-underscore-prefixed
> variants?
It will be cheaper, but I assume that this API should be safe in the
case of SMP where different CPUs can access the same variable or
similar cases with simultaneous access to the variable.

>=20
> > +/* Based on linux/include/asm-generic/bitops/find.h */
> > +
> > +#ifndef find_next_bit
>=20
> What is this to guard against?
This was copied from Linux, but in case of Xen it can be dropped.

>=20
> > +/**
> > + * find_next_bit - find the next set bit in a memory region
> > + * @addr: The address to base the search on
> > + * @offset: The bitnumber to start searching at
> > + * @size: The bitmap size in bits
> > + */
> > +extern unsigned long find_next_bit(const unsigned long *addr,
> > unsigned long
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size, unsigned long offset)=
;
> > +#endif
> > +
> > +#ifndef find_next_zero_bit
> > +/**
> > + * find_next_zero_bit - find the next cleared bit in a memory
> > region
> > + * @addr: The address to base the search on
> > + * @offset: The bitnumber to start searching at
> > + * @size: The bitmap size in bits
> > + */
> > +extern unsigned long find_next_zero_bit(const unsigned long *addr,
> > unsigned
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long size, unsigned long of=
fset);
> > +#endif
> > +
> > +/**
> > + * find_first_bit - find the first set bit in a memory region
> > + * @addr: The address to start the search at
> > + * @size: The maximum size to search
> > + *
> > + * Returns the bit number of the first set bit.
> > + */
> > +extern unsigned long find_first_bit(const unsigned long *addr,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long size);
> > +
> > +/**
> > + * find_first_zero_bit - find the first cleared bit in a memory
> > region
> > + * @addr: The address to start the search at
> > + * @size: The maximum size to search
> > + *
> > + * Returns the bit number of the first cleared bit.
> > + */
> > +extern unsigned long find_first_zero_bit(const unsigned long
> > *addr,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long size);
> > +
> > +/**
> > + * ffs - find first bit in word.
> > + * @word: The word to search
> > + *
> > + * Returns 0 if no bit exists, otherwise returns 1-indexed bit
> > location.
> > + */
> > +static inline unsigned long __ffs(unsigned long word)
> > +{
> > +=C2=A0=C2=A0=C2=A0 int num =3D 0;
>=20
> I understand it's this way in Linux, so there may be reasons to keep
> it
> like that. Generally though we'd prefer unsigned here, and the type
> of
> a variable used for the return value of a function would also better
> be
> in sync with the function's return type (which I don't think needs to
> be "unsigned long" either; "unsigned int" would apparently suffice).
>=20
> > +#if BITS_PER_LONG =3D=3D 64
> > +=C2=A0=C2=A0=C2=A0 if ((word & 0xffffffff) =3D=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num +=3D 32;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 word >>=3D 32;
> > +=C2=A0=C2=A0=C2=A0 }
>=20
> You're ending up with neither Xen nor Linux style this way. May I
> suggest to settle on either?

Will it fine to rework header from Linux to Xen style? Does it make
sense?
I think this file can be reworked to Xen style as I don't expect that
it will be changed since it will be merged.

>=20
> > +#endif
> > +=C2=A0=C2=A0=C2=A0 if ((word & 0xffff) =3D=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num +=3D 16;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 word >>=3D 16;
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 if ((word & 0xff) =3D=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num +=3D 8;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 word >>=3D 8;
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 if ((word & 0xf) =3D=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num +=3D 4;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 word >>=3D 4;
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 if ((word & 0x3) =3D=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num +=3D 2;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 word >>=3D 2;
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 if ((word & 0x1) =3D=3D 0)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num +=3D 1;
> > +=C2=A0=C2=A0=C2=A0 return num;
> > +}
> > +
> > +/**
> > + * ffsl - find first bit in long.
> > + * @word: The word to search
> > + *
> > + * Returns 0 if no bit exists, otherwise returns 1-indexed bit
> > location.
> > + */
> > +static inline unsigned int ffsl(unsigned long word)
> > +{
> > +=C2=A0=C2=A0=C2=A0 int num =3D 1;
> > +
> > +=C2=A0=C2=A0=C2=A0 if (!word)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > +
> > +#if BITS_PER_LONG =3D=3D 64
> > +=C2=A0=C2=A0=C2=A0 if ((word & 0xffffffff) =3D=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num +=3D 32;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 word >>=3D 32;
> > +=C2=A0=C2=A0=C2=A0 }
> > +#endif
> > +=C2=A0=C2=A0=C2=A0 if ((word & 0xffff) =3D=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num +=3D 16;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 word >>=3D 16;
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 if ((word & 0xff) =3D=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num +=3D 8;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 word >>=3D 8;
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 if ((word & 0xf) =3D=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num +=3D 4;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 word >>=3D 4;
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 if ((word & 0x3) =3D=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num +=3D 2;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 word >>=3D 2;
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 if ((word & 0x1) =3D=3D 0)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num +=3D 1;
> > +=C2=A0=C2=A0=C2=A0 return num;
> > +}
>=20
> What's RISC-V-specific about the above? IOW why ...
>=20
> > +#include <asm-generic/bitops/fls.h>
> > +#include <asm-generic/bitops/flsl.h>
> > +#include <asm-generic/bitops/ffs.h>
> > +#include <asm-generic/bitops/ffz.h>
>=20
> ... can't those two also come from respective generic headers?
Sure it can. Originally, I don't introduce it as generic headers
because RISC-V is only one who isn using C generic version.

I found that there is already present such generic function in
xen/bitops.h. I think it makes sense to re-use them.

>=20
> > --- /dev/null
> > +++ b/xen/include/asm-generic/bitops/bitops-bits.h
> > @@ -0,0 +1,10 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_GENERIC_BITOPS_BITS_H_
> > +#define _ASM_GENERIC_BITOPS_BITS_H_
> > +
> > +#define BITOP_BITS_PER_WORD=C2=A0=C2=A0=C2=A0=C2=A0 32
> > +#define BITOP_MASK(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (1UL << ((nr) %
> > BITOP_BITS_PER_WORD))
>=20
> Why 1UL and not just 1U, when bits per word is 32?
There is no specific reason, should 1U. ( I originally used
BITOPS_BITS_PER_LONG ) and with introduction of asm-generic bitops
decided to follow what other archs provide.

Regarding to the second part of the question, I don't understand it
fully. Considering BITOP_BIT_PER_WORD definition for other archs ( ARM
and PPC ) it is expected that word is 32 bits.

>=20
> > +#define BITOP_WORD(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ((nr) / BITOP_BITS_PER_WORD)
> > +#define BITS_PER_BYTE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 8
> > +
> > +#endif /* _ASM_GENERIC_BITOPS_BITS_H_ */
> > \ No newline at end of file
>=20
> Nit: I did comment on such before (and there's at least one more
> further down).
Thanks.
I'll add a newline.

>=20
> > --- /dev/null
> > +++ b/xen/include/asm-generic/bitops/ffs.h
> > @@ -0,0 +1,9 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_GENERIC_BITOPS_FFS_H_
> > +#define _ASM_GENERIC_BITOPS_FFS_H_
> > +
> > +#include <xen/macros.h>
> > +
> > +#define ffs(x) ({ unsigned int t_ =3D (x); fls(ISOLATE_LSB(t_)); })
> > +
> > +#endif /* _ASM_GENERIC_BITOPS_FFS_H_ */
> > diff --git a/xen/include/asm-generic/bitops/ffz.h
> > b/xen/include/asm-generic/bitops/ffz.h
> > new file mode 100644
> > index 0000000000..92c35455d5
> > --- /dev/null
> > +++ b/xen/include/asm-generic/bitops/ffz.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_GENERIC_BITOPS_FFZ_H_
> > +#define _ASM_GENERIC_BITOPS_FFZ_H_
> > +
> > +/*
> > + * ffz - find first zero in word.
> > + * @word: The word to search
> > + *
> > + * Undefined if no zero exists, so code should check against ~0UL
> > first.
> > + */
> > +#define ffz(x)=C2=A0 __ffs(~(x))
>=20
> For a generic header I'd like to see consistency: ffz() may expand to
> ffs(), and __ffz() may expand to __ffs(). A mix like you have it
> above
> wants at least explaining in the description. (I don't understand
> anyway why both ffs() and __ffs() would be needed. We don't have any
> __ffs() on x86 afaics.)
Then it looks to me that ffs() should be used instead.
ffz() was defined with __ffs() because Arm and PPC are defined so.
>=20
> > --- /dev/null
> > +++ b/xen/include/asm-generic/bitops/find-first-bit-set.h
>=20
> This file name, if it really needs to be this long, wants to match
> ...
>=20
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_GENERIC_BITOPS_FIND_FIRST_BIT_SET_H_
> > +#define _ASM_GENERIC_BITOPS_FIND_FIRST_BIT_SET_H_
> > +
> > +/**
> > + * find_first_set_bit - find the first set bit in @word
> > + * @word: the word to search
> > + *
> > + * Returns the bit-number of the first set bit (first bit being
> > 0).
> > + * The input must *not* be zero.
> > + */
> > +static inline unsigned int find_first_set_bit(unsigned long word)
>=20
> ... the function implemented herein.
Thanks. I'll update the file name.
>=20
> > --- /dev/null
> > +++ b/xen/include/asm-generic/bitops/fls.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_GENERIC_BITOPS_FLS_H_
> > +#define _ASM_GENERIC_BITOPS_FLS_H_
> > +
> > +/**
> > + * fls - find last (most-significant) bit set
> > + * @x: the word to search
> > + *
> > + * This is defined the same way as ffs.
> > + * Note fls(0) =3D 0, fls(1) =3D 1, fls(0x80000000) =3D 32.
> > + */
> > +
> > +static inline int fls(unsigned int x)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return generic_fls(x);
> > +}
>=20
> Seing this, why would e.g. ffsl() not use generic_ffsl() then?
>=20
> > --- /dev/null
> > +++ b/xen/include/asm-generic/bitops/hweight.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_GENERIC_BITOPS_HWEIGHT_H_
> > +#define _ASM_GENERIC_BITOPS_HWEIGHT_H_
> > +
> > +/*
> > + * hweightN - returns the hamming weight of a N-bit word
> > + * @x: the word to weigh
> > + *
> > + * The Hamming Weight of a number is the total number of bits set
> > in it.
> > + */
> > +#define hweight64(x) generic_hweight64(x)
> > +
> > +#endif /* _ASM_GENERIC_BITOPS_HWEIGHT_H_ */
>=20
> Do we really need this? An arch not having suitable insns (RISC-V
> has,
> iirc) can easily have this one #define (or the ip to four ones when
> also covering the other widths) in its asm header.
>=20
> > --- /dev/null
> > +++ b/xen/include/asm-generic/bitops/test-bit.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_GENERIC_BITOPS_TESTBIT_H_
> > +#define _ASM_GENERIC_BITOPS_TESTBIT_H_
> > +
> > +/**
> > + * test_bit - Determine whether a bit is set
> > + * @nr: bit number to test
> > + * @addr: Address to start counting from
> > + */
> > +static inline int test_bit(int nr, const volatile void *addr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 const volatile unsigned int *p =3D addr;
>=20
> With BITOP_BITS_PER_WORD I think you really mean uint32_t here.
Isn't it the same: 'unsigned int' and 'uint32_t'?

> Also you want to make sure asm-generic/bitops/bitops-bits.h is
> really in use here, or else an arch overriding / not using that
> header may end up screwed.
I am not really understand what do you mean. Could you please explain a
little bit more.

~ Oleksii
>=20
> Jan
>=20
> > +=C2=A0=C2=A0=C2=A0 return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_=
PER_WORD -
> > 1)));
> > +}
> > +
> > +#endif /* _ASM_GENERIC_BITOPS_TESTBIT_H_ */
> > \ No newline at end of file
>=20


