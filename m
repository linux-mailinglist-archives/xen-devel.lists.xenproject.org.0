Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7C973CF8A
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 10:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554767.866169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDLT8-0002PM-RD; Sun, 25 Jun 2023 08:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554767.866169; Sun, 25 Jun 2023 08:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDLT8-0002MQ-OW; Sun, 25 Jun 2023 08:51:38 +0000
Received: by outflank-mailman (input) for mailman id 554767;
 Sun, 25 Jun 2023 08:51:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fU+Z=CN=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1qDLT7-0002MK-09
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 08:51:37 +0000
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c7f8fd1-1335-11ee-8611-37d641c3527e;
 Sun, 25 Jun 2023 10:51:34 +0200 (CEST)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-5700b15c12fso23298897b3.1
 for <xen-devel@lists.xenproject.org>; Sun, 25 Jun 2023 01:51:34 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 h12-20020a816c0c000000b0056974f4019esm739590ywc.6.2023.06.25.01.51.30
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 01:51:31 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-c1061f0c282so1488279276.1
 for <xen-devel@lists.xenproject.org>; Sun, 25 Jun 2023 01:51:30 -0700 (PDT)
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
X-Inumbo-ID: 7c7f8fd1-1335-11ee-8611-37d641c3527e
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687683093; x=1690275093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/Aydrd9oAz9wF8VtbGA6a+XUUai3n6kkWsRZbAgo9o=;
        b=fE8yv0ffdTO4Rj2edGad1URecaUDJ4SvdXaHi6IX0tHnd29p74jcNeLvbnYN6A+1mN
         LrN0I1Dhd1dQi/Y1UiFv3tf4RYM+dT1bVk3bBmGfWHAieGnEvGVleJOr7WHqZPIn7/Lm
         hE/9wCgjWqOSAvPNmd3y4mGXy8Gm2+Q5tKLusenNteOEkFrvK7Imo3SdOF+BHQ2O8ezF
         Wp5yvi7PC2jVi5fiPYBNz5VN865WAkW8m76M71r5NXKX+rtlCKP5ZmZgV0q/6VbIjVHP
         OVA1iZdzzEcrBa60dVXT4ChicSB94bGEcsizw4NI/QjbMYZHrq8bx71Sfnjis76cZoNA
         QIUQ==
X-Gm-Message-State: AC+VfDygLuNixlJa0vr656efWCbz9coS9iOIO8K2qFm9kcnXt8Ox/HOM
	uP9yBcWoDnU7QCKxRIwDBdjexOkIES5fsA==
X-Google-Smtp-Source: ACHHUZ6sN6S5VHeGt2EctJXD+n/4jAn/Q0WpNuKmvnFV5dWIU3+UdS5XU80m9iFmq3AnZrQxS9VtHg==
X-Received: by 2002:a81:920c:0:b0:56f:ff88:2e43 with SMTP id j12-20020a81920c000000b0056fff882e43mr28309347ywg.27.1687683093147;
        Sun, 25 Jun 2023 01:51:33 -0700 (PDT)
X-Received: by 2002:a25:cc02:0:b0:c13:f86d:3324 with SMTP id
 l2-20020a25cc02000000b00c13f86d3324mr3724376ybf.14.1687683090555; Sun, 25 Jun
 2023 01:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230622205745.79707-1-vishal.moola@gmail.com> <20230622205745.79707-25-vishal.moola@gmail.com>
In-Reply-To: <20230622205745.79707-25-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 25 Jun 2023 10:51:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2ZM1oJ7=Br6nezLpxjDQo_07N3T-adOupDm0Jntp=Qg@mail.gmail.com>
Message-ID: <CAMuHMdU2ZM1oJ7=Br6nezLpxjDQo_07N3T-adOupDm0Jntp=Qg@mail.gmail.com>
Subject: Re: [PATCH v5 24/33] m68k: Convert various functions to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vishal,

On Thu, Jun 22, 2023 at 10:58=E2=80=AFPM Vishal Moola (Oracle)
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

>  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
>         pgd_t *new_pgd;
> +       struct ptdesc *ptdesc =3D pagetable_alloc((GFP_DMA | GFP_NOWARN) =
&

0-day already told you for v3 that GFP_NOWARN does not exist.
Please try cross-compiling your changes:
https://mirrors.edge.kernel.org/pub/tools/crosstool/

> +                       ~__GFP_HIGHMEM, 0);
>
> -       new_pgd =3D (pgd_t *)__get_free_page(GFP_DMA | __GFP_NOWARN);
> -       if (!new_pgd)
> +       if (!ptdesc)
>                 return NULL;
> +       new_pgd =3D ptdesc_address(ptdesc);
> +
>         memcpy(new_pgd, swapper_pg_dir, PTRS_PER_PGD * sizeof(pgd_t));
>         memset(new_pgd, 0, PAGE_OFFSET >> PGDIR_SHIFT);
>         return new_pgd;

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

