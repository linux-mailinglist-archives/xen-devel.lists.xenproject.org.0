Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44C7B002C2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 15:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039516.1411351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZqsv-0006pY-UR; Thu, 10 Jul 2025 13:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039516.1411351; Thu, 10 Jul 2025 13:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZqsv-0006mk-RZ; Thu, 10 Jul 2025 13:00:21 +0000
Received: by outflank-mailman (input) for mailman id 1039516;
 Thu, 10 Jul 2025 13:00:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZqsu-0006me-8l
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 13:00:20 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d439c656-5d8d-11f0-a317-13f23c93f187;
 Thu, 10 Jul 2025 15:00:18 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so937791f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 06:00:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e064a9sm2130887b3a.47.2025.07.10.06.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 06:00:16 -0700 (PDT)
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
X-Inumbo-ID: d439c656-5d8d-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752152417; x=1752757217; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TniQF/tckN6qKfG6jaPOyEpEIgeLq931FdMK6Fl00Bg=;
        b=XrMffwgKj/wLzdUnwBgwlow0A5gYnZ+ZRv/Ip9wE1fyOay5YdjeY2xQg6irgi67hRh
         KC/5eJkz46th9tueHKk1IzI3jxKoQN89nTJR8aIELIymIz4SonbLtW/IbDJH7awUrpv7
         V+h96AkPGtuK7O2zkqK+oI+i36qOxpX1icuBprtu8uLr0j4mmcgNN95WXiTspUbooZJM
         7TgqVnigLO8NyvYu+KkoZyARfuFEMD0JSCtzRPLqq3I31ttqOb1+A71BdGKypbJDrtll
         fyrvzRHbu8MRAPaz+TetUqgdU/GnKQPGGeqnKjqoawxzUS5ihFMFuqxQ4RfZMW2Zhq45
         +/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752152417; x=1752757217;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TniQF/tckN6qKfG6jaPOyEpEIgeLq931FdMK6Fl00Bg=;
        b=Cz2+31khMLshofnMwaY6BXxB/SPbsB07F/QTT2YYnM7J/XEirwC7xuJiNELJJxxgR9
         xGECNjVdoUqdtZx+3ZffnkuWh+Ggs1f+2cfI932cDVQhYugobh9u8nmfthYGQj4FF0h0
         /vSpNxGzU89eLU/zaxRqitbvBOibOXGzzD+xNrYUDkfLqm95k6jy0AXD5CrSj4eDMQZV
         mgrv1mMuziZ6tTP89omQwwZhDMH8z5++oyaXVBNgNO7+pDHyEgBHyO3ZLtbHlgMrtHV3
         oFkle8slOvVyiWAnPOZgywFWKz+arYJS+PMn4TmLkiO+/SUq4JRC9s9EyZh1TVnvPobT
         2DeA==
X-Forwarded-Encrypted: i=1; AJvYcCX1HC9QK1KtEI29qIEOhYTouC8CHPCCQYVuwiUQ0iow1GtfaQ9zPukAkLsZ1cZcfGMp6AnYP/+pksE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWKH/Qqr3uyfag6bOQRL6jM2Z5PMasWU7bvBaBiZxNTfXjeNYL
	wB/D7TOmHZS1u6RPZzEq6Ywl/Vzf4EcrAIFvKCjyPGGfVmBcSgw2WxRvkYaJZW2VYw==
X-Gm-Gg: ASbGncv1mfprtU3yhXtb+5hKaIhPlE6Z5Z9YwH95/yYvRpcL6rRrKXWyaA7VgdnNzoX
	FmU73xxiMhN06+K8a/VayeIjKVLnJK5zkwBVAB0LRmZ7eZ/WZZUN4Xu9be8Xhp6lwNcCXxOJEVP
	MXZ+XlfJxak9vV/5WdwZTk7ZGvE80/4GE24pYa2OkY4WZ/zwRlqLxDqOrbrDONDO/OklZFy1gj6
	OpCqmrZX2RwsYXMS4gHhsaH7aSUrdCnhNqnbOhdkymCYsOFrFrdY+APlL2xuWf7khPvHiJjBTl7
	4k9lkRI8SpwmMlcGGt3RE4HyAkwL2TWp7D7YacerNZIKD5iHNGXPtRTJXYLV7izGUBw6r+lTk94
	3LRwMAQoFU5Ac85upD4JZybtT3LzXfBlX63tUGFIglqLEY+c=
X-Google-Smtp-Source: AGHT+IEYYOcIBfqUFKkVRvlFb8xbloauxzxN4K23cwwzq0l2L9hivGWAc+iR+scQyst5cD4IO+i3ZQ==
X-Received: by 2002:adf:9dc7:0:b0:3b5:e201:d290 with SMTP id ffacd0b85a97d-3b5e78c9be8mr2863482f8f.31.1752152417232;
        Thu, 10 Jul 2025 06:00:17 -0700 (PDT)
Message-ID: <45ed8b90-ce0c-419e-9c7d-2ab58ee539a2@suse.com>
Date: Thu, 10 Jul 2025 15:00:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/22] xen/arch/x86: reserve TXT memory during Slaunch
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <8d5ba2e7a0a8bd05bb9cdb89db3f15b831f7f4f7.1748611041.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <8d5ba2e7a0a8bd05bb9cdb89db3f15b831f7f4f7.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -106,6 +106,9 @@
>  #define _PGC_need_scrub   _PGC_allocated
>  #define PGC_need_scrub    PGC_allocated
>  
> +/* How much of the directmap is prebuilt at compile time. */
> +#define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)

Better 1U or even 1UL?

> --- a/xen/arch/x86/include/asm/slaunch.h
> +++ b/xen/arch/x86/include/asm/slaunch.h
> @@ -7,6 +7,7 @@
>  #ifndef X86_SLAUNCH_H
>  #define X86_SLAUNCH_H
>  
> +#include <xen/slr-table.h>
>  #include <xen/types.h>
>  
>  /* Indicates an active Secure Launch boot. */
> @@ -18,9 +19,52 @@ extern bool slaunch_active;
>   */
>  extern uint32_t slaunch_slrt;
>  
> +/*
> + * evt_log is assigned a physical address and the caller must map it to
> + * virtual, if needed.

In which case you want to use paddr_t, not void *.

> + */
> +static inline void find_evt_log(const struct slr_table *slrt, void **evt_log,
> +                                uint32_t *evt_log_size)
> +{
> +    const struct slr_entry_log_info *log_info;
> +
> +    log_info = (const struct slr_entry_log_info *)
> +        slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_LOG_INFO);

In situations like this please use the less type-unsafe container_of().
(Apparently applies also to at least one earlier patch.)

> +    if ( log_info != NULL )
> +    {
> +        *evt_log = _p(log_info->addr);
> +        *evt_log_size = log_info->size;
> +    }
> +    else
> +    {
> +        *evt_log = NULL;
> +        *evt_log_size = 0;
> +    }
> +}
> +
>  /*
>   * Retrieves pointer to SLRT.  Checks table's validity and maps it as necessary.
>   */
>  struct slr_table *slaunch_get_slrt(void);
>  
> +/*
> + * Prepares for accesses to essential data structures setup by boot environment.
> + */
> +void slaunch_map_mem_regions(void);
> +
> +/* Marks regions of memory as used to avoid their corruption. */
> +void slaunch_reserve_mem_regions(void);
> +
> +/*
> + * This helper function is used to map memory using L2 page tables by aligning
> + * mapped regions to 2MB. This way page allocator (which at this point isn't
> + * yet initialized) isn't needed for creating new L1 mappings. The function
> + * also checks and skips memory already mapped by the prebuilt tables.
> + *
> + * There is no unmap_l2() because the function is meant to be used by the code
> + * that accesses DRTM-related memory soon after which Xen rebuilds memory maps,
> + * effectively dropping all existing mappings.
> + */
> +int slaunch_map_l2(unsigned long paddr, unsigned long size);

While largely benign on x86-64, maybe better paddr_t and size_t. And then ...

> --- /dev/null
> +++ b/xen/arch/x86/intel-txt.c
> @@ -0,0 +1,113 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
> + */
> +
> +#include <xen/bug.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/types.h>
> +#include <asm/e820.h>
> +#include <asm/intel-txt.h>
> +#include <asm/slaunch.h>
> +
> +static uint64_t __initdata txt_heap_base, txt_heap_size;

... why suddenly uint64_t here (and then elsewhere below)?

> +/* Mark RAM region as RESERVED if it isn't marked that way already. */
> +static int __init mark_ram_as(struct e820map *map, uint64_t start,
> +                              uint64_t end, uint32_t type)
> +{
> +    unsigned int i;
> +    uint32_t from_type = E820_RAM;
> +
> +    for ( i = 0; i < map->nr_map; i++ )
> +    {
> +        uint64_t rs = map->map[i].addr;
> +        uint64_t re = rs + map->map[i].size;
> +
> +        /* The entry includes the range. */
> +        if ( start >= rs && end <= re )
> +            break;
> +
> +        /* The entry intersects the range. */
> +        if ( end > rs && start < re )
> +        {
> +            /* Fatal failure. */
> +            return 0;
> +        }
> +    }
> +
> +    /*
> +     * If the range is not included by any entry and no entry intersects it,
> +     * then it's not listed in the memory map.  Consider this case as a success
> +     * since we're only preventing RAM from being used and unlisted range should
> +     * not be used.
> +     */
> +    if ( i == map->nr_map )
> +        return 1;
> +
> +    /*
> +     * e820_change_range_type() fails if the range is already marked with the
> +     * desired type.  Don't consider it an error if firmware has done it for us.
> +     */
> +    if ( map->map[i].type == type )
> +        return 1;
> +
> +    /* E820_ACPI or E820_NVS are really unexpected, but others are fine. */
> +    if ( map->map[i].type == E820_RESERVED ||
> +         map->map[i].type == E820_UNUSABLE )

Are you sure about permitting UNUSABLE here?

> +        from_type = map->map[i].type;
> +
> +    return e820_change_range_type(map, start, end, from_type, type);

Even if this function, for historic reasons, also returns int/0/1, please make
new code with boolean results return bool/false/true.

> +void __init txt_reserve_mem_regions(void)
> +{
> +    int rc;
> +    uint64_t sinit_base, sinit_size;
> +
> +    /* TXT Heap */
> +    BUG_ON(txt_heap_base == 0);
> +    printk("SLAUNCH: reserving TXT heap (%#lx - %#lx)\n", txt_heap_base,
> +           txt_heap_base + txt_heap_size);

Please log ranges in a way that makes it unambiguous whether they're exclusive
or inclusive (especially at the upper end).

> +    rc = mark_ram_as(&e820_raw, txt_heap_base, txt_heap_base + txt_heap_size,
> +                     E820_RESERVED);
> +    BUG_ON(rc == 0);

As to the boolean remark above - constructs like this look particularly odd:
Typically a return code (stored in a variable named "rc") of 0 means "success".

> +    sinit_base = txt_read(TXTCR_SINIT_BASE);
> +    BUG_ON(sinit_base == 0);
> +
> +    sinit_size = txt_read(TXTCR_SINIT_SIZE);
> +    BUG_ON(sinit_size == 0);
> +
> +    /* SINIT */
> +    printk("SLAUNCH: reserving SINIT memory (%#lx - %#lx)\n", sinit_base,
> +           sinit_base + sinit_size);
> +    rc = mark_ram_as(&e820_raw, sinit_base, sinit_base + sinit_size,
> +                     E820_RESERVED);
> +    BUG_ON(rc == 0);
> +
> +    /* TXT Private Space */
> +    rc = mark_ram_as(&e820_raw, TXT_PRIV_CONFIG_REGS_BASE,
> +                     TXT_PRIV_CONFIG_REGS_BASE + TXT_CONFIG_SPACE_SIZE,
> +                     E820_UNUSABLE);

Why UNUSABLE? Then, if all callers used RESERVED, this wouldn't need to be
a function arguments anymore, and you also wouldn't need to change RESERVED
ranges.

> --- a/xen/arch/x86/slaunch.c
> +++ b/xen/arch/x86/slaunch.c
> @@ -7,14 +7,18 @@
>  #include <xen/compiler.h>
>  #include <xen/init.h>
>  #include <xen/macros.h>
> +#include <xen/mm.h>
>  #include <xen/types.h>
> +#include <asm/e820.h>
> +#include <asm/intel-txt.h>
> +#include <asm/page.h>
>  #include <asm/slaunch.h>
>  
>  /*
>   * These variables are assigned to by the code near Xen's entry point.
>   *
>   * slaunch_active is not __initdata to allow checking for an active Secure
> - * Launch boot.
> + * Launch boot at any point.

This comment adjustment should probably move to where the comment is being
introduced.

> @@ -25,3 +29,95 @@ static void __maybe_unused compile_time_checks(void)
>  {
>      BUILD_BUG_ON(sizeof(slaunch_active) != 1);
>  }
> +
> +struct slr_table *__init slaunch_get_slrt(void)
> +{
> +    static struct slr_table *slrt;

__initdata?

> +    if (slrt == NULL) {

Nit: Style.

> +        int rc;
> +
> +        slrt = __va(slaunch_slrt);
> +
> +        rc = slaunch_map_l2(slaunch_slrt, PAGE_SIZE);
> +        BUG_ON(rc != 0);
> +
> +        if ( slrt->magic != SLR_TABLE_MAGIC )
> +            panic("SLRT has invalid magic value: %#08x!\n", slrt->magic);

While %#x is indeed the prefered form to use, in particular when padding that's
not normally helpful, as the 0x prefix is included in the character count. And
the value zero also ends up odd in that case, I think.

> +int __init slaunch_map_l2(unsigned long paddr, unsigned long size)
> +{
> +    unsigned long aligned_paddr = paddr & ~((1ULL << L2_PAGETABLE_SHIFT) - 1);
> +    unsigned long pages = ((paddr + size) - aligned_paddr);
> +    pages = ROUNDUP(pages, 1ULL << L2_PAGETABLE_SHIFT) >> PAGE_SHIFT;

Nit: Blank line please between declaration(s) and statement(s).

> +    if ( aligned_paddr + pages * PAGE_SIZE <= PREBUILT_MAP_LIMIT )
> +        return 0;
> +
> +    if ( aligned_paddr < PREBUILT_MAP_LIMIT )
> +    {
> +        pages -= (PREBUILT_MAP_LIMIT - aligned_paddr) >> PAGE_SHIFT;
> +        aligned_paddr = PREBUILT_MAP_LIMIT;
> +    }
> +
> +    return map_pages_to_xen((uintptr_t)__va(aligned_paddr),
> +                            maddr_to_mfn(aligned_paddr),
> +                            pages, PAGE_HYPERVISOR);
> +}

What is being mapped here is (silently?) assumed to be below 4Gb? The
function could anyway do with a brief comment saying what it's intended
to do, and what assumptions it makes.

It further looks as if you may be doing the same mapping multiple times,
as you don't record what was already mapped.

Jan

