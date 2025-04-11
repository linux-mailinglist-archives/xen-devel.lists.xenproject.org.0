Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2417A8549A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 08:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946619.1344441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u38AQ-0000ZG-Tt; Fri, 11 Apr 2025 06:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946619.1344441; Fri, 11 Apr 2025 06:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u38AQ-0000X4-R7; Fri, 11 Apr 2025 06:47:10 +0000
Received: by outflank-mailman (input) for mailman id 946619;
 Fri, 11 Apr 2025 06:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8esB=W5=gmail.com=npiggin@srs-se1.protection.inumbo.net>)
 id 1u38AP-0000Ww-3K
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 06:47:09 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c716536c-16a0-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 08:47:04 +0200 (CEST)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-227914acd20so22778215ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 23:47:07 -0700 (PDT)
Received: from localhost ([220.253.99.94]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7b8b2c1sm41872295ad.59.2025.04.10.23.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 23:47:04 -0700 (PDT)
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
X-Inumbo-ID: c716536c-16a0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744354025; x=1744958825; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlT93k3tsOOzLmAYutjlNjX6BFvDuWnFmTQ9IJuMKl4=;
        b=lFi4vxnUNMJw2iAx0kjzL6nS5NniBwJtNinsFzF8E2yZ76d9El9Q5al4BV+Y5Q4X09
         ZOe8t9E2rJx3sp24/6afwwYg/RRdj2L70vfYOuuX5RG2pYSgLkDk5L1Rue9slXezhJpm
         9/gn2/E8/ImFsKR1ybd3bQ2otV3wCxu/LIkHbqURpn68YVQ+QYAGODHZ4gIgURCOs8fQ
         RDhrz0kXLOoe9aEojfn+om1sljsHqSH39rSXwnl4gFWYQmOx+hsizLOgcqf2AJbsSFQ6
         Qp+V1zXHZtcww4p9Pr2aA5IiAIYZvtNilT0B5J05m6e5t+/5OW4SSD9FsZS8v07uyXND
         d8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744354025; x=1744958825;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BlT93k3tsOOzLmAYutjlNjX6BFvDuWnFmTQ9IJuMKl4=;
        b=n1yIXb3x0nLgtUZD5dAAmdzG5g8MHPWY3+RqWNaAOg59fSmFyXjXMgIj8BXcscNEg1
         sHv8d4fA4YAwafJ770UD88ZccM0tKqJJrtBkVjOOuu5eUb8BFPyuDncQ9nOFEkO9GSWE
         TECebdIED3zMlNl7qKzB2IEpZbuxVOJcdHBZDfE/wRkcgnZqvYIJgE8VEmOzqplGgkbH
         PzVGQNcE4Yd3ZMb7DeW/sHOeMVi9oq3//vjDQ2PM3bLvPiQk5gx6p1+5eCblerU9SM05
         hIHIzZooLtdAuTBG4XrNVCtselQ3YjZzAe09+HCAtaR9+4HlcqBjmGUL8XICmGEU47zC
         ILpg==
X-Forwarded-Encrypted: i=1; AJvYcCVHsd1hyMmuYY4h1ikmL+A4051FgftOYtZ3v/OArhEAP5NjGQIfb8Kvu8NvRvxOZtMDb0FIvqkgoaw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7K355JW8AQDWSgN3C8+wqIO4aY5unc0i7TaEv/ZXuyLzjpn+L
	JCMmZpS7ydw/R4Qz+2ciWluD9OLdduBGNMfaGdd7vBX8zSid+tXD
X-Gm-Gg: ASbGncuGV4kHjXZqGVlAoi5q2pcPRT0W3kjRcpNEyM4+VoRsAsUt48AsUoh1OvtyXsa
	g0PxCQC3kCLBZrzYLBwX+Gk5qDjtg/KjJRRBno2VcPXZQ5sLI+GTq+ddpa+AzEJWsMxdfZZkTY1
	d4sG8v+KQY9TggNgo38DDLS1ynbRzsBVOKvofCfcfft1/J1O25KlvS714cTvXC9S88+TrUpKxk/
	c8+GOAdRyqN32VARp0Ya0dj0iIHSZC6/ICGDhhyn7ZPBk9eVd5TY8nFti8bRkkM448AsurJ4LDS
	hBi84a/Cpr+qz2d7sN33Xb8TJ/q91kqJMw==
X-Google-Smtp-Source: AGHT+IEaCH7pfyseCsY0ABQGUFfCNsdZ0JepyMppPzef2Ij2uLIjrUD7lNR1McifQnqxw6aLmm43tw==
X-Received: by 2002:a17:902:d489:b0:215:58be:3349 with SMTP id d9443c01a7336-22bea05e17fmr25293145ad.14.1744354025413;
        Thu, 10 Apr 2025 23:47:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 16:46:58 +1000
Message-Id: <D93LW58FLXOS.2U8X0CO2H9H5S@gmail.com>
Subject: Re: [PATCH v1 2/4] mm: Cleanup apply_to_pte_range() routine
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Alexander Gordeev" <agordeev@linux.ibm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>
Cc: "Hugh Dickins" <hughd@google.com>, "Guenter Roeck" <linux@roeck-us.net>,
 "Juergen Gross" <jgross@suse.com>, "Jeremy Fitzhardinge" <jeremy@goop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <kasan-dev@googlegroups.com>, <sparclinux@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-s390@vger.kernel.org>
X-Mailer: aerc 0.19.0
References: <cover.1744037648.git.agordeev@linux.ibm.com>
 <93102722541b1daf541fce9fb316a1a2614d8c86.1744037648.git.agordeev@linux.ibm.com>
In-Reply-To: <93102722541b1daf541fce9fb316a1a2614d8c86.1744037648.git.agordeev@linux.ibm.com>

On Tue Apr 8, 2025 at 1:11 AM AEST, Alexander Gordeev wrote:
> Reverse 'create' vs 'mm =3D=3D &init_mm' conditions and move
> page table mask modification out of the atomic context.
>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  mm/memory.c | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 2d8c265fc7d6..f0201c8ec1ce 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2915,24 +2915,28 @@ static int apply_to_pte_range(struct mm_struct *m=
m, pmd_t *pmd,
>  				     pte_fn_t fn, void *data, bool create,
>  				     pgtbl_mod_mask *mask)
>  {
> +	int err =3D create ? -ENOMEM : -EINVAL;

Could you make this a new variable instead of reusing
existing err? 'const int pte_err' or something?

>  	pte_t *pte, *mapped_pte;
> -	int err =3D 0;
>  	spinlock_t *ptl;
> =20
> -	if (create) {
> -		mapped_pte =3D pte =3D (mm =3D=3D &init_mm) ?
> -			pte_alloc_kernel_track(pmd, addr, mask) :
> -			pte_alloc_map_lock(mm, pmd, addr, &ptl);
> +	if (mm =3D=3D &init_mm) {
> +		if (create)
> +			pte =3D pte_alloc_kernel_track(pmd, addr, mask);
> +		else
> +			pte =3D pte_offset_kernel(pmd, addr);
>  		if (!pte)
> -			return -ENOMEM;
> +			return err;
>  	} else {
> -		mapped_pte =3D pte =3D (mm =3D=3D &init_mm) ?
> -			pte_offset_kernel(pmd, addr) :
> -			pte_offset_map_lock(mm, pmd, addr, &ptl);
> +		if (create)
> +			pte =3D pte_alloc_map_lock(mm, pmd, addr, &ptl);
> +		else
> +			pte =3D pte_offset_map_lock(mm, pmd, addr, &ptl);
>  		if (!pte)
> -			return -EINVAL;
> +			return err;
> +		mapped_pte =3D pte;
>  	}
> =20
> +	err =3D 0;
>  	arch_enter_lazy_mmu_mode();
> =20
>  	if (fn) {
> @@ -2944,12 +2948,14 @@ static int apply_to_pte_range(struct mm_struct *m=
m, pmd_t *pmd,
>  			}
>  		} while (addr +=3D PAGE_SIZE, addr !=3D end);
>  	}
> -	*mask |=3D PGTBL_PTE_MODIFIED;
> =20
>  	arch_leave_lazy_mmu_mode();
> =20
>  	if (mm !=3D &init_mm)
>  		pte_unmap_unlock(mapped_pte, ptl);
> +
> +	*mask |=3D PGTBL_PTE_MODIFIED;

This is done just because we might as well? Less work in critical
section?

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> +
>  	return err;
>  }
> =20


