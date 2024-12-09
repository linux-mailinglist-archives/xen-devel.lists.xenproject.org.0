Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3C79E99CC
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 16:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851481.1265546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKfFH-0000Gb-HX; Mon, 09 Dec 2024 15:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851481.1265546; Mon, 09 Dec 2024 15:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKfFH-0000EX-En; Mon, 09 Dec 2024 15:00:23 +0000
Received: by outflank-mailman (input) for mailman id 851481;
 Mon, 09 Dec 2024 15:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKfFG-0000ER-41
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 15:00:22 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ec63f4d-b63e-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 16:00:20 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3863494591bso1048285f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 07:00:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef45f958besm8031793a91.16.2024.12.09.07.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 07:00:18 -0800 (PST)
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
X-Inumbo-ID: 4ec63f4d-b63e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733756419; x=1734361219; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pRkhkVE1M4pT0otgBa8h2fRxOn6ExP/sAgfQXk+ukcI=;
        b=KkitFS+8MLznQ0o4kKmW097xG9ereA7r0Gs77cjxTErBxVRsGE6Ry0fidUXzgbTSm9
         k6fQAwbaTznCoDebcUlK83S7PLxnynBocyDuCokotTJ3jduSGbs5cI5PlFABmIi4p8Na
         E1Wncmf3rpAMlmuyLdkmE00FW1LI+lhATT/qrkn80KhdKNxMa4VNmNfVSIXIdx1j3cmq
         z4uzRHGTqY9Bp+E/SJxexYbLAMTbTmDQzOB+mHu3sLQXL06N1hOtWjfAVsj7ZiYlf9cE
         na4KDbVO9p1dFXPdJ2OtxtafG7uCETp6Yckx+nxShU1Az+XDCvbTHKK/HpiDVh7dmrXh
         2YuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733756419; x=1734361219;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRkhkVE1M4pT0otgBa8h2fRxOn6ExP/sAgfQXk+ukcI=;
        b=pzFxLeYpjkdwgqAYg27x9fGrjj9oQ10k/7QxDTUpITYOEqj8up5kMwHGCExZGhqVWO
         D6daIMvyDm24rwiCYddnzh3dju12w+rMR1HewabXWusCXbVT05GrJCgXSkEQzETAj6jE
         kX0x/u+RTgUf+cJU1AVaftjfZyHqRlFi5LH4RdO3W+g9JKadVUT5aSnJry6fEdPlf2lG
         5ZRwnU1rUi6vXslqD9BmWPjV0OWElusuXlaNUkhZbJeTb1EMZIjGA6a4qvT/fZ400W2+
         vwICdXwrlWFw5j2KQvqbxtgCAHQVd+kGoYHzI0j2wu1cRE/UrAVlJtrWhZLAiW9K1C/i
         N1sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMAWsWERkDlRFT+1d764YmEEC3+KLy283+Mi6QVKQmKBes75KthREs98d7Eiw9GUWyU4Nd+IFdk0Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxF9q4B///9CAyPmw3jpKftWyGMnjG/q2iys+jlPQM7oeo0XkOL
	luyHaDLtgArK/PNnppo8UgNF9INwME9biw4ba1Hgnf/u1unAwL3CtzywXYBsUw==
X-Gm-Gg: ASbGnctwF7auQdSFifePPgBnNhRe5RtUtMCu/zViOgFDcJ5Xwdu8XNGLeDs+AkV88PL
	rJoJAN2iei6L0URMGhuhR4UGIieggGvw0vdwMepXQhRZnAt5mA3Tf9horsymJw9Eh39/Sz80Dld
	ocv8JHhOoECrHOfl9hgCLn7u0t4bOmFm/0iFjAD/RwxiyaxfTFVSzV3C/JZg7MlBzZlO/tqcDTf
	XLPfXTltjmvvEuUjiSFFi/ahr7IrALv1NZ6L7PUVz+TA2gk6mScYTlh0COhQ+4guo5mjn3HV68l
	heCeOz/pcoOsEE3vu/qs2Jh54z1yN8PPXI0=
X-Google-Smtp-Source: AGHT+IGDLKKPuaH+JHItNb5vZbpBZHQfokqtWQHloTLNcL0BX86dA8c+yAtd/IRrYkU1mieG4tB65A==
X-Received: by 2002:a5d:5f53:0:b0:386:5b2:a9d9 with SMTP id ffacd0b85a97d-386453fbd04mr577561f8f.53.1733756419223;
        Mon, 09 Dec 2024 07:00:19 -0800 (PST)
Message-ID: <d9fddba7-8364-45a6-addd-004dbde366a5@suse.com>
Date: Mon, 9 Dec 2024 16:00:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] xen/riscv: implement relocate_fdt()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <c157b03a8cb6d9c4910136b5d73260b47c55554e.1732709650.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c157b03a8cb6d9c4910136b5d73260b47c55554e.1732709650.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2024 13:50, Oleksii Kurochko wrote:
> relocate_fdt() relocates FDT to Xen heap instead of using early mapping
> as it is expected that discard_initial_modules() ( is supposed to call
> in the future ) discards the FDT boot module and remove_early_mappings()
> destroys the early mapping.
> 
> To implement that the following things are introduced as they are called
> by internals of xmalloc_bytes() which is used in relocate_fdt():
> 1. As RISC-V may have non-coherent access for RAM ( f.e., in case
>    of non-coherent IO devices ) flush_page_to_ram() is implemented
>    to ensure that cache and RAM are consistent for such platforms.

This is a detail of the page allocator, yes. It can then be viewed as also
a detail of xmalloc() et al, but I consider the wording a little misleading.

> 2. copy_from_paddr() to copy FDT from a physical address to allocated
>    by xmalloc_bytes() in Xen heap.

This doesn't look to be related to the internals of xmalloc() et al.

> 3. virt_to_page() to convert virtual address to page. Also introduce
>    directmap_virt_end to check that VA argument of virt_to_page() is
>    inside directmap region.

This is a need of free_xenheap_pages(), yes; see remark on point 1.

> @@ -148,8 +150,12 @@ static inline void *page_to_virt(const struct page_info *pg)
>  /* Convert between Xen-heap virtual addresses and page-info structures. */
>  static inline struct page_info *virt_to_page(const void *v)
>  {
> -    BUG_ON("unimplemented");
> -    return NULL;
> +    unsigned long va = (unsigned long)v;
> +
> +    ASSERT(va >= DIRECTMAP_VIRT_START);
> +    ASSERT(va <= directmap_virt_end);

Why the difference compared to virt_to_maddr()?

Also recall my comment on one of your earlier series, regarding inclusive
vs exclusive ranges. Can that please be sorted properly as a prereq, to
avoid extending the inconsistency?

> @@ -172,10 +173,15 @@ static inline void invalidate_icache(void)
>  #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
>  #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
>  
> -/* TODO: Flush the dcache for an entire page. */
>  static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
>  {
> -    BUG_ON("unimplemented");
> +    void *v = map_domain_page(_mfn(mfn));

const void *?

> +    clean_and_invalidate_dcache_va_range(v, PAGE_SIZE);
> +    unmap_domain_page(v);
> +
> +    if ( sync_icache )
> +        invalidate_icache();
>  }
>  
>  /* Write a pagetable entry. */
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -419,6 +419,7 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>  }
>  
>  vaddr_t __ro_after_init directmap_virt_start = DIRECTMAP_VIRT_START;
> +vaddr_t __ro_after_init directmap_virt_end;

If the variable is needed (see above) it pretty certainly wants an
initializer, too.

> @@ -26,6 +27,46 @@ void arch_get_xen_caps(xen_capabilities_info_t *info)
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>      __aligned(STACK_SIZE);
>  
> +/**
> + * copy_from_paddr - copy data from a physical address
> + * @dst: destination virtual address
> + * @paddr: source physical address
> + * @len: length to copy
> + */
> +void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)

Without a declaration in a header this function ought to be static.

> +{
> +    void *src = (void *)FIXMAP_ADDR(FIX_MISC);

const void *

> +    while (len) {

Nit: Style.

> +        unsigned long l, s;
> +
> +        s = paddr & (PAGE_SIZE - 1);
> +        l = min(PAGE_SIZE - s, len);

Make these the variables' initializers?

> +        set_fixmap(FIX_MISC, maddr_to_mfn(paddr), PAGE_HYPERVISOR_RW);
> +        memcpy(dst, src + s, l);
> +        clean_dcache_va_range(dst, l);

Why is this necessary here? You're copying to plain RAM that Xen alone
is using.

> +/* Relocate the FDT in Xen heap */
> +static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)

This function having no caller will - aiui - mean build breakage at
this point of the series.

> +{
> +    void *fdt = xmalloc_bytes(dtb_size);

New code ought to be using xvmalloc() et al. Unless there's a firm
reason not to.

Jan

