Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E9394487D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 11:33:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769501.1180401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZSBV-00041r-58; Thu, 01 Aug 2024 09:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769501.1180401; Thu, 01 Aug 2024 09:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZSBV-0003zW-2L; Thu, 01 Aug 2024 09:33:21 +0000
Received: by outflank-mailman (input) for mailman id 769501;
 Thu, 01 Aug 2024 09:33:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dsN4=PA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sZSBT-0003zA-DE
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 09:33:19 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1591ffc4-4fe9-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 11:33:18 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52efe4c7c16so9876522e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 02:33:18 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c19f89sm2531876e87.216.2024.08.01.02.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 02:33:16 -0700 (PDT)
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
X-Inumbo-ID: 1591ffc4-4fe9-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722504797; x=1723109597; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YeVgNBZLjCe/tGZULNDaZspPiz31oXhQD/UPu5rTYXM=;
        b=l1Qwsx/m+ion5vDj6G9g1SJwwI8ZYzB1bZIqRwvXoLfFfSruIOrgxyTdQGB8XaJ/ax
         Wv2nnmrF4EmgJ+Muedk+h+tsWA6q/OabDpMIo3ABFaYVnzxJdNtzOojY/b2Xs753jHPm
         h5aUSfS/LPhSP2laXBjU7CpzBS5kNRQ2Om800Zr2ho6PjnfR4RuKk1jxRz+hLkKGzOMH
         pP32Ykq5/a0M783T2nxGMlEOfkBAgbPmuna52yAMEf6j6x4Bb7IPvQTi36Uebk6HfiH1
         hbbPeFD8Pd8E9oMG4vXXQiEdEWHpBGX1l7eEtzFY9olXbFma3ZkqCNRTXNFubO5qQ5Bi
         KLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722504797; x=1723109597;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YeVgNBZLjCe/tGZULNDaZspPiz31oXhQD/UPu5rTYXM=;
        b=RTnIfE2hN0C08hgw5jx52ztJRhmUBsmDCqHc2Ds2mMQFyQEQlJcQyc//jlPKoCL4lL
         zkTIZ1tUin0njGaTvvk66V2O5wiBhA2U4Vdo3nHT+lvbgaSny2y+Ji3sNQ2vkqNv466A
         NPkrYFNhcukeR0bDy9Cu16e9oJM2hZaqajXrYh2SQPmA+QmrWR/rQ4AQAUY3C19uOQB+
         3B4yk0jjbYq6U6mylGEWGMhQNbNBrBd5c8JLI0O94bw4P9SZd1RlBS1jhn1V7TgVqq70
         nWhVVbryx+2Iq4cXOnhgDSnHCnqxYiVQQLD/Nku20fCHzad8iQMHthHhwNQLQRxGsYQe
         OSVA==
X-Forwarded-Encrypted: i=1; AJvYcCXKVZSz3VBmB+jSXS+37g36XyhTKMxwcfYoNukBMoAIWBYUX3QbD+1Hy2DOp0B9eQTb1zLibi3eoFq+xIRLn0LuTvmZMhsxNPiAVeZUN4A=
X-Gm-Message-State: AOJu0YyMYDlBKrvkf4csSPvu+HiWcWQrh7GB9or4G2aSRYGlRcQO+3kx
	c/kNw5qNY8DGt8CChShNLRCFr3NIl+DcfTjAT1mmyefBxDqQINgm
X-Google-Smtp-Source: AGHT+IFY+kW8+6QuybUGYPTBU0AR0G+SzVA7qwSi3F0TOuR3xb8oUlTmEULGLXjgmxB/BQsrzM0aOQ==
X-Received: by 2002:a05:6512:250e:b0:52e:9fe0:bee4 with SMTP id 2adb3069b0e04-530b61a5cc7mr1467742e87.9.1722504796812;
        Thu, 01 Aug 2024 02:33:16 -0700 (PDT)
Message-ID: <04b40498494cbbd0d78744d87a2310e211f26b85.camel@gmail.com>
Subject: Re: [PATCH v3 8/9] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 01 Aug 2024 11:33:15 +0200
In-Reply-To: <c2496115-5c42-4cbb-8dde-686a97259609@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <595c7b6736d6f718bafc7a677fb13881584ce4dc.1721834549.git.oleksii.kurochko@gmail.com>
	 <c2496115-5c42-4cbb-8dde-686a97259609@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-30 at 16:22 +0200, Jan Beulich wrote:
> On 24.07.2024 17:31, Oleksii Kurochko wrote:
> > Introduces an implementation of map_pages_to_xen() which requires
> > multiple
> > functions to work with page tables/entries:
> > - xen_pt_update()
> > - xen_pt_mapping_level()
> > - xen_pt_update_entry()
> > - xen_pt_next_level()
> > - xen_pt_check_entry()
>=20
> I question the need for xen_ prefixes here.
xen_ prefixes could be dropped, there is no big meaning in them.

>=20
> > --- a/xen/arch/riscv/Kconfig
> > +++ b/xen/arch/riscv/Kconfig
> > @@ -2,6 +2,7 @@ config RISCV
> > =C2=A0 def_bool y
> > =C2=A0 select FUNCTION_ALIGNMENT_16B
> > =C2=A0 select GENERIC_BUG_FRAME
> > + select GENERIC_PT
> > =C2=A0 select HAS_DEVICE_TREE
> > =C2=A0 select HAS_PMAP
>=20
> Stray leftover?
Missed to drop after I tried to make these changes as a part of common
code. Thanks.

> >=20
>=20
> > --- a/xen/arch/riscv/include/asm/page-bits.h
> > +++ b/xen/arch/riscv/include/asm/page-bits.h
> > @@ -3,6 +3,42 @@
> > =C2=A0#ifndef __RISCV_PAGE_BITS_H__
> > =C2=A0#define __RISCV_PAGE_BITS_H__
> > =C2=A0
> > +/*
> > + * PTE format:
> > + * | XLEN-1=C2=A0 10 | 9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PFN=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 reserved for SW=C2=A0=C2=A0 D=C2=A0=C2=A0 A=C2=A0=C2=A0 G=C2=A0=C2=A0 U=
=C2=A0=C2=A0 X=C2=A0=C2=A0 W=C2=A0=C2=A0 R=C2=A0=C2=A0 V
> > + */
> > +
> > +#define _PAGE_PRESENT=C2=A0=C2=A0 BIT(0, UL)
>=20
> The acronym being V, would _PAGE_VALID maybe be a better name? Just
> like it's PTE_VALID? Speaking of which: Why do you need both PTE_*
> and _PAGE_*? How will one determine which one to use where? Plus imo
> page-bits.h is the wrong header to put these in. In fact I notice
> abuse of this header has already proliferated: Both PPC and RISC-V
> include this header explicitly, when it was introduced for just
> xen/page-size.h to include directly (and the definitions to put there
> are solely ones related to what xen/page-size.h needs / provides).
> The underlying idea what to simplify header dependencies. With what
> PPC and RISC-V do, that's being undermined.
I introduced them to be aligned with ARM code as I tried to use it as a
common code but after 'page table handling' was reworked to be arch-
specific _PAGE_* defintions could be dropped and only PTE_* ones could
be used.

>=20
> > +#define _PAGE_READ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1, UL)=C2=A0=C2=
=A0=C2=A0 /* Readable */
> > +#define _PAGE_WRITE=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2, UL)=C2=A0=C2=A0=C2=
=A0 /* Writable */
> > +#define _PAGE_EXEC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(3, UL)=C2=A0=C2=
=A0=C2=A0 /* Executable */
> > +#define _PAGE_USER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4, UL)=C2=A0=C2=
=A0=C2=A0 /* User */
> > +#define _PAGE_GLOBAL=C2=A0=C2=A0=C2=A0 BIT(5, UL)=C2=A0=C2=A0=C2=A0 /*=
 Global */
> > +#define _PAGE_ACCESSED=C2=A0 BIT(6, UL)=C2=A0=C2=A0=C2=A0 /* Set by ha=
rdware on any
> > access */
> > +#define _PAGE_DIRTY=C2=A0=C2=A0=C2=A0=C2=A0 BIT(7, UL)=C2=A0=C2=A0=C2=
=A0 /* Set by hardware on any
> > write */
> > +#define _PAGE_SOFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(8, UL)=C2=A0=C2=
=A0=C2=A0 /* Reserved for software */
>=20
> The diagram says that's two bits.
I meant here as a start bit index for _PAGE_SOFT.

>=20
> > +/*
> > + * There is no such bits in PTE format for RISC-V.
> > + *
> > + * _PAGE_BLOCK was introduced to have ability to tell that
> > superpage
> > + * should be allocated.
> > + */
> > +#define _PAGE_BLOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BI=
T(9, UL)
>=20
> Imo, like on x86, super-page mappings should be the default whenever
> possible.
> Callers _not_ wanting such can request so - see x86'es
> MAP_SMALL_PAGES.
>=20
> > +#define _PAGE_W_BIT=C2=A0=C2=A0=C2=A0=C2=A0 2
> > +#define _PAGE_XN_BIT=C2=A0=C2=A0=C2=A0 3
> > +#define _PAGE_RO_BIT=C2=A0=C2=A0=C2=A0 1
> > +
> > +/* TODO: move to somewhere generic part/header ? */
> > +#define _PAGE_XN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1U << _PAG=
E_XN_BIT)
> > +#define _PAGE_RO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1U << _PAG=
E_RO_BIT)
> > +#define _PAGE_W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1U <<=
 _PAGE_W_BIT)
> > +#define PAGE_XN_MASK(x) (((x) >> _PAGE_XN_BIT) & 0x1U)
> > +#define PAGE_RO_MASK(x) (((x) >> _PAGE_RO_BIT) & 0x1U)
> > +#define PAGE_W_MASK(x)=C2=A0 (((x) >> _PAGE_W_BIT) & 0x1U)
>=20
> What are all of these about? Why PAGE_XN when you have a positive X
> bit in the
> PTEs? And why 0x1U when plain 1 would do? All the PAGE_*_MASK ones
> are also
> badly named. Constructs of that name should extract the bit in its
> position
> (i.e. not shifted to bit 0), or be the name of a constant to use to
> do so.
The same reason as above initially I tried to have generic code with
ARM but it at the end it was a bad idea. So just need to provide proper
names. Thanks.


>=20
> > --- a/xen/arch/riscv/include/asm/page.h
> > +++ b/xen/arch/riscv/include/asm/page.h
> > @@ -34,6 +34,7 @@
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
>=20
> No PAGE_HYPERVISOR_RX?
I haven't used it at the moment, so I haven't provided it.

>=20
> > @@ -43,13 +44,68 @@
> > =C2=A0
> > =C2=A0#define pt_index(lvl, va) (pt_linear_offset((lvl), (va)) &
> > VPN_MASK)
> > =C2=A0
> > -/* Page Table entry */
> > +#define FIRST_SIZE (XEN_PT_LEVEL_SIZE(2))
> > +
> > +#define TABLE_OFFSET(offs) (_AT(unsigned int, offs) & ((_AC(1, U)
> > << PAGETABLE_ORDER) - 1))
> > +
> > +#if RV_STAGE1_MODE > SATP_MODE_SV48
> > +#error "need to to update DECLARE_OFFSETS macros"
> > +#else
> > +
> > +#define l0_table_offset(va) TABLE_OFFSET(pt_linear_offset(0, va))
> > +#define l1_table_offset(va) TABLE_OFFSET(pt_linear_offset(1, va))
> > +#define l2_table_offset(va) TABLE_OFFSET(pt_linear_offset(2, va))
> > +#define l3_table_offset(va) TABLE_OFFSET(pt_linear_offset(3, va))
> > +
> > +/* Generate an array @var containing the offset for each level
> > from @addr */
> > +#define DECLARE_OFFSETS(var, addr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 const unsigned int var[4] =3D {=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l0_table_offset(addr),=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l1_table_offset(addr),=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l2_table_offset(addr),=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l3_table_offset(addr)=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> > +=C2=A0=C2=A0=C2=A0 }
>=20
> Why would this need to have 4 entries in SV39 mode?
I don't need for Sv39. I just wasn't sure with the better way to have
universal DECLARE_OFFSETS() definition. I will add #ifdef Sv48 around
l3_table_offset and drop 4 in const unsigned int var[4].

>=20
> > +#endif
> > +
> > =C2=A0typedef struct {
> > +=C2=A0=C2=A0=C2=A0 unsigned long v:1;
> > +=C2=A0=C2=A0=C2=A0 unsigned long r:1;
> > +=C2=A0=C2=A0=C2=A0 unsigned long w:1;
> > +=C2=A0=C2=A0=C2=A0 unsigned long x:1;
> > +=C2=A0=C2=A0=C2=A0 unsigned long u:1;
> > +=C2=A0=C2=A0=C2=A0 unsigned long g:1;
> > +=C2=A0=C2=A0=C2=A0 unsigned long a:1;
> > +=C2=A0=C2=A0=C2=A0 unsigned long d:1;
>=20
> bool for all of these?
>=20
> > +=C2=A0=C2=A0=C2=A0 unsigned long rsw:2;
> > +#if RV_STAGE1_MODE =3D=3D SATP_MODE_SV39
> > +=C2=A0=C2=A0=C2=A0 unsigned long ppn0:9;
> > +=C2=A0=C2=A0=C2=A0 unsigned long ppn1:9;
> > +=C2=A0=C2=A0=C2=A0 unsigned long ppn2:26;
> > +=C2=A0=C2=A0=C2=A0 unsigned long rsw2:7;
>=20
> "rsw" above appear to mean "reserved for software use". What does
> "rsw" here
> mean? Should this field be "rsv"?
rsw2 means:
   Bits 60=E2=80=9354 are reserved for future standard
   use and, until their use is defined by some standard extension, must be
   zeroed by software for
   forward compatibility. If any of these bits are set, a page-fault
   exception is raised.
It would be better to use "rsv" Thanks.

>=20
> > +=C2=A0=C2=A0=C2=A0 unsigned long pbmt:2;
> > +=C2=A0=C2=A0=C2=A0 unsigned long n:1;
> > +#elif RV_STAGE1_MODE =3D=3D SATP_MODE_SV48
> > +=C2=A0=C2=A0=C2=A0 unsigned long ppn0:9;
> > +=C2=A0=C2=A0=C2=A0 unsigned long ppn1:9;
> > +=C2=A0=C2=A0=C2=A0 unsigned long ppn2:9;
> > +=C2=A0=C2=A0=C2=A0 unsigned long ppn3:17;
> > +=C2=A0=C2=A0=C2=A0 unsigned long rsw2:7;
> > +=C2=A0=C2=A0=C2=A0 unsigned long pbmt:2;
> > +=C2=A0=C2=A0=C2=A0 unsigned long n:1;
> > +#else
> > +#error "Add proper bits for SATP_MODE"
> > +#endif
> > +} pt_t;
>=20
> I can't spot a use anywhere of e.g. ppn0. Would be nice to understand
> in
> what contexts these bitfields are going to be used. I notice you
> specifically
> don't use them in e.g. pte_is_table().
I don't use them at the moment. I just introduced them for the possible
future using. I can re-check what of them I am using in my private
branches and come up here only with that one which are really used.

>=20
>=20
> > +}
> > +
> > +static inline bool pte_is_mapping(const pte_t pte, unsigned int
> > level)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return !pte_is_table(pte, level);
> > +}
>=20
> Don't you mean V=3D1 and (R=3D1 or X=3D1) here?
Agree, (R=3D1 or X=3D1) should be checked here too.

>=20
> > +/* Sanity check of the entry */
> > +static bool xen_pt_check_entry(pte_t entry, mfn_t mfn, unsigned
> > int level,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int flags)
>=20
> The comment wants extending to indicate what the parameters mean wrt
> what
> is going to be checked. For example, ...
>=20
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* Sanity check when modifying an entry. */
> > +=C2=A0=C2=A0=C2=A0 if ( mfn_eq(mfn, INVALID_MFN) )
>=20
> ... it's unclear to me why incoming INVALID_MFN would indicate
> modification
> of an entry, whereas further down _PAGE_PRESENT supposedly indicates
> insertion.
The statement inside if isn't correct. It should be:
   if ( (flags & _PAGE_PRESENT) && mfn_eq(mfn, INVALID_MFN) )

INVALID_MFN indicates modification because of how xen_pt_update() is
used:
   int map_pages_to_xen(unsigned long virt,
                        mfn_t mfn,
                        unsigned long nr_mfns,
                        unsigned int flags)
   {
       return xen_pt_update(virt, mfn, nr_mfns, flags);
   }
  =20
   int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
   {
       return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_PRESENT);
   }
  =20
   int destroy_xen_mappings(unsigned long s, unsigned long e)
   {
       ASSERT(IS_ALIGNED(s, PAGE_SIZE));
       ASSERT(IS_ALIGNED(e, PAGE_SIZE));
       ASSERT(s <=3D e);
       return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
   }
  =20
   int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int
   nf)
   {
       ASSERT(IS_ALIGNED(s, PAGE_SIZE));
       ASSERT(IS_ALIGNED(e, PAGE_SIZE));
       ASSERT(s <=3D e);
       return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, nf);
   }

The idea is the following:
  the MFN is not valid and we are not populating page table. This means
we either modify entry or remove an entry.

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
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We don't allow modifying=
 a table entry */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !pte_is_mapping(entry,=
 level) )
>=20
> With what the comment say, why not pte_is_table()?

It should be pte_is_table(). I will double check, thanks.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pri=
ntk("Modifying a table entry is not allowed.\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn false;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 /* Sanity check when inserting a mapping */
> > +=C2=A0=C2=A0=C2=A0 else if ( flags & _PAGE_PRESENT )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We should be here with a=
 valid MFN. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(!mfn_eq(mfn, INVALID=
_MFN));
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We don't allow repl=
acing any valid entry.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Note that the funct=
ion xen_pt_update() relies on this
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * assumption and will=
 skip the TLB flush. The function
> > will need
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * to be updated if th=
e check is relaxed.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pte_is_valid(entry) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
( pte_is_mapping(entry, level) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 printk("Changing MFN for a valid entry is not
> > allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 mfn_x(pte_get_mfn(entry)), mfn_x(mfn));
>=20
> Nit: Indentation. (I'm once again worried by all of these printk()s
> anyway.)
>=20
> > +#define XEN_TABLE_MAP_FAILED 0
> > +#define XEN_TABLE_SUPER_PAGE 1
> > +#define XEN_TABLE_NORMAL_PAGE 2
> > +
> > +/*
> > + * Take the currently mapped table, find the corresponding entry,
> > + * and map the next table, if available.
> > + *
> > + * The read_only parameters indicates whether intermediate tables
> > should
> > + * be allocated when not present.
>=20
> "read_only" would have a different meaning to me. Maybe use inverted
> sense
> with a name like "alloc"?
Sure, alloc_only would be better correspond to the comment.

>=20
> > + * Return values:
> > + *=C2=A0 XEN_TABLE_MAP_FAILED: Either read_only was set and the entry
> > + *=C2=A0 was empty, or allocating a new page failed.
> > + *=C2=A0 XEN_TABLE_NORMAL_PAGE: next level mapped normally
> > + *=C2=A0 XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.
> > + */
> > +static int xen_pt_next_level(bool read_only, unsigned int level,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pte_t **table, unsigned int offset)
> > +{
> > +=C2=A0=C2=A0=C2=A0 pte_t *entry;
> > +=C2=A0=C2=A0=C2=A0 int ret;
> > +=C2=A0=C2=A0=C2=A0 mfn_t mfn;
> > +
> > +=C2=A0=C2=A0=C2=A0 entry =3D *table + offset;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(*entry) )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( read_only )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn XEN_TABLE_MAP_FAILED;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D create_xen_table(en=
try);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( ret )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn XEN_TABLE_MAP_FAILED;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( pte_is_mapping(*entry, level) )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return XEN_TABLE_SUPER_PAGE=
;
> > +=C2=A0=C2=A0=C2=A0 }
>=20
> Please be consistent with braces around single statements.
>=20
> > +=C2=A0=C2=A0=C2=A0 mfn =3D pte_get_mfn(*entry);
> > +
> > +=C2=A0=C2=A0=C2=A0 xen_unmap_table(*table);
> > +=C2=A0=C2=A0=C2=A0 *table =3D xen_map_table(mfn);
> > +
> > +=C2=A0=C2=A0=C2=A0 return XEN_TABLE_NORMAL_PAGE;
> > +}
>=20
> Normal page? Not normal table?
It just mean that this points not to super_page so potenially the in
the next one table will have an entry that would be normal page.

>=20
> > +/* Update an entry at the level @target. */
> > +static int xen_pt_update_entry(mfn_t root, unsigned long virt,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_t mfn, unsigned int
> > arch_target,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int flags)
> > +{
> > +=C2=A0=C2=A0=C2=A0 int rc;
> > +=C2=A0=C2=A0=C2=A0 unsigned int level =3D HYP_PT_ROOT_LEVEL;
> > +=C2=A0=C2=A0=C2=A0 unsigned int arch_level =3D level;
>=20
> Why two level variables?
It is not needed anymore, I will drop it.

>=20
> > +=C2=A0=C2=A0=C2=A0 unsigned int target =3D arch_target;
> > +=C2=A0=C2=A0=C2=A0 pte_t *table;
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * The intermediate page tables are read-only =
when the MFN is
> > not valid
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * This means we either modify permissions or =
remove an entry.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 bool read_only =3D mfn_eq(mfn, INVALID_MFN);
>=20
> I'm afraid I can't make a connection between the incoming MFN being
> INVALID_MFN and intermediate tables being intended to remain
> unaltered.

It is becuase of xen_pt_update() is used:
   int __init populate_pt_range(unsigned long virt, unsigned long
   nr_mfns)
   {
       return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_PRESENT);
   }
So if pt is only populated then they are read_only and so they shouldn't
be allocated what means ptes are only or being removed or modified.

> > +
> > +static int xen_pt_update(unsigned long virt,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 mfn_t mfn,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 /* const on purpose as it is used for TLB
> > flush */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 const unsigned long nr_mfns,
>=20
> I'm afraid I don't see what the comment is actually trying to tell
> me.
> If this is about you wanting to make sure the function arguments
> aren't
> altered prematurely, then why would the same not apply to virt, mfn,
> and flags (all of which matter at the time the TLB flush is
> initiated)?
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 unsigned int flags)
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
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * When modifying/creating mapping (i.e _PAGE_=
PRESENT is set),
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * prevent any update if this happen.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 if ( (flags & _PAGE_PRESENT) && !PAGE_RO_MASK(flags=
) &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !PAGE_XN_MASK(flags) =
)
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
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 level =3D xen_pt_mapping_le=
vel(vfn, mfn, left, flags);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 order =3D XEN_PT_LEVEL_ORDE=
R(level);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(left >=3D BIT(order,=
 UL));
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D xen_pt_update_entry(=
root, vfn << PAGE_SHIFT, mfn,
> > level,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags);
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
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * The TLBs flush can be safely skipped when a=
 mapping is
> > inserted
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * as we don't allow mapping replacement (see
> > xen_pt_check_entry()).
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * For all the other cases, the TLBs will be f=
lushed
> > unconditionally
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * even if the mapping has failed. This is bec=
ause we may have
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * partially modified the PT. This will preven=
t any unexpected
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * behavior afterwards.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 if ( !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVA=
LID_MFN)) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flush_xen_tlb_range_va(virt=
, PAGE_SIZE * nr_mfns);
>=20
> See my comments elsewhere towards TLB behavior on RISC-V. The
> indicated
> skipping of a flush is safe only if not-present entries cannot be put
> in the TLB.
>=20
> > +=C2=A0=C2=A0=C2=A0 spin_unlock(&xen_pt_lock);
> > +
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
> > +=C2=A0=C2=A0=C2=A0 return xen_pt_update(virt, mfn, nr_mfns, flags);
> > +}
>=20
> Why this wrapping of two functions taking identical arguments?
map_pages_to_xen() sounds more clear regarding the way how it should be
used.

xen_pt_update() will be also used inside other functions. Look at the
example above.

~ Oleksii

