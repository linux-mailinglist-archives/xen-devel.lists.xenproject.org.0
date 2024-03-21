Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7893B88567E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 10:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696278.1087067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnEiB-00025h-L0; Thu, 21 Mar 2024 09:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696278.1087067; Thu, 21 Mar 2024 09:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnEiB-00023u-I2; Thu, 21 Mar 2024 09:27:47 +0000
Received: by outflank-mailman (input) for mailman id 696278;
 Thu, 21 Mar 2024 09:27:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GvWl=K3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rnEiA-00023o-8g
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 09:27:46 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45afdb66-e765-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 10:27:44 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56b93b45779so857803a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 02:27:44 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a0564021f1400b0056bb5538d02sm1419166edb.11.2024.03.21.02.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 02:27:42 -0700 (PDT)
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
X-Inumbo-ID: 45afdb66-e765-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711013264; x=1711618064; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KVGtMiaRAX4o78Tx4uBWQqBDYScsT6jZpM01VLRGyGc=;
        b=RPFkMBBGKePOG2K2wD15Kz2HLcp71IK0sBcmnDg/Saz6+ugtTpuVoGQzGTNJrh0CVc
         OREJ1kh/Re4c+T6vPBwNtXiXO2MX4Qty/lV4vGdOwmUkAVjk6zz/KarTMdRuX//r9/hn
         2SZ73tLsz8nu6SFobl3xmEKFRq5lCajKaIc83hmfH/2vm/SsvauOPUGDz4kho0nyaCF3
         X7xZnEUBpiiskFa07jBuR3sOcFr/2yqf1SWbwNOfYLwXC6ymNrAsgZXedvYmhTD56ymu
         HUUjc2A6DCXeQiBTRmDkmPmGGEp3fDstDDRPa+3KdES9wygBPGIxM76w5m1M9rNqPMvn
         0fZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711013264; x=1711618064;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KVGtMiaRAX4o78Tx4uBWQqBDYScsT6jZpM01VLRGyGc=;
        b=iCHK2jm7gbyJ7gx8PGHX0NGEuxj4921h1DcKe+lCMc7cYeV8OkkCxsDnH4WJKP0icZ
         gSfQfCiJ4syG+nvjHmnCNbl5myOg56EvdTY1nBZrSJoLCD+MnSYOPQNqgHBGumC/SGKc
         +eLiZiGCHWzAzj7/o0stdN8umghZi6Jx7iC6dd1QtE36+Vl5q5W8aJ9GfON4IhfLNKHg
         j6/71W/NqyR5iEZjYDD/p5UY1kw6uxxi3nkiQ20+Ue4HLjA6XbUM9lo48XAooDULTCz3
         FpEKssFe3qnz6Ve/DzUXULkl+AHmOcNOu9nF+F0QsyTY/AATCe1Ok96dAN7hDKa7qo47
         34jg==
X-Forwarded-Encrypted: i=1; AJvYcCXIOUlrPv/YAtDGzTs2mTt+npiROS3+otAvvcRw3yMnYJsGQyRu0Vtft89k+dJ6fpYO5B08ei/H2ef7ESSbFnzvUY0lz83SyWCBJ1zwC6g=
X-Gm-Message-State: AOJu0YyZ5fep8jKNtjIbXEeiqH93JNYCsOnSBzLjSfMTCdjpmnKNNMiO
	dG276/62grRFHU6u347fjAxRb/0UdFJkO2K32xTapX1uxRYxIvjx
X-Google-Smtp-Source: AGHT+IG4lWoAVVKH3s0oZ7fjFFDVot5ly5OZyAPQkGIbUKipvV9LejJmvSJqTt2xf+eD6hiYOZUT0g==
X-Received: by 2002:a05:6402:c50:b0:568:93bb:d0c2 with SMTP id cs16-20020a0564020c5000b0056893bbd0c2mr17323535edb.20.1711013263466;
        Thu, 21 Mar 2024 02:27:43 -0700 (PDT)
Message-ID: <0bb22584b759207de0a4041bac9118fe43959b69.camel@gmail.com>
Subject: Re: [PATCH v6 04/20] xen/asm-generic: introduce generic non-atomic
 test_*bit()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Thu, 21 Mar 2024 10:27:42 +0100
In-Reply-To: <bf7266c7-659b-4503-97b8-3458384ae299@suse.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <48b7dfafccc7a0ed814b5dfb0f109a0473a1b4b4.1710517542.git.oleksii.kurochko@gmail.com>
	 <bf7266c7-659b-4503-97b8-3458384ae299@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-03-20 at 16:30 +0100, Jan Beulich wrote:
> On 15.03.2024 19:06, Oleksii Kurochko wrote:
> > The patch introduces the following generic functions:
> > * test_bit
> > * generic___test_and_set_bit
> > * generic___test_and_clear_bit
> > * generic___test_and_change_bit
> >=20
> > Also, the patch introduces the following generics which are
> > used by the functions mentioned above:
> > * BITOP_BITS_PER_WORD
> > * BITOP_MASK
> > * BITOP_WORD
> > * BITOP_TYPE
> >=20
> > These functions and macros can be useful for architectures
> > that don't have corresponding arch-specific instructions.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> First of all: How much syncing has there been versus Andrew's plans?
> I don't want to end up in the middle of two entirely different
> approaches to the same generalization goal.
We don't have synced about bit operations mentioned in this patch, so I
decided to follow an approach I have for them. But if Andrew's approach
is better, or it would be better to follow one approach instead of
introducing two approaches, I will be happy to rework this patch.

Andrew, what do you think about this bit ops?

>=20
> > --- /dev/null
> > +++ b/xen/include/asm-generic/bitops/bitops-bits.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_GENERIC_BITOPS_BITS_H_
> > +#define _ASM_GENERIC_BITOPS_BITS_H_
> > +
> > +#ifndef BITOP_BITS_PER_WORD
> > +#define BITOP_BITS_PER_WORD=C2=A0=C2=A0=C2=A0=C2=A0 32
> > +#endif
> > +
> > +#ifndef BITOP_MASK
> > +#define BITOP_MASK(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (1U << ((nr) %
> > BITOP_BITS_PER_WORD))
> > +#endif
> > +
> > +#ifndef BITOP_WORD
> > +#define BITOP_WORD(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ((nr) / BITOP_BITS_PER_WORD)
> > +#endif
> > +
> > +#ifndef BITOP_TYPE
> > +typedef uint32_t bitops_uint_t;
> > +#endif
>=20
> Is it of practical use to permit overriding of one of BITOP_TYPE and
> BITOP_BITS_PER_WORD? I think both want tying together.
>=20
> Is it further of any use to allow overriding of BITOP_{MASK,WORD}?
> There's minimal generalization needed to allow an override of
> BITOP_TYPE, though:
>=20
> #define BITOP_MASK(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ((bitop_uint_t)1 << ((nr) %
> BITOP_BITS_PER_WORD))
>=20
> Note that I've omitted the 's' from the typedef name - the macros
> all having no 'S', imo the type also shouldn't (or the other way
> around).
If to generalize BITOP_MASK in way you suggest, then there is no need
to allow overriding of BITOP_{MASK,WORD}. I'll update this part.

>=20
> > --- /dev/null
> > +++ b/xen/include/asm-generic/bitops/generic-non-atomic.h
> > @@ -0,0 +1,89 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * The file is based on Linux ( 6.4.0 ) header:
> > + *=C2=A0=C2=A0 include/asm-generic/bitops/generic-non-atomic.h
> > + *=20
> > + * Only functions that can be reused in Xen were left; others were
> > removed.
> > + *=20
> > + * Also, the following changes were done:
> > + *=C2=A0 - it was updated the message inside #ifndef ... #endif.
> > + *=C2=A0 - __always_inline -> always_inline to be align with definitio=
n
> > in
> > + *=C2=A0=C2=A0=C2=A0 xen/compiler.h.
> > + *=C2=A0 - update function prototypes from
> > + *=C2=A0=C2=A0=C2=A0 generic___test_and_*(unsigned long nr nr, volatil=
e unsigned
> > long *addr) to
> > + *=C2=A0=C2=A0=C2=A0 generic___test_and_*(unsigned long nr, volatile v=
oid *addr)
> > to be
>=20
> What's the point of having a whopping 3 successive inner underscores?
> Which btw ...
>=20
> > + *=C2=A0=C2=A0=C2=A0 consistent with other related macros/defines.
> > + *=C2=A0 - convert identations from tabs to spaces.
> > + *=C2=A0 - inside generic__test_and_* use 'bitops_uint_t' instead of
> > 'unsigned long'
> > + *=C2=A0=C2=A0=C2=A0 to be generic.
>=20
> ... shrink to just 2 here.
>=20
> Oh, and there's no generic__test_bit(), but just test_bit() in a
> separate
> header.
I just wanted to show that it is a generic version of __test_and_*
operations. If there is no sense in that, I am okay to update function
names.

~ Oleksii
>=20
> > + */
> > +
> > +#ifndef __ASM_GENERIC_BITOPS_GENERIC_NON_ATOMIC_H
> > +#define __ASM_GENERIC_BITOPS_GENERIC_NON_ATOMIC_H
> > +
> > +#include <xen/compiler.h>
> > +
> > +#include <asm-generic/bitops/bitops-bits.h>
> > +
> > +#ifndef XEN_BITOPS_H
> > +#error only <xen/bitops.h> can be included directly
> > +#endif
> > +
> > +/*
> > + * Generic definitions for bit operations, should not be used in
> > regular code
> > + * directly.
> > + */
> > +
> > +/**
> > + * generic___test_and_set_bit - Set a bit and return its old value
> > + * @nr: Bit to set
> > + * @addr: Address to count from
> > + *
> > + * This operation is non-atomic and can be reordered.
> > + * If two examples of this operation race, one can appear to
> > succeed
> > + * but actually fail.=C2=A0 You must protect multiple accesses with a
> > lock.
> > + */
> > +static always_inline bool
> > +generic___test_and_set_bit(unsigned long nr, volatile void *addr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 bitops_uint_t mask =3D BITOP_MASK(nr);
> > +=C2=A0=C2=A0=C2=A0 bitops_uint_t *p =3D ((bitops_uint_t *)addr) + BITO=
P_WORD(nr);
>=20
> If you cast away the volatile here, what's the point of having it in
> the parameter declaration? Also such a cast doesn't need an outer
> pair of parentheses.
>=20
> > +=C2=A0=C2=A0=C2=A0 bitops_uint_t old =3D *p;
> > +
> > +=C2=A0=C2=A0=C2=A0 *p =3D old | mask;
> > +=C2=A0=C2=A0=C2=A0 return (old & mask) !=3D 0;
>=20
> Minor: The function returning bool, the "!=3D 0" (and then also the
> parentheses) could be omitted.
>=20
> > --- /dev/null
> > +++ b/xen/include/asm-generic/bitops/test-bit.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_GENERIC_BITOPS_TESTBIT_H_
> > +#define _ASM_GENERIC_BITOPS_TESTBIT_H_
> > +
> > +#include <asm-generic/bitops/bitops-bits.h>
> > +
> > +/**
> > + * test_bit - Determine whether a bit is set
> > + * @nr: bit number to test
> > + * @addr: Address to start counting from
> > + */
> > +static inline int test_bit(int nr, const volatile void *addr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 const volatile bitops_uint_t *p =3D addr;
> > +=C2=A0=C2=A0=C2=A0 return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_=
PER_WORD -
> > 1)));
> > +}
>=20
> Interestingly you don't lose the volatile here. Overall the way this
> is written would likely benefit the other functions too. There's no
> cast needed here and thus also not there.
>=20
> Jan


