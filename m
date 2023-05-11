Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96AF6FEDAB
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 10:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533171.829588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px1RT-0002mq-Eh; Thu, 11 May 2023 08:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533171.829588; Thu, 11 May 2023 08:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px1RT-0002kR-BJ; Thu, 11 May 2023 08:14:27 +0000
Received: by outflank-mailman (input) for mailman id 533171;
 Thu, 11 May 2023 08:14:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPy6=BA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1px1RR-0002kL-Rb
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 08:14:25 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d740b8bd-efd3-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 10:14:24 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f13c577e36so9189882e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 May 2023 01:14:24 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a056512014a00b004f11d1ab605sm1017969lfo.295.2023.05.11.01.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:14:23 -0700 (PDT)
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
X-Inumbo-ID: d740b8bd-efd3-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683792864; x=1686384864;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+88Dancfok8X5Zw7Ulq5o58+aWZxHOF5SDxRA4KA8Gc=;
        b=aqrV06ZY3sXs0Bmwf9sjE2Y4ws5fg48Q1D8AcT56hgvxNSUQmiRzIHcCHPiOoHmdMD
         qLWfmCALyq8AYTcG/YMLY2rT7Au5/yO98qVr0X4I1+4DgEZfgUR+NV5qmgIT+YlQOt40
         GUDTqzhE17rHc7Zd6/FlY9buTcTUFTo28itTHwpOAgq32K0DmwiLQs7kYgkKzBWZu/o0
         0cup8dNJhN3OY7tNqwIhc/qJ8JqpIN+fkYLyM8c74zzEzPGzmCvXor9u0Y1FOMMPvr/g
         Wr2KJSa0SAvyII6nnaFsp1rayE/LSwxbgRzy9780Sm+1lJwassIhe53jUtKq5pAqfr3W
         zDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683792864; x=1686384864;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+88Dancfok8X5Zw7Ulq5o58+aWZxHOF5SDxRA4KA8Gc=;
        b=ZF3stv6s3kAI3BX36qsxgnb7bYx0qkwu6dk1vcJh4lagJY9MV6Uid3g93m8gZmU/zb
         JtXhNRbwQLSEB3hL3xMzkiiz/GAKE3LKpH8LDnr1HODW9xGpiWJnNWRQlmjC80L9uuyp
         fR276pSy0SvegQtOyadA6G+KXsdskaeMpa8JE9d2GW+ZbxhSGsUqq9SNzia3eHIbSvmU
         kfkhfS1qgrYaUDzG9vlLTVCQAy+/qpAfviB0cD+7JIt3Sp5BOUjPAlVnCqng85YfvTnF
         v4YzlCalLGbBvD3bHAN8kKMAeTs3XZPcZSwg0QnlyfGVpWOoEjeGZwbKm2WjRcY1AVEG
         JP7g==
X-Gm-Message-State: AC+VfDyrTgs6u16KpeIDCVHMUYdXkKEPhNPPhTJSwsnBJIKvpiSDqZaL
	Qlab0eY1ijEImseGi4IRyCQ=
X-Google-Smtp-Source: ACHHUZ7FiiTygJjFnZyJ7sJe/ZTGELVOizsHEOdop2p25NpGGNDnKAX4ZPG8oHZtcYJnQ10KjSS0NQ==
X-Received: by 2002:ac2:4c82:0:b0:4ed:b4f9:28c7 with SMTP id d2-20020ac24c82000000b004edb4f928c7mr2722192lfl.6.1683792863942;
        Thu, 11 May 2023 01:14:23 -0700 (PDT)
Message-ID: <b0ea83c0e870567089b574056308b831c6cafea3.camel@gmail.com>
Subject: Re: [PATCH v6 2/4] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Thu, 11 May 2023 11:14:22 +0300
In-Reply-To: <da4592b3-b5f2-50d8-b474-9b2340b5bb81@suse.com>
References: <cover.1683131359.git.oleksii.kurochko@gmail.com>
	 <d1a6fb6112b61000645eb1a4ab9ade8a208d4204.1683131359.git.oleksii.kurochko@gmail.com>
	 <0533b045-f4cb-0834-ae88-9229bd816cf2@suse.com>
	 <db6fe5a3db067ae3429d4b83766508233dfc9ca8.camel@gmail.com>
	 <da4592b3-b5f2-50d8-b474-9b2340b5bb81@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-05-09 at 16:38 +0200, Jan Beulich wrote:
> On 09.05.2023 14:59, Oleksii wrote:
> > On Mon, 2023-05-08 at 10:58 +0200, Jan Beulich wrote:
> > > On 03.05.2023 18:31, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/include/asm/page.h
> > > > @@ -0,0 +1,62 @@
> > > > +#ifndef _ASM_RISCV_PAGE_H
> > > > +#define _ASM_RISCV_PAGE_H
> > > > +
> > > > +#include <xen/const.h>
> > > > +#include <xen/types.h>
> > > > =3D)+
> > > > +#define VPN_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((unsign=
ed
> > > > long)(PAGETABLE_ENTRIES - 1))
> > > > +
> > > > +#define XEN_PT_LEVEL_ORDER(lvl)=C2=A0=C2=A0=C2=A0=C2=A0 ((lvl) * P=
AGETABLE_ORDER)
> > > > +#define XEN_PT_LEVEL_SHIFT(lvl)=C2=A0=C2=A0=C2=A0=C2=A0 (XEN_PT_LE=
VEL_ORDER(lvl) +
> > > > PAGE_SHIFT)
> > > > +#define XEN_PT_LEVEL_SIZE(lvl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (_AT(=
paddr_t, 1) <<
> > > > XEN_PT_LEVEL_SHIFT(lvl))
> > > > +#define XEN_PT_LEVEL_MAP_MASK(lvl)=C2=A0 (~(XEN_PT_LEVEL_SIZE(lvl)
> > > > -
> > > > 1))
> > > > +#define XEN_PT_LEVEL_MASK(lvl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (VPN_=
MASK <<
> > > > XEN_PT_LEVEL_SHIFT(lvl))
> > > > +
> > > > +#define PTE_VALID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0, UL)
> > > > +#define PTE_READABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1, UL)
> > > > +#define PTE_WRITABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2, UL)
> > > > +#define PTE_EXECUTABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(3, UL)
> > > > +#define PTE_USER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4, U=
L)
> > > > +#define PTE_GLOBAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(5, UL)
> > > > +#define PTE_ACCESSED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(6, UL)
> > > > +#define PTE_DIRTY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(7, UL)
> > > > +#define PTE_RSW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (BIT(=
8, UL) | BIT(9, UL))
> > > > +
> > > > +#define PTE_LEAF_DEFAULT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (PTE_VALID | PTE_READABLE
> > > > |
> > > > PTE_WRITABLE)
> > > > +#define PTE_TABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (PTE_VALID)
> > > > +
> > > > +/* Calculate the offsets into the pagetables for a given VA */
> > > > +#define pt_linear_offset(lvl, va)=C2=A0=C2=A0 ((va) >>
> > > > XEN_PT_LEVEL_SHIFT(lvl))
> > > > +
> > > > +#define pt_index(lvl, va) pt_linear_offset(lvl, (va) &
> > > > XEN_PT_LEVEL_MASK(lvl))
> > >=20
> > > Maybe better
> > >=20
> > > #define pt_index(lvl, va) (pt_linear_offset(lvl, va) & VPN_MASK)
> > >=20
> > > as the involved constant will be easier to use for the compiler?
> > But VPN_MASK should be shifted by level shift value.
>=20
> Why? pt_linear_offset() already does the necessary shifting.
I missed a way how you offered to define pt_index(). I thought you
offered to define it as "pt_linear_offset(lvl, va & VPN_MASK)" instead
of
"(pt_linear_offset(lvl, va) & VPN_MASK)".

So you are right we can re-write as you offered.

>=20
> > > > +=C2=A0=C2=A0=C2=A0 csr_write(CSR_SATP, 0);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /* Clean MMU root page table */
> > > > +=C2=A0=C2=A0=C2=A0 stage1_pgtbl_root[index] =3D paddr_to_pte(0x0, =
0x0);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 asm volatile ( "sfence.vma" );
> > >=20
> > > Doesn't this want to move between the SATP write and the clearing
> > > of
> > > the
> > > root table slot? Also here and elsewhere - don't these asm()s
> > > need
> > > memory
> > > clobbers? And anyway - could I talk you into introducing an
> > > inline
> > > wrapper
> > > (e.g. named sfence_vma()) so all uses end up consistent?
> > I think clearing of root page table should be done before
> > "sfence.vma"
> > because we have to first clear slot of MMU's root page table and
> > then
> > make updating root page table visible for all. ( by usage of sfence
> > instruction )
>=20
> I disagree. The SATP write has removed the connection of the CPU
> to the page tables. That's the action you want to fence, not the
> altering of some (then) no longer referenced data structure.
From that point of view you are right. Thanks for clarification.
>=20
> > > > +void __init setup_initial_pagetables(void)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 struct mmu_desc mmu_desc =3D { 0, 0, NULL, NULL=
 };
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Access to _stard, _end is always PC-rel=
ative
> > >=20
> > > Nit: Typo-ed symbol name. Also ...
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * thereby when access them we will get lo=
ad adresses
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * of start and end of Xen
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * To get linker addresses LOAD_TO_LINK() =
is required
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * to use
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > >=20
> > > see the earlier line wrapping remark again. Finally in multi-
> > > sentence
> > > comments full stops are required.
> > Full stops mean '.' at the end of sentences?
>=20
> Yes. Please see ./CODING_STYLE.
Thanks. I'll read it again.

~ Oleksii

