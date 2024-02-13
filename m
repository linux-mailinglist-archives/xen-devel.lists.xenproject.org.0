Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83C852996
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 08:15:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679759.1057429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZmzT-0004tF-GG; Tue, 13 Feb 2024 07:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679759.1057429; Tue, 13 Feb 2024 07:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZmzT-0004qU-DI; Tue, 13 Feb 2024 07:14:03 +0000
Received: by outflank-mailman (input) for mailman id 679759;
 Tue, 13 Feb 2024 07:14:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZmzS-0004qM-5a
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 07:14:02 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74eba9bb-ca3f-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 08:13:59 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40efcb37373so32067255e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 23:13:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dx9-20020a05600c63c900b0040d5ae2906esm10679670wmb.30.2024.02.12.23.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 23:13:58 -0800 (PST)
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
X-Inumbo-ID: 74eba9bb-ca3f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707808439; x=1708413239; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vy6WUO8JrMmJ5Heu8bApmAce3OPcq0UizfnHuhdaLT8=;
        b=Q2o8wqGayXJK+15CQc0D0o/y+KnC0vafh9vZ3H3Y2rOfUYsxnjNOHJXp0wgsD0VVrK
         KfUtCjaS8zzWdQLlmVAFU2Cyl889dBuh/qd+s0jChHZ3JWEWwYg2zoXsEv0mXuElY8mJ
         7TCMldHWVwvEuEOBk8YXhAgsr8QITnmBdDYWeHYhFyhHbQX/UVl1+SL/mOIABS2qVKsA
         xfAjdhO2rLEU4kXXiOHfkBe6DJsDUNtWAQ+UEWtBUkC5MWwcr8iLjR+jPx7Jkpy/Q0Hy
         h6Il0vBirukYo/oPeeSDj7Sp4oHHFx03TGQfJ2sSqP/XeijGZg3JwfhV1YTOSBmQeV/O
         5pIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707808439; x=1708413239;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vy6WUO8JrMmJ5Heu8bApmAce3OPcq0UizfnHuhdaLT8=;
        b=Ie65z4Co0W/n0ZPnRcXKUFflf6nJP16/NOSwX5fiEQ4GktSMnzN8VNyeLHsQSK3wIh
         0RrIaVFCs//BNc04WiyqODkn8Yl+dZCEMRsH7HA9HPp+CZxIZEBXZdmpM+oKNDKZObnL
         2sPo1Oztt4oUzUUDL2wc0j6DRoL9s6yKcpowrgVTWjKaCQmuJjaKFbwm86a8uuVHvTDn
         xv5Dl7RWIlUlryrNNphAI/AzGKCtsBk2zb62r0xrSWP26+AoYztBMJO5Y61gJJdRvQd1
         fquv1UdgtXCuVUAEngA455fJp3N9OQ7ICE0ILaK3RJBUbbzedAYX0c7XWiIEydnNscMY
         eDjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7NE7ySpdcte6fvoufRfjkIS+neqs4TtZe/Euu7t7XfdbKj8z+tVEmRF+s/8wU0DvnY2z2zKku3Flt+HG2q9F2CYJ4qVyl349YBLrSucw=
X-Gm-Message-State: AOJu0YyW73h03lMYonkBhMDJGnfaEkcmVZVKk/4lEPEOvh8//O7BUnJW
	4o8nFp2stZmZeBW/GNmSh4jiPVE4/69r6axqio2EFJugDYvZuKBE6eFbYaVQ+w==
X-Google-Smtp-Source: AGHT+IGz4wUCsMCCEoETO//hhIM4n7UB+6AjU0NUagPLKVEqUn7qp+DCLv5j/UXdULcAoaXmxKnNyQ==
X-Received: by 2002:a05:600c:45c8:b0:410:d71b:19ae with SMTP id s8-20020a05600c45c800b00410d71b19aemr3107896wmo.25.1707808438946;
        Mon, 12 Feb 2024 23:13:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUD7WMYI4qxZ0Tq+n0m+NYSyGzvc5d+fRERJL/LsaTvSPLC3qCdcATlX6KA4LQPYId3E81go0toNdjAgMDW8/yhc21IfTGDZWW7VQPwi3HD92AYtRSeEbdHQ86sGVLwR4z1D9MTbAk7zoYmTON/YRmWFQEdoMIat8YNgD/yAk+BVHsbhuwmr6T0n2n4gv3pKK1RX7Y9JmTy6x4PdzVGAw/PVwO7h4hrzbzBjuCnyMRB+jwyKjPRTRhlJY9mhMgQUabI5jR6/gXRBwHqg+o7AKjbNTUWryHUn3B/W6ZawWjddHDOOKYotar2/xmGOX5WHqpWZjESn3+ISC8Qqzj8FjwnGhbwyDUtkIg0
Message-ID: <c0b8f2ec-a3bb-45a6-b748-052d55a6fd5c@suse.com>
Date: Tue, 13 Feb 2024 08:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Return type of clean_and_invalidate_dcache_va_range
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen Devel <xen-devel@lists.xenproject.org>,
 Consulting <consulting@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper3 <andrew.cooper3@citrix.com>, Roger Pau
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
References: <e050b096ff39aa857f9c267a8dbb4ef6@bugseng.com>
 <alpine.DEB.2.22.394.2402091402080.1925432@ubuntu-linux-20-04-desktop>
 <f86baad0-f113-4156-9c10-6910e8c63492@xen.org>
 <02446758-a5a9-4a8a-8ce6-15abdc9ede65@suse.com>
 <99faac70440a68824a17fcaaea55ef48@bugseng.com>
 <09589e8f-77b6-47f7-b5bd-cf485e4b60f1@xen.org>
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
In-Reply-To: <09589e8f-77b6-47f7-b5bd-cf485e4b60f1@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.02.2024 19:38, Julien Grall wrote:
> An alternative would be to introduced arch_grant_cache_flush() and move 
> the if/else logic there. Something like:
> 
> diff --git a/xen/arch/arm/include/asm/page.h 
> b/xen/arch/arm/include/asm/page.h
> index 69f817d1e68a..4a3de49762a1 100644
> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -281,6 +281,19 @@ static inline void write_pte(lpae_t *p, lpae_t pte)
>       dsb(sy);
>   }
> 
> +static inline arch_grant_cache_flush(unsigned int op, const void *p, 
> unsigned long size)
> +{
> +    unsigned int order = get_order_from_bytes(size);
> +
> +    if ( (cflush->op & GNTTAB_CACHE_INVAL) && (cflush->op & 
> GNTTAB_CACHE_CLEAN) )
> +        clean_and_invalidate_dcache_va_range(v, cflush->length);
> +    else if ( cflush->op & GNTTAB_CACHE_INVAL )
> +        invalidate_dcache_va_range(v, cflush->length);
> +    else if ( cflush->op & GNTTAB_CACHE_CLEAN )
> +        clean_dcache_va_range(v, cflush->length);
> +
> +    return 0;
> +}
> 
>   /* Flush the dcache for an entire page. */
>   void flush_page_to_ram(unsigned long mfn, bool sync_icache);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 424744ad5e1a..647e1522466d 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -735,8 +735,7 @@ void asmlinkage __init start_xen(unsigned long 
> boot_phys_offset,
>                 fdt_paddr);
> 
>       /* Register Xen's load address as a boot module. */
> -    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
> -                             virt_to_maddr(_start),
> +    xen_bootmodule = add_boot_module(BOOTMOD_XEN, virt_to_maddr(_start),
>                                (paddr_t)(uintptr_t)(_end - _start), false);
>       BUG_ON(!xen_bootmodule);
> 
> diff --git a/xen/arch/x86/include/asm/flushtlb.h 
> b/xen/arch/x86/include/asm/flushtlb.h
> index bb0ad58db49b..dfe51cddde90 100644
> --- a/xen/arch/x86/include/asm/flushtlb.h
> +++ b/xen/arch/x86/include/asm/flushtlb.h
> @@ -182,23 +182,22 @@ void flush_area_mask(const cpumask_t *mask, const 
> void *va,
>   }
> 
>   static inline void flush_page_to_ram(unsigned long mfn, bool 
> sync_icache) {}
> -static inline int invalidate_dcache_va_range(const void *p,
> -                                             unsigned long size)
> -{ return -EOPNOTSUPP; }
> -static inline int clean_and_invalidate_dcache_va_range(const void *p,
> -                                                       unsigned long size)
> +
> +unsigned int guest_flush_tlb_flags(const struct domain *d);
> +void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
> +
> +static inline arch_grant_cache_flush(unsigned int op, const void *p, 
> unsigned long size)
>   {
> -    unsigned int order = get_order_from_bytes(size);
> +    unsigned int order;
> +
> +    if ( !(cflush->op & GNTTAB_CACHE_CLEAN) )
> +        return -EOPNOTSUPP;
> +
> +    order = get_order_from_bytes(size);
>       /* sub-page granularity support needs to be added if necessary */
>       flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
> +
>       return 0;
>   }
> -static inline int clean_dcache_va_range(const void *p, unsigned long size)
> -{
> -    return clean_and_invalidate_dcache_va_range(p, size);
> -}
> -
> -unsigned int guest_flush_tlb_flags(const struct domain *d);
> -void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
> 
>   #endif /* __FLUSHTLB_H__ */
> 
> I have a slight preference for the latter. I would like to hear the 
> opinion of the others.

I would prefer this 2nd form, too, assuming the setup.c change wasn't
really meant to be there. The one thing that doesn't become clear: In
the sketch above arch_grant_cache_flush() has no return type, yet has
"return 0". This raises a question towards the one that's at the root
of this thread: Do you mean the function to have a return value, and
if so will it be (sensibly) used?

Jan

