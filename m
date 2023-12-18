Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E912816A84
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655765.1023530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAWA-000862-NO; Mon, 18 Dec 2023 10:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655765.1023530; Mon, 18 Dec 2023 10:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAWA-00083A-KA; Mon, 18 Dec 2023 10:06:34 +0000
Received: by outflank-mailman (input) for mailman id 655765;
 Mon, 18 Dec 2023 10:06:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFAW8-00082K-PL
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:06:32 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d4ecd2b-9d8d-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 11:06:30 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cc6d9b4c6aso10068371fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 02:06:30 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05651c159300b002cc4385729dsm1412953ljq.27.2023.12.18.02.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 02:06:29 -0800 (PST)
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
X-Inumbo-ID: 1d4ecd2b-9d8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702893990; x=1703498790; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a6mir6FZSgShTDwjOVk46qOZ4CrkGGybu54LdIVnujA=;
        b=WsK0YLLvHkg0kLJVw8r20tvLz+kBLBArw1C2D+d8hEEbPMkssngl/Wnt61EgTOyLrn
         PmiEhuseL9j4VAFUsWW6GADmOvMZ39BMwWAUhusdpJbxdjXfawkFImABY7YzqA11uPDD
         9j/lUEpydOW0LDcpmTaF1nN66+yK2AMPHLSkRK/5ViY7uc+3jRAz9hvDW7mhFs8WVaPa
         9RqLqR0bUo81qhKF5trG4YfuXftRy6dBkY+2YW8CjiBwC3e7kaxKMbSsMfs5y0uVxiXH
         tTtXcnGnnBfKNvHnQyqFgbXFb5eLfEPQBeLP91Byx1oSggl14xlmzRAOVNZ+Gx40ICkF
         o2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702893990; x=1703498790;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6mir6FZSgShTDwjOVk46qOZ4CrkGGybu54LdIVnujA=;
        b=tRqwsWtXf6tFj2WObNEDjKtm8KsabBBDFEAI+oyj9zXxFx0BEvT3RlmJ44ZZf3mB+L
         4SYKgWB4JZIZteAiin5frWj/txZLGc2IWEyWhAM0FLsxqAUnn8vDgIAAHhscy0GkDOnZ
         WMatShG4XYKupCyjkZ+N0thl9ZDX1SWX2Hq9LAW4jNjrVAwgtOjurfV9h8lQsfG3C4fC
         s9p8j7akEkb3kQghJvvY3OZIKskcf0jduGhbzT30o4SkxuAXY3EkJGdVQBRDNBPwqbUN
         nhh44m6Ua2K8e4oo4JsO/RoMu/FqP98WzzM6JHAK2FkhsFUGz/od9Ao3Jxp0cFDVrSHV
         pwIA==
X-Gm-Message-State: AOJu0Yy85DOHHP1aH/wlzM+fVmKqqvI7Wq0NiH/YbeIIDzU1mGkNMLcH
	Fjfv0fhPBJSDrapipEkha2Y=
X-Google-Smtp-Source: AGHT+IETtlSENTr//cU9Us2LfLnoQR/5R6RplflDosK7B84aNz3DQOR5HHMIpOXVdULpOCTKOJIXUw==
X-Received: by 2002:a2e:9e56:0:b0:2c9:f92e:fa4 with SMTP id g22-20020a2e9e56000000b002c9f92e0fa4mr6065655ljk.34.1702893989763;
        Mon, 18 Dec 2023 02:06:29 -0800 (PST)
Message-ID: <fb8d6b3f47c9939eb1e0730f77204ec4648a0bcb.camel@gmail.com>
Subject: Re: [PATCH v2 25/39] xen/riscv: introduce asm/p2m.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 12:06:28 +0200
In-Reply-To: <46462554-f040-4c34-874d-2d0455707731@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <a37e4b7115897a0265907c53667a0ede3763f0ce.1700761381.git.oleksii.kurochko@gmail.com>
	 <46462554-f040-4c34-874d-2d0455707731@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-14 at 15:19 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/p2m.h
> > @@ -0,0 +1,105 @@
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
> > +typedef enum {
> > +=C2=A0=C2=A0=C2=A0 p2m_invalid =3D 0,=C2=A0=C2=A0=C2=A0 /* Nothing map=
ped here */
> > +=C2=A0=C2=A0=C2=A0 p2m_ram_rw,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /* Normal read/write guest RAM */
> > +=C2=A0=C2=A0=C2=A0 p2m_ram_ro,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /* Read-only; writes are silently dropped
> > */
> > +=C2=A0=C2=A0=C2=A0 p2m_mmio_direct_dev,/* Read/write mapping of genuin=
e Device
> > MMIO area */
> > +=C2=A0=C2=A0=C2=A0 p2m_mmio_direct_nc, /* Read/write mapping of genuin=
e MMIO area
> > non-cacheable */
> > +=C2=A0=C2=A0=C2=A0 p2m_mmio_direct_c,=C2=A0 /* Read/write mapping of g=
enuine MMIO area
> > cacheable */
> > +=C2=A0=C2=A0=C2=A0 p2m_map_foreign_rw, /* Read/write RAM pages from fo=
reign
> > domain */
> > +=C2=A0=C2=A0=C2=A0 p2m_map_foreign_ro, /* Read-only RAM pages from for=
eign domain
> > */
> > +=C2=A0=C2=A0=C2=A0 p2m_grant_map_rw,=C2=A0=C2=A0 /* Read/write grant m=
apping */
> > +=C2=A0=C2=A0=C2=A0 p2m_grant_map_ro,=C2=A0=C2=A0 /* Read-only grant ma=
pping */
> > +=C2=A0=C2=A0=C2=A0 /* The types below are only used to decide the page=
 attribute
> > in the P2M */
> > +=C2=A0=C2=A0=C2=A0 p2m_iommu_map_rw,=C2=A0=C2=A0 /* Read/write iommu m=
apping */
> > +=C2=A0=C2=A0=C2=A0 p2m_iommu_map_ro,=C2=A0=C2=A0 /* Read-only iommu ma=
pping */
> > +=C2=A0=C2=A0=C2=A0 p2m_max_real_type,=C2=A0 /* Types after this won't =
be store in the
> > p2m */
> > +} p2m_type_t;
>=20
> As indicated before, I think you should have only those types here
> which
> you're sure you'll need, or even just those which you really need
> right
> away. I question in particular p2m_mmio_direct_*, which all look like
> you simply took them from Arm, without regard as to applicability to
> RISC-V. The fewer types you have here, the easier it is going to be
> to
> tell what needs adding and what is already _properly_ supported.
Agreed. I have to leave only the ones that are necessary for now.
I'll update that.

>=20
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
> > +=C2=A0=C2=A0=C2=A0 return 1;
> > +}
>=20
> Imo despite the BUG() any such stub would better return failure, just
> like ...
Thanks. I'll update that.

>=20
> > +/* Look up a GFN and take a reference count on the backing page.
> > */
> > +typedef unsigned int p2m_query_t;
> > +#define P2M_ALLOC=C2=A0=C2=A0=C2=A0 (1u<<0)=C2=A0=C2=A0 /* Populate Po=
D and paged-out
> > entries */
> > +#define P2M_UNSHARE=C2=A0 (1u<<1)=C2=A0=C2=A0 /* Break CoW sharing */
> > +
> > +static inline struct page_info *get_page_from_gfn(
> > +=C2=A0=C2=A0=C2=A0 struct domain *d, unsigned long gfn, p2m_type_t *t,
> > p2m_query_t q)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +=C2=A0=C2=A0=C2=A0 return NULL;
> > +}
>=20
> ... you do here. May apply again further down.
>=20
> > +static inline void memory_type_changed(struct domain *d)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +
> > +static inline int guest_physmap_mark_populate_on_demand(struct
> > domain *d, unsigned long gfn,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned
> > int order)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +=C2=A0=C2=A0=C2=A0 return 1;
> > +}
> > +
> > +static inline int guest_physmap_add_entry(struct domain *d,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 gfn_t gfn,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 mfn_t mfn,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned long page_order,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 p2m_type_t t)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +=C2=A0=C2=A0=C2=A0 return 1;
> > +}
> > +
> > +/* Untyped version for RAM only, for compatibility */
> > +static inline int __must_check
> > +guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned in=
t page_order)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return guest_physmap_add_entry(d, gfn, mfn, page_or=
der,
> > p2m_ram_rw);
> > +}
> > +
> > +static inline mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +=C2=A0=C2=A0=C2=A0 return _mfn(0);
> > +}
> > +
> > +static inline bool arch_acquire_resource_check(struct domain *d)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * The reference counting of foreign entries i=
n
> > set_foreign_p2m_entry()
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * is supported on RISCV.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 return true;
> > +}
> > +
> > +static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* Not supported on RISCV. */
> > +}
> > +
> > +#endif /* __ASM_RISCV_P2M_H__ */
> > \ No newline at end of file
>=20
> This wants taking care of.
Thanks. I'll update that.

~ Oleksii


