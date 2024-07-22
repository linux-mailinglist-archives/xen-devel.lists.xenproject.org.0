Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B46F9390C1
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 16:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762060.1172159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVu8z-0000HR-QZ; Mon, 22 Jul 2024 14:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762060.1172159; Mon, 22 Jul 2024 14:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVu8z-0000FA-NT; Mon, 22 Jul 2024 14:36:05 +0000
Received: by outflank-mailman (input) for mailman id 762060;
 Mon, 22 Jul 2024 14:36:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=urmM=OW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sVu8x-0000F4-RB
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 14:36:03 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7e87ef0-4837-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 16:36:01 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2f01e9f53ebso163071fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 07:36:01 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef23af7892sm9035551fa.50.2024.07.22.07.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 07:36:00 -0700 (PDT)
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
X-Inumbo-ID: b7e87ef0-4837-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721658961; x=1722263761; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vu7riwlJ52aHXE5OhTMHX3Bwu+y9zI3kCY0fiJGHmJo=;
        b=BV1u2wfhcoZhm9YAxc/2uccFQ5Mu/udXJPxk080JQY8QcBaus+hTV8N1K/v1RwmJkX
         bN6pci138YbEzMk+Qm5l2jGIHIWz9S4Y8I1M2OQkO4W9Yry4/eLJgUnU7bFrBPuEPw1B
         YKmebhypj5Fub/G+KSzCzsc1AiutvYj9cvsoluzPKM9AozDLn61DCyVg1FHkLWiGA96V
         ig5ZlSECMYCAx3B3r5T5XVfLua1AkFZbpjx4XQtUHfEZOy3ONB05+Ye/cGpBGB1xMmDb
         ECBM8V/cFKFxiaS/EQbNx4i91qptmzBtmMpYt4Mc24fwDvv2xDkl7kgxmGpSxFsxCsMm
         fSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721658961; x=1722263761;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vu7riwlJ52aHXE5OhTMHX3Bwu+y9zI3kCY0fiJGHmJo=;
        b=j1BGriUSxA6zYJ1PhjzyPus+R1vQ0k0zbQ7WEnmY1QyyNzBmzjDCnQkD91R51LxUXz
         av+lfTrlerBEmdHWZK0v/Bke9gvxRpno3Blw0VpvItxCEYwrh/PfyKZRmka5SlTc5vg0
         x9Rada+vPfL6nvhH3Xff/gCw3FhXqYlKuayMVM1TjSOc9KgYCnPAjwlw7pkt/ovlo5i4
         Q8BAtsWhSN/libaNWpaaKZC2XnOSrm71/Uj+hN/E2e2lQZ2br1EjXUc/beNgj4rFZ2sD
         2tgJpXZgvNoYB6bYjFDoH4FuWwjcdD+pfnr5vKj7DCZcH7LOn6w7Ddtcs1ygxYK0Plv8
         UMTw==
X-Forwarded-Encrypted: i=1; AJvYcCX8aIf/AIdMoa4b+BgPPHp1NqK2mnnDV+rLDV10zZgfK1p8FWZsoPW4wJHB28+u925Nm6MZfSo0QY870WNTCGeo12ay2gPi+qYpxmDQPD4=
X-Gm-Message-State: AOJu0Yx/JV/sU1SLKRlIpIRcUNaJkIwHUdp4y3uScW4Aq32rI3w0IXOF
	UegucJqeJrCZQueIy/68LrBhXdj7/xWGpGmMBOs777SpTe1VPeLF
X-Google-Smtp-Source: AGHT+IENeDdGg5g41DgAlM7pZ4rjXFdc2l0aa2EhBUHnlMolLR7LExpVXxmCEeeUTRkt4YLAHRsd6A==
X-Received: by 2002:a2e:3002:0:b0:2ef:2a60:c1c1 with SMTP id 38308e7fff4ca-2ef2a60c2f7mr30613781fa.21.1721658960959;
        Mon, 22 Jul 2024 07:36:00 -0700 (PDT)
Message-ID: <26a45d85fa22a696b629e602e87d5d95626b77f0.camel@gmail.com>
Subject: Re: [PATCH v2 4/8] xen/riscv: setup fixmap mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2024 16:36:00 +0200
In-Reply-To: <16648c6c-416d-4205-8d16-38c006251bb9@suse.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
	 <16648c6c-416d-4205-8d16-38c006251bb9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-22 at 14:42 +0200, Jan Beulich wrote:
> On 12.07.2024 18:22, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -74,11 +74,20 @@
> > =C2=A0#error "unsupported RV_STAGE1_MODE"
> > =C2=A0#endif
> > =C2=A0
> > +#define XEN_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MB(2)
> > +#define XEN_VIRT_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (XEN_VIRT_START + XEN_SIZE)
> > +
> > +#define BOOT_FDT_VIRT_START=C2=A0=C2=A0=C2=A0=C2=A0 XEN_VIRT_END
> > +#define BOOT_FDT_VIRT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MB(4)
> > +
> > =C2=A0#define DIRECTMAP_SLOT_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 509
> > =C2=A0#define DIRECTMAP_SLOT_START=C2=A0=C2=A0=C2=A0 200
> > =C2=A0#define DIRECTMAP_VIRT_START=C2=A0=C2=A0=C2=A0 SLOTN(DIRECTMAP_SL=
OT_START)
> > =C2=A0#define DIRECTMAP_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (SLOTN(DIRECTMAP_SLOT_END) -
> > SLOTN(DIRECTMAP_SLOT_START))
> > =C2=A0
> > +#define FIXMAP_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (BOOT_FDT_VIRT_START +
> > BOOT_FDT_VIRT_SIZE)
> > +#define FIXMAP_ADDR(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (FIXMAP_BASE + (n) * PAGE_SIZE)
>=20
> Why exactly do you insert this here, and not adjacent to
> BOOT_FDT_VIRT_*,
> which it actually is adjacent with?
I tried to follow alphabetical order.

>  Then ...
>=20
> > =C2=A0#define FRAMETABLE_SCALE_FACTOR=C2=A0 (PAGE_SIZE/sizeof(struct
> > page_info))
> > =C2=A0#define FRAMETABLE_SIZE_IN_SLOTS (((DIRECTMAP_SIZE / SLOTN(1)) /
> > FRAMETABLE_SCALE_FACTOR) + 1)
>=20
> ... this would also stay next to DIRECTMAP_*, which it uses.
>=20
> > --- a/xen/arch/riscv/include/asm/page.h
> > +++ b/xen/arch/riscv/include/asm/page.h
> > @@ -81,6 +81,13 @@ static inline void flush_page_to_ram(unsigned
> > long mfn, bool sync_icache)
> > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > =C2=A0}
> > =C2=A0
> > +/* Write a pagetable entry. */
> > +static inline void write_pte(pte_t *p, pte_t pte)
> > +{
> > +=C2=A0=C2=A0=C2=A0 *p =3D pte;
> > +=C2=A0=C2=A0=C2=A0 asm volatile ("sfence.vma");
>=20
> When they don't have operands, asm()-s are volatile anyway (being
> explicit
> about this may still be desirable, yes). But: Can you get away
> without
> operands here? Don't you need a memory clobber for the fence to
> actually
> remain where it is needed?
It should be "::memory" here. Thanks.

>=20
> Also, nit (style): Blanks missing.
>=20
> > --- a/xen/arch/riscv/mm.c
> > +++ b/xen/arch/riscv/mm.c
> > @@ -49,6 +49,9 @@ stage1_pgtbl_root[PAGETABLE_ENTRIES];
> > =C2=A0pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> > =C2=A0stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT * PAGETABLE_ENTRIES];
> > =C2=A0
> > +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> > +xen_fixmap[PAGETABLE_ENTRIES];
>=20
> Any reason this cannot be static?
It will be used by pmap:
   static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
   {
       pte_t *entry =3D &xen_fixmap[slot];
       pte_t pte;
  =20
       ASSERT(!pte_is_valid(*entry));
  =20
       pte =3D mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
       pte.pte |=3D PTE_LEAF_DEFAULT;
       write_pte(entry, pte);
   }
  =20
   static inline void arch_pmap_unmap(unsigned int slot)
   {
       pte_t pte =3D {};
  =20
       write_pte(&xen_fixmap[slot], pte);
   }

~ Oleksii

