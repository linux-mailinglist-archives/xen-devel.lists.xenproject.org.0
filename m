Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F54838E9A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 13:35:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670441.1043213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSFzG-0002V7-V0; Tue, 23 Jan 2024 12:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670441.1043213; Tue, 23 Jan 2024 12:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSFzG-0002Rs-Rz; Tue, 23 Jan 2024 12:34:42 +0000
Received: by outflank-mailman (input) for mailman id 670441;
 Tue, 23 Jan 2024 12:34:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OrDF=JB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSFzE-0002Rk-JZ
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 12:34:40 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5d7918b-b9eb-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 13:34:38 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a2dc7827a97so463384966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 04:34:38 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a17090612d200b00a28fd9607a8sm14316503ejb.81.2024.01.23.04.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 04:34:37 -0800 (PST)
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
X-Inumbo-ID: c5d7918b-b9eb-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706013278; x=1706618078; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4YID5zeWxTcKedNchaS9M/Sss886vPmOHYTrMvovnLY=;
        b=llN5HtdtZ57zjV+pgc/HOzvzJwlSnyBdsh6/jofn97UhFzQ5daEJQeanIBnmhKjt9t
         n/pviBZ2aZgIU526ENmYbRMEs4ay1DEscXTbMpm2HdlsC8Zf4MrtcSTse6x08HP7Tw2W
         SDbXSCOJyjXQLl4k2WNbB/WiIPETDSSzGFumiFPYa5NWL7Zi+Lt3Q0qH/jEyf7r+DrU8
         g1EwKVzKDvmkwgEJgmJ3/9Yzjpkz3bV54TQPwwA6q3zEj7yr42i35Kr9tDyA5TWrrTqW
         VtsTpNAsxN9np76r47ct8kpMIKQJStxVn6moZCDpguLBdwrkWDQYFDaqVpDtmy3n8sfs
         NAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706013278; x=1706618078;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YID5zeWxTcKedNchaS9M/Sss886vPmOHYTrMvovnLY=;
        b=R3df6BiMpxrlBVyXl+bGjrrsUEZXp9IizG8w8AeOixL3di3d/0qqzguv9Uw5atR+22
         mXama2iLp5NY8oFYUSZfHfcOJ+AQAfR/FLPzguYJ0vzswuEKCSmxfoMVKriZoNjNNbuo
         Lijv7qUlvyrMDpuBfOaZUfyII0fhJkXcBr1qcRpI0UbEmWejmRit//KcqGJg7qBhVTo5
         uHl05694dGuuYMzKWcnmG+j1sxsGkX3SWaJRFgnr5IHXdcQ1ictU6liJPSnuDlZh5oWT
         QfAupr3a31iFoh7/171fWyx9zOKgc/pP8FJGnXwxM7tmpN1BdOccoJKR4UvRF7Yn/6SR
         HLuw==
X-Gm-Message-State: AOJu0YwLfdLQ2bmMfVBsFGq50605+b6t18IP272WF21VLT0Bu0XJ995I
	0DINU8ljRZZQNI1fbVHAw+x8sYoBiC+xuCvYd7FCsWHydxyquFVj
X-Google-Smtp-Source: AGHT+IGBOLV2mYT3VUmuMCuf2hgxP1v9o+YwCzRI/4sB5COLHsGgZ5zLo6qT/uvlBTBqUGTQZ8UpLw==
X-Received: by 2002:a17:907:a70c:b0:a30:92d4:cc81 with SMTP id vw12-20020a170907a70c00b00a3092d4cc81mr1239790ejc.86.1706013277496;
        Tue, 23 Jan 2024 04:34:37 -0800 (PST)
Message-ID: <05d685b0b7ccd329454a336b20351979bdf91ea4.camel@gmail.com>
Subject: Re: [PATCH v3 16/34] xen/lib: introduce generic find next bit
 operations
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 23 Jan 2024 14:34:36 +0200
In-Reply-To: <81e5cac4-90f0-4fff-b891-53ca73c61832@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <bb47caf6c275d8aea307b96e79828831eab4a703.1703255175.git.oleksii.kurochko@gmail.com>
	 <81e5cac4-90f0-4fff-b891-53ca73c61832@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-23 at 12:14 +0100, Jan Beulich wrote:
> On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/fence.h
> > +++ b/xen/arch/riscv/include/asm/fence.h
> > @@ -1,4 +1,4 @@
> > -/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > =C2=A0#ifndef _ASM_RISCV_FENCE_H
> > =C2=A0#define _ASM_RISCV_FENCE_H
> > =C2=A0
> > @@ -11,3 +11,12 @@
> > =C2=A0#endif
> > =C2=A0
> > =C2=A0#endif	/* _ASM_RISCV_FENCE_H */
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
>=20
> Surely all of this wants doing in the previous patch, where the
> header
> is introduced?
Yes, it should be in the previous patch. I'll do the proper rebase.

>=20
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -47,6 +47,9 @@ config ARCH_MAP_DOMAIN_PAGE
> > =C2=A0config GENERIC_BUG_FRAME
> > =C2=A0	bool
> > =C2=A0
> > +config GENERIC_FIND_NEXT_BIT
> > +	bool
>=20
> There's no need for this, as ...
>=20
> > --- a/xen/lib/Makefile
> > +++ b/xen/lib/Makefile
> > @@ -3,6 +3,7 @@ obj-$(CONFIG_X86) +=3D x86/
> > =C2=A0lib-y +=3D bsearch.o
> > =C2=A0lib-y +=3D ctors.o
> > =C2=A0lib-y +=3D ctype.o
> > +lib-$(CONFIG_GENERIC_FIND_NEXT_BIT) +=3D find-next-bit.o
>=20
> ... you're moving this to lib/. Or have you encountered any issue
> with building this uniformly, and you forgot to mention this in
> the description?
I didn't check. My intention was to provide opportunity to check if an
architecture want to use generic version or not. Otherwise, I expected
that we will have multiple definiotion of the funcion.

But considering that they are all defined under #ifdef...#endif we can
remove the declaration of the config GENERIC_FIND_NEXT_BIT.
>=20
> > --- /dev/null
> > +++ b/xen/lib/find-next-bit.c
> > @@ -0,0 +1,281 @@
> > +/* find_next_bit.c: fallback find next bit implementation
> > + *
> > + * Copyright (C) 2004 Red Hat, Inc. All Rights Reserved.
> > + * Written by David Howells (dhowells@redhat.com)
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version
> > + * 2 of the License, or (at your option) any later version.
> > + */
> > +#include <xen/bitops.h>
> > +
> > +#include <asm/byteorder.h>
> > +
> > +#ifndef find_next_bit
> > +/*
> > + * Find the next set bit in a memory region.
> > + */
> > +unsigned long find_next_bit(const unsigned long *addr, unsigned
> > long size,
> > +			=C2=A0=C2=A0=C2=A0 unsigned long offset)
> > +{
> > +	const unsigned long *p =3D addr + BIT_WORD(offset);
> > +	unsigned long result =3D offset & ~(BITS_PER_LONG-1);
> > +	unsigned long tmp;
> > +
> > +	if (offset >=3D size)
> > +		return size;
> > +	size -=3D result;
> > +	offset %=3D BITS_PER_LONG;
> > +	if (offset) {
> > +		tmp =3D *(p++);
> > +		tmp &=3D (~0UL << offset);
> > +		if (size < BITS_PER_LONG)
> > +			goto found_first;
> > +		if (tmp)
> > +			goto found_middle;
> > +		size -=3D BITS_PER_LONG;
> > +		result +=3D BITS_PER_LONG;
> > +	}
> > +	while (size & ~(BITS_PER_LONG-1)) {
> > +		if ((tmp =3D *(p++)))
> > +			goto found_middle;
> > +		result +=3D BITS_PER_LONG;
> > +		size -=3D BITS_PER_LONG;
> > +	}
> > +	if (!size)
> > +		return result;
> > +	tmp =3D *p;
> > +
> > +found_first:
> > +	tmp &=3D (~0UL >> (BITS_PER_LONG - size));
> > +	if (tmp =3D=3D 0UL)		/* Are any bits set? */
> > +		return result + size;	/* Nope. */
> > +found_middle:
> > +	return result + __ffs(tmp);
> > +}
> > +EXPORT_SYMBOL(find_next_bit);
> > +#endif
> > +
> > +#ifndef find_next_zero_bit
> > +/*
> > + * This implementation of find_{first,next}_zero_bit was stolen
> > from
> > + * Linus' asm-alpha/bitops.h.
> > + */
> > +unsigned long find_next_zero_bit(const unsigned long *addr,
> > unsigned long size,
> > +				 unsigned long offset)
> > +{
> > +	const unsigned long *p =3D addr + BIT_WORD(offset);
> > +	unsigned long result =3D offset & ~(BITS_PER_LONG-1);
> > +	unsigned long tmp;
> > +
> > +	if (offset >=3D size)
> > +		return size;
> > +	size -=3D result;
> > +	offset %=3D BITS_PER_LONG;
> > +	if (offset) {
> > +		tmp =3D *(p++);
> > +		tmp |=3D ~0UL >> (BITS_PER_LONG - offset);
> > +		if (size < BITS_PER_LONG)
> > +			goto found_first;
> > +		if (~tmp)
> > +			goto found_middle;
> > +		size -=3D BITS_PER_LONG;
> > +		result +=3D BITS_PER_LONG;
> > +	}
> > +	while (size & ~(BITS_PER_LONG-1)) {
> > +		if (~(tmp =3D *(p++)))
> > +			goto found_middle;
> > +		result +=3D BITS_PER_LONG;
> > +		size -=3D BITS_PER_LONG;
> > +	}
> > +	if (!size)
> > +		return result;
> > +	tmp =3D *p;
> > +
> > +found_first:
> > +	tmp |=3D ~0UL << size;
> > +	if (tmp =3D=3D ~0UL)	/* Are any bits zero? */
> > +		return result + size;	/* Nope. */
> > +found_middle:
> > +	return result + ffz(tmp);
> > +}
> > +EXPORT_SYMBOL(find_next_zero_bit);
> > +#endif
> > +
> > +#ifndef find_first_bit
> > +/*
> > + * Find the first set bit in a memory region.
> > + */
> > +unsigned long find_first_bit(const unsigned long *addr, unsigned
> > long size)
> > +{
> > +	const unsigned long *p =3D addr;
> > +	unsigned long result =3D 0;
> > +	unsigned long tmp;
> > +
> > +	while (size & ~(BITS_PER_LONG-1)) {
> > +		if ((tmp =3D *(p++)))
> > +			goto found;
> > +		result +=3D BITS_PER_LONG;
> > +		size -=3D BITS_PER_LONG;
> > +	}
> > +	if (!size)
> > +		return result;
> > +
> > +	tmp =3D (*p) & (~0UL >> (BITS_PER_LONG - size));
> > +	if (tmp =3D=3D 0UL)		/* Are any bits set? */
> > +		return result + size;	/* Nope. */
> > +found:
> > +	return result + __ffs(tmp);
> > +}
> > +EXPORT_SYMBOL(find_first_bit);
> > +#endif
> > +
> > +#ifndef find_first_zero_bit
> > +/*
> > + * Find the first cleared bit in a memory region.
> > + */
> > +unsigned long find_first_zero_bit(const unsigned long *addr,
> > unsigned long size)
> > +{
> > +	const unsigned long *p =3D addr;
> > +	unsigned long result =3D 0;
> > +	unsigned long tmp;
> > +
> > +	while (size & ~(BITS_PER_LONG-1)) {
> > +		if (~(tmp =3D *(p++)))
> > +			goto found;
> > +		result +=3D BITS_PER_LONG;
> > +		size -=3D BITS_PER_LONG;
> > +	}
> > +	if (!size)
> > +		return result;
> > +
> > +	tmp =3D (*p) | (~0UL << size);
> > +	if (tmp =3D=3D ~0UL)	/* Are any bits zero? */
> > +		return result + size;	/* Nope. */
> > +found:
> > +	return result + ffz(tmp);
> > +}
> > +EXPORT_SYMBOL(find_first_zero_bit);
> > +#endif
> > +
> > +#ifdef __BIG_ENDIAN
> > +
> > +/* include/linux/byteorder does not support "unsigned long" type
> > */
> > +static inline unsigned long ext2_swabp(const unsigned long * x)
> > +{
> > +#if BITS_PER_LONG =3D=3D 64
> > +	return (unsigned long) __swab64p((u64 *) x);
> > +#elif BITS_PER_LONG =3D=3D 32
> > +	return (unsigned long) __swab32p((u32 *) x);
> > +#else
> > +#error BITS_PER_LONG not defined
> > +#endif
> > +}
> > +
> > +/* include/linux/byteorder doesn't support "unsigned long" type */
> > +static inline unsigned long ext2_swab(const unsigned long y)
> > +{
> > +#if BITS_PER_LONG =3D=3D 64
> > +	return (unsigned long) __swab64((u64) y);
> > +#elif BITS_PER_LONG =3D=3D 32
> > +	return (unsigned long) __swab32((u32) y);
> > +#else
> > +#error BITS_PER_LONG not defined
> > +#endif
> > +}
> > +
> > +#ifndef find_next_zero_bit_le
> > +unsigned long find_next_zero_bit_le(const void *addr, unsigned
> > +		long size, unsigned long offset)
> > +{
> > +	const unsigned long *p =3D addr;
> > +	unsigned long result =3D offset & ~(BITS_PER_LONG - 1);
> > +	unsigned long tmp;
> > +
> > +	if (offset >=3D size)
> > +		return size;
> > +	p +=3D BIT_WORD(offset);
> > +	size -=3D result;
> > +	offset &=3D (BITS_PER_LONG - 1UL);
> > +	if (offset) {
> > +		tmp =3D ext2_swabp(p++);
> > +		tmp |=3D (~0UL >> (BITS_PER_LONG - offset));
> > +		if (size < BITS_PER_LONG)
> > +			goto found_first;
> > +		if (~tmp)
> > +			goto found_middle;
> > +		size -=3D BITS_PER_LONG;
> > +		result +=3D BITS_PER_LONG;
> > +	}
> > +
> > +	while (size & ~(BITS_PER_LONG - 1)) {
> > +		if (~(tmp =3D *(p++)))
> > +			goto found_middle_swap;
> > +		result +=3D BITS_PER_LONG;
> > +		size -=3D BITS_PER_LONG;
> > +	}
> > +	if (!size)
> > +		return result;
> > +	tmp =3D ext2_swabp(p);
> > +found_first:
> > +	tmp |=3D ~0UL << size;
> > +	if (tmp =3D=3D ~0UL)	/* Are any bits zero? */
> > +		return result + size; /* Nope. Skip ffz */
> > +found_middle:
> > +	return result + ffz(tmp);
> > +
> > +found_middle_swap:
> > +	return result + ffz(ext2_swab(tmp));
> > +}
> > +EXPORT_SYMBOL(find_next_zero_bit_le);
> > +#endif
> > +
> > +#ifndef find_next_bit_le
> > +unsigned long find_next_bit_le(const void *addr, unsigned
> > +		long size, unsigned long offset)
> > +{
> > +	const unsigned long *p =3D addr;
> > +	unsigned long result =3D offset & ~(BITS_PER_LONG - 1);
> > +	unsigned long tmp;
> > +
> > +	if (offset >=3D size)
> > +		return size;
> > +	p +=3D BIT_WORD(offset);
> > +	size -=3D result;
> > +	offset &=3D (BITS_PER_LONG - 1UL);
> > +	if (offset) {
> > +		tmp =3D ext2_swabp(p++);
> > +		tmp &=3D (~0UL << offset);
> > +		if (size < BITS_PER_LONG)
> > +			goto found_first;
> > +		if (tmp)
> > +			goto found_middle;
> > +		size -=3D BITS_PER_LONG;
> > +		result +=3D BITS_PER_LONG;
> > +	}
> > +
> > +	while (size & ~(BITS_PER_LONG - 1)) {
> > +		tmp =3D *(p++);
> > +		if (tmp)
> > +			goto found_middle_swap;
> > +		result +=3D BITS_PER_LONG;
> > +		size -=3D BITS_PER_LONG;
> > +	}
> > +	if (!size)
> > +		return result;
> > +	tmp =3D ext2_swabp(p);
> > +found_first:
> > +	tmp &=3D (~0UL >> (BITS_PER_LONG - size));
> > +	if (tmp =3D=3D 0UL)		/* Are any bits set? */
> > +		return result + size; /* Nope. */
> > +found_middle:
> > +	return result + __ffs(tmp);
> > +
> > +found_middle_swap:
> > +	return result + __ffs(ext2_swab(tmp));
> > +}
> > +EXPORT_SYMBOL(find_next_bit_le);
> > +#endif
> > +
> > +#endif /* __BIG_ENDIAN */
>=20
> I was going to ask that you convince git to actually present a proper
> diff, to make visible what changes. But other than the description
> says
> you don't really move the file, you copy it. Judging from further
> titles
> there's also nowhere you'd make Arm actually use this now generic
> code.
I wanted to do it separately, outside this patch series to simplify
review and not have Arm specific changes in RISC-V patch series.

Regarding a proper diff, you would like me to make git shows that it
was copy from Arm and it is not newly created file. Am I understand you
correctly?

~ Oleksii

