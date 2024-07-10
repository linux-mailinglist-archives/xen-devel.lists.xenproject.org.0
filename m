Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAEC92CF5E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 12:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756783.1165526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUiB-0006uU-S1; Wed, 10 Jul 2024 10:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756783.1165526; Wed, 10 Jul 2024 10:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUiB-0006sP-Ov; Wed, 10 Jul 2024 10:38:11 +0000
Received: by outflank-mailman (input) for mailman id 756783;
 Wed, 10 Jul 2024 10:38:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRUiA-0006sJ-HN
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 10:38:10 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ffa0cf1-3ea8-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 12:38:09 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2eea8ea8bb0so53082401fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 03:38:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b43899502sm3431408b3a.2.2024.07.10.03.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 03:38:08 -0700 (PDT)
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
X-Inumbo-ID: 7ffa0cf1-3ea8-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720607889; x=1721212689; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hDjB1KcrxQe+3gqMyirBovRPz1HOVewycl1yxQk6L50=;
        b=BsYwFWCsSlkk36tFSkQkOStrb5Xb+9XwF2TPwjcEv2TTgMwNaj43I8AImAvtcAByV1
         x4monS5cwhv5uFgymj+TEMUHMRprWon+RaX2IAVWPmG8Y9bENbqJAdge355m7/YWuSz/
         CjG31wSOEdXnFvLjwI8ot0JrPJwj/xH671+lvWF8jsMnL2bIPkI0D+jukIfOwLR6PhV1
         qTAeMyMxoNLJmT1V1VcMoQBm3pO85PJODue0uov1oj0XcmT3+8Icv2Y4NgU0+lnIbTU8
         iuOJpIXe1w+TLAT1SdvD2uyKl7/wLJ2e2+Wkg4Y7BYz3KW3dgdoFAK5wWcEURALSMkxk
         t95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607889; x=1721212689;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDjB1KcrxQe+3gqMyirBovRPz1HOVewycl1yxQk6L50=;
        b=tmTCU6PAgZM8WcjOafwo/r5b5F1suB+/Tz+w+4P5BDXSiUDRUafDQc1my2Vmuq1nZL
         TevG0hbSfoCsxM3RYWsl03AVANawCIW35B3vG75lW7lBUOdS5IbY4an4yQ2MWd208ZJs
         cgxjdsNq3TM2vz/yvaxi0oHLBb8C9DgVpVAzaOYyYs0kM0nNrYnjgRkEIzSnYXZBcyrc
         8SCTI+AwUgQl/xTnnwkxtsg93ElIMwRRJySiT/zNxJEZSLjGmzhDy0Abi7RTjDReO0Dt
         XsUXdetfXExDAt3jSKfEzyvbvREkUDAHqgXtB8h3t1q2wr/yhBu5b4PWnZGBQKYwtCC7
         oQCg==
X-Forwarded-Encrypted: i=1; AJvYcCWOnOhoItjkklSPAUfPOXWcOYwcelRreaMa5DLM5GRH6YZS0rHq8choc5tzJuuUu5bVfwpVz8O4n/46D1EH0mWs+h4SEoxPtFof5IBmy64=
X-Gm-Message-State: AOJu0YwHrhy47mbLhgEx6JtoafXVc3j1swpVLICmoxIkKMQlDtCwDL/d
	8vMYYR/rFO1iUwrtGtyZ4HzaXcACopPN7C+UMb9hCJxX8umnOXr5QvOXutDDyg==
X-Google-Smtp-Source: AGHT+IGe9Bs9h4FUuMMroVAcpZ6ogVkdr8YlX8vBf4l/3yX0ZK2cP4KdP90U1x1CdbiHNL1XBUtuAA==
X-Received: by 2002:a2e:9b84:0:b0:2ee:849b:576a with SMTP id 38308e7fff4ca-2eeb30bb3b5mr39886231fa.11.1720607889005;
        Wed, 10 Jul 2024 03:38:09 -0700 (PDT)
Message-ID: <91e1ff5e-a27a-4c59-b5b0-88414d504694@suse.com>
Date: Wed, 10 Jul 2024 12:38:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] xen/riscv: introduce device tree maping function
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
 <efd3e6a8c526d227f8db06779c65ffda42a695d6.1720002425.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <efd3e6a8c526d227f8db06779c65ffda42a695d6.1720002425.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.07.2024 12:42, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/include/asm/config.h |  6 +++++
>  xen/arch/riscv/include/asm/mm.h     |  2 ++
>  xen/arch/riscv/mm.c                 | 37 +++++++++++++++++++++++++----
>  3 files changed, 40 insertions(+), 5 deletions(-)

I don't think a change like this can come without any description.

> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -74,6 +74,9 @@
>  #error "unsupported RV_STAGE1_MODE"
>  #endif
>  
> +#define XEN_SIZE                MB(2)
> +#define XEN_VIRT_END            (XEN_VIRT_START + XEN_SIZE)

Probably wants accompanying by an assertion in the linker script. Or else
how would one notice when Xen grows bigger than this?

> @@ -99,6 +102,9 @@
>  #define VMAP_VIRT_START         SLOTN(VMAP_SLOT_START)
>  #define VMAP_VIRT_SIZE          GB(1)
>  
> +#define BOOT_FDT_VIRT_START     XEN_VIRT_END
> +#define BOOT_FDT_VIRT_SIZE      MB(4)

Is the 4 selected arbitrarily, or derived from something?

Also maybe better to keep these #define-s sorted by address? (As to "keep":
I didn't check whether they currently are.)

> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -255,4 +255,6 @@ static inline unsigned int arch_get_dma_bitsize(void)
>      return 32; /* TODO */
>  }
>  
> +void* early_fdt_map(paddr_t fdt_paddr);

Nit: * and blank want to change places.

> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> +#include <xen/bootfdt.h>
>  #include <xen/bug.h>
>  #include <xen/compiler.h>
>  #include <xen/init.h>
> @@ -7,7 +8,9 @@
>  #include <xen/macros.h>
>  #include <xen/mm.h>
>  #include <xen/pfn.h>
> +#include <xen/libfdt/libfdt.h>

This wants to move up, to retain sorting.

>  #include <xen/sections.h>
> +#include <xen/sizes.h>
>  
>  #include <asm/early_printk.h>
>  #include <asm/csr.h>
> @@ -20,7 +23,7 @@ struct mmu_desc {
>      unsigned int pgtbl_count;
>      pte_t *next_pgtbl;
>      pte_t *pgtbl_base;
> -};
> +} mmu_desc = { CONFIG_PAGING_LEVELS, 0, NULL, 0 };

__initdata and static?

> @@ -39,9 +42,11 @@ static unsigned long __ro_after_init phys_offset;
>   * isn't 2 MB aligned.
>   *
>   * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
> - * except that the root page table is shared with the initial mapping
> + * except that the root page table is shared with the initial mapping.
> + *
> + * CONFIG_PAGING_LEVELS page tables are needed for device tree mapping.
>   */
> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 3 + 1 + 1)

Considering what would happen if two or three more of such requirements
were added, maybe better

#define PGTBL_INITIAL_COUNT (CONFIG_PAGING_LEVELS * 3 - 1)

? However, why is it CONFIG_PAGING_LEVELS that's needed, and not
CONFIG_PAGING_LEVELS - 1? The top level table is the same as the
identity map's, isn't it?

> @@ -296,6 +299,30 @@ unsigned long __init calc_phys_offset(void)
>      return phys_offset;
>  }
>  
> +void* __init early_fdt_map(paddr_t fdt_paddr)

See earlier remark regarding * placement.

Jan

