Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A99C6EA00B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 01:34:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524393.815289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppdly-0007JH-Tf; Thu, 20 Apr 2023 23:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524393.815289; Thu, 20 Apr 2023 23:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppdly-0007H4-Qo; Thu, 20 Apr 2023 23:33:06 +0000
Received: by outflank-mailman (input) for mailman id 524393;
 Thu, 20 Apr 2023 23:33:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VXON=AL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ppdlx-0007Gy-BN
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 23:33:05 +0000
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [2607:f8b0:4864:20::112a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b17156f0-dfd3-11ed-b220-6b7b168915f2;
 Fri, 21 Apr 2023 01:33:03 +0200 (CEST)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-54fb89e1666so2161497b3.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Apr 2023 16:33:03 -0700 (PDT)
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
X-Inumbo-ID: b17156f0-dfd3-11ed-b220-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682033582; x=1684625582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PN2ixoAK9D3BuA0Ys9lwnMZMdyz2nW/UTyxM+6NXzqI=;
        b=AX4YGgPJjZWyR0kqu580/PVasSF+uNRiA7gr7gHqMdE/2vLkFpdjQpKmKbwxnvzy1W
         4jX/DWRv14Hh6L+AuqxNt9TrfsVNFOA+DMslH6msB9ssOPuKNdU5LH4UlZNRkrQgi/yF
         2C7UqT75y8+OehNqUJfsf2nClBSiv3rZRBTIf/8qXrl8xEYNdOg0mllWNN17Cw7o+BHc
         Dv7TVavT6/AGmzCH4d7Tksroa3F14WaPTNTcwjLqhrbimQGYJu8Di4n0FcYkgCSZZuxf
         BRI5CuXSQtBQDqv2Sdnh5lzey/n44xr+tGNe/P6HPq7sE+h81UtCj457v+cM+mPjpeEU
         pLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682033582; x=1684625582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PN2ixoAK9D3BuA0Ys9lwnMZMdyz2nW/UTyxM+6NXzqI=;
        b=Yz73ePMtXXqZ+g5gf46nol9YXXf8t6OViB3pd7EZv3pkn+xiyaOezBfmM3Opvc9mML
         E/6vQO2RJpWG07z1/Yncd40xJCxNUC9HqjfYRteQvButfbz8DfAjNTDmJ5wz7WEoJR9j
         sU/8jASlMSZ7BJinX/dcpuQJqvHQhj3y8mfAjJNB53Xk3S8bgmN7+877jBjLCtDoWao1
         YrcxyhglEKhs6hXcdiK42iTXXAat0YzKkMdIQ5jLskZIwQR/ZrDQxriVz45gYAyP7Le6
         sHL55jj2eVkUAD2cPrwj5yyiQRQKhHYJYhyA0rhZmwyaYWKM8DNnuF4wbXYFsjXnnoDl
         zlww==
X-Gm-Message-State: AAQBX9d7Eh83QcKq+KYq+ITpEoV5ziwPPWuvdXXicIZKCIR7LJujOpZ8
	vAFzFVxlTe7k8U4Ej1Yq/YBrmdztSLmivmQHqHY=
X-Google-Smtp-Source: AKy350bopqnJQtT+418DUBi5UUf4Yx/MaaBIpccKeoXBRimnuUzPebu61FMjyfXCRvipIUnUp3uBwA4Azmrc32p/hx0=
X-Received: by 2002:a0d:f205:0:b0:541:8810:8d7b with SMTP id
 b5-20020a0df205000000b0054188108d7bmr466003ywf.15.1682033581993; Thu, 20 Apr
 2023 16:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230417205048.15870-1-vishal.moola@gmail.com>
 <20230417205048.15870-2-vishal.moola@gmail.com> <da600570-51c7-8088-b46b-7524c9e66e5d@redhat.com>
 <CAOzc2pwpRhNoFbdzdzuvrqbZdf2OsrTvBGs40QCZJjA5fS_q1A@mail.gmail.com> <e0c0ad67-f23f-ff35-80bf-841dcfd43d99@redhat.com>
In-Reply-To: <e0c0ad67-f23f-ff35-80bf-841dcfd43d99@redhat.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 20 Apr 2023 16:32:50 -0700
Message-ID: <CAOzc2pwDtn836Tf0Egh+Z258hxSTVtvwuyU2qiJa1iLa6vZFjQ@mail.gmail.com>
Subject: Re: [PATCH 01/33] s390: Use _pt_s390_gaddr for gmap address tracking
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 12:54=E2=80=AFAM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 18.04.23 23:33, Vishal Moola wrote:
> > On Tue, Apr 18, 2023 at 8:45=E2=80=AFAM David Hildenbrand <david@redhat=
.com> wrote:
> >>
> >> On 17.04.23 22:50, Vishal Moola (Oracle) wrote:
> >>> s390 uses page->index to keep track of page tables for the guest addr=
ess
> >>> space. In an attempt to consolidate the usage of page fields in s390,
> >>> replace _pt_pad_2 with _pt_s390_gaddr to replace page->index in gmap.
> >>>
> >>> This will help with the splitting of struct ptdesc from struct page, =
as
> >>> well as allow s390 to use _pt_frag_refcount for fragmented page table
> >>> tracking.
> >>>
> >>> Since page->_pt_s390_gaddr aliases with mapping, ensure its set to NU=
LL
> >>> before freeing the pages as well.
> >>>
> >>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> >>> index 3fc9e680f174..2616d64c0e8c 100644
> >>> --- a/include/linux/mm_types.h
> >>> +++ b/include/linux/mm_types.h
> >>> @@ -144,7 +144,7 @@ struct page {
> >>>                struct {        /* Page table pages */
> >>>                        unsigned long _pt_pad_1;        /* compound_he=
ad */
> >>>                        pgtable_t pmd_huge_pte; /* protected by page->=
ptl */
> >>> -                     unsigned long _pt_pad_2;        /* mapping */
> >>> +                     unsigned long _pt_s390_gaddr;   /* mapping */
> >>>                        union {
> >>>                                struct mm_struct *pt_mm; /* x86 pgds o=
nly */
> >>>                                atomic_t pt_frag_refcount; /* powerpc =
*/
> >>
> >> The confusing part is, that these gmap page tables are not ordinary
> >> process page tables that we would ordinarily place into this section
> >> here. That's why they are also not allocated/freed using the typical
> >> page table constructor/destructor ...
> >
> > I initially thought the same, so I was quite confused when I saw
> > __gmap_segment_gaddr was using pmd_pgtable_page().
> >
> > Although they are not ordinary process page tables, since we
> > eventually want to move them out of struct page, I think shifting them
> > to be in ptdescs, being a memory descriptor for page tables, makes
> > the most sense.
>
> Seeing utilities like tlb_remove_page_ptdesc() that don't really apply
> to such page tables, I wonder if we should much rather treat such
> shadow/auxiliary/... page tables (just like other architectures like
> x86, arm, ... employ as well) as a distinct type.
>
> And have ptdesc be the common type for all process page tables.

Although I do like the idea of having a distinct type for them, I'm not sur=
e
I see the merits of having another type specifically for those types of
page tables.

As it currently is, tlb_remove_table() is only distinct from tlb_remove_pag=
e()
when an architecture defines its own removal function. I'm not too familiar
with most of their differences, but we can probably continue to let them do
that. As of now, I'm not too sure what a distinct type would look like that
could meet all their needs holistically.

> >
> > Another option is to leave pmd_pgtable_page() as is just for this case.
> > Or we can revert commit 7e25de77bc5ea which uses the function here
> > then figure out where these gmap pages table pages will go later.
>
> I'm always confused when reading gmap code, so let me have another look :=
)
>
> The confusing part is that s390x shares the lowest level page tables
> (PTE tables) between the process and gmap ("guest mapping", similar to
> EPT on x86-64). It maps these process PTE tables (covering 1 MiB) into
> gmap-specific PMD tables.

Especially in cases like this. If the architecture wants to share page tabl=
es
then everything being in form ptdesc would make that easiest, and
continue to let them define their own niche functions for their needs.

> pmd_pgtable_page() should indeed always give us a gmap-specific
> PMD-table. In fact, something allocated via gmap_alloc_table().
>
> Decoupling both concepts sounds like a good idea.

Yeah, I'm not a fan of how this gmap caller is the only external caller
using this to get a page for their own purposes. I'll update that in v2.

