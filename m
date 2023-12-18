Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54044816C55
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 12:35:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655880.1023751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBuE-0006JX-5W; Mon, 18 Dec 2023 11:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655880.1023751; Mon, 18 Dec 2023 11:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBuE-0006Hj-1H; Mon, 18 Dec 2023 11:35:30 +0000
Received: by outflank-mailman (input) for mailman id 655880;
 Mon, 18 Dec 2023 11:35:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFBuD-0006Hd-5D
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 11:35:29 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8aaf5540-9d99-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 12:35:27 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2cc4029dc6eso34023931fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 03:35:27 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a05651c01c800b002ca34ad9e8bsm3461819ljn.138.2023.12.18.03.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:35:26 -0800 (PST)
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
X-Inumbo-ID: 8aaf5540-9d99-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702899327; x=1703504127; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yAXhqnj2A6tTgQiZxL6I+4KbwUe55bqg9efuQ2bPfks=;
        b=G1Z7zUgg46D73C3I3HzT01VFMfkeAXj6ZCUhKh9D16RzoJxazx0ZDPEPJCHSZ3eooX
         Yhj+NARI+Wu6sefTThE7vkVcgr6UwXRy1+nm0ZM5BjuCs/VGowACM8CCm8DaISnEcsiR
         v4tNcErftkhUtKNDQN1RzZ9BqPaKGBH5OODt0PUE68S8BIvvO12hnN5jOBCNrMXaM7XT
         5aVYFTdy5Dh9g3msezI09sPWTyO7cpJsCNcCCMKYQDx8DLYdo+dvxRgE/oc6QknTUT/t
         JUpLLFjpAMUo0iD4sPCCp/YF9o9k9R+pq4MJ75YzXZw/L5vxDqBBgOZRpnHVOZ4whyqK
         gnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702899327; x=1703504127;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAXhqnj2A6tTgQiZxL6I+4KbwUe55bqg9efuQ2bPfks=;
        b=N7isb0629NbmnFKemaGDXg4kCjkepT1m0HQ/W/RAMM058wAfE29yeqKLKR+XrVlKCN
         9e986t3tFfcWm93o8umrWkHuE1gobieZ10u6cBu7D7SjzYwnmsJCX/gqchgR6NXk5v/g
         o/GulmkPZnPYWSvE8B2IdWmUejcdpYFEQ+qBvPmYkaumBTK75wrmghZPrdNeUKAyfe4i
         DLqkx0iJat+icLNlAi2+dzpyWIoXKPtgodjKP540wDFB+O7gP2yQG79cKyGdckQMTGkp
         MBalqh9njN1ZyKUrh/hAfGQ33PrrCwB8xE3N4+2GnHULfaCUcEOWaBbynHvKZD7N+sNN
         U5Zw==
X-Gm-Message-State: AOJu0Ywgr7bgVbvn4B7Rnb7rKZB+Id3O78oGEzpELu3Eqr/NoStZdLr9
	j9d6262zdxhBdVMf2gzyPyg=
X-Google-Smtp-Source: AGHT+IFkCD+0TPPPaZBF6cARVTTODH07PXBpLEjt1XfE2Reb8ijlHtJHRifkNANBBKQTaakt3y0aZg==
X-Received: by 2002:a2e:4a0a:0:b0:2cc:3f83:9cb9 with SMTP id x10-20020a2e4a0a000000b002cc3f839cb9mr3291386lja.22.1702899327108;
        Mon, 18 Dec 2023 03:35:27 -0800 (PST)
Message-ID: <ad31947dfffdd5deecbfcb3989585cda9449afc6.camel@gmail.com>
Subject: Re: [PATCH v2 36/39] xen/riscv: add minimal stuff to asm/mm.h to
 build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 13:35:26 +0200
In-Reply-To: <3d8bfead-e18c-4082-a75d-92aa379fa943@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <ec017ed24b1e5274d64d5458e4ab4475c92dece7.1700761381.git.oleksii.kurochko@gmail.com>
	 <3d8bfead-e18c-4082-a75d-92aa379fa943@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-14 at 18:08 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/mm.h
> > +++ b/xen/arch/riscv/include/asm/mm.h
> > @@ -3,10 +3,271 @@
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
> > -#define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
> > -#define paddr_to_pfn(pa)=C2=A0 ((unsigned long)((pa) >> PAGE_SHIFT))
>=20
> I'm a little puzzled here: Just a few patches ago you introduced them
> into
> asm/page.h, and (only) now you're removing them here.
I think it was some issue during rebasing of latest changes and
staging.

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
> > +
> > +#define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
> > +#define maddr_to_virt(pa) ((void *)((paddr_t)(pa) |
> > XEN_VIRT_START))
>=20
> Is this really XEN_VIRT_START? I.e. does your directmap start there,
> right where the Xen image area also starts?
No, it is not. I tried to re-use PPC's version of mm.h ( as it was
already merged ) and missed to update this macros. Actually right now
it is defined for RISC-V as:

static inline void *maddr_to_virt(paddr_t ma)
{
    ASSERT((mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) <
           (DIRECTMAP_SIZE >> PAGE_SHIFT));
    return (void *)(XENHEAP_VIRT_START -
                    (directmap_base_pdx << PAGE_SHIFT) +
                    ((ma & ma_va_bottom_mask) |
                     ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
}


but I think about to stub it with BUG() if it will work or to change
XEN_VIRT_START to DIRECTMAP_VIRT_START.

>=20
> > +/* Convert between Xen-heap virtual addresses and machine frame
> > numbers. */
> > +#define __virt_to_mfn(va) (virt_to_maddr(va) >> PAGE_SHIFT)
> > +#define __mfn_to_virt(mfn) (maddr_to_virt((paddr_t)(mfn) <<
> > PAGE_SHIFT))
>=20
> Nit: Excess parentheses again.
Thanks. Ill update.

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
> > +
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
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long val;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } f=
ree;
>=20
> Something's wrong with indentation here.
Thanks. Ill double check.

>=20
> > +=C2=A0=C2=A0=C2=A0 } u;
> > +
> > +=C2=A0=C2=A0=C2=A0 union {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Page is in use, but not =
as a shadow. */
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
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 tlbflush_timestamp;
>=20
> Nit: uint32_t and ...
>=20
> > +=C2=A0=C2=A0=C2=A0 };
> > +=C2=A0=C2=A0=C2=A0 u64 pad;
>=20
> ... uint64_t please in new code. Assuming, for the latter, you really
> need
> the field in the first place: I can't see what it's needed for.
This structure was copied from Arm's mm.h.
I am not sure too if it is needed. It seems to me it should be 8 byte
aligned without this pad for 64-bit archs.


>=20
> > +};
> > +
> > +#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
> > +
> > +/* PDX of the first page in the frame table. */
> > +extern unsigned long frametable_base_pdx;
> > +
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
> > +=C2=A0=C2=A0=C2=A0 return;
>=20
> No need for this; the body can ve entirely empty, as we have it
> elsewhere.
Thanks. I'll update.

>=20
> > +}
> > +
> > +/* TODO */
> > +static inline bool get_page_nr(struct page_info *page, const
> > struct domain *domain,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsig=
ned long nr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +static inline void put_page_nr(struct page_info *page, unsigned
> > long nr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
>=20
> What are these two needed for?
>=20
> > +static inline void put_page_and_type(struct page_info *page)
> > +{
> > +=C2=A0=C2=A0=C2=A0 put_page_type(page);
> > +=C2=A0=C2=A0=C2=A0 put_page(page);
> > +}
> > +
> > +/*
> > + * RISCV does not have an M2P, but common code expects a handful
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
> > +/* Xen always owns P2M on PPC */
>=20
> PPC?
Should be RISC-V. Missed to change.

>=20
> > +#define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn),
> > (void)(pfn); } while (0)
> > +#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
> > +
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
> > +
> > +/*
> > + * Page needs to be scrubbed. Since this bit can only be set on a
> > page that is
> > + * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
> > + */
> > +#define _PGC_need_scrub=C2=A0=C2=A0 _PGC_allocated
> > +#define PGC_need_scrub=C2=A0=C2=A0=C2=A0 PGC_allocated
> > +
> > +//=C2=A0 /* Cleared when the owning guest 'frees' this page. */
> > +#define _PGC_allocated=C2=A0=C2=A0=C2=A0 PG_shift(1)
> > +#define PGC_allocated=C2=A0=C2=A0=C2=A0=C2=A0 PG_mask(1, 1)
> > +=C2=A0 /* Page is Xen heap? */
> > +#define _PGC_xen_heap=C2=A0=C2=A0=C2=A0=C2=A0 PG_shift(2)
> > +#define PGC_xen_heap=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_mask(1, 2)
> > +#ifdef CONFIG_STATIC_MEMORY
> > +/* Page is static memory */
> > +#define _PGC_static=C2=A0=C2=A0=C2=A0 PG_shift(3)
> > +#define PGC_static=C2=A0=C2=A0=C2=A0=C2=A0 PG_mask(1, 3)
> > +#else
> > +#define PGC_static=C2=A0=C2=A0=C2=A0=C2=A0 0
> > +#endif
>=20
> Please omit this until you really know whether you're going to
> support
> static memory.
Ok. I'll drop that.
>=20
> > +/* ... */
>=20
> ???
It was taken for Arm and I don't know what is the purpose of the
comment so it makes sense to drop it.
>=20
> > +/* Page is broken? */
> > +#define _PGC_broken=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_shift(7)
> > +#define PGC_broken=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_mask(1=
, 7)
> > + /* Mutually-exclusive page states: { inuse, offlining, offlined,
> > free }. */
> > +#define PGC_state=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PG_m=
ask(3, 9)
> > +#define PGC_state_inuse=C2=A0=C2=A0 PG_mask(0, 9)
> > +#define PGC_state_offlining PG_mask(1, 9)
> > +#define PGC_state_offlined PG_mask(2, 9)
> > +#define PGC_state_free=C2=A0=C2=A0=C2=A0 PG_mask(3, 9)
> > +// #define page_state_is(pg, st) (((pg)->count_info&PGC_state) =3D=3D
> > PGC_state_##st)
> > +
> > +/* Count of references to this frame. */
> > +#define PGC_count_width=C2=A0=C2=A0 PG_shift(9)
> > +#define PGC_count_mask=C2=A0=C2=A0=C2=A0 ((1UL<<PGC_count_width)-1)
> > +
> > +#define page_state_is(pg, st) (((pg)->count_info&PGC_state) =3D=3D
> > PGC_state_##st)
> > +
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
> > +
> > +#define page_get_owner(_p)=C2=A0=C2=A0=C2=A0 (_p)->v.inuse.domain
> > +#define page_set_owner(_p,_d) ((_p)->v.inuse.domain =3D (_d))
> > +
> > +/* TODO: implement */
> > +#define mfn_valid(mfn) ({ (void) (mfn); 0; })
> > +// #define max_page (0UL)
>=20
> ???
This macros isn't needed for now ( when I tried to make minimal build I
just commented such places and forgot to remove it ).
>=20
> > +#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
> > +
> > +#define domain_set_alloc_bitsize(d) ((void)0)
> > +#define domain_clamp_alloc_bitsize(d, b) (b)
> > +
> > +#define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
>=20
> No leading underscore needed here, I suppose.
Thanks. I'll remove underscore.

~ Oleksii

