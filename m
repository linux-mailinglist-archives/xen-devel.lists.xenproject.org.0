Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863B295206B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 18:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777572.1187691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seHCf-0006xb-4O; Wed, 14 Aug 2024 16:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777572.1187691; Wed, 14 Aug 2024 16:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seHCf-0006vD-15; Wed, 14 Aug 2024 16:50:29 +0000
Received: by outflank-mailman (input) for mailman id 777572;
 Wed, 14 Aug 2024 16:50:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0xrl=PN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1seHCc-0006v7-TT
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 16:50:27 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d9cbf07-5a5d-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 18:50:25 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ef2fccca2cso1142211fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 09:50:25 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f29203d91fsm14650071fa.75.2024.08.14.09.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 09:50:23 -0700 (PDT)
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
X-Inumbo-ID: 4d9cbf07-5a5d-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723654225; x=1724259025; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jQR72WMZPvn20RiqCGzoSu3A2DlQLWElPxEI3Ve7zSM=;
        b=LfE+gT9aL5Y2ghfYUGre3RpxBlqd31i53ye0V+V2tZclirTXBmtNNI6ZImxzZRs/eW
         SbrbfTWCwLh0iISSwSXwjNCQhywuUF+hlaDWFYUxsIlSftb3o44zmRrkztbXbpV7jSZV
         UJXRR3L3xuEEkGPwQYQGM5xZ+gQAVa991MWV141fgMh0F1Exvo2GT5/Z+3zjyR0KMlPg
         fLgdWRdRibLkUwNCKgXvMJidjN1LmlZGztJIO3Nxlv+gBSgFqY/mleGbxEEiVz+FlEdR
         VCW2ZhuS1L10WsKRhxOrjNVJ53hPfRC+3dxhLeyLJ2ac9IBr1w7DE0fUgyIxeMYYYDiP
         otRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723654225; x=1724259025;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jQR72WMZPvn20RiqCGzoSu3A2DlQLWElPxEI3Ve7zSM=;
        b=wvryluJfIBIKZfZ1ym9m1gbX7DmzOUqqvESAn3xi9vyEY1nZEOpkRvK0plW/Y4gD2c
         GZ5rzvMF64yVFk5TMEC62lRnsgH0MFnDAXxhs7pB3E3l0IuQRPSKx4bSoFsO7AR9XTJG
         pVYE5cXloT6DWp1LiTN9bnr6B4OQgZnnMrnHI1WjZRhiqsUxtzhzmAELW6mg+KM64aFE
         lpH342D/TlOvGm3fcd4vAlkwCE985ScdO7k+aTVfLC01jvqo0gjIdq+Qkkkf+dDFiKTb
         OF5QmVAE8tvA6acnEVlmQiO7YWg3mEMZ1pSH5FH3lLw74ne2wIaPn9dOgBxgNw3CbwnV
         Dn4g==
X-Forwarded-Encrypted: i=1; AJvYcCVFSn3tHtelC+SuHVj9nJqOyKaAinHsD1ksQKphbL+eUKAU2irkCXhMMiTjSvw4OWtyIn8w92vlfeJ13ueY/8/AV0W8Sh0vL0sXVSFqArQ=
X-Gm-Message-State: AOJu0Yz87sDlDPAFMhmiGcKDYE8ywN0x1FR1fxY3q+ibbwWRF4li83KC
	f9OrqCm8Q/1zpIG22sQ5FXvNj1p/JipLGw8cEaMBczAZrQkc0TLo
X-Google-Smtp-Source: AGHT+IFm61ScQ+Adr0dVrYHsWiPYY+PIrpuTvFYD68saHs/LyT8qrinP9SvF42T0hmnbpR7TGc3Zvg==
X-Received: by 2002:a05:651c:19ac:b0:2ef:1db2:c02a with SMTP id 38308e7fff4ca-2f3aa1a5766mr24921641fa.6.1723654224155;
        Wed, 14 Aug 2024 09:50:24 -0700 (PDT)
Message-ID: <1e83981cff0b6c47aa941e7ffee0ce658aefef22.camel@gmail.com>
Subject: Re: [PATCH v4 6/7] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 14 Aug 2024 18:50:22 +0200
In-Reply-To: <85a4e760-07af-42bd-ac27-12a4fa5172cc@suse.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
	 <8362795280a48702bef6f01d41d148edcf299935.1723214540.git.oleksii.kurochko@gmail.com>
	 <85a4e760-07af-42bd-ac27-12a4fa5172cc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-08-13 at 12:31 +0200, Jan Beulich wrote:
> On 09.08.2024 18:19, Oleksii Kurochko wrote:
> > Implement map_pages_to_xen() which requires several
> > functions to manage page tables and entries:
> > - pt_update()
> > - pt_mapping_level()
> > - pt_update_entry()
> > - pt_next_level()
> > - pt_check_entry()
> >=20
> > To support these operations, add functions for creating,
> > mapping, and unmapping Xen tables:
> > - create_xen_table()
> > - xen_map_table()
> > - xen_unmap_table()
>=20
> I think I commented on this before: Everything is "Xen" in hypervisor
> code. What I think you mean is to map/unmap Xen's own page tables.
> Naming-wise that would be {,un}map_xen_table(), though. Since they
> are static, just {,un}map_table() ought to be unambiguous, too.
I thought that your comment was about pt_*() functions but thanks for
explanation again.

>=20
> > Introduce internal macros starting with PTE_* for convenience.
> > These macros closely resemble PTE bits, with the exception of
> > PTE_BLOCK, which indicates that a page larger than 4KB is
> > needed.
>=20
> I did comment on this too, iirc: Is there going to be any case where
> large pages are going to be "needed", i.e. not just preferred? If
> not,
> giving the caller control over things the other way around
> (requesting
> 4k mappings are needed, as we have it in x86) may be preferable.
Yes, you did the comment but I thought that it will be enough to
mention that shattering isn't supported now and  also since
pt_update_entry()is used to unmap as well, there could be a need to
unmap e.g. 4K page from 2M block mapping what will a little bit harder
then just having 4k by default.

>=20
> Hmm, but then ...
>=20
> > RISC-V detects superpages using `pte.x` and `pte.r`, as there
> > is no specific bit in the PTE for this purpose. From the RISC-V
> > spec:
> > ```
> > =C2=A0 ...
> > =C2=A0 4. Otherwise, the PTE is valid. If pte.r =3D 1 or pte.x =3D 1, g=
o to
> > step 5.
> > =C2=A0=C2=A0=C2=A0=C2=A0 Otherwise, this PTE is a pointer to the next l=
evel of the page
> > table.
> > =C2=A0=C2=A0=C2=A0=C2=A0 ... .
> > =C2=A0 5. A leaf PTE has been found.
> > =C2=A0=C2=A0=C2=A0=C2=A0 ...
> > =C2=A0 ...
> > ```
> >=20
> > The code doesn=E2=80=99t support super page shattering so 4KB pages are
> > used as
> > default.
>=20
> ... you have this. Yet still callers expecting re-mapping in the
> (large)
> range they map can request small-page mappings right away.
I am not sure that I fully understand what do you mean by "expcting re-
mapping".

>=20
> > --- a/xen/arch/riscv/include/asm/flushtlb.h
> > +++ b/xen/arch/riscv/include/asm/flushtlb.h
> > @@ -5,12 +5,25 @@
> > =C2=A0#include <xen/bug.h>
> > =C2=A0#include <xen/cpumask.h>
> > =C2=A0
> > +#include <asm/sbi.h>
> > +
> > =C2=A0/* Flush TLB of local processor for address va. */
> > =C2=A0static inline void flush_tlb_one_local(vaddr_t va)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ( "sfence.vma %0" :: "r" (va) : "=
memory" );
> > =C2=A0}
> > =C2=A0
> > +/*
> > + * Flush a range of VA's hypervisor mappings from the TLB of all
> > + * processors in the inner-shareable domain.
> > + */
> > +static inline void flush_tlb_range_va(vaddr_t va,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 size_t size)
>=20
> No need for line wrapping here?
What is line wrapping here? Do you mean that size_t size should be on
the previous line?

>=20
> > @@ -33,15 +38,72 @@
> > =C2=A0#define PTE_LEAF_DEFAULT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (PTE_VALID | PTE_READABLE |
> > PTE_WRITABLE)
> > =C2=A0#define PTE_TABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (PTE_VALID)
> > =C2=A0
> > +#define PAGE_HYPERVISOR_RO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (PTE_VALID | PTE_READABLE)
> > =C2=A0#define PAGE_HYPERVISOR_RW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (PTE_VALID | PTE_READABLE |
> > PTE_WRITABLE)
> > +#define PAGE_HYPERVISOR_RX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (PTE_VALID | PTE_READABLE |
> > PTE_EXECUTABLE)
> > =C2=A0
> > =C2=A0#define PAGE_HYPERVISOR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_HYPERVISOR_RW
> > =C2=A0
> > +
> > +/*
>=20
> Nit: As before, no double blank lines please.
>=20
> > + * There are no such bits in PTE format for RISC-V.
>=20
> This is an odd way to start a comment: There's nothing for "such" to
> refer
> to.
>=20
> > + * The code doesn=E2=80=99t support super page shattering so at the mo=
ment
> > superpages
> > + * can't be used as a default so PTE_BLOCK is introduced to have
> > ability to
> > + * tell that superpage should be allocated.
> > + * Additionaly as mentioed in RISC-V priviliged spec:
> > + * ```
> > + *=C2=A0 After much deliberation, we have settled on a conventional
> > page size of
> > + *=C2=A0 4 KiB for both RV32 and RV64. We expect this decision to ease
> > the porting
> > + *=C2=A0 of low-level runtime software and device drivers.
> > + *
> > + *=C2=A0 The TLB reach problem is ameliorated by transparent superpage
> > support in
> > + *=C2=A0 modern operating systems [2]. Additionally, multi-level TLB
> > hierarchies
> > + *=C2=A0 are quite inexpensive relative to the multi-level cache
> > hierarchies whose
> > + *=C2=A0 address space they map.
> > + *
> > + *=C2=A0 [2] Juan Navarro, Sitaram Iyer, Peter Druschel, and Alan Cox.
> > Practical,
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 transparent operating system support =
for superpages.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SIGOPS Oper. Syst. Rev., 36(SI):89=E2=
=80=93104, December 2002.
> > + * ```
> > + *
> > + * PTE_POPULATE is introduced to have ability to tell that page
> > tables
> > + * shoud be populated.
> > + */
> > +#define PTE_BLOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(10, UL)
> > +#define PTE_POPULATE=C2=A0=C2=A0=C2=A0 BIT(11, UL)
> > +
> > +#define PTE_R_MASK(x)=C2=A0=C2=A0 ((x) & PTE_READABLE)
> > +#define PTE_W_MASK(x)=C2=A0=C2=A0 ((x) & PTE_WRITABLE)
> > +#define PTE_X_MASK(x)=C2=A0=C2=A0 ((x) & PTE_EXECUTABLE)
> > +
> > +#define PTE_RWX_MASK(x) ((x) & (PTE_READABLE | PTE_WRITABLE |
> > PTE_EXECUTABLE))
> > +
> > =C2=A0/* Calculate the offsets into the pagetables for a given VA */
> > =C2=A0#define pt_linear_offset(lvl, va)=C2=A0=C2=A0 ((va) >>
> > XEN_PT_LEVEL_SHIFT(lvl))
> > =C2=A0
> > =C2=A0#define pt_index(lvl, va) (pt_linear_offset((lvl), (va)) &
> > VPN_MASK)
> > =C2=A0
> > +#define TABLE_OFFSET(offs) (_AT(unsigned int, offs) & ((_AC(1, U)
> > << PAGETABLE_ORDER) - 1))
>=20
> Not: Too long line.
>=20
> > +#if RV_STAGE1_MODE > SATP_MODE_SV48
>=20
> SV48? Isn't ...
>=20
> > +#error "need to to update DECLARE_OFFSETS macros"
> > +#else
> > +
> > +#define l0_table_offset(va) TABLE_OFFSET(pt_linear_offset(0, va))
> > +#define l1_table_offset(va) TABLE_OFFSET(pt_linear_offset(1, va))
> > +#define l2_table_offset(va) TABLE_OFFSET(pt_linear_offset(2, va))
> > +
> > +/* Generate an array @var containing the offset for each level
> > from @addr */
> > +#define DECLARE_OFFSETS(var, addr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 const unsigned int var[] =3D {=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l0_table_offset(addr),=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l1_table_offset(addr),=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l2_table_offset(addr),=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
> > +=C2=A0=C2=A0=C2=A0 }
>=20
> ... this for SV39?
Agree, the check above isn't correct. It should be "RV_STAGE1_MODE >
SATP_MODE_SV39".


>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/pt.c
> > @@ -0,0 +1,408 @@
> > +#include <xen/bug.h>
> > +#include <xen/domain_page.h>
> > +#include <xen/errno.h>
> > +#include <xen/mm.h>
> > +#include <xen/mm-frame.h>
> > +#include <xen/pmap.h>
> > +#include <xen/spinlock.h>
> > +
> > +#include <asm/flushtlb.h>
> > +#include <asm/page.h>
> > +
> > +static inline const mfn_t get_root_page(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned long root_maddr =3D
>=20
> maddr_t or paddr_t?
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (csr_read(CSR_SATP) & SATP_=
PPN_MASK) << PAGE_SHIFT;
> > +
> > +=C2=A0=C2=A0=C2=A0 return maddr_to_mfn(root_maddr);
> > +}
> > +
> > +/*
> > + * Sanity check of the entry
> > + * mfn is not valid and we are not populating page table. This
> > means
>=20
> How does this fit with ...
>=20
> > + * we either modify entry or remove an entry.
> > + */
> > +static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int
> > flags)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* Sanity check when modifying an entry. */
> > +=C2=A0=C2=A0=C2=A0 if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN=
) )
>=20
> ... the MFN check here?
The comment is incorrect and should be corrected:
" if mfn is valid or ... "

>  And why is (valid,INVALID_MFN) an indication
> of a modification? But then ...
the explanation is in the comment to pt_update():
   /*
    * If `mfn` equals `INVALID_MFN`, it indicates that the following page
   table
    * update operation might be related to either populating the table,
    * destroying a mapping, or modifying an existing mapping.
    */
   static int pt_update(unsigned long virt,

>=20
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We don't allow modifying=
 an invalid entry. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(entry) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pri=
ntk("Modifying invalid entry is not allowed.\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn false;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> ... I also don't understand what this is about. IOW I'm afraid I'm
> still confused about the purpose of this function as well as the
> transitions you want to permit / reject. I wonder whether the
> flags & PTE_VALID and pte_is_valid(entry) aren't in need of swapping.
>=20
> > +/* Update an entry at the level @target. */
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
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * The intermediate page tables are read-only =
when the MFN is
> > not valid
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * and we are not populating page table.
>=20
> The way flags are handled in PTEs, how can page tables be read-only?
I started to be confused. Probably I have to re-write some code and
also drop almost the whole function xen_pt_check_entry().

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * This means we either modify permissions or =
remove an entry.
>=20
> From all I can determine we also get here when making brand new
> entries.
> What am I overlooking?
Nothing. then it means intermidiate page table won't be read-only.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 bool alloc_only =3D mfn_eq(mfn, INVALID_MFN) && !(f=
lags &
> > PTE_POPULATE);
> > +=C2=A0=C2=A0=C2=A0 pte_t pte, *entry;
> > +
> > +=C2=A0=C2=A0=C2=A0 /* convenience aliases */
> > +=C2=A0=C2=A0=C2=A0 DECLARE_OFFSETS(offsets, virt);
> > +
> > +=C2=A0=C2=A0=C2=A0 table =3D xen_map_table(root);
> > +=C2=A0=C2=A0=C2=A0 for ( ; level > target; level-- )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D pt_next_level(alloc_=
only, &table, offsets[level]);
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
=A0 * and the pt is read-only). It is a valid case when
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
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o out;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if ( rc !=3D XEN_TABLE=
_NORMAL )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( level !=3D target )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("%s: Shattering supe=
rpage is not supported\n",
> > __func__);
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
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memset(&pte, 0x00, sizeof(p=
te));
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
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte=
 =3D *entry;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* update permission accord=
ing to the flags */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte.pte |=3D PTE_RWX_MASK(f=
lags) | PTE_ACCESSED | PTE_DIRTY;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 write_pte(entry, pte);
> > +
> > +=C2=A0=C2=A0=C2=A0 rc =3D 0;
> > +
> > + out:
> > +=C2=A0=C2=A0=C2=A0 xen_unmap_table(table);
> > +
> > +=C2=A0=C2=A0=C2=A0 return rc;
> > +}
> > +
> > +static DEFINE_SPINLOCK(xen_pt_lock);
>=20
> If you put this in the middle of the file (which is fine), I think it
> wants putting immediately ahead of the (first) function using it, not
> at some seemingly random place.
>=20
> > +/*
> > + * If `mfn` equals `INVALID_MFN`, it indicates that the following
> > page table
> > + * update operation might be related to either populating the
> > table,
> > + * destroying a mapping, or modifying an existing mapping.
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
> > +=C2=A0=C2=A0=C2=A0 unsigned long vfn =3D virt >> PAGE_SHIFT;
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
> > +=C2=A0=C2=A0=C2=A0 if ( (flags & PTE_VALID) && PTE_W_MASK(flags) &&
> > PTE_X_MASK(flags) )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Mappings should not=
 be both Writeable and
> > Executable.\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( !IS_ALIGNED(virt, PAGE_SIZE) )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("The virtual address=
 is not aligned to the page-
> > size.\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 spin_lock(&xen_pt_lock);
> > +
> > +=C2=A0=C2=A0=C2=A0 while ( left )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int order, level;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 level =3D pt_mapping_level(=
vfn, mfn, left, flags);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 order =3D XEN_PT_LEVEL_ORDE=
R(level);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(left >=3D BIT(order,=
 UL));
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D pt_update_entry(root=
, vfn << PAGE_SHIFT, mfn, level,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags);
>=20
> Indentation.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vfn +=3D 1U << order;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !mfn_eq(mfn, INVALID_M=
FN) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn=
 =3D mfn_add(mfn, 1U << order);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 left -=3D (1U << order);
>=20
> To be on thje safe side, 1UL everywhere?
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
>=20
> There was such a check already a few lines up from here.
>=20
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +
> > +=C2=A0=C2=A0=C2=A0 /* ensure that PTEs are all updated before flushing=
 */
>=20
> Again: No double blank lines please.
>=20
> > +=C2=A0=C2=A0=C2=A0 RISCV_FENCE(rw, rw);
> > +
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * always flush TLB at the end of the function=
 as non-present
> > entries
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * can be put in the TLB
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 flush_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
>=20
> Coming back to "negative" TLB entries: Assuming RISC-V, just like
> other
> architectures, also permits intermediate page table entries to be
> cached,
> the affected VA range may be much larger than the original request,
> if
> intermediate page tables needed creating.
It could be an issue. Could we some how  to calculate the proper range
or the only option we have is to flush all.
   And for some reason it isn't an issue for Arm:
  =20
       /*
        * The TLBs flush can be safely skipped when a mapping is
   inserted
        * as we don't allow mapping replacement (see
   xen_pt_check_entry()).
        * Although we still need an ISB to ensure any DSB in
        * write_pte() will complete because the mapping may be used
   soon
        * after.
        *
        * For all the other cases, the TLBs will be flushed
   unconditionally
        * even if the mapping has failed. This is because we may have
        * partially modified the PT. This will prevent any unexpected
        * behavior afterwards.
        */
       if ( !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVALID_MFN)) )
           flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
       else
           isb();
  =20

>=20
> > +=C2=A0=C2=A0=C2=A0 spin_unlock(&xen_pt_lock);
>=20
> Does this really need to come after fence and flush?
I think yes, as page table should be updated only by 1 CPU at the same
time. And before give ability to other CPU to update page table we have
to finish a work on current CPU.

>=20
> > +=C2=A0=C2=A0=C2=A0 return rc;
> > +}
> > +
> > +int map_pages_to_xen(unsigned long virt,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_t mfn,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int flags)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /*
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
> > +=C2=A0=C2=A0=C2=A0 ASSERT(!mfn_eq(mfn, INVALID_MFN));
>=20
> But flags with PTE_VALID not set are fine to come into here?
It is fine for pt_update() but I don't know if it is fine for
map_pages_to_xen(). I see that other architectures don't check that.

~ Oleksii

>=20
> > +=C2=A0=C2=A0=C2=A0 return pt_update(virt, mfn, nr_mfns, flags);
> > +}
>=20
> Jan


