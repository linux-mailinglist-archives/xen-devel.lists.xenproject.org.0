Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0A3898BA3
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 17:55:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700957.1094843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPQI-0003ym-P5; Thu, 04 Apr 2024 15:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700957.1094843; Thu, 04 Apr 2024 15:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPQI-0003x9-M6; Thu, 04 Apr 2024 15:54:42 +0000
Received: by outflank-mailman (input) for mailman id 700957;
 Thu, 04 Apr 2024 15:54:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LwOm=LJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rsPQH-0003x3-LC
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 15:54:41 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5496e81-f29b-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 17:54:40 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-516d15d72c3so592990e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 08:54:40 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y7-20020ac24e67000000b005139b9f1162sm2299113lfs.281.2024.04.04.08.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 08:54:39 -0700 (PDT)
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
X-Inumbo-ID: a5496e81-f29b-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712246080; x=1712850880; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hUYh3T8KPJ8rcTlaABDt5p/TEKrAurIIjn6/8KeE/C4=;
        b=Dz3NAjK0sGPpuv1UvDzCz9cIFhlJ2FrtEZ1L01sme6ZQcjY74FwNfCuI1sdVr2g0Fn
         93akD47uHHtHiBnRsVhTeHHsEvxzmSTx31ILF9F/jdq0mE8svKVAamtsm/WPYpvSYcj+
         zrCT5l7KalrPeGIDAGHleYBRH8t3fKq1uN0wAppbtXup13mQioF6AMcUVz+5D+sR7WWZ
         odUBMNQVRGqKkx3HBP8luAhnRSzJsx8B0aMRGkVl7JkBR8FDoOMt1U75dc8I6A8ud0Ph
         jwFxnxQhcwrOH7blJ1aIXZIBdk0FDgMePp4c6zh/EmJk8QRFVReVki3Qsshl4ObvEj/g
         3uVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712246080; x=1712850880;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hUYh3T8KPJ8rcTlaABDt5p/TEKrAurIIjn6/8KeE/C4=;
        b=p28PgNuUTLOHkuNmtZHKggOxqb7ewqksUnX4wIDfr9yy5k8vliqPGdRXq7shE5snWA
         2y6Y+usCWoID0AKCmTRuMzQ2AN7y5DUt4PUcyTs7pXpC8qMf4N7oova5pu4DTFBNf5Ho
         J4Yy7rbwVshsMhKvF6QuOwuayLLbcBSF8dN3zexZo4cOaMe7K1HV/jEA8hNyJs3OXL7n
         o+Od1C3QUzVdcwwjb/vNYoAxuekqv9pY7cU6puD0yYezmCm/9KugSdfbgMwxMnLm70FB
         HCT82u+yvCKiiKduLWsm90ezTjN6Edu4bfbIcqGN+p8xkAarZM6SbHt51TaIe6g19abR
         2aKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKSqN2hKBCMmLJVank8YWS5Q7KlqTEn6SCLscGGYlMAX00PEVvowiQtpVwHQz3Kv7CB5lwO6jVJV9AYwbmHSNgTL6WNubC79Aop7caSSs=
X-Gm-Message-State: AOJu0YzaVIoEo5ttTJ36puTe4WMGgeykT1UqGH1HcPALGNjdx3FtDlpw
	uA330Z5kOQpZvS08rWwU3bU3NoEgDLh67wWQ7B5Oim+4pzdOxPf7
X-Google-Smtp-Source: AGHT+IF67O4BiFgVcDnhA814VsrA7EkevTGMBsAWljXdX8/IVXmwGacFCGuViirjCZ4nwKirbwBAHw==
X-Received: by 2002:a19:3842:0:b0:513:c60a:5fc0 with SMTP id d2-20020a193842000000b00513c60a5fc0mr2074807lfj.0.1712246079608;
        Thu, 04 Apr 2024 08:54:39 -0700 (PDT)
Message-ID: <a36add6ed207c034fc0b4a95a22d8ab246b965b5.camel@gmail.com>
Subject: Re: [PATCH v7 07/19] xen/riscv: introduce bitops.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 04 Apr 2024 17:54:38 +0200
In-Reply-To: <dd2a03f9-f72b-4947-8c7d-1c1345b4b31e@suse.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <3d8a46946a37ca499e962aa6504fa453326e5ad0.1712137031.git.oleksii.kurochko@gmail.com>
	 <dd2a03f9-f72b-4947-8c7d-1c1345b4b31e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-04-04 at 16:47 +0200, Jan Beulich wrote:
> On 03.04.2024 12:20, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/bitops.h
> > @@ -0,0 +1,146 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/* Copyright (C) 2012 Regents of the University of California */
> > +
> > +#ifndef _ASM_RISCV_BITOPS_H
> > +#define _ASM_RISCV_BITOPS_H
> > +
> > +#include <asm/system.h>
> > +
> > +#undef BITOP_BITS_PER_WORD
> > +#undef bitop_uint_t
> > +
> > +#define BITOP_BITS_PER_WORD BITS_PER_LONG
> > +#define bitop_uint_t unsigned long
> > +
> > +#if BITS_PER_LONG =3D=3D 64
> > +#define __AMO(op)=C2=A0=C2=A0 "amo" #op ".d"
> > +#elif BITS_PER_LONG =3D=3D 32
> > +#define __AMO(op)=C2=A0=C2=A0 "amo" #op ".w"
> > +#else
> > +#error "Unexpected BITS_PER_LONG"
> > +#endif
> > +
> > +#define __set_bit(n, p)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_bit(n, p)
> > +#define __clear_bit(n, p)=C2=A0=C2=A0=C2=A0 clear_bit(n, p)
>=20
> First without comment and then ...
>=20
> > +/* Based on linux/arch/include/asm/bitops.h */
> > +
> > +/*
> > + * Non-atomic bit manipulation.
> > + *
> > + * Implemented using atomics to be interrupt safe. Could
> > alternatively
> > + * implement with local interrupt masking.
> > + */
> > +#define __set_bit(n, p)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_bit(n, p)
> > +#define __clear_bit(n, p)=C2=A0=C2=A0=C2=A0 clear_bit(n, p)
>=20
> ... with one?
Hmm, it seems like rebasing issue with autoconflict resolving. It
should be only definitions with the comment.

>=20
> > +/* Based on linux/arch/include/asm/bitops.h */
>=20
> Does this really need repeating?
>=20
> > +#define test_and_op_bit_ord(op, mod, nr, addr, ord)=C2=A0=C2=A0=C2=A0=
=C2=A0 \
> > +({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 unsigned long res, mask;=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>=20
> bitop_uint_t?
>=20
> > +=C2=A0=C2=A0=C2=A0 mask =3D BITOP_MASK(nr);=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 asm volatile (=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>=20
> Nit: One too many padding blanks.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __AMO(op) #ord " %0, %2, %1=
"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (res), "+A" (addr[=
BITOP_WORD(nr)])=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (mod(mask))=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 ((res & mask) !=3D 0);=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
> > +})
> > +
> > +#define op_bit_ord(op, mod, nr, addr, ord)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> > +=C2=A0=C2=A0=C2=A0 asm volatile (=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __AMO(op) #ord " zero, %1, =
%0"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+A" (addr[BITOP_WORD(nr)=
])=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (mod(BITOP_MASK(nr)))=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");
> > +
> > +#define test_and_op_bit(op, mod, nr, addr)=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
> > +#define op_bit(op, mod, nr, addr) \
> > +=C2=A0=C2=A0=C2=A0 op_bit_ord(op, mod, nr, addr, )
> > +
> > +/* Bitmask modifiers */
> > +#define NOP(x)=C2=A0=C2=A0=C2=A0 (x)
> > +#define NOT(x)=C2=A0=C2=A0=C2=A0 (~(x))
> > +
> > +/**
> > + * test_and_set_bit - Set a bit and return its old value
> > + * @nr: Bit to set
> > + * @addr: Address to count from
> > + */
> > +static inline int test_and_set_bit(int nr, volatile void *p)
>=20
> In patch 4 you switched to bool. Any reason you didn't here, too?
Sure, it should return bool here too and probably some other functions
below.

>=20
> > +{
> > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *addr =3D p;
> > +
> > +=C2=A0=C2=A0=C2=A0 return test_and_op_bit(or, NOP, nr, addr);
> > +}
> > +
> > +/**
> > + * test_and_clear_bit - Clear a bit and return its old value
> > + * @nr: Bit to clear
> > + * @addr: Address to count from
> > + */
> > +static inline int test_and_clear_bit(int nr, volatile void *p)
> > +{
> > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *addr =3D p;
> > +
> > +=C2=A0=C2=A0=C2=A0 return test_and_op_bit(and, NOT, nr, addr);
> > +}
> > +
> > +/**
> > + * set_bit - Atomically set a bit in memory
> > + * @nr: the bit to set
> > + * @addr: the address to start counting from
> > + *
> > + * Note that @nr may be almost arbitrarily large; this function is
> > not
> > + * restricted to acting on a single-word quantity.
> > + */
> > +static inline void set_bit(int nr, volatile void *p)
> > +{
> > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *addr =3D p;
> > +
> > +=C2=A0=C2=A0=C2=A0 op_bit(or, NOP, nr, addr);
> > +}
> > +
> > +/**
> > + * clear_bit - Clears a bit in memory
> > + * @nr: Bit to clear
> > + * @addr: Address to start counting from
> > + */
> > +static inline void clear_bit(int nr, volatile void *p)
> > +{
> > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *addr =3D p;
> > +
> > +=C2=A0=C2=A0=C2=A0 op_bit(and, NOT, nr, addr);
> > +}
> > +
> > +/**
> > + * test_and_change_bit - Toggle (change) a bit and return its old
> > value
> > + * @nr: Bit to change
> > + * @addr: Address to count from
> > + *
> > + * This operation is atomic and cannot be reordered.
> > + * It also implies a memory barrier.
> > + */
> > +static inline int test_and_change_bit(int nr, volatile unsigned
> > long *addr)
>=20
> unsigned long?
It should be volatile void *. Something that was copied from Linux
kernel and I missed to change.

~ Oleksii

>=20
> > +{
> > +	return test_and_op_bit(xor, NOP, nr, addr);
> > +}
>=20
> Perhaps better to move up a little, next to the other test_and-s?
>=20
> Also - nit: Hard tab used for indentation.
>=20
> > +#undef test_and_op_bit
> > +#undef __op_bit
>=20
> This no longer has any effect in this shape.
>=20
> Jan


