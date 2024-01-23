Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061DA839666
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 18:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670570.1043451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSKYp-0007wi-VB; Tue, 23 Jan 2024 17:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670570.1043451; Tue, 23 Jan 2024 17:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSKYp-0007uR-SA; Tue, 23 Jan 2024 17:27:43 +0000
Received: by outflank-mailman (input) for mailman id 670570;
 Tue, 23 Jan 2024 17:27:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OrDF=JB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSKYo-0007uL-Gg
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 17:27:42 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5e39de2-ba14-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 18:27:41 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50e7abe4be4so6223113e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 09:27:41 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 fc21-20020a056512139500b0050eba4e0eadsm2331213lfb.90.2024.01.23.09.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 09:27:40 -0800 (PST)
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
X-Inumbo-ID: b5e39de2-ba14-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706030860; x=1706635660; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yrq22DPNPC2JEUvBycO+PioR+yMMNZG2s+BJtBtj4Eg=;
        b=VMgGvu37WV9ALqubr6468ava7I3Khucyy2bEjRjuKz72vfKeOBNZJsLfv1qRDHHf1X
         Fi+pfec9FsVMhEIs6mQ5MDmPNwAuJpCRyENAKAo+JVV4qUc0DlwzaPhJzR2nzIetLytP
         GVGDEkQjYTST2sG57D15tKojOmcKV/nigHnL6ikpZKmqepkrG1JnMxL/GkQCZoeUUnSC
         /5agjkr47cweripFXDnajzzf05SjTc6u+Y0/F4kvOXgMm8N42bxJkVoJOWB2SY//mt+d
         PXjl1T4p2Emzv0g7z2q20F20NgKr1R4M0X640pc0GOd0PZA/oCnGD5W2/POcwh4tiGNg
         hXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706030860; x=1706635660;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrq22DPNPC2JEUvBycO+PioR+yMMNZG2s+BJtBtj4Eg=;
        b=JPh1nuI9GxvOjcvnwGImLO3GmkGbGHLK3MsqQSR7+vPCQudpEU/AESmC0ti5HlfOSC
         5TYeW+GI6FXnQeX0+X9eAj/URSKQh+iQerGS0AA2QWpOGBYrapUK0cRhGu/V2KhCkId4
         vI4nsoepZbAIfsHRafPo4QZopW77kpiep4L8I2ks+xoQydHJ1bRShO/Y4L55esPknRvR
         rnB3rWd+Z6R7+2+SP+/tLC+p/vwoiFUhXBkcr6Bw0fXk5gFZBQsV92mK7OjUPXXQhjpp
         2CMqaMrZsu0w1rnmFQLoYSxp0ZIiwJMldcBVntSK2CQ7fUjnIrfqflXZ5ds++hCG1dI8
         guBQ==
X-Gm-Message-State: AOJu0YyKsjlSSt8K+I/Pdi06/zXwBiZckSaT/BBLd3fCYGtu/SMIwoou
	acQxVG1qpDIngVPrUNSRqFMtumrmLdT8Zl0ou8t3/u/km2HC8LlK
X-Google-Smtp-Source: AGHT+IFh2VJZX+o4s8tNWp13bWT9vsabwEbfwXl3egzu3Gu8tZ+XkTinqQGX03E4/IaadzWPPaR4CA==
X-Received: by 2002:a05:6512:3b0c:b0:50e:e2e2:a273 with SMTP id f12-20020a0565123b0c00b0050ee2e2a273mr4016455lfv.26.1706030860287;
        Tue, 23 Jan 2024 09:27:40 -0800 (PST)
Message-ID: <7ba286f9f1255cbf5c0957f0a0a92e5e18f2bc8d.camel@gmail.com>
Subject: Re: [PATCH v3 31/34] xen/riscv: add minimal stuff to mm.h to build
 full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 23 Jan 2024 19:27:38 +0200
In-Reply-To: <d347c4d9-e93b-4937-8e33-e5fbbdcd6bfb@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <4411f6af38586074b347cd6005f19f9c670faa74.1703255175.git.oleksii.kurochko@gmail.com>
	 <d347c4d9-e93b-4937-8e33-e5fbbdcd6bfb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-23 at 14:03 +0100, Jan Beulich wrote:
> On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V3:
> > =C2=A0- update the commit message
>=20
> ??? (yet again)
asm/mm.h was changed to mm.h
>=20
> > --- a/xen/arch/riscv/include/asm/mm.h
> > +++ b/xen/arch/riscv/include/asm/mm.h
> > @@ -3,8 +3,251 @@
> > =C2=A0#ifndef _ASM_RISCV_MM_H
> > =C2=A0#define _ASM_RISCV_MM_H
> > =C2=A0
> > +#include <public/xen.h>
> > +#include <xen/pdx.h>
> > +#include <xen/types.h>
> > +
> > +#include <asm/page.h>
> > =C2=A0#include <asm/page-bits.h>
> > =C2=A0
> > +#define paddr_to_pdx(pa)=C2=A0=C2=A0=C2=A0 mfn_to_pdx(maddr_to_mfn(pa)=
)
> > +#define gfn_to_gaddr(gfn)=C2=A0=C2=A0 pfn_to_paddr(gfn_x(gfn))
> > +#define gaddr_to_gfn(ga)=C2=A0=C2=A0=C2=A0 _gfn(paddr_to_pfn(ga))
> > +#define mfn_to_maddr(mfn)=C2=A0=C2=A0 pfn_to_paddr(mfn_x(mfn))
> > +#define maddr_to_mfn(ma)=C2=A0=C2=A0=C2=A0 _mfn(paddr_to_pfn(ma))
> > +#define vmap_to_mfn(va)=C2=A0=C2=A0=C2=A0=C2=A0
> > maddr_to_mfn(virt_to_maddr((vaddr_t)va))
> > +#define vmap_to_page(va)=C2=A0=C2=A0=C2=A0 mfn_to_page(vmap_to_mfn(va)=
)
>=20
> Everything you have above ...
>=20
> > +#define paddr_to_pdx(pa)=C2=A0=C2=A0=C2=A0 mfn_to_pdx(maddr_to_mfn(pa)=
)
> > +#define gfn_to_gaddr(gfn)=C2=A0=C2=A0 pfn_to_paddr(gfn_x(gfn))
> > +#define gaddr_to_gfn(ga)=C2=A0=C2=A0=C2=A0 _gfn(paddr_to_pfn(ga))
> > +#define mfn_to_maddr(mfn)=C2=A0=C2=A0 pfn_to_paddr(mfn_x(mfn))
> > +#define maddr_to_mfn(ma)=C2=A0=C2=A0=C2=A0 _mfn(paddr_to_pfn(ma))
> > +#define vmap_to_mfn(va)=C2=A0=C2=A0=C2=A0=C2=A0
> > maddr_to_mfn(virt_to_maddr((vaddr_t)va))
> > +#define vmap_to_page(va)=C2=A0=C2=A0=C2=A0 mfn_to_page(vmap_to_mfn(va)=
)
>=20
> ... appears a 2nd time right afterwards.
Hmm, looks like rebase issue. I'll drop a copy. Thanks.
>=20
> > +#define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
> > +#define maddr_to_virt(pa) ((void *)((paddr_t)(pa) |
> > DIRECTMAP_VIRT_START))
> > +
> > +/* Convert between Xen-heap virtual addresses and machine frame
> > numbers. */
> > +#define __virt_to_mfn(va) (virt_to_maddr(va) >> PAGE_SHIFT)
> > +#define __mfn_to_virt(mfn) maddr_to_virt((paddr_t)(mfn) <<
> > PAGE_SHIFT)
>=20
> These would imo better use maddr_to_mfn() and mfn_to_maddr(), rather
> than
> kind of open-coding them. The former could also use PFN_DOWN() as an
> alternative.
Thanks. I'll take that into account.

>=20
> > +/* Convert between Xen-heap virtual addresses and page-info
> > structures. */
> > +static inline struct page_info *virt_to_page(const void *v)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +=C2=A0=C2=A0=C2=A0 return NULL;
> > +}
> > +
> > +/*
> > + * We define non-underscored wrappers for above conversion
> > functions.
> > + * These are overriden in various source files while underscored
> > version
> > + * remain intact.
> > + */
> > +#define virt_to_mfn(va)=C2=A0=C2=A0=C2=A0=C2=A0 __virt_to_mfn(va)
> > +#define mfn_to_virt(mfn)=C2=A0=C2=A0=C2=A0 __mfn_to_virt(mfn)
>=20
> Is this really still needed? Would be pretty nice if in a new port we
> could get to start cleanly right away (i.e. by not needing per-file
> overrides, but using type-safe expansions here right away).
Yes, we can just rename __virt_to_mfn and __mfn_to_virt and updated it
accordingly to your previous comment.


>=20
> > +struct page_info
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* Each frame can be threaded onto a doubly-linked =
list. */
> > +=C2=A0=C2=A0=C2=A0 struct page_list_entry list;
> > +
> > +=C2=A0=C2=A0=C2=A0 /* Reference count and various PGC_xxx flags and fi=
elds. */
> > +=C2=A0=C2=A0=C2=A0 unsigned long count_info;
> > +
> > +=C2=A0=C2=A0=C2=A0 /* Context-dependent fields follow... */
> > +=C2=A0=C2=A0=C2=A0 union {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Page is in use: ((count_=
info & PGC_count_mask) !=3D 0).
> > */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
Type reference count and various PGT_xxx flags and
> > fields. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long type_info;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } inuse;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Page is on a free list: =
((count_info & PGC_count_mask)
> > =3D=3D 0). */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 str=
uct {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Index of the first *possibly* unscrubbed page
> > in the buddy.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * One more bit than maximum possible order to
> > accommodate
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * INVALID_DIRTY_IDX.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +#define INVALID_DIRTY_IDX ((1UL << (MAX_ORDER + 1)) - 1)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 unsigned long first_dirty:MAX_ORDER + 1;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* Do TLBs need flushing for safety before next
> > page use? */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 bool need_tlbflush:1;
> > +
> > +#define BUDDY_NOT_SCRUBBING=C2=A0=C2=A0=C2=A0 0
> > +#define BUDDY_SCRUBBING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
> > +#define BUDDY_SCRUB_ABORT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 unsigned long scrub_state:2;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 unsigned long val;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } f=
ree;
>=20
> Indentation is wrong (and thus misleading) for these two lines.
I'll correct it.

>=20
> > +
> > +=C2=A0=C2=A0=C2=A0 } u;
>=20
> Nit: I don't see the value of the trailing blank line inside the
> union.
Sure, there is no any sense.

>=20
> > +=C2=A0=C2=A0=C2=A0 union {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Page is in use, but not =
as a shadow. */
>=20
> I question the appicability of "shadow" here.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
Owner of this page (zero if page is anonymous). */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 str=
uct domain *domain;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } inuse;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Page is on a free list. =
*/
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
Order-size of the free chunk this page is the head
> > of. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned int order;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } free;
> > +
> > +=C2=A0=C2=A0=C2=A0 } v;
> > +
> > +=C2=A0=C2=A0=C2=A0 union {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Timestamp from 'TLB=
 clock', used to avoid extra safety
> > flushes.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Only valid for: a) =
free pages, and b) pages with zero
> > type count
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t tlbflush_timestamp=
;
> > +=C2=A0=C2=A0=C2=A0 };
> > +=C2=A0=C2=A0=C2=A0 uint64_t pad;
> > +};
> > +
> > +#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
> > +
> > +/* PDX of the first page in the frame table. */
> > +extern unsigned long frametable_base_pdx;
>=20
> From this I conclude memory on RISC-V systems may not start at (or
> near) 0?
I am not sure that it is impossible at all, but all platforms I saw it
was always not 0 and pretty big values. For example, on real platform,
there is =3D0000004000000000. In QEMU, it is 0x800...0

>=20
> > +/* Convert between machine frame numbers and page-info structures.
> > */
> > +#define
> > mfn_to_page(mfn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 (frame_table + (mfn_to_pdx(mfn) - frametable_base_p=
dx))
> > +#define
> > page_to_mfn(pg)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 pdx_to_mfn((unsigned long)((pg) - frame_table) +
> > frametable_base_pdx)
> > +
> > +static inline void *page_to_virt(const struct page_info *pg)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return mfn_to_virt(mfn_x(page_to_mfn(pg)));
> > +}
> > +
> > +/*
> > + * Common code requires get_page_type and put_page_type.
> > + * We don't care about typecounts so we just do the minimum to
> > make it
> > + * happy.
> > + */
> > +static inline int get_page_type(struct page_info *page, unsigned
> > long type)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return 1;
> > +}
> > +
> > +static inline void put_page_type(struct page_info *page)
> > +{
> > +}
> > +
> > +static inline void put_page_and_type(struct page_info *page)
> > +{
> > +=C2=A0=C2=A0=C2=A0 put_page_type(page);
> > +=C2=A0=C2=A0=C2=A0 put_page(page);
> > +}
> > +
> > +/*
> > + * RISC-V does not have an M2P, but common code expects a handful
> > of
> > + * M2P-related defines and functions. Provide dummy versions of
> > these.
> > + */
> > +#define INVALID_M2P_ENTRY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (~=
0UL)
> > +#define SHARED_M2P_ENTRY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (~0UL - 1UL)
> > +#define SHARED_M2P(_e)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ((_e) =3D=3D SHARED_M2P_ENTRY)
> > +
> > +/* Xen always owns P2M on RISC-V */
> > +#define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn),
> > (void)(pfn); } while (0)
>=20
> Nit: Stray blank again after cast.
I'll update this. Thanks.

>=20
> > +#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
>=20
> What's the relation of the comment with these two #define-s?
I don't know, it was copied just from Arm. I think it would be better
to drop a comment and just define macros as BUG_ON("uimplemented") for
time being.

>=20
> > +#define PDX_GROUP_SHIFT (16 + 5)
> > +
> > +static inline unsigned long domain_get_maximum_gpfn(struct domain
> > *d)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +static inline long arch_memory_op(int op,
> > XEN_GUEST_HANDLE_PARAM(void) arg)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +/*
> > + * On RISCV, all the RAM is currently direct mapped in Xen.
> > + * Hence return always true.
> > + */
> > +static inline bool arch_mfns_in_directmap(unsigned long mfn,
> > unsigned long nr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return true;
> > +}
> > +
> > +#define PG_shift(idx)=C2=A0=C2=A0 (BITS_PER_LONG - (idx))
> > +#define PG_mask(x, idx) (x ## UL << PG_shift(idx))
> > +
> > +#define PGT_none=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 PG_mask(0, 1)=C2=A0 /* no special uses of
> > this page=C2=A0=C2=A0 */
> > +#define PGT_writable_page PG_mask(1, 1)=C2=A0 /* has writable
> > mappings?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +#define PGT_type_mask=C2=A0=C2=A0=C2=A0=C2=A0 PG_mask(1, 1)=C2=A0 /* B=
its 31 or
> > 63.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +
> > + /* Count of uses of this frame as its current type. */
> > +#define PGT_count_width=C2=A0=C2=A0 PG_shift(2)
> > +#define PGT_count_mask=C2=A0=C2=A0=C2=A0 ((1UL<<PGT_count_width)-1)
>=20
> Nit: Style (missing blanks around binary operators). Also a few more
> times further down.
Thanks. I'll update.
>=20
> > +/*
> > + * Page needs to be scrubbed. Since this bit can only be set on a
> > page that is
> > + * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
> > + */
> > +#define _PGC_need_scrub=C2=A0=C2=A0 _PGC_allocated
> > +#define PGC_need_scrub=C2=A0=C2=A0=C2=A0 PGC_allocated
> > +
> > +//=C2=A0 /* Cleared when the owning guest 'frees' this page. */
>=20
> Why a commented out comment?
Missed to remove, my IDE using this type of comment by default. and I
commented all the file when tried to find minimal of changes needed for
Xen build.

>=20
> > +#define _PGC_allocated=C2=A0=C2=A0=C2=A0 PG_shift(1)
> > +#define PGC_allocated=C2=A0=C2=A0=C2=A0=C2=A0 PG_mask(1, 1)
> > +=C2=A0 /* Page is Xen heap? */
> > +#define _PGC_xen_heap=C2=A0=C2=A0=C2=A0=C2=A0 PG_shift(2)
> > +#define PGC_xen_heap=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_mask(1, 2)
> > +/* Page is broken? */
> > +#define _PGC_broken=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_shift(7)
> > +#define PGC_broken=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_mask(1=
, 7)
> > + /* Mutually-exclusive page states: { inuse, offlining, offlined,
> > free }. */
>=20
> Can similar comments in this block please all be similarly indented
> (or not)?
Sure. I'll update that.

>=20
> > +#define PGC_state=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_m=
ask(3, 9)
> > +#define PGC_state_inuse=C2=A0=C2=A0 PG_mask(0, 9)
> > +#define PGC_state_offlining PG_mask(1, 9)
> > +#define PGC_state_offlined PG_mask(2, 9)
> > +#define PGC_state_free=C2=A0=C2=A0=C2=A0 PG_mask(3, 9)
> > +// #define page_state_is(pg, st) (((pg)->count_info&PGC_state) =3D=3D
> > PGC_state_##st)
>=20
> ???
The same as above, just missed to remove that line.

>=20
> > +/* Count of references to this frame. */
> > +#define PGC_count_width=C2=A0=C2=A0 PG_shift(9)
> > +#define PGC_count_mask=C2=A0=C2=A0=C2=A0 ((1UL<<PGC_count_width)-1)
> > +
> > +#define page_state_is(pg, st) (((pg)->count_info&PGC_state) =3D=3D
> > PGC_state_##st)
>=20
> And here it then "properly" appears?
>=20
> > +#define _PGC_extra=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_shift(=
10)
> > +#define PGC_extra=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_m=
ask(1, 10)
> > +
> > +#define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
> > +#define is_xen_heap_mfn(mfn) \
> > +=C2=A0=C2=A0=C2=A0 (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn=
)))
> > +
> > +#define is_xen_fixed_mfn(mfn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 ((mfn_to_maddr(mfn) >=3D virt_to_maddr(&_start)) &&=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0 (mfn_to_maddr(mfn) <=3D virt_to_maddr((vaddr_=
t)_end - 1)))
>=20
> Why does _start need prefixing wuth & and _end prefixing with a cast?
> First and foremost both want to be consistent. And then preferably
> with as little extra clutter as possible.
This is how it was defined in Arm. I think it both can be casted.
I'll update that.
Thanks.
>=20
> > +#define page_get_owner(_p)=C2=A0=C2=A0=C2=A0 (_p)->v.inuse.domain
> > +#define page_set_owner(_p,_d) ((_p)->v.inuse.domain =3D (_d))
> > +
> > +/* TODO: implement */
> > +#define mfn_valid(mfn) ({ (void) (mfn); 0; })
> > +
> > +#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
>=20
> This appeared further up already.
>=20
> > +#define domain_set_alloc_bitsize(d) ((void)0)
>=20
> Better ((void)(d)) ? And then ...
>=20
> > +#define domain_clamp_alloc_bitsize(d, b) (b)
>=20
> ... ((void)(d), (b)) here?
I'll update properly. Thanks.

~ Oleksii

