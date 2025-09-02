Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15F9B3F51F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 08:15:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105661.1456522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utKIF-00055i-E1; Tue, 02 Sep 2025 06:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105661.1456522; Tue, 02 Sep 2025 06:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utKIF-00053z-9e; Tue, 02 Sep 2025 06:14:59 +0000
Received: by outflank-mailman (input) for mailman id 1105661;
 Tue, 02 Sep 2025 06:14:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utKID-00053t-4n
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 06:14:57 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 254bbaed-87c4-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 08:14:55 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb7ace3baso276479066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 23:14:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0432937e0esm372708166b.3.2025.09.01.23.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 23:14:55 -0700 (PDT)
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
X-Inumbo-ID: 254bbaed-87c4-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756793695; x=1757398495; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2zalHF03nmx5/7oED+m4rQP8/WRq7ErqVBE0DD+p6KA=;
        b=UdWT7+N0pJW+n7V4kLHnhBIOlmm5y9EJyL8pKbrhRp81VwMRncdN9rqS2W33dhtW3d
         0Zf5GDY/AUjwRiSBflmOyhD40qeuU3/o6vShxi/jQgfkNz3O9xe46xP5fW4JbzCmN3uv
         nmHM20akF+59Q1pdaOL2+Psz9i4ffvHsEfmaSQN9mr5HQYcrSMJHh54owqaXdE8YyQvD
         +TUdYkr1c2TQCu/IezZT7f1Q4BXOzGpVyhM9vXMhQoaHkjjVj6Ern7iSDewT4wAVzTf3
         j2GDhAYEiWe8zc4y8ILzmxobeyGUoZQnZTNJIXrzR4WofeVLC8DV0b8s8SI3WPlSs+K/
         n7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756793695; x=1757398495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zalHF03nmx5/7oED+m4rQP8/WRq7ErqVBE0DD+p6KA=;
        b=AUOzl7oTKApdV5FqSygqQFZfzX/fvmcq5Z8kLMDUtfQExVztZjXqyI1e38HGvOP1Ra
         H8z6T3808m2bCdIEgNx/V3whZnIB5+uRtUFg/XD+w+eKE6H9wQhxJxGR15lfJdmMVYVf
         m4Yk4A0UEF54wnNtsr3parJz0c88WMiHe3NLVFSjzNYGJykRrmlGACPF50Ki6LorfNzM
         9LVFhNLFV4YZfKb3O2IC1vhLPwyzUeDOwkqSYSk0s4JdUKE0qtjk2/8VSea4dAjhUR4E
         ZR17jNRfVMkpVEkw4DvvhHiLETPmfz358LQQJYMYGtkrBCl4pDitYvvsHEoT15eHpCG3
         +zyA==
X-Forwarded-Encrypted: i=1; AJvYcCUzgpjhNBSDcdDzkzzljV0uaDgxu2eCMTqV1hTSLs3A5ov5v6HSd1jU9QRqaHep+IVowm2wrTyT/2U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQlZaIMug9XvCogOr10WQ2J+6UHv6WPueXOmKnr6o8nYVZZYds
	FquIEMZZwVVcx0smT+yrjTmkcz431j42wYiX04+xW5CrVtWnKpmnMU51//pluYO2mg==
X-Gm-Gg: ASbGncsgtR7fhJ1lqEH3EDcRulYkhkuuLEWTNJnvIwSXhmO0b+qln/yiWKkdaFpxqJp
	oL+Pf255HRNJE7hy/yJsTezvj/w8hIgGfXIVwdu3+EzDlFHftzEBBmFfNWXtHwLxP4laNCjuoBu
	svlt2X4SdOsIcsGjn1yuEsE9kWSv71uNn1XWLzCPTyfuBk5eSoaiInThf4zDD2ccbiaGWOzgLiS
	Z53ac/wgEuQApSNn0auWmvieXuqc1qHCw8X7JCXhRxioBanCW25c9Bmyr3cZG/IghpH5Lq3UjZ9
	LKi9viZvixYG3MsPfWDtcowA5r1b0Hz1Y8ykxQexS6pGjmKA+wMPDR+xyQQMQ+LEYzK7ClH8u/L
	qRmnrhR0lZiucxGbX+HrIXhWGwoWhwHkvhLKJuINofaW6N6sjahV70mNYyCIr9GmN2PcgyheuxK
	ovdkIJUutvO23esglCJw==
X-Google-Smtp-Source: AGHT+IFPzwzaX36F2yqdOVys+Jf5sqidojXsvgPveWj5uyEUNwk1f2MK0sIs6JYz0HJGOjU4LfqYEQ==
X-Received: by 2002:a17:906:c445:b0:b04:198c:54a9 with SMTP id a640c23a62f3a-b04198c5b14mr618301366b.61.1756793695293;
        Mon, 01 Sep 2025 23:14:55 -0700 (PDT)
Message-ID: <8b93405c-60d7-4289-b775-ffbd953d8e10@suse.com>
Date: Tue, 2 Sep 2025 08:14:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/15] emul/vuart: introduce framework for UART
 emulators
To: dmukhin@xen.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
References: <20250828235409.2835815-1-dmukhin@ford.com>
 <20250828235409.2835815-2-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2508291217110.341243@ubuntu-linux-20-04-desktop>
 <37f4c1af-29e3-44eb-a238-a3e2e4641f10@suse.com> <aLYdwtB+DqV4gXle@kraken>
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
In-Reply-To: <aLYdwtB+DqV4gXle@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2025 00:27, dmukhin@xen.org wrote:
> On Mon, Sep 01, 2025 at 10:14:04AM +0200, Jan Beulich wrote:
>> On 29.08.2025 21:27, Stefano Stabellini wrote:
>>> On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
>>>> --- /dev/null
>>>> +++ b/xen/common/emul/vuart/vuart.c
>>>> @@ -0,0 +1,156 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * UART emulator framework.
>>>> + *
>>>> + * Copyright 2025 Ford Motor Company
>>>> + */
>>>> +
>>>> +#include <xen/err.h>
>>>> +#include <xen/sched.h>
>>>> +#include <xen/vuart.h>
>>>> +#include <xen/xvmalloc.h>
>>>> +
>>>> +#define for_each_emulator(e) \
>>>> +    for ( e = vuart_array_start; e < vuart_array_end; e++ )
>>>> +
>>>> +extern const struct vuart_emulator vuart_array_start[];
>>>> +extern const struct vuart_emulator vuart_array_end[];
>>>> +
>>>> +static const struct vuart_emulator *
>>>> +vuart_match_by_compatible(struct domain *d, const char *compat)
>>>> +{
>>>> +    const struct vuart_emulator *emulator;
>>>> +
>>>> +    if ( d->console.vuart )
>>>> +        return NULL;
>>>> +
>>>> +    for_each_emulator(emulator)
>>>> +        if ( emulator->compatible &&
>>>> +             !strncmp(emulator->compatible, compat,
>>>> +                      strlen(emulator->compatible)) )
>>>
>>> strncmp will continue until the given count even if compat is shorter
>>
>> Not really, one string having a nul char and the other not having one is a
>> difference, at which point comparison will stop. There would be a problem
>> if "compat" didn't point to a nul-terminated string, though (and I didn't
>> check that aspect, not the least because then "shorter" doesn't really
>> make much sense without a length passed in).
> 
> re: NUL-termination: current assumption is that both compat and
> emulator->compatible are NUL-terminated.
> 
> Current `compat` comes from the hardcoded NUL-terminated string (vuart_info).
> 
> In case of `compat` is not NUL-terminated (I plan to populate the field from
> xl in the future), strncmp() will stop after strlen(emulator->compatible)
> bytes.

Which might be too late; if not nul-terminated, "compat" may extend past a
page boundary, with the latter page not mapped.

Jan

