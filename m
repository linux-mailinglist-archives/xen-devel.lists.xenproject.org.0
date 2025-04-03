Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FD9A7A338
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 14:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936796.1337952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0K9v-0006Iq-Kx; Thu, 03 Apr 2025 12:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936796.1337952; Thu, 03 Apr 2025 12:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0K9v-0006Ge-IL; Thu, 03 Apr 2025 12:59:03 +0000
Received: by outflank-mailman (input) for mailman id 936796;
 Thu, 03 Apr 2025 12:59:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0K9t-0006GY-P8
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 12:59:01 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68c3b882-108b-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 14:58:59 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so727014f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 05:58:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301acec9sm1726695f8f.40.2025.04.03.05.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 05:58:58 -0700 (PDT)
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
X-Inumbo-ID: 68c3b882-108b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743685139; x=1744289939; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S1QIWdaGEp2LTommQ3D6DVdTGqzR5j+T0OjAeGiVB2U=;
        b=U5CJ856ePwXRC8OSeRZfdxm5OZO/jiX/gZxJmHE20+X4I8YZSUJOGI3PPgpasS2Ms5
         YGuiOztnGXi+xTOXUCQgms3x9i1+1Iu3nqfeVVJHoQ7jL354pOEeERfesgQ1zTFiVtF4
         XsJPqULiaaRApwZfwaYOjRA9fpP8Kz18rGrcC9ahRTDLH8kvfZeLDuDckmJ7/TcVpuQl
         mFbuCm5AJvseujQLY3FSdU0Vz1MTKUjCuyO27yXeP1BJXxfkivz+O4SyQwbQlnEjjBrO
         Dq1zFGiM9wmtnJxZbj/VN0JernmszuplTYCWf8uAh11OHnlTfBDEHBZhSiv8hIT5mSYp
         m/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743685139; x=1744289939;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1QIWdaGEp2LTommQ3D6DVdTGqzR5j+T0OjAeGiVB2U=;
        b=lJq8hAIpGsEuFmbn78EIiUEGmJO1g98gHeju/n8c7lNpm6fM1cW8OnykLYWmrjhDs0
         2Xm/7PBK7Skety+buf/VK8MtRzT3KOZbO1nPtuz1ZnJyhmx/CEpHPeP2hnf9xTfoLdI+
         XFrbJlBUAS2iZasY2YYcYGTJYhJys2OJyybXlSq7xuvhRDj62cXH0hSh0Qjc4T2ki7KN
         qsBIzOHtfyv02ggB3LWZej8qYTpFVP9zcL9ZKlZMuupXqxTemv3nnbbbQT5nl9uNxEMy
         XnPWUH0I6aNVW8q2h1XS5yu6e3hKi8P9bM5e+wFwKIBoU+fAHUamdwP++9upOei9hvjf
         C9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq1p3aXhCeQ+k6qmdjz/N9cGGrkosUsj8kNE0Hf8Rgo6JTjJMcBuVK79w7e3+el28qvdJsUxDnk88=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVao2ldJVWlJCDQAzwpWI5kll+K6icsXCI7b1vNsbrpg3SvyYL
	zzpUfM0y3j7wOeeEakKHdUR+XlkJYOVOPapGFvTjca7sl7XuNXKhWq72Mw/VuQ==
X-Gm-Gg: ASbGncsdlL71C67YzUZYijLwO0w66S4gSd/AafcZ6HjE1tPRdm9r0xG7ytuI8skOQwn
	ibQjrpWmyOj0s5c0OMDBfBuzGF/mXTFhf/6KYbADL8ZSTRV37s0RD29V+kEqb0kbuEgY6uYyXeU
	EBNFe4KrmI/khikueIVRWsG3ZxjWjIlRP0sWzeDUjWh+eTCesprRob01l4b2KXPhsJNB0UfnGmd
	jZ/ZwaKvT6601wt82uCzLs/OhZx7NZsSt80AchuXj2FbwQeSMDT/zlqOdFwAcPP4oncgQOW6JIn
	D+YRIHXhClv/m5Du1LK0uhXjw5iXQz/VjAnTYByViQCZ7J4DCPCVPn2urbRzf9uNW69Dd75G7BR
	9H2Bjf3SxfHF2kxYfTyq6TExl+Vb/xw==
X-Google-Smtp-Source: AGHT+IH6CYnHHGUM/RSMVL0NvUwc1iU2iBWp/NLV31QiDMqkCHXyfZ1RgJmdT1/zmPFVr5/yP7FREA==
X-Received: by 2002:a05:6000:1acb:b0:391:212:459a with SMTP id ffacd0b85a97d-39c2f8dd8bcmr2241154f8f.22.1743685138774;
        Thu, 03 Apr 2025 05:58:58 -0700 (PDT)
Message-ID: <73b1dd32-c15e-46c4-982c-9b7a33c8785b@suse.com>
Date: Thu, 3 Apr 2025 14:58:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/amd: Add support for AMD TCE
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <6b751a400df49217defc89a19b3ac2ca33ab7690.1743683787.git.teddy.astie@vates.tech>
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
In-Reply-To: <6b751a400df49217defc89a19b3ac2ca33ab7690.1743683787.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2025 14:44, Teddy Astie wrote:
> AMD Translation Cache Extension is a flag that can be enabled in the EFER MSR to optimize
> some TLB flushes. Enable this flag if supported by hardware.
> 
> AMD Architecture Developer Manual describe this feature as follow
>> Setting this bit to 1 changes how the INVLPG, INVLPGB, and INVPCID instructions operate
>> on TLB entries. When this bit is 0, these instructions remove the target PTE from the
>> TLB as well as all upper-level table entries that are cached in the TLB, whether or not
>> they are associated with the target PTE. When this bit is set, these instructions will
>> remove the target PTE and only those upper-level entries that lead to the target PTE in
>> the page table hierarchy, leaving unrelated upper-level entries intact. This may provide
>> a performance benefit.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> RFC:
>  - is this change actually safe ?

Well, before getting here with reading I was already about to ask this very
question. It's really you who needs to prove it.

>  - should we add a tce/no-tce option to opt-in/out this feature ?

Unless we're entirely certain we got this right and didn't overlook any
corner case, perhaps better to do so.

>  - is this flag enabled at the right moment during boot ?

If (as you appear to take as a base assumption) our code is safe towards
this behavioral change, then it would be largely irrelevant when you set
the bit. So to answer this question the first point above needs sorting.


> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -114,6 +114,7 @@ static inline bool boot_cpu_has(unsigned int feat)
>  #define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
>  #define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)
>  #define cpu_has_fma4            boot_cpu_has(X86_FEATURE_FMA4)
> +#define cpu_has_tce             boot_cpu_has(X86_FEATURE_TCE)

If you add this, ...

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2008,6 +2008,13 @@ void asmlinkage __init noreturn __start_xen(void)
>      if ( cpu_has_pku )
>          set_in_cr4(X86_CR4_PKE);
>  
> +    if ( boot_cpu_has(X86_FEATURE_TCE) )

... the please also use it.

> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -372,6 +372,9 @@ void asmlinkage start_secondary(void *unused)
>  
>      microcode_update_one();
>  
> +    if ( boot_cpu_has(X86_FEATURE_TCE) )
> +        write_efer(read_efer() | EFER_TCE);

Same here. But I wonder if you couldn't set the bit in trampoline_efer.

Jan

