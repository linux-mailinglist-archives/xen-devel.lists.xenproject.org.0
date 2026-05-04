Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBesN9On+Gl+xgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:06:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB604BE83A
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:06:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299955.1574514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJtvY-0000PK-Af; Mon, 04 May 2026 14:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299955.1574514; Mon, 04 May 2026 14:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJtvY-0000Nt-7w; Mon, 04 May 2026 14:05:40 +0000
Received: by outflank-mailman (input) for mailman id 1299955;
 Mon, 04 May 2026 14:05:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJtvW-0000Nl-Du
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:05:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJtvV-00D8JZ-B1
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 16:05:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8a7a1-bab6-0a2a0a5309dd-0a2a4508c4a0-38
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:05:37 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8a7b1-63b5-0a2a45080019-d155802ee452-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:05:37 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-488ad135063so37708655e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:05:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a981defb3sm35237598f8f.20.2026.05.04.07.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 07:05:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1777903537; x=1778508337; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c4m3MIC0nMI1OHNqDpdo5HlaLrVVNbzjQ00s9cmcKZk=;
        b=YiJWndg3cjoj1Pg/Ikvjc6geoSQSr3kQVwxBxluPxrkY7L6G1+M5LxiEgyxTNE/4ZR
         jp79FbKuyLzZchtqQp9M5YsF6T8EcXUaTEa7lE+Gb7GheQsE/r61TQDAOhHRnh6z+tu/
         CvhcJa5Ype1MNd+XCCC6l6uTR22/7BvembZhHt6fhILi/eLJ6gkJKBMGvi+MnaSQqXRr
         hssnRzKN32wVdVNE4h5zHMxeWd6XcJoqHdCjLf+JYYWb11lZEH3asSMyKmAhkgDuNnf5
         hSNed893XaCd6NcFTs0sGWtefzrO3fmlGCIpFS8e0SGNI+V6N1fN7osRlx2Nw9v14WHC
         OvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777903537; x=1778508337;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4m3MIC0nMI1OHNqDpdo5HlaLrVVNbzjQ00s9cmcKZk=;
        b=oUQ3NUQCFbzhI8P51wDBORXITfg/hl5hcjx+1YQo1bXxQHIP5n8wMSEA8ibxVT1JKv
         Nn3AzjycUrkDSWNzdGNGHPaKc/9B9h0HdnDM48nCGiuPF7qWdVKc40mEWXYKLwxbI9Z/
         tV+0R4IWUzlrY5wjOVrj303AIdG2NIDDNjUzClOqgpvsvlggJPAejsC5ySV8AX0rH9Kn
         ebvhs6tu9ex3cHV/m8rrrIkQiby0BEb6Eg5qDxrm7efeBPLVuzwGmK8u22VLD1HDHZP9
         KHbi//bVAbl7RLFkoCHPRw0/ZJZsPJK7101u9gScjKCyGQsyZmBmfw0IkyJHQRyx4RfP
         4hWw==
X-Forwarded-Encrypted: i=1; AFNElJ9WOT3ObpjnyX5vHQ1XrOTH+zfR6+OM6cuBgljboTEyZZKxPMblm5vx3J+/cGgkmJK5Oeg9T1IAipo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysNRkEKyl4N2a+aEQynFJayTfbk9+G3r70RgqUtQpMpVrmfCx1
	5TK4/ilAxEh5oSoWVtA4szETNpbKiLbLJ2Og+gKjLA359SIo8hSX5JiOR7jiGvBfpg==
X-Gm-Gg: AeBDietw4DDLUDuw7HYZb5114LWOLZtgcuFygqPWWjJSTg5hz4OuFzhjeCdjhw4fcpt
	8fwAZuiIk7jqdLkTP9Qu6vLiC5A47A7ZiRZ2horMUnRWKAZUaeBXaEYElI5Fx5UVSYNFanGdlmg
	7U3MTwTb/kkjIoLI/1RXwA+pZTOorKBBtOL20VaKuo3EUWlOaSOI7zOKWaw9XI7ZxzKEldEL//G
	hyW5i9MdlBPqaKGGuvgs8d5h73FgcKxCg30dvsytGou4EfnEHD87AWabmfp8ni4v6WpEGOwdKlZ
	tFeaqL/iyoPf0rUfJLCr7U2UV3yZS7ssDrSg1JkvdoEiXwuF4c/Yw/6QxlEQqs/9WOvfMLlVbea
	lKns6uRbpyt/HZZIYr4eyR19pOaJA9oH9TlwEfOVAwETkkxcXAS69BfUCzEjjOnyqBJEbBfw7NZ
	bx8ARPI6qEcM//iQO8BQ5eN2+qrYi9VBwpLmjV6rKo2ovkreKyvTufqfLN22ixeUCR4BlOZpa6A
	tRqLlX4HkQKcU6yv1ANW1loxw==
X-Received: by 2002:a05:600c:628c:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48a988be16emr171857205e9.21.1777903536543;
        Mon, 04 May 2026 07:05:36 -0700 (PDT)
Message-ID: <f61ddc8f-88a6-4f61-a470-c9c82b8b9b52@suse.com>
Date: Mon, 4 May 2026 16:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] xen/riscv: add Linux kernel loading support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <af89f0b696c5a1ae477dc0903a9a99b84df26f7a.1777303844.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <af89f0b696c5a1ae477dc0903a9a99b84df26f7a.1777303844.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1777903537-C2975DB1-C3FDBB87/0/0
X-purgate-type: clean
X-purgate-size: 7653
X-Rspamd-Queue-Id: 3CB604BE83A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
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

On 28.04.2026 16:33, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/kernel.c
> @@ -0,0 +1,242 @@
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

Why would modules need to be this strongly aligned?

> +    const paddr_t modsize = initrd_len + dtb_len;
> +    unsigned int bi = banks->nr_banks;
> +
> +    BUG_ON(modsize < initrd_len);

Where's the earlier check that allows this to be BUG_ON()?

> +    /*
> +     * Place modules as high in RAM as possible, scanning banks from
> +     * last to first so that the end of the last bank is preferred.
> +     */
> +    while ( bi-- > 0 )
> +    {
> +        const struct membank *bank = &banks->bank[bi];
> +        const paddr_t bank_end = bank->start + bank->size;
> +        paddr_t modbase;
> +
> +        if ( modsize > bank->size )
> +            continue;
> +
> +        modbase = ROUNDDOWN(bank_end - modsize, KERNEL_LOAD_ADDR_ALIGNMENT);

Same question here.

> +        if ( modbase < bank->start )
> +            continue;
> +
> +        /*
> +         * If modules would overlap the kernel, try placing them below it.
> +         */

With how kernel_image_place() works, and with the heavy alignment applied
above, is this even possible to succeed? Oh, wait, yes - for the not-
position-independent case.

> +        if ( (modbase < ROUNDUP(kernend, KERNEL_LOAD_ADDR_ALIGNMENT)) &&
> +             (modbase + modsize > kernbase) )
> +        {
> +            modbase = ROUNDDOWN(kernbase - modsize, KERNEL_LOAD_ADDR_ALIGNMENT);

What prevents this subtraction from underflowing?

> +static paddr_t __init kernel_image_place(struct kernel_info *info)
> +{
> +    paddr_t load_addr = INVALID_PADDR;
> +    uint64_t image_size = info->image.image_size ?: info->image.len;
> +    const struct membanks *banks = kernel_info_get_mem_const(info);
> +    unsigned int nr_banks = banks->nr_banks;
> +    unsigned int bi;
> +
> +    dprintk(XENLOG_DEBUG, "nr_banks(%u)\n", nr_banks);

Did you mean to drop this before submitting?

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

And this one? (I also find it puzzling that ->start would be of (primary) interest
here, when ...

> +            if ( image_size <= bank_size )

... bank_size is what's relevant.

> +/* Check if the image is a 64-bit Image */
> +static int __init kernel_image64_probe(struct kernel_info *info,
> +                                       paddr_t addr, paddr_t size)
> +{
> +    /* https://www.kernel.org/doc/Documentation/riscv/boot-image-header.rst */
> +    struct {
> +        uint32_t code0;         /* Executable code */
> +        uint32_t code1;         /* Executable code */
> +        uint64_t text_offset;   /* Image load offset, little endian */
> +        uint64_t image_size;    /* Effective Image size, little endian */
> +        uint64_t flags;         /* kernel flags, little endian */
> +        uint32_t version;       /* Version of this header */
> +        uint32_t res1;          /* Reserved */
> +        uint64_t res2;          /* Reserved */
> +        uint64_t magic;         /* Deprecated: Magic number, little endian, "RISCV" */
> +        uint32_t magic2;        /* Magic number 2, little endian, "RSC\x05" */
> +        uint32_t res3;          /* Reserved for PE COFF offset */
> +    } image;
> +    uint64_t effective_size;
> +
> +    if ( size < sizeof(image) )
> +        return -EINVAL;
> +
> +    copy_from_paddr(&image, addr, sizeof(image));
> +
> +    /* Magic v1 is deprecated and may be removed.  Only use v2 */
> +    if ( le32_to_cpu(image.magic2) != IMAGE64_MAGIC_V2 )
> +        return -EINVAL;
> +
> +    effective_size = le64_to_cpu(image.image_size);
> +
> +    if ( effective_size && size > effective_size )
> +        return -EINVAL;

Is the rhs of the && the wrong way round? If effective_size > size,
aren't you in trouble? Question of course is what "effective" really
means. Yet in any event it seems dubious to me that effective_size <
size would really be a problem. IOW this will want commenting upon
if the check is to stay.

Actually ...

> +    info->image.kernel_addr = addr;
> +    /* Actual size in the binary file */
> +    info->image.len = size;
> +    /* Total memory the kernel occupies at runtime */
> +    info->image.image_size = effective_size;

... this looks to suggest something .bss-like.

> --- a/xen/include/xen/fdt-kernel.h
> +++ b/xen/include/xen/fdt-kernel.h
> @@ -59,8 +59,15 @@ struct kernel_info {
>          struct {
>              paddr_t kernel_addr;
>              paddr_t len;
> -#if defined(CONFIG_ARM_64) || defined(CONFIG_RISCV_64)
> -            paddr_t text_offset; /* 64-bit Image only */
> +#if defined(CONFIG_ARM_64) || defined(CONFIG_RISCV)
> +            /*
> +             * ARM: 64-bit Image only.
> +             * RISC-V: both 32-bit and 64-bit Images.
> +             */
> +            paddr_t text_offset;
> +#endif
> +#if defined(CONFIG_RISCV)
> +            uint64_t image_size; /* Effective size of Image */

As this (apparently) is for both RV64 and RV32 - can the latter really have
wider than 32-bit image sizes? If not - use size_t or unsigned long here?

Jan

