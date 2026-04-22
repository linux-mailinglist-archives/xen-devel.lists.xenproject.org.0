Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI1GAeG06GmIOwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:45:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA34458FB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:45:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290377.1569982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFW1E-0001sj-M1; Wed, 22 Apr 2026 11:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290377.1569982; Wed, 22 Apr 2026 11:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFW1E-0001qh-J9; Wed, 22 Apr 2026 11:45:24 +0000
Received: by outflank-mailman (input) for mailman id 1290377;
 Wed, 22 Apr 2026 11:45:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFW1D-0001qa-8S
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:45:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFW1C-0072Du-L9
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:45:22 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e8b4c8-e002-0a2a0a5209dd-0a2a45018634-36
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:45:22 +0200
Received: from [209.85.167.50] (helo=mail-lf1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e8b4d2-c1f2-0a2a45010019-d155a732e9b8-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:45:22 +0200
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5a62f43b76aso490940e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 04:45:22 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185ad2f4sm4422725e87.17.2026.04.22.04.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 04:45:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776858322; x=1777463122; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mxc3bw+Q/4PVWhagym0pXVDPmcGoQqi1agjC6d3LSL0=;
        b=q4AYJopdVIs4Q0Z0Yt0nw9aSAUym96O6EbmHOnU2lyP4voA8TdJr77d4FFT6AXNw8w
         K15dHF4aDnz3Sqe1tMqcqluTxNYtbnVpyMLSTp5RIwpQbNQJe9wrt0h3kP4NxLjv0m1H
         eSVZTQwWHIH9eVr93EtgdyI4QU/f0H+y6/OBRYJRV+b5Osrzow+O2W9eJtaoGoNA8n4I
         BSr1nBgzJJJeTlm9znaJbxJuOocuAV/2Oih0CX8W77rvsI2w+/3SVyXTyCpCMr6PFcVb
         nvsOY1X3oncYrS3m1R2q/Zpu5VF6IHDaUTYRz9cJSr/LtNJHWyAG/RwixDO+Rk2BEHwB
         5/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776858322; x=1777463122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mxc3bw+Q/4PVWhagym0pXVDPmcGoQqi1agjC6d3LSL0=;
        b=De2UaVNhzY8ZU1Om3z83wdK59QWRG5QNlbo3R1Z9YSV9NVN/xg2nP3Xkp6iJxCI3go
         OK3Z4tqhqbZCjiaYrxBZxEU3A0dRCjHjA3Zms2Yy9+TKASzPkoa3wpJEEPjTY0dYu8CZ
         CKN2ifjgeGgszxcAenNIzeSyD19AS7dKOYRGQDX3GzRw0z6GdJBaHFXbWyY2C5TFGque
         BqcjXRd9qocY8LWdIxhbj46UQSOFxzXVgHYauzAcCdnBdYcC2lLCKY3ZIb+U1ddarVP4
         uuEvfMmbYT2er1CoW4FdR3V9KPWhzLNJJSUMhHbINt0ZdcZDJmmjzRd+yz/J1IKRBqQo
         MgEw==
X-Forwarded-Encrypted: i=1; AFNElJ+G/yQ8H6gY5jMl/s7L4gLvzkCLT+ehsqYRyQltM6DS2KoLFPYDWFOkIkzXrUytG2ZoMFtt6tEBARY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywk/jBgh8lO5VxwirA0ZtEDAR8y3FwUnNtnTzFN9mxb1TZmwjNt
	IbfLGRAjeWm6nr74GTWo1+QpcHzqNaGmr7+M2i3b/XRs0xmoSY+2D3Sp
X-Gm-Gg: AeBDieuEwNwJz1yA96NgXIKzNofRLB1kAUa3GvvTQ8/E8GIHlv3m7I6/cYBlcTeibn+
	esSm8McplVLZFkEii1nhbfOQGXEWHeOmk9jyqwl6RYOnmy0vngBXj9AkXq2C6qFJOdCxd8E26bR
	8jt2j/+TKi8FzfAqwFi+NePbrP9ShqzcyRyYE06ylCGItb1/mRuckGqZ5f9ChICvddRytGx1eez
	2zPVO4Rbu8K6+4xfOCuVNUQXNp8w/2HO0ZPWR/ON9SUr2SUm4dDBmWzgGRzMAI+H7xYGt968YXq
	Ib6In75ciHsss/Trjfav1s4oFtovcZES6XDanq6IC8wBEJlmjqCSswCJJjYcilqYLZZuS7HBM9O
	XcHgFcMlA5pc9pcUnCZgMBu4DO2TwhLClXCx2J82Z+GkWQmiy85KBX5212cKR9978b4n8SPUmjG
	hb15ZZ7d2Cx7xYjOStf12ov25PceW4KP/6UdldRIQDarOsArPvEYIRL6fOgg4BKYXvZ89ua4Cji
	r/pbVOGrBjxOg==
X-Received: by 2002:a05:6512:3b8e:b0:5a4:1133:c30c with SMTP id 2adb3069b0e04-5a4172de2e7mr6599018e87.28.1776858321253;
        Wed, 22 Apr 2026 04:45:21 -0700 (PDT)
Message-ID: <b6c4a111-6c37-4850-962a-5b401a4a5655@gmail.com>
Date: Wed, 22 Apr 2026 13:45:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] xen/riscv: add kernel loading support
To: Jan Beulich <jbeulich@suse.com>
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
 <6af89a34-3bf1-40cb-a4c5-e9a16ee31295@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6af89a34-3bf1-40cb-a4c5-e9a16ee31295@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776858322-BFC74FF4-D7DA5EAD/10/73395122804
X-purgate-type: spam
X-purgate-size: 9793
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
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 60CA34458FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/21/26 10:57 AM, Jan Beulich wrote:
> On 10.04.2026 17:54, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/config.h
>> +++ b/xen/arch/riscv/include/asm/config.h
>> @@ -151,6 +151,19 @@
>>   extern unsigned long phys_offset; /* = load_start - XEN_VIRT_START */
>>   #endif
>>   
>> +/*
>> + * KERNEL_LOAD_ADDR_ALIGNMENT is defined based on paragraph of
>> + * "Kernel location" of boot.rst:
>> + * https://docs.kernel.org/arch/riscv/boot.html#kernel-location
> 
> I.e. this is entirely Linux-centric? If so, maybe the patch subject should
> then reflect this?

At least. for now - yes. I will add Linux kernel to the patch subject.

> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/kernel.c
>> @@ -0,0 +1,230 @@
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
>> +    const paddr_t modsize = initrd_len + dtb_len;
>> +    int bi;
> 
> Please can variables used for array indexing be of unsigned types? The use ...
> 
>> +    BUG_ON(modsize < initrd_len);
>> +
>> +    /*
>> +     * Place modules as high in RAM as possible, scanning banks from
>> +     * last to first so that the end of the last bank is preferred.
>> +     */
>> +    for ( bi = banks->nr_banks - 1; bi >= 0; bi-- )
> 
> ... here can easily be replaced:
> 
>      for ( bi = banks->nr_banks; bi-- > 0; )
> 
> Or you could have
> 
>      unsigned int bi = banks->nr_banks;
>      ...
>      while ( bi-- > 0 )
> 
> .

I will use while() form.

> 
>> +    {
>> +        const struct membank *bank = &banks->bank[bi];
>> +        const paddr_t bank_end = bank->start + bank->size;
>> +        paddr_t modbase;
>> +
>> +        if ( modsize > bank->size )
>> +            continue;
>> +
>> +        modbase = ROUNDDOWN(bank_end - modsize, KERNEL_LOAD_ADDR_ALIGNMENT);
>> +
>> +        if ( modbase < bank->start )
>> +            continue;
>> +
>> +        /*
>> +         * If the kernel resides in this bank, ensure modules do not
>> +         * overlap with it.
>> +         */
>> +        if ( (kernbase >= bank->start) && (kernbase < bank_end) &&
>> +             (modbase < ROUNDUP(kernend, KERNEL_LOAD_ADDR_ALIGNMENT)) &&
>> +             (modbase + modsize > kernbase) )
>> +            continue;
> 
> Can't this be had with only two comparisons? Same bank or not doesn't really
> matter - if it's different banks, there'll be no overlap anyway. So all you
> need here is that the module range doesn't overlap the kernel range, entirely
> independent of the bank.
> 
> What is dependent on the bank is that the bank may fit both kernel and module
> even if there is an overlap as per your current calculation: You may be able
> to place the module below the kernel if it doesn't fit above.

I will drop the first check and update the comment:
         /*
          * If modules would overlap the kernel, try placing them below it.
          */
         if ( (modbase < ROUNDUP(kernend, KERNEL_LOAD_ADDR_ALIGNMENT)) &&
              (modbase + modsize > kernbase) )
         {
             modbase = ROUNDDOWN(kernbase - modsize, 
KERNEL_LOAD_ADDR_ALIGNMENT);
             if ( modbase < bank->start )
                 continue;
         }

>> +static paddr_t __init kernel_image_place(struct kernel_info *info)
>> +{
>> +    paddr_t load_addr = INVALID_PADDR;
>> +    uint64_t image_size = info->image.image_size ?: info->image.len;
>> +    const struct membanks *banks = kernel_info_get_mem_const(info);
>> +    unsigned int nr_banks = banks->nr_banks;
>> +    unsigned int bi;
>> +
>> +    dprintk(XENLOG_DEBUG, "nr_banks(%u)\n", nr_banks);
>> +
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
>> +
>> +            if ( image_size <= bank_size )
>> +            {
>> +                load_addr = aligned_start;
>> +                break;
>> +            }
>> +        }
>> +    }
>> +    else
>> +    {
>> +        load_addr = info->image.start + info->image.text_offset;
> 
> Why does stuff ahead of text_offset not need loading?

Here we just calculating only a place where kernel will be loaded. The 
full kernel image will be loaded in kernel_image_load().

> 
>> +        WARN_ON(!IS_ALIGNED(load_addr, KERNEL_LOAD_ADDR_ALIGNMENT));
>> +
>> +        for ( bi = 0; bi != nr_banks; bi++ )
>> +        {
>> +            const struct membank *bank = &banks->bank[bi];
>> +            paddr_t bank_start = bank->start;
>> +            paddr_t bank_end = bank_start + bank->size;
>> +
>> +            if ( (load_addr >= bank_start) && (load_addr < bank_end) &&
>> +                 (bank_end - load_addr) >= image_size )
> 
> Do we have to fear overflow? (If so, shouldn't such an image be rejected
> rather than an attempt being made to place it?) If not, simply:

Just for a case. As a user may control load_addr and image_size it could 
be some combination which will lead to overflow here.

> 
>              if ( (load_addr >= bank_start) &&
>                   (load_addr + image_size <= bank_end) )

I will add the following:
         /*
          * Reject a malformed image before the loop to avoid wrapping
          * load_addr + image_size in the per-bank check below.
          *
          * image_size covers the kernel from _start (placed at load_addr =
          * start + text_offset) through _end.  The alignment gap
          * [start, load_addr) is padding and need not lie within a bank.
          */
         if ( image_size > (paddr_t)-1 - load_addr )
             bi = nr_banks;
         else
             for ( bi = 0; bi != nr_banks; bi++ )
             {
                 const struct membank *bank = &banks->bank[bi];
                 paddr_t bank_start = bank->start;
                 paddr_t bank_end = bank_start + bank->size;

                 if ( (load_addr >= bank_start) &&
                      (load_addr + image_size <= bank_end) )
                     break;
             }

> 
> Also, does image_size really only cover space starting from .text_offset,
> rather than from .start?

image_size covers total memory the kernel occupies at runtime.

> 
>> +static void __init kernel_image_load(struct kernel_info *info)
>> +{
>> +    int rc;
>> +    paddr_t load_addr = kernel_image_place(info);
>> +    paddr_t paddr = info->image.kernel_addr;
>> +    paddr_t len = info->image.len;
>> +    paddr_t effective_size = info->image.image_size ?: len;
>> +    void *kernel;
>> +
>> +    place_modules(info, load_addr, load_addr + effective_size);
>> +
>> +    printk("Loading Image from %"PRIpaddr" to %"PRIpaddr"-%"PRIpaddr"\n",
>> +            paddr, load_addr, load_addr + effective_size);
> 
> As on earlier occasions: Please represent ranges as mathematical ones, to
> disambiguate whether the bounds (the upper one in particular) are inclusive
> or exclusive.

I will change to "... [%"PRIpaddr",%"PRIpaddr")\n".

> 
>> +int __init kernel_image_probe(struct kernel_info *info, paddr_t addr,
>> +                              paddr_t size)
>> +{
>> +#ifdef CONFIG_RISCV_64
>> +    return kernel_image64_probe(info, addr, size);
>> +#else
>> +    return -EOPNOTSUPP;
> 
> Better #error, as you have it elsewhere (iirc)?

Makes sense use:

#   error "Only 64-bit RISC-V is supported"

Thanks.

~ Oleksii

