Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEDA85A741
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 16:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682978.1062263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc5Rz-0004Xl-QT; Mon, 19 Feb 2024 15:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682978.1062263; Mon, 19 Feb 2024 15:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc5Rz-0004Vc-N2; Mon, 19 Feb 2024 15:20:59 +0000
Received: by outflank-mailman (input) for mailman id 682978;
 Mon, 19 Feb 2024 15:20:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pKiv=J4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rc5Ry-0004VQ-Tv
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 15:20:58 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b3c43cf-cf3a-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 16:20:58 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5648d92919dso1117338a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 07:20:57 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a056402195500b0056413012fa8sm2745641edz.62.2024.02.19.07.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 07:20:56 -0800 (PST)
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
X-Inumbo-ID: 7b3c43cf-cf3a-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708356057; x=1708960857; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CCRznYB5/GGkzm3SxrgrZSve2RalzmlGK5ybpDuAZCE=;
        b=JTUfAiipxskLu87nxar9AAvRaLsOOPYsJ/5ryeZMZ6yALD0qOdwwWc4yD6KwRG3JK/
         CgMj0WaMjEfDNsgT5J47TGDksmTh2vbRAOKIqqhKmhGTbdvfb5YHK6b0P/Pw5zSubT5f
         TrqSONjl8oJ0l4SE6cbP+/lXznmKZA0V1whb19MXDEW9+xfjF72o2pdvW0QbL6vfdakV
         +WdUcOusqP5DWK0vxTQcnoP/kvpGHXxzIMnBn7OXuebGrlN6BzF76L4nK2giKmI22wS3
         5R4nww7KZ1ZSkCSsu8iR79L17wUcvj9L/UvzybZQCboe60+HXiK5onvE0AFKiGTHmPYx
         j0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708356057; x=1708960857;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CCRznYB5/GGkzm3SxrgrZSve2RalzmlGK5ybpDuAZCE=;
        b=rPGfYusO2CB1wusJVom4N4M047RiKc1WmIWUgG0eif7EgBnnXPo2EbP9Yfu9SH6ah3
         Q0mVe3C5jHhe46c6AC7cAGn3Jfrl2cLA+L2Dd1/3UBEGYDypAVi//7ATlcdRDqssRdVk
         A84TASpc5SHtrsGUotkH9RHVd5O76XOLjDMNTqgR/d20ugJaCfJ+3cP8ikA+kFrggdac
         P7UJFF7OHQZlkTWMoXc12mlrcBTlH4pKH/YUeEYWaeH3MXdfqW6Wq2z7lex9td8OxReZ
         CLnIZBR8lFZ2UfeejTNHBdfxMjWxCM/tOQD3KtE+PTOXjsU+nNkjAbMWPdMuODFp0L6i
         wweA==
X-Forwarded-Encrypted: i=1; AJvYcCXVvHhYM2AjU5UIW0oV+8ykYB0+YVIXaKty1tf/lZ8Ql2aGXJAjI1dt51bpxk2urzzN1Wi22m7zjHh813pMZBlf3j7vtfmhSB1ac6IbBng=
X-Gm-Message-State: AOJu0Yzczfd2+Of7gY4I6CtYEIgg0/YoWWCJloWjAcvc1RDYmC+82MkW
	7zmXKOt9jyY149xe8M+2oS1ZINJPly4b/k8rPXDMWVc3p2iLaYKe
X-Google-Smtp-Source: AGHT+IEnBxSV1nwoR4bEVd00+EsZoRD3Ifu3dDI4Jx42o3y+bCtbWr7mc8wAut4clxXg17V7cOOWUQ==
X-Received: by 2002:a05:6402:31fb:b0:564:acde:d135 with SMTP id dy27-20020a05640231fb00b00564acded135mr347480edb.29.1708356057249;
        Mon, 19 Feb 2024 07:20:57 -0800 (PST)
Message-ID: <f057507271070bc17e85a7637a9edd4c16b171c5.camel@gmail.com>
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 19 Feb 2024 16:20:55 +0100
In-Reply-To: <73b4654a-cdf2-48dc-b802-a7890c3fe426@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
	 <491937fd-2459-416f-944b-0c63f7c12473@xen.org>
	 <1ebdc064665b396d1978ac188594682f08601dbc.camel@gmail.com>
	 <73b4654a-cdf2-48dc-b802-a7890c3fe426@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-19 at 15:12 +0100, Jan Beulich wrote:
> On 19.02.2024 15:00, Oleksii wrote:
> > On Sun, 2024-02-18 at 19:00 +0000, Julien Grall wrote:
> > > On 05/02/2024 15:32, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> > > > @@ -0,0 +1,237 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +/* Copyright (C) 2014 Regents of the University of California
> > > > */
> > > > +
> > > > +#ifndef _ASM_RISCV_CMPXCHG_H
> > > > +#define _ASM_RISCV_CMPXCHG_H
> > > > +
> > > > +#include <xen/compiler.h>
> > > > +#include <xen/lib.h>
> > > > +
> > > > +#include <asm/fence.h>
> > > > +#include <asm/io.h>
> > > > +#include <asm/system.h>
> > > > +
> > > > +#define ALIGN_DOWN(addr, size)=C2=A0 ((addr) & (~((size) - 1)))
> > > > +
> > > > +#define __amoswap_generic(ptr, new, ret, sfx, release_barrier,
> > > > acquire_barrier) \
> > > > +({ \
> > > > +=C2=A0=C2=A0=C2=A0 asm volatile( \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release_barrier \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " amoswap" sfx " %0, %2=
, %1\n" \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acquire_barrier \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (ret), "+A" (*=
ptr) \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (new) \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory" ); \
> > > > +})
> > > > +
> > > > +#define emulate_xchg_1_2(ptr, new, ret, release_barrier,
> > > > acquire_barrier) \
> > > > +({ \
> > > > +=C2=A0=C2=A0=C2=A0 uint32_t *ptr_32b_aligned =3D (uint32_t
> > > > *)ALIGN_DOWN((unsigned
> > > > long)ptr, 4); \
> > > > +=C2=A0=C2=A0=C2=A0 uint8_t mask_l =3D ((unsigned long)(ptr) & (0x8=
 -
> > > > sizeof(*ptr)))
> > > > * BITS_PER_BYTE; \
> > > > +=C2=A0=C2=A0=C2=A0 uint8_t mask_size =3D sizeof(*ptr) * BITS_PER_B=
YTE; \
> > > > +=C2=A0=C2=A0=C2=A0 uint8_t mask_h =3D mask_l + mask_size - 1; \
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long mask =3D GENMASK(mask_h, mask_l);=
 \
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long new_ =3D (unsigned long)(new) << =
mask_l; \
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long ret_; \
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long rc; \
> > > > +=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 asm volatile( \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release_barrier \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0: lr.d %0, %2\n" \
> > >=20
> > > I was going to ask why this is lr.d rather than lr.w. But I see
> > > Jan=20
> > > already asked. I agree with him that it should probably be a lr.w
> > > and
> > > ...
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 and=C2=A0=
 %1, %0, %z4\n" \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 or=C2=A0=
=C2=A0 %1, %1, %z3\n" \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 sc.d %1, =
%1, %2\n" \
> > >=20
> > > ... respectively sc.w. The same applies for cmpxchg.
> >=20
> > I agree that it would be better, and my initial attempt was to
> > handle
> > 4-byte or 8-byte boundary crossing during 2-byte access:
> >=20
> > 0 1 2 3 4 5 6 7 8
> > X X X 1 1 X X X X
> >=20
> > In this case, if I align address 3 to address 0 and then read 4
> > bytes
> > instead of 8 bytes, I will not process the byte at address 4. This
> > was
> > the reason why I started to read 8 bytes.
> >=20
> > I also acknowledge that there could be an issue in the following
> > case:
> >=20
> > X=C2=A0 4094 4095 4096
> > X=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0 X
> > In this situation, when I read 8 bytes, there could be an issue
> > where
> > the new page (which starts at 4096) will not be mapped. It seems
> > correct in this case to check that variable is within one page and
> > read
> > 4 bytes instead of 8.
> >=20
> > One more thing I am uncertain about is if we change everything to
> > read
> > 4 bytes with 4-byte alignment, what should be done with the first
> > case?
> > Should we panic? (I am not sure if this is an option.)
>=20
> Counter question (raised elsewhere already): What if a 4-byte access
> crosses a word / cache line / page boundary? Ideally exactly the
> same would happen for a 2-byte access crossing a respective boundary.
> (Which you can achieve relatively easily by masking off only address
> bit 1, keeping address bit 0 unaltered.)
But if we align down on a 4-byte boundary and then access 4 bytes, we
can't cross a boundary. I agree that the algorithm is not correct, as
it can ignore some values in certain situations. For example:
0 1 2 3 4 5 6 7 8
X X X 1 1 X X X X
In this case, the value at address 4 won't be updated.

I agree that introducing a new macro to check if a variable crosses a
boundary is necessary or as an option we can check that addr is 2-byte
aligned:

#define CHECK_BOUNDARY_CROSSING(start, end, boundary_size)
ASSERT((start / boundary_size) !=3D (end / boundary_size))

Then, it is necessary to check:

CHECK_BOUNDARY_CROSSING(start, end, 4)
CHECK_BOUNDARY_CROSSING(start, end, PAGE_SIZE)

But why do we need to check the cache line boundary? In the case of the
cache, the question will only be about performance, but it should still
work, shouldn't it?

~ Oleksii


