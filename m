Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B375A85546
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 09:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946682.1344483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u38cu-00037F-VV; Fri, 11 Apr 2025 07:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946682.1344483; Fri, 11 Apr 2025 07:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u38cu-000347-SG; Fri, 11 Apr 2025 07:16:36 +0000
Received: by outflank-mailman (input) for mailman id 946682;
 Fri, 11 Apr 2025 07:16:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8esB=W5=gmail.com=npiggin@srs-se1.protection.inumbo.net>)
 id 1u38ct-000332-RW
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 07:16:35 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e511ac1f-16a4-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 09:16:33 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-22928d629faso16822175ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 00:16:33 -0700 (PDT)
Received: from localhost ([220.253.99.94]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7cb5047sm42114385ad.170.2025.04.11.00.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 00:16:31 -0700 (PDT)
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
X-Inumbo-ID: e511ac1f-16a4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744355791; x=1744960591; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AZYV1raCKCE7T+GJKC63E8g42JVSDuGR93rMhn9HOQ=;
        b=UJulpGH1BlEuyUwF5vYauZuEY0U3LM9jFcodFwlvyLUQL/h2xOc/Bxy15Q5rT5F+NC
         d9xq/Cg+264yj+7kHMrzzuKfGMIr15KnT2z8b+A5rrICK1/9T1q5xs9BW7+SRQXReMxw
         odg/4owzRcDddvranKicLxNtvW3QEXdHcz44vwLDgebJslSawNtqYLXbSTlKG6KjZuJ/
         KmKzcQrvimX9paGUVzJM7vy/2lyR/ETUQuHocrl59BCwUO6AyVfruNJon5018Um3+agR
         TdiHR1ME7nqZ2lUOurY0l0qUPUyali3pEpnayQRiLIrIdQUkFsiOYgzaoJVi8NvZ71Lq
         VlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744355791; x=1744960591;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8AZYV1raCKCE7T+GJKC63E8g42JVSDuGR93rMhn9HOQ=;
        b=YVAAfUDGUgdF3VN9PlTYirPiTdylJsEJbUhNDAfDYTplz0gtLZvCVHbc7aEkr+p13t
         6tkxt1cqj6+sJJQ+jgbqqNS4/WOnFAcS8yUblzV3ghAIgqeErfuLVV2bMoscSPIX9o2t
         QeNVlo2h9p68ZegUhDpgn4PLJ5qahwEuNiJKeaagrP1wD9mrOC+5VX6WGr6NzlGCasgm
         fCIsqV58tGFukJ82mTIDgwSXqfCih+JToUAEVrI8/djLWHR7AzZ3h1P4r6w0lEQbop9O
         wizhVZhQJkkUyAVQRNz0uUOmodVk4BTtol+I36KPG+AqH8225o4JlzDeTgflSCAQ3q6S
         clmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVPKEtiU3ZHIIyZUU+ycDhGvZYGh5VOllB9jSHyUxeSkRVYtdv4LdjMMlgv1fEogmFu0HWt1nCZE4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmNz6EaSx97RJ4qSQ/4TgHaktrDaVjD7sw7UlKOhvNNeiric0w
	CxKqO8Uxz+mIKBmpIIYOHeAf3gqR7tUXFJxva4mJ2MDrJF6/8QNi
X-Gm-Gg: ASbGnct/b3xHMJnlHzvzuUBPhTqDQhbC2EJs0utqbw+qwaBn7gmHzpLpA7KiqCxE3zL
	+YZY+pI3ED/wEVfM4njdRajpeh8CbLLthdtyscVBFsDNOTh4iwElvA8zt+8RjDvF4bZdYwVwP05
	6RW6Bb38wqpeEbB4pLSQoyfTS6Jmxkj/gC7dDLk7BfUck/S2frT0hNdhqbsYy4sAAiclbaJD3XW
	z3F9uf0d/+g74qEVGCHggM+DXIOiZxm84YZnca08dZ6Hf4gVJPcKEAmEqQOfwyhqxRRujFLjrHO
	3rozzRoez62MWgVJYI+PDH76skE0DhEAgg==
X-Google-Smtp-Source: AGHT+IHEcvyi3TC9JEHNBrBd62VdoZ1tkH8a7fjLbKQXjCafKk3/popDo8PXG6WTmR/MWpJCm32MMg==
X-Received: by 2002:a17:903:1447:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22bea4bd57fmr30624525ad.28.1744355791439;
        Fri, 11 Apr 2025 00:16:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 17:16:24 +1000
Message-Id: <D93MIOI9YLAD.1WDMNT59MMEM2@gmail.com>
Cc: "Hugh Dickins" <hughd@google.com>, "Guenter Roeck" <linux@roeck-us.net>,
 "Juergen Gross" <jgross@suse.com>, "Jeremy Fitzhardinge" <jeremy@goop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <kasan-dev@googlegroups.com>, <sparclinux@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-s390@vger.kernel.org>
Subject: Re: [PATCH v1 4/4] mm: Allow detection of wrong
 arch_enter_lazy_mmu_mode() context
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Alexander Gordeev" <agordeev@linux.ibm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>
X-Mailer: aerc 0.19.0
References: <cover.1744037648.git.agordeev@linux.ibm.com>
 <5204eaec309f454efcb5a799c9e0ed9da1dff971.1744037648.git.agordeev@linux.ibm.com>
In-Reply-To: <5204eaec309f454efcb5a799c9e0ed9da1dff971.1744037648.git.agordeev@linux.ibm.com>

On Tue Apr 8, 2025 at 1:11 AM AEST, Alexander Gordeev wrote:
> The lazy MMU batching may be only be entered and left under the
> protection of the page table locks for all page tables which may
> be modified. Yet, there were cases arch_enter_lazy_mmu_mode()
> was called without the locks taken, e.g. commit b9ef323ea168
> ("powerpc/64s: Disable preemption in hash lazy mmu mode").
>
> Make default arch_enter|leave|flush_lazy_mmu_mode() callbacks
> complain at least in case the preemption is enabled to detect
> wrong contexts.
>
> Most platforms do not implement the callbacks, so to aovid a
> performance impact allow the complaint when CONFIG_DEBUG_VM
> option is enabled only.
>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>

This is a good debugging feature independent of how the fix
is done. I would just warn once, since it's not a bug for
the arch and could fire frequently if it fires at all.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  include/linux/pgtable.h | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index e2b705c14945..959590bb66da 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -232,9 +232,18 @@ static inline int pmd_dirty(pmd_t pmd)
>   * and the mode cannot be used in interrupt context.
>   */
>  #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> -#define arch_enter_lazy_mmu_mode()	do {} while (0)
> -#define arch_leave_lazy_mmu_mode()	do {} while (0)
> -#define arch_flush_lazy_mmu_mode()	do {} while (0)
> +static inline void arch_enter_lazy_mmu_mode(void)
> +{
> +	VM_WARN_ON(preemptible());
> +}
> +static inline void arch_leave_lazy_mmu_mode(void)
> +{
> +	VM_WARN_ON(preemptible());
> +}
> +static inline void arch_flush_lazy_mmu_mode(void)
> +{
> +	VM_WARN_ON(preemptible());
> +}
>  #endif
> =20
>  #ifndef pte_batch_hint


