Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6612847624
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 18:31:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675150.1050363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVxNV-0008Ek-Nn; Fri, 02 Feb 2024 17:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675150.1050363; Fri, 02 Feb 2024 17:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVxNV-0008Dv-KE; Fri, 02 Feb 2024 17:31:01 +0000
Received: by outflank-mailman (input) for mailman id 675150;
 Fri, 02 Feb 2024 17:31:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j24o=JL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rVxNU-0008Dp-6x
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 17:31:00 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3fbda7d-c1f0-11ee-8a44-1f161083a0e0;
 Fri, 02 Feb 2024 18:30:58 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51121637524so3467493e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Feb 2024 09:30:58 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 b6-20020ac247e6000000b005112ec0dc45sm357805lfp.228.2024.02.02.09.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 09:30:57 -0800 (PST)
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
X-Inumbo-ID: d3fbda7d-c1f0-11ee-8a44-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706895058; x=1707499858; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zuFptEy94K8AhZ3deS/adnk3QF8mQaoyFhAN9vlssWo=;
        b=AexlbHJOXwFudoIYo5McIUS8ytreMB/G5sQzChshes1WdjDdEo65ackjoafigiwDzo
         zsFxmHCuwSp9GmJ5b8q/9bN2eDcN6/nRI18JkcI72w02zCJWqviw8T4Q1YbezhlsyO1G
         wb84jH0ffidTTsl6sRnUJOVjb9oWuMAecmTXN++ivRUthkoiYSkA5mPMq3PUxwy3ApLv
         qjtCQhR9jH9Fq7FWdHUycLGe490rWrdP4ThtK2EYTh0BQ1MzCXxlgFDSS+aPAFxNxG9L
         2o3+j0KAtHg2ExDsc93MBJtoOzhiAXFgcqCaAsRTiSGtOkYSRTNKeINwpTp5may54kso
         z8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706895058; x=1707499858;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zuFptEy94K8AhZ3deS/adnk3QF8mQaoyFhAN9vlssWo=;
        b=X1Hq403L9TkLE8gqP0oT6Bfjzo/UmWFECYoapNKUuEm2lJGNoorpGIOfm8wlb2Qhvz
         eD/kBC8zaEA7bcS/sJHFokQ/Lq2JqVZq5gwpHi75XkvFcXO2sf5nD4Z5v9OO+KVoJLnR
         AQW5aQJCoRPcmbRCOlH/Tq4F2ZYgLbJBblRkmbGIgXRJ0X0OJ5ae1WSvFmC/cdbzu320
         lQk32lGITCiQjw9dyl2JrxPKkYLZkbdmoO3UZX1sOWmDmSTQdfiSEraKalR77SrgAn9i
         vjDFJ7khv6v1pb8O9kNNjxbXpibhllPBeev3/l7mY4bREvDtlvwtLotcJEdfKi6AFYJD
         5c6Q==
X-Gm-Message-State: AOJu0YxXm8DTXFRlID1xa0lBXI2Z3LBXdS1gBQGa6OM3NF5rOJ6TzXWn
	k7NLTWuqIZnCE6NtgYdNh7hS5VhOCmrHKG+QsCOlpOPfnQZVFqoZ
X-Google-Smtp-Source: AGHT+IHvDk/T/kmZPYHcq9Y5AU1oA+UiXI/qceQM2mz78TI9vBKaPWmggW6s3Qa8/lzLw/89zI/joA==
X-Received: by 2002:a05:6512:31cb:b0:511:3a70:b954 with SMTP id j11-20020a05651231cb00b005113a70b954mr1366405lfe.18.1706895058002;
        Fri, 02 Feb 2024 09:30:58 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW+baJqMd+UJJeAx1IRozm5+WDWH1cd3g1rA/R8Dqk2Zx+p0G6UnoC8aiX/LNATvQnvrMUFqexIgB203NK5KBAhBO3WlVfBQ4ldYYCUpIuRAtpeOjUnwBbstKDsZ+LheG8AL+BKffgv6tovQEtqSlX4+iZAZNdmPrLXI6Inzu9ckgtp6jWYfoZhvfzOZ/1gzxg6E9iIt+SaSvBeCrdn0MCiKfe80NBLJqbRf/Enn6UnmER18YZwmDiFNB0sSWcE+g53hCq6trIfJ4C2uDMOnkmMDIMJC6JAC++Ci/27mv+Cjv6llQcYCn0=
Message-ID: <f3858360fba14a2c5b794bdd0400cd7ab8e66f73.camel@gmail.com>
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
Date: Fri, 02 Feb 2024 19:30:57 +0200
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
We can't to as __virt_to_mfn() when is used it is usually wrapped by
_mfn() which expect to have unsigned long as an argument.

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
We still need __virt_to_mfn and __mfn_to_virt as common code use them:
 * xen/common/xenoprof.c:24:#define virt_to_mfn(va)
mfn(__virt_to_mfn(va))
 * xen/include/xen/domain_page.h:59:#define domain_page_map_to_mfn(ptr)
_mfn(__virt_to_mfn((unsigned long)(ptr)))

~ Oleksii
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
>=20
> > +
> > +=C2=A0=C2=A0=C2=A0 } u;
>=20
> Nit: I don't see the value of the trailing blank line inside the
> union.
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
>=20
> > +#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
>=20
> What's the relation of the comment with these two #define-s?
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
>=20
> Jan


