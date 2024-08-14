Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9811951CF6
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 16:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777392.1187553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seEsZ-0003D3-QC; Wed, 14 Aug 2024 14:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777392.1187553; Wed, 14 Aug 2024 14:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seEsZ-00039w-Ne; Wed, 14 Aug 2024 14:21:35 +0000
Received: by outflank-mailman (input) for mailman id 777392;
 Wed, 14 Aug 2024 14:21:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0xrl=PN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1seEsX-00039q-QK
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 14:21:33 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 815a4617-5a48-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 16:21:32 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2f040733086so66064891fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 07:21:32 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f292067fa1sm14543551fa.127.2024.08.14.07.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 07:21:31 -0700 (PDT)
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
X-Inumbo-ID: 815a4617-5a48-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723645292; x=1724250092; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7F3XpokfdlFhkd0C1Je0HU0iCTbCSVVLb+E70u1qm0U=;
        b=N/+py8H44wAso/RE7ZEnsnn4zV6zwq2h3ftxv5Ux+cCyLX9Z741lrVoWQHLBCzAVAe
         4K4/LT8UWyvcR204jTf5O91Mgkp5UgUMBzc+X1Ruy7xyoSAfvbMpNmEeJUz0esJPID1c
         AVs2SpN8v+LD/07sy3z+9H+xNQk6lIQSt7SV2M7enjP9jpL8RvppgKQdDLaC5D2CNpRc
         qBoA8DRwZriznHkcNtw+DXV9yLpj3rIS4Rg6thOu4E6XxjC2/TTQE5wVK+oZwt7aXebA
         t+Ce0Njy0fxFxOEHm3BSOt7Vj6X/cggguhKlDg1TPEFHERNclJYhAXcgrRPJuDAQlK6t
         caVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723645292; x=1724250092;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7F3XpokfdlFhkd0C1Je0HU0iCTbCSVVLb+E70u1qm0U=;
        b=JkBXAz71jvaI1cjFSaFIXAOYWfxXAAeBBJPPSvXxYUnj9FFpxxIJkxg6/Z16MunqdF
         J1AGw0InaxgOx457pTp7+72VD4R5Rgb70YcNAkcIBc2ybKIBQgs67qW7WW9dFMwtWx+u
         mntvrt7iUhhoUew2D5yfvXwX5A4rzMuNRALP2m8rriuIBsYAY93ch0hBQMMXsC53arjK
         p0QoaShPpF5R1S13HCI697dZuuS0qY4BOmLrnlDQJXEWj3PNHm2Mdyyky/zTchs/zYXK
         fECWzzccFvrTV46Wh75wYIUV+uJJ4kuAdNq100e3cqZ5APPoYpsmBGqERijkz07okB2G
         V/sg==
X-Forwarded-Encrypted: i=1; AJvYcCVWqccZICxzxf3RTwVEBni5DJRQL3SpyM/suJ+jC+7MUSFpPByEoqnC5ie/AdGudJztQJO4v8fE8Rf6LPA1TN4Ce3v/T4IOvWzaW42B1Bs=
X-Gm-Message-State: AOJu0YzgXEWxkHAp1Tr0sxzhZU9F1OsM9darY2MvDF90Kd/dSogr56CE
	uwmqIWpLL7DH+Kwv17kgBPUU2NHvRz5ALmhksutIeWIx1zZP1RkV
X-Google-Smtp-Source: AGHT+IGa/WVWSzadAk0qahlBAdJV+FYJ8WWibBg0KbY2vHG2Dvfw/hMaOC7t+VCODEBxgLVb3kL1jw==
X-Received: by 2002:a2e:9683:0:b0:2ef:2617:8952 with SMTP id 38308e7fff4ca-2f3aa1c10c3mr20011521fa.18.1723645291633;
        Wed, 14 Aug 2024 07:21:31 -0700 (PDT)
Message-ID: <9361b63712bffc7bb0cb6bb1fc5954ade18314d2.camel@gmail.com>
Subject: Re: [PATCH v4 2/7] xen/riscv: set up fixmap mappings
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 14 Aug 2024 16:21:30 +0200
In-Reply-To: <07f19bb5-bd76-4158-875e-48f74e427a89@suse.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
	 <1c1c0f912a9abbb542baa1ce92e75d64ec8043e9.1723214540.git.oleksii.kurochko@gmail.com>
	 <07f19bb5-bd76-4158-875e-48f74e427a89@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-08-13 at 10:22 +0200, Jan Beulich wrote:
> On 09.08.2024 18:19, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -74,6 +74,14 @@
> > =C2=A0#error "unsupported RV_STAGE1_MODE"
> > =C2=A0#endif
> > =C2=A0
> > +#define XEN_VIRT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 MB(2)
> > +
> > +#define BOOT_FDT_VIRT_START=C2=A0=C2=A0=C2=A0=C2=A0 (XEN_VIRT_START + =
XEN_VIRT_SIZE)
> > +#define BOOT_FDT_VIRT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MB(4)
> > +
> > +#define FIXMAP_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (BOOT_FDT_VIRT_START +
> > BOOT_FDT_VIRT_SIZE)
> > +#define FIXMAP_ADDR(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (FIXMAP_BASE + (n) * PAGE_SIZE)
>=20
> Just to confirm: Did you consider leaving gaps between the regions,
> but
> then discarded that idea for whatever reason? It's not like you're
> tight
> on address space.
No, I would like to leave gaps between the regions. I have a slot gap
where it is possible, inside a slot I decided just not to add this gap
without any specific reason TBH. I can add some gap ( for example,
0x100000 ) if it would be better and consistent.

>=20
> As to FIXMAP_ADDR() - wouldn't that be a better fit in fixmap.h?
Sure, it would more correct place for this macros.

>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/fixmap.h
> > @@ -0,0 +1,44 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * fixmap.h: compile-time virtual memory allocation
> > + */
> > +#ifndef ASM_FIXMAP_H
> > +#define ASM_FIXMAP_H
> > +
> > +#include <xen/bug.h>
> > +#include <xen/page-size.h>
> > +#include <xen/pmap.h>
> > +
> > +#include <asm/page.h>
> > +
> > +/* Fixmap slots */
> > +#define FIX_PMAP_BEGIN (0) /* Start of PMAP */
> > +#define FIX_PMAP_END (FIX_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of
> > PMAP */
> > +#define FIX_MISC (FIX_PMAP_END + 1)=C2=A0 /* Ephemeral mappings of
> > hardware */
> > +
> > +#define FIX_LAST (FIX_MISC + 1) /* +1 means a guard slot */
>=20
> As per my comment on the earlier version: No, I don't think this
> arranges
> for a guard slot. It merely arranges for FIX_MISC to not trigger the
> BUG_ON() in virt_to_fix().
>=20
> > --- a/xen/arch/riscv/include/asm/page.h
> > +++ b/xen/arch/riscv/include/asm/page.h
> > @@ -81,6 +81,12 @@ static inline void flush_page_to_ram(unsigned
> > long mfn, bool sync_icache)
> > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > =C2=A0}
> > =C2=A0
> > +/* Write a pagetable entry. */
> > +static inline void write_pte(pte_t *p, pte_t pte)
> > +{
> > +=C2=A0=C2=A0=C2=A0 *p =3D pte;
> > +}
>=20
> No use of write_atomic() here? And no read_pte() counterpart right
> away (then
> also properly using read_atomic())?
I wanted to avoid the fence before "*p=3Dpte" which in case of
write_atomic() will be present. Won't it be enough to use here
WRITE_ONCE()?


>=20
> > @@ -191,6 +195,45 @@ static bool __init
> > check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
> > =C2=A0=C2=A0=C2=A0=C2=A0 return is_mode_supported;
> > =C2=A0}
> > =C2=A0
> > +void __init setup_fixmap_mappings(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 pte_t *pte, tmp;
> > +=C2=A0=C2=A0=C2=A0 unsigned int i;
> > +
> > +=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(FIX_LAST >=3D PAGETABLE_ENTRIES);
> > +
> > +=C2=A0=C2=A0=C2=A0 pte =3D &stage1_pgtbl_root[pt_index(HYP_PT_ROOT_LEV=
EL,
> > FIXMAP_ADDR(0))];
> > +
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * In RISC-V page table levels are numbered fr=
om Lx to L0
> > where
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * x is the highest page table level for curre=
ct=C2=A0 MMU mode (
> > for example,
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * for Sv39 has 3 page tables so the x =3D 2 (=
L2 -> L1 -> L0) ).
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * In this cycle we want to find L1 page table=
 because as L0
> > page table
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * xen_fixmap[] will be used.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 for ( i =3D HYP_PT_ROOT_LEVEL; i-- > 1; )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(!pte_is_valid(*pte))=
;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte =3D (pte_t *)LOAD_TO_LI=
NK(pte_to_paddr(*pte));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte =3D &pte[pt_index(i, FI=
XMAP_ADDR(0))];
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 BUG_ON(pte_is_valid(*pte));
> > +
> > +=C2=A0=C2=A0=C2=A0 tmp =3D paddr_to_pte(LINK_TO_LOAD((unsigned long)&x=
en_fixmap),
> > PTE_TABLE);
> > +=C2=A0=C2=A0=C2=A0 write_pte(pte, tmp);
> > +
> > +=C2=A0=C2=A0=C2=A0 RISCV_FENCE(rw, rw);
>=20
> In the changes section you say "r,r", and I was wondering about that.
> I
> take it that "rw,rw" is really what's needed here.
It was typo. I will update the change log.

Thanks.

~ Oleksii

