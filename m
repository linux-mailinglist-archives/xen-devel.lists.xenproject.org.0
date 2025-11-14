Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750A6C5BDA9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 08:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162317.1490006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJofj-0007xx-Dy; Fri, 14 Nov 2025 07:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162317.1490006; Fri, 14 Nov 2025 07:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJofj-0007vl-Au; Fri, 14 Nov 2025 07:56:43 +0000
Received: by outflank-mailman (input) for mailman id 1162317;
 Fri, 14 Nov 2025 07:56:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YOW=5W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJofi-0007vf-Et
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 07:56:42 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73b98d6f-c12f-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 08:56:41 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b714b1290aeso251693366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 23:56:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd80841sm336369066b.41.2025.11.13.23.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 23:56:38 -0800 (PST)
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
X-Inumbo-ID: 73b98d6f-c12f-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763106999; x=1763711799; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RDkIoua/g7h+7uKXF1oqE2oZDei/rjUbfMR/pR3Zi5U=;
        b=HTRceDXXXJFFVS36smDsXfB37y/FeMOGYOPnRjwPerJl4CYv5cmxoPSTL2WWRqD2ar
         pgnvFbqd/a5fiU48nMFbUYrEFgu5+xpOMK8MrdpdFJMVemFm2jTbgp/Hborir9SpKYgX
         VBYVKIZVDK/YCI2QUn6VoZwRRB/izeWTEggh6aYNxk4OEd25Nna7SeA5RX23RFxOkHrN
         paw/Hm2SKSaJd/eJh6+GXzti/nvKCNqeoFwUpgg4y1tQHe4SqRNYUMPRb3y7zMP5CbU8
         1rgLUMsKNqc0xx44EWDKXlthVAwRP4c9xj4U372eblVbou4y5QuoTYLKvYXG7zqlyGi+
         rVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763106999; x=1763711799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDkIoua/g7h+7uKXF1oqE2oZDei/rjUbfMR/pR3Zi5U=;
        b=GCcJK/PW9ECSwMYm/iei+LfflN+NIekUYD66AYv68fAgNtiRI3Ugfr1jyEjOLCruzi
         eDBynuo5t4/AT/dyTlatnE3ZEW0JUjYrJwC9CzIv1kJ7+O86zAJ9/UYTNjCyLOmRBKNb
         /FVSXC29OznENQB1uHPVgKsU9maIL41X6gJcQV1Dh3mwFihBe1kk8ZzR124FoTmSIBcf
         FrgY5iyvHH7oCvcto1/h4PwEju436dJMgp85mEngflrSSO3fGiWMNbIzY6fskXzUN94y
         1BtT3KxFZVf89VZuE1pFkZ5j6U2UXWXrn7jcQ/JLOPnmEF4lRuqI2eBbX0dneA4aUctM
         5jvg==
X-Gm-Message-State: AOJu0YwViQogrK5MhFy3WwVRGVONSmcrjBLoYKUSYT+vdI3xZuLT95n2
	b5Yvpam+v4UICZU2O4G+w3t9m2LDYQrES/DO5t23gUJmYNM86kLTokXkWlJF9bYWLw==
X-Gm-Gg: ASbGncvDgEyhHKhf0Jmwk9TVBFpwNyMNu2GHhAK/Z89PKyxE2AYDyq/1p/jcxDwWpBc
	9d1RgQlZDzTbjGnD+hHc8s20uk3I92e2ASGpJ3e9+4WRnV64eqM4m3i2JNwDl3CPX5WSTF0Y3hE
	fKcqtGJW8s8draZlamu1stzgXdJhoNEXMnmf/syAGbycBloYj0SGpBjkTMaTtY81oC4FPAoRcPa
	U4rlNmu0jQcOB9XpBdJimd9ABpHX9vzbb8zvB+qN04MlyD75xYlbqFs/qoEoJF97NFcchzMsbpd
	kcM7Z8OoXlRX3+Mi860hMb8tdJ/c1tAkaIvLcdGkDQ/ni9YbQB7xiNI+4QAidEO1+OohqWoF1VO
	TfK4Pk+HbedQj/CrNMyd+7Q0svtMfR17fCEafhaw9CqEtDJzignFXH9B9OZwM7bxOqsTfWeB7IB
	5/PMYI71HoDi6vJYmKNUDKeSGmy8OWQnl4iX04Z2OZcywqGYzGcX9bl+Zf0wIJKv7q/AX1WSMHb
	bbTT7putNt9pA==
X-Google-Smtp-Source: AGHT+IFyl4nb7aLaMGtdUzXIyU0STY1YFAEmOq0IFtXlV5q7PidcK3kylq3BcLuwHQTx0Q+6sFmFiA==
X-Received: by 2002:a17:907:6d18:b0:b72:a40e:d10 with SMTP id a640c23a62f3a-b73678e9c85mr194736166b.40.1763106999230;
        Thu, 13 Nov 2025 23:56:39 -0800 (PST)
Message-ID: <95c51b33-a14a-4f3e-a737-2e52aa3e475e@suse.com>
Date: Fri, 14 Nov 2025 08:56:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86: introduce "brk" allocator
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
 <7a3eb7f3-db3e-4c2f-a231-cdf05a14be26@suse.com> <aRYYP8fG9fgvGGYS@mail-itl>
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
In-Reply-To: <aRYYP8fG9fgvGGYS@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.11.2025 18:41, Marek Marczykowski-Górecki wrote:
> On Thu, Nov 13, 2025 at 12:08:18PM +0100, Jan Beulich wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/boot/brk.c
>> @@ -0,0 +1,72 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +#include <xen/efi.h>
>> +#include <xen/lib.h>
>> +#include <xen/mm.h>
>> +#include <xen/page-defs.h>
>> +
>> +#include <asm/brk.h>
>> +
>> +extern char __brk_start[];
>> +extern const char __bss_end[];
>> +
>> +static unsigned long __initdata allocated;
>> +static bool __initdata finished;
>> +
>> +void *__init brk_alloc(size_t size)
>> +{
>> +    void *ptr = __brk_start + allocated;
>> +
>> +    if ( finished )
>> +        return NULL;
>> +
>> +    /* Allocations PAGE_SIZE and up will be page-aligned. */
>> +    if ( size >= PAGE_SIZE )
>> +        allocated = ROUNDUP(allocated, PAGE_SIZE);
>> +
>> +    allocated += ROUNDUP(size, sizeof(void *));
>> +
>> +    if ( allocated > __bss_end - __brk_start )
>> +        return NULL;
>> +
>> +    return ptr;
>> +}
>> +
>> +unsigned long __init brk_get_unused_start(void)
> 
> It's a bit unintuitive for brk_get_* to have this significant side
> effect. Maybe name it brk_finalize_get_unused_start() ?

Getting too long for my taste, and a caller obtaining this value kind of
needs to understand that either what it gets back is stale the moment it
uses the result, or (for it to not be stale) no further changes (i.e.
allocations) are permitted afterwards.

>> +{
>> +    finished = true;
>> +
>> +    allocated = ROUNDUP(allocated, PAGE_SIZE);
>> +
>> +    return (unsigned long)__brk_start + allocated;
>> +}
>> +
>> +void __init brk_free_unused(void)
>> +{
>> +    unsigned long start = brk_get_unused_start(),
>> +                  end = (unsigned long)__bss_end;
>> +    unsigned int subsys;
>> +
>> +    /*
>> +     * Only xen.efi will have the symbol __subsystem__ available, and it'll
>> +     * be non-zero (10) there.  In ELF the symbol will be undefined, and
>> +     * hence zero will be loaded into the register.
>> +     */
>> +    asm ( ".weak __subsystem__; mov $__subsystem__, %0" : "=r" (subsys) );
> 
> Is this really the best way to detect xen.efi?

Well, it took me a while to figure _some_ reasonably reliable way. I'm
all ears towards better approaches.

Jan

