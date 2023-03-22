Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557506C4713
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:56:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513277.794068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevBw-00016p-2Z; Wed, 22 Mar 2023 09:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513277.794068; Wed, 22 Mar 2023 09:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevBv-000153-Vt; Wed, 22 Mar 2023 09:55:35 +0000
Received: by outflank-mailman (input) for mailman id 513277;
 Wed, 22 Mar 2023 09:55:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhKM=7O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pevBt-00014x-Uj
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:55:34 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adbc481e-c897-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 10:55:30 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 l15-20020a05600c4f0f00b003ed58a9a15eso11024437wmq.5
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 02:55:30 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 l12-20020adfe9cc000000b002cea8e3bd54sm13387943wrn.53.2023.03.22.02.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 02:55:28 -0700 (PDT)
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
X-Inumbo-ID: adbc481e-c897-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679478929;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UEhw3T7MYMroPcsS2QCN38NI05g3Aiit82bp1qe45U4=;
        b=hpjObCdTbTcWB9SNtkLIB57PcSCeY0Ow8fDg/ogwYKvHIV9pSYTxtkK32fqAZIt55u
         6xVXW+OWyX6T13GJ9gq/m8twXto7+eY/aD7u2G3B7fzPIkz6cFPSl5iNhNG3hXR906yd
         Dex5ssXQpXO6NL1M9ZGGbeEprJVumeVEOBxgD7bm5uS10dnIp6jXZeRILsjnZE70yWH9
         6L/0wQiJK0iACDqPeCb0d4PWLHorPYkkPon7hKO5jYYLUR5oheQ2xusB5E8NMZm6z90K
         JCoszj0d/eDY3VkjbeXDFm9KLYwwNNXXjfYht+BBF3AvoXAUlr7FvqyfzkapN1EGiuTU
         PSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679478929;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UEhw3T7MYMroPcsS2QCN38NI05g3Aiit82bp1qe45U4=;
        b=iQrUJLGEIBziIP7oFXwqrr4jCGfokQTgzkp9gavmrERPXMm08t5IJUxRcIk5DsR0Yx
         T2LzMEr/Adz+B8GVs/TgSHpRs+bCPAP4t6lEsFz9zImnlfL1QcAtCWUewerAmefajU0s
         EerwtPi9Ir8tJ3qSsuiMhHcT5xFHn7SXXvLitMwRTD5CYYcRV+xm6ZtgYIEKXD6bnbUZ
         ptab1SjZ/hZMkMjclMNN1x0D877XcRzRnhnMqyZBJ4Ba2mT5sKvQpa4Jp3A2fAB7ngdZ
         2AtsZDYLqOOsqE6SOfAol5Cp2VO34aPbZ8b9VwVN1R4yU2LpkwCwvX/gPqFWqF8OZYUp
         4ljw==
X-Gm-Message-State: AO0yUKUMx2m+GoA5/BfYCPkB8DWqu+XTZiQht9ouBqA/LcnIcyIQCbYw
	paWfvi8N/ogBj7i1UEkouT4=
X-Google-Smtp-Source: AK7set+qGkeYQHhWriMNHWjh2UxppQejVeas7jJA9/9gwetWv27Y4Ae0oC87OHDIZNes6MU+tHt6Zg==
X-Received: by 2002:a05:600c:258:b0:3e2:662:ade6 with SMTP id 24-20020a05600c025800b003e20662ade6mr4915534wmj.26.1679478929182;
        Wed, 22 Mar 2023 02:55:29 -0700 (PDT)
Message-ID: <5169c6c8a0c4c90b56e3f525a55de464edf7181e.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Wed, 22 Mar 2023 11:55:26 +0200
In-Reply-To: <9ff0e335-6cb2-be49-046d-745ce05f7086@xen.org>
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
	 <85a21ada5a0fc44bb9db1dcc1f6cf191a6e66bfb.1678984041.git.oleksii.kurochko@gmail.com>
	 <9ff0e335-6cb2-be49-046d-745ce05f7086@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

Hi Jullien,

On Tue, 2023-03-21 at 17:58 +0000, Julien Grall wrote:
> Hi,
>=20
> I will try to not repeat the comment already made.
>=20
> On 16/03/2023 16:43, Oleksii Kurochko wrote:
> > Mostly the code for setup_initial_pages was taken from Bobby's
> > repo except for the following changes:
> > * Use only a minimal part of the code enough to enable MMU
> > * rename {_}setup_initial_pagetables functions
> > * add an argument for setup_initial_mapping to have
> > =C2=A0=C2=A0 an opportunity to make set PTE flags.
> > * update setup_initial_pagetables function to map sections
> > =C2=A0=C2=A0 with correct PTE flags.
> > * introduce separate enable_mmu() to be able for proper
> > =C2=A0=C2=A0 handling the case when load start address isn't equal to
> > =C2=A0=C2=A0 linker start address.
> > * map linker addresses range to load addresses range without
> > =C2=A0=C2=A0 1:1 mapping.
> > * add safety checks such as:
> > =C2=A0=C2=A0 * Xen size is less than page size
> > =C2=A0=C2=A0 * linker addresses range doesn't overlap load addresses
> > =C2=A0=C2=A0=C2=A0=C2=A0 range
> > * Rework macros {THIRD,SECOND,FIRST,ZEROETH}_{SHIFT,MASK}
> > * change PTE_LEAF_DEFAULT to RX instead of RWX.
> > * Remove phys_offset as it isn't used now.
> > * Remove alignment=C2=A0 of {map, pa}_start &=3D XEN_PT_LEVEL_MAP_MASK(=
0);
> > in
> > =C2=A0=C2=A0 setup_inital_mapping() as they should be already aligned.
> > * Remove clear_pagetables() as initial pagetables will be
> > =C2=A0=C2=A0 zeroed during bss initialization
> > * Remove __attribute__((section(".entry")) for
> > setup_initial_pagetables()
> > =C2=A0=C2=A0 as there is no such section in xen.lds.S
> > * Update the argument of pte_is_valid() to "const pte_t *p"
> >=20
> > Origin:
> > https://gitlab.com/xen-on-risc-v/xen/-/tree/riscv-rebase=C2=A04af165b46=
8
> > af
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V2:
> > =C2=A0 * update the commit message:
> > =C2=A0 * Remove {ZEROETH,FIRST,...}_{SHIFT,MASK, SIZE,...} and
> > =C2=A0=C2=A0=C2=A0 introduce instead of them XEN_PT_LEVEL_*() and LEVEL=
_*
> > =C2=A0 * Rework pt_linear_offset() and pt_index based on=C2=A0
> > XEN_PT_LEVEL_*()
> > =C2=A0 * Remove clear_pagetables() functions as pagetables were zeroed
> > during
> > =C2=A0=C2=A0=C2=A0 .bss initialization
> > =C2=A0 * Rename _setup_initial_pagetables() to setup_initial_mapping()
> > =C2=A0 * Make PTE_DEFAULT equal to RX.
> > =C2=A0 * Update prototype of setup_initial_mapping(..., bool writable) =
-
> > >
> > =C2=A0=C2=A0=C2=A0 setup_initial_mapping(..., UL flags)
> > =C2=A0 * Update calls of setup_initial_mapping according to new
> > prototype
> > =C2=A0 * Remove unnecessary call of:
> > =C2=A0=C2=A0=C2=A0 _setup_initial_pagetables(..., load_addr_start, load=
_addr_end,
> > load_addr_start, ...)
> > =C2=A0 * Define index* in the loop of setup_initial_mapping
> > =C2=A0 * Remove attribute "__attribute__((section(".entry")))" for
> > setup_initial_pagetables()
> > =C2=A0=C2=A0=C2=A0 as we don't have such section
> > =C2=A0 * make arguments of paddr_to_pte() and pte_is_valid() as const.
> > =C2=A0 * make xen_second_pagetable static.
> > =C2=A0 * use <xen/kernel.h> instead of declaring extern unsigned long
> > _stext, 0etext, _srodata, _erodata
> > =C2=A0 * update=C2=A0 'extern unsigned long __init_begin' to 'extern un=
signed
> > long __init_begin[]'
> > =C2=A0 * use aligned() instead of
> > "__attribute__((__aligned__(PAGE_SIZE)))"
> > =C2=A0 * set __section(".bss.page_aligned") for page tables arrays
> > =C2=A0 * fix identatations
> > =C2=A0 * Change '__attribute__((section(".entry")))' to '__init'
> > =C2=A0 * Remove phys_offset as it isn't used now.
> > =C2=A0 * Remove alignment=C2=A0 of {map, pa}_start &=3D
> > XEN_PT_LEVEL_MAP_MASK(0); in
> > =C2=A0=C2=A0=C2=A0 setup_inital_mapping() as they should be already ali=
gned.
> > =C2=A0 * Remove clear_pagetables() as initial pagetables will be
> > =C2=A0=C2=A0=C2=A0 zeroed during bss initialization
> > =C2=A0 * Remove __attribute__((section(".entry")) for
> > setup_initial_pagetables()
> > =C2=A0=C2=A0=C2=A0 as there is no such section in xen.lds.S
> > =C2=A0 * Update the argument of pte_is_valid() to "const pte_t *p"
> > ---
> > =C2=A0 xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 xen/arch/riscv/include/asm/mm.h=C2=A0=C2=A0 |=C2=A0=C2=A0 8 ++
> > =C2=A0 xen/arch/riscv/include/asm/page.h |=C2=A0 67 +++++++++++++++++
> > =C2=A0 xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 121
> > ++++++++++++++++++++++++++++++
> > =C2=A0 xen/arch/riscv/riscv64/head.S=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 65=
 ++++++++++++++++
> > =C2=A0 xen/arch/riscv/xen.lds.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0 6 files changed, 264 insertions(+)
> > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/mm.h
> > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/page.h
> > =C2=A0 create mode 100644 xen/arch/riscv/mm.c
> >=20
> > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> > index 443f6bf15f..956ceb02df 100644
> > --- a/xen/arch/riscv/Makefile
> > +++ b/xen/arch/riscv/Makefile
> > @@ -1,5 +1,6 @@
> > =C2=A0 obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
> > =C2=A0 obj-y +=3D entry.o
> > +obj-y +=3D mm.o
> > =C2=A0 obj-$(CONFIG_RISCV_64) +=3D riscv64/
> > =C2=A0 obj-y +=3D sbi.o
> > =C2=A0 obj-y +=3D setup.o
> > diff --git a/xen/arch/riscv/include/asm/mm.h
> > b/xen/arch/riscv/include/asm/mm.h
> > new file mode 100644
> > index 0000000000..3cc98fe45b
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/mm.h
> > @@ -0,0 +1,8 @@
> > +#ifndef _ASM_RISCV_MM_H
> > +#define _ASM_RISCV_MM_H
> > +
> > +void setup_initial_pagetables(void);
> > +
> > +extern void enable_mmu(void);
> > +
> > +#endif /* _ASM_RISCV_MM_H */
> > diff --git a/xen/arch/riscv/include/asm/page.h
> > b/xen/arch/riscv/include/asm/page.h
> > new file mode 100644
> > index 0000000000..fb8329a191
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/page.h
> > @@ -0,0 +1,67 @@
> > +#ifndef _ASM_RISCV_PAGE_H
> > +#define _ASM_RISCV_PAGE_H
> > +
> > +#include <xen/const.h>
> > +#include <xen/types.h>
> > +
> > +#define PAGE_ENTRIES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << PAGETABLE_ORDER)
> > +#define VPN_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((unsigned lon=
g)(PAGE_ENTRIES
> > - 1))
> > +
> > +#define PAGE_ORDER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (12)
> > +
> > +#ifdef CONFIG_RISCV_64
> > +#define PAGETABLE_ORDER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (9)
> > +#else /* CONFIG_RISCV_32 */
> > +#define PAGETABLE_ORDER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (10)
> > +#endif
> > +
> > +#define LEVEL_ORDER(lvl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (lvl * PAGETABLE_ORDER)
> > +#define LEVEL_SHIFT(lvl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (LEVEL_ORDER(lvl) +
> > PAGE_ORDER)
> > +#define LEVEL_SIZE(lvl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (_AT(paddr_t, 1) <<
> > LEVEL_SHIFT(lvl))
> > +
> > +#define XEN_PT_LEVEL_SHIFT(lvl)=C2=A0=C2=A0=C2=A0=C2=A0 LEVEL_SHIFT(lv=
l)
> > +#define XEN_PT_LEVEL_ORDER(lvl)=C2=A0=C2=A0=C2=A0=C2=A0 LEVEL_ORDER(lv=
l)
> > +#define XEN_PT_LEVEL_SIZE(lvl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LEVEL_SIZ=
E(lvl)
> > +#define XEN_PT_LEVEL_MAP_MASK(lvl)=C2=A0 (~(XEN_PT_LEVEL_SIZE(lvl) -
> > 1))
> > +#define XEN_PT_LEVEL_MASK(lvl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (VPN_MASK=
 <<
> > XEN_PT_LEVEL_SHIFT(lvl))
> > +
> > +#define PTE_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10
> > +
> > +#define PTE_VALID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0, UL)
> > +#define PTE_READABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1, UL)
> > +#define PTE_WRITABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2, UL)
> > +#define PTE_EXECUTABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(3, UL)
> > +#define PTE_USER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4, UL)
> > +#define PTE_GLOBAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(5, UL)
> > +#define PTE_ACCESSED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(6, UL)
> > +#define PTE_DIRTY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(7, UL)
> > +#define PTE_RSW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (BIT(8, =
UL) | BIT(9, UL))
> > +
> > +#define PTE_LEAF_DEFAULT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (PTE_VALID | PTE_READABLE |
> > PTE_EXECUTABLE)
> > +#define PTE_TABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (PTE_VALID)
> > +
> > +/* Calculate the offsets into the pagetables for a given VA */
> > +#define pt_linear_offset(lvl, va)=C2=A0=C2=A0 ((va) >>
> > XEN_PT_LEVEL_SHIFT(lvl))
> > +
> > +#define pt_index(lvl, va)=C2=A0=C2=A0 pt_linear_offset(lvl, (va) &
> > XEN_PT_LEVEL_MASK(lvl))
> > +
> > +/* Page Table entry */
> > +typedef struct {
> > +=C2=A0=C2=A0=C2=A0 uint64_t pte;
> > +} pte_t;
> > +
> > +/* Shift the VPN[x] or PPN[x] fields of a virtual or physical
> > address
> > + * to become the shifted PPN[x] fields of a page table entry */
> > +#define addr_to_ppn(x) (((x) >> PAGE_SHIFT) << PTE_SHIFT)
> > +
> > +static inline pte_t paddr_to_pte(const unsigned long paddr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return (pte_t) { .pte =3D addr_to_ppn(paddr) };
> > +}
> > +
> > +static inline bool pte_is_valid(const pte_t *p)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return p->pte & PTE_VALID;
> > +}
> > +
> > +#endif /* _ASM_RISCV_PAGE_H */
> > diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> > new file mode 100644
> > index 0000000000..0df6b47441
> > --- /dev/null
> > +++ b/xen/arch/riscv/mm.c
> > @@ -0,0 +1,121 @@
> > +#include <xen/compiler.h>
> > +#include <xen/init.h>
> > +#include <xen/kernel.h>
> > +#include <xen/lib.h>
> > +#include <xen/page-size.h>
> > +
> > +#include <asm/boot-info.h>
> > +#include <asm/config.h>
> > +#include <asm/csr.h>
> > +#include <asm/mm.h>
> > +#include <asm/page.h>
> > +#include <asm/traps.h>
> > +
> > +/*
> > + * xen_second_pagetable is indexed with the VPN[2] page table
> > entry field
> > + * xen_first_pagetable is accessed from the VPN[1] page table
> > entry field
> > + * xen_zeroeth_pagetable is accessed from the VPN[0] page table
> > entry field
> > + */
> > +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> > +=C2=A0=C2=A0=C2=A0 xen_second_pagetable[PAGE_ENTRIES];
> > +static pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> > +=C2=A0=C2=A0=C2=A0 xen_first_pagetable[PAGE_ENTRIES];
> > +static pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> > +=C2=A0=C2=A0=C2=A0 xen_zeroeth_pagetable[PAGE_ENTRIES];
> > +
> > +extern unsigned long __init_begin[];
> > +extern unsigned long __init_end[];
> > +extern unsigned char cpu0_boot_stack[STACK_SIZE];
> > +
> > +static void __init
> > +setup_initial_mapping(pte_t *second, pte_t *first, pte_t *zeroeth,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long map=
_start,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long map=
_end,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pa_=
start,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long fla=
gs)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned long page_addr;
> > +
> > +=C2=A0=C2=A0=C2=A0 // /* align start addresses */
> > +=C2=A0=C2=A0=C2=A0 // map_start &=3D XEN_PT_LEVEL_MAP_MASK(0);
> > +=C2=A0=C2=A0=C2=A0 // pa_start &=3D XEN_PT_LEVEL_MAP_MASK(0);
>=20
> They should be switched to ASSERT() or BUG_ON().
Sure. Thanks. I'll update.
>=20
> > +
> > +=C2=A0=C2=A0=C2=A0 page_addr =3D map_start;
> > +=C2=A0=C2=A0=C2=A0 while ( page_addr < map_end )
>=20
> This loop is continue to assume that only the mapping can first in
> 2MB=20
> section (or less if the start is not 2MB aligned).
>=20
> I am OK if you want to assume it, but I think this should be
> documented=20
> (with words and ASSERT()/BUG_ON()) to avoid any mistake.
I add a check in setup_initial_pagetables:
     BUG_ON(load_addr_start % (PAGE_ENTRIES * PAGE_SIZE) !=3D 0);
Probably this is not a correct place and should be moved to
setup_initial_mapping() instead of setup_initial_pagetables()
>=20
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long index2 =3D pt=
_index(2, page_addr);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long index1 =3D pt=
_index(1, page_addr);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long index0 =3D pt=
_index(0, page_addr);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Setup level2 table */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 second[index2] =3D paddr_to=
_pte((unsigned long)first);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 second[index2].pte |=3D PTE=
_TABLE;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Setup level1 table */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first[index1] =3D paddr_to_=
pte((unsigned long)zeroeth);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first[index1].pte |=3D PTE_=
TABLE;
> > +
> > +
>=20
> NIT: Spurious line?
Yeah, should be removed. Thanks.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Setup level0 table */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(&zeroeth=
[index0]) )
>=20
> On the previous version, you said it should be checked for each
> level.=20
I had a terrible internet connection, and my message wasn't sent.

I decided not to check that l2 and l1 are used only for referring to
the next page table but not leaf PTE. So it is safe to overwrite it
each time (the addresses of page tables are the same all the time) and
probably it will be better from optimization point of view to ignore if
clauses.

And it is needed in case of L0 because it is possible that some
addressed were marked with specific flag ( execution, read, write ) and
so not to overwrite the flags set before the check is needed.

> the next page table but not leaf PTE.But here you still only check
> for a single level.
>=20
> Furthermore, I would strongly suggest to also check the valid PTE is
> the=20
> same as you intend to write to catch any override (they are a pain to
> debug).
but if load addresses and linker addresses don't overlap is it possible
situation that valid PTE will be overridden?
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
Update level0 table */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zer=
oeth[index0] =3D paddr_to_pte((page_addr - map_start)
> > + pa_start);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zer=
oeth[index0].pte |=3D flags;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Point to next page */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page_addr +=3D XEN_PT_LEVEL=
_SIZE(0);
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +/*
> > + * setup_initial_pagetables:
> > + *
> > + * Build the page tables for Xen that map the following:
> > + *=C2=A0=C2=A0 load addresses to linker addresses
> > + */
> > +void __init setup_initial_pagetables(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 pte_t *second;
> > +=C2=A0=C2=A0=C2=A0 pte_t *first;
> > +=C2=A0=C2=A0=C2=A0 pte_t *zeroeth;
> > +
> > +=C2=A0=C2=A0=C2=A0 unsigned long load_addr_start=C2=A0=C2=A0 =3D boot_=
info.load_start;
> > +=C2=A0=C2=A0=C2=A0 unsigned long load_addr_end=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D boot_info.load_end;
> > +=C2=A0=C2=A0=C2=A0 unsigned long linker_addr_start =3D boot_info.linke=
r_start;
> > +=C2=A0=C2=A0=C2=A0 unsigned long linker_addr_end=C2=A0=C2=A0 =3D boot_=
info.linker_end;
> > +
> > +=C2=A0=C2=A0=C2=A0 BUG_ON(load_addr_start % (PAGE_ENTRIES * PAGE_SIZE)=
 !=3D 0);
> > +=C2=A0=C2=A0=C2=A0 if (load_addr_start !=3D linker_addr_start)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON((linker_addr_end > l=
oad_addr_start && load_addr_end
> > > linker_addr_start));
>=20
> I would suggest to switch to a panic() with an error message as this=20
> would help the user understanding what this is breaking.
>=20
> Alternatively, you could document what this check is for.
I think I will document it for now as panic() isn't ready for use now.
>=20
> > +
> > +=C2=A0=C2=A0=C2=A0 /* Get the addresses where the page tables were loa=
ded */
> > +=C2=A0=C2=A0=C2=A0 second=C2=A0 =3D (pte_t *)(&xen_second_pagetable);
> > +=C2=A0=C2=A0=C2=A0 first=C2=A0=C2=A0 =3D (pte_t *)(&xen_first_pagetabl=
e);
> > +=C2=A0=C2=A0=C2=A0 zeroeth =3D (pte_t *)(&xen_zeroeth_pagetable);
> > +
> > +=C2=A0=C2=A0=C2=A0 setup_initial_mapping(second, first, zeroeth,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 LOAD_TO_LINK((unsigned long)&_stext),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 LOAD_TO_LINK((unsigned long)&_etext),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (unsigned long)&_stext,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 PTE_LEAF_DEFAULT);
> > +
> > +=C2=A0=C2=A0=C2=A0 setup_initial_mapping(second, first, zeroeth,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 LOAD_TO_LINK((unsigned
> > long)&__init_begin),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 LOAD_TO_LINK((unsigned
> > long)&__init_end),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (unsigned long)&__init_begin,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 PTE_LEAF_DEFAULT | PTE_WRITABLE);
> > +
> > +=C2=A0=C2=A0=C2=A0 setup_initial_mapping(second, first, zeroeth,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 LOAD_TO_LINK((unsigned long)&_srodata),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 LOAD_TO_LINK((unsigned long)&_erodata),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (unsigned long)(&_srodata),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 PTE_VALID | PTE_READABLE);
> > +
> > +=C2=A0=C2=A0=C2=A0 setup_initial_mapping(second, first, zeroeth,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 linker_addr_start,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 linker_addr_end,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 load_addr_start,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 PTE_LEAF_DEFAULT | PTE_READABLE);
>=20
> As I said in v1, you need to use a different set of page-table here.
If I understand you correctly I have to use a different set of page-
table in case when it is possible that size of Xen will be larger then
PAGE_SIZE. So I added to xen.lds.S a check to be sure that the size
fits into PAGE_SIZE.

> Also, where do you guarantee that Xen will be loaded at a 2MB aligned
> address? (For a fact I know that UEFI is only guarantee 4KB
> alignment).
There is a check in setup_initial_pagetables:
     BUG_ON(load_addr_start % (PAGE_ENTRIES * PAGE_SIZE) !=3D 0);

>=20
> > +}
> > diff --git a/xen/arch/riscv/riscv64/head.S
> > b/xen/arch/riscv/riscv64/head.S
> > index 8887f0cbd4..f4a0582727 100644
> > --- a/xen/arch/riscv/riscv64/head.S
> > +++ b/xen/arch/riscv/riscv64/head.S
> > @@ -1,4 +1,5 @@
> > =C2=A0 #include <asm/asm.h>
> > +#include <asm/asm-offsets.h>
> > =C2=A0 #include <asm/riscv_encoding.h>
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .section .text.h=
eader, "ax", %progbits
> > @@ -32,3 +33,67 @@ ENTRY(start)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=
=C2=A0=C2=A0 sp, sp, t0
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tail=C2=A0=C2=A0=
=C2=A0 start_xen
> > +
> > +ENTRY(enable_mmu)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Calculate physical offse=
t between linker and load
> > addresses */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 t0, boot_info
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_L=C2=A0=C2=A0 t1, BI_LI=
NKER_START(t0)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_L=C2=A0=C2=A0 t2, BI_LO=
AD_START(t0)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sub=C2=A0=C2=A0=C2=A0=C2=A0=
 t1, t1, t2
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Calculate and updat=
e a linker time address of the
> > .L_mmu_is_enabled
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * label and update CS=
R_STVEC with it.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * MMU is configured i=
n a way where linker addresses are
> > mapped
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * on load addresses s=
o case when linker addresses are not
> > equal to
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * load addresses, and=
 thereby, after MMU is enabled, it
> > will cause
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * an exception and ju=
mp to linker time addresses
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 t3, .L_mmu_is_enabled
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=C2=A0=
 t3, t3, t1
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csrw=C2=A0=C2=A0=C2=A0 CSR_=
STVEC, t3
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Calculate a value for SA=
TP register */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 t5, SATP_MODE_SV39
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 t6, SATP_MODE_SHIFT
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sll=C2=A0=C2=A0=C2=A0=C2=A0=
 t5, t5, t6
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 t4, xen_second_pagetable
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 srl=C2=A0=C2=A0=C2=A0=C2=A0=
 t4, t4, PAGE_SHIFT
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 t4, t4, t5
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sfence.vma
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csrw=C2=A0=C2=A0=C2=A0 CSR_=
SATP, t4
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .align 2
> > +.L_mmu_is_enabled:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Stack should be re-=
inited as:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 1. Right now an add=
ress of the stack is relative to
> > load time
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 a=
ddresses what will cause an issue in case of load
> > start address
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 i=
sn't equal to linker start address.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 2. Addresses in sta=
ck are all load time relative which
> > can be an
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 i=
ssue in case when load start address isn't equal to
> > linker
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 s=
tart address.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>=20
> Hmmm... I am not sure you can reset the stack and then return to the=20
> caller because it may have stash some variable on the stack.
>=20
> So if you want to reset, then you should jump to a brand new
> function.
Agree. it should be a new function. I'll take it into account.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 sp, cpu0_boot_stack
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 t0, STACK_SIZE
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=C2=A0=
 sp, sp, t0
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Re-init an address =
of exception handler as it was
> > overwritten=C2=A0 with
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the address of the =
.L_mmu_is_enabled label.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Before jump to trap=
_init save return address of
> > enable_mmu() to
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * know where we shoul=
d back after enable_mmu() will be
> > finished.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 s0, ra
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lla=C2=A0=C2=A0=C2=A0=C2=A0=
 t0, trap_init
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jalr=C2=A0=C2=A0=C2=A0 ra, =
t0
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Re-calculate the re=
turn address of enable_mmu()
> > function for case
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * when linker start a=
ddress isn't equal to load start
> > address
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=C2=A0=
 s0, s0, t1
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ra, s0
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret
>=20
> Missing ENDPROC?
I haven't seen the usage of ENDPROC for RISC-V so it looks like it is
not necessary.
>=20
> > diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> > index eed457c492..e4ac4e84b6 100644
> > --- a/xen/arch/riscv/xen.lds.S
> > +++ b/xen/arch/riscv/xen.lds.S
> > @@ -179,3 +179,5 @@ SECTIONS
> > =C2=A0=20
> > =C2=A0 ASSERT(!SIZEOF(.got),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".got non-em=
pty")
> > =C2=A0 ASSERT(!SIZEOF(.got.plt),=C2=A0 ".got.plt non-empty")
> > +
> > +ASSERT(_end - _start <=3D MB(2), "Xen too large for early-boot
> > assumptions")
>=20
~ Oleksii


