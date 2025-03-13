Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ADAA5F50C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 13:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912093.1318426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsi9f-0001P4-N7; Thu, 13 Mar 2025 12:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912093.1318426; Thu, 13 Mar 2025 12:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsi9f-0001Nc-J6; Thu, 13 Mar 2025 12:59:19 +0000
Received: by outflank-mailman (input) for mailman id 912093;
 Thu, 13 Mar 2025 12:59:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsi9d-0001NG-VT
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 12:59:17 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7cc4f6e-000a-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 13:59:15 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso5691705e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 05:59:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df33ccsm2114628f8f.15.2025.03.13.05.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 05:59:14 -0700 (PDT)
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
X-Inumbo-ID: f7cc4f6e-000a-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741870755; x=1742475555; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L+Wgxcw+fBE4PFuxirOwUzD6At8f6plv1yh5iZ9Rl1I=;
        b=DRlaDZymDTIpMezSLSiJbDBoMx0w/aHwTELAImm7sA0+uzO54laqfEf0EQNTtdhs9l
         P5raJ/kr1IlYOfZNnmJucQXz2YhF4WVn1k5GqyH9QUIwCyQ7w/BPqQuQvG2PJ+MZxYW/
         FVQtVezHDCFDOGvhw8z5b6bSf34MqISg/ozB5Pv4IyeeGsNKrtaobdvNn3pug0P4XeKR
         vzJUkA/kmIoMv6DDMaC4s2/UcA3cDAttI+IRcKrCmQH67H2KsXlMP7IAsGgKe03wlFtJ
         6J8PxRbHn8JgS9qm2VgGWV06XVeEYFyQJHoKLuWq7ej8jvSfqf7EL87w+lK8PmKZ4Niz
         MZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741870755; x=1742475555;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+Wgxcw+fBE4PFuxirOwUzD6At8f6plv1yh5iZ9Rl1I=;
        b=qnMwokk1VCrAm6aIOMBEAexTbgBXAXs7xTQFu22BTG1vQbLsA1Q2T1kl4RetcRGzgm
         zriSB1Fx1KOmBsqqyHhv92rzN1jT6Z9kr4ZpJJEcj4NZ668fOcq+XvzCKHUPzVfArMLK
         ETI6gz13zAT0d1OXGW8DZaXpbNncJzBP+Ix9ykT7C5IJ7OiSFlQHkkZCn4ERYVnYMSIn
         Yyi9OwC02bg3zgEYe8QJxG4lA8QKnqnUBKD03aH7z5I02slQP4/90SkfW5K4Q48dvYTG
         8SWUJRaXNaC08THR97BZ+CLWFmRfY2J6GhvDd+kNnpTmkgXfMGPTfg3yaLP1IN72UOzM
         0PTg==
X-Forwarded-Encrypted: i=1; AJvYcCUjrotBkU+OHupHYx8bhhtOrw2ZRXY+NWqvq1scoqKk7hVPUnVB8l9Yck960A7wj2PwogZ6Folr1ug=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9Z+BsC2m/7GbuSyuCEO9++avVoyXi8pnB/opOVK4jLFVEJyIQ
	RqIv1vEPqix9d9NqpCRU1/F1+JeC5cs7NXaYUb0jJ6fUP4VjUFSNfBwlsnLkGQ==
X-Gm-Gg: ASbGncu6H6rc3XUOr5iozDbkqg1Hlc5JqStP5IXZh1dKy5D6wmJ7OH9C6Fdf9NP0hsU
	XIOEGx6xwg0xHMafxsJkZJRSbgXyy8kPJ4hEPeX3TKii/++qIqgR5Ex9ZVZ181ZiXvn4t+3LF6T
	wAzXxA7FFyiKl9/9ho9izRRE0XIxlsnF/pJfVl1kPqAfelATjdJxVvwHXsTNDm3p6mNCljD8t/D
	UGYnASIcjhnDCsaGw4lr18NuI+CrYTregHDx6rMEUa3jwzCVlgtmiNytD9csLfqPJ/ZZKmMM3K+
	y/uWicUrmWruu+MuxCweNyI22CtPEEXZinVnfe2GV50UJaiC71oufrbxR+p/aFXj0aV6g3pd4eO
	YN/LvarW045MxW/yTTY8ZtUuOENQZdg==
X-Google-Smtp-Source: AGHT+IG476cxO9ja8WlSo2+seEDn4Po6Z7PTROwjNJR/8tCgMN/NRfV7SfPN2I3IAVwTTT0v2INz6Q==
X-Received: by 2002:a05:6000:156d:b0:391:2192:ccd6 with SMTP id ffacd0b85a97d-3926c1cd9e5mr12409070f8f.39.1741870755065;
        Thu, 13 Mar 2025 05:59:15 -0700 (PDT)
Message-ID: <6d910ac4-cf1d-48ee-b088-17254d2272ab@suse.com>
Date: Thu, 13 Mar 2025 13:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] xen/common: Split tlb-clock.h out of mm.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
 <20250312174513.4075066-5-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250312174513.4075066-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.03.2025 18:45, Andrew Cooper wrote:
> xen/mm.h includes asm/tlbflush.h almost at the end, which creates a horrible
> tangle.  This is in order to provide two common files with an abstraction over
> the x86-specific TLB clock logic.
> 
> First, introduce CONFIG_HAS_TLB_CLOCK, selected by x86 only.  Next, introduce
> xen/tlb-clock.h, providing empty stubs, and include this into memory.c and
> page_alloc.c
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> There is still a mess here with the common vs x86 split, but it's better
> contained than before.
> ---
>  xen/arch/x86/Kconfig        |  1 +
>  xen/common/Kconfig          |  3 +++
>  xen/common/memory.c         |  1 +
>  xen/common/page_alloc.c     |  1 +
>  xen/include/xen/mm.h        | 27 --------------------
>  xen/include/xen/tlb-clock.h | 49 +++++++++++++++++++++++++++++++++++++
>  6 files changed, 55 insertions(+), 27 deletions(-)
>  create mode 100644 xen/include/xen/tlb-clock.h
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 6e41bc0fb435..e9a166ee3dd0 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -28,6 +28,7 @@ config X86
>  	select HAS_PCI_MSI
>  	select HAS_PIRQ
>  	select HAS_SCHED_GRANULARITY
> +	select HAS_TLB_CLOCK
>  	select HAS_UBSAN
>  	select HAS_VMAP
>  	select HAS_VPCI if HVM
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 6166327f4d14..dcf7d9d00d0a 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -83,6 +83,9 @@ config HAS_PMAP
>  config HAS_SCHED_GRANULARITY
>  	bool
>  
> +config HAS_TLB_CLOCK
> +	bool
> +
>  config HAS_UBSAN
>  	bool
>  
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 61a94b23abae..9138fd096696 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -24,6 +24,7 @@
>  #include <xen/perfc.h>
>  #include <xen/sched.h>
>  #include <xen/sections.h>
> +#include <xen/tlb-clock.h>
>  #include <xen/trace.h>
>  
>  #include <asm/current.h>
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index bc029ea797a2..b90c3d7988b4 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -137,6 +137,7 @@
>  #include <xen/sections.h>
>  #include <xen/softirq.h>
>  #include <xen/spinlock.h>
> +#include <xen/tlb-clock.h>
>  #include <xen/vm_event.h>
>  #include <xen/xvmalloc.h>
>  
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 45000cc3f64b..fff36ff903d6 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -588,33 +588,6 @@ unsigned long get_upper_mfn_bound(void);
>  
>  #include <asm/flushtlb.h>
>  
> -static inline void accumulate_tlbflush(bool *need_tlbflush,
> -                                       const struct page_info *page,
> -                                       uint32_t *tlbflush_timestamp)
> -{
> -    if ( page->u.free.need_tlbflush &&
> -         page->tlbflush_timestamp <= tlbflush_current_time() &&
> -         (!*need_tlbflush ||
> -          page->tlbflush_timestamp > *tlbflush_timestamp) )
> -    {
> -        *need_tlbflush = true;
> -        *tlbflush_timestamp = page->tlbflush_timestamp;
> -    }
> -}
> -
> -static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
> -{
> -    cpumask_t mask;
> -
> -    cpumask_copy(&mask, &cpu_online_map);
> -    tlbflush_filter(&mask, tlbflush_timestamp);
> -    if ( !cpumask_empty(&mask) )
> -    {
> -        perfc_incr(need_flush_tlb_flush);
> -        arch_flush_tlb_mask(&mask);
> -    }
> -}
> -
>  enum XENSHARE_flags {
>      SHARE_rw,
>      SHARE_ro,
> diff --git a/xen/include/xen/tlb-clock.h b/xen/include/xen/tlb-clock.h
> new file mode 100644
> index 000000000000..796c0be7fbef
> --- /dev/null
> +++ b/xen/include/xen/tlb-clock.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef XEN_TLB_CLOCK_H
> +#define XEN_TLB_CLOCK_H
> +
> +#include <xen/types.h>
> +
> +#ifdef CONFIG_HAS_TLB_CLOCK
> +
> +#include <xen/mm.h>
> +
> +#include <asm/flushtlb.h>
> +
> +static inline void accumulate_tlbflush(
> +    bool *need_tlbflush, const struct page_info *page,
> +    uint32_t *tlbflush_timestamp)
> +{
> +    if ( page->u.free.need_tlbflush &&
> +         page->tlbflush_timestamp <= tlbflush_current_time() &&
> +         (!*need_tlbflush ||
> +          page->tlbflush_timestamp > *tlbflush_timestamp) )
> +    {
> +        *need_tlbflush = true;
> +        *tlbflush_timestamp = page->tlbflush_timestamp;
> +    }
> +}
> +
> +static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
> +{
> +    cpumask_t mask;
> +
> +    cpumask_copy(&mask, &cpu_online_map);
> +    tlbflush_filter(&mask, tlbflush_timestamp);
> +    if ( !cpumask_empty(&mask) )
> +    {
> +        perfc_incr(need_flush_tlb_flush);

Would this perf counter then perhaps also want to become dependent upon
HAS_TLB_CLOCK=y (or become an arch-specific one)? It's used elsewhere in x86,
but not for any of the other arch-es.

However, see below.

> +        arch_flush_tlb_mask(&mask);
> +    }
> +}
> +
> +#else /* !CONFIG_HAS_TLB_CLOCK */
> +
> +struct page_info;
> +static inline void accumulate_tlbflush(
> +    bool *need_tlbflush, const struct page_info *page,
> +    uint32_t *tlbflush_timestamp) {}
> +static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp) {}

Is doing nothing here correct? mark_page_free() can set a page's
->u.free.need_tlbflush. And with that flag set the full

static inline void accumulate_tlbflush(
    bool *need_tlbflush, const struct page_info *page,
    uint32_t *tlbflush_timestamp)
{
    if ( page->u.free.need_tlbflush &&
         page->tlbflush_timestamp <= tlbflush_current_time() &&
         (!*need_tlbflush ||
          page->tlbflush_timestamp > *tlbflush_timestamp) )
    {
        *need_tlbflush = true;
        *tlbflush_timestamp = page->tlbflush_timestamp;
    }
}

reduces to (considering that tlbflush_current_time() resolves to constant 0,
which also implies every page's ->tlbflush_timestamp is only ever 0)

static inline void accumulate_tlbflush(
    bool *need_tlbflush, const struct page_info *page,
    uint32_t *tlbflush_timestamp)
{
    if ( !*need_tlbflush )
        *need_tlbflush = true;
}

which means a not-stubbed-out filtered_flush_tlb_mask(), with tlbflush_filter()
doing nothing, would actually invoke arch_flush_tlb_mask() (with all online CPUs
set in the mask) when called. And arch_flush_tlb_mask() isn't a no-op on Arm.

I therefore think that while moving stuff into a separate header makes sense,
HAS_TLB_CLOCK isn't overly useful to introduce.

Jan

