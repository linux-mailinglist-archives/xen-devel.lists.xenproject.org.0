Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E549411A4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 14:16:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767686.1178375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYllZ-00018a-HC; Tue, 30 Jul 2024 12:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767686.1178375; Tue, 30 Jul 2024 12:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYllZ-00016O-Du; Tue, 30 Jul 2024 12:15:45 +0000
Received: by outflank-mailman (input) for mailman id 767686;
 Tue, 30 Jul 2024 12:15:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYllY-00016I-Fu
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 12:15:44 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70d8cbd5-4e6d-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 14:15:42 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52efd530a4eso7010748e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 05:15:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab23f62sm643080466b.16.2024.07.30.05.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 05:15:41 -0700 (PDT)
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
X-Inumbo-ID: 70d8cbd5-4e6d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722341742; x=1722946542; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t+yBq+PZ3qeR79tyRs5EQIzbiBScpMqImrplcSta1j4=;
        b=WJdC0uanTOW7lREGerPilhoYhP1dU2XDqjpWLSalRJMT/K02Cf00P/E1/hQye7Gzne
         /9deGUy2Ex/ye15aNtp3rDJAAtlk568mnPpHhEm6WEjLeUSVgIA7HYjHSTm8LQ+gBUMm
         MrwUuE0oRVJiq4B0/3d1J9ryIJsioTTLHcLhzZ5z/0xs0rg8afh9DgPpcIxCZ25f4q00
         wO8KpaG0W/wYOnrN0s89oWfUZZTs9QcGQBXlZkjQMk5nqpxyvNy+JYPnq/5YmnmlCDjE
         mwCRQlOqFWLHrvh5jtCl/FrO1MKhzdmzPLnEEqq6+LWKRkCKJqZtUALArWGjBfFOGJsu
         L5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722341742; x=1722946542;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+yBq+PZ3qeR79tyRs5EQIzbiBScpMqImrplcSta1j4=;
        b=n4pD6dUOPJsmfKQ3m39nshf6rlTWa1XFPH2pRNUnpxbSVaSOqnIAzSK4/DSweunqm6
         Z36zQoC0bt9VInAXnbkJOvrAlXS3DeWBWMgHJ98QXMAByZZ4k5ZGkC3su9ZZKx20YsWF
         /SLQIdFxoiXZZ9ZAGNEq6/sMOsVzKIwizn3Jz4h0oQDvfxyAVsaa6GuvTBZY9IRqFaJu
         smP5Jh+14vSbWq9ml2N7o3kKSMPG1azKvhzaPGZUaVHm6woFHpBc1dadhAYbBW/czcOF
         9Z84R/4ylbQNeaysj/iaMFQFel8RhxDsGxUJlHGYp/C9+NlQdr2tWiiUNtFvusyaOcEU
         9jYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvxjwBoVx9a8brKSYOdLjdXzTDlGY8AvwTjV2V/bJUJ/pcgaQIS1h6aZ12jPd2UUvm+8Krkx3nBCIRy58gkIMHSkRAugevkk1y2iAfxfU=
X-Gm-Message-State: AOJu0YzmINWgdwIZQv/R2ASsgmmLlfwX3OUVsEyfxXTcxFXEu+mBrxJJ
	At7BURUDWwyil8SLRwrLAq7MoFuE5iICYXVp43GHok8N2ESnB/BkoB+arMHTFg==
X-Google-Smtp-Source: AGHT+IGFKhXdIOd2WDocyVb1hGYlwZVtn9OE7XK/rs8+KWPnhHfjNo21ePyNvhL+gXNl4CQA+OPtug==
X-Received: by 2002:a19:915e:0:b0:52e:ff2a:217 with SMTP id 2adb3069b0e04-5309b2d7baamr6808175e87.50.1722341741682;
        Tue, 30 Jul 2024 05:15:41 -0700 (PDT)
Message-ID: <36944f26-1180-4eaa-aa5d-3186e65faeb8@suse.com>
Date: Tue, 30 Jul 2024 14:15:40 +0200
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
 <6c2ebc9e-cc0d-4139-80a2-4d7025989a9e@suse.com>
 <035f836a53966194048df5b720b94a78b0a490ae.camel@gmail.com>
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
In-Reply-To: <035f836a53966194048df5b720b94a78b0a490ae.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2024 13:39, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-07-30 at 09:56 +0200, Jan Beulich wrote:
>> On 29.07.2024 18:22, oleksii.kurochko@gmail.com wrote:
>>> On Mon, 2024-07-29 at 16:29 +0200, Jan Beulich wrote:
>>>> On 24.07.2024 17:31, Oleksii Kurochko wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/riscv/include/asm/pmap.h
>>>>> @@ -0,0 +1,33 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>> +#ifndef ASM_PMAP_H
>>>>> +#define ASM_PMAP_H
>>>>> +
>>>>> +#include <xen/bug.h>
>>>>> +#include <xen/mm.h>
>>>>> +#include <xen/page-size.h>
>>>>> +
>>>>> +#include <asm/fixmap.h>
>>>>> +#include <asm/flushtlb.h>
>>>>> +#include <asm/system.h>
>>>>> +
>>>>> +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
>>>>> +{
>>>>> +    pte_t *entry = &xen_fixmap[slot];
>>>>> +    pte_t pte;
>>>>> +
>>>>> +    ASSERT(!pte_is_valid(*entry));
>>>>> +
>>>>> +    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
>>>>> +    write_pte(entry, pte);
>>>>> +}
>>>>
>>>> Perhaps add a comment to clarify why it's safe to omit a TLB
>>>> flush
>>>> here.
>>>> Note that arch_pmap_unmap() having one is a necessary but not
>>>> sufficient
>>>> condition to that. In principle hardware may also cache
>>>> "negative"
>>>> TLB
>>>> entries; I have no idea how RISC-V behaves in this regard, or
>>>> whether
>>>> that aspect is actually left to implementations.
>>> what do you mean by "negative" TLB? an old TLB entry which should
>>> be
>>> invalidated?
>>
>> No, I mean TLB entries saying "no valid translation here". I.e.
>> avoiding
>> recurring walks of something that was once found to have no
>> translation.
> But we can't modify an existent entry because we have
> "ASSERT(!pte_is_valid(*entry))" in pmap_map() function and we are doing
> TLB flush during pmap_unmap().

You _always_ modify an existing entry. That may be a not-present one, but
that's still an entry. And that's part of why I think you still didn't
understand what I said. A particular implementation, if permitted by the
spec, may very well put in place a TLB entry when the result of a page
walk was a non-present entry. So ...

> So when we will be in pmap_map() we are
> sure that there is no TLB entry for the new pte.

..., can you point me at the part of the spec saying that such "negative"
TLB entries are not permitted?

Jan

