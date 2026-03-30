Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sArjDEuNymn09gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 16:48:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 965AF35D249
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 16:48:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267745.1557193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7DuB-0002Eq-DV; Mon, 30 Mar 2026 14:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267745.1557193; Mon, 30 Mar 2026 14:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7DuB-0002DP-9x; Mon, 30 Mar 2026 14:47:51 +0000
Received: by outflank-mailman (input) for mailman id 1267745;
 Mon, 30 Mar 2026 14:47:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7Du9-0002Ap-8f
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 14:47:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Du8-004VvS-6T
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 16:47:48 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca8d02-2eae-0a2a0a5409dd-0a2a4508e350-26
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 16:47:48 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca8d13-1950-0a2a45080019-d155dd30d14b-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 16:47:47 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-43cfde3c3f3so934884f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 07:47:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf245e4b9sm17708674f8f.20.2026.03.30.07.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 07:47:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774882067; x=1775486867; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M2lKzkvcp/5rst2tKlCQyuyRBHib1VqG+RYhnZ32Aso=;
        b=LXY99KF7SIXxhR9ajmTSdVsBYgVVc9gLruVkHBNROY92kJRUXC9/yQS+7KePuEHIHY
         d3NHWJJ9ic4eT5FsQiXN5ZxkDKyR9vfR4OP2gg5SQKLjXjz0+gWBBqcVxm6Y0xYsiUyW
         +MIETGIZAKZ1I4nOZYdIOCNhOFLKPFVhNwTAZFAu6JjyoGNFtim/0CHnJwUVLAlBl5fI
         PYYkWzEgNdtHPCuB24yqcmRiQ7xDoH5dMF4zFB7DSIdL9uhjSobQSiCCLXGH1zDF1pgM
         1a2yg3ih6zCAVpkbqsd8pleZZqcc40NjZI55Ituo0Y5OF59EWlQNESNZ9Uz1pQJYv1b4
         TgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882067; x=1775486867;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2lKzkvcp/5rst2tKlCQyuyRBHib1VqG+RYhnZ32Aso=;
        b=MmSKpdQ044AKiFSlFV8pSL8bnuARDGTYKATRs4Axc68J/CqvrJCu7E/1oQgYTS3xyy
         j9ZxkJNS/vTCO6qfWmGOULQLi4o8vPJIiOwlKE2h0aX6ykatR7dDhZhZtM6IvHyFUB/j
         n+wVibQWLw5b/Bj8TeRDaVCauD7zI3owIg3uSk/tCR+wf6+g0fqbBcQk7hkC09xHZWpi
         nErWYIr0J2ZODnrryiUbqhHiN+WVCieRcrpxthtFZeBNrbPqM05VMgqECFiHMh2OsNSV
         XvNA/FY1g/iUW7yZML4W2o0F4x+hU4ZZWOmYKFAGPzrCYbBksdw27x/DnYaiEAnku1NX
         luMA==
X-Forwarded-Encrypted: i=1; AJvYcCV3nsuBopyjql7k7VMgTuH0TaIS73ZF6CZZMCYeienkbUVThvcJxhB66xhzpnq9ftTHwxFl6F6f5nU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzm45KTb7W1DCUKQ442OuJCUmZpiBsXfCoC+Zw6yQ7M5u/PldiV
	sveRQZprYHk4uyq188E8MV45gWQdMsl5CZfMdlLc5zuzOAZ20apCxR0QTAnL0YF0AFmgHjAfIOr
	YqfrYTA==
X-Gm-Gg: ATEYQzwqJqzBDhPCgQdvZejYSrdQiR3cOGmDtRqu5oiGZ0WevVutyrFJI6WiCWAjN33
	Kw0FoqCqNoNKu712S7/IenT/m04JhaPYxYD85OXbZBwWxb0oUYdWFhfXLqGs51aWnUiS3awo2uq
	UxjID2A6EV82n+f24qk1VBNUrMuBCZaPdWf2oD6Y0bZKP0EG2/+WijjzSljemUqSIaaD7qEXOaz
	gzvcfJ1Er3FuQW9z7qZbePYOOqm5FCpkFxBnxLC7rFuoOX5MraDokwzDuJGqetyTcoVeWrK8Huz
	TkRFfyOQ71GSI5PZO5hAEIJ/ar4ELUlH6RtrtggTVVWbA8VNFzsbLsjfFbbcLe0kJvn0fW3cN/c
	9cXa2TZ0Yviq2MTbN2iNslezlqCcFJjqgZfCZjYeOGp5wubvEsbhBQa1wxYWc08C+I+8zWk9IPd
	OoBf/nHLC8Rx7Yh2f7NFX1RVGRNgRdwK4cfpYzIBQTAUj6kjc6Lr4uDm6UXLuM2bengCaD0I7eQ
	1VssG2nSZ54ZlQ=
X-Received: by 2002:a05:6000:290a:b0:43c:ff58:35cd with SMTP id ffacd0b85a97d-43cff5837a7mr6915785f8f.2.1774882067329;
        Mon, 30 Mar 2026 07:47:47 -0700 (PDT)
Message-ID: <0a28eda9-a1c5-4e12-907e-b85f8972881c@suse.com>
Date: Mon, 30 Mar 2026 16:47:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] xen/riscv: add kernel loading support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <1688c6e0e616b2d1bc1a9050d66f007e0e65d3b2.1774281309.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1688c6e0e616b2d1bc1a9050d66f007e0e65d3b2.1774281309.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1774882067-E9287726-5CA60B33/0/0
X-purgate-type: clean
X-purgate-size: 6340
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.443];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 965AF35D249
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23.03.2026 17:29, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -8,6 +8,7 @@ obj-y += guestcopy.o
>  obj-y += imsic.o
>  obj-y += intc.o
>  obj-y += irq.o
> +obj-y += kernel.o

kernel.init.o, like Arm has it?

> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -151,6 +151,19 @@
>  extern unsigned long phys_offset; /* = load_start - XEN_VIRT_START */
>  #endif
>  
> +/*
> + * KERNEL_LOAD_ADDR_ALIGNMENT is defined based on paragraph of
> + * "Kernel location" of boot.rst:
> + * https://docs.kernel.org/arch/riscv/boot.html#kernel-location
> + */
> +#if defined(CONFIG_RISCV_32)
> +#define KERNEL_LOAD_ADDR_ALIGNMENT MB(4)
> +#elif defined(CONFIG_RISCV_64)
> +#define KERNEL_LOAD_ADDR_ALIGNMENT MB(2)
> +#else
> +#error "Define KERNEL_LOAD_ADDR_ALIGNMENT"
> +#endif

But that's Linux-specific. You want to be able to loader other OS kernels,
I suppose? The needed alignment should be a property of the kernel image,
suitably conveyed to the loader.

Is Arm similarly capable of loading only Linux images? What about in
particular XTF?

> --- /dev/null
> +++ b/xen/arch/riscv/kernel.c
> @@ -0,0 +1,158 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/bug.h>
> +#include <xen/compiler.h>
> +#include <xen/errno.h>
> +#include <xen/fdt-kernel.h>
> +#include <xen/guest_access.h>
> +#include <xen/init.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/mm.h>
> +#include <xen/types.h>
> +#include <xen/vmap.h>
> +
> +#include <asm/setup.h>
> +
> +#define IMAGE64_MAGIC_V2 0x05435352 /* Magic number 2, le, "RSC\x05" */
> +
> +static void __init place_modules(struct kernel_info *info, paddr_t kernbase,
> +                                 paddr_t kernend)
> +{
> +    const struct boot_module *mod = info->bd.initrd;
> +
> +    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
> +    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt), MB(2));
> +    const paddr_t modsize = initrd_len + dtb_len;
> +
> +    const paddr_t ramsize = info->mem.bank[0].size;
> +    const paddr_t kernsize = ROUNDUP(kernend, MB(2)) - kernbase;
> +
> +    if ( modsize + kernsize > ramsize )
> +        panic("Not enough memory in the first bank for the kernel+dtb+initrd\n");
> +
> +    info->dtb_paddr = ROUNDUP(kernend, MB(2));
> +
> +    info->initrd_paddr = info->dtb_paddr + dtb_len;
> +}

Where are all of the MB(2) coming from in here? Do they mean to be
KERNEL_LOAD_ADDR_ALIGNMENT?

Also, how come all of this is limited to the first memory bank?

> +static paddr_t __init kernel_image_place(struct kernel_info *info)
> +{
> +    paddr_t load_addr;
> +
> +    /*
> +     * At the moment, RISC-V's Linux kernel should be always position
> +     * independent based on "Per-MMU execution" of boot.rst:
> +     *   https://docs.kernel.org/arch/riscv/boot.html#pre-mmu-execution
> +     *
> +     * But just for the case when RISC-V's Linux kernel isn't position
> +     * independent it is needed to take load address from
> +     * info->image.start.
> +     *
> +     * If `start` is zero, the Image is position independent. */
> +    if ( likely(!info->image.start) )
> +        /*
> +         * According to boot.rst kernel load address should be properly
> +         * aligned:
> +         *   https://docs.kernel.org/arch/riscv/boot.html#kernel-location
> +         */
> +        load_addr = ROUNDUP(info->mem.bank[0].start, KERNEL_LOAD_ADDR_ALIGNMENT);
> +    else
> +        load_addr = info->image.start;
> +
> +    return load_addr;
> +}

*info doesn't look to be altered here, so likely the parameter wants to
be pointer-to-const.

> +static void __init kernel_image_load(struct kernel_info *info)
> +{
> +    int rc;
> +    paddr_t load_addr = kernel_image_place(info);
> +    paddr_t paddr = info->image.kernel_addr;
> +    paddr_t len = info->image.len;
> +    void *kernel;
> +
> +    info->entry = load_addr;

What if this is outside of memory bank 0 (as is possible when
info->image.start is non-zero).

> +    place_modules(info, load_addr, load_addr + len);
> +
> +    printk("Loading Image from %"PRIpaddr" to %"PRIpaddr"-%"PRIpaddr"\n",
> +            paddr, load_addr, load_addr + len);
> +
> +    kernel = ioremap_wc(paddr, len);

ioremap_cache()?

> +/* Check if the image is a 64-bit Image */
> +static int __init kernel_image64_probe(struct kernel_info *info,
> +                                       paddr_t addr, paddr_t size)
> +{
> +    /* riscv/boot-image-header.rst */
> +    struct {
> +        u32 code0;		  /* Executable code */
> +        u32 code1;		  /* Executable code */
> +        u64 text_offset;  /* Image load offset, little endian */
> +        u64 image_size;	  /* Effective Image size, little endian */
> +        u64 flags;		  /* kernel flags, little endian */
> +        u32 version;	  /* Version of this header */
> +        u32 res1;		  /* Reserved */
> +        u64 res2;		  /* Reserved */
> +        u64 magic;        /* Deprecated: Magic number, little endian, "RISCV" */
> +        u32 magic2;       /* Magic number 2, little endian, "RSC\x05" */
> +        u32 res3;		  /* Reserved for PE COFF offset */

uint<N>_t throughout, please. And no use of hard tabs.

> +    } image;
> +    uint64_t start, end;
> +
> +    if ( size < sizeof(image) )
> +        return -EINVAL;
> +
> +    copy_from_paddr(&image, addr, sizeof(image));
> +
> +    /* Magic v1 is deprecated and may be removed.  Only use v2 */
> +    if ( image.magic2 != IMAGE64_MAGIC_V2 )
> +        return -EINVAL;

This doesn't look to be endian-ness-agnostic.

> +    /* Currently there is no length in the header, so just use the size */
> +    start = 0;
> +    end = size;

What's image_size then?

> +    /*
> +     * Given the above this check is a bit pointless, but leave it
> +     * here in case someone adds a length field in the future.
> +     */
> +    if ( (end - start) > size )
> +        return -EINVAL;
> +
> +    info->image.kernel_addr = addr;
> +    info->image.len = end - start;
> +    info->image.text_offset = image.text_offset;

This again doesn't look to be endian-ness-agnostic.

Jan

