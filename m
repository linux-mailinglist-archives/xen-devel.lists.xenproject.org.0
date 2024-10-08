Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353BB99455C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 12:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812971.1225718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy7QD-0003tI-RK; Tue, 08 Oct 2024 10:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812971.1225718; Tue, 08 Oct 2024 10:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy7QD-0003qM-OL; Tue, 08 Oct 2024 10:26:29 +0000
Received: by outflank-mailman (input) for mailman id 812971;
 Tue, 08 Oct 2024 10:26:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J5/k=RE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sy7QC-0003qG-3M
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 10:26:28 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5dd31c3-855f-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 12:26:26 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8ce5db8668so839042866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 03:26:26 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e806adcsm490324966b.221.2024.10.08.03.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 03:26:24 -0700 (PDT)
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
X-Inumbo-ID: c5dd31c3-855f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728383185; x=1728987985; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M0xphy+/GSl37pA2BYPL60sCH2pffb9Gy+6HIKutHe4=;
        b=J1LmJw3HCKChwCwQIh057zBf6nMIX6oLZg8aPB/yFisj0B4DiMrrAFkmhZhAUiravu
         ZW0oRooE60rAGjrPnX4REPvj3WLbzODyNUwpv5PXNeLcFppDQZ8VTRGw9c6pqBYlUJQq
         9REmw4I0PlXE7XBTCdtLxAInqV6d+94KIDUn6XdduIvJ62p+SVGMot2nrznUbeLoZsK1
         4COAHIf8/jv4Xh3yBxQv772JBGGdYYieppVei0+a/5nOAl/LJFpihJWqpHcP8RtqeBQR
         3qLHcgRpWfWLg9bNhfBPsN6LPPJzfhqeDO+beoTD6JHvWku0bL10NEmBBuRk5o+eK9NI
         ARwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728383185; x=1728987985;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0xphy+/GSl37pA2BYPL60sCH2pffb9Gy+6HIKutHe4=;
        b=NztMbGtQkqPZ5vsqfneOdcvZljqV0fxKd2kDd0BIh8pI6YT1lDCA52j8a3eRG6ekj+
         jqHjW1rsnnaHdfSe8ajLVuZPHlWHK536cAlByNU1mf0G9QCwlDY1N5oTHl8dzsubnKoD
         IRSnYUAruhMf1bFp1jZhuCeaf7q2/b4GYCAOhvrrpTv0pyfKrMosIUrj/T7aH36QtICQ
         kyhKwhRgXIfgBqeu2yPJT5VZXKA9o4fzp1unxPI1rjp0XTuWmXwcu2vYMhaW/EN81Rbl
         pcl1AgIm0ACjOaFioYpLMNw0wCFfP9H60PD0pJlGX4FWETz3VU71f1u9FZpZSmqpE0KV
         AI2w==
X-Gm-Message-State: AOJu0YyL6EZKdl5FC1xlAyPW9sZRB4HwSEYuU6l/QlV1nJsCSWpRguie
	pzktJPImoRHFr2eFOa+Mt9AmoskAscWbzapAF8SwkJlNgKExOfCq1qylWg==
X-Google-Smtp-Source: AGHT+IEosO9dJmIMXAtB5pmd3r9xNphTn0D6uzZWrtUouEFdlx/oh80EQZS0Zw2/qKfQaUWGS5YGNA==
X-Received: by 2002:a17:907:3f8a:b0:a99:5240:381e with SMTP id a640c23a62f3a-a9952403a3dmr679855266b.18.1728383185033;
        Tue, 08 Oct 2024 03:26:25 -0700 (PDT)
Message-ID: <5771a606964dfaf7d507a5ecbc315dbbf8eac479.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] xen/riscv: implement virt_to_maddr()
From: oleksii.kurochko@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Date: Tue, 08 Oct 2024 12:26:23 +0200
In-Reply-To: <25a0fa030db90c929379a799aa5e03bed0197665.1728057657.git.oleksii.kurochko@gmail.com>
References: <cover.1728057657.git.oleksii.kurochko@gmail.com>
	 <25a0fa030db90c929379a799aa5e03bed0197665.1728057657.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-10-04 at 18:04 +0200, Oleksii Kurochko wrote:
> Implement the virt_to_maddr() function to convert virtual addresses
> to machine addresses, including checks for address ranges such as
> the direct mapping area (DIRECTMAP_VIRT_START) and the Xen virtual
> address space. To implement this, the phys_offset variable is made
> accessible outside of riscv/mm.c.
>=20
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
> =C2=A0 - Drop casts in virt_to_maddr() for ASSERT which checks that VA is
> =C2=A0=C2=A0=C2=A0 in the range of where Xen is located.
> =C2=A0 - Add UL suffix for or XEN_VIRT_START by using _AC(..., UL) and ad=
d
> inclusion
> =C2=A0=C2=A0=C2=A0 of <xen/const.h>
> =C2=A0 - Add the comment above return which explains why there is no need
> =C2=A0=C2=A0=C2=A0 to do " - XEN_VIRT_START.
> ---
> =C2=A0xen/arch/riscv/include/asm/config.h |=C2=A0 4 ++++
> =C2=A0xen/arch/riscv/include/asm/mm.h=C2=A0=C2=A0=C2=A0=C2=A0 | 17 ++++++=
++++++++++-
> =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A03 files changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/riscv/include/asm/config.h
> b/xen/arch/riscv/include/asm/config.h
> index 7dbb235685..8884aeab16 100644
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -155,6 +155,10 @@
> =C2=A0
> =C2=A0#define IDENT_AREA_SIZE 64
> =C2=A0
> +#ifndef __ASSEMBLY__
> +extern unsigned long phys_offset;
> +#endif
> +
> =C2=A0#endif /* __RISCV_CONFIG_H__ */
> =C2=A0/*
> =C2=A0 * Local variables:
> diff --git a/xen/arch/riscv/include/asm/mm.h
> b/xen/arch/riscv/include/asm/mm.h
> index 4b7b00b850..0f7879d685 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -5,6 +5,7 @@
> =C2=A0
> =C2=A0#include <public/xen.h>
> =C2=A0#include <xen/bug.h>
> +#include <xen/const.h>
> =C2=A0#include <xen/mm-frame.h>
> =C2=A0#include <xen/pdx.h>
> =C2=A0#include <xen/types.h>
> @@ -28,7 +29,21 @@ static inline void *maddr_to_virt(paddr_t ma)
> =C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> =C2=A0}
> =C2=A0
> -#define virt_to_maddr(va) ({ BUG_ON("unimplemented"); 0; })
> +static inline unsigned long virt_to_maddr(unsigned long va)
> +{
> +=C2=A0=C2=A0=C2=A0 ASSERT(va >=3D (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE=
));
It should be ASSERT(va < (...)).

Then I can't use virt_to_maddr() instead of LINK_TO_LOAD() as=20
address from Xen's VA space ( XEN_VIRT_START ) are higher then
(DIRECTMAP_VIRT_START + DIRECTMAP_SIZE).

Or as an option we could consider to drop this ASSERT() as if
VA is from directmap range the if below will catch that; otherwise
we have another one ASSERT() which checks that VA is from Xen VA range
where it is sage to use (phys_offset + va).

Could we consider just dropping "ASSERT(va < (DIRECTMAP_VIRT_START +
DIRECTMAP_SIZE))" or I am missing something?

~ Oleksii


> +=C2=A0=C2=A0=C2=A0 if ((va >=3D DIRECTMAP_VIRT_START) &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (va < (DIRECTMAP_VIRT_START +=
 DIRECTMAP_SIZE)))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return directmapoff_to_maddr(=
va - DIRECTMAP_VIRT_START);
> +
> +=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(XEN_VIRT_SIZE !=3D MB(2));
> +=C2=A0=C2=A0=C2=A0 ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) =3D=3D
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (_AC(XEN_VI=
RT_START, UL) >> (PAGETABLE_ORDER +
> PAGE_SHIFT)));
> +
> +=C2=A0=C2=A0=C2=A0 /* phys_offset =3D load_start - XEN_VIRT_START */
> +=C2=A0=C2=A0=C2=A0 return phys_offset + va;
> +}
> +#define virt_to_maddr(va) virt_to_maddr((unsigned long)(va))
> =C2=A0
> =C2=A0/* Convert between Xen-heap virtual addresses and machine frame
> numbers. */
> =C2=A0#define __virt_to_mfn(va)=C2=A0 mfn_x(maddr_to_mfn(virt_to_maddr(va=
)))
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index 4a628aef83..7a1919e07e 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -26,7 +26,7 @@ struct mmu_desc {
> =C2=A0=C2=A0=C2=A0=C2=A0 pte_t *pgtbl_base;
> =C2=A0};
> =C2=A0
> -static unsigned long __ro_after_init phys_offset;
> +unsigned long __ro_after_init phys_offset;
> =C2=A0
> =C2=A0#define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
> =C2=A0#define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)


