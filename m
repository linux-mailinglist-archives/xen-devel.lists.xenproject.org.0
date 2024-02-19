Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE48185A53C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 15:01:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682874.1062093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4CT-0007OQ-4Y; Mon, 19 Feb 2024 14:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682874.1062093; Mon, 19 Feb 2024 14:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4CT-0007MJ-1S; Mon, 19 Feb 2024 14:00:53 +0000
Received: by outflank-mailman (input) for mailman id 682874;
 Mon, 19 Feb 2024 14:00:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pKiv=J4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rc4CR-0007MB-A4
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 14:00:51 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49bf3146-cf2f-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 15:00:50 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d241ff062cso7077171fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 06:00:50 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a2eb057000000b002d11e348f47sm1124113ljl.87.2024.02.19.06.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 06:00:49 -0800 (PST)
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
X-Inumbo-ID: 49bf3146-cf2f-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708351250; x=1708956050; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+HwvhZTDNvFwpG7SdNBRsmvr9FEYGM1sjbzBZRGaZQU=;
        b=J1fjqjCunzACF1t4kZd0v/elvo6wNWBMvF5+82/oQX4StrD2pbzlLiZ63AlwH/CDFn
         2dSDKl5/5GcmzMW7wzqQGE3Hk6rw0hhjn4WjY8qz/iHL1YIVZ37ILIDFHdq82fFXBjdt
         FYoQ/w++5DoMwShrVRqG9Xw3qi2IqMF6CoSEez3wOXTIL/twOPjB/zUANYK0+98Xihx/
         SNeyreOFFbnamTJ429BsjNIm6Yr00OfKnJyCkoUAMIbEtqE3R+nAUeYF0ZAxZ06FGAdy
         nFQNNMgm3BQVAdy5Y85pBQFd68LfR5ue8zVp+tjvqh5tjMuqdED0DY0vDfZjQ7owkwoi
         tZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708351250; x=1708956050;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+HwvhZTDNvFwpG7SdNBRsmvr9FEYGM1sjbzBZRGaZQU=;
        b=pOFjNxkB6kVHxmgMYUnpWo+tRFp7eQquAfrQT+RwdfpadZb3bzCF6ohHINph3G9vAy
         qkQmamweTFc0faSNp+ScBuyenqlhXb8lXRqdvAfMgEyS6nNHHdrXW33KjolBpw8AkIbr
         QB5xh3zPCdsldwFXzx2KhWK5DS/5oHvyq+WRq/SajnVVclhahjuwTYvP56Qk27S0EmcZ
         Zs//tb1gmPTcy1oz0k6u4OqlGp3I81483WdtgPSwYjkHixaAAAdC9nyPumtex10jeTml
         O2bGThgCim9vKJ9rmY/NfrIY2HCpxUGQGuUKtu6oAYj5ER0AUBnsDXwQIFV2zB3VB5CG
         dn9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVx5E/lsXKS9VQ4c1igb4PY8UMVP0oXsZLOKC+fQdol+PLMkKRC7USOzZwyy9ZW0CgvMMTqupZx7/96upv79/fZuRRTuQs1KBMTX66Y7XA=
X-Gm-Message-State: AOJu0YzBdxpNdtZCaPP4PMCNHQmkjrzM4Th8o0OANoTjCVkutVky+Y33
	PqlW+IEHOpo7NuZqqBWKn2cANLfjvc4spu8NracE6UWxjuJxfjRU
X-Google-Smtp-Source: AGHT+IE3i0oJEA3C53RGkjiIqx3+FL1UAnstwariwJFi9eZrE7fUy2cSVxzwkTHR4nDkTE0LO+BqRA==
X-Received: by 2002:a2e:a454:0:b0:2d2:3c9c:f798 with SMTP id v20-20020a2ea454000000b002d23c9cf798mr1166765ljn.37.1708351249521;
        Mon, 19 Feb 2024 06:00:49 -0800 (PST)
Message-ID: <1ebdc064665b396d1978ac188594682f08601dbc.camel@gmail.com>
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, Jan
 Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Date: Mon, 19 Feb 2024 15:00:48 +0100
In-Reply-To: <491937fd-2459-416f-944b-0c63f7c12473@xen.org>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
	 <491937fd-2459-416f-944b-0c63f7c12473@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Sun, 2024-02-18 at 19:00 +0000, Julien Grall wrote:
>=20
>=20
> On 05/02/2024 15:32, Oleksii Kurochko wrote:
> > The header was taken from Linux kernl 6.4.0-rc1.
> >=20
> > Addionally, were updated:
> > * add emulation of {cmp}xchg for 1/2 byte types
>=20
> This explaination is a little bit light. IIUC, you are implementing
> them=20
> using 32-bit atomic access. Is that correct? If so, please spell it
> out.
Sure, I'll update commit message.

>=20
> Also, I wonder whether it would be better to try to get rid of the
> 1/2=20
> bytes access. Do you know where they are used?
Right now, the issue is with test_and_clear_bool() which is used in
common/sched/core.c:840
[https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/sched/core.c?=
ref_type=3Dheads#L840
]

I don't remember details, but in xen-devel chat someone told me that
grant table requires 1/2 bytes access.

>=20
> > * replace tabs with spaces
> Does this mean you are not planning to backport any Linux fixes?
If it will be any fixes for sure I'll back port them, but it looks like
this code is stable enough and not to many fixes will be done there, so
it shouldn't be hard to backport them and switch to spaces.

>=20
> > * replace __* varialbed with *__
>=20
> s/varialbed/variable/
>=20
> > * introduce generic version of xchg_* and cmpxchg_*.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V4:
> > =C2=A0 - Code style fixes.
> > =C2=A0 - enforce in __xchg_*() has the same type for new and *ptr, also
> > "\n"
> > =C2=A0=C2=A0=C2=A0 was removed at the end of asm instruction.
> > =C2=A0 - dependency from
> > https://lore.kernel.org/xen-devel/cover.1706259490.git.federico.serafin=
i@bugseng.com/
> > =C2=A0 - switch from ASSERT_UNREACHABLE to STATIC_ASSERT_UNREACHABLE().
> > =C2=A0 - drop xchg32(ptr, x) and xchg64(ptr, x) as they aren't used.
> > =C2=A0 - drop cmpxcg{32,64}_{local} as they aren't used.
> > =C2=A0 - introduce generic version of xchg_* and cmpxchg_*.
> > =C2=A0 - update the commit message.
> > ---
> > Changes in V3:
> > =C2=A0 - update the commit message
> > =C2=A0 - add emulation of {cmp}xchg_... for 1 and 2 bytes types
> > ---
> > Changes in V2:
> > =C2=A0 - update the comment at the top of the header.
> > =C2=A0 - change xen/lib.h to xen/bug.h.
> > =C2=A0 - sort inclusion of headers properly.
> > ---
> > =C2=A0 xen/arch/riscv/include/asm/cmpxchg.h | 237
> > +++++++++++++++++++++++++++
> > =C2=A0 1 file changed, 237 insertions(+)
> > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h
> >=20
> > diff --git a/xen/arch/riscv/include/asm/cmpxchg.h
> > b/xen/arch/riscv/include/asm/cmpxchg.h
> > new file mode 100644
> > index 0000000000..b751a50cbf
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> > @@ -0,0 +1,237 @@
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
> > +#define ALIGN_DOWN(addr, size)=C2=A0 ((addr) & (~((size) - 1)))
> > +
> > +#define __amoswap_generic(ptr, new, ret, sfx, release_barrier,
> > acquire_barrier) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 asm volatile( \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release_barrier \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " amoswap" sfx " %0, %2, %1=
\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acquire_barrier \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (ret), "+A" (*ptr)=
 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (new) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory" ); \
> > +})
> > +
> > +#define emulate_xchg_1_2(ptr, new, ret, release_barrier,
> > acquire_barrier) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 uint32_t *ptr_32b_aligned =3D (uint32_t *)ALIGN_DOW=
N((unsigned
> > long)ptr, 4); \
> > +=C2=A0=C2=A0=C2=A0 uint8_t mask_l =3D ((unsigned long)(ptr) & (0x8 - s=
izeof(*ptr)))
> > * BITS_PER_BYTE; \
> > +=C2=A0=C2=A0=C2=A0 uint8_t mask_size =3D sizeof(*ptr) * BITS_PER_BYTE;=
 \
> > +=C2=A0=C2=A0=C2=A0 uint8_t mask_h =3D mask_l + mask_size - 1; \
> > +=C2=A0=C2=A0=C2=A0 unsigned long mask =3D GENMASK(mask_h, mask_l); \
> > +=C2=A0=C2=A0=C2=A0 unsigned long new_ =3D (unsigned long)(new) << mask=
_l; \
> > +=C2=A0=C2=A0=C2=A0 unsigned long ret_; \
> > +=C2=A0=C2=A0=C2=A0 unsigned long rc; \
> > +=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 asm volatile( \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release_barrier \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0: lr.d %0, %2\n" \
>=20
> I was going to ask why this is lr.d rather than lr.w. But I see Jan=20
> already asked. I agree with him that it should probably be a lr.w and
> ...
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 and=C2=A0 %1,=
 %0, %z4\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 or=C2=A0=C2=
=A0 %1, %1, %z3\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 sc.d %1, %1, =
%2\n" \
>=20
> ... respectively sc.w. The same applies for cmpxchg.

I agree that it would be better, and my initial attempt was to handle
4-byte or 8-byte boundary crossing during 2-byte access:

0 1 2 3 4 5 6 7 8
X X X 1 1 X X X X

In this case, if I align address 3 to address 0 and then read 4 bytes
instead of 8 bytes, I will not process the byte at address 4. This was
the reason why I started to read 8 bytes.

I also acknowledge that there could be an issue in the following case:

X  4094 4095 4096
X    1   1    X
In this situation, when I read 8 bytes, there could be an issue where
the new page (which starts at 4096) will not be mapped. It seems
correct in this case to check that variable is within one page and read
4 bytes instead of 8.

One more thing I am uncertain about is if we change everything to read
4 bytes with 4-byte alignment, what should be done with the first case?
Should we panic? (I am not sure if this is an option.) Should we
perform the operation twice for addresses 0x0 and 0x4?

~ Oleksii

