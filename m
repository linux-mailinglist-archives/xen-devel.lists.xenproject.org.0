Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C661940A7B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 09:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767321.1177929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYhir-0006s0-AM; Tue, 30 Jul 2024 07:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767321.1177929; Tue, 30 Jul 2024 07:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYhir-0006q1-6y; Tue, 30 Jul 2024 07:56:41 +0000
Received: by outflank-mailman (input) for mailman id 767321;
 Tue, 30 Jul 2024 07:56:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYhip-0006o1-LK
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 07:56:39 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 400f98f2-4e49-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 09:56:39 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a7aa212c1c9so586917866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 00:56:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acac64b7csm609893166b.93.2024.07.30.00.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 00:56:37 -0700 (PDT)
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
X-Inumbo-ID: 400f98f2-4e49-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722326198; x=1722930998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NUBmyX8fwbzEcyTRBXhDHMwFZvkgD8DEHn8tOwLUNME=;
        b=gREhWyg8S+CL51maHtHYJfxMLUO6MDc4PnMzye/acEJjzOBoJzmTJ+UxR45bF+UodU
         acLchUnRdk4qaGoVXA3UxrCRTdbb16WDRf4R46IuC2nCGDrjwXeTPB9A8Z7KID72uDC6
         ATM3gSKJISlrDKbxeYnAVG1k9PcY6O0A88p5KM341IOL+CZEpH4IUS+oUNhDmeFGm1q8
         YzqGFsWVhdoCG494Scs6YVAiSRsd3mdP9Cds4mStkx4XRc2h4iGYc2xOTws+hKsN9gdr
         5RIF4f0QZPpbR/6dfgZ7w//PptumLRgQ4JYcEpCmwNOHjQjtDDGHG2kCWi8MsZ9C892b
         bw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722326198; x=1722930998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUBmyX8fwbzEcyTRBXhDHMwFZvkgD8DEHn8tOwLUNME=;
        b=EewFh9HKkTE3QN/0EMQQ0Pzzv3qtAXlLrDGFeTAkGbqYZyT6h0FQ0SktbhEjEOTCbn
         8S7u7UQwagOiNVtb23e3Kb+7zjty6gfVugSrLpfekbKZ6Y6zvx7S2NeumdjpGMADgRTM
         201v8X/uzIDfOH8NLoP9n+OJSwwbusq7M0cVYVsbIKxDTj6oKVkQ/gz/UJ6gB7P3zSKk
         c/HXrdLptARyrnGYnR/ArnjNQ/k5Rb6jy0bhUEnWa8kRq3jHKb/ne35NJEsep1Zi5DXn
         sKpSAz/xvwritQlxVDOtPA2zmkRFRm80zVjSWBER5nJw+DcclKIBo8gwo6dpMKWemNBt
         BfgA==
X-Forwarded-Encrypted: i=1; AJvYcCXU52VTiT3K+AO0hOyjfkP9JpN+BroH4F0ZgPxVSrrpFslOFVAO9qRfLMTUSS11+QV485bhYIzdVQtE3EPFgCYYeyjZZSsqMoA5kuHfk7c=
X-Gm-Message-State: AOJu0Yy3Kt/DcKFRDB06Vaj5Yzcjqc1ZiEjYg+jDRbZqaENHXfn5R0K0
	Q6/2ni4HZjA4fxrIYW9OnXChIM5g0ZQXxOAZsXPMED6d0q2B3BESWeBgsEBvug==
X-Google-Smtp-Source: AGHT+IFeKXHa+iZm3YCGiyjLm+1Cjz8azkzisE0w9u5iNPElqQ+wPwEJ0w63Usuh3XRIFqDGgHhknQ==
X-Received: by 2002:a17:907:1c19:b0:a6f:8265:8f2 with SMTP id a640c23a62f3a-a7d400d6673mr782289366b.37.1722326198155;
        Tue, 30 Jul 2024 00:56:38 -0700 (PDT)
Message-ID: <6c2ebc9e-cc0d-4139-80a2-4d7025989a9e@suse.com>
Date: Tue, 30 Jul 2024 09:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] xen/riscv: introduce asm/pmap.h header
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <11b5487659a9c76793e520c108cd92c6c84b908d.1721834549.git.oleksii.kurochko@gmail.com>
 <3359e37e-eaae-49ca-80a5-2bf70b9b46c7@suse.com>
 <78effb178b1ffe7ccb1714a13157e94f5e816b01.camel@gmail.com>
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
In-Reply-To: <78effb178b1ffe7ccb1714a13157e94f5e816b01.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.07.2024 18:22, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-07-29 at 16:29 +0200, Jan Beulich wrote:
>> On 24.07.2024 17:31, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/pmap.h
>>> @@ -0,0 +1,33 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef ASM_PMAP_H
>>> +#define ASM_PMAP_H
>>> +
>>> +#include <xen/bug.h>
>>> +#include <xen/mm.h>
>>> +#include <xen/page-size.h>
>>> +
>>> +#include <asm/fixmap.h>
>>> +#include <asm/flushtlb.h>
>>> +#include <asm/system.h>
>>> +
>>> +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
>>> +{
>>> +    pte_t *entry = &xen_fixmap[slot];
>>> +    pte_t pte;
>>> +
>>> +    ASSERT(!pte_is_valid(*entry));
>>> +
>>> +    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
>>> +    write_pte(entry, pte);
>>> +}
>>
>> Perhaps add a comment to clarify why it's safe to omit a TLB flush
>> here.
>> Note that arch_pmap_unmap() having one is a necessary but not
>> sufficient
>> condition to that. In principle hardware may also cache "negative"
>> TLB
>> entries; I have no idea how RISC-V behaves in this regard, or whether
>> that aspect is actually left to implementations.
> what do you mean by "negative" TLB? an old TLB entry which should be
> invalidated?

No, I mean TLB entries saying "no valid translation here". I.e. avoiding
recurring walks of something that was once found to have no translation.

>>> +static inline void arch_pmap_unmap(unsigned int slot)
>>> +{
>>> +    pte_t pte = {};
>>> +
>>> +    write_pte(&xen_fixmap[slot], pte);
>>> +
>>> +    flush_xen_tlb_range_va_local(FIXMAP_ADDR(slot), PAGE_SIZE);
>>> +}
>>
>> For both functions, even if mainly for documentation purposes, it may
>> be desirable to mark them __init. It's again a necessary (but not
>> sufficient) condition here, to validly use local TLB flushes only.
> Does __init in this context means that it will be called only by boot
> cpu at the start and that is it?

No, and I said so in my reply. __init is indicative of the function not
being suitable for runtime use, but it is not enough to indicate the
function is also unsuitable for use as soon as a 2nd CPU is being brought
up. Yet for the latter we have no proper annotation. Hence my suggestion
to use the former to have at least a limited indicator.

An alternative might be to add ASSERT(system_state < SYS_STATE_smp_boot).
That, however, exists in common/pmap.c already anyway.

Yet another alternative would be a clarifying comment.

Jan

