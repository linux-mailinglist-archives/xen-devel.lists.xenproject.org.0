Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 615BFA83D71
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 10:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945009.1343288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2naq-0002wm-3X; Thu, 10 Apr 2025 08:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945009.1343288; Thu, 10 Apr 2025 08:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2nap-0002td-W8; Thu, 10 Apr 2025 08:49:03 +0000
Received: by outflank-mailman (input) for mailman id 945009;
 Thu, 10 Apr 2025 08:49:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2nao-0002tX-L9
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 08:49:02 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a51ef227-15e8-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 10:48:59 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso4337705e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 01:48:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f235b050fsm44680805e9.40.2025.04.10.01.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 01:48:58 -0700 (PDT)
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
X-Inumbo-ID: a51ef227-15e8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744274939; x=1744879739; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=epvkV60FiinpBx7MZOoyHxQpLQX6hQLJVX4/EB+2jAQ=;
        b=PpFI/8iAhwiM/hM3qLvCk+A2hjTigXU7WjYuKzYCzIkznN/0/3pGkdgW+gh2ThtaBS
         7HrDcR5JMKWst087kjhmbeNS7RTSNlwq0u+o/zryDySw42Q5+MxhUEYjHhxptMmwFrE6
         afJc8cIXLoFWkRWoBXu78o31G5WFQEtd+awijVCOxHLdNlrW8WCl6vGAaY4MshjgDKSP
         1vSM3U1phxCRml+zA/del+s6eSU2qAykpLSlTd2zef+8pX2vPuFIPbDp1CJNAerY1tuA
         nD6QPLerKvERXPXMezM4dYAuzUJDutB8HRkQTG3wL2DziyJwv02S5S6Uz0kIu0RDp/y8
         Fl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744274939; x=1744879739;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epvkV60FiinpBx7MZOoyHxQpLQX6hQLJVX4/EB+2jAQ=;
        b=b0o4Yif25sZh6TjXuOUjxb9Il2HUQp93Kr59vN1OF/YgYgtWjLZlvGZpsOQgbKi3/P
         qHEn5UxRFCtpdWrBiNNqqnFKjPlDraV6bCHP7L5CeuwygcRyQ6IAG995xsz2evllgidP
         ll+rFxL0ERifekHomu/tcr17QYSWsR7AD+B3P74s/8Gj64O6mCA3VFIXqzBecffwjRQ9
         UBnDVsEyaab3BrymTDJNqnMPj9WKy8ARvdsK0zFfCSH86l4cUauLcqASgfLhC0FDV10Z
         L3r+h75LPdJz0fVMgPcA/eQneKZw3gaF43KsxFFtgQYWFOu6ImsP/cqQ+fVzYpLBbMnC
         xeiA==
X-Forwarded-Encrypted: i=1; AJvYcCWcNFijopTu66Yp7ShPLcuzAlTGZCOLo6ITc3AI9gONOjDfkhVIHphhdceVrjiN4El/5EgZ79XST5A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTJTpEe2my3yvxZ21duxyuhxpM1kauJmAlEMFis5BecMj6d/0N
	b/6ovB/uZZ4I3QTYZaKQpH1YiRspMD472b9pSw/Vnqgt2qfdQEpWpwCfmCK6sQ==
X-Gm-Gg: ASbGnctq0Zk/p6kLFhu+x/rIrSTOVNc8Tn2V4Z3CbxwNLwjJtTlCOmdIXDfnHA8AaIu
	cPBaXsCYQNlBIlZQHgvyiMiw0t8hQ1UM+Kjnqd5BhJBAhwL5q9c5rllR7LkDE203UM4Lx/a7OS8
	RDKU5yU1sMO9ZAr7q5T+sxTzEhnMZ1o6+KBZemNYpc2kHqSw4fGGEI6yenOmEEvo7aL66hudlkK
	TDWl8dH0XgTuiJoGbBhNTMch0/ICOVmXpX/xif610iiTgN0Lq687ociJZoLoacWqcQ6H0kF+Uwp
	TzxTlxq5dByV9DIr79R/yLpNEfDao++CKCkyCh7/x07Ru4G4MGtE3Hzs3YrH6aGqyBiDXhPGzHE
	1rVKjkV2ZffZ2ELBDXShAR6epYQ==
X-Google-Smtp-Source: AGHT+IGyxDUsykW/kOyjk9g4WDKk3xMhvjP/xOXTfc8GcaLy9YQ6wOqUeG4WH3osuF5QKKCsCcpkWw==
X-Received: by 2002:a05:600c:46d4:b0:43d:fa58:8378 with SMTP id 5b1f17b1804b1-43f2d99ab0dmr11662055e9.33.1744274938919;
        Thu, 10 Apr 2025 01:48:58 -0700 (PDT)
Message-ID: <a173245f-531a-434d-b3ce-1d8e35dec8ec@suse.com>
Date: Thu, 10 Apr 2025 10:48:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: Increase XEN_VIRT_SIZE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <eb20a5730b55c1731324cc3970c3a3c9ea666a85.1744214442.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <eb20a5730b55c1731324cc3970c3a3c9ea666a85.1744214442.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2025 21:01, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -9,6 +9,7 @@
>  #include <xen/mm-frame.h>
>  #include <xen/pdx.h>
>  #include <xen/pfn.h>
> +#include <xen/sections.h>
>  #include <xen/types.h>
>  
>  #include <asm/page-bits.h>
> @@ -35,6 +36,11 @@ static inline void *maddr_to_virt(paddr_t ma)
>      return (void *)va;
>  }
>  
> +#define is_init_section(p) ({                   \
> +    char *p_ = (char *)(unsigned long)(p);      \
> +    (p_ >= __init_begin) && (p_ < __init_end);  \
> +})

I think this wants to be put in xen/sections.h, next to where __init_{begin,end}
are declared. But first it wants making const-correct, to eliminate the potential
of it indirectly casting away const-ness from the incoming argument.

(At some point related stuff wants moving from kernel.h to sections.h, I suppose.
And at that point they will all want to have const added.)

> @@ -43,13 +49,21 @@ static inline void *maddr_to_virt(paddr_t ma)
>   */
>  static inline unsigned long virt_to_maddr(unsigned long va)
>  {
> +    const unsigned long xen_size = (unsigned long)(_end - _start);
> +    const unsigned long xen_virt_start = _AC(XEN_VIRT_START, UL);
> +    const unsigned long xen_virt_end = xen_virt_start + xen_size - 1;
> +
>      if ((va >= DIRECTMAP_VIRT_START) &&
>          (va <= DIRECTMAP_VIRT_END))
>          return directmapoff_to_maddr(va - directmap_virt_start);
>  
> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
> +    ASSERT((va >= xen_virt_start) && (va <= xen_virt_end));
> +
> +    /*
> +    * The .init* sections will be freed when Xen completes booting,
> +    * so the [__init_begin, __init_end] range must be excluded.

[__init_begin, __init_end)

> +    */
> +    ASSERT((system_state != SYS_STATE_active) || !is_init_section(va));

system_state < SYS_STATE_active

> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -31,20 +31,24 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
>  #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>  
>  /*
> - * It is expected that Xen won't be more then 2 MB.
> + * It is expected that Xen won't be more then XEN_VIRT_SIZE MB.

Why "MB" when the macro already expands to MB(16)?

>   * The check in xen.lds.S guarantees that.
> - * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
> - * One for each page level table with PAGE_SIZE = 4 Kb.
>   *
> - * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
> + * Root page table is shared with the initial mapping and is declared
> + * separetely. (look at stage1_pgtbl_root)

Nit: separately

>   *
> - * It might be needed one more page table in case when Xen load address
> - * isn't 2 MB aligned.
> + * An amount of page tables between root page table and L0 page table
> + * (in the case of Sv39 it covers L1 table):
> + *   (CONFIG_PAGING_LEVELS - 2) are needed for an identity mapping and
> + *   the same amount are needed for Xen.
>   *
> - * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
> - * except that the root page table is shared with the initial mapping
> + * An amount of L0 page tables:
> + *   (512 entries of one L0 page table covers 2MB == 1<<XEN_PT_LEVEL_SHIFT(1))
> + *   XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1) are needed for Xen and
> + *   one L0 is needed for indenity mapping.

Nit: identity

But more importantly, where's this one L0 ...

>   */
> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 2) * 2 + \
> +                             (XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1)))

.... in this calculation?

> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -178,4 +178,8 @@ ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
>   */
>  ASSERT(_end - _start <= XEN_VIRT_SIZE, "Xen too large for early-boot assumptions")
>  
> +/* Changing these ASSERTs can require an update of PGTBL_INITIAL_COUNT */
> +ASSERT(IS_ALIGNED(XEN_VIRT_START, GB(1)), "XEN_VIRT_START should be 1gb aligned")
> +ASSERT(IS_ALIGNED(XEN_VIRT_SIZE, MB(2)), "XEN_VIRT_SIZE should be 2mb aligned")

Such checking wants to happen as early as possible in the build. Deferring to
the linking step should be done only if some part of the expression only is
established when linking. Aiui both of these could be BUILD_BUG_ON() somewhere
near to where PGTBL_INITIAL_COUNT is defined or used.

Jan

