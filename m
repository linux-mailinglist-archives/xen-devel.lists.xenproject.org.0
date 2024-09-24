Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DECF79844A6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 13:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802637.1212943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st3kv-0005WI-6e; Tue, 24 Sep 2024 11:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802637.1212943; Tue, 24 Sep 2024 11:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st3kv-0005T9-32; Tue, 24 Sep 2024 11:30:57 +0000
Received: by outflank-mailman (input) for mailman id 802637;
 Tue, 24 Sep 2024 11:30:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vi3U=QW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1st3kt-0005T3-Hn
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 11:30:55 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75e609f6-7a68-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 13:30:54 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so894763966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 04:30:54 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f4f86dsm72926266b.51.2024.09.24.04.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 04:30:52 -0700 (PDT)
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
X-Inumbo-ID: 75e609f6-7a68-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727177454; x=1727782254; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ffnn9wpinXeqHklXTtSivfDr+OGvzPe4bwLzSrVoPTI=;
        b=A5sgYE3HZska/TFmtnPby4UyNjM2IIf0JEI7bgebXI9AE8MlMGKT1lu5x9Ia8ZttiW
         A467V/7lIiZwBuVTp0vhL12FTViRbkNd9QKfS3C8eUvPfwgFrord0aVYmEAtKs0ISGkP
         LNkBl7ZNFIe8Yf5Y7MiwQilfpkuAemLPw84NN+/V6uCNcYy+J4Y4V4irxQAQtHuJ6r8Q
         BlvkerxtuRe8KYG9ZVcNH4fC9NhBilJ7J0O0zayB+QHgKrN9xU+6lQsJSehoeSAtgRFm
         EDNKKRjuXs5X9n1fBu1rpwbZwawEvOp6t2AY79XnoggxYdlam1/PtDGp5Xlk9cM7CYbb
         HY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727177454; x=1727782254;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ffnn9wpinXeqHklXTtSivfDr+OGvzPe4bwLzSrVoPTI=;
        b=I6ke5XL1JIgFZEgbTtkEakB0GUqTGj9Jq5Lqgssx8bMyE4mfUhJfDl1M3CYS4Uqe6e
         gCH7tuykX8drI4NTjUbrVcLHqQSvHVN4MmI9bEXiw/On+LLkkVZn7Zo17nhyjrmaEZ59
         UiOPWCA8aAEHPbnURkKwlZ5nm9ywCiUn1L96pbrQpZiGd1AuZGW476KYDjCNzF+VtXlY
         Op85p/LOGVbZxT8RBNPnchK/4AIeI/fMBT4iot5DQk69ElnX+pZi60owQ9dtuKEwj4sC
         Oq2CXLdQwR2bUQtXhTiPyrrpCM9b6TzhjblWDH7uZZXSkgytwxu7inAGfGFy4xozGtE5
         Z+kA==
X-Forwarded-Encrypted: i=1; AJvYcCXK2/W68ceZnGeEFrdnfNsDRkypcdrJsAWqHtX0SXdCyMaQeurlRmA5rTp/Psuvn5GNbbmOtj/pXL4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywb1CLtdwU7gkRn2bVc6VBKSFoslwzrP75xTUT8AmM8kt7huNTA
	Wxu4Sg7lRV+ghiQrM3aF0Fx338pITV8jdX6cwQupHrz2wkHWMRobaAv48w==
X-Google-Smtp-Source: AGHT+IGD/IUNYs/reNwQp8rgVFMJUUZ/LEQvmjkY5bHh5sKJlq5fLjKgnGHelpYcWnnzwaZbyNxwwA==
X-Received: by 2002:a17:907:e283:b0:a8b:c9d4:5cef with SMTP id a640c23a62f3a-a90d5033e75mr1362503966b.29.1727177453655;
        Tue, 24 Sep 2024 04:30:53 -0700 (PDT)
Message-ID: <fc23fbd82c1495e75fc0bdcfa894cdb56262b11b.camel@gmail.com>
Subject: Re: [PATCH v7 7/8] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2024 13:30:52 +0200
In-Reply-To: <6100a4e0-5bf3-4555-90ae-20624171ff79@suse.com>
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
	 <582c4cee40222e80faf1e465c011b07eeaf2c19f.1726242605.git.oleksii.kurochko@gmail.com>
	 <6100a4e0-5bf3-4555-90ae-20624171ff79@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-09-24 at 12:49 +0200, Jan Beulich wrote:
> On 13.09.2024 17:57, Oleksii Kurochko wrote:
>=20
>=20
> > @@ -68,6 +108,52 @@ static inline bool pte_is_valid(pte_t p)
> > =C2=A0=C2=A0=C2=A0=C2=A0 return p.pte & PTE_VALID;
> > =C2=A0}
> > =C2=A0
> > +/*
> > + * From the RISC-V spec:
> > + *=C2=A0=C2=A0 The V bit indicates whether the PTE is valid; if it is =
0, all
> > other bits
> > + *=C2=A0=C2=A0 in the PTE are don=E2=80=99t-cares and may be used free=
ly by
> > software.
> > + *
> > + *=C2=A0=C2=A0 If V=3D1 the encoding of PTE R/W/X bits could be find i=
n Table
> > 4.5.
>=20
> Please avoid using table numbers when not also specifying the precise
> doc
> version. Numbering changes, and it's table 5.5 in the doc I'm looking
> at.
> Use table names instead (also elsewhere of course).
>=20
> > + *=C2=A0=C2=A0 Table 4.5 summarizes the encoding of the permission bit=
s.
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
>=20
> Missing static?
static is missed. I'll add it, thanks.

>=20
> We normally omit "const" on function arguments; the frequent request
> to add
> missing const is on pointed-to types. If you still want to have it,
> ...
>=20
> > +{
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * According to the spec if V=3D1 and W=3D1 th=
en R also needs to
> > be 1 as
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * R =3D 0 is reserved for future use ( look a=
t the Table 4.5 )
> > so check
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * in ASSERT that if (V=3D=3D1 && W=3D=3D1) th=
en R isn't 0.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * PAGE_HYPERVISOR_RW contains PTE_VALID too.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 ASSERT(((p.pte & PAGE_HYPERVISOR_RW) !=3D (PTE_VALI=
D |
> > PTE_WRITABLE)));
> > +
> > +=C2=A0=C2=A0=C2=A0 return ((p.pte & (PTE_VALID | PTE_ACCESS_MASK)) =3D=
=3D PTE_VALID);
> > +}
> > +
> > +static inline bool pte_is_mapping(/*const*/ pte_t p)
>=20
> ... I wonder why it's then commented out here.
I just experimented and missed to uncomment it. If "const" could be
omit for none pointed-to types then I prefer to drop const here and in
pte_is_table().

> > +#define XEN_TABLE_MAP_FAILED 0
> > +#define XEN_TABLE_SUPER_PAGE 1
> > +#define XEN_TABLE_NORMAL 2
> > +
> > +/*
> > + * Take the currently mapped table, find the corresponding entry,
> > + * and map the next table, if available.
> > + *
> > + * The alloc_tbl parameters indicates whether intermediate tables
> > should
> > + * be allocated when not present.
> > + *
> > + * Return values:
> > + *=C2=A0 XEN_TABLE_MAP_FAILED: Either alloc_only was set and the entry
> > + *=C2=A0 was empty, or allocating a new page failed.
> > + *=C2=A0 XEN_TABLE_NORMAL: next level or leaf mapped normally
> > + *=C2=A0 XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.
> > + */
> > +static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned
> > int offset)
> > +{
> > +=C2=A0=C2=A0=C2=A0 pte_t *entry;
> > +=C2=A0=C2=A0=C2=A0 mfn_t mfn;
> > +
> > +=C2=A0=C2=A0=C2=A0 entry =3D *table + offset;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(*entry) )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !alloc_tbl )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn XEN_TABLE_MAP_FAILED;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( create_table(entry) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn XEN_TABLE_MAP_FAILED;
>=20
> You're still losing the -ENOMEM here.
Agree, I will save the return value of create_table and return it.

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D -EOPNOTSUPP;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 entry =3D table + offsets[level];
> > +
> > +=C2=A0=C2=A0=C2=A0 rc =3D -EINVAL;
> > +=C2=A0=C2=A0=C2=A0 if ( !pt_check_entry(*entry, mfn, flags) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
> > +
> > +=C2=A0=C2=A0=C2=A0 /* We are removing the page */
> > +=C2=A0=C2=A0=C2=A0 if ( !(flags & PTE_VALID) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * there is also a che=
ck in pt_check_entry() which check
> > that
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * mfn=3DINVALID_MFN
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>=20
> Nit: Comments are to start with a capital letter.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte.pte =3D 0;
> > +=C2=A0=C2=A0=C2=A0 else
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We are inserting a mappi=
ng =3D> Create new pte. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !mfn_eq(mfn, INVALID_M=
FN) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte=
 =3D pte_from_mfn(mfn, PTE_VALID);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else /* We are updating the=
 permission =3D> Copy the current
> > pte. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte=
 =3D *entry;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte=
.pte &=3D ~(flags & PTE_ACCESS_MASK);
>=20
> Why does "flags" need using here? Simply clearing all PTE_ACCESS_MASK
> bits
> will do, won't it? And only that will guarantee that flags which are
> to be
> clear will actually be cleared.
Agree, there is no any necessity for using "flags" here, they should be
dropped.

>=20
> > +/*
> > + * If `mfn` equals `INVALID_MFN`, it indicates that the following
> > page table
> > + * update operation might be related to either:
> > + *=C2=A0=C2=A0 - populating the table (PTE_POPULATE will be set
> > additionaly),
> > + *=C2=A0=C2=A0 - destroying a mapping (PTE_VALID=3D0),
> > + *=C2=A0=C2=A0 - modifying an existing mapping (PTE_VALID=3D1).
> > + *
> > + * If `mfn` !=3D INVALID_MFN and flags has PTE_VALID bit set then it
> > means that
> > + * inserting will be done.
> > + */
> > +static int pt_update(unsigned long virt,
>=20
> Don't you have vaddr_t for variables/parameters like this one?
Yes, I have. I will update update this and re-check other places.

>=20
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
>=20
> Why the blank line between adjacent declarations?
No specific reason, just wanted to group variables by usage ( but then
it should be one blank after rc ).
But I will just drop the blank for consistency with other local
variable of other functions.

~ Oleksii


