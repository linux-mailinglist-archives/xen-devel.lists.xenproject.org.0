Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E66191A60D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 14:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750007.1158266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMnok-0006A4-9a; Thu, 27 Jun 2024 12:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750007.1158266; Thu, 27 Jun 2024 12:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMnok-000674-6x; Thu, 27 Jun 2024 12:01:34 +0000
Received: by outflank-mailman (input) for mailman id 750007;
 Thu, 27 Jun 2024 12:01:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1631=N5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMnoj-0005la-H6
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 12:01:33 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fee54b7f-347c-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 14:01:32 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52cdfb69724so6190067e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 05:01:32 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e713054cbsm177978e87.121.2024.06.27.05.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 05:01:31 -0700 (PDT)
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
X-Inumbo-ID: fee54b7f-347c-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719489692; x=1720094492; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9NL1AgT6euU0rpg8fP50h7rSpVzwu7zCQeyofXoqU1o=;
        b=JB1a9ZIPYrHb59Bt5IKr1GgKuEDj1w/OTfB4xcG2KSRx2IvcqqJE62CU0vgTlPW/Jm
         HN3m1/hexY12/rwCSdnhpJIOlmP8HDiup7RzAz7WZsc+fTi69NUAH6PVasyireAO8qfV
         H4k3OWWdoJWQR1cqG8HJtyCd5zQjXDHoKpOmeIjfxCRGCcmL+yx+ewwJtxuIG4tBqle5
         2JMD625NSTkxF04Zqe+Tnh5wbSIfmKpA7Ho1tVqghLZwjTE4YOnlBJy4JnjtuTkwGu3E
         tkYFeDAr7sDwDYch86RJkQl36wbEXW0CVq543uYEJxcqCcrBiD203hp/h87kVgjhYCEd
         RiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489692; x=1720094492;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9NL1AgT6euU0rpg8fP50h7rSpVzwu7zCQeyofXoqU1o=;
        b=XSBL0Qp7T2pMtqazU63bDbbAXciXjh/AkOIrKVF5PcS7Yo5AfrCQ7AoauoJ96oXBeF
         eTPr0M3hIvXHE+Cvh+qWzQXR6Vp+pax6aV41P2x5ZEUf8qPJ32eZjpSV030b5QZlln0F
         d9yFc9ZEosojWahb1SrILRVz6VeEb3iorz+8qjWHAlHivgYlhVSovxqe91qW7D43OlJ5
         t1gNXtCOdOy3DwCHDGQuFu5NVz0Qa50HCLAS5TSsOE1fj4ULZFpyZ6vF2seXdHVyGJMQ
         q8PjDcFVZAYLzJmiFnvnMxK4G51WOm0zmtY1xzRGrIaDwXBYpUaIUZ65tTFKUcoA8Tjn
         1mUg==
X-Forwarded-Encrypted: i=1; AJvYcCV++mO+YpCMpDFZzjGI7HFoNjDEGgxI2+kYRWPdzS6tz3+GmdzeEugnm8JgH+lMkUKxueVciOC1v8f7yIycjwbI6sP/B4LN70zxsPwb5c0=
X-Gm-Message-State: AOJu0YyZB93aGj7/fajSesa+xC95oZHzEHdEDp/DWaikDddT5T8LbbMa
	NfEiaKg4BLIU5JDdoGn29Bi+Ro4yGOzP9WDr/RxuiuQdG/1qOKBG
X-Google-Smtp-Source: AGHT+IH47MAvOM0X5tOCVl1a0CysiYTQ6CODqeZQtR9PJroxlzHcwO58ZtVRfT1EhN0P3ojug+soQQ==
X-Received: by 2002:a19:ee10:0:b0:52c:db06:ee60 with SMTP id 2adb3069b0e04-52ce184395dmr7687661e87.41.1719489691996;
        Thu, 27 Jun 2024 05:01:31 -0700 (PDT)
Message-ID: <7bd44b8615eb545b4956008d02c158d5c85e2345.camel@gmail.com>
Subject: Re: [PATCH v13 02/10] xen/riscv: introduce bitops.h
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 27 Jun 2024 14:01:30 +0200
In-Reply-To: <4c71db0d-60a4-4347-b706-a2e06fc9cd63@suse.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
	 <0e4441eee82b0545e59099e2f62e3a01fa198d08.1719319093.git.oleksii.kurochko@gmail.com>
	 <bb103587-546d-4613-bcb8-df10f5d05388@suse.com>
	 <4c15dd072f08b1161d170608a096dc0851ced588.camel@gmail.com>
	 <e2d82c37-da44-4a8f-a1f8-76d5ff05b104@suse.com>
	 <f4f3a1550b4809a3cb8b27eb5e7248abf27b3944.camel@gmail.com>
	 <4c71db0d-60a4-4347-b706-a2e06fc9cd63@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-06-27 at 12:10 +0200, Jan Beulich wrote:
> On 27.06.2024 11:58, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Thu, 2024-06-27 at 09:59 +0200, Jan Beulich wrote:
> > > On 26.06.2024 19:27, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > On Wed, 2024-06-26 at 10:31 +0200, Jan Beulich wrote:
> > > > > On 25.06.2024 15:51, Oleksii Kurochko wrote:
> > > > > > --- /dev/null
> > > > > > +++ b/xen/arch/riscv/include/asm/bitops.h
> > > > > > @@ -0,0 +1,137 @@
> > > > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > > > +/* Copyright (C) 2012 Regents of the University of
> > > > > > California
> > > > > > */
> > > > > > +
> > > > > > +#ifndef _ASM_RISCV_BITOPS_H
> > > > > > +#define _ASM_RISCV_BITOPS_H
> > > > > > +
> > > > > > +#include <asm/system.h>
> > > > > > +
> > > > > > +#if BITOP_BITS_PER_WORD =3D=3D 64
> > > > > > +#define __AMO(op)=C2=A0=C2=A0 "amo" #op ".d"
> > > > > > +#elif BITOP_BITS_PER_WORD =3D=3D 32
> > > > > > +#define __AMO(op)=C2=A0=C2=A0 "amo" #op ".w"
> > > > > > +#else
> > > > > > +#error "Unexpected BITOP_BITS_PER_WORD"
> > > > > > +#endif
> > > > > > +
> > > > > > +/* Based on linux/arch/include/asm/bitops.h */
> > > > > > +
> > > > > > +/*
> > > > > > + * Non-atomic bit manipulation.
> > > > > > + *
> > > > > > + * Implemented using atomics to be interrupt safe. Could
> > > > > > alternatively
> > > > > > + * implement with local interrupt masking.
> > > > > > + */
> > > > > > +#define __set_bit(n, p)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_bit(=
n, p)
> > > > > > +#define __clear_bit(n, p)=C2=A0=C2=A0=C2=A0 clear_bit(n, p)
> > > > > > +
> > > > > > +#define test_and_op_bit_ord(op, mod, nr, addr, ord)=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > > > > > +({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > +=C2=A0=C2=A0=C2=A0 bitop_uint_t res, mask;=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
> > > > > > +=C2=A0=C2=A0=C2=A0 mask =3D BITOP_MASK(nr);=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
> > > > > > +=C2=A0=C2=A0=C2=A0 asm volatile (=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __AMO(op) #ord " %0=
, %2, %1"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (res), "+A=
" (addr[BITOP_WORD(nr)])=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (mod(mask))=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > +=C2=A0=C2=A0=C2=A0 ((res & mask) !=3D 0);=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > > > > > +})
> > > > > > +
> > > > > > +#define op_bit_ord(op, mod, nr, addr, ord)=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> > > > > > +=C2=A0=C2=A0=C2=A0 asm volatile (=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __AMO(op) #ord " ze=
ro, %1, %0"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+A" (addr[BITOP_=
WORD(nr)])=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (mod(BITOP_MA=
SK(nr)))=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");
> > > > > > +
> > > > > > +#define test_and_op_bit(op, mod, nr, addr)=C2=A0=C2=A0=C2=A0 \
> > > > > > +=C2=A0=C2=A0=C2=A0 test_and_op_bit_ord(op, mod, nr, addr, .aqr=
l)
> > > > > > +#define op_bit(op, mod, nr, addr) \
> > > > > > +=C2=A0=C2=A0=C2=A0 op_bit_ord(op, mod, nr, addr, )
> > > > > > +
> > > > > > +/* Bitmask modifiers */
> > > > > > +#define NOP(x)=C2=A0=C2=A0=C2=A0 (x)
> > > > > > +#define NOT(x)=C2=A0=C2=A0=C2=A0 (~(x))
> > > > >=20
> > > > > Since elsewhere you said we would use Zbb in bitops, I wanted
> > > > > to
> > > > > come
> > > > > back
> > > > > on that: Up to here all we use is AMO.
> > > > >=20
> > > > > And further down there's no asm() anymore. What were you
> > > > > referring
> > > > > to?
> > > > RISC-V doesn't have a CLZ instruction in the base
> > > > ISA.=C2=A0 As a consequence, __builtin_ffs() emits a library call t=
o
> > > > ffs()
> > > > on GCC,
> > >=20
> > > Oh, so we'd need to implement that libgcc function, along the
> > > lines
> > > of
> > > Arm32 implementing quite a few of them to support shifts on 64-
> > > bit
> > > quantities as well as division and modulo.
> > Why we can't just live with Zbb extension? Zbb extension is
> > presented
> > on every platform I have in access with hypervisor extension
> > support.
>=20
> I'd be fine that way, but then you don't need to break up ANDN into
> NOT
> and AND. It is my understanding that Andrew has concerns here, even
> if
> - iirc - it was him to originally suggest to build upon that
> extension
> being available. If these concerns are solely about being able to
> build
> with Zbb-unaware tool chains, then what to do about the build issues
> there has already been said.
Not much we can do except probably using .insn, as you suggested for
the "pause" instruction in cpu_relax(), for every instruction ( at the
moment it is only ANDB but who knows which instruction will be used in
the future ) from the Zbb extension.

But then we will need to do the same for each possible extension we are
going to use, as there is still a small chance that we might encounter
an extension-unaware toolchain.

I am a little bit confused about what we should do.

In my opinion, the best approach at the moment is to use .insn for the
ANDN and PAUSE instructions and add an explanation to
docs/misc/riscv/booting.txt or create a separate document where such
issues are documented (I am not sure that README is the correct place
for this).

I am also okay to go with ANDN break up int NOT and AND, but it is
needed to come up  with concept which instruction/extenstion should be
used and how consistently to deal with such situations.

Furthermore, I don't think these changes should block the merging (
doesn't matter in 4.19 or in 4.20 Xen release ) of PATCHes v13 01-07 of
this patch series.

~ Oleksii


