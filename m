Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD3085A58A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 15:13:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682889.1062113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4O4-0001Tn-EN; Mon, 19 Feb 2024 14:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682889.1062113; Mon, 19 Feb 2024 14:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4O4-0001Rc-BA; Mon, 19 Feb 2024 14:12:52 +0000
Received: by outflank-mailman (input) for mailman id 682889;
 Mon, 19 Feb 2024 14:12:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc4O2-0001RW-CI
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 14:12:50 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f61ddcb1-cf30-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 15:12:49 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-412698ac6f9so3355235e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 06:12:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jv14-20020a05600c570e00b0040fe3147babsm11607691wmb.0.2024.02.19.06.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 06:12:48 -0800 (PST)
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
X-Inumbo-ID: f61ddcb1-cf30-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708351968; x=1708956768; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lpM1FgOFVuQs6HeBgyssEQKkmM0PMINwI3V3SPSgV+Y=;
        b=WLt+zxivZcqfrTFsVRnnqJGzrzXu1Ew+mTCFvIDOXOXSjw0ZcTatjPKLUPEElQCW7S
         mnNCv/jNNgVuS+Wy0Knuq5w0UAlEr38G4nDlrrCKW86Pr9KPSpWwjH/W6BaifCDrzhpj
         ps0C7WpLZFRk3U8b9flMexY5BXBFUkBNw5j4hk9TrfWPtpAeBQcv7KBy1Q7aHYXZXt0q
         qLHbjGx9OIE8PSagxihbMY66m0zo5F3QEybpso5H7QhSB+tpyssEoVN3Vs2Mdjd5jUWN
         rrw0E9y4yCfyYo9xci8LFfzdpsmJT+z9nLAgoXPG4ReZxe4OEyLN8a8/bTrgDRPC6DJZ
         PieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708351968; x=1708956768;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lpM1FgOFVuQs6HeBgyssEQKkmM0PMINwI3V3SPSgV+Y=;
        b=ISog+riLGcnh43DPTctRkvJPtyhGiY5COrn0uZ4WkkJ6U4cG+eVR1ukjE8ogyk119w
         GEjVIfHXWHjJRrRI2p9xDmY5Kynt1ihE+BquVa0gphOQVJ+Qd72tE5EyiKBHYg39OyiW
         /J5iEGDhOoofbUF+wsY69LL8/C7GohguB/zfndPEtB+Q2DrwyhD7pAoNWHUUSiRzrtBI
         g+0BI6Fq4mT3jZ9nv1mheQen7Zy8ILWe5eUprQHXOFVKH4k+yaxw24N5mzwH6D1hHw66
         uAkIP9hgnvMgFAO7uEKZVpxae7+6TgetC2S2+BblEuOCnf1IWrqai07My8YnCWgLRXHi
         +CWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoHCD9afIzybPqyzQakLht2gAZMK5PDxjr4Kyhw0oG0Gh0v9zzVF2m0sE2BwH+ef5utNadrW9IuRVEyp7pO+zyCx8kTF08W9h0xpkqQAM=
X-Gm-Message-State: AOJu0YzjxPnxGN3h1qtsr7o4WspbMMJ98Q/3LEUrNBXcrv/dObVOdI8/
	e5Jp1EGuKfdyV+5YJnkWcN0fvEPUIgB93zVPP8BUj51qTrHv39+GhNFIE1onjg==
X-Google-Smtp-Source: AGHT+IFbNQTyR9YmTnaUvioudSePL0NwHbITvwkvmUTjQBjN9Im1dBq7+82ysWZNhtOuHrAia5pQgA==
X-Received: by 2002:a05:600c:1c0a:b0:411:dd82:a23c with SMTP id j10-20020a05600c1c0a00b00411dd82a23cmr10577067wms.0.1708351968559;
        Mon, 19 Feb 2024 06:12:48 -0800 (PST)
Message-ID: <73b4654a-cdf2-48dc-b802-a7890c3fe426@suse.com>
Date: Mon, 19 Feb 2024 15:12:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
 <491937fd-2459-416f-944b-0c63f7c12473@xen.org>
 <1ebdc064665b396d1978ac188594682f08601dbc.camel@gmail.com>
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
In-Reply-To: <1ebdc064665b396d1978ac188594682f08601dbc.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.02.2024 15:00, Oleksii wrote:
> On Sun, 2024-02-18 at 19:00 +0000, Julien Grall wrote:
>> On 05/02/2024 15:32, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/cmpxchg.h
>>> @@ -0,0 +1,237 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/* Copyright (C) 2014 Regents of the University of California */
>>> +
>>> +#ifndef _ASM_RISCV_CMPXCHG_H
>>> +#define _ASM_RISCV_CMPXCHG_H
>>> +
>>> +#include <xen/compiler.h>
>>> +#include <xen/lib.h>
>>> +
>>> +#include <asm/fence.h>
>>> +#include <asm/io.h>
>>> +#include <asm/system.h>
>>> +
>>> +#define ALIGN_DOWN(addr, size)  ((addr) & (~((size) - 1)))
>>> +
>>> +#define __amoswap_generic(ptr, new, ret, sfx, release_barrier,
>>> acquire_barrier) \
>>> +({ \
>>> +    asm volatile( \
>>> +        release_barrier \
>>> +        " amoswap" sfx " %0, %2, %1\n" \
>>> +        acquire_barrier \
>>> +        : "=r" (ret), "+A" (*ptr) \
>>> +        : "r" (new) \
>>> +        : "memory" ); \
>>> +})
>>> +
>>> +#define emulate_xchg_1_2(ptr, new, ret, release_barrier,
>>> acquire_barrier) \
>>> +({ \
>>> +    uint32_t *ptr_32b_aligned = (uint32_t *)ALIGN_DOWN((unsigned
>>> long)ptr, 4); \
>>> +    uint8_t mask_l = ((unsigned long)(ptr) & (0x8 - sizeof(*ptr)))
>>> * BITS_PER_BYTE; \
>>> +    uint8_t mask_size = sizeof(*ptr) * BITS_PER_BYTE; \
>>> +    uint8_t mask_h = mask_l + mask_size - 1; \
>>> +    unsigned long mask = GENMASK(mask_h, mask_l); \
>>> +    unsigned long new_ = (unsigned long)(new) << mask_l; \
>>> +    unsigned long ret_; \
>>> +    unsigned long rc; \
>>> +    \
>>> +    asm volatile( \
>>> +        release_barrier \
>>> +        "0: lr.d %0, %2\n" \
>>
>> I was going to ask why this is lr.d rather than lr.w. But I see Jan 
>> already asked. I agree with him that it should probably be a lr.w and
>> ...
>>
>>> +        "   and  %1, %0, %z4\n" \
>>> +        "   or   %1, %1, %z3\n" \
>>> +        "   sc.d %1, %1, %2\n" \
>>
>> ... respectively sc.w. The same applies for cmpxchg.
> 
> I agree that it would be better, and my initial attempt was to handle
> 4-byte or 8-byte boundary crossing during 2-byte access:
> 
> 0 1 2 3 4 5 6 7 8
> X X X 1 1 X X X X
> 
> In this case, if I align address 3 to address 0 and then read 4 bytes
> instead of 8 bytes, I will not process the byte at address 4. This was
> the reason why I started to read 8 bytes.
> 
> I also acknowledge that there could be an issue in the following case:
> 
> X  4094 4095 4096
> X    1   1    X
> In this situation, when I read 8 bytes, there could be an issue where
> the new page (which starts at 4096) will not be mapped. It seems
> correct in this case to check that variable is within one page and read
> 4 bytes instead of 8.
> 
> One more thing I am uncertain about is if we change everything to read
> 4 bytes with 4-byte alignment, what should be done with the first case?
> Should we panic? (I am not sure if this is an option.)

Counter question (raised elsewhere already): What if a 4-byte access
crosses a word / cache line / page boundary? Ideally exactly the
same would happen for a 2-byte access crossing a respective boundary.
(Which you can achieve relatively easily by masking off only address
bit 1, keeping address bit 0 unaltered.)

> Should we
> perform the operation twice for addresses 0x0 and 0x4?

That wouldn't be atomic then.

Jan

