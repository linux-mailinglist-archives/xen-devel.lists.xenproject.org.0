Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EEC719558
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 10:20:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542314.846018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dXr-0003JQ-1X; Thu, 01 Jun 2023 08:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542314.846018; Thu, 01 Jun 2023 08:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dXq-0003Gv-Ub; Thu, 01 Jun 2023 08:20:30 +0000
Received: by outflank-mailman (input) for mailman id 542314;
 Thu, 01 Jun 2023 08:20:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z8Gk=BV=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4dXo-0003Gi-VJ
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 08:20:29 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29d95d85-0055-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 10:20:27 +0200 (CEST)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-565ba6aee5fso5776857b3.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 01:20:27 -0700 (PDT)
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
X-Inumbo-ID: 29d95d85-0055-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685607627; x=1688199627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tS4a1xOgxMUMLEbnCg0V4q+ycCWx2xlztmESkIXckyo=;
        b=bIHOxHzjZXokee9j5bbLR5t5pc8c2Z3iggLrV1+hE0XnEXAKfoXhCLHOSa/72NNKfd
         6fz4mYEsaohJNpEL4Rs9VL4vNpL+O0IFENkKP8Ed1r56LzcraMW5AYAo4x/ntCtiU2p3
         x22qNSqmdrlW4Y/tGkgjrEwyv71XC2UWZFG42WlTnI/gnlPQ9bm7CQBxLeRufsNGf3b3
         aSnEcs9elD0+6oKwXRc6fHvLfsfn4GZRVVoYihKOLOoIEu2kuGpVvxaorPdvDNijmjMi
         d1rL9Zr7ifZGWT0hflvFwiRNteKQuaUR21zo007VMcTBghI8tw53RKKaLOkzxLItE6zV
         XEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685607627; x=1688199627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tS4a1xOgxMUMLEbnCg0V4q+ycCWx2xlztmESkIXckyo=;
        b=U0SDMB8JePaQYqLv+NM1VxFsOdd4u969G0Sijkzu6Lj2EeWymt6TgbIE5LFu4U6z58
         9YZXI3vQm5xwwV9NPRCznOH2XORgHsc77ax0dpYRl1NHBdV5sdehnfVgbhLaGsbj8mw4
         +eL+G38U/2KARno//I/brnRQKaQ1LAx2Whe4dP9n9/fW2YTlvj6Dao4DDgdPUKQu3Yyj
         /DoA7i3/fTcCmsCPKSiqjVSyfPZ3k+H+Q5KlYJWXr5DYRCsF5M78yPOMl/IpUXXqcuVr
         ujVx3LUj/mm+Ur05G+gR9fWmg5h3wwiPpkxTVXkiETtVciCER7GU5pJkThXIE8pyPuQh
         ReQQ==
X-Gm-Message-State: AC+VfDzJ3nvmPfWCPax8iMhCqFQ1x034IP6F/hIP/GRA6EZzYrs2e4y3
	7ZAM1l5Au3p0uFwh1G+bQESkY2nmQXVbS5OxlQg=
X-Google-Smtp-Source: ACHHUZ4IZT44NtIfRs/xlbKnWFcG4D7AEEUxUuudHP/RnlDvS1B/rq8axgox+tzLkd9y6rosB3Zw4KNqjFWW/wbAOr8=
X-Received: by 2002:a81:7785:0:b0:565:7d7:1356 with SMTP id
 s127-20020a817785000000b0056507d71356mr8254467ywc.22.1685607626688; Thu, 01
 Jun 2023 01:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com>
 <20230531213032.25338-26-vishal.moola@gmail.com> <CAMuHMdWCe=VsTJYNA_-k=JipeAGKzgBFjZ8i+XRK7U1DBei=7A@mail.gmail.com>
In-Reply-To: <CAMuHMdWCe=VsTJYNA_-k=JipeAGKzgBFjZ8i+XRK7U1DBei=7A@mail.gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 1 Jun 2023 01:20:15 -0700
Message-ID: <CAOzc2pzVEO_LSw1Ffwk1K3sXni_32wO0T+fEAnR6zVVB5x=vVA@mail.gmail.com>
Subject: Re: [PATCH v3 25/34] m68k: Convert various functions to use ptdescs
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Thu, Jun 1, 2023 at 12:40=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Vishal,
>
> On Wed, May 31, 2023 at 11:32=E2=80=AFPM Vishal Moola (Oracle)
> <vishal.moola@gmail.com> wrote:
> > As part of the conversions to replace pgtable constructor/destructors w=
ith
> > ptdesc equivalents, convert various page table functions to use ptdescs=
.
> >
> > Some of the functions use the *get*page*() helper functions. Convert
> > these to use pagetable_alloc() and ptdesc_address() instead to help
> > standardize page tables further.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>
> Thanks for your patch!
>
> > --- a/arch/m68k/include/asm/mcf_pgalloc.h
> > +++ b/arch/m68k/include/asm/mcf_pgalloc.h
> > @@ -7,20 +7,19 @@
> >
> >  extern inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
> >  {
> > -       free_page((unsigned long) pte);
> > +       pagetable_free(virt_to_ptdesc(pte));
> >  }
> >
> >  extern const char bad_pmd_string[];
> >
> >  extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
> >  {
> > -       unsigned long page =3D __get_free_page(GFP_DMA);
> > +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_DMA | __GFP_ZERO,=
 0);
> >
> > -       if (!page)
> > +       if (!ptdesc)
> >                 return NULL;
> >
> > -       memset((void *)page, 0, PAGE_SIZE);
> > -       return (pte_t *) (page);
> > +       return (pte_t *) (ptdesc_address(ptdesc));
>
> No need to cast "void *" when returning a different pointer type.
>
> >  }
> >
> >  extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long addres=
s)
> > @@ -35,36 +34,36 @@ extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, u=
nsigned long address)
> >  static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pg=
table,
> >                                   unsigned long address)
> >  {
> > -       struct page *page =3D virt_to_page(pgtable);
> > +       struct ptdesc *ptdesc =3D virt_to_ptdesc(pgtable);
> >
> > -       pgtable_pte_page_dtor(page);
> > -       __free_page(page);
> > +       pagetable_pte_dtor(ptdesc);
> > +       pagetable_free(ptdesc);
> >  }
> >
> >  static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
> >  {
> > -       struct page *page =3D alloc_pages(GFP_DMA, 0);
> > +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_DMA, 0);
> >         pte_t *pte;
> >
> > -       if (!page)
> > +       if (!ptdesc)
> >                 return NULL;
> > -       if (!pgtable_pte_page_ctor(page)) {
> > -               __free_page(page);
> > +       if (!pagetable_pte_ctor(ptdesc)) {
> > +               pagetable_free(ptdesc);
> >                 return NULL;
> >         }
> >
> > -       pte =3D page_address(page);
> > -       clear_page(pte);
> > +       pte =3D ptdesc_address(ptdesc);
> > +       pagetable_clear(pte);
> >
> >         return pte;
> >  }
> >
> >  static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
> >  {
> > -       struct page *page =3D virt_to_page(pgtable);
> > +       struct ptdesc *ptdesc =3D virt_to_ptdesc(ptdesc);
>
> virt_to_ptdesc(pgtable)
>
> (You can build this using m5475evb_defconfig)
>
> >
> > -       pgtable_pte_page_dtor(page);
> > -       __free_page(page);
> > +       pagetable_pte_dtor(ptdesc);
> > +       pagetable_free(ptdesc);
> >  }
> >
> >  /*
> > @@ -75,16 +74,18 @@ static inline void pte_free(struct mm_struct *mm, p=
gtable_t pgtable)
> >
> >  static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
> >  {
> > -       free_page((unsigned long) pgd);
> > +       pagetable_free(virt_to_ptdesc(pgd));
> >  }
> >
> >  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
> >  {
> >         pgd_t *new_pgd;
> > +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_DMA | GFP_NOWARN,=
 0);
> >
> > -       new_pgd =3D (pgd_t *)__get_free_page(GFP_DMA | __GFP_NOWARN);
> > -       if (!new_pgd)
> > +       if (!ptdesc)
> >                 return NULL;
> > +       new_pgd =3D (pgd_t *) ptdesc_address(ptdesc);
>
> No need to cast "void *" when assigning to a different pointer type.
>
> > +
> >         memcpy(new_pgd, swapper_pg_dir, PTRS_PER_PGD * sizeof(pgd_t));
> >         memset(new_pgd, 0, PAGE_OFFSET >> PGDIR_SHIFT);
> >         return new_pgd;
>
> The rest LGTM.

Thanks so much for the review! I'll make those changes in the next
version.


> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

