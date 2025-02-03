Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDB5A2604C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:38:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880887.1290980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezSj-0004Ux-9a; Mon, 03 Feb 2025 16:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880887.1290980; Mon, 03 Feb 2025 16:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezSj-0004Si-6P; Mon, 03 Feb 2025 16:38:17 +0000
Received: by outflank-mailman (input) for mailman id 880887;
 Mon, 03 Feb 2025 16:38:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tezSi-0004Sc-J0
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:38:16 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 442efe2a-e24d-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 17:38:15 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab6ed8a3f6aso695462666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:38:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc723d0d2asm7996486a12.7.2025.02.03.08.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:38:14 -0800 (PST)
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
X-Inumbo-ID: 442efe2a-e24d-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738600695; x=1739205495; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mVkt7NkcVobbiVcjlRciLSgx8ugs4H97ewDTTtAwP1I=;
        b=dY4fxO+O1b53gN7LPSxkPy2/KQCMFgJ9COWMlU+GA1yy1AqnKcAyKNV0WiiZH1GGne
         AN0r0oTiysttQGwOcnXOT1c9Zm2ra9BR/E6LAnlw7WIkad8DjCqdjbSBP/sD8SKcbc11
         gHRSvj4PapBksJHn61D0Gz8wSllV5x2Bi2Hm67Pb5SBTj7OZT6PxtixjJoqnVEdo/1QH
         ZnjTuttHDmhKNwcqLJ71Ig+Rw6Bt8tRM/lnZhoeybB9KKAYPMqqm6X/7QuHKS/ecAJUv
         Tl7V8vvYpOePPuNNN/Z3NvHl0eQcTKpNl6urn1sVQ6Jyj5SUDn/sK5694BB+saEk5JAN
         W8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600695; x=1739205495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVkt7NkcVobbiVcjlRciLSgx8ugs4H97ewDTTtAwP1I=;
        b=WLE0suiMqmOKkcZ+FzoMM8cqDERc83JeK4hVhlL0a48vpxLk2Md1UZ0O1831CoMtNU
         e67ED8D0WQeoyVpHV74WFnbiSMyUQuyy3ncLOvencko9z5e6qrcAzRnJ+qaEoibcgy94
         rjm6lqMqvLHinJL6iqQdddQlupMVMgYKkidPO01qyLnJKXUB9QtqAvTBGXPdQI5CGo8H
         sTuvPaC9A2HHlsy+6WIG5bv9q26AFwGdMxfxbzxZ8bBr1sxtc3XwEpFBzv0mgyz2zgJo
         PMkql7MyfLt3pGT909zQpcR8EawcbuzEqfdT91jNaK9o3CZw6S1K5vEsA7OVAjhGIfk4
         vVsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU0TuQjBdEiERmoq1YnGT+6iPeNKXlqifz1l5yoBooiX8BZxp5ha26vnVWXcAoXorAbVa7Py2a6h4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIyhq+gsFAqTrSHRxq9Ex/1tsyxSH6j0EKc9iDYwsfVJ6yp4pE
	3WgP9/4De0coaWYhhA/yoZa4RsGc2j7d5GePHULvxWYAr9mZYTacv7frlXSNeg==
X-Gm-Gg: ASbGnct7e/EUyXDcduurAgDLSllNlA+XZRZpSvkRYDfu5C6QG4oO2e9y/FPgCPMdNlL
	zFe3uTAmaEGfgCJf/ojeBQ+UooOW7EqcmIaqfdpzlwP6iIyo3zDuIeJ5kjcuVSYSkRwO80fQ/HX
	LkrMlGgZuFBZJC4gtkJrLj1ai1lWl9vYpo95dT5dEsn21c1aV9DZ75SRe9K49JcbRe8gXJnQ+Zi
	TNjS9HhrSFs9vnJlwTJlC9fpbTcVF/+HKAB2me/Y42t3vwkkBfw9d096o5PdmnwsF0QLKXjLUAX
	fXjUxqeL+FaLnhinv7NCsTI1NFdTaN1nq5/INj8wXP1Z2V9TP1lTuBjltpdescLFR2Q3dqFrQDs
	w
X-Google-Smtp-Source: AGHT+IFHlN26TTAmDvIkhnbibhCyazSLPo7WXUfdY7DbJA0JBtNq37xPMFZzLotpZE7nVuDBfNR6FA==
X-Received: by 2002:a17:906:7955:b0:ab3:9923:ef4e with SMTP id a640c23a62f3a-ab6cfcdfdb1mr2511338166b.22.1738600695083;
        Mon, 03 Feb 2025 08:38:15 -0800 (PST)
Message-ID: <24cbbeca-1075-493c-a07a-df2d3f6f0627@suse.com>
Date: Mon, 3 Feb 2025 17:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/9] asm-generic: move some parts of Arm's
 domain_build.h to asm-generic header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1736334615.git.oleksii.kurochko@gmail.com>
 <ba3cde730ae072ba1088e396dd7d03482e4c4011.1736334615.git.oleksii.kurochko@gmail.com>
 <347b4bb0-5fd1-439f-9e3b-ef13ac89bbe9@suse.com>
 <8ca2fe43-f698-4913-bb09-13093938fba9@gmail.com>
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
In-Reply-To: <8ca2fe43-f698-4913-bb09-13093938fba9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.02.2025 16:50, Oleksii Kurochko wrote:
> On 1/27/25 12:23 PM, Jan Beulich wrote:
>> On 08.01.2025 12:13, Oleksii Kurochko wrote:
>>> Nothing changed. Only some functions declaration are moved to asm-generic
>>> header as they are expected to be used by common code of domain builing or
>>> dom0less.
>>>
>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>> ---
>>>   xen/arch/arm/include/asm/domain_build.h | 19 ++----------
>>>   xen/include/asm-generic/domain-build.h  | 41 +++++++++++++++++++++++++
>>>   2 files changed, 43 insertions(+), 17 deletions(-)
>>>   create mode 100644 xen/include/asm-generic/domain-build.h
>> Again I question this movement under this name. "Domain building" is a pretty
>> generic thing, yes, but what you move would e.g. be entirely inapplicable on
>> x86 (as it is now). For example ...
>>
>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/domain-build.h
>>> @@ -0,0 +1,41 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __ASM_GENERIC_DOMAIN_BUILD_H__
>>> +#define __ASM_GENERIC_DOMAIN_BUILD_H__
>>> +
>>> +#include <xen/types.h>
>>> +
>>> +struct domain;
>>> +struct page_info;
>>> +struct kernel_info;
>>> +struct membanks;
>>> +
>>> +typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
>>> +                                     unsigned int order, void *extra);
>>> +bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>>> +                             alloc_domheap_mem_cb cb, void *extra);
>>> +
>>> +bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>>> +                          paddr_t tot_size);
>> ... the term "bank" seems pretty closely tied to DT. Other stuff ...
>>
>>> +void allocate_memory(struct domain *d, struct kernel_info *kinfo);
>>> +int construct_domain(struct domain *d, struct kernel_info *kinfo);
>>> +int make_chosen_node(const struct kernel_info *kinfo);
>>> +int make_cpus_node(const struct domain *d, void *fdt);
>>> +int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
>>> +                         int addrcells, int sizecells);
>>> +int make_memory_node(const struct kernel_info *kinfo, int addrcells,
>>> +                     int sizecells, const struct membanks *mem);
>>> +int make_timer_node(const struct kernel_info *kinfo);
>> ... here also falls in this category. Stuff like this may well live
>> under asm-generic/, but the file name chosen then needs to reflect
>> constraints.
> 
> Unfortunately, at least at the moment, this is not applicable to x86.
> 
> Partially, domain_build.h was chosen to have less changes in Arm code.
> 
> Would it be better to use domain-build-dt.h?

That would at least be a more specific name. Yet then - why put such under
asm-generic/ ? This stuff isn't truly generic (as in: any arch can fall
back to using this). Personally I'd rather expect such stuff to live under
e.g. include/xen/device-tree/. That would make it clear that environments
using DT may consider using it, but other environment shouldn't.

Jan

