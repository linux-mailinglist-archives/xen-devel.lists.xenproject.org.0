Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B522C9115F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 09:05:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174550.1499504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOtTH-00058H-Cq; Fri, 28 Nov 2025 08:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174550.1499504; Fri, 28 Nov 2025 08:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOtTH-00056I-A3; Fri, 28 Nov 2025 08:04:51 +0000
Received: by outflank-mailman (input) for mailman id 1174550;
 Fri, 28 Nov 2025 08:04:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOtTG-00056C-6l
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 08:04:50 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9105f85-cc30-11f0-9d18-b5c5bf9af7f9;
 Fri, 28 Nov 2025 09:04:49 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-429c4c65485so1447373f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 00:04:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1caae37esm8058836f8f.40.2025.11.28.00.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Nov 2025 00:04:48 -0800 (PST)
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
X-Inumbo-ID: e9105f85-cc30-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764317088; x=1764921888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uoaCCBxAunUz+Ff0x9WkyuJGzpo8rV+VKsYcW0KmRNU=;
        b=cxCNgbd1/CT79dXSQAtdiM8bEvicJGVGEY1W6+fnniDK71wga1sB2JH0Hmi37we+CK
         GAz2Blyuwk4rjTMufg+fU0r05gDzFXT9Sp3OXI4UDXPsZJNUph+qPuApw5kkARuHFwmB
         waQoYAUvyY10yg/ut8FO/FYeHGGkANrBxRKn+0v+MqvzcMF9WmrSttXBGS1oL0CuFM+H
         ZClzv6F6YWbnV6hHUOj4Fi3J4RhKESIvlndsYfnCTCqr+3ekpJQatOq4R8ed/VyAtYyK
         TlILru4kjF8Pwpjku691KW05GPC6ZnVPnQt3bBYx4Hi9WNApt+thS4aNrt9OpgUk8QHP
         ldGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764317088; x=1764921888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoaCCBxAunUz+Ff0x9WkyuJGzpo8rV+VKsYcW0KmRNU=;
        b=mNYSKSw8yp9bSt0JVLjYLs3UFITThkVkVhGzXEHk0LDl97XRYxK7GtGHRXzxguvalP
         CpjuXTRIf7/9aP8R0pzvekYHQVvbm8Wxlp8S2UQPhOj8EoK/tTbB6Q+AWc0WnsCrI3JI
         mp5b3Cmg30n+WmwD7lL4d8w5WwiBzx0vZYwSeenG1El93AC/xp1dRtul0w8pMZ/72LL7
         S1brlzMcLSrL33EgezOY9XbNW1oxO58/4u6ZbzU7Yehn2g0rPIhwcdFrbbRzAB6HtEYz
         nB+xSakZbpIkMRgysfVMKT3KuIb5vRMjrYXQkjKgNMForM/i8SGKG1YlOpY7nyjZN2ZI
         Hv9w==
X-Gm-Message-State: AOJu0YyuUFIvhh0TPyeyxDd05SneKBA0clesDxU7nefd5+KVLycpNYa9
	UmLueMsvNsJfcWywGllAYRjIzkYf+B+C0vHbOtIXOjePveUxzGFY04xertVVFOpnWg==
X-Gm-Gg: ASbGncvYbNvHS80sjHns++S/BXzeeNWSiEoCeLLQBWwRPZXI+tENs5/vgp2JIn/JsJ/
	hnCLxJ4inMG07RZalKDJdCBV5imVdyc1LFFZz9nkc0dYoFw1akAkbKRHUIlhDyktzQh8ydXFDAe
	L3rGJsx7Ko4jeyyQbJ+fnRJth34x8w8z4c48EGbB2kHKAUo5lnw4/1lVGSFe0v/89hI2QA6zaQx
	O1kAPtGYmGhyij3mxhNRJDNNn3PJ3lyK0GoVSwuqtgfI1WMliiq0n1pwmy+ihRgHrm5kLQW0KPM
	3p3x487rAtyMDrjQC3JswQm6h025EtPutNo5BDjyOgXBI+FEnA9Z0rYcgoaaSM01P4x0pP/GQ61
	NWrsiHPEk6Hq/hWZpBoK8Hqq7EHeURuc+f0qRVAPPbPmkLeuVrIj6k+06qb7FhCdrze0C0Bo3IV
	xVwvTXaQ04P7ekyDVt5pIlAY6nYIyqlKBo+l5ql8uFW8di8IotDFbUG56CtLoYpH17O+PfXfO/P
	rQ=
X-Google-Smtp-Source: AGHT+IFGtF4/5lulyT0AcluOEjftvXQRRTfKrZ32tRYHzY8NuQH2ZHz5Ob/EIWEud3EIlfppLR8cIg==
X-Received: by 2002:a05:6000:2203:b0:42b:32c3:392a with SMTP id ffacd0b85a97d-42cc1cedad0mr29521123f8f.20.1764317088491;
        Fri, 28 Nov 2025 00:04:48 -0800 (PST)
Message-ID: <4fb39b1a-797b-4910-aa63-03a5f08031bf@suse.com>
Date: Fri, 28 Nov 2025 09:04:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Grygorii Strashko <grygorii_strashko@epam.com>
References: <20251127221244.3747918-1-grygorii_strashko@epam.com>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
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
In-Reply-To: <20251127221244.3747918-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2025 23:12, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> 1) arm/ppc/riscv: drop unused domain_set_alloc_bitsize() macro
> 2) add generic domain_clamp_alloc_bitsize() macro and clean up !x86 arches
> 3) move d->arch.physaddr_bitsize field handling to pv32 code
> 
> changes in v2:
> - split on 3 patches
> - move physaddr_bitsize in struct pv_domain
> - make minimal style adjustments as requested
> 
> Grygorii Strashko (3):
>   arm/ppc/riscv: drop unused domain_set_alloc_bitsize() macro
>   xen/mm: add generic domain_clamp_alloc_bitsize() macro

As I'm happy with these two being separate:
Acked-by: Jan Beulich <jbeulich@suse.com>

But of course Andrew's objection needs dealing with before they can go in. And
as he said, at least Arm maintainers need Cc-ing for them to actually be aware
that their ack is going to be needed.

Jan

>   xen/x86: move d->arch.physaddr_bitsize field handling to pv32
> 
>  xen/arch/arm/include/asm/mm.h     |  3 ---
>  xen/arch/ppc/include/asm/mm.h     |  3 ---
>  xen/arch/riscv/include/asm/mm.h   |  3 ---
>  xen/arch/x86/include/asm/domain.h |  8 +++++---
>  xen/arch/x86/include/asm/mm.h     |  7 +++++--
>  xen/arch/x86/pv/dom0_build.c      |  6 ++++--
>  xen/arch/x86/pv/domain.c          | 23 +++++++++++++++++++++++
>  xen/arch/x86/x86_64/mm.c          | 20 --------------------
>  xen/include/xen/mm.h              |  4 ++++
>  9 files changed, 41 insertions(+), 36 deletions(-)
> 


