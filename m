Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D61FC885721
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 11:07:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696293.1087107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFKc-0002om-8R; Thu, 21 Mar 2024 10:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696293.1087107; Thu, 21 Mar 2024 10:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFKc-0002mr-5b; Thu, 21 Mar 2024 10:07:30 +0000
Received: by outflank-mailman (input) for mailman id 696293;
 Thu, 21 Mar 2024 10:07:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GvWl=K3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rnFKa-0002ml-RI
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 10:07:28 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd738781-e76a-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 11:07:19 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a4715991c32so35394766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 03:07:19 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a1709067f1400b00a468bcde79bsm7048602ejr.109.2024.03.21.03.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 03:07:18 -0700 (PDT)
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
X-Inumbo-ID: cd738781-e76a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711015639; x=1711620439; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wds2+Ebidzro+sd+zz3DnIo232uII0R6cu41IMTPTog=;
        b=mPHYhWdx7MGyzHNsPYI4ixkPy6PcF452nNmZGerx+ABuzM394ai2KzCQT9mkGaKSix
         UjyDzA4V3+nawWzl1zaaX/vzjKi+sFSSeFa5p21n/OyEi3/JdCv+kqqwOJCQM3e0YSJa
         SA/jqjTwO0I4SLR5CwfECCV/Ie0VR5P9eOPFOHzk3BaNY91FKwcSKyNUYac7xonJ/26R
         aNpIfW4OKRLxZxDABkPgouyezgKp0NvIko22Mr+G9gjGZRuzpL1Uh3v7hQMNj889Aget
         I2CZlKghD/4UY2NoVuZrYLPu0iZLQNzwGzVuUih/bLcZJT7qwO/uwnOaI5fe3S2eZ3d7
         BPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711015639; x=1711620439;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wds2+Ebidzro+sd+zz3DnIo232uII0R6cu41IMTPTog=;
        b=Lc/WN5+jr+zuHc/hqdVtGPlONi3c4g3bij01vvqn3pgJgrY2gkMHIuToAnr35Pqo/7
         zObLomzZrFBFRm3HDUJb8CtNDw0kzeLxzqDSw4f32vXastZHVrkpHLeato5ux7ZAAXl3
         SkaeeQ52io9ZUFXZmBB//YOg6UXnoWmOf5+3y3gOJOBPU//XrXKG2/lY39DyYdVGLK40
         3JHUHZTbiJYq2A+9oZghkOsjZgPFet2OdIOqfajhrgpwl5P4wWZ6SvaTo3qtCLnuP8qn
         /UVNgMbIJ62uQ09DqYQoX26tuMDPPr4gZaM7LHFzs5t7TedfuXm4QUYZ4ywiws0xcDAE
         jfCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnCm+gZ19IA8wIaAf4Kz4gYnSFwE/Gc+YlK9N6/QKHPjhUYFMdNix22E8afyBdE1FLA64J6veBz/J4Pnfcef0wajCEfm+0KZsZ66zcLAQ=
X-Gm-Message-State: AOJu0YwzYQp6EV86E0jCi7mKBdEjtRyifhVdG4gtoS0ekTWYh7tP1Zc9
	jPFaos6kbasluU4WPRGCSL3uwSM9b7h2K9mBQnDZaZBYk6NAMeIn
X-Google-Smtp-Source: AGHT+IGxJnQ0M1c70f8im62XWT/fL5WUxai52HXueCQCinbfTqlApMFT/IdSaHSj787wSS2Srg2ytQ==
X-Received: by 2002:a17:906:c446:b0:a46:5ee1:b9c with SMTP id ck6-20020a170906c44600b00a465ee10b9cmr1049562ejb.63.1711015639063;
        Thu, 21 Mar 2024 03:07:19 -0700 (PDT)
Message-ID: <6f9811f714d9f207409260851f2fef1f62f9cba8.camel@gmail.com>
Subject: Re: [PATCH v6 07/20] xen/riscv: introduce bitops.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 21 Mar 2024 11:07:16 +0100
In-Reply-To: <9724aa80-106d-45ea-bad0-f0f2b83632eb@suse.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <14c91e2ba2aeb6e49f9f7e549232244719fa6959.1710517542.git.oleksii.kurochko@gmail.com>
	 <9724aa80-106d-45ea-bad0-f0f2b83632eb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-03-20 at 17:03 +0100, Jan Beulich wrote:
> On 15.03.2024 19:06, Oleksii Kurochko wrote:
> > Taken from Linux-6.4.0-rc1
> >=20
> > Xen's bitops.h consists of several Linux's headers:
> > * linux/arch/include/asm/bitops.h:
> > =C2=A0 * The following function were removed as they aren't used in Xen=
:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * test_and_set_bit_lock
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * clear_bit_unlock
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * __clear_bit_unlock
> > =C2=A0 * The following functions were renamed in the way how they are
> > =C2=A0=C2=A0=C2=A0 used by common code:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * __test_and_set_bit
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * __test_and_clear_bit
> > =C2=A0 * The declaration and implementation of the following functios
> > =C2=A0=C2=A0=C2=A0 were updated to make Xen build happy:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * clear_bit
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * set_bit
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * __test_and_clear_bit
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * __test_and_set_bit
> > =C2=A0 * linux/include/asm-generic/bitops/generic-non-atomic.h with the
> > =C2=A0=C2=A0=C2=A0 following changes:
> > =C2=A0=C2=A0=C2=A0=C2=A0 * Only functions that can be reused in Xen wer=
e left;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 others were removed.
> > =C2=A0=C2=A0=C2=A0=C2=A0 * it was updated the message inside #ifndef ..=
. #endif.
> > =C2=A0=C2=A0=C2=A0=C2=A0 * __always_inline -> always_inline to be align=
 with definition
> > in
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen/compiler.h.
> > =C2=A0=C2=A0=C2=A0=C2=A0 * update function prototypes from
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 generic___test_and_*(unsigned long=
 nr nr, volatile unsigned
> > long *addr)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 generic___test_and_*(unsigned long=
 nr, volatile void *addr)
> > to be
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 consistent with other related macr=
os/defines.
> > =C2=A0=C2=A0=C2=A0=C2=A0 * convert identations from tabs to spaces.
> > =C2=A0=C2=A0=C2=A0=C2=A0 * inside generic__test_and_* use 'bitops_uint_=
t' instead of
> > 'unsigned long'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to be generic.
>=20
> This last middle level bullet point looks stale here here, with that
> header
> now being introduced in a separate patch.
>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/bitops.h
> > @@ -0,0 +1,144 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/* Copyright (C) 2012 Regents of the University of California */
> > +
> > +#ifndef _ASM_RISCV_BITOPS_H
> > +#define _ASM_RISCV_BITOPS_H
> > +
> > +#include <asm/system.h>
> > +
> > +#define BITOP_BITS_PER_WORD BITS_PER_LONG
> > +
> > +#define BITOP_TYPE
> > +typedef uint64_t bitops_uint_t;
> > +
> > +#include <asm-generic/bitops/bitops-bits.h>
> > +
> > +#define __set_bit(n, p)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_bit(n, p)
> > +#define __clear_bit(n, p)=C2=A0=C2=A0=C2=A0 clear_bit(n, p)
>=20
> If these cam with a TODO, I wouldn't say anything. But without I take
> it
> they're meant to remain that way, at which point I'd like to ask
> about
> the performance aspect: Surely the AMO insns are more expensive than
> whatever more basic insns could be used instead? I'd even go as far
> as
> wondering whether
>=20
> #define __set_bit(n, p)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((void)__test_and_s=
et_bit(n, p))
> #define __clear_bit(n, p)=C2=A0=C2=A0=C2=A0 ((void)__test_and_clear_bit(n=
, p))
>=20
> wouldn't be cheaper (the compiler would recognize the unused result
> and eliminate its calculation, I'm pretty sure).
It was implemented using atomic ops because of Arm:
/*
 * Non-atomic bit manipulation.
 *
 * Implemented using atomics to be interrupt safe. Could alternatively
 * implement with local interrupt masking.
 */
#define __set_bit(n,p)            set_bit(n,p)
#define __clear_bit(n,p)          clear_bit(n,p)

I though that the same comment is true for x86, but after your comment
I checked x86 implementation, I realized that x86 uses non-atomic
operations.

In this case, it seems to me there is a sense to use non-atomic for
RISC-V too.

> > +/* Based on linux/arch/include/asm/bitops.h */
> > +
> > +#if BITS_PER_LONG =3D=3D 64
> > +#define __AMO(op)=C2=A0=C2=A0 "amo" #op ".d"
> > +#elif BITS_PER_LONG =3D=3D 32
> > +#define __AMO(op)=C2=A0=C2=A0 "amo" #op ".w"
>=20
> This isn't in line with bitops_uint_t above. With BITOP_BITS_PER_WORD
> also expanding to BITS_PER_LONG, I think you mean to use unsigned
> long
> there. Or else you could move stuff into the conditional here (or
> really move the conditional here further up).
>=20
> However, if you look at Arm64 and x86 code, you will notice that they
> avoid 64-bit operations here. I'm afraid I can't easily tell whether
> the reason(s) for this have meanwhile disappeared; I fear some of
> that
> is still around.
>=20
> > +#else
> > +#error "Unexpected BITS_PER_LONG"
> > +#endif
> > +
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
> > +=C2=A0=C2=A0=C2=A0 mask =3D BITOP_MASK(nr);=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ (=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
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
> > +#define __op_bit_ord(op, mod, nr, addr, ord)=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ (=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
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
> > +#define __op_bit(op, mod, nr, addr) \
> > +=C2=A0=C2=A0=C2=A0 __op_bit_ord(op, mod, nr, addr, )
>=20
> Why are double underscores left on the non-test_and_ macros? Even
> without name space considerations that looks odd here, when talk
> is of the atomic forms of the operations, which by convention have
> no (double) underscore at their front.
Missed to update after Linux kernel. I'll take that into account.

>=20
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -113,6 +113,8 @@
> > =C2=A0# error "Unsupported RISCV variant"
> > =C2=A0#endif
> > =C2=A0
> > +#define BITS_PER_BYTE 8
> > +
> > =C2=A0#define BYTES_PER_LONG (1 << LONG_BYTEORDER)
> > =C2=A0#define BITS_PER_LONG=C2=A0 (BYTES_PER_LONG << 3)
> > =C2=A0#define POINTER_ALIGN=C2=A0 BYTES_PER_LONG
>=20
> How's this addition related to the change at hand?
It should be a part of cmpxchg.h patch. Thanks.

~ Oleksii
>=20
> Jan


