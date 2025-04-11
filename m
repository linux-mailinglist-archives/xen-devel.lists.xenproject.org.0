Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC1CA854B8
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 08:53:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946632.1344452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u38Gj-0003mZ-HX; Fri, 11 Apr 2025 06:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946632.1344452; Fri, 11 Apr 2025 06:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u38Gj-0003kx-Ec; Fri, 11 Apr 2025 06:53:41 +0000
Received: by outflank-mailman (input) for mailman id 946632;
 Fri, 11 Apr 2025 06:53:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8esB=W5=gmail.com=npiggin@srs-se1.protection.inumbo.net>)
 id 1u38Gi-0003kr-4S
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 06:53:40 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b005288e-16a1-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 08:53:35 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-227b650504fso15887755ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 23:53:37 -0700 (PDT)
Received: from localhost ([220.253.99.94]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd2333841sm728200b3a.160.2025.04.10.23.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 23:53:35 -0700 (PDT)
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
X-Inumbo-ID: b005288e-16a1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744354416; x=1744959216; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0GUgempXeR1Ai6jdCUdrwnFpwuRrrfXxvPcXnoqanQ=;
        b=Ldia82s7as7tJlNW8WcmKpre+QshRcjt+jfeTjK49Abm5XAAPDksxahSlkEvujV+Kk
         GuyM2Jvwiu4JcJaAWR+5a2Z0p6Ea/8KkUAoSyit1ahZ9MRDdpMvVkw0u13OCo1NtEMUC
         ODbUxVrQsTSJdPT6xXn2NnbcP0jkcqZ0wfP/fFVRWMaSQOd/wIqPh6K3s5z+MRxVhHau
         S+VWizpVq4lfv6nf2DU8Do/c+gJ3l1AZKbFp0IH8Th2BbDqTI6qHZIyhCERZl8cQJwmm
         LN/MGXzH4h+PwwN7WS4qRx1xdBiVXXfmIce3DEBOjlY7xgNuz6e1yU9wEmapY6dr4byw
         s10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744354416; x=1744959216;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q0GUgempXeR1Ai6jdCUdrwnFpwuRrrfXxvPcXnoqanQ=;
        b=BVzN0e/puqIftkc6MlotBie9p1pXZDSwDfq05itKsIuUi9jEtMqgI8Gs/Hkc+wYCgP
         RKmDXOxre8N1/f9jBjA5uE6lpcFQka68CZWWh4Vfsg1a0Jp9x8vuOypX8w0LlPiKp3x9
         +KGshgPaqwxITl1MUnwDf3aBwsJMWsHtd23Ef6f7MwpttFnoS8vVAMxwND8rGJvy6Zgz
         TUQC5v8G3/dxjLIm30rPN7cejABxEaeknaCSiwhCFLhHsjUGtfuurx1wAA5q9AAW6aOD
         7NqM09z07QFHFS7CnXM/rn650hmvdiLCD3bDfCqy/JLL2jstSFMZYoxqmDdjrMb5LRNN
         SpnA==
X-Forwarded-Encrypted: i=1; AJvYcCW9wApi3kVgcmUjAp/i8shFDE4E3n2frUsUrRtLTatFNEDU3qWZkEZ7o8x4YpIhygPNKLFLOkx56dY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzzp00BvVLn/SBgAWY/tiyKjYuw9nEecVaNWbME1FA2hnQC2SMG
	gIYjopZNcYCVr9dxWTiXFNoNUPKKYqX7wdKxZPM3vU50+nS9eKZ2
X-Gm-Gg: ASbGncsSEbwnjtcw+jfLHSfTQA2GpJUL57pUDbNGmCC9VizVV2iGWXpkt8EDyRb8KMj
	n+sGO3PoT8Jg7/0g8fgXNWvwRjs9E//2ny0OGXjW9R59WGYWxy/7Aw4YH2TcHiIbwAV3hg9dgXg
	brJRfN9YtWH50zz7uMgIKsrzHEMeXg2hOde6N33ugeTVyTe8fcHnmMfCJPmYE18CLVPRnJxrZXo
	RuSYJfX0TmuTcqrMRDCCIcUkLRyhI7giqxFLYeGcwNCX0ygDtGERzCWElrh0SjEIBf0LGF3pBAU
	D7dVC7Xrytp0Evtz8PR6g6JTj6DyyB3N2g==
X-Google-Smtp-Source: AGHT+IGl0nL5wKmwFlWsQ9ssGXCB2kOLf/x4PGlQUnJhSihZMIEaJP/+c7G4d96OdeU+R8O+pnzM/Q==
X-Received: by 2002:a17:902:cec4:b0:224:e33:889b with SMTP id d9443c01a7336-22bea4ade03mr24590165ad.12.1744354416369;
        Thu, 10 Apr 2025 23:53:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 16:53:29 +1000
Message-Id: <D93M14UCYU7Y.39ZQIH7VON6DG@gmail.com>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Alexander Gordeev" <agordeev@linux.ibm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>
Cc: "Hugh Dickins" <hughd@google.com>, "Guenter Roeck" <linux@roeck-us.net>,
 "Juergen Gross" <jgross@suse.com>, "Jeremy Fitzhardinge" <jeremy@goop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <kasan-dev@googlegroups.com>, <sparclinux@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-s390@vger.kernel.org>
Subject: Re: [PATCH v1 3/4] mm: Protect kernel pgtables in
 apply_to_pte_range()
X-Mailer: aerc 0.19.0
References: <cover.1744037648.git.agordeev@linux.ibm.com>
 <11dbe3ac88130dbd2b8554f9369cd93fe138c655.1744037648.git.agordeev@linux.ibm.com>
In-Reply-To: <11dbe3ac88130dbd2b8554f9369cd93fe138c655.1744037648.git.agordeev@linux.ibm.com>

On Tue Apr 8, 2025 at 1:11 AM AEST, Alexander Gordeev wrote:
> The lazy MMU mode can only be entered and left under the protection
> of the page table locks for all page tables which may be modified.
> Yet, when it comes to kernel mappings apply_to_pte_range() does not
> take any locks. That does not conform arch_enter|leave_lazy_mmu_mode()
> semantics and could potentially lead to re-schedulling a process while
> in lazy MMU mode or racing on a kernel page table updates.
>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  mm/kasan/shadow.c | 7 ++-----
>  mm/memory.c       | 5 ++++-
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index edfa77959474..6531a7aa8562 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -308,14 +308,14 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, =
unsigned long addr,
>  	__memset((void *)page, KASAN_VMALLOC_INVALID, PAGE_SIZE);
>  	pte =3D pfn_pte(PFN_DOWN(__pa(page)), PAGE_KERNEL);
> =20
> -	spin_lock(&init_mm.page_table_lock);
>  	if (likely(pte_none(ptep_get(ptep)))) {
>  		set_pte_at(&init_mm, addr, ptep, pte);
>  		page =3D 0;
>  	}
> -	spin_unlock(&init_mm.page_table_lock);
> +
>  	if (page)
>  		free_page(page);
> +
>  	return 0;
>  }
> =20

kasan_populate_vmalloc_pte() is really the only thing that
takes the ptl in the apply_to_page_range fn()... Looks like
you may be right. I wonder why they do and nobody else? Just
luck?

Seems okay.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> @@ -401,13 +401,10 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep=
, unsigned long addr,
> =20
>  	page =3D (unsigned long)__va(pte_pfn(ptep_get(ptep)) << PAGE_SHIFT);
> =20
> -	spin_lock(&init_mm.page_table_lock);
> -
>  	if (likely(!pte_none(ptep_get(ptep)))) {
>  		pte_clear(&init_mm, addr, ptep);
>  		free_page(page);
>  	}
> -	spin_unlock(&init_mm.page_table_lock);
> =20
>  	return 0;
>  }
> diff --git a/mm/memory.c b/mm/memory.c
> index f0201c8ec1ce..1f3727104e99 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2926,6 +2926,7 @@ static int apply_to_pte_range(struct mm_struct *mm,=
 pmd_t *pmd,
>  			pte =3D pte_offset_kernel(pmd, addr);
>  		if (!pte)
>  			return err;
> +		spin_lock(&init_mm.page_table_lock);
>  	} else {
>  		if (create)
>  			pte =3D pte_alloc_map_lock(mm, pmd, addr, &ptl);
> @@ -2951,7 +2952,9 @@ static int apply_to_pte_range(struct mm_struct *mm,=
 pmd_t *pmd,
> =20
>  	arch_leave_lazy_mmu_mode();
> =20
> -	if (mm !=3D &init_mm)
> +	if (mm =3D=3D &init_mm)
> +		spin_unlock(&init_mm.page_table_lock);
> +	else
>  		pte_unmap_unlock(mapped_pte, ptl);
> =20
>  	*mask |=3D PGTBL_PTE_MODIFIED;


