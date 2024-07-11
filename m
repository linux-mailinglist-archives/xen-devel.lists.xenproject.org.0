Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 510AA92E49F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 12:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757280.1166089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRr0Q-0004tR-Hy; Thu, 11 Jul 2024 10:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757280.1166089; Thu, 11 Jul 2024 10:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRr0Q-0004rx-F1; Thu, 11 Jul 2024 10:26:30 +0000
Received: by outflank-mailman (input) for mailman id 757280;
 Thu, 11 Jul 2024 10:26:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRr0P-0004rr-79
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 10:26:29 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 081facd2-3f70-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 12:26:27 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-595856e2336so1186168a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 03:26:28 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bd45a195sm3254437a12.62.2024.07.11.03.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 03:26:27 -0700 (PDT)
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
X-Inumbo-ID: 081facd2-3f70-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720693587; x=1721298387; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uu0IXftY0NEMOvHAx/ekzyLpp47VYtBHlcSf9BlLyuk=;
        b=IEiX7ny/dCsHhuQ4dT5R0Tq9TYYVUvpi4KU6OhOf73RnGKJfNTkFZWBYcgBZ9Ql1IT
         Nh5xiWRUnfjD2pNFIqBf1WcxZEgxRdb87IZkIZ3079YRl42JKq3nErU4pKGBSqpnFpru
         Vz/0yO4cBCfZSb/QbGjiW7rCysM6CQYCdQMpaYy7W2+HQFWd60+x5pUuu343lWOKP7iP
         AbjSjl21g6CT96MYGOm+JRCZu/kCKf/uaxGR1tsN/HpNonCsyLDoyImbb2xhiuEm3A4+
         6yFhedpX5BsfOq+60ddPWssutjGN2u14y8Fb9wThQtmSS/mBUoYxiLYgNHzN1iDTUBq+
         P8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720693587; x=1721298387;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uu0IXftY0NEMOvHAx/ekzyLpp47VYtBHlcSf9BlLyuk=;
        b=JE0+4SvyqzMQxAn6to2XlwI/0C9RFChKC4JS7On6iS/PYXLEM3baS6YZbT8cnF6YFK
         jc/izH5sC7ERJSTBrd1H0Xz6tSdRrNaUa05hYVM9o20Jzg/w919tbxGvHGqps3X41qxo
         s4nMDhapPKWpNNfY73jAhiiwICSWMyaw/yPolBkV07s8JR6BtGKtptHv9WZZwJnd4brH
         VIfmBSPqy3hCLiApYRxuoBXOoWs1Cn3xTH10KftRKgDtZXcwDwHJJBmYvntzzRWJZjy4
         lBbp6riPSlu1SM/pPE9YXrGT3rgNXA1Zf+9r0GxcBDO6I5rL9RIJwR4PNE4TXdDccpzI
         1QCA==
X-Forwarded-Encrypted: i=1; AJvYcCX9RQr10aL3OVbAK0kzaa6qhmO3rD0iV/KlB96jYVYtX2Fe1sZAWQimQqdn075qfd8TMaXQXLbaco/3Pl32yLcX4thnn60NQKMG0fixTUs=
X-Gm-Message-State: AOJu0YwG/Hvbzeetttf6RIU8T3d7S4A1U0e07DHMQDn3eVRUtk4bOSgu
	Oq9CiQnSJnTIU+0j/qwBpu6bKnsTBHFYw1IDmznaRMeJcKZoSj+K
X-Google-Smtp-Source: AGHT+IH8gGZYYbLaOsisIP0IKHtYkTxS7FCSq7ItZig6w24P6EBdx3lSMrQeyG0bW895Dzy30okCnQ==
X-Received: by 2002:a05:6402:26c7:b0:57c:9eef:e54 with SMTP id 4fb4d7f45d1cf-5980ced0c69mr1877253a12.5.1720693587349;
        Thu, 11 Jul 2024 03:26:27 -0700 (PDT)
Message-ID: <fda966116ce17b9be0b1a467bd31436a6b5ad225.camel@gmail.com>
Subject: Re: [PATCH v1 5/5] xen/riscv: map FDT
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 11 Jul 2024 12:26:26 +0200
In-Reply-To: <9592e857-bf1c-4e26-acd7-dfb5bb12103e@suse.com>
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
	 <7e492df051c949744755a221c0448c740d2c681b.1720002425.git.oleksii.kurochko@gmail.com>
	 <3afd94c0-25f4-4ed8-83d2-6f261b8a64b3@suse.com>
	 <021d29540f8e9abec118e9ca9dcd9675310eda84.camel@gmail.com>
	 <9592e857-bf1c-4e26-acd7-dfb5bb12103e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-07-11 at 11:54 +0200, Jan Beulich wrote:
> On 11.07.2024 11:40, Oleksii wrote:
> > On Wed, 2024-07-10 at 14:38 +0200, Jan Beulich wrote:
> > > On 03.07.2024 12:42, Oleksii Kurochko wrote:
> > > > Except mapping of FDT, it is also printing command line passed
> > > > by
> > > > a DTB and initialize bootinfo from a DTB.
> > >=20
> > > I'm glad the description isn't empty here. However, ...
> > >=20
> > > > --- a/xen/arch/riscv/riscv64/head.S
> > > > +++ b/xen/arch/riscv/riscv64/head.S
> > > > @@ -41,6 +41,9 @@ FUNC(start)
> > > > =C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=A0=C2=
=A0=C2=A0 setup_initial_pagetables
> > > > =C2=A0
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 a0, s1
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=A0=C2=A0=
=C2=A0 fdt_map
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Calculate prope=
r VA after jump from 1:1 mapping */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 a0, .L_primary_switched
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sub=C2=A0=C2=A0=C2=
=A0=C2=A0 a0, a0, s2
> > >=20
> > > ... it could do with clarifying why this needs calling from
> > > assembly
> > > code. Mapping the FDT clearly looks like something that wants
> > > doing
> > > from start_xen(), i.e. from C code.
> > fdt_map() expected to work while MMU is off as it is using
> > setup_initial_mapping() which is working with physical address.
>=20
> Hmm, interesting. When the MMU is off, what does "map" mean? Yet then
> it feels I'm misunderstanding what you're meaning to tell me ...
Let's look at examples of the code:
1. The first thing issue will be here:
   void* __init early_fdt_map(paddr_t fdt_paddr)
   {
       unsigned long dt_phys_base =3D fdt_paddr;
       unsigned long dt_virt_base;
       unsigned long dt_virt_size;
  =20
       BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
       if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN || fdt_paddr % SZ_2M=
=20
   ||
             fdt_totalsize(fdt_paddr) > BOOT_FDT_VIRT_SIZE )
MMU doesn't now about virtual address of fdt_paddr as fdt_paddr wasn't
mapped.

2. In setup_initial_mapping() we have HANDLE_PGTBL() where pgtbl is a
pointer to physical address ( which also  should be mapped in MMU if we
want to access it after MMU is enabled ):
   #define HANDLE_PGTBL(curr_lvl_num)                                   =
=20
   \
       index =3D pt_index(curr_lvl_num, page_addr);                       =
=20
   \
       if ( pte_is_valid(pgtbl[index]) )                                =
=20
   \
       {                                                                =
=20
   \
           /* Find L{ 0-3 } table */                                    =
=20
   \
           pgtbl =3D (pte_t *)pte_to_paddr(pgtbl[index]);                 =
=20
   \
       }                                                                =
=20
   \
       else                                                             =
=20
   \
       {                                                                =
=20
   \
           /* Allocate new L{0-3} page table */                         =
=20
   \
           if ( mmu_desc->pgtbl_count =3D=3D PGTBL_INITIAL_COUNT )         =
 =20
   \
           {                                                            =
=20
   \
               early_printk("(XEN) No initial table available\n");      =
=20
   \
               /* panic(), BUG() or ASSERT() aren't ready now. */       =
=20
   \
               die();                                                   =
=20
   \
           }                                                            =
=20
   \
           mmu_desc->pgtbl_count++;                                     =
=20
   \
           pgtbl[index] =3D paddr_to_pte((unsigned long)mmu_desc-
   >next_pgtbl,    \
                                       PTE_VALID);                      =
=20
   \
           pgtbl =3D mmu_desc->next_pgtbl;                                =
=20
   \
           mmu_desc->next_pgtbl +=3D PAGETABLE_ENTRIES;                   =
=20
   \
       }
  =20
So we can't use setup_initial_mapping() when MMU is enabled as there is
a part of the code which uses physical address which are not mapped.

We have only mapping for for liner_start <-> load_start and the small
piece of code in text section ( _ident_start ):
    setup_initial_mapping(&mmu_desc,
                          linker_start,
                          linker_end,
                          load_start);

    if ( linker_start =3D=3D load_start )
        return;

    ident_start =3D (unsigned long)turn_on_mmu &XEN_PT_LEVEL_MAP_MASK(0);
    ident_end =3D ident_start + PAGE_SIZE;

    setup_initial_mapping(&mmu_desc,
                          ident_start,
                          ident_end,
                          ident_start);

We can use setup_initial_mapping() when MMU is enabled only in case
when linker_start is equal to load_start.

As an option we can consider for as a candidate for identaty mapping
also section .bss.page_aligned where root and nonroot page tables are
located.

Does it make sense now?

~ Oleksii



