Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNqoBSE852no5QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:58:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69667438782
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288668.1568910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6vR-0002f5-KD; Tue, 21 Apr 2026 08:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288668.1568910; Tue, 21 Apr 2026 08:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6vR-0002cG-Gx; Tue, 21 Apr 2026 08:57:45 +0000
Received: by outflank-mailman (input) for mailman id 1288668;
 Tue, 21 Apr 2026 08:57:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF6vQ-0002cA-F1
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:57:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF6vO-00B2P9-9t
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:57:43 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e73c01-e002-0a2a0a5209dd-0a2a4506aef8-18
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:57:43 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e73c07-7371-0a2a45060019-d1558034dc0b-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:57:43 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso30601015e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:57:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a52d232afsm26389555e9.31.2026.04.21.01.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 01:57:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1776761863; x=1777366663; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+u/FbagVHc72m+UMqUBLw85RuLKIDPGbZE2pQSYIoR4=;
        b=SPSELO0ABtEdYCSZRAK8nN+S+VUaoTl0uxlnr9x38DyPEvnApTkPDVNMoqrRHLe0MX
         ng8lpg6woYXhD5bv1WpMHTFRWUGd7uLrqdk2BDqkZpw/0LeTp7fY4JT1iXyxHHDlxKGN
         3ToCI8Mwgbj7uM4K4LahS7wqXYPf20U+3ucveCidOQEHrTF3Yjvhhc9KvXrlm2V1tDsd
         jHCROZs312ffnp1su+sqncpFolQmo6n+DK1F4XMR97nFHPkj7GNy+LqGRvjFV45wCyI+
         xcZxN9vpMpbmKrjDcc6btMllsO0WJ8HCKWSRlvAnUy8pNtCWTXWZkwcAzYbrw09J2Ers
         vIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776761863; x=1777366663;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+u/FbagVHc72m+UMqUBLw85RuLKIDPGbZE2pQSYIoR4=;
        b=StH+sU0taCSCBA+T5UV6rrqgpznABpxEZa7gQkqMD1ZEqFWlj+9nhP7vYZ7XWpo+IT
         15L27LIK/x7GXtowEKgYDhqZiJHxqx0z6S1ZU1DZD7OuRR0mQTGIs6p8tNEz6k+y/7DG
         +ZoCobfdGjINSH0Hp2JTUqQXHFeTK1Le9CHpOmDhihzF7CE4CztyrxVCl4oxwBI482vt
         LisZy6cTfSOMZBjFLMEWmstWBAT98QLC5Y6Y/CP7kRYUYDY6g27HDD7dU8O1ce/RN8Zv
         dX/4bC5TILC/T4DQE4Qs/pOjzp3H9UyIyMJAejwhHeNqEp3hZ6HlvzC+xafQInbYmhhp
         LEEA==
X-Forwarded-Encrypted: i=1; AFNElJ9vHvB558u60BO95R2SZAtCEp3oQwnzn0bjtJ7KcA8DE7zWOZ0p6X1KnOw+hA4UsqZpKv47gIrJ+8g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMqcML0LQLzarfha9RysEsD714c6oqe/DMF7W/8LkKaJ7iuZgf
	sfsgc5atHLKBZmgxro5OMfiW0WTcK+D4AaGjGpcK/1KFceuFS7vW/4zEIRXl0X7bkZYETNKZ/hl
	+pC5S0A==
X-Gm-Gg: AeBDietrjLgHlID7wEb0gEAJSMIvFi6wPNjL0SDcmY1ohT6dqS90p8g1Y8dg7w1617q
	hsvrTEMw9d8vZTqv/UV22cZFxEhSfiVnWEP4SgBzudKxTc7rZpDWf8TmTnSVdO/61QCxTS0HNxc
	PyM8MPHhBjz1Is2nN+/Jmpvl7SYQaaE1/p7uR4R3Swwe08ijsOgTCDWYThUltwHvN+5Ucg33AVn
	nwVC524x3lKf8rgyapx0ArrlcmGoZM+UsdiPh30Q0RJpQoAnxSTTR/fdhoTAc7e8zABmbiEhZf4
	jOUbg2ip0ernLtnP2oxNjsiEnUMgNk9T9Y1dWi0yJqoX+r9YjXJotPhCXZ5GUCGeuXuXJBnhXk7
	Y7T2eC3aa8gAMeBl82nkr1Lw5qYi1VNuVDGMHMfreA9V5GscIh/JNoO1H8xmKf8p+mjASW2aF3J
	/tEzyIb2vaeoKuXZdX+RpEO+YZS7HdJXxygHPlBAI7LFkk5X0M1VuXnvCAE3NISQbXVdpimoQb7
	4a0tzbbrcRM+AnnpFoX7fepQZTdxvlGZbib
X-Received: by 2002:a05:600c:350e:b0:488:a82f:bb95 with SMTP id 5b1f17b1804b1-488fb7861c0mr245641675e9.29.1776761863022;
        Tue, 21 Apr 2026 01:57:43 -0700 (PDT)
Message-ID: <6af89a34-3bf1-40cb-a4c5-e9a16ee31295@suse.com>
Date: Tue, 21 Apr 2026 10:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] xen/riscv: add kernel loading support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <29ec8e444792caa925ba92cdc406ef8c0b3bd678.1775836193.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <29ec8e444792caa925ba92cdc406ef8c0b3bd678.1775836193.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776761863-CE576D75-496E8A33/0/0
X-purgate-type: clean
X-purgate-size: 7507
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 69667438782
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 17:54, Oleksii Kurochko wrote:
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

I.e. this is entirely Linux-centric? If so, maybe the patch subject should
then reflect this?

> --- /dev/null
> +++ b/xen/arch/riscv/kernel.c
> @@ -0,0 +1,230 @@
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
> +    const struct membanks *banks = kernel_info_get_mem_const(info);
> +    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0,
> +                                       KERNEL_LOAD_ADDR_ALIGNMENT);
> +    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt),
> +                                    KERNEL_LOAD_ADDR_ALIGNMENT);
> +    const paddr_t modsize = initrd_len + dtb_len;
> +    int bi;

Please can variables used for array indexing be of unsigned types? The use ...

> +    BUG_ON(modsize < initrd_len);
> +
> +    /*
> +     * Place modules as high in RAM as possible, scanning banks from
> +     * last to first so that the end of the last bank is preferred.
> +     */
> +    for ( bi = banks->nr_banks - 1; bi >= 0; bi-- )

... here can easily be replaced:

    for ( bi = banks->nr_banks; bi-- > 0; )

Or you could have

    unsigned int bi = banks->nr_banks;
    ...
    while ( bi-- > 0 )

.

> +    {
> +        const struct membank *bank = &banks->bank[bi];
> +        const paddr_t bank_end = bank->start + bank->size;
> +        paddr_t modbase;
> +
> +        if ( modsize > bank->size )
> +            continue;
> +
> +        modbase = ROUNDDOWN(bank_end - modsize, KERNEL_LOAD_ADDR_ALIGNMENT);
> +
> +        if ( modbase < bank->start )
> +            continue;
> +
> +        /*
> +         * If the kernel resides in this bank, ensure modules do not
> +         * overlap with it.
> +         */
> +        if ( (kernbase >= bank->start) && (kernbase < bank_end) &&
> +             (modbase < ROUNDUP(kernend, KERNEL_LOAD_ADDR_ALIGNMENT)) &&
> +             (modbase + modsize > kernbase) )
> +            continue;

Can't this be had with only two comparisons? Same bank or not doesn't really
matter - if it's different banks, there'll be no overlap anyway. So all you
need here is that the module range doesn't overlap the kernel range, entirely
independent of the bank.

What is dependent on the bank is that the bank may fit both kernel and module
even if there is an overlap as per your current calculation: You may be able
to place the module below the kernel if it doesn't fit above.

> +static paddr_t __init kernel_image_place(struct kernel_info *info)
> +{
> +    paddr_t load_addr = INVALID_PADDR;
> +    uint64_t image_size = info->image.image_size ?: info->image.len;
> +    const struct membanks *banks = kernel_info_get_mem_const(info);
> +    unsigned int nr_banks = banks->nr_banks;
> +    unsigned int bi;
> +
> +    dprintk(XENLOG_DEBUG, "nr_banks(%u)\n", nr_banks);
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
> +     * If `start` is zero, the Image is position independent.
> +     */
> +    if ( likely(!info->image.start) )
> +    {
> +        for ( bi = 0; bi != nr_banks; bi++ )
> +        {
> +            const struct membank *bank = &banks->bank[bi];
> +            paddr_t bank_start = bank->start;
> +            /*
> +             * According to boot.rst kernel load address should be properly
> +             * aligned:
> +             *   https://docs.kernel.org/arch/riscv/boot.html#kernel-location
> +             *
> +             * As Image in this case is PIC we can ignore
> +             * info->image.text_offset.
> +             */
> +            paddr_t aligned_start = ROUNDUP(bank_start, KERNEL_LOAD_ADDR_ALIGNMENT);
> +            paddr_t bank_end = bank_start + bank->size;
> +            paddr_t bank_size;
> +
> +            if ( aligned_start > bank_end )
> +                continue;
> +
> +            bank_size = bank_end - aligned_start;
> +
> +            dprintk(XENLOG_DEBUG, "bank[%u].start=%"PRIpaddr"\n", bi, bank->start);
> +
> +            if ( image_size <= bank_size )
> +            {
> +                load_addr = aligned_start;
> +                break;
> +            }
> +        }
> +    }
> +    else
> +    {
> +        load_addr = info->image.start + info->image.text_offset;

Why does stuff ahead of text_offset not need loading?

> +        WARN_ON(!IS_ALIGNED(load_addr, KERNEL_LOAD_ADDR_ALIGNMENT));
> +
> +        for ( bi = 0; bi != nr_banks; bi++ )
> +        {
> +            const struct membank *bank = &banks->bank[bi];
> +            paddr_t bank_start = bank->start;
> +            paddr_t bank_end = bank_start + bank->size;
> +
> +            if ( (load_addr >= bank_start) && (load_addr < bank_end) &&
> +                 (bank_end - load_addr) >= image_size )

Do we have to fear overflow? (If so, shouldn't such an image be rejected
rather than an attempt being made to place it?) If not, simply:

            if ( (load_addr >= bank_start) && 
                 (load_addr + image_size <= bank_end) )

Also, does image_size really only cover space starting from .text_offset,
rather than from .start?

> +static void __init kernel_image_load(struct kernel_info *info)
> +{
> +    int rc;
> +    paddr_t load_addr = kernel_image_place(info);
> +    paddr_t paddr = info->image.kernel_addr;
> +    paddr_t len = info->image.len;
> +    paddr_t effective_size = info->image.image_size ?: len;
> +    void *kernel;
> +
> +    place_modules(info, load_addr, load_addr + effective_size);
> +
> +    printk("Loading Image from %"PRIpaddr" to %"PRIpaddr"-%"PRIpaddr"\n",
> +            paddr, load_addr, load_addr + effective_size);

As on earlier occasions: Please represent ranges as mathematical ones, to
disambiguate whether the bounds (the upper one in particular) are inclusive
or exclusive.

> +int __init kernel_image_probe(struct kernel_info *info, paddr_t addr,
> +                              paddr_t size)
> +{
> +#ifdef CONFIG_RISCV_64
> +    return kernel_image64_probe(info, addr, size);
> +#else
> +    return -EOPNOTSUPP;

Better #error, as you have it elsewhere (iirc)?

Jan

