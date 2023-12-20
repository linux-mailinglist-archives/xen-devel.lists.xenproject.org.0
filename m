Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C3C819E60
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657714.1026755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFv0E-00072f-Os; Wed, 20 Dec 2023 11:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657714.1026755; Wed, 20 Dec 2023 11:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFv0E-000705-Lf; Wed, 20 Dec 2023 11:44:42 +0000
Received: by outflank-mailman (input) for mailman id 657714;
 Wed, 20 Dec 2023 11:44:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFv0D-0006w6-ND
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:44:41 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28ef5f52-9f2d-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 12:44:40 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33621d443a7so5734390f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 03:44:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d62c2000000b003366796301csm8328279wrv.0.2023.12.20.03.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 03:44:39 -0800 (PST)
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
X-Inumbo-ID: 28ef5f52-9f2d-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703072680; x=1703677480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=riId0RVKY0qf9i0QvzWvHOjkhZWRMKLYHEGaZdhEmIo=;
        b=QHPZvqs+KLhGY+BDVkx6Q8EqM9n1M7bCUHLh9K7nHLRSQLeTYXs4epI7/Ux8ARIt1v
         70Tt67ZS7Q5Xe5tkdsp+oKBRKmzJEoZSO5Edl4RGc9AthsWDw/JKTzD8T2OLspW3AK5p
         6WmPGij8pzoA5u7AIXxdN1nsLcQBqUCNCNPlLhUukjEhWblUQF/nms52alTBrzyVhbNR
         hviOXxF/zB4gVKEcV8JFaTcLM4cfLrk0yNarPkt/eCJNik4/++WDfMo2UG/lgTCSWBve
         v6DXq+QL1ZED5nrbkwXQxvwUqJz0QDMIvd7y/mwm7hem22f2QdSbSt0dh5FfFw839NEE
         ZeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703072680; x=1703677480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=riId0RVKY0qf9i0QvzWvHOjkhZWRMKLYHEGaZdhEmIo=;
        b=UHKmfGdL7FFYnxcby5E6RrEfB2Qpev1pWWEWcz/Q2GYztysIBgZnHkNma3wu7VTGKK
         zenVJateFY/2Aq6WoDi7BEB7WR2/KRgV+F7MaudMZCBvSUOEwUyij9I+7rCT1lrkzzjA
         1zehQEzkzPgSAQZEOnu/tmg6QT5Q1+2FAS0IJTDgytUaw5kUxUk1/dk0aZJ5hriDWG7B
         J/H4U/qGMPwjpqeuDI0GI9jNJRblew+VftHEsHJwsI94NzQKkLXID/pcIEmTxyOYA5tT
         pWtx2nEmc2m6+o3S2OFVRdbqsWmepdnY4WNZnnIm0t2JgIx94Zbqon03qTD98E6RmdMn
         7Vtg==
X-Gm-Message-State: AOJu0YxzaoPJB+dRCXlaY3xACvzc8zseDlFoKviMAssHGDyhBTPX/KQZ
	4RNsB7Dg8YsXKCpxzUccE9IJkVmuDm6yZpx68+k9
X-Google-Smtp-Source: AGHT+IGcBRKU2dSB5D8sUGNOUoaSiSNKE7NlsPYyfuNQ1ERkHPkIslOcuxr1navTs2U0Of+A5dtY+Q==
X-Received: by 2002:a5d:6081:0:b0:336:7b79:3caa with SMTP id w1-20020a5d6081000000b003367b793caamr347586wrt.76.1703072679818;
        Wed, 20 Dec 2023 03:44:39 -0800 (PST)
Message-ID: <44d5b692-00af-4dc0-8bfb-a25296499a48@suse.com>
Date: Wed, 20 Dec 2023 12:44:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen/ppc: Enable bootfdt and boot allocator
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <aa67a0dacab0e3f39dabeb30e31732d617cadde1.1702607884.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <aa67a0dacab0e3f39dabeb30e31732d617cadde1.1702607884.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2023 03:44, Shawn Anastasio wrote:
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/setup.h
> @@ -0,0 +1,123 @@
> +#ifndef __ASM_PPC_SETUP_H__
> +#define __ASM_PPC_SETUP_H__
> +
> +#define max_init_domid (0)
> +
> +#include <public/version.h>
> +#include <asm/p2m.h>
> +#include <xen/device_tree.h>
> +
> +#define MIN_FDT_ALIGN 8
> +#define MAX_FDT_SIZE SZ_2M
> +
> +#define NR_MEM_BANKS 256
> +
> +#define MAX_MODULES 32 /* Current maximum useful modules */
> +
> +typedef enum {
> +    BOOTMOD_XEN,
> +    BOOTMOD_FDT,
> +    BOOTMOD_KERNEL,
> +    BOOTMOD_RAMDISK,
> +    BOOTMOD_XSM,
> +    BOOTMOD_GUEST_DTB,
> +    BOOTMOD_UNKNOWN
> +}  bootmodule_kind;
> +
> +enum membank_type {
> +    /*
> +     * The MEMBANK_DEFAULT type refers to either reserved memory for the
> +     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
> +     * the bank is in 'mem').
> +     */
> +    MEMBANK_DEFAULT,
> +    /*
> +     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the memory
> +     * bank is bound to a static Xen domain. It is only valid when the bank
> +     * is in reserved_mem.
> +     */
> +    MEMBANK_STATIC_DOMAIN,
> +    /*
> +     * The MEMBANK_STATIC_HEAP type is used to indicate whether the memory
> +     * bank is reserved as static heap. It is only valid when the bank is
> +     * in reserved_mem.
> +     */
> +    MEMBANK_STATIC_HEAP,
> +};
> +
> +/* Indicates the maximum number of characters(\0 included) for shm_id */
> +#define MAX_SHM_ID_LENGTH 16
> +
> +struct membank {
> +    paddr_t start;
> +    paddr_t size;
> +    enum membank_type type;
> +};
> +
> +struct meminfo {
> +    unsigned int nr_banks;
> +    struct membank bank[NR_MEM_BANKS];
> +};
> +
> +/*
> + * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
> + * The purpose of the domU flag is to avoid getting confused in
> + * kernel_probe, where we try to guess which is the dom0 kernel and
> + * initrd to be compatible with all versions of the multiboot spec.
> + */
> +#define BOOTMOD_MAX_CMDLINE 1024

Why does this live here, rather than ...

> +struct bootmodule {
> +    bootmodule_kind kind;
> +    bool domU;
> +    paddr_t start;
> +    paddr_t size;
> +};
> +
> +/* DT_MAX_NAME is the node name max length according the DT spec */
> +#define DT_MAX_NAME 41

... next to this?

> +struct bootcmdline {
> +    bootmodule_kind kind;
> +    bool domU;
> +    paddr_t start;
> +    char dt_name[DT_MAX_NAME];
> +    char cmdline[BOOTMOD_MAX_CMDLINE];
> +};
> +
> +struct bootmodules {
> +    int nr_mods;
> +    struct bootmodule module[MAX_MODULES];
> +};
> +
> +struct bootcmdlines {
> +    unsigned int nr_mods;
> +    struct bootcmdline cmdline[MAX_MODULES];
> +};
> +
> +struct bootinfo {
> +    struct meminfo mem;
> +    struct meminfo reserved_mem;
> +    struct bootmodules modules;
> +    struct bootcmdlines cmdlines;
> +    bool static_heap;

Unused field?

> +};
> +
> +extern struct bootinfo bootinfo;
> +
> +/*
> + * setup.c
> + */
> +
> +bool check_reserved_regions_overlap(paddr_t region_start, paddr_t region_size);
> +struct bootmodule *add_boot_module(bootmodule_kind kind,
> +                                   paddr_t start, paddr_t size, bool domU);
> +void add_boot_cmdline(const char *name, const char *cmdline,
> +                      bootmodule_kind kind, paddr_t start, bool domU);
> +const char *boot_module_kind_as_string(bootmodule_kind kind);
> +struct bootcmdline * __init boot_cmdline_find_by_kind(bootmodule_kind kind);

No __init please on declarations; section placement attributes make sense only
on definitions (with pretty narrow exceptions).

> --- a/xen/arch/ppc/setup.c
> +++ b/xen/arch/ppc/setup.c
> @@ -1,16 +1,296 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  #include <xen/init.h>
>  #include <xen/lib.h>
> +#include <xen/libfdt/libfdt.h>
>  #include <xen/mm.h>
>  #include <public/version.h>
>  #include <asm/boot.h>
>  #include <asm/early_printk.h>
>  #include <asm/mm.h>
>  #include <asm/processor.h>
> +#include <asm/setup.h>
>  
>  /* Xen stack for bringing up the first CPU. */
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);
>  
> +struct bootinfo __initdata bootinfo;
> +
> +void __init add_boot_cmdline(const char *name, const char *cmdline,
> +                             bootmodule_kind kind, paddr_t start, bool domU)
> +{
> +    struct bootcmdlines *cmds = &bootinfo.cmdlines;
> +    struct bootcmdline *cmd;
> +
> +    if ( cmds->nr_mods == MAX_MODULES )
> +    {
> +        printk("Ignoring %s cmdline (too many)\n", name);
> +        return;
> +    }
> +
> +    cmd = &cmds->cmdline[cmds->nr_mods++];
> +    cmd->kind = kind;
> +    cmd->domU = domU;
> +    cmd->start = start;
> +
> +    ASSERT(strlen(name) <= DT_MAX_NAME);
> +    safe_strcpy(cmd->dt_name, name);
> +
> +    if ( strlen(cmdline) > BOOTMOD_MAX_CMDLINE )
> +        panic("module %s command line too long\n", name);
> +    safe_strcpy(cmd->cmdline, cmdline);
> +}
> +
> +struct bootmodule __init *add_boot_module(bootmodule_kind kind,
> +                                          paddr_t start, paddr_t size,
> +                                          bool domU)
> +{
> +    struct bootmodules *mods = &bootinfo.modules;
> +    struct bootmodule *mod;
> +    unsigned int i;
> +
> +    if ( mods->nr_mods == MAX_MODULES )
> +    {
> +        printk("Ignoring %s boot module at %"PRIpaddr"-%"PRIpaddr" (too many)\n",
> +               boot_module_kind_as_string(kind), start, start + size);
> +        return NULL;
> +    }
> +
> +    if ( check_reserved_regions_overlap(start, size) )
> +        return NULL;
> +
> +    for ( i = 0 ; i < mods->nr_mods ; i++ )
> +    {
> +        mod = &mods->module[i];
> +        if ( mod->kind == kind && mod->start == start )
> +        {
> +            if ( !domU )
> +                mod->domU = false;

What's the intention behind this (negative) accumulation of "domU"?

> +            return mod;
> +        }
> +    }

And what's the intention behind checking existing modules here (but not
existing command lines higher up in add_boot_cmdline())?

> +    mod = &mods->module[mods->nr_mods++];
> +    mod->kind = kind;
> +    mod->start = start;
> +    mod->size = size;
> +    mod->domU = domU;
> +
> +    return mod;
> +}
> +
> +const char * __init boot_module_kind_as_string(bootmodule_kind kind)
> +{
> +    switch ( kind )
> +    {
> +    case BOOTMOD_XEN:     return "Xen";
> +    case BOOTMOD_FDT:     return "Device Tree";
> +    case BOOTMOD_KERNEL:  return "Kernel";
> +    default: BUG();
> +    }
> +}
> +
> +/*
> + * TODO: '*_end' could be 0 if the module/region is at the end of the physical
> + * address space. This is for now not handled as it requires more rework.
> + */
> +static bool __init bootmodules_overlap_check(struct bootmodules *bootmodules,
> +                                             paddr_t region_start,
> +                                             paddr_t region_size)
> +{
> +    paddr_t mod_start = INVALID_PADDR, mod_end = 0;

Pointless initializers? (The variables might benefit from moving into
the more narrow scope anyway.)

> +    paddr_t region_end = region_start + region_size;
> +    unsigned int i, mod_num = bootmodules->nr_mods;
> +
> +    for ( i = 0; i < mod_num; i++ )
> +    {
> +        mod_start = bootmodules->module[i].start;
> +        mod_end = mod_start + bootmodules->module[i].size;
> +
> +        if ( region_end <= mod_start || region_start >= mod_end )
> +            continue;
> +        else

I for one consider such an "else" misleading.

> +        {
> +            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with"
> +                   " mod[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n", region_start,
> +                   region_end, i, mod_start, mod_end);
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +/*
> + * TODO: '*_end' could be 0 if the bank/region is at the end of the physical
> + * address space. This is for now not handled as it requires more rework.
> + */
> +static bool __init meminfo_overlap_check(struct meminfo *meminfo,
> +                                         paddr_t region_start,
> +                                         paddr_t region_size)
> +{
> +    paddr_t bank_start = INVALID_PADDR, bank_end = 0;

As above: Pointless initializers? (The variables might benefit from moving
into the more narrow scope anyway.)

> +    paddr_t region_end = region_start + region_size;
> +    unsigned int i, bank_num = meminfo->nr_banks;
> +
> +    for ( i = 0; i < bank_num; i++ )
> +    {
> +        bank_start = meminfo->bank[i].start;
> +        bank_end = bank_start + meminfo->bank[i].size;
> +
> +        if ( region_end <= bank_start || region_start >= bank_end )
> +            continue;
> +        else
> +        {
> +            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with"
> +                   " bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n", region_start,
> +                   region_end, i, bank_start, bank_end);

I think this is confusing to read: When the format string already needs
wrapping, I don't think the next argument should be put on the same line.
I was almost going to complain that arguments don't fit the format string.

> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +/*
> + * Given an input physical address range, check if this range is overlapping
> + * with the existing reserved memory regions defined in bootinfo.
> + * Return true if the input physical address range is overlapping with any
> + * existing reserved memory regions, otherwise false.
> + */
> +bool __init check_reserved_regions_overlap(paddr_t region_start,
> +                                           paddr_t region_size)
> +{
> +    /* Check if input region is overlapping with bootinfo.reserved_mem banks */
> +    if ( meminfo_overlap_check(&bootinfo.reserved_mem,
> +                               region_start, region_size) )
> +        return true;
> +
> +    /* Check if input region is overlapping with bootmodules */
> +    if ( bootmodules_overlap_check(&bootinfo.modules,
> +                                   region_start, region_size) )
> +        return true;
> +
> +    return false;
> +}
> +
> +/*
> + * Return the end of the non-module region starting at s. In other
> + * words return s the start of the next modules after s.

Stray " s" after "return"?

> + * On input *end is the end of the region which should be considered
> + * and it is updated to reflect the end of the module, clipped to the
> + * end of the region if it would run over.
> + */
> +static paddr_t __init next_module(paddr_t s, paddr_t *end)
> +{
> +    struct bootmodules *mi = &bootinfo.modules;

const?

> +    paddr_t lowest = ~(paddr_t)0;
> +    int i;

unsigned int?

> +    for ( i = 0; i < mi->nr_mods; i++ )
> +    {
> +        paddr_t mod_s = mi->module[i].start;
> +        paddr_t mod_e = mod_s + mi->module[i].size;
> +
> +        if ( !mi->module[i].size )
> +            continue;
> +
> +        if ( mod_s < s )
> +            continue;
> +        if ( mod_s > lowest )
> +            continue;
> +        if ( mod_s > *end )
> +            continue;
> +        lowest = mod_s;
> +        *end = min(*end, mod_e);
> +    }
> +    return lowest;
> +}
> +
> +static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
> +                                         void (*cb)(paddr_t ps, paddr_t pe),
> +                                         unsigned int first)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
> +    {
> +        paddr_t r_s = bootinfo.reserved_mem.bank[i].start;
> +        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i].size;
> +
> +        if ( s < r_e && r_s < e )
> +        {
> +            dt_unreserved_regions(r_e, e, cb, i + 1);
> +            dt_unreserved_regions(s, r_s, cb, i + 1);

What's the reason for this recursion? Can there be overlapping regions?
If so, is there a guaranteed depth limit (seeing in particular that
you're not using the last function parameter)?

> +            return;
> +        }
> +    }
> +
> +    cb(s, e);
> +}
> +
> +/*
> + * boot_cmdline_find_by_kind can only be used to return Xen modules (e.g
> + * XSM, DTB) or Dom0 modules. This is not suitable for looking up guest
> + * modules.
> + */
> +struct bootcmdline * __init boot_cmdline_find_by_kind(bootmodule_kind kind)

This function looks to be unused?

> +{
> +    struct bootcmdlines *cmds = &bootinfo.cmdlines;
> +    struct bootcmdline *cmd;
> +    int i;

unsigned int?

> +    for ( i = 0 ; i < cmds->nr_mods ; i++ )
> +    {
> +        cmd = &cmds->cmdline[i];
> +        if ( cmd->kind == kind && !cmd->domU )
> +            return cmd;
> +    }
> +    return NULL;
> +}
> +
> +/*
> + * Populate the boot allocator. Based on arch/arm/setup.c's
> + * populate_boot_allocator.
> + * All RAM but the following regions will be added to the boot allocator:
> + *  - Modules (e.g., Xen, Kernel)
> + *  - Reserved regions
> + */
> +static void __init populate_boot_allocator(void)
> +{
> +    unsigned int i;
> +    const struct meminfo *banks = &bootinfo.mem;
> +    paddr_t s, e;
> +
> +    for ( i = 0; i < banks->nr_banks; i++ )
> +    {
> +        const struct membank *bank = &banks->bank[i];
> +        paddr_t bank_end = bank->start + bank->size;

Since you already make use of inner scope variables, and reason not
to put s here and ...

> +        s = bank->start;
> +        while ( s < bank_end )
> +        {
> +            paddr_t n = bank_end;

... e even here (each then gaining an initializer as well)?

> +            e = next_module(s, &n);
> +
> +            if ( e == ~(paddr_t)0 )
> +                e = n = bank_end;
> +
> +            /*
> +             * Module in a RAM bank other than the one which we are
> +             * not dealing with here.

Nit: "not"?

> +             */
> +            if ( e > bank_end )
> +                e = bank_end;
> +
> +            dt_unreserved_regions(s, e, init_boot_pages, 0);
> +
> +            s = n;
> +        }
> +    }
> +}
> +
>  void setup_exceptions(void)
>  {
>      unsigned long lpcr;
> @@ -24,6 +304,8 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
>                                 unsigned long r5, unsigned long r6,
>                                 unsigned long r7)
>  {
> +    void *boot_fdt;

const?

> @@ -32,11 +314,16 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
>      else
>      {
>          /* kexec boot protocol */
> -        boot_opal_init((void *)r3);
> +        boot_fdt = (void *)r3;

And then here as well, to avoid Misra complaints.

> +        boot_opal_init(boot_fdt);
>      }
>  
>      setup_exceptions();
>  
> +    boot_fdt_info(boot_fdt, r3);
> +
> +    populate_boot_allocator();
> +
>      setup_initial_pagetables();
>  
>      early_printk("Hello, ppc64le!\n");
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -543,12 +543,33 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>      if ( ret < 0 )
>          panic("No valid device tree\n");
>  
> -    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
> -
>      ret = device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
>      if ( ret )
>          panic("Early FDT parsing failed (%d)\n", ret);
>  
> +    /*
> +     * Add module for the FDT itself after the device tree has been parsed. This
> +     * is required on ppc64le where the device tree passed to Xen may have been
> +     * allocated by skiboot, in which case it will exist within a reserved
> +     * region and this call will fail. This is fine, however, since either way
> +     * the allocator will know not to step on the device tree.
> +     */
> +    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
> +
> +    /*
> +     * Xen relocates itself at the ppc64 entrypoint, so we need to manually mark
> +     * the kernel module.
> +     */
> +    if ( IS_ENABLED(CONFIG_PPC64) ) {

Nit (style): Brace placement.

> +        paddr_t xen_start, xen_end;
> +
> +        xen_start = __pa(_start);
> +        xen_end = PAGE_ALIGN(__pa(_end));
> +        if ( !add_boot_module(BOOTMOD_XEN, xen_start, xen_end, false) )
> +            panic("Xen overlaps reserved memory! %016lx - %016lx\n", xen_start,
> +                xen_end);
> +    }

I'll need to leave commenting on this to the DT maintainers.

Jan

