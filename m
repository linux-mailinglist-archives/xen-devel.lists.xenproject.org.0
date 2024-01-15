Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1A882D779
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 11:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667279.1038382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPKJv-0001db-VX; Mon, 15 Jan 2024 10:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667279.1038382; Mon, 15 Jan 2024 10:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPKJv-0001an-SX; Mon, 15 Jan 2024 10:35:55 +0000
Received: by outflank-mailman (input) for mailman id 667279;
 Mon, 15 Jan 2024 10:35:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TGva=IZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rPKJu-0001ah-IR
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 10:35:54 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbd45e8b-b391-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 11:35:53 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a28bd9ca247so1009236366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 02:35:53 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a170906128600b00a2b0b0fc80esm5086339ejb.193.2024.01.15.02.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 02:35:52 -0800 (PST)
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
X-Inumbo-ID: dbd45e8b-b391-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705314953; x=1705919753; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s5EVfj78CbwqEJXL5WmbHLeYABJtKUe4T6SHcgmLoNE=;
        b=Ddwz1MYWBx/z0b7EeOdZUYrAne2x38/wJ9+xXkmwGZuvf/FGDfeQSD700+FJGDXzIt
         2jFxS1po49cma+r0fDND92Yo+lP3uBmsH2NKwJBrotx9SvF6fX+eyqBYJyc+XQxzaApW
         rJXbTjdWVgRz+0ZstGzsRcne7SEhrH+mxfpbF16quVf/fREA/nDSh50VHDgmhKgVd9uU
         f9sazj4n5PQtWvXY/wuk+ryMRjcd7D/ylzP0f5otgQp1fQV/aS+WjfwL0AZfkMYgUSol
         TTmr7KAZSNvIx8gTYQA9QjBZT5Ql04fyH8/xEfsdRS1Z8Vpl4hSOimJOLu7WC4xVbpFI
         2Qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705314953; x=1705919753;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5EVfj78CbwqEJXL5WmbHLeYABJtKUe4T6SHcgmLoNE=;
        b=ZdtozxVr2i1N6QGI9zdyjq3hHPXW80pA1lsY7O84JTr4PRKR3w5xskvs9pQpicDy8N
         dO5LFg4438o4/7GYeCay6BUxIpPgU1B+AUnayB5J+YJJopo7DXOCyyEJ6TvJAwAc1OZX
         GdcPWbqK+g0XLHZy7f/eVefH2v64tejNY4YnpFklqPildFfeaVthNW3RQclAjOc1Zfve
         zgIV/0sSBijxXOaGOPdVQQ4IZzfbGlzesOKlaFcmYZPdWMWFtew53rjpXgGuTqx9MV76
         XP/R7urwoNsa8pIjdL2LRw3FwdaWS2INS0cIX16DdC7qA0Abz94/nGLZAB3qoOwUMnvn
         Yh1w==
X-Gm-Message-State: AOJu0YxIO6er5NliY8vWFhsBSXXFFKLe1M1IajUUqrFtiBUBnISZih83
	GBCfNjcpDRDVg/Z+tzSPhmI=
X-Google-Smtp-Source: AGHT+IGoUZ9g/N8grHffXSmjeMotL3I0N/6R+fIgT0hqm94Zs99A8UAFVjMc3O+5mCVyE6iB7aKong==
X-Received: by 2002:a17:907:7d8e:b0:a29:8155:b813 with SMTP id oz14-20020a1709077d8e00b00a298155b813mr2891707ejc.85.1705314952819;
        Mon, 15 Jan 2024 02:35:52 -0800 (PST)
Message-ID: <abef4701c3f2292e672679f1a18c826d699e1af2.camel@gmail.com>
Subject: Re: [PATCH v3 21/34] xen/riscv: introduce p2m.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, Alistair Francis
	 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
	Davis <connojdavis@gmail.com>
Date: Mon, 15 Jan 2024 12:35:51 +0200
In-Reply-To: <abeafa19-7867-46b2-bc0e-b39eaa0f5036@xen.org>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <c3b1f24aea1ba01505697717b240c8d036abfee1.1703255175.git.oleksii.kurochko@gmail.com>
	 <abeafa19-7867-46b2-bc0e-b39eaa0f5036@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hi Julien,

On Fri, 2024-01-12 at 10:39 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 22/12/2023 15:13, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V3:
> > =C2=A0 - add SPDX
> > =C2=A0 - drop unneeded for now p2m types.
> > =C2=A0 - return false in all functions implemented with BUG() inside.
> > =C2=A0 - update the commit message
> > ---
> > Changes in V2:
> > =C2=A0 - Nothing changed. Only rebase.
> > ---
> > =C2=A0 xen/arch/ppc/include/asm/p2m.h=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0 xen/arch/riscv/include/asm/p2m.h | 102
> > +++++++++++++++++++++++++++++++
> > =C2=A0 2 files changed, 103 insertions(+), 2 deletions(-)
> > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/p2m.h
> >=20
> > diff --git a/xen/arch/ppc/include/asm/p2m.h
> > b/xen/arch/ppc/include/asm/p2m.h
> > index 25ba054668..3bc05b7c05 100644
> > --- a/xen/arch/ppc/include/asm/p2m.h
> > +++ b/xen/arch/ppc/include/asm/p2m.h
> > @@ -50,8 +50,7 @@ static inline void memory_type_changed(struct
> > domain *d)
> > =C2=A0 static inline int guest_physmap_mark_populate_on_demand(struct
> > domain *d, unsigned long gfn,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned
> > int order)
> > =C2=A0 {
> > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > -=C2=A0=C2=A0=C2=A0 return 1;
> > +=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static inline int guest_physmap_add_entry(struct domain *d,
> > diff --git a/xen/arch/riscv/include/asm/p2m.h
> > b/xen/arch/riscv/include/asm/p2m.h
> > new file mode 100644
> > index 0000000000..d270ef6635
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/p2m.h
> > @@ -0,0 +1,102 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_RISCV_P2M_H__
> > +#define __ASM_RISCV_P2M_H__
> > +
> > +#include <asm/page-bits.h>
> > +
> > +#define paddr_bits PADDR_BITS
> > +
> > +/*
> > + * List of possible type for each page in the p2m entry.
> > + * The number of available bit per page in the pte for this
> > purpose is 4 bits.
> > + * So it's possible to only have 16 fields. If we run out of value
> > in the
> > + * future, it's possible to use higher value for pseudo-type and
> > don't store
> > + * them in the p2m entry.
> > + */
>=20
> This looks like a verbatim copy from Arm. Did you actually check
> RISC-V=20
> has 4 bits available in the PTE to store this value?
Thanks for noticing that, in RISC-V it is available only 2 bits ( bits
8 and 9), so I'll update the comment:
53                   10 9    8 7 6 5 4 3 2 1 0
 Physical Page Number     RSV  D A G U X W R V

It seems that I missed something in the Arm code/architecture.As far as I r=
ecall, in Arm, bits 5-8 are ignored by the MMU, and they
are expected
to be used by the hypervisor for its purpose.
However, in the code, I notice that these bits are utilized for storing
a reference counter.

Could you confirm if my understanding is correct?
Additionally, I am curious about where the PTE bits are used to store
one of the values of the enum `p2m_type_t`.

>=20
> > +typedef enum {
> > +=C2=A0=C2=A0=C2=A0 p2m_invalid =3D 0,=C2=A0=C2=A0=C2=A0 /* Nothing map=
ped here */
> > +=C2=A0=C2=A0=C2=A0 p2m_ram_rw,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /* Normal read/write guest RAM */
>=20
> s/guest/domain/ as this also applies for dom0.
Thanks. I'll update that.
>=20
> > +} p2m_type_t;
> > +
> > +#include <xen/p2m-common.h>
> > +
> > +static inline int get_page_and_type(struct page_info *page,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct d=
omain *domain,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned=
 long type)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
>=20
> I understand your goal with the BUG() but I find it risky. This is
> not a=20
> problem right now, it is more when we will decide to have RISC-V=20
> supported. You will have to go through all the BUG() to figure out
> which=20
> one are warrant or not.
>=20
> To reduce the load, I would recommend to switch to
> ASSERT_UNREACHABLE()=20
> (or maybe introduced a different macro) that would lead to a crash on
> debug build but propagate the error normally on production build.
>=20
> Of course, if you can't propagate an error, then the right course of=20
> action is a BUG(). But I expect this case to be limited.
Thanks.

I'm currently transitioning to using ASSERT_UNREACHABLE() or BUG_ON()
throughout the codebase, and this is one of the instances where I
overlooked the update.

>=20
> [...]
>=20
> > +static inline mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +=C2=A0=C2=A0=C2=A0 return _mfn(0);
>=20
> This wants to be INVALID_MFN.
>=20
> [...]
>=20

~ Oleksii

