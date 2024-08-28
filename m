Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C262962D5B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 18:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784995.1194411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjLHG-0006jG-Lv; Wed, 28 Aug 2024 16:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784995.1194411; Wed, 28 Aug 2024 16:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjLHG-0006h8-Ig; Wed, 28 Aug 2024 16:12:10 +0000
Received: by outflank-mailman (input) for mailman id 784995;
 Wed, 28 Aug 2024 16:12:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3BgB=P3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sjLHF-0006h0-OX
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 16:12:09 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 413faff4-6558-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 18:11:59 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-533488ffaddso8452661e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 09:11:59 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334ea5d2e6sm2210059e87.191.2024.08.28.09.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 09:11:58 -0700 (PDT)
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
X-Inumbo-ID: 413faff4-6558-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724861519; x=1725466319; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=avBjpsSY3UaFLOZlShl6YtYSFJebiMm7jV8zSyEbyY0=;
        b=LIydCsg5XpvVbvohVQU+WkJgjLkTGBuhLFrjiTyofTpImmfpLKAOts0Gymp5Dr4ETF
         zQgo3SzcoED/o0YWNRQ3o9xXfQa+zb3o7E6k+FhvgfYQG1LjFXHx0761xaA9DqHNDD6e
         KFfPPj7IN5bbJZbmViHALLSKPRX1SAk9S2iJpzu3zqjYKzGXn7kTGO/3ar4q04QXUCUR
         UH9N6WiYKe+obg6Ft101VkbzEtc3Ge/7ZdHGzBokaHI3r7SrRYiZHElq86dAzao4Lx/W
         iDBmUhUUvOIUyxqWb8/pP9PGMfByAFyo/DtDTlg+z9SFHef34iPfOwqgOSFDveGanSOZ
         sTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724861519; x=1725466319;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=avBjpsSY3UaFLOZlShl6YtYSFJebiMm7jV8zSyEbyY0=;
        b=vyoFCIB7KigIqYkHGRMfVmjSk64y9XRwBoMi9bcAJ60zF1qU9NffM+FKs/pGH4LqJk
         DCbycusH0rdtffPLCJy1iHTebhbsDOgh6MJYfzUSU1XdVBQQgnAEMxwLY8ezCOLFwcUr
         b670TqMytlQn1LsEKr/B/fnjg58RZaZdU/nEm5+KA2Mw7wo8bkWE37sCs11Z8DBQ8NzG
         tJwk234TMCi5xbxp5ymIIod432CaJFDv6cyQj8m8iYVESFZNT7VFtu84F8OeZS2tTx2y
         HOBbSSPAIn5XOWDh+P86B0SKHBKVTja5GVY4WpVOQZx8jczyPYelKrHY+Lp/WmIi0c5L
         lRSQ==
X-Forwarded-Encrypted: i=1; AJvYcCULg0yDhFIACFZLHGDhT8q3sWgp4OkarHEkBB4C6LJqG6q6FVzkFwVwbcoJK+S21iyfwXJz6vgUhdE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZzJbwcgM36sRUK9A+2Zbppj7Qyrq+66MCNfKEkeiHp/fBKXAO
	s0g2UdQmq0CFhk5UNpCkpjFmr2H6SmRPSJczCT7fLKn/JoKwIAVmRbXrfw==
X-Google-Smtp-Source: AGHT+IFvbvmxhrfi7xvV1pShoa0AVP0sn5NlYndekHZzLNoDt8z4QASJdtEFAuTQOQvEhq6Cguz6Mg==
X-Received: by 2002:a05:6512:68f:b0:533:71f:3a53 with SMTP id 2adb3069b0e04-5343877889amr12922406e87.19.1724861518378;
        Wed, 28 Aug 2024 09:11:58 -0700 (PDT)
Message-ID: <ed84c53454cb63082aa96befe89a89d8f234ef71.camel@gmail.com>
Subject: Re: [PATCH v5 6/7] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 28 Aug 2024 18:11:57 +0200
In-Reply-To: <c0005454-3b34-427d-8ea0-620aba632487@suse.com>
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
	 <090e617d88b279ae88f1a7859875a7e1a0c6ae73.1724256027.git.oleksii.kurochko@gmail.com>
	 <c0005454-3b34-427d-8ea0-620aba632487@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-08-27 at 17:00 +0200, Jan Beulich wrote:
> On 21.08.2024 18:06, Oleksii Kurochko wrote:
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
> > - create_table()
> > - map_table()
> > - unmap_table()
> >=20
> > Introduce internal macros starting with PTE_* for convenience.
> > These macros closely resemble PTE bits, with the exception of
> > PTE_SMALL, which indicates that 4KB is needed.
>=20
> What macros are you talking about here? Is this partially stale, as
> only PTE_SMALL and PTE_POPULATE (and a couple of masks) are being
> added?
I am speaking about macros connected to masks:
     #define PTE_R_MASK(x)   ((x) & PTE_READABLE)
     #define PTE_W_MASK(x)   ((x) & PTE_WRITABLE)
     #define PTE_X_MASK(x)   ((x) & PTE_EXECUTABLE)
  =20
     #define PTE_RWX_MASK(x) ((x) & (PTE_READABLE | PTE_WRITABLE |
   PTE_EXECUTABLE))

>=20
> > --- a/xen/arch/riscv/include/asm/flushtlb.h
> > +++ b/xen/arch/riscv/include/asm/flushtlb.h
> > @@ -5,12 +5,24 @@
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
>=20
> Isn't inner-sharable an Arm term? Don't you simply mean "all" here?
Yes, this is Arm term. It should used "all" instead. Thanks.

>=20
> > @@ -68,6 +111,20 @@ static inline bool pte_is_valid(pte_t p)
> > =C2=A0=C2=A0=C2=A0=C2=A0 return p.pte & PTE_VALID;
> > =C2=A0}
> > =C2=A0
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
>=20
> In how far is the READABLE check valid here? You (imo correctly) ...
>=20
> > +static inline bool pte_is_mapping(const pte_t p)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return (p.pte & PTE_VALID) &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (p.pte & =
(PTE_WRITABLE | PTE_EXECUTABLE));
> > +}
>=20
> ... don't consider this bit here.
pte_is_mapping() seems to me is correct as according to the RISC-V
privileged spec:
   4. Otherwise, the PTE is valid. If pte.r =3D 1 or pte.x =3D 1, go to ste=
p=20
   5. Otherwise, this PTE is a pointer to the next level of the page  =20
   table.
   5. A leaf PTE has been found. ...

and regarding pte_is_table() READABLE check is valid as we have to
check only that pte.r =3D pte.x =3D 0. WRITABLE check should be dropped. Or
just use define pte_is_table() as:
   inline bool pte_is_table(const pte_t p)
   {
   	return !pte_is_mapping(p);
   }


>=20
> > --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> > +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> > @@ -164,6 +164,7 @@
> > =C2=A0#define SSTATUS_SD			SSTATUS64_SD
> > =C2=A0#define SATP_MODE			SATP64_MODE
> > =C2=A0#define SATP_MODE_SHIFT			SATP64_MODE_SHIFT
> > +#define SATP_PPN_MASK			_UL(0x00000FFFFFFFFFFF)
> > =C2=A0
> > =C2=A0#define HGATP_PPN			HGATP64_PPN
> > =C2=A0#define HGATP_VMID_SHIFT		HGATP64_VMID_SHIFT
>=20
> This looks odd, padding-wise, but that's because hard tabs are being
> used here. Is that intentional?
I use tabs here because riscv_encoding.h was copied from Linux kernel
which uses hard tabs and definitions above use 3 tabs so I used 3 hard
tabs too.

>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/pt.c
> > @@ -0,0 +1,420 @@
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
> > +=C2=A0=C2=A0=C2=A0 paddr_t root_maddr =3D (csr_read(CSR_SATP) & SATP_P=
PN_MASK) <<
> > PAGE_SHIFT;
> > +
> > +=C2=A0=C2=A0=C2=A0 return maddr_to_mfn(root_maddr);
> > +}
> > +
> > +/* Sanity check of the entry. */
> > +static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int
> > flags)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * See the comment about the possible combinat=
ion of (mfn,
> > flags) in
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * the comment above pt_update().
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +
> > +=C2=A0=C2=A0=C2=A0 /* Sanity check when modifying an entry. */
> > +=C2=A0=C2=A0=C2=A0 if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN=
) )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We don't allow modifying=
 an invalid entry. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(entry) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pri=
ntk("Modifying invalid entry is not allowed.\n");
>=20
> Perhaps all of these printk()s should be dprintk()?
It could be dprintk() but at the same time I don't see any issue if it
will be printed once.

>  And not have a full
> stop?
By "full stop," do you mean something like panic() or BUG_ON()? The
error is propagated up to the caller, which then calls panic().
Anexample of this is:
       if ( (offset + size) > MB(2) )
       {
           rc =3D map_pages_to_xen(BOOT_FDT_VIRT_START + MB(2),
                                 maddr_to_mfn(base_paddr + MB(2)),
                                 MB(2) >> PAGE_SHIFT,
                                 PAGE_HYPERVISOR_RO);
           if ( rc )
               panic("Unable to map the device-tree\n");
       }
If it would be better for some reason to call panic() or BUG_ON() as
soon as pt_check_entry() returns false, I can do it that way as well.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn false;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We don't allow modifying=
 a table entry */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pte_is_table(entry) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pri=
ntk("Modifying a table entry is not allowed.\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn false;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 /* Sanity check when inserting a mapping */
> > +=C2=A0=C2=A0=C2=A0 else if ( flags & PTE_VALID )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We should be here with a=
 valid MFN. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(!mfn_eq(mfn, INVALID=
_MFN));
>=20
> This is odd to have here, considering the if() further up.
Agree, ASSERT() could be drop.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We don't allow repl=
acing any valid entry.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Note that the funct=
ion pt_update() relies on this
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * assumption and will=
 skip the TLB flush (when Svvptc
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * extension will be r=
atified). The function will need
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * to be updated if th=
e check is relaxed.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pte_is_valid(entry) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
( pte_is_mapping(entry) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 printk("Changing MFN for a valid entry is not
> > allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_x(mfn_f=
rom_pte(entry)), mfn_x(mfn));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 els=
e
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 printk("Trying to replace a table with a
> > mapping.\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn false;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 /* Sanity check when removing a mapping. */
> > +=C2=A0=C2=A0=C2=A0 else if ( (flags & (PTE_VALID | PTE_POPULATE)) =3D=
=3D 0 )
>=20
> The PTE_VALID part of the check is pointless considering the earlier
> if(). I guess you may want to have it for doc purposes ...
Yes, it just helps to read the code and understand "confusing" if's()
above.

>=20
> Since further up you're using "else if ( flags & PTE_VALID )" imo
> here you want to use "else if ( !(flags & ...) )".
>=20
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We should be here with a=
n invalid MFN. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(mfn_eq(mfn, INVALID_=
MFN));
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We don't allow removing =
a table */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pte_is_table(entry) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pri=
ntk("Removing a table is not allowed.\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn false;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> Is this restriction temporary?
Yes.

>=20
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 /* Sanity check when populating the page-table. No =
check so
> > far. */
> > +=C2=A0=C2=A0=C2=A0 else
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(flags & PTE_POPULATE=
);
>=20
> This again is redundant with earlier if() conditions.
>=20
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
>=20
> Having the boolean first is unusual, but well - it's your choice.
>=20
> > +{
> > +=C2=A0=C2=A0=C2=A0 pte_t *entry;
> > +=C2=A0=C2=A0=C2=A0 int ret;
> > +=C2=A0=C2=A0=C2=A0 mfn_t mfn;
> > +
> > +=C2=A0=C2=A0=C2=A0 entry =3D *table + offset;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(*entry) )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( alloc_tbl )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn XEN_TABLE_MAP_FAILED;
>=20
> Is this condition meant to be inverted?
if alloc_tbl =3D true we shouldn't allocatetable as:
     * The intermediate page table shouldn't be allocated when MFN
isn't
     * valid and we are not populating page table.
...
    */
    bool alloc_tbl =3D mfn_eq(mfn, INVALID_MFN) && !(flags &
PTE_POPULATE);

So if mfn =3D INVALID_MFN and flags.PTE_POPULATE=3D0 it means that this
table shouldn't be allocated and thereby pt_next_level() should return
XEN_TABLE_MAP_FAILED.

Or to invert if ( alloc_tbl )it will be needed to invert defintion of
alloc_tbl:
 bool alloc_tbl =3D !mfn_eq(mfn, INVALID_MFN) || (flags & PTE_POPULATE);
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D create_table(entry)=
;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( ret )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn XEN_TABLE_MAP_FAILED;
>=20
> You don't really use "ret". Why not omit the local variable, even
> more so that it has too wide scope?
I'll omit that, it is really useless.

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
> > +=C2=A0=C2=A0=C2=A0 bool alloc_tbl =3D mfn_eq(mfn, INVALID_MFN) && !(fl=
ags &
> > PTE_POPULATE);
>=20
> Is this meant to be inverted, too (to actually match variable name
> and
> comment)?
Oh, you mentioned that too. I wrote the similar above. I think it would
be better to invert if we want to use alloc_tbl variable name.

>=20
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
>=20
> When updating an entry, don't you also need to clear (some of) the
> flags?
I am not sure why some flags should be cleared. Here we are taking only
necessary for pte flags such as R, W, X or other bits in flags are
ignored.

>=20
> > +/* Return the level where mapping should be done */
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
> > +
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * Don't take into account the MFN when removi=
ng mapping (i.e
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * MFN_INVALID) to calculate the correct targe=
t order.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * `vfn` and `mfn` must be both superpage alig=
ned.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * They are or-ed together and then checked ag=
ainst the size
> > of
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * each level.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * `left` is not included and checked separate=
ly to allow
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * superpage mapping even if it is not properl=
y aligned (the
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * user may have asked to map 2MB + 4k).
>=20
> What is this about? There's nothing named "left" here.
It refer to "remaining" pages or "leftover" space after trying to align
a mapping to a superpage boundary.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 mask =3D !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0=
;
> > +=C2=A0=C2=A0=C2=A0 mask |=3D vfn;
> > +
> > +=C2=A0=C2=A0=C2=A0 for ( i =3D HYP_PT_ROOT_LEVEL; i !=3D 0; i-- )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !(mask & (BIT(XEN_PT_L=
EVEL_ORDER(i), UL) - 1)) &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (nr >=3D BIT(XEN_PT_LEVEL_ORDER(i), UL)) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lev=
el =3D i;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 return level;
> > +}
> > +
> > +static DEFINE_SPINLOCK(xen_pt_lock);
>=20
> Another largely meaningless xen_ prefix?
Thanks. I'll drop it.

>=20
> > +/*
> > + * If `mfn` equals `INVALID_MFN`, it indicates that the following
> > page table
> > + * update operation might be related to either populating the
> > table (
> > + * PTE_POPULATE will be set additionaly), destroying a mapping, or
> > modifying
> > + * an existing mapping.
>=20
> And the latter two are distinguished by? PTE_VALID?
inserting -> (PTE_VALID=3D1 + (mfn=3Dsomething valid))
destroying-> ( PTE_VALID=3D0 )

>=20
> > + * If `mfn` is valid and flags has PTE_VALID bit set then it means
> > that
> > + * inserting will be done.
> > + */
>=20
> What about mfn !=3D INVALID_MFN and PTE_VALID clear?
PTE_VALID=3D0 will be always considered as destroying and no matter what
is mfn value as in this case the removing is done in the way where mfn
isn't used:
        memset(&pte, 0x00, sizeof(pte));


>  Also note that "`mfn` is
> valid" isn't the same as "mfn !=3D INVALID_MFN". You want to be precise
> here,
> to avoid confusion later on. (I say that knowing that we're still
> fighting
> especially shadow paging code on x86 not having those properly
> separated.)
If it is needed to be precise and mfn is valid isn't the same as "mfn
!=3D INVALID_MFN" only for the case of shadow paging?

> >=20
>=20
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
>=20
> Seeing them in use, I wonder about the naming of those PTE_?_MASK()
> macros. Along with the lhs, why not simply (flags & PTE_...)?
Hmm, good point. They can be really dropped with simplification of the
mentioned if(...).

Thanks.

~ Oleksii

