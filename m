Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA1492E37E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 11:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757224.1166006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRq95-0001NF-RB; Thu, 11 Jul 2024 09:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757224.1166006; Thu, 11 Jul 2024 09:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRq95-0001Kc-Ne; Thu, 11 Jul 2024 09:31:23 +0000
Received: by outflank-mailman (input) for mailman id 757224;
 Thu, 11 Jul 2024 09:31:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRq95-0001KW-3h
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 09:31:23 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55b768a5-3f68-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 11:31:22 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e37feeso722230a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 02:31:22 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bba54bf8sm3226486a12.18.2024.07.11.02.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 02:31:21 -0700 (PDT)
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
X-Inumbo-ID: 55b768a5-3f68-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720690282; x=1721295082; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ahIJOehh3nriW7UgK3Elrg/pdCCkECMPlyhIzvPitc8=;
        b=l39BMsCA1Mk1PNSKaEL6Jy1MBmRIQF3n46GJ26xQeaBwfZHk6gxMo/SzJRdbXfv0AY
         jRDjHc3mfs8iCJzGFPV7mNExMlycpf+pR6HeO6wACAeB8glbD5o002Vw72eJkCF9hnue
         JsIhTJrbslbY/JXObXdio/6M+57KDp2MKjrTes93Yv0Jx7GNugLtMyXLwlzDOMaZZcf7
         eL1UnjMJ0SGYJ/uguDiWsC+buz6/AXmulxz3kKAxX1t/FplMc8ViH9Eu8WipsC6sEeYb
         8xAQ6WlTRZUvc68aJnIHVf0WergMXSAarPcoCWxJB6cHEcLifwDjPRvWZ2DOgvLC6wXo
         fG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720690282; x=1721295082;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ahIJOehh3nriW7UgK3Elrg/pdCCkECMPlyhIzvPitc8=;
        b=OOtslyJi1TOAk9uxBUoNmY/YW+dJc+ASL5+Di8TKpfxAHSYTTQcXiubIsrDwnh3miw
         kDi8h9N1WaWUh4IAIiCEEkSOoBch5hXkNstIGyrngEw64w6eDziWtbIV4ifxdX2R7kQZ
         QkWdo8tzSCq8joRWTVyvnkOTMaK7ahBPfsV4uVJOAj3WVP+x+cCNoOAuRV6x109Xo4mp
         Wocf90lT/q2p03DNUVHx7HzFO0MdAaZ8mugmJym0BiQddFHSjWKNFh3vwameR5qM8F4R
         alipI9NcUJhI4F0wui4zUM0JnC87thjgmniMEpEH6Glod4DIo5iwQxRT3fXC0xdhsINn
         GIuw==
X-Forwarded-Encrypted: i=1; AJvYcCVie4kt5fJf0VXRcUoefcBHt7EZ76o2Mx2KXl1DIpj8WSOIs4h4Ffiy++xKwuu+3LOgTsS+dN/Z509PwBrzY+3HGxc0SBd96yjj2SpEE0c=
X-Gm-Message-State: AOJu0YzB2eNT31dib+rsHTtmJP+eF7XwPcDvbjeytCqjYWzAbh8pnXHH
	kfXfVj0iQiOIljvB5MlyKGM85UaR3JiQWGPvVg6SFhtktV1Bn2AOnsj2feMo
X-Google-Smtp-Source: AGHT+IF4aZHf6N21BHk0PssN+CigHqVqSZpAYMwSgbMISGYcPrS3v633E+NTweurAnyQjqK1aFfVrA==
X-Received: by 2002:a05:6402:3196:b0:58b:9561:650b with SMTP id 4fb4d7f45d1cf-594bb580796mr4533337a12.25.1720690281563;
        Thu, 11 Jul 2024 02:31:21 -0700 (PDT)
Message-ID: <31b8683537e5dd9df1d64178f752bae56daad633.camel@gmail.com>
Subject: Re: [PATCH v1 4/5] xen/riscv: introduce device tree maping function
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 11 Jul 2024 11:31:20 +0200
In-Reply-To: <91e1ff5e-a27a-4c59-b5b0-88414d504694@suse.com>
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
	 <efd3e6a8c526d227f8db06779c65ffda42a695d6.1720002425.git.oleksii.kurochko@gmail.com>
	 <91e1ff5e-a27a-4c59-b5b0-88414d504694@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-10 at 12:38 +0200, Jan Beulich wrote:
> On 03.07.2024 12:42, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/arch/riscv/include/asm/config.h |=C2=A0 6 +++++
> > =C2=A0xen/arch/riscv/include/asm/mm.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2=
 ++
> > =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37
> > +++++++++++++++++++++++++----
> > =C2=A03 files changed, 40 insertions(+), 5 deletions(-)
>=20
> I don't think a change like this can come without any description.
>=20
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -74,6 +74,9 @@
> > =C2=A0#error "unsupported RV_STAGE1_MODE"
> > =C2=A0#endif
> > =C2=A0
> > +#define XEN_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MB(2)
> > +#define XEN_VIRT_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (XEN_VIRT_START + XEN_SIZE)
>=20
> Probably wants accompanying by an assertion in the linker script. Or
> else
> how would one notice when Xen grows bigger than this?
I use XEN_SIZE in the linker script here:
 ASSERT(_end - _start <=3D MB(2), "Xen too large for early-boot
assumptions")

>=20
> > @@ -99,6 +102,9 @@
> > =C2=A0#define VMAP_VIRT_START=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 SLOTN(VMAP_SLOT_START)
> > =C2=A0#define VMAP_VIRT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 GB(1)
> > =C2=A0
> > +#define BOOT_FDT_VIRT_START=C2=A0=C2=A0=C2=A0=C2=A0 XEN_VIRT_END
> > +#define BOOT_FDT_VIRT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MB(4)
>=20
> Is the 4 selected arbitrarily, or derived from something?
Yes, it was chosen arbitrarily. I just checked that I don't have any
DTBs larger than 2 MB, but decided to add a little extra space and
doubled it to an additional 2 MB.

>=20
> Also maybe better to keep these #define-s sorted by address? (As to
> "keep":
> I didn't check whether they currently are.)
>=20
> > --- a/xen/arch/riscv/include/asm/mm.h
> > +++ b/xen/arch/riscv/include/asm/mm.h
> > @@ -255,4 +255,6 @@ static inline unsigned int
> > arch_get_dma_bitsize(void)
> > =C2=A0=C2=A0=C2=A0=C2=A0 return 32; /* TODO */
> > =C2=A0}
> > =C2=A0
> > +void* early_fdt_map(paddr_t fdt_paddr);
>=20
> Nit: * and blank want to change places.
>=20
> > --- a/xen/arch/riscv/mm.c
> > +++ b/xen/arch/riscv/mm.c
> > @@ -1,5 +1,6 @@
> > =C2=A0/* SPDX-License-Identifier: GPL-2.0-only */
> > =C2=A0
> > +#include <xen/bootfdt.h>
> > =C2=A0#include <xen/bug.h>
> > =C2=A0#include <xen/compiler.h>
> > =C2=A0#include <xen/init.h>
> > @@ -7,7 +8,9 @@
> > =C2=A0#include <xen/macros.h>
> > =C2=A0#include <xen/mm.h>
> > =C2=A0#include <xen/pfn.h>
> > +#include <xen/libfdt/libfdt.h>
>=20
> This wants to move up, to retain sorting.
>=20
> > =C2=A0#include <xen/sections.h>
> > +#include <xen/sizes.h>
> > =C2=A0
> > =C2=A0#include <asm/early_printk.h>
> > =C2=A0#include <asm/csr.h>
> > @@ -20,7 +23,7 @@ struct mmu_desc {
> > =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int pgtbl_count;
> > =C2=A0=C2=A0=C2=A0=C2=A0 pte_t *next_pgtbl;
> > =C2=A0=C2=A0=C2=A0=C2=A0 pte_t *pgtbl_base;
> > -};
> > +} mmu_desc =3D { CONFIG_PAGING_LEVELS, 0, NULL, 0 };
>=20
> __initdata and static?
>=20
> > @@ -39,9 +42,11 @@ static unsigned long __ro_after_init
> > phys_offset;
> > =C2=A0 * isn't 2 MB aligned.
> > =C2=A0 *
> > =C2=A0 * CONFIG_PAGING_LEVELS page tables are needed for the identity
> > mapping,
> > - * except that the root page table is shared with the initial
> > mapping
> > + * except that the root page table is shared with the initial
> > mapping.
> > + *
> > + * CONFIG_PAGING_LEVELS page tables are needed for device tree
> > mapping.
> > =C2=A0 */
> > -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
> > +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 3 + 1 +
> > 1)
>=20
> Considering what would happen if two or three more of such
> requirements
> were added, maybe better
>=20
> #define PGTBL_INITIAL_COUNT (CONFIG_PAGING_LEVELS * 3 - 1)
>=20
> ? However, why is it CONFIG_PAGING_LEVELS that's needed, and not
> CONFIG_PAGING_LEVELS - 1? The top level table is the same as the
> identity map's, isn't it?
The top level table is the same, but I just wanted to be sure that if
DTB size is bigger then 2Mb then we need 2xL0 page tables.

Am I missing something?

~ Oleksii
>=20
> > @@ -296,6 +299,30 @@ unsigned long __init calc_phys_offset(void)
> > =C2=A0=C2=A0=C2=A0=C2=A0 return phys_offset;
> > =C2=A0}
> > =C2=A0
> > +void* __init early_fdt_map(paddr_t fdt_paddr)
>=20
> See earlier remark regarding * placement.
>=20
> Jan


