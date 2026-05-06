Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHmJFQk4+2nUXwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 14:46:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A9F4DA6FA
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 14:46:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301692.1575911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKbcv-0002M1-7z; Wed, 06 May 2026 12:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301692.1575911; Wed, 06 May 2026 12:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKbcv-0002J3-4h; Wed, 06 May 2026 12:45:21 +0000
Received: by outflank-mailman (input) for mailman id 1301692;
 Wed, 06 May 2026 12:45:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKbcs-0002Ix-Sz
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 12:45:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKbcr-002h4o-U4
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 14:45:17 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb37d0-bab6-0a2a0a5309dd-0a2a4508be68-38
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 14:45:17 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb37dd-63b5-0a2a45080019-d1558035a5a5-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 14:45:17 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so6463875e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 05:45:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e53826022sm50342065e9.0.2026.05.06.05.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 05:45:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1778071517; x=1778676317; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9Bb16UgD22B91WOfQIoUWtSrV+OUOiVdWbH9S9G8nqM=;
        b=fI114GmTKwtWmp5NgoW+WqV91IFBS83RQqxCcbW+XTsC63J+PImN0XA7+Y8kkL50aL
         f401m4W68Rrgp8LWBQ2J3JYC6vTHqCrwIeELbcq0mLcxxBB2fexMNEYG07npLQP4+w8C
         7jRB5OlMSmZ6GNP4ijyDEl/M1zkCGgpIxXsjY9dylYPSPUBCZeD1OUaYFOwomv+UYCNd
         9T1A+K4nUul1nMr32Pd6yNDn/FDfH5oanf0gHZx8/txrix3e15HQv9tlysq0GjSauc/v
         M/VR+Fgc6/c2xCxCRbxXFiPggnZO0yMurCxj5Zqx6QzJ+IlfL4pzLMYHDmErzfjs76ly
         HZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071517; x=1778676317;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Bb16UgD22B91WOfQIoUWtSrV+OUOiVdWbH9S9G8nqM=;
        b=ozYMkrc2IbiUK5oWmrXjHrShpS1sXQvuBB/vt7hmYUpS5xxGjaQiQMb/czxiC3Tc72
         hD4FIxaXJbDGjMg5dg1qMO+xrYlLexPbhROugHNECcETQhPe28FUrUi9lVVz0XIFXWex
         qhDUBZPJBHs6loP50HTUJ3wI4mWBQhBnasTbCMrmsTbfR2GzquWAwlLo9i0EUA/RYtri
         P+qBM8wLFEOAkhabrYqFL21J+ERZYYP/j+xhPLhoK9+h40thASHXAxmrPD1XOB1Ohzmt
         INGFG0dmGZfYhkU6U3sSkaKl4MkQNlkjoTXj+1xbHcD7W++5CgF+JrwapudFq9zzwx0E
         I4tw==
X-Forwarded-Encrypted: i=1; AFNElJ+lOHMzmfpNZxqXLNiCggORbCh/yqky+Bp5QrYO+JfcMPCryiOZg6J+0lo/ZNAfTXzzwbUeTCHItQA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTMN5AlgeXZpvp9e9hVndkEQ9gC1fFoa2uAXFvnFyI6UTZgvtr
	nmqCG3dIQqxq+gXbUKLe7hKpvzkE5vzdwR4OgY9eePk+RWdmt8xJQUvIz2EjSuy6lg==
X-Gm-Gg: AeBDieuEnFxN/QdOBFXR4OZTi+27PovV0L5SL3CpUU/JobLG5H0KhUt50HNobvYIccp
	lxzjoM37xa3WS5jKK2kUewNlEBNJ7/qxO2J6E08wecxa7TPjv3zLKhZGf+Y9U3wkyxVcrwy/ueb
	tSjftZEc99hGXs/vmAf6in7JLCz5LDjZpYOGcOybFnpQsy7HbdwqvlHmaHx2g7fYDO2mesWvvze
	hbhy+b+y43tnSQmuB5ITk+BCR4GrF4QUPybg0orAhgsynEnbI27T8O35PGP+2oaiROCTfYzsc8Z
	ZompVY2ZEfHHz1jP2TJvrxtk//aOrACbS66LptcFzah1pYmNwxpjn27kYCD13or/o3Pu7YsREf5
	7iPgkRcjOZoYsjIqvnjyY+0JifnF2y7d0BDthuU2+gVV2CotstQtKBOFHbDW9PVhHerBirxb9wh
	QDSmSDOin7Voax8F/5v6pqrs5i1Vk9rVQ8MKzrOps3qKxgOTUuSXMWfJU3Y1HQ/28D5kFzrVBb3
	0jIBj7xUqHAW8J3Vm+RcHQkNQ==
X-Received: by 2002:a05:600c:a305:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-48e5227db96mr30922435e9.5.1778071517215;
        Wed, 06 May 2026 05:45:17 -0700 (PDT)
Message-ID: <47609c96-33b0-4b1c-ba6a-60110797cca8@suse.com>
Date: Wed, 6 May 2026 14:45:14 +0200
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
 <f61ddc8f-88a6-4f61-a470-c9c82b8b9b52@suse.com>
 <fa07cdad-81f9-408f-a04d-d9c3b8e1bef1@gmail.com>
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
In-Reply-To: <fa07cdad-81f9-408f-a04d-d9c3b8e1bef1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1778071517-BEF72DB1-CF07FBC7/0/0
X-purgate-type: clean
X-purgate-size: 6045
X-Rspamd-Queue-Id: B0A9F4DA6FA
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
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

On 06.05.2026 13:57, Oleksii Kurochko wrote:
> On 5/4/26 4:05 PM, Jan Beulich wrote:
>> On 28.04.2026 16:33, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/kernel.c
>>> @@ -0,0 +1,242 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#include <xen/bug.h>
>>> +#include <xen/compiler.h>
>>> +#include <xen/errno.h>
>>> +#include <xen/fdt-kernel.h>
>>> +#include <xen/guest_access.h>
>>> +#include <xen/init.h>
>>> +#include <xen/libfdt/libfdt.h>
>>> +#include <xen/mm.h>
>>> +#include <xen/types.h>
>>> +#include <xen/vmap.h>
>>> +
>>> +#include <asm/setup.h>
>>> +
>>> +#define IMAGE64_MAGIC_V2 0x05435352 /* Magic number 2, le, "RSC\x05" */
>>> +
>>> +static void __init place_modules(struct kernel_info *info, paddr_t kernbase,
>>> +                                 paddr_t kernend)
>>> +{
>>> +    const struct boot_module *mod = info->bd.initrd;
>>> +    const struct membanks *banks = kernel_info_get_mem_const(info);
>>> +    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0,
>>> +                                       KERNEL_LOAD_ADDR_ALIGNMENT);
>>> +    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt),
>>> +                                    KERNEL_LOAD_ADDR_ALIGNMENT);
>>
> 
>> Why would modules need to be this strongly aligned?
> No specific reason except to be aligned with similar alignment below, it 
> could be lesser (PAGE_SIZE or even just unsigned long aligned) or even 
> dropped, I think. It was just easier then to calculate aligned 
> addresses. But I don't see any big issue to have such alignments except 
> maybe that it will waste some memory.

Or result in there not being enough memory to hold everything.

>>> +    /*
>>> +     * Place modules as high in RAM as possible, scanning banks from
>>> +     * last to first so that the end of the last bank is preferred.
>>> +     */
>>> +    while ( bi-- > 0 )
>>> +    {
>>> +        const struct membank *bank = &banks->bank[bi];
>>> +        const paddr_t bank_end = bank->start + bank->size;
>>> +        paddr_t modbase;
>>> +
>>> +        if ( modsize > bank->size )
>>> +            continue;
>>> +
>>> +        modbase = ROUNDDOWN(bank_end - modsize, KERNEL_LOAD_ADDR_ALIGNMENT);
>>
>> Same question here.
> 
> I used KERNEL_LOAD_ADDR_ALIGNMENT to be sure that big page tables be 
> potentially used in page table.

I fear I'm lost. All the modules are temporary entities, aren't they?

>>> +        if ( (modbase < ROUNDUP(kernend, KERNEL_LOAD_ADDR_ALIGNMENT)) &&
>>> +             (modbase + modsize > kernbase) )
>>> +        {
>>> +            modbase = ROUNDDOWN(kernbase - modsize, KERNEL_LOAD_ADDR_ALIGNMENT);
>>
>> What prevents this subtraction from underflowing?
> 
> I will put the following check at the start of the place_modules() function:
> if ( kernbase < modsize )
>     panic("Underflow could happen between kernbase and modsize\n");

Wait - why would this be a legitimate condition to panic?

>>> +/* Check if the image is a 64-bit Image */
>>> +static int __init kernel_image64_probe(struct kernel_info *info,
>>> +                                       paddr_t addr, paddr_t size)
>>> +{
>>> +    /* https://www.kernel.org/doc/Documentation/riscv/boot-image-header.rst */
>>> +    struct {
>>> +        uint32_t code0;         /* Executable code */
>>> +        uint32_t code1;         /* Executable code */
>>> +        uint64_t text_offset;   /* Image load offset, little endian */
>>> +        uint64_t image_size;    /* Effective Image size, little endian */
>>> +        uint64_t flags;         /* kernel flags, little endian */
>>> +        uint32_t version;       /* Version of this header */
>>> +        uint32_t res1;          /* Reserved */
>>> +        uint64_t res2;          /* Reserved */
>>> +        uint64_t magic;         /* Deprecated: Magic number, little endian, "RISCV" */
>>> +        uint32_t magic2;        /* Magic number 2, little endian, "RSC\x05" */
>>> +        uint32_t res3;          /* Reserved for PE COFF offset */
>>> +    } image;
>>> +    uint64_t effective_size;
>>> +
>>> +    if ( size < sizeof(image) )
>>> +        return -EINVAL;
>>> +
>>> +    copy_from_paddr(&image, addr, sizeof(image));
>>> +
>>> +    /* Magic v1 is deprecated and may be removed.  Only use v2 */
>>> +    if ( le32_to_cpu(image.magic2) != IMAGE64_MAGIC_V2 )
>>> +        return -EINVAL;
>>> +
>>> +    effective_size = le64_to_cpu(image.image_size);
>>> +
>>> +    if ( effective_size && size > effective_size )
>>> +        return -EINVAL;
>>
>> Is the rhs of the && the wrong way round? If effective_size > size,
>> aren't you in trouble? Question of course is what "effective" really
>> means. Yet in any event it seems dubious to me that effective_size <
>> size would really be a problem. IOW this will want commenting upon
>> if the check is to stay.
>>
>> Actually ...
>>
>>> +    info->image.kernel_addr = addr;
>>> +    /* Actual size in the binary file */
>>> +    info->image.len = size;
>>> +    /* Total memory the kernel occupies at runtime */
>>> +    info->image.image_size = effective_size;
>>
>> ... this looks to suggest something .bss-like.
> 
> Yes, effective_size it is size which included .bss.
> 
> size it of LK after decompression of Image.gz and it doesn't include 
> .bss so it should be lesser then effective_size.
> 
> I don't think that I am in trouble that effective_size is bigger then 
> size if we allocate enough space in memory effective_size is fine to be 
> bigger.
> 
> It is a good question if effective_size < size is a problem. I think it
> isn't but could it be really happen?

A kernel image (file) could have data appended to it, e.g. a certificate.
With only small .bss that certificate could end up larger than the .bss
size, and hence effective_size < size.

> I think that I am okay to drop that part of if().

Please do, unless there is a(nother) reason to have it.

Jan

