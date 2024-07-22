Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C99390B5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 16:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762050.1172143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVu4m-00082Z-5k; Mon, 22 Jul 2024 14:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762050.1172143; Mon, 22 Jul 2024 14:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVu4m-000805-2H; Mon, 22 Jul 2024 14:31:44 +0000
Received: by outflank-mailman (input) for mailman id 762050;
 Mon, 22 Jul 2024 14:31:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=urmM=OW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sVu4k-0007zz-7x
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 14:31:42 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bb2fbb7-4837-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 16:31:39 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52ed9b802ceso3905546e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 07:31:39 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ef5572454sm1249207e87.231.2024.07.22.07.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 07:31:38 -0700 (PDT)
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
X-Inumbo-ID: 1bb2fbb7-4837-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721658699; x=1722263499; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iGTpPRLc7S0NUO+JcK87guD1sycv4lIsXUQgEzgkCMg=;
        b=XH/8unty5dI0Ii4XSizjoH/Ao0wIuLtWDf34Y+94k6QE2DktrE0JxIa+9bLzoDfsXL
         ZCUep7kincPJuHDEdslr9M+h5NpNQjYPRBqipZkwJDgN2vXoeB7gpKJIwW3/rE7Vfy+9
         KSk2bj4ty/Dn6Qmsj6CCHsa6yGy62htE1w9ZWCIyiK/7McfoLaXM/Nn1GI8BsTzBtLNe
         W5Y4jGee2rFEme5vF1V0ql0OPA6ePbxEUtloNkLf/5kvXAIvDol+g+mLa8uif83tpFnD
         vAKVtycnl3FVpL4jrcW8RZY3GqdylgdN6IIs4lSQVU767lq4v5gEa8LK6VQ0eX33oNGZ
         3jGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721658699; x=1722263499;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iGTpPRLc7S0NUO+JcK87guD1sycv4lIsXUQgEzgkCMg=;
        b=F8Y1nLouhe1sCUMbk/MIQrE7sQwJQph6sJ+ifm1re8zVVmN7oWoFhIEeRdwpI1BD1i
         njrdyfTqGvf9YcWmMStDHFQ3KSbBNuaz7efhHPn8FmLtW6Us5q1E+6Qc8uFlXiu2HC9Z
         Z+g/P1EEbUePrO3il9i1LQ7EvtM0mlGmnH/gCK8FA5qhETwFJTyDVjAu5C55485IMSu2
         uvLlxdVoilM/allGVstOJGNi4/ht11X9nkkluj1CB4MjaFQmeNWI6k9Q3QNCPA3qJO6P
         oHnFnC8VpBbc5KNTTvXUF5ezVoj3Gu4db7OHI4SqGQRDek5bIjdRvlMLZWi3un5uRokg
         Sobw==
X-Forwarded-Encrypted: i=1; AJvYcCXpu1C4TOjdJEDjN+wjUmaqrh5kcYbC6RcLx1RZl/cLK337eCbryOZKLDFeg8xEuw2iDCSWxwBYupkIUYRMF5AL8PtqvDPK0nAuZKaCfRs=
X-Gm-Message-State: AOJu0YydwwjDG6+Zy4pOkCWwN/8oJCF9Zka52vuXQcUW4Q4xQpxv+YY/
	nGbP7ueVjvJ8yg2pxb51bi6+540GnpWffXFEnCn4wcSSdOlgAYKm
X-Google-Smtp-Source: AGHT+IF3bUBJ5aoYCYYM9oip2xfa27gv3oDa4KSrtUlJ+CT4Ltw7xZNn14V0PuNmy+/CoV72fxnopQ==
X-Received: by 2002:a05:6512:b21:b0:52e:a60e:3a04 with SMTP id 2adb3069b0e04-52efb85af78mr4420891e87.59.1721658698740;
        Mon, 22 Jul 2024 07:31:38 -0700 (PDT)
Message-ID: <3ce708acbe360854f88dc4c93b36c2359955915f.camel@gmail.com>
Subject: Re: [PATCH v2 4/8] xen/riscv: setup fixmap mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Date: Mon, 22 Jul 2024 16:31:37 +0200
In-Reply-To: <8fd1cc2c-9dda-4e74-b242-fe8aa862955d@xen.org>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
	 <8fd1cc2c-9dda-4e74-b242-fe8aa862955d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

Hi Julien,

On Sun, 2024-07-21 at 09:46 +0100, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 12/07/2024 17:22, Oleksii Kurochko wrote:
> > Introduce a function to set up fixmap mappings and L0 page
> > table for fixmap.
> >=20
> > Additionally, defines were introduced in riscv/config.h to
> > calculate the FIXMAP_BASE address.
> > This involved introducing BOOT_FDT_VIRT_{START, SIZE} and
> > XEN_SIZE, XEN_VIRT_END.
> >=20
> > Also, the check of Xen size was updated in the riscv/lds.S
> > script to use XEN_SIZE instead of a hardcoded constant.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V2:
> > =C2=A0 - newly introduced patch
> > ---
> > =C2=A0 xen/arch/riscv/include/asm/config.h |=C2=A0 9 ++++++
> > =C2=A0 xen/arch/riscv/include/asm/fixmap.h | 48
> > +++++++++++++++++++++++++++++
> > =C2=A0 xen/arch/riscv/include/asm/mm.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
2 ++
> > =C2=A0 xen/arch/riscv/include/asm/page.h=C2=A0=C2=A0 |=C2=A0 7 +++++
> > =C2=A0 xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 35 ++++++++++++++++++=
+++
> > =C2=A0 xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> > =C2=A0 xen/arch/riscv/xen.lds.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0 7 files changed, 104 insertions(+), 1 deletion(-)
> > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/fixmap.h
> >=20
> > diff --git a/xen/arch/riscv/include/asm/config.h
> > b/xen/arch/riscv/include/asm/config.h
> > index 50583aafdc..3275477c17 100644
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -74,11 +74,20 @@
> > =C2=A0 #error "unsupported RV_STAGE1_MODE"
> > =C2=A0 #endif
> > =C2=A0=20
> > +#define XEN_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MB(2)
>=20
> NIT: I would name it XEN_VIRT_SIZE to be consistent with the
> start/end.
>=20
> > +#define XEN_VIRT_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (XEN_VIRT_START + XEN_SIZE)
> Can we get away with not introducing *_END and just use START, SIZE?
> The=20
> reason I am asking is with "end" it is never clear whether it is=20
> inclusive or exclusive. For instance, here you use an exclusive range
> but ...
>=20
> > +
> > +#define BOOT_FDT_VIRT_START=C2=A0=C2=A0=C2=A0=C2=A0 XEN_VIRT_END
> > +#define BOOT_FDT_VIRT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MB(4)
> > +
> > =C2=A0 #define DIRECTMAP_SLOT_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 509
> > =C2=A0 #define DIRECTMAP_SLOT_START=C2=A0=C2=A0=C2=A0 200
> > =C2=A0 #define DIRECTMAP_VIRT_START=C2=A0=C2=A0=C2=A0 SLOTN(DIRECTMAP_S=
LOT_START)
> > =C2=A0 #define DIRECTMAP_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (SLOTN(DIRECTMAP_SLOT_END) -
> > SLOTN(DIRECTMAP_SLOT_START))
> > =C2=A0=20
> > +#define FIXMAP_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (BOOT_FDT_VIRT_START +
> > BOOT_FDT_VIRT_SIZE)
> > +#define FIXMAP_ADDR(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (FIXMAP_BASE + (n) * PAGE_SIZE)
> > +
> > =C2=A0 #define FRAMETABLE_SCALE_FACTOR=C2=A0 (PAGE_SIZE/sizeof(struct
> > page_info))
> > =C2=A0 #define FRAMETABLE_SIZE_IN_SLOTS (((DIRECTMAP_SIZE / SLOTN(1)) /
> > FRAMETABLE_SCALE_FACTOR) + 1)
> > =C2=A0=20
> > diff --git a/xen/arch/riscv/include/asm/fixmap.h
> > b/xen/arch/riscv/include/asm/fixmap.h
> > new file mode 100644
> > index 0000000000..fcfb82d69c
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/fixmap.h
> > @@ -0,0 +1,48 @@
> > +/*
> > + * fixmap.h: compile-time virtual memory allocation
> > + */
> > +#ifndef __ASM_FIXMAP_H
> > +#define __ASM_FIXMAP_H
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
>=20
> ... here is seems to be inclusive. Furthermore if you had 32-bit
> address=20
> space, it is also quite easy to have to create a region right at the
> top=20
> of it. So when END is exclusive, it would become 0.
>=20
> So on Arm, we decided to start to get rid of "end". I would consider
> to=20
> do the same on RISC-V for new functions.
I will refactor the code and get rid of "end".

>=20
> > +#define FIX_MISC (FIX_PMAP_END + 1)=C2=A0 /* Ephemeral mappings of
> > hardware */
>=20
> Are you going to use this fixmap? If not, then I would consider to=20
> remove it.
Yes, it used now in copy_from_paddr():
   /**
    * copy_from_paddr - copy data from a physical address
    * @dst: destination virtual address
    * @paddr: source physical address
    * @len: length to copy
    */
   void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long
   len)
   {
       void *src =3D (void *)FIXMAP_ADDR(FIXMAP_MISC);
  =20
       while (len) {
           unsigned long l, s;
  =20
           s =3D paddr & (PAGE_SIZE-1);
           l =3D min(PAGE_SIZE - s, len);
  =20
           set_fixmap(FIXMAP_MISC, maddr_to_mfn(paddr),
   PAGE_HYPERVISOR_WC);
           memcpy(dst, src + s, l);
           clear_fixmap(FIXMAP_MISC);
  =20
           paddr +=3D l;
           dst +=3D l;
           len -=3D l;
       }
   }

>=20
> > +
> > +#define FIX_LAST FIX_MISC
> > +
> > +#define FIXADDR_START FIXMAP_ADDR(0)
> > +#define FIXADDR_TOP FIXMAP_ADDR(FIX_LAST)
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +/*
> > + * Direct access to xen_fixmap[] should only happen when {set,
> > + * clear}_fixmap() is unusable (e.g. where we would end up to
> > + * recursively call the helpers).
> > + */
> > +extern pte_t xen_fixmap[];
> > +
> > +/* Map a page in a fixmap entry */
> > +extern void set_fixmap(unsigned int map, mfn_t mfn, unsigned int
> > attributes);
> > +/* Remove a mapping from a fixmap entry */
> > +extern void clear_fixmap(unsigned int map);
>=20
> Neither of the functions seem to be implemented in this patch. Can
> you=20
> clarify what's the plan for them?
You are right, it could be dropped now. But in future this functions
are used for copy_from_paddr(). Look at the code above.


>=20
> Also, I know that for x86/arm, we have some function prefixed with=20
> extern. But AFAIK, we are trying to get rid of them.
>=20
> In any case, I think for RISC-V we need some consistency. For
> instance,=20
> here you define with extern but...
>=20
> > +
> > +#define fix_to_virt(slot) ((void *)FIXMAP_ADDR(slot))
> > +
> > +static inline unsigned int virt_to_fix(vaddr_t vaddr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG_ON(vaddr >=3D FIXADDR_TOP || vaddr < FIXADDR_ST=
ART);
> > +
> > +=C2=A0=C2=A0=C2=A0 return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
> > +}
> > +
> > +#endif /* __ASSEMBLY__ */
> > +
> > +#endif /* __ASM_FIXMAP_H */
> > diff --git a/xen/arch/riscv/include/asm/mm.h
> > b/xen/arch/riscv/include/asm/mm.h
> > index 25af9e1aaa..a0bdc2bc3a 100644
> > --- a/xen/arch/riscv/include/asm/mm.h
> > +++ b/xen/arch/riscv/include/asm/mm.h
> > @@ -255,4 +255,6 @@ static inline unsigned int
> > arch_get_dma_bitsize(void)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 32; /* TODO */
> > =C2=A0 }
> > =C2=A0=20
> > +void setup_fixmap_mappings(void);
>=20
> ... here it is without.
>=20
> > +
> > =C2=A0 #endif /* _ASM_RISCV_MM_H */
> > diff --git a/xen/arch/riscv/include/asm/page.h
> > b/xen/arch/riscv/include/asm/page.h
> > index c831e16417..cbbf3656d1 100644
> > --- a/xen/arch/riscv/include/asm/page.h
> > +++ b/xen/arch/riscv/include/asm/page.h
> > @@ -81,6 +81,13 @@ static inline void flush_page_to_ram(unsigned
> > long mfn, bool sync_icache)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > =C2=A0 }
> > =C2=A0=20
> > +/* Write a pagetable entry. */
> > +static inline void write_pte(pte_t *p, pte_t pte)
> > +{
> > +=C2=A0=C2=A0=C2=A0 *p =3D pte;
> > +=C2=A0=C2=A0=C2=A0 asm volatile ("sfence.vma");
> > +}
> > +
> > =C2=A0 #endif /* __ASSEMBLY__ */
> > =C2=A0=20
> > =C2=A0 #endif /* _ASM_RISCV_PAGE_H */
> > diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> > index 7d09e781bf..d69a174b5d 100644
> > --- a/xen/arch/riscv/mm.c
> > +++ b/xen/arch/riscv/mm.c
> > @@ -49,6 +49,9 @@ stage1_pgtbl_root[PAGETABLE_ENTRIES];
> > =C2=A0 pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> > =C2=A0 stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT * PAGETABLE_ENTRIES];
> > =C2=A0=20
> > +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> > +xen_fixmap[PAGETABLE_ENTRIES];
>=20
> Can you add a BUILD_BUG_ON() to check that the number of entries in
> the=20
> fixmap will never be above PAGETABLE_ENTRIES?
Sure. What is the best place? Somewhere in setup_fixmap_mappings()?

>=20
> > +
> > =C2=A0 #define
> > HANDLE_PGTBL(curr_lvl_num)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 index =3D pt_index(curr_lvl_num,
> > page_addr);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pte_is_valid(pgtbl[index])
> > )=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
> > @@ -191,6 +194,38 @@ static bool __init
> > check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return is_mode_supported;
> > =C2=A0 }
> > =C2=A0=20
> > +void __init setup_fixmap_mappings(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 pte_t *pte;
> > +=C2=A0=C2=A0=C2=A0 unsigned int i;
> > +
> > +=C2=A0=C2=A0=C2=A0 pte =3D &stage1_pgtbl_root[pt_index(HYP_PT_ROOT_LEV=
EL,
> > FIXMAP_ADDR(0))];
> > +
> > +=C2=A0=C2=A0=C2=A0 for ( i =3D HYP_PT_ROOT_LEVEL - 1; i !=3D 0; i-- )
>=20
> I am a little bit confused with the - 1. Is this because you only
> want=20
> to map at L1 (I am not sure if this is the correct naming for RISC-
> V)?
Yes, the idea is that I want to stop in L1 ( 2Mb pages ) as this
mapping is already exist and there will not be need to create a new
table. ( what will fail because boot allocator isn't initialized yet
and alloc_boot_pages() will start to alarm because of
BUG_ON(!nr_bootmem_regions) ).

RISC-V also uses word levels, but the order is an opposite to Arm.

>=20
> In any case, I think it would be worth a comment.
Sure, I will add it.


>=20
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
> > +=C2=A0=C2=A0=C2=A0 BUG_ON( pte_is_valid(*pte) );
>=20
> Coding style: BUG_ON(pte_is_valid(*pte));
>=20
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(*pte) )
>=20
> I am a bit confused with this check. Above, Xen will crash if the PTE
> is=20
> valid. So why do we need a runtime check?
You are right, there is no any sense. We should drop it.

>=20
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t tmp =3D paddr_to_pte(=
LINK_TO_LOAD((unsigned
> > long)&xen_fixmap), PTE_TABLE);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_pte(pte, tmp);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("(XEN) fixmap is map=
ped\n");
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * We only need the zeroeth table allocated, b=
ut not the PTEs
> > set, because
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * set_fixmap() will set them on the fly.
>=20
> This function doesn't seem to exists yet (?).
Not yet. It will be introduced later...

~ Oleksii

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +}
> > +
> > =C2=A0 /*
> > =C2=A0=C2=A0 * setup_initial_pagetables:
> > =C2=A0=C2=A0 *
> > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > index 4defad68f4..13f0e8c77d 100644
> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -46,6 +46,8 @@ void __init noreturn start_xen(unsigned long
> > bootcpu_id,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_macros_from_bug_h();
> > =C2=A0 #endif
> > =C2=A0=20
> > +=C2=A0=C2=A0=C2=A0 setup_fixmap_mappings();
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("All set up\n");
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ( ;; )
> > diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> > index 070b19d915..63b1dd7bb6 100644
> > --- a/xen/arch/riscv/xen.lds.S
> > +++ b/xen/arch/riscv/xen.lds.S
> > @@ -181,6 +181,6 @@ ASSERT(!SIZEOF(.got.plt),=C2=A0 ".got.plt non-
> > empty")
> > =C2=A0=C2=A0 * Changing the size of Xen binary can require an update of
> > =C2=A0=C2=A0 * PGTBL_INITIAL_COUNT.
> > =C2=A0=C2=A0 */
> > -ASSERT(_end - _start <=3D MB(2), "Xen too large for early-boot
> > assumptions")
> > +ASSERT(_end - _start <=3D XEN_SIZE, "Xen too large for early-boot
> > assumptions")
> > =C2=A0=20
> > =C2=A0 ASSERT(_ident_end - _ident_start <=3D IDENT_AREA_SIZE, "identity
> > region is too big");
>=20
> Cheers,
>=20


