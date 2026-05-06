Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N2OE7As+2mrXAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 13:57:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B74D9E89
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 13:57:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301651.1575888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKasT-00030C-DJ; Wed, 06 May 2026 11:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301651.1575888; Wed, 06 May 2026 11:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKasT-0002yD-Ag; Wed, 06 May 2026 11:57:21 +0000
Received: by outflank-mailman (input) for mailman id 1301651;
 Wed, 06 May 2026 11:57:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKasS-0002xr-8m
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:57:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKasQ-007C02-3x
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 13:57:19 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb2c9e-bab6-0a2a0a5309dd-0a2a4506ec58-6
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 13:57:19 +0200
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb2c9f-7371-0a2a45060019-d155d030dc23-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 13:57:19 +0200
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6729c6f0ca7so8131361a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 04:57:19 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-67cd90ef9c7sm1254599a12.10.2026.05.06.04.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 04:57:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778068639; x=1778673439; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jnQDEry0YTTv7htKQvsZB92JFfvTlJSoY4EpqSjXKeU=;
        b=J8MpID2nHbOpx2eNFL9t5F6m2AQvVstZQ3E93A7up/mPUtaZhB9F0cNIw1FZRfL7qp
         YS5s7qAkdfnswZtzMvi60Re/Io4NtoT2PpdCK4cJNnT5x/Vvptex5PK7xQ0rU7cUqs3p
         a0awDo/rBWy2soJqX0KLqYF+Qq0OUoCVrlYgyf6gYC8J6sCv7sf2toeHpvqWfAI1Hw0L
         kP53xhp6YfJTV61awylVFhiSE1dTTDCFtTxna7I5lxNZ9z62oGR8r9Kgjbq6U5OwFJgb
         6gYwCQzndkrZNpOal35tHhcK/PCC4OxPsUCFRSebhKIFQ7L78K66RwiK9XWzo0MJWFZZ
         sHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778068639; x=1778673439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnQDEry0YTTv7htKQvsZB92JFfvTlJSoY4EpqSjXKeU=;
        b=KYEAzj+E8aDqomQGFy/HoNdqRHUOYPsM1MiofCVzmjClGer1alebaw1AzlaVcQvb5K
         elI59A2bRuXp2a0XQErbpz+z3ftGWiNGJYF0d13jh7r+PwL6niLrWVnm3XLN2j+nX0AJ
         bSN7ngUiYqXtA9D2ZKzJTWIFy7JbTfKCHKRmvxdCwEQlyWfu06bNChNy76WgytrfxtYA
         +4DBxdRwMrF03baEMQKmM0YkpD2ircgtGQXAfu8/TGUeYLgAl5MCBGsmG0Avik7/QRHx
         C5YDo8mTUy4wvLcNvRaYvnf5eTY/S79abVmxhW0hu4CSuCAJcz86pB9TsRZ9lD6wP+QV
         nrnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Jthzos9K9lVzQNpf644AW+hI6fSIpUszz8EuESiVmT/r9BiwlpXsLfRhoN8CLEugIs8XJvzyusd0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBCkPEbLc1i9Y/Yeg4TMCVs4LMp+XNg5ZIOSPCzfsvSthjg3c2
	cY4A+AcU1KQLhLbyPc1qLM0GagQbwCfp/FtaxoR2f9sPZy0mrUtiPX+2
X-Gm-Gg: AeBDiesbuQ9yeKcxH2oNwM1fiSS68WmVL9uPckaKYN+eFKQ5Qo8g73MBZRllF6Ol0Tt
	Zb0+AErQkJMJwUVvSZZmSQaYYtSm8gD8T+quhOLRnznjgMT+YqzPWMT+tQtnGGc2On8UVdxA1Pd
	/OJfCYimKVzXT4G4yRsTvcOfmo0bvV2haVLNGvqZ+0zYm6fNR4CJLA3s645wRVNeptRj+5eXkCA
	75wh7sb1XCR9PoLxvAyMcutSxHHPlMNYuZKTHH7/V5pn4ZUaut257Zh/Fs5y+Gx8BkigkX5t05/
	RyFrmjpAn20E1Fz2ptYPFa5ONWO8FgtWcwcAj8adjBYtEqME2ULEtw1q+5o5QguwT/0Ek3qtcwg
	tEQM3ploDgQq1fNIS1vV4namS7gkCsrlwceVvL2m3xdGNTor0hRTyA/ZvqHCkU9RVROVPOwDBVc
	Ib6Ix5m5/9eE4AWyMJGwgfr8Q/cgpnMLvii0ujjYnELhpb90zoawi6JgwXBTmHsCOwVgzojofAt
	SNlMpTqI9qC2g==
X-Received: by 2002:a05:6402:3057:b0:67b:7a8f:3e2c with SMTP id 4fb4d7f45d1cf-67d6489e199mr1100200a12.25.1778068638857;
        Wed, 06 May 2026 04:57:18 -0700 (PDT)
Message-ID: <fa07cdad-81f9-408f-a04d-d9c3b8e1bef1@gmail.com>
Date: Wed, 6 May 2026 13:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] xen/riscv: add Linux kernel loading support
To: Jan Beulich <jbeulich@suse.com>
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
 <f61ddc8f-88a6-4f61-a470-c9c82b8b9b52@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f61ddc8f-88a6-4f61-a470-c9c82b8b9b52@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1778068639-8DD80D75-02E051E7/10/73395122804
X-purgate-type: spam
X-purgate-size: 9556
X-Rspamd-Queue-Id: B21B74D9E89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]



On 5/4/26 4:05 PM, Jan Beulich wrote:
> On 28.04.2026 16:33, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/kernel.c
>> @@ -0,0 +1,242 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/bug.h>
>> +#include <xen/compiler.h>
>> +#include <xen/errno.h>
>> +#include <xen/fdt-kernel.h>
>> +#include <xen/guest_access.h>
>> +#include <xen/init.h>
>> +#include <xen/libfdt/libfdt.h>
>> +#include <xen/mm.h>
>> +#include <xen/types.h>
>> +#include <xen/vmap.h>
>> +
>> +#include <asm/setup.h>
>> +
>> +#define IMAGE64_MAGIC_V2 0x05435352 /* Magic number 2, le, "RSC\x05" */
>> +
>> +static void __init place_modules(struct kernel_info *info, paddr_t kernbase,
>> +                                 paddr_t kernend)
>> +{
>> +    const struct boot_module *mod = info->bd.initrd;
>> +    const struct membanks *banks = kernel_info_get_mem_const(info);
>> +    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0,
>> +                                       KERNEL_LOAD_ADDR_ALIGNMENT);
>> +    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt),
>> +                                    KERNEL_LOAD_ADDR_ALIGNMENT);
> 

> Why would modules need to be this strongly aligned?
No specific reason except to be aligned with similar alignment below, it 
could be lesser (PAGE_SIZE or even just unsigned long aligned) or even 
dropped, I think. It was just easier then to calculate aligned 
addresses. But I don't see any big issue to have such alignments except 
maybe that it will waste some memory.

> 
>> +    const paddr_t modsize = initrd_len + dtb_len;
>> +    unsigned int bi = banks->nr_banks;
>> +
>> +    BUG_ON(modsize < initrd_len);
> 
> Where's the earlier check that allows this to be BUG_ON()?

There isn't one. I will replace that with:

if ( modsize < initrd_len )
     panic("Module size overflow: initrd + dtb size wraps paddr_t\n");


> 
>> +    /*
>> +     * Place modules as high in RAM as possible, scanning banks from
>> +     * last to first so that the end of the last bank is preferred.
>> +     */
>> +    while ( bi-- > 0 )
>> +    {
>> +        const struct membank *bank = &banks->bank[bi];
>> +        const paddr_t bank_end = bank->start + bank->size;
>> +        paddr_t modbase;
>> +
>> +        if ( modsize > bank->size )
>> +            continue;
>> +
>> +        modbase = ROUNDDOWN(bank_end - modsize, KERNEL_LOAD_ADDR_ALIGNMENT);
> 
> Same question here.

I used KERNEL_LOAD_ADDR_ALIGNMENT to be sure that big page tables be 
potentially used in page table.

> 
>> +        if ( modbase < bank->start )
>> +            continue;
>> +
>> +        /*
>> +         * If modules would overlap the kernel, try placing them below it.
>> +         */
> 
> With how kernel_image_place() works, and with the heavy alignment applied
> above, is this even possible to succeed? Oh, wait, yes - for the not-
> position-independent case.

I don't understand what is wrong with putting initrd and dtb to 
basically any place except where kernel is expected to be placed (as in 
case of position dependent case I assume it is pretty crucial).

> 
>> +        if ( (modbase < ROUNDUP(kernend, KERNEL_LOAD_ADDR_ALIGNMENT)) &&
>> +             (modbase + modsize > kernbase) )
>> +        {
>> +            modbase = ROUNDDOWN(kernbase - modsize, KERNEL_LOAD_ADDR_ALIGNMENT);
> 
> What prevents this subtraction from underflowing?

I will put the following check at the start of the place_modules() function:
if ( kernbase < modsize )
    panic("Underflow could happen between kernbase and modsize\n");


> 
>> +static paddr_t __init kernel_image_place(struct kernel_info *info)
>> +{
>> +    paddr_t load_addr = INVALID_PADDR;
>> +    uint64_t image_size = info->image.image_size ?: info->image.len;
>> +    const struct membanks *banks = kernel_info_get_mem_const(info);
>> +    unsigned int nr_banks = banks->nr_banks;
>> +    unsigned int bi;
>> +
>> +    dprintk(XENLOG_DEBUG, "nr_banks(%u)\n", nr_banks);
> 
> Did you mean to drop this before submitting?

Sure, it should be dropped.

> 
>> +    /*
>> +     * At the moment, RISC-V's Linux kernel should be always position
>> +     * independent based on "Per-MMU execution" of boot.rst:
>> +     *   https://docs.kernel.org/arch/riscv/boot.html#pre-mmu-execution
>> +     *
>> +     * But just for the case when RISC-V's Linux kernel isn't position
>> +     * independent it is needed to take load address from
>> +     * info->image.start.
>> +     *
>> +     * If `start` is zero, the Image is position independent.
>> +     */
>> +    if ( likely(!info->image.start) )
>> +    {
>> +        for ( bi = 0; bi != nr_banks; bi++ )
>> +        {
>> +            const struct membank *bank = &banks->bank[bi];
>> +            paddr_t bank_start = bank->start;
>> +            /*
>> +             * According to boot.rst kernel load address should be properly
>> +             * aligned:
>> +             *   https://docs.kernel.org/arch/riscv/boot.html#kernel-location
>> +             *
>> +             * As Image in this case is PIC we can ignore
>> +             * info->image.text_offset.
>> +             */
>> +            paddr_t aligned_start = ROUNDUP(bank_start, KERNEL_LOAD_ADDR_ALIGNMENT);
>> +            paddr_t bank_end = bank_start + bank->size;
>> +            paddr_t bank_size;
>> +
>> +            if ( aligned_start > bank_end )
>> +                continue;
>> +
>> +            bank_size = bank_end - aligned_start;
>> +
>> +            dprintk(XENLOG_DEBUG, "bank[%u].start=%"PRIpaddr"\n", bi, bank->start);
> 
> And this one? (I also find it puzzling that ->start would be of (primary) interest
> here, when ...
> 
>> +            if ( image_size <= bank_size )
> 
> ... bank_size is what's relevant.

This one should be dropped too.

> 
>> +/* Check if the image is a 64-bit Image */
>> +static int __init kernel_image64_probe(struct kernel_info *info,
>> +                                       paddr_t addr, paddr_t size)
>> +{
>> +    /* https://www.kernel.org/doc/Documentation/riscv/boot-image-header.rst */
>> +    struct {
>> +        uint32_t code0;         /* Executable code */
>> +        uint32_t code1;         /* Executable code */
>> +        uint64_t text_offset;   /* Image load offset, little endian */
>> +        uint64_t image_size;    /* Effective Image size, little endian */
>> +        uint64_t flags;         /* kernel flags, little endian */
>> +        uint32_t version;       /* Version of this header */
>> +        uint32_t res1;          /* Reserved */
>> +        uint64_t res2;          /* Reserved */
>> +        uint64_t magic;         /* Deprecated: Magic number, little endian, "RISCV" */
>> +        uint32_t magic2;        /* Magic number 2, little endian, "RSC\x05" */
>> +        uint32_t res3;          /* Reserved for PE COFF offset */
>> +    } image;
>> +    uint64_t effective_size;
>> +
>> +    if ( size < sizeof(image) )
>> +        return -EINVAL;
>> +
>> +    copy_from_paddr(&image, addr, sizeof(image));
>> +
>> +    /* Magic v1 is deprecated and may be removed.  Only use v2 */
>> +    if ( le32_to_cpu(image.magic2) != IMAGE64_MAGIC_V2 )
>> +        return -EINVAL;
>> +
>> +    effective_size = le64_to_cpu(image.image_size);
>> +
>> +    if ( effective_size && size > effective_size )
>> +        return -EINVAL;
> 
> Is the rhs of the && the wrong way round? If effective_size > size,
> aren't you in trouble? Question of course is what "effective" really
> means. Yet in any event it seems dubious to me that effective_size <
> size would really be a problem. IOW this will want commenting upon
> if the check is to stay.
> 
> Actually ...
> 
>> +    info->image.kernel_addr = addr;
>> +    /* Actual size in the binary file */
>> +    info->image.len = size;
>> +    /* Total memory the kernel occupies at runtime */
>> +    info->image.image_size = effective_size;
> 
> ... this looks to suggest something .bss-like.

Yes, effective_size it is size which included .bss.

size it of LK after decompression of Image.gz and it doesn't include 
.bss so it should be lesser then effective_size.

I don't think that I am in trouble that effective_size is bigger then 
size if we allocate enough space in memory effective_size is fine to be 
bigger.

It is a good question if effective_size < size is a problem. I think it
isn't but could it be really happen?
I think that I am okay to drop that part of if().

> 
>> --- a/xen/include/xen/fdt-kernel.h
>> +++ b/xen/include/xen/fdt-kernel.h
>> @@ -59,8 +59,15 @@ struct kernel_info {
>>           struct {
>>               paddr_t kernel_addr;
>>               paddr_t len;
>> -#if defined(CONFIG_ARM_64) || defined(CONFIG_RISCV_64)
>> -            paddr_t text_offset; /* 64-bit Image only */
>> +#if defined(CONFIG_ARM_64) || defined(CONFIG_RISCV)
>> +            /*
>> +             * ARM: 64-bit Image only.
>> +             * RISC-V: both 32-bit and 64-bit Images.
>> +             */
>> +            paddr_t text_offset;
>> +#endif
>> +#if defined(CONFIG_RISCV)
>> +            uint64_t image_size; /* Effective size of Image */
> 
> As this (apparently) is for both RV64 and RV32 - can the latter really have
> wider than 32-bit image sizes? If not - use size_t or unsigned long here?

Agree, unsigned long should be enough.

Thanks.

~ Oleksii



