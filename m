Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9371D9390D2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 16:41:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762068.1172169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuDY-0002Jr-C2; Mon, 22 Jul 2024 14:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762068.1172169; Mon, 22 Jul 2024 14:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuDY-0002HK-94; Mon, 22 Jul 2024 14:40:48 +0000
Received: by outflank-mailman (input) for mailman id 762068;
 Mon, 22 Jul 2024 14:40:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=urmM=OW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sVuDW-0002HD-NN
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 14:40:46 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 607da9ef-4838-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 16:40:44 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2eecd2c6432so64690011fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 07:40:44 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52f02846610sm537063e87.5.2024.07.22.07.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 07:40:43 -0700 (PDT)
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
X-Inumbo-ID: 607da9ef-4838-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721659244; x=1722264044; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gB66ADtljKgNpE2wmGo0t+zBgsABbouGKxWN0DXsYk4=;
        b=F2bycYTpf/jyxW3xQDAwD6f/r4+jCQ4KxHZDDZUeBDQIJWxjq4MBQyckhDP8dWLayR
         +JDPUuLk9mo7r5tyRakmP2gFiBSIHGtchMBAvxdvufN3+cV2GO1Pr0gjitWQ/n3KnhGq
         Wpe76Ko+mPSot1Yt9JW6nkyWzdmGTptt3lML/pgXc/JumSL2Lp5FwvpXWcjCFFw/s8W9
         1TFwdJSXN0mx3Q6VSP2Jy1XQT4TUe61nwDNqQ4dOysiBO+IYyQUpvsyLKOtx/i+SG1Pi
         cEXOorA/s6m4B+2QIPA5ZegCKHsT32GUr/Pk7P1YwZSeS9t0vSzWnqk1Mi2l6KCWvdf1
         r7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721659244; x=1722264044;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gB66ADtljKgNpE2wmGo0t+zBgsABbouGKxWN0DXsYk4=;
        b=sfzr760m/UtHcXfEJ4Jb0ZsU87qIb9dDAt++sOzDSYTywobQaRUkkDZSa0iyofBip5
         T2CZY9EvMskFYysoV2Apo/lifIDBmSaNshiLXzBb75xwe26ulXGc7O3Htnsz5vzPJWcp
         89gcreM747Et+ppPjTjtkYj/KoAvuwahW+fMGBaCgSTfMz312aUI/0MM6fYiMp47kC/8
         0v9v4ThAxgQ+Sbw21KXrXsEX+f6C7HQ6XbxdAJxwLPw3Afp47Fe1WbkOEnMdcEeWJSLf
         wJHCXWOxNEj/NWSmSgXE8PxWjmo1YHlAF36RdUPv+yal4ICGGdgpLQCBwLIvbD1c1h52
         s75Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0hcuOWvg3OifbE7TW3uOAo57XV2V/eVNFai84cFKlW7Y7joJLX9fS+tjEhaqJuFaV7MphmB8u+7U/NPJ7V0SWxx5oSAe5Bb/xefMLD3o=
X-Gm-Message-State: AOJu0Yw84RG6J+hQKHnDxAIwYzCsie+gHIn3ekf2ffA5nYqpV0IN4ZNX
	DRfENmYowe8WEte12AivtR4x7ef90+LQJp+XAETo+gBaOHdZCiAHjyELSnuW
X-Google-Smtp-Source: AGHT+IHxM+qxemdRhrbxmICLNxnYv3dGmDyyv/NAqhE0NAHSx9y4ipoiA4adpoicZmD+yI2UZ0EGCQ==
X-Received: by 2002:a05:6512:3ba6:b0:52e:9f1b:517 with SMTP id 2adb3069b0e04-52efb63ea6fmr6219626e87.25.1721659243992;
        Mon, 22 Jul 2024 07:40:43 -0700 (PDT)
Message-ID: <009bff8b38a4415acb2f107fc518bb165b3ea6ec.camel@gmail.com>
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Date: Mon, 22 Jul 2024 16:40:43 +0200
In-Reply-To: <15375179-1c94-43c3-a256-42a856905e21@xen.org>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
	 <15375179-1c94-43c3-a256-42a856905e21@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

Hi Julien,

On Sun, 2024-07-21 at 09:51 +0100, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 12/07/2024 17:22, Oleksii Kurochko wrote:
> > Introduces arch_pmap_{un}map functions and select HAS_PMAP
> > for CONFIG_RISCV.
> >=20
> > Additionaly it was necessary to introduce functions:
> > =C2=A0 - mfn_to_xen_entry
> > =C2=A0 - mfn_to_pte
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V2:
> > =C2=A0 - newly introduced patch
> > ---
> > =C2=A0 xen/arch/riscv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 xen/arch/riscv/include/asm/page.h |=C2=A0 2 ++
> > =C2=A0 xen/arch/riscv/include/asm/pmap.h | 28
> > ++++++++++++++++++++++++++++
> > =C2=A0 xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++++++++++++++
> > =C2=A0 4 files changed, 45 insertions(+)
> > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/pmap.h
> >=20
> > diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
> > index 259eea8d3b..0112aa8778 100644
> > --- a/xen/arch/riscv/Kconfig
> > +++ b/xen/arch/riscv/Kconfig
> > @@ -3,6 +3,7 @@ config RISCV
> > =C2=A0=C2=A0	select FUNCTION_ALIGNMENT_16B
> > =C2=A0=C2=A0	select GENERIC_BUG_FRAME
> > =C2=A0=C2=A0	select HAS_DEVICE_TREE
> > +	select HAS_PMAP
> > =C2=A0=20
> > =C2=A0 config RISCV_64
> > =C2=A0=C2=A0	def_bool y
> > diff --git a/xen/arch/riscv/include/asm/page.h
> > b/xen/arch/riscv/include/asm/page.h
> > index cbbf3656d1..339074d502 100644
> > --- a/xen/arch/riscv/include/asm/page.h
> > +++ b/xen/arch/riscv/include/asm/page.h
> > @@ -51,6 +51,8 @@ typedef struct {
> > =C2=A0 #endif
> > =C2=A0 } pte_t;
> > =C2=A0=20
> > +pte_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
> > +
> > =C2=A0 static inline pte_t paddr_to_pte(paddr_t paddr,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int p=
ermissions)
> > =C2=A0 {
> > diff --git a/xen/arch/riscv/include/asm/pmap.h
> > b/xen/arch/riscv/include/asm/pmap.h
> > new file mode 100644
> > index 0000000000..eb4c48515c
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/pmap.h
> > @@ -0,0 +1,28 @@
> > +#ifndef __ASM_PMAP_H__
> > +#define __ASM_PMAP_H__
> > +
> > +#include <xen/bug.h>
> > +#include <xen/mm.h>
> > +
> > +#include <asm/fixmap.h>
> > +
> > +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
> > +{
> > +=C2=A0=C2=A0=C2=A0 pte_t *entry =3D &xen_fixmap[slot];
> > +=C2=A0=C2=A0=C2=A0 pte_t pte;
> > +
> > +=C2=A0=C2=A0=C2=A0 ASSERT(!pte_is_valid(*entry));
> > +
> > +=C2=A0=C2=A0=C2=A0 pte =3D mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
> > +=C2=A0=C2=A0=C2=A0 pte.pte |=3D PTE_LEAF_DEFAULT;
> > +=C2=A0=C2=A0=C2=A0 write_pte(entry, pte);
> > +}
> > +
> > +static inline void arch_pmap_unmap(unsigned int slot)
> > +{
> > +=C2=A0=C2=A0=C2=A0 pte_t pte =3D {};
> > +
> > +=C2=A0=C2=A0=C2=A0 write_pte(&xen_fixmap[slot], pte);
> > +}
> > +
> > +#endif /* __ASM_PMAP_H__ */
> > diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> > index d69a174b5d..445319af08 100644
> > --- a/xen/arch/riscv/mm.c
> > +++ b/xen/arch/riscv/mm.c
> > @@ -370,3 +370,17 @@ int map_pages_to_xen(unsigned long virt,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
> > =C2=A0 }
> > +
> > +static inline pte_t mfn_to_pte(mfn_t mfn)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned long pte =3D mfn_x(mfn) << PTE_PPN_SHIFT;
> > +=C2=A0=C2=A0=C2=A0 return (pte_t){ .pte =3D pte};
> > +}
> > +
> > +inline pte_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* there is no attr field in RISC-V's pte */
> > +=C2=A0=C2=A0=C2=A0 (void) attr;
>=20
> Surely you have a way to say indicate whether an entry is
> readable/writable?
Sure, there is a way. But probably I misinterpreted attr for Arm and
decided not to use them here. By that I mean, that Arm has MT_NORMAL,
MT_DEVICE which RISC-V doesn't have.

If it is about readable/writable then for sure, I will start to use
attr.

~ Oleksii

>=20
> > +
> > +=C2=A0=C2=A0=C2=A0 return mfn_to_pte(mfn);
> > +}
>=20
> Cheers,
>=20


