Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9844072F934
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 11:30:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548620.856631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Mpc-0003Da-QA; Wed, 14 Jun 2023 09:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548620.856631; Wed, 14 Jun 2023 09:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Mpc-0003Bv-NE; Wed, 14 Jun 2023 09:30:24 +0000
Received: by outflank-mailman (input) for mailman id 548620;
 Wed, 14 Jun 2023 09:30:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TMwe=CC=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1q9Mpa-0003Bp-JF
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 09:30:22 +0000
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1450e944-0a96-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 11:30:20 +0200 (CEST)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-bc4ed01b5d4so407410276.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 02:30:20 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 q15-20020a258e8f000000b00ba773472647sm3451397ybl.19.2023.06.14.02.30.17
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 02:30:17 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-56d4f50427cso5150067b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 02:30:17 -0700 (PDT)
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
X-Inumbo-ID: 1450e944-0a96-11ee-8611-37d641c3527e
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686735019; x=1689327019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUg4qrNPX3u1L7teHyX+L+B+2nv6pGpY1jj7jQmio6E=;
        b=BqmBjV4P7uhmAWwiJzg8A9eLUuUg+ccwqU+GQt+YqQUmXN/sMyeHVTFxibN5+3G98m
         2SWGsHwbgzkRe+8TuEqYbvbdbZisSQLThA41UvqIdd1ToDzBFWTg4+YHcEhe0ZnSQS6W
         4KOZvUFxyXblH508j38ovflHq266ZcHz9VqLVhms7j9wL0VmSQenhEwNEzMA/7AI6SHw
         BdwV0Yr3BDYgUVPKHuLXGjh9iIRB7HDsKst6RtOLUGJ8WPuVTAnSZwBHMO1hWtGBCYrj
         FY9OoDv27clYd7/0lqdsfBjT8kuXzY8b5nTdc3Vt/g3IC7ezQ8SMTTBmSa1aBNz8xJnQ
         hExA==
X-Gm-Message-State: AC+VfDxH+tyaasDc6SfNt7BvNmwOQmgVkQYzVfjgroWAn+775ke2WhUy
	+bIRBEwzhbcipoIdl/x3Te6F0dckYWyjAw==
X-Google-Smtp-Source: ACHHUZ6iCcVUCmAseLAwQ3d5lJpcX0135fVnxgDN/iDwZN8ODX0vbuNnuIg3P45JWTMjVsFRJZjcTQ==
X-Received: by 2002:a25:b4c:0:b0:bd7:4ee7:887b with SMTP id 73-20020a250b4c000000b00bd74ee7887bmr1323065ybl.37.1686735018989;
        Wed, 14 Jun 2023 02:30:18 -0700 (PDT)
X-Received: by 2002:a25:6b47:0:b0:ba8:2009:ccbb with SMTP id
 o7-20020a256b47000000b00ba82009ccbbmr1338474ybm.46.1686735017346; Wed, 14 Jun
 2023 02:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-28-vishal.moola@gmail.com> <e52c7a74-da68-08d2-54e2-f95a8c5b52e7@kernel.org>
In-Reply-To: <e52c7a74-da68-08d2-54e2-f95a8c5b52e7@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jun 2023 11:30:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPASfLM8St_JZOW3Wke+ickJoo1oDr+orRbTERy=Zgwg@mail.gmail.com>
Message-ID: <CAMuHMdXPASfLM8St_JZOW3Wke+ickJoo1oDr+orRbTERy=Zgwg@mail.gmail.com>
Subject: Re: [PATCH v4 27/34] nios2: Convert __pte_free_tlb() to use ptdescs
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dinh,

On Wed, Jun 14, 2023 at 12:17=E2=80=AFAM Dinh Nguyen <dinguyen@kernel.org> =
wrote:
> On 6/12/23 16:04, Vishal Moola (Oracle) wrote:
> > Part of the conversions to replace pgtable constructor/destructors with
> > ptdesc equivalents.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >   arch/nios2/include/asm/pgalloc.h | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/=
pgalloc.h
> > index ecd1657bb2ce..ce6bb8e74271 100644
> > --- a/arch/nios2/include/asm/pgalloc.h
> > +++ b/arch/nios2/include/asm/pgalloc.h
> > @@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *m=
m, pmd_t *pmd,
> >
> >   extern pgd_t *pgd_alloc(struct mm_struct *mm);
> >
> > -#define __pte_free_tlb(tlb, pte, addr)                               \
> > -     do {                                                    \
> > -             pgtable_pte_page_dtor(pte);                     \
> > -             tlb_remove_page((tlb), (pte));                  \
> > +#define __pte_free_tlb(tlb, pte, addr)                                =
       \
> > +     do {                                                            \
> > +             pagetable_pte_dtor(page_ptdesc(pte));                   \
> > +             tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
> >       } while (0)
> >
> >   #endif /* _ASM_NIOS2_PGALLOC_H */
>
> Applied!

I don't think you can just apply this patch, as the new functions
were only introduced in [PATCH v4 05/34] of this series.

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

