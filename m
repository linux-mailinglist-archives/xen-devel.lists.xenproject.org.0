Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E012F94FFAE
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 10:23:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776043.1186194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdmnB-00034b-3F; Tue, 13 Aug 2024 08:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776043.1186194; Tue, 13 Aug 2024 08:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdmnB-000339-05; Tue, 13 Aug 2024 08:22:09 +0000
Received: by outflank-mailman (input) for mailman id 776043;
 Tue, 13 Aug 2024 08:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdmn9-000333-Dm
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 08:22:07 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 201b7f0b-594d-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 10:22:06 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5bd1a9bdce4so3294520a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 01:22:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414e1c1sm49264166b.171.2024.08.13.01.22.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 01:22:04 -0700 (PDT)
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
X-Inumbo-ID: 201b7f0b-594d-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723537325; x=1724142125; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU+iJbV0mDtYpEiwtH4San+Tbr7mMkd0jWfaumuGKEc=;
        b=QI/TDJOmKdkG4ZFTkdVaG0woo9GV0sW9eU1tORDFZLsZq8wy9S06edAp0+GlLmP3X0
         kz8DoeGwF7gtDDNy1T9pQzDRl8/vs0/GRlPZfhV8/flhKJUDYRQQqD4TAmWZZHxY+90c
         QaF3IsjdR6x+is8yl7sEjyyilPDOXerzNgNdqFi13wiIAeP6qqGNoiF78TqzvEoFctMa
         FDMpuHcJNpAaoEdtvIw9/a1H73E/fHiM8PPzc5hlY7J/tQ0z0k/w4dOkR3bJVi4M+ab4
         6fQfpJo2s8WSOQppdBmuqeAqkSmqL/TWaSI0Z+Fp0GF1ISDh2wS6RYbogbPDzPnOF760
         0lAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723537325; x=1724142125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZU+iJbV0mDtYpEiwtH4San+Tbr7mMkd0jWfaumuGKEc=;
        b=HnCTz0irsVKr3jIQw5tYNFsrd42EqdrTaHXmnBMjjW4yukxORJ4s+DJcYbsIhBXSv4
         xkkPbP+M6K7tp9MjyVNID1oRfQ+qIZwq0jVYoNIFA0lA7IO7R/URIy1bFzrxTEje5lAL
         qnH21Sdg2gDhB5DCVPyA22wXlYBULelem6y3neD6AHOeGMpbS6Ds1xGVQSC9X1MBs0EZ
         5t+owGDWqcDAyNuTqYp5/HJ5/qq4Q7Da7H3/6nC4qwlxCftbFdYHcdZkSS0GtD0xk8HX
         cvpaRJMWaVGhaZb+XsdP1o8e4bWZh9UocWKhgBcZ2npfV+PHZLQl9mfa6VUkA+LmYF7b
         ySwA==
X-Forwarded-Encrypted: i=1; AJvYcCUCQxF4Lbv6Vf4v++OFGM7bIKxDq8Dc/BdwU7k1PA3eV1DEFKZpJA3L7+bQdK7PICxFyE1b1Iog9B4lKc1mvh1DT5Sho9UxyrdubhrTZSE=
X-Gm-Message-State: AOJu0YxLGO97yEyYqs8DyUof4OKzNPw72qyyJzNnRGlKa4WehZTdUbLL
	82ZDS1d0uwxHoZ4k1eX2E7mpiA6Z+UsKBTIyAs+6uVHsXVyl8mnnlOrOuoxpLw==
X-Google-Smtp-Source: AGHT+IG87xwq6QTNVjirV8RYJikk3tuWsqy2AghRQMbFq6AI3UXQsOUpwd+rug0PT5kvAp8Ca/2bhw==
X-Received: by 2002:a17:907:608a:b0:a7d:391f:17af with SMTP id a640c23a62f3a-a80ed2c4690mr168617466b.51.1723537325132;
        Tue, 13 Aug 2024 01:22:05 -0700 (PDT)
Message-ID: <07f19bb5-bd76-4158-875e-48f74e427a89@suse.com>
Date: Tue, 13 Aug 2024 10:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] xen/riscv: set up fixmap mappings
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
 <1c1c0f912a9abbb542baa1ce92e75d64ec8043e9.1723214540.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1c1c0f912a9abbb542baa1ce92e75d64ec8043e9.1723214540.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.08.2024 18:19, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -74,6 +74,14 @@
>  #error "unsupported RV_STAGE1_MODE"
>  #endif
>  
> +#define XEN_VIRT_SIZE           MB(2)
> +
> +#define BOOT_FDT_VIRT_START     (XEN_VIRT_START + XEN_VIRT_SIZE)
> +#define BOOT_FDT_VIRT_SIZE      MB(4)
> +
> +#define FIXMAP_BASE             (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
> +#define FIXMAP_ADDR(n)          (FIXMAP_BASE + (n) * PAGE_SIZE)

Just to confirm: Did you consider leaving gaps between the regions, but
then discarded that idea for whatever reason? It's not like you're tight
on address space.

As to FIXMAP_ADDR() - wouldn't that be a better fit in fixmap.h?

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/fixmap.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * fixmap.h: compile-time virtual memory allocation
> + */
> +#ifndef ASM_FIXMAP_H
> +#define ASM_FIXMAP_H
> +
> +#include <xen/bug.h>
> +#include <xen/page-size.h>
> +#include <xen/pmap.h>
> +
> +#include <asm/page.h>
> +
> +/* Fixmap slots */
> +#define FIX_PMAP_BEGIN (0) /* Start of PMAP */
> +#define FIX_PMAP_END (FIX_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of PMAP */
> +#define FIX_MISC (FIX_PMAP_END + 1)  /* Ephemeral mappings of hardware */
> +
> +#define FIX_LAST (FIX_MISC + 1) /* +1 means a guard slot */

As per my comment on the earlier version: No, I don't think this arranges
for a guard slot. It merely arranges for FIX_MISC to not trigger the
BUG_ON() in virt_to_fix().

> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -81,6 +81,12 @@ static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
>      BUG_ON("unimplemented");
>  }
>  
> +/* Write a pagetable entry. */
> +static inline void write_pte(pte_t *p, pte_t pte)
> +{
> +    *p = pte;
> +}

No use of write_atomic() here? And no read_pte() counterpart right away (then
also properly using read_atomic())?

> @@ -191,6 +195,45 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
>      return is_mode_supported;
>  }
>  
> +void __init setup_fixmap_mappings(void)
> +{
> +    pte_t *pte, tmp;
> +    unsigned int i;
> +
> +    BUILD_BUG_ON(FIX_LAST >= PAGETABLE_ENTRIES);
> +
> +    pte = &stage1_pgtbl_root[pt_index(HYP_PT_ROOT_LEVEL, FIXMAP_ADDR(0))];
> +
> +    /*
> +     * In RISC-V page table levels are numbered from Lx to L0 where
> +     * x is the highest page table level for currect  MMU mode ( for example,
> +     * for Sv39 has 3 page tables so the x = 2 (L2 -> L1 -> L0) ).
> +     *
> +     * In this cycle we want to find L1 page table because as L0 page table
> +     * xen_fixmap[] will be used.
> +     */
> +    for ( i = HYP_PT_ROOT_LEVEL; i-- > 1; )
> +    {
> +        BUG_ON(!pte_is_valid(*pte));
> +
> +        pte = (pte_t *)LOAD_TO_LINK(pte_to_paddr(*pte));
> +        pte = &pte[pt_index(i, FIXMAP_ADDR(0))];
> +    }
> +
> +    BUG_ON(pte_is_valid(*pte));
> +
> +    tmp = paddr_to_pte(LINK_TO_LOAD((unsigned long)&xen_fixmap), PTE_TABLE);
> +    write_pte(pte, tmp);
> +
> +    RISCV_FENCE(rw, rw);

In the changes section you say "r,r", and I was wondering about that. I
take it that "rw,rw" is really what's needed here.

Jan

