Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F423AD898A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 12:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014196.1392432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ1hy-0007GJ-BQ; Fri, 13 Jun 2025 10:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014196.1392432; Fri, 13 Jun 2025 10:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ1hy-0007De-8d; Fri, 13 Jun 2025 10:32:26 +0000
Received: by outflank-mailman (input) for mailman id 1014196;
 Fri, 13 Jun 2025 10:32:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=49AQ=Y4=gmail.com=urezki@srs-se1.protection.inumbo.net>)
 id 1uQ1hx-0007DY-4b
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 10:32:25 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b127cf52-4841-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 12:32:23 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-32a6f5cb6f9so9110101fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 03:32:23 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553ac1dc3absm402194e87.197.2025.06.13.03.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 03:32:09 -0700 (PDT)
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
X-Inumbo-ID: b127cf52-4841-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749810742; x=1750415542; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wu4qJvn4Llwk0tWZQ65fBk0n6CvVyWDwwMQQPjhEpAs=;
        b=E/V0Bl0Wo80aX2aQH0b2+MdRWyyLNS+5IcJmgJAcP/0CniDYtO0BAT+mWgTBPHfRNU
         rvEv7SJXQehxRzAp+4jrle+VKXxwARLdXK8m0GQ5Pjp13OlSI7a75WNdoFJYLoODmxGE
         Lv6w5ZvCFokfRLQTf4IxGff/LawYVBWJSox9VSrznVjjslnRXVPmvfPTQn1eaSa7H50M
         8YGaRX5XBf6cik/3x63MXksfxdc6pIEj5kYZqeys+SdZGfWkWErTrkDj8EIluEAzAFQf
         JWGx9cn2ZQTZWBVk2KuiTeFBJyDNnrqWaRIjgNSM3it1WHanqdOh8LtoMkA9LmphIX8S
         L8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749810742; x=1750415542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wu4qJvn4Llwk0tWZQ65fBk0n6CvVyWDwwMQQPjhEpAs=;
        b=c0nf42coP1UmWC0w64CwAvXrH7FPp1e3n1rorRlDYUMVYdrHWmUel1EHNnSrqB82F9
         jq5++tU1yDlPqjtLPHcoeeIA38I9UlJR40xaSyCvclzCZUsIDtUImYBdBv5rE6x/9ksl
         68Jsa2RWyw4yB9GO/fwMGK43/KH3XI4MjsiprK4V9M74ldbS75YFmfo/MP4TTROhc8nZ
         2pO0VmIAVLXOiVItWAAZ7EqKdbJKesA36+wC7HEv/aMIsMUcfsOvtZ7GDZ6/x93eXhbw
         UYlP4deh4Pn1lreJmx4+7Mgl6Bchj3iPdazgiNUoKs98F+iG78wrE1m26VejQLzjPFX8
         XXtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcnexuKqNg5fWYyiKh+buvlkWVOe3gl/e60MqjCS53IC7evFF3Qf0ez4jqSAg+KdU2nvcd7RqJBe4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVLK9ykPpul+44PEwEVgbmnlITLbgreIvUH7GWpBSYiuVoN0fD
	lxvMk4Py646IEaP04MpxGkUkRJs8dQqkx+Rvh2DM0b3lehbSJt1PHrg7lTgjLfda
X-Gm-Gg: ASbGncvfWKGccGyApCYUqayDvpFxlIJ0EV+rV/P4+FEOdcMdwGQvgjdbSa0hkKCs4xK
	phSMXq8RHL+8OLxqHrlAiKF1joFY/spHCjFprwcmQ0sw/ncZXWtC/Q+z6Xt9ifFNw+t1L4AQnKb
	CW1wDtkLUSkjWBRyIHHZ0y19vMSr0IDalcixXA2ZrGmJnnxRaItbyUNEh57ef0KT7bjfDdNNDqb
	r0gzK2K3UXxwVj3slf2OCsLhVLWdFLU9copQP5R/ZPTroRYTT5s1Ax8cRz49C59e1SGNqUpfizq
	06SFEb/KZW2lvhOgFRqfBYeGzHG5U4vn8Gain6iZ2KzCloxs1xgaDcxw2t0EvfTv0EFs690KEuw
	6U4S7wWIj9PQ=
X-Google-Smtp-Source: AGHT+IH9UJ7uFj1fdsdkfO2A9iWrTLeLn4U5mol1YXw4WzFM5kRsgurhm6wsyckaQjO11Dn5eJdcbA==
X-Received: by 2002:a05:6512:3b06:b0:553:a3e7:812e with SMTP id 2adb3069b0e04-553af90817dmr681078e87.20.1749810730193;
        Fri, 13 Jun 2025 03:32:10 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 13 Jun 2025 12:32:06 +0200
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, Hugh Dickins <hughd@google.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
	Jeremy Fitzhardinge <jeremy@goop.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH 2/6] mm: Lock kernel page tables before entering lazy MMU
 mode
Message-ID: <aEv-JjY4lUPNqyjZ@pc636>
References: <cover.1749747752.git.agordeev@linux.ibm.com>
 <7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev@linux.ibm.com>

On Thu, Jun 12, 2025 at 07:36:09PM +0200, Alexander Gordeev wrote:
> As a follow-up to commit 691ee97e1a9d ("mm: fix lazy mmu docs and
> usage") take a step forward and protect with a lock not only user,
> but also kernel mappings before entering the lazy MMU mode. With
> that the semantics of arch_enter|leave_lazy_mmu_mode() callbacks
> is consolidated, which allows further simplifications.
> 
> The effect of this consolidation is not fully preemptible (Real-Time)
> kernels can not enter the context switch while the lazy MMU mode is
> active - which is easier to comprehend.
> 
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  include/linux/pgtable.h | 12 ++++++------
>  mm/kasan/shadow.c       |  5 -----
>  mm/memory.c             |  5 ++++-
>  mm/vmalloc.c            |  6 ++++++
>  4 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 0b6e1f781d86..33bf2b13c219 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -224,12 +224,12 @@ static inline int pmd_dirty(pmd_t pmd)
>   * a raw PTE pointer after it has been modified are not guaranteed to be
>   * up to date.
>   *
> - * In the general case, no lock is guaranteed to be held between entry and exit
> - * of the lazy mode. So the implementation must assume preemption may be enabled
> - * and cpu migration is possible; it must take steps to be robust against this.
> - * (In practice, for user PTE updates, the appropriate page table lock(s) are
> - * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
> - * and the mode cannot be used in interrupt context.
> + * For PREEMPT_RT kernels implementation must assume that preemption may
> + * be enabled and cpu migration is possible between entry and exit of the
> + * lazy MMU mode; it must take steps to be robust against this. There is
> + * no such assumption for non-PREEMPT_RT kernels, since both kernel and
> + * user page tables are protected with a spinlock while in lazy MMU mode.
> + * Nesting is not permitted and the mode cannot be used in interrupt context.
>   */
>  #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>  #define arch_enter_lazy_mmu_mode()	do {} while (0)
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index d2c70cd2afb1..45115bd770a9 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -313,12 +313,10 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>  	__memset(page_to_virt(page), KASAN_VMALLOC_INVALID, PAGE_SIZE);
>  	pte = pfn_pte(page_to_pfn(page), PAGE_KERNEL);
>  
> -	spin_lock(&init_mm.page_table_lock);
>  	if (likely(pte_none(ptep_get(ptep)))) {
>  		set_pte_at(&init_mm, addr, ptep, pte);
>  		data->pages[index] = NULL;
>  	}
> -	spin_unlock(&init_mm.page_table_lock);
>  
>  	return 0;
>  }
> @@ -465,13 +463,10 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>  
>  	page = (unsigned long)__va(pte_pfn(ptep_get(ptep)) << PAGE_SHIFT);
>  
> -	spin_lock(&init_mm.page_table_lock);
> -
>  	if (likely(!pte_none(ptep_get(ptep)))) {
>  		pte_clear(&init_mm, addr, ptep);
>  		free_page(page);
>  	}
> -	spin_unlock(&init_mm.page_table_lock);
>  
>  	return 0;
>  }
> diff --git a/mm/memory.c b/mm/memory.c
> index 71b3d3f98999..1ddc532b1f13 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3017,6 +3017,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  			pte = pte_offset_kernel(pmd, addr);
>  		if (!pte)
>  			return err;
> +		spin_lock(&init_mm.page_table_lock);
>  	} else {
>  		if (create)
>  			pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
> @@ -3042,7 +3043,9 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  
>  	arch_leave_lazy_mmu_mode();
>  
> -	if (mm != &init_mm)
> +	if (mm == &init_mm)
> +		spin_unlock(&init_mm.page_table_lock);
> +	else
>  		pte_unmap_unlock(mapped_pte, ptl);
>  
>  	*mask |= PGTBL_PTE_MODIFIED;
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index ab986dd09b6a..57b11000ae36 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -105,6 +105,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	if (!pte)
>  		return -ENOMEM;
>  
> +	spin_lock(&init_mm.page_table_lock);
>
This is not good. We introduce another bottle-neck.

--
Uladzislau Rezki

