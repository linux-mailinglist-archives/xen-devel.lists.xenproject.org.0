Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFA5975677
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 17:10:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796751.1206508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soOyS-0005Fy-PH; Wed, 11 Sep 2024 15:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796751.1206508; Wed, 11 Sep 2024 15:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soOyS-0005EQ-Kg; Wed, 11 Sep 2024 15:09:40 +0000
Received: by outflank-mailman (input) for mailman id 796751;
 Wed, 11 Sep 2024 15:09:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TDmC=QJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1soOyQ-0005EK-Tb
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 15:09:39 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc9bdd06-704f-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 17:09:37 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-536584f6c84so7301187e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 08:09:37 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f903b05sm1613227e87.199.2024.09.11.08.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 08:09:36 -0700 (PDT)
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
X-Inumbo-ID: dc9bdd06-704f-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726067377; x=1726672177; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mzUxMhXbhYIMtxKGvc4KDlvwqcR2Z9vZzjpNi2lK6/Y=;
        b=TbAEg6PHunlnoyoAEAnlSkdr0CXpvodB4c8l/OXhnajSyuuwsJpXKQd3XfKKSoqxv6
         4icaFILd81HrD1kRwVNulfkckZ8yoHIoU1DJiLhoYOv7zmyla72xvAi9b9jwvI9G3vTL
         az7DIoFfHExiH0gEsF8MNopoHyQq1vgzsNQdT9RFq/DT3WD0cPshE5Ipf/tvxHhUha4L
         ZBAXvbgw/3Ma6QS1xYajNAgGu+RjpyDLd33xQO+9Q3tpJfZL5Kk5vWtWr1TZUBHj2kzH
         Wzntoc5xsMbigiBy9vhUjKvkb3gZOj7tKjyEUce9m7rwP0muRKiopmF6hyx9QlaL9ono
         kAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726067377; x=1726672177;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mzUxMhXbhYIMtxKGvc4KDlvwqcR2Z9vZzjpNi2lK6/Y=;
        b=V27OYAsQEEwkZpbrQUIph0gv3zaEMyOQXY93JO09Sji+EIgO8Y6PsZZjU2Z27bymjy
         yN0CZ3wqEkRpuuyn8n7fuanVEOAQt/WTENselfMv6bAm7yDCUnzjS3JaDLe/jpW4gCdM
         gv7qYuGskbNorljDIl2YRFfKBY9XxfmaoFFkQw+gSisWSAnXtw5TbP+tQ2nCriN6iHJF
         xh7sEbUhC8ZVTg8n1sWMJAVDevnwJ9IBNIUID54d/n70xMWHvB5f2zfpxkg4CqHPsr88
         xnFftk4hEZp/UYNJjTx7+JkYbHQNPWWMbuBFwd/7/lN0eNTqxEpLZKjrUWPnh8FIvc+9
         73zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWzgU6jZGXbz5BqXjE2wj1F9EHBHm/7hoj8hnqse56mRGOw5bhtp6s73q+7CBtIU07u+PiAF/8UjY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmVrBygNOgk8swpBhHX2JBiI3EN5vz4Sj/E1Gw36/fLGYRcCm/
	B/pnyO5H+DatCqQJsaOSJF6dN1VUykaRR3Aig3opv2CwQGTPAQqWlT21AQ==
X-Google-Smtp-Source: AGHT+IGAetXrW+9Xq1vXNkCoSTvszLVynqzxRYE+qpW9dR9sFEWIfDnZhGO1YO6L+i1oPOdGVXAw4A==
X-Received: by 2002:a05:6512:104b:b0:536:5625:511a with SMTP id 2adb3069b0e04-536587f82d0mr10786948e87.47.1726067376481;
        Wed, 11 Sep 2024 08:09:36 -0700 (PDT)
Message-ID: <3ecebcefea43905692e97e0354a0ed7058f5d612.camel@gmail.com>
Subject: Re: [PATCH v6 8/9] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 11 Sep 2024 17:09:35 +0200
In-Reply-To: <ec6b52ae-e75d-4f24-a1da-b7f7fbe0bacc@suse.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
	 <7ebcc10fbea81ff59b24edc962bdc401dd73ee82.1725295716.git.oleksii.kurochko@gmail.com>
	 <ec6b52ae-e75d-4f24-a1da-b7f7fbe0bacc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

> > +/*
> > + * The PTE format does not contain the following bits within
> > itself;
> > + * they are created artificially to inform the Xen page table
> > + * handling algorithm. These bits should not be explicitly written
> > + * to the PTE entry.
> > + */
> > +#define PTE_SMALL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(10, UL)
> > +#define PTE_POPULATE=C2=A0=C2=A0=C2=A0 BIT(11, UL)
> > +
> > +#define PTE_XWV_BITS=C2=A0=C2=A0=C2=A0 (PTE_WRITABLE | PTE_EXECUTABLE =
|
> > PTE_VALID)
> > +#define PTE_XWV_MASK(x) ((x) & PTE_XWV_BITS)
> > +#define PTE_RWX_MASK(x) ((x) & (PTE_READABLE | PTE_WRITABLE |
> > PTE_EXECUTABLE))
>=20
> I think I commented on *_MASK macros before: They are conventionally
> constants (see e.g. PAGETABLE_ORDER_MASK that you have further down),
> not operations on an input. It's not really clear to me what the
> "mask" in this name is meant to signify as to what the macros are
> doing. I seem to vaguely recall that you indicated you'd drop all
> such helpers, in favor of using respective constants directly at use
> sites.
Regarding *_MASK I wrote about PTE_{R,W,X}_MASK ( which were dropped
becuase they were used only once ) and by MASK here I mean that only
some bits are going to be taken. For example, PTE_XWV_MASK() means that
only eXecute, Write and Valid bits will be taken. Probably EXTR (
extract ) would be better to use instead of EXTR.

>=20
> As a less significant (because of being a matter of personal taste to
> a fair degree) aspect: XWV is a pretty random sequence of characters.
> I for one wouldn't remember what order they need to be used in, and
> hence would always need to look this up.
I used that letter as  they are used by RISC-V spec.

>=20
> Taken together, what about
>=20
> #define PTE_LEAF_MASK=C2=A0=C2=A0 (PTE_WRITABLE | PTE_EXECUTABLE | PTE_VA=
LID)
> #define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE |
> PTE_EXECUTABLE)
>=20
> ?
Looks good to me. I will use them. Thanks for the naming and
clarification.

>=20
> > @@ -68,6 +109,37 @@ static inline bool pte_is_valid(pte_t p)
> > =C2=A0=C2=A0=C2=A0=C2=A0 return p.pte & PTE_VALID;
> > =C2=A0}
> > =C2=A0
> > +/*
> > + * From the RISC-V spec:
> > + *=C2=A0=C2=A0=C2=A0 Table 4.5 summarizes the encoding of the permissi=
on bits.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X W R Meaning
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 0 0 Pointer to next level of page t=
able.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 0 1 Read-only page.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 1 0 Reserved for future use.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 1 1 Read-write page.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 0 0 Execute-only page.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 0 1 Read-execute page.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 0 Reserved for future use.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 1 Read-write-execute page.
> > + */
> > +inline bool pte_is_table(const pte_t p)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return ((p.pte & (PTE_VALID |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PTE_READABLE |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PTE_WRITABLE |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PTE_EXECUTABLE)) =
=3D=3D PTE_VALID);
> > +}
> > +
> > +static inline bool pte_is_mapping(const pte_t p)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* W =3D 1 || (X=3D1 && W=3D1) -> Reserved for futu=
re use */
> > +=C2=A0=C2=A0=C2=A0 ASSERT((PTE_RWX_MASK(p.pte) !=3D PTE_WRITABLE) ||
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (PTE_RWX_=
MASK(p.pte) !=3D (PTE_WRITABLE |
> > PTE_EXECUTABLE)));
>=20
> I'm afraid I'm pretty unhappy with comments not matching the
> commented
> code: The comment mentions only set bits, but not clear ones.
I assumed that it would be clear that other bits should be 0 taking
into account the table above but I will update the comment to be more
precise.

>  Further
> you're missing a check of the V bit - with that clear, the other bits
> can be set whichever way. Taken together (and the spec also says it
> this way): If V=3D1 and W=3D1 then R also needs to be 1.
My intention was to check in the way how it is mentioned in the table
4.5. For example,
  0 1 0 Reserved for future use.
So I wanted to check that X=3DR=3D0 and W=3D1, I just confused myself with
that ASSERT(p) checks inside !p. I will update ASSERT() properly.

>=20
> Also - isn't this check equally relevant in pte_is_table()?
Missed that, it should be in pte_is_table() too.

>=20
> > --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> > +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> > @@ -164,6 +164,7 @@
> > =C2=A0#define SSTATUS_SD			SSTATUS64_SD
> > =C2=A0#define SATP_MODE			SATP64_MODE
> > =C2=A0#define SATP_MODE_SHIFT			SATP64_MODE_SHIFT
> > +#define SATP_PPN_MASK			_UL(0x00000FFFFFFFFFFF)
>=20
> Why not SATP64_PPN on the rhs? And why no similar #define in the
> #else
> block that follows, using SATP32_PPN?
>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/pt.c
> > @@ -0,0 +1,423 @@
> > +#include <xen/bug.h>
> > +#include <xen/domain_page.h>
> > +#include <xen/errno.h>
> > +#include <xen/lib.h>
> > +#include <xen/mm.h>
> > +#include <xen/mm-frame.h>
>=20
> I don#t think you need this when you already have xen/mm.h.
>=20
> > +#include <xen/pfn.h>
> > +#include <xen/pmap.h>
> > +#include <xen/spinlock.h>
> > +
> > +#include <asm/flushtlb.h>
> > +#include <asm/page.h>
> > +
> > +static inline const mfn_t get_root_page(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 paddr_t root_maddr =3D (csr_read(CSR_SATP) & SATP_P=
PN_MASK) <<
> > PAGE_SHIFT;
>=20
> Won't this lose bits in RV32 mode? IOW wouldn't you better avoid
> open-
> coding pfn_to_paddr() here?
Considering that PPN for RV32 mode is 22 bits then it will lose bits.
Anyway I agree that it would be better to use pfn_to_paddr().

>=20
> > +static int pt_update_entry(mfn_t root, unsigned long virt,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mfn_t mfn, unsigned int target,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned int flags)
> > +{
> > +=C2=A0=C2=A0=C2=A0 int rc;
> > +=C2=A0=C2=A0=C2=A0 unsigned int level =3D HYP_PT_ROOT_LEVEL;
> > +=C2=A0=C2=A0=C2=A0 pte_t *table;
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * The intermediate page table shouldn't be al=
located when MFN
> > isn't
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * valid and we are not populating page table.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * This means we either modify permissions or =
remove an entry,
> > or
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * inserting brand new entry.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * See the comment above pt_update() for an ad=
ditional
> > explanation about
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * combinations of (mfn, flags).
> > +=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 bool alloc_tbl =3D !mfn_eq(mfn, INVALID_MFN) || (fl=
ags &
> > PTE_POPULATE);
> > +=C2=A0=C2=A0=C2=A0 pte_t pte, *entry;
> > +
> > +=C2=A0=C2=A0=C2=A0 /* convenience aliases */
> > +=C2=A0=C2=A0=C2=A0 DECLARE_OFFSETS(offsets, virt);
> > +
> > +=C2=A0=C2=A0=C2=A0 table =3D map_table(root);
> > +=C2=A0=C2=A0=C2=A0 for ( ; level > target; level-- )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D pt_next_level(alloc_=
tbl, &table, offsets[level]);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc =3D=3D XEN_TABLE_MA=
P_FAILED )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =
=3D 0;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * We are here because pt_next_level has failed to map
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * the intermediate page table (e.g the table does not
> > exist
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * and the pt shouldn't be allocated). It is a valid
> > case when
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * removing a mapping as it may not exist in the page
> > table.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * In this case, just ignore it.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
( flags & PTE_VALID )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 printk("%s: Unable to map level %u\n", __func__,
> > level);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 rc =3D -ENOENT;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> Both comment and error code assume the !populate case. What about the
> case
> where the allocation failed? That's "couldn't be allocated" and would
> better
> return back -ENOMEM (as create_table() correctly returns in that
> case).
The condition should be updated here:
            if ( flags & (PTE_VALID|PTE_POPULATE) )
            {
                ...

>=20
> > +static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned
> > long nr,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned int flags)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned int level =3D 0;
> > +=C2=A0=C2=A0=C2=A0 unsigned long mask;
> > +=C2=A0=C2=A0=C2=A0 unsigned int i;
> > +
> > +=C2=A0=C2=A0=C2=A0 /* Use blocking mapping unless the caller requests =
4K mapping
> > */
> > +=C2=A0=C2=A0=C2=A0 if ( unlikely(flags & PTE_SMALL) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return level;
>=20
> Maybe "block mapping" in the comment? "Blocking" typically has quite
> different a meaning. I'm uncertain about that terminology anyway, as
> the spec doesn't use it.
You are right that the spec doesn't define how to call bigger then 4k
mapping so I just re-use terminology from Arm here. Probably it would
be better just to reword:
/* Use a larger mapping than 4K unless the caller specifically requests
a 4K mapping */

>=20
> > + * If `mfn` !=3D INVALID_MFN and flags has PTE_VALID bit set then it
> > means that
> > + * inserting will be done.
> > + */
> > +static int pt_update(unsigned long virt,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_t mfn,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int flags)
> > +{
> > +=C2=A0=C2=A0=C2=A0 int rc =3D 0;
> > +=C2=A0=C2=A0=C2=A0 unsigned long vfn =3D PFN_DOWN(virt);
> > +=C2=A0=C2=A0=C2=A0 unsigned long left =3D nr_mfns;
> > +
> > +=C2=A0=C2=A0=C2=A0 const mfn_t root =3D get_root_page();
> > +
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * It is bad idea to have mapping both writeab=
le and
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * executable.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * When modifying/creating mapping (i.e PTE_VA=
LID is set),
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * prevent any update if this happen.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 if ( PTE_XWV_MASK(flags) =3D=3D PTE_XWV_BITS )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Mappings should not=
 be both Writeable and
> > Executable.\n");
>=20
> I'm pretty sure I asked before that you omit full stops from log
> messages.
Yes, you asked and I think that even in this place. Just overlooked
that it was a lot of comments to the previous patch version. Sorry for
that.

>=20
> > +int map_pages_to_xen(unsigned long virt,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_t mfn,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int flags)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * Ensure that flags has PTE_VALID bit as map_=
pages_to_xen()
> > is supposed
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * to create a mapping.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * Ensure that we have a valid MFN before proc=
eeding.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * If the MFN is invalid, pt_update() might mi=
sinterpret the
> > operation,
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * treating it as either a population, a mappi=
ng destruction,
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * or a mapping modification.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 ASSERT(!mfn_eq(mfn, INVALID_MFN) || (flags & PTE_VA=
LID));
>=20
> Judging from the comment, do you mean && instead of || ?
Yes, it should be &&.

Thanks.

~ Oleksii



