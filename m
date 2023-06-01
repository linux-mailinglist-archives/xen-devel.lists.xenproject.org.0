Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690C8719480
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 09:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542267.845929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4cv4-0002I9-KG; Thu, 01 Jun 2023 07:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542267.845929; Thu, 01 Jun 2023 07:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4cv4-0002Fh-FV; Thu, 01 Jun 2023 07:40:26 +0000
Received: by outflank-mailman (input) for mailman id 542267;
 Thu, 01 Jun 2023 07:40:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ddig=BV=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1q4cv2-0001R4-Aa
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 07:40:24 +0000
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90bb0400-004f-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 09:40:23 +0200 (CEST)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-b9a6eec8611so2796910276.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 00:40:23 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 p187-20020a0dffc4000000b00545a08184cesm3332650ywf.94.2023.06.01.00.40.21
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 00:40:21 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-b9a6eec8611so2796880276.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 00:40:21 -0700 (PDT)
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
X-Inumbo-ID: 90bb0400-004f-11ee-b231-6b7b168915f2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685605222; x=1688197222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Vy5gwXbACIYw+FA/+yi3OHDGD1kIURAtfeea/c7peI=;
        b=h266wHCAICRSsZEdOdMeUOBd8a9PQBMmW9BTlGqBSnaUIeerf7YBb5j9bZuIsxFGur
         dLnuqiJyikvrKGBA22Slv739ojK6u45RDSyY80EeiiGojCPa/3cB9EEwX9aewewtsbur
         B41khPEnGUXGJIilgfwoSZ7IU58Toa/tQ7EzLIp/tn4JGX27XB7UyenNrmFEIWexm6EZ
         7JzQr7j2QLyPswtjd3Dwgh5X5dR86lWzH2gE14Ee57Pj3WJAO2SyOSdN5OUVZZNSEVVp
         TtN1lU9VxOGUAh9Qlh9S9Cx5ZmzNly1sC7Mywgufz3REu2wwZe8fg8trBO0gitpJfKG0
         vWnQ==
X-Gm-Message-State: AC+VfDw+YIbb+3oSjZwokTpBY1eoST8SQf/Exl1FFhprSoRG0YRtIH9A
	/LeUm5hQpHib8mAEzoILstGjxNquDYVP7A==
X-Google-Smtp-Source: ACHHUZ5torXLqj0xGp8GVg6G3NWX22V/SmkSZa8JcpBv5+1fSyc61EpRdHl/H4S9p0O71NqJoUnsxg==
X-Received: by 2002:a81:6c95:0:b0:561:987e:27a with SMTP id h143-20020a816c95000000b00561987e027amr953304ywc.10.1685605222047;
        Thu, 01 Jun 2023 00:40:22 -0700 (PDT)
X-Received: by 2002:a81:a041:0:b0:565:9f61:c771 with SMTP id
 x62-20020a81a041000000b005659f61c771mr1176431ywg.9.1685605221248; Thu, 01 Jun
 2023 00:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com> <20230531213032.25338-26-vishal.moola@gmail.com>
In-Reply-To: <20230531213032.25338-26-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Jun 2023 09:40:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCe=VsTJYNA_-k=JipeAGKzgBFjZ8i+XRK7U1DBei=7A@mail.gmail.com>
Message-ID: <CAMuHMdWCe=VsTJYNA_-k=JipeAGKzgBFjZ8i+XRK7U1DBei=7A@mail.gmail.com>
Subject: Re: [PATCH v3 25/34] m68k: Convert various functions to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
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

Hi Vishal,

On Wed, May 31, 2023 at 11:32=E2=80=AFPM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> As part of the conversions to replace pgtable constructor/destructors wit=
h
> ptdesc equivalents, convert various page table functions to use ptdescs.
>
> Some of the functions use the *get*page*() helper functions. Convert
> these to use pagetable_alloc() and ptdesc_address() instead to help
> standardize page tables further.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Thanks for your patch!

> --- a/arch/m68k/include/asm/mcf_pgalloc.h
> +++ b/arch/m68k/include/asm/mcf_pgalloc.h
> @@ -7,20 +7,19 @@
>
>  extern inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
>  {
> -       free_page((unsigned long) pte);
> +       pagetable_free(virt_to_ptdesc(pte));
>  }
>
>  extern const char bad_pmd_string[];
>
>  extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
>  {
> -       unsigned long page =3D __get_free_page(GFP_DMA);
> +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_DMA | __GFP_ZERO, 0=
);
>
> -       if (!page)
> +       if (!ptdesc)
>                 return NULL;
>
> -       memset((void *)page, 0, PAGE_SIZE);
> -       return (pte_t *) (page);
> +       return (pte_t *) (ptdesc_address(ptdesc));

No need to cast "void *" when returning a different pointer type.

>  }
>
>  extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
> @@ -35,36 +34,36 @@ extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, uns=
igned long address)
>  static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pgta=
ble,
>                                   unsigned long address)
>  {
> -       struct page *page =3D virt_to_page(pgtable);
> +       struct ptdesc *ptdesc =3D virt_to_ptdesc(pgtable);
>
> -       pgtable_pte_page_dtor(page);
> -       __free_page(page);
> +       pagetable_pte_dtor(ptdesc);
> +       pagetable_free(ptdesc);
>  }
>
>  static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
>  {
> -       struct page *page =3D alloc_pages(GFP_DMA, 0);
> +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_DMA, 0);
>         pte_t *pte;
>
> -       if (!page)
> +       if (!ptdesc)
>                 return NULL;
> -       if (!pgtable_pte_page_ctor(page)) {
> -               __free_page(page);
> +       if (!pagetable_pte_ctor(ptdesc)) {
> +               pagetable_free(ptdesc);
>                 return NULL;
>         }
>
> -       pte =3D page_address(page);
> -       clear_page(pte);
> +       pte =3D ptdesc_address(ptdesc);
> +       pagetable_clear(pte);
>
>         return pte;
>  }
>
>  static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
>  {
> -       struct page *page =3D virt_to_page(pgtable);
> +       struct ptdesc *ptdesc =3D virt_to_ptdesc(ptdesc);

virt_to_ptdesc(pgtable)

(You can build this using m5475evb_defconfig)

>
> -       pgtable_pte_page_dtor(page);
> -       __free_page(page);
> +       pagetable_pte_dtor(ptdesc);
> +       pagetable_free(ptdesc);
>  }
>
>  /*
> @@ -75,16 +74,18 @@ static inline void pte_free(struct mm_struct *mm, pgt=
able_t pgtable)
>
>  static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
>  {
> -       free_page((unsigned long) pgd);
> +       pagetable_free(virt_to_ptdesc(pgd));
>  }
>
>  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
>         pgd_t *new_pgd;
> +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_DMA | GFP_NOWARN, 0=
);
>
> -       new_pgd =3D (pgd_t *)__get_free_page(GFP_DMA | __GFP_NOWARN);
> -       if (!new_pgd)
> +       if (!ptdesc)
>                 return NULL;
> +       new_pgd =3D (pgd_t *) ptdesc_address(ptdesc);

No need to cast "void *" when assigning to a different pointer type.

> +
>         memcpy(new_pgd, swapper_pg_dir, PTRS_PER_PGD * sizeof(pgd_t));
>         memset(new_pgd, 0, PAGE_OFFSET >> PGDIR_SHIFT);
>         return new_pgd;

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

