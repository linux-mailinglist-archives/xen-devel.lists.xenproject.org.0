Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D807284CF49
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 17:54:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677828.1054706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXlBI-0005yT-G5; Wed, 07 Feb 2024 16:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677828.1054706; Wed, 07 Feb 2024 16:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXlBI-0005vt-DL; Wed, 07 Feb 2024 16:53:52 +0000
Received: by outflank-mailman (input) for mailman id 677828;
 Wed, 07 Feb 2024 16:53:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXlBH-0005vn-OU
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 16:53:51 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77259de2-c5d9-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 17:53:49 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33b28aadb28so654914f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 08:53:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i16-20020adff310000000b003392206c808sm1839943wro.105.2024.02.07.08.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 08:53:48 -0800 (PST)
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
X-Inumbo-ID: 77259de2-c5d9-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707324829; x=1707929629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c3/xLrT3xy8FCSaEeeaE3t51L7zMLxe+7hZs/3bSXwg=;
        b=E+hyLhNjIlr+HFQJ7j71/y0ypRp45az+vkWQFZMryc54zRcLA6UTkapYDz7jLxss5w
         y+4f5nSF/pI1VYFfPgjZR9UmK0IHdZPZEOvxO5BhQeOP2BDdQCnU18JsObRRFvTYgAB0
         8KlK7UuGoFHDjFY1iV6UTSMVZyorqMS2Vh2JdHlfk7P1OJjlZeSPo4Xm/fF+//auBOqc
         Ytu6qCGYTEfnQ/Zbs+Mg8WyLfZG4cC5y2YZLBaec1JEupCCIF6AZnJbNV9H6+X6xN+AO
         iGvoSwfjbnfoX539/u6kNbmNNzQEKmowxoevQd1nXkU0FWLUewQutiQjXTcaa+hiyn5j
         qHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707324829; x=1707929629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3/xLrT3xy8FCSaEeeaE3t51L7zMLxe+7hZs/3bSXwg=;
        b=oejnxPGg+HllCd5XxbYshSYbde5MaWCliPrwpAYltQldPvPrQYburJvOKuQPGJ+8ga
         ZnfMyhaM+u3IxsBMoOxHz0TnPv4c21zOXCuMGkSSec1O8lbhbcL9gR7Sq1At345rXshZ
         w01DwdWs6EYBtoFF9FOa1vNQX6WKgE/V375GoXdoL+U8MvqDnOsO16b8YLrkoJxkO8qc
         wrJPFzKvmuOMhDIsp5Pt8yzeyU1nkSk3rkxJ7uX1GhUjotPe9S2nOsOdybxCDuTDLUZ0
         pfEyyARIIkazas3xb/asfaHZHeYVZA8UlvOqijHFZ6f4+kxXcrzBo7CWxRmdUKrfqT/3
         URHA==
X-Forwarded-Encrypted: i=1; AJvYcCWSf76tpWgKHGEUkJl9GYMgkHTfbm9LJ6LJBMkVPa5wjuvad6AaqyJRhClLt77n5lTaKkAc88RVtO6ZPetixtIxoBjlBpHds4yUCWOyC5U=
X-Gm-Message-State: AOJu0YwzzNqdMhHJn11DMzTF7X3Ax5gmqnYt8qA/GC9aFJEH8vWx2phN
	0ANq8/w6dJqR7M7mw9eb/ZAnLlrCmNPXq1v9cSskMrRxD1940wls+QDmggkviw==
X-Google-Smtp-Source: AGHT+IHE0umQRAIxhUfxJ/RV/+x9qs21FNAxdzKQj2sOvq3g+OvNq8qR+sj4HLL5jDnyl9V2FKe8Sw==
X-Received: by 2002:a5d:4a45:0:b0:33b:3a62:b0f2 with SMTP id v5-20020a5d4a45000000b0033b3a62b0f2mr4247278wrs.12.1707324828830;
        Wed, 07 Feb 2024 08:53:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0pxRAQwOSVqCKbBVHzZzqWb3c7/5K4UAQHvRcb4N2uq0jBnpmA64O06dDIm3vYkJ7L3efVDI68t9sNnDOUGtPeIwp5j5cRaeERTaXetyvY8yZHYGIHXIC9GS+vDsVs9grCs1KkgutnxD8nnXJu2CSv0m5Qrwh46dpKFEWA2PWV8ff0TBxgK0HlkL4T/GG+pUMWwtZ6MfHR7NZMjp9K3XXL7CecTHUm2/5zcw+E7LaVfBm
Message-ID: <67fb6859-1306-4000-8b4c-fddd505ead6a@suse.com>
Date: Wed, 7 Feb 2024 17:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/9] x86/smp: move stack_base to cpu_data
Content-Language: en-US
To: Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <70e3b7c84a69a7ec52b3ed6314395165c281734c.1699982111.git.krystian.hebel@3mdeb.com>
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
In-Reply-To: <70e3b7c84a69a7ec52b3ed6314395165c281734c.1699982111.git.krystian.hebel@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2023 18:50, Krystian Hebel wrote:
> --- a/xen/arch/x86/boot/x86_64.S
> +++ b/xen/arch/x86/boot/x86_64.S
> @@ -33,9 +33,8 @@ ENTRY(__high_start)
>          cmp     %esp, CPUINFO_X86_apicid(%rcx)
>          jne     1b
>  
> -        /* %eax is now Xen CPU index. */
> -        lea     stack_base(%rip), %rcx
> -        mov     (%rcx, %rax, 8), %rsp
> +        /* %rcx is now cpu_data[cpu], read stack base from it. */
> +        mov     CPUINFO_X86_stack_base(%rcx), %rsp

Looks like you're not using the value in %eax anymore? If so, respective
code would want dropping. Which in turn again raises the question that
Julien already put up: By re-ordering the series, can't you avoid
altering the same code multiple times, in part even removing in a later
patch what an earlier one added?

That said, I remain unconvinced that ...

> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -37,6 +37,7 @@ struct cpuinfo_x86 {
>      unsigned int phys_proc_id;         /* package ID of each logical CPU */
>      unsigned int cpu_core_id;          /* core ID of each logical CPU */
>      unsigned int compute_unit_id;      /* AMD compute unit ID of each logical CPU */
> +    void *stack_base;
>      unsigned short x86_clflush_size;
>  } __cacheline_aligned;

... this is a good place for the new data: As indicated before, it
doesn't fit (in nature) with everything else in this struct.

Additionally no matter where the data is put, I'd wonder if it
wouldn't better be const void *. You don't mean to ever write
through it, I suppose.

> @@ -1156,7 +1156,8 @@ void __init smp_prepare_cpus(void)
>      boot_cpu_physical_apicid = get_apic_id();
>      cpu_physical_id(0) = boot_cpu_physical_apicid;
>  
> -    stack_base[0] = (void *)((unsigned long)stack_start & ~(STACK_SIZE - 1));
> +    cpu_data[0].stack_base = (void *)
> +             ((unsigned long)stack_start & ~(STACK_SIZE - 1));

Nit: Too deep indentation. Each indentation level is 4 spaces. I also
think the cast would then also want to move on the 2nd line, such that
(see again ./CODING_STYLE) the assignment operator is last on the 1st
line.

Jan

