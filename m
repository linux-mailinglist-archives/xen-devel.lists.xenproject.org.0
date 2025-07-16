Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432DCB07752
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 15:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045223.1415334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2UU-0004zb-2U; Wed, 16 Jul 2025 13:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045223.1415334; Wed, 16 Jul 2025 13:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2UT-0004x4-W4; Wed, 16 Jul 2025 13:48:09 +0000
Received: by outflank-mailman (input) for mailman id 1045223;
 Wed, 16 Jul 2025 13:48:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc2US-0004wy-3r
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 13:48:08 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fedea4e-624b-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 15:48:05 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so623320f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 06:48:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4333e6csm130158455ad.162.2025.07.16.06.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 06:48:04 -0700 (PDT)
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
X-Inumbo-ID: 7fedea4e-624b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752673685; x=1753278485; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wiC18QX+BPP+7v1u2bwaxEeuoSiLuXdMHqwx5GPEAig=;
        b=ShFBC+TogfRnhV0cMYl1edZmBs9xDOI2T8q1y463MgJyrq/bbn0+Q6+lYfDshU+j7Q
         H+Byul9pQM+IYBtVmkGDNV/+rimIMcGLAlHQ7WnEHkBEFEJtVpxHir1k7i3ybqcuq/9i
         Q6+3/Msyt2XymRh52W8iA2b5ay0kbWfJfFFlMwXE3SX3BqCh2HkB3ioyGC9+f4NUqtW2
         ud0xYqR5R928mPopgXIBsIo2JUShtdjsCoTOJgfn07yyzA/MV88vHirLaptAMiI2UPid
         Gb3LCl410kXIoR2rG9AVNbEOMTcJLnSThRoWx5SS8kSoHYoJnnaMq86FfaosCUteJHtg
         o/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752673685; x=1753278485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiC18QX+BPP+7v1u2bwaxEeuoSiLuXdMHqwx5GPEAig=;
        b=wTpL+7yxjhGJzlwtwfXOIoZ2q+0qAZgE9uRxOaIhRQYkpkFZafXUC3kS/kkt7ThkgA
         Rjk1oSOyQG3xPa9A9bVF70nzOAVjzf9QD+oHXK2TMx+R96GbMD6q4XYfuws6onFvrOUh
         KVmPNXp8+DY5giRgHqK/KZvjz1y9ftUQRR6+nz9aIKfXgy6pnNPmXuo2n+rfQFu/OGkV
         FAPQpcfoD1QCZd+0pbh9NjTLr//jMq32/Oe1PYMfHxrw35j4UeDBoyEsDYGPeg10jQN8
         FljFgNnQ0WxQtLbNlVcBYMM+SnJqPPIFFMyMOPR/aLwnzg2JAtuJ0rvHY1wPVqg72v73
         o8zA==
X-Forwarded-Encrypted: i=1; AJvYcCVKT+v12m+9w+QHRpmGsmLupCefGpS63xmPaTgR4/jULhQ89au2NT0yx+KU31j95HkR4HjeEhVEZWY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKq42np+ERvEQeZ2jb77I+4FceHOD3XKLv+H2XkDH0zOZCnTLz
	HoJhibBSRMs+7ZfMMUNAJCg04UaB3dOaqjDkFdczc5cQD/U+s//a9FsXO8dyLEXbRg==
X-Gm-Gg: ASbGnct2fCSjMSJTFMP1iuPWBJgmwN7tgXxuxA610N/RlXCLst9PCw+VtaxE6bT7l/x
	f1uysY1lDu8+2VLhme1m/vYN33I98om7MsmRH6EUgw5JHTgLdzaVGM4OgBjY6MsXfg9ARxD4njb
	ttfKcAFVB1EeOxwIB+mbKH9OEppE2Z0HYfhU3qfsfm+VHqBsFMee29UUaBA3bGQFGy5B/BmhD5Y
	jvUkPjmkOX2A5zcMHu6ebMgW5mIKjj7ZPWLooBwtEzm7VWjOBEzE3XuBZ/iqFt0/iwJl4F7sCaN
	HaJV/zmsE5U+VqsKZZkk8yuiFk+IgK9/8LlKf4QjCC+ggKnbTQipzZKAl5SVdJAkTeowTQWKnLx
	CsXciLrZAyDL1HncGmhmPc+lzgNO/+N7INnG6Ghg5VvKBvLIqhJPHNgQq6Y/bLlYqAIoC5PuX72
	iN89BV4jE=
X-Google-Smtp-Source: AGHT+IFFtm7N/cjKo75sy2LZpGWHK/S/sZb+V31xGtd6uAHmqKa1Mv1NUntacuNtZyQ0bEVn+6TNvg==
X-Received: by 2002:a05:6000:2909:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3b60953af17mr6142604f8f.18.1752673685088;
        Wed, 16 Jul 2025 06:48:05 -0700 (PDT)
Message-ID: <9feece5c-4ca7-42b5-b41f-6d9843e07c21@suse.com>
Date: Wed, 16 Jul 2025 15:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86: Rearrange struct cpuinfo_x86 to introduce a vfm
 field
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716132843.2086965-1-andrew.cooper3@citrix.com>
 <20250716132843.2086965-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250716132843.2086965-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 15:28, Andrew Cooper wrote:
> Intel have run out of model space in Family 6 and will start using Family 19
> starting with Diamond Rapids.  Xen, like Linux, has model checking logic which
> will malfunction owing to bad assumptions about the family field.
> 
> Reorder the family, vendor and model fields so they can be accessed together
> as a single vfm field.
> 
> As we're cleaning up the logic, take the opportunity to introduce better
> names, dropping the x86 prefix.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

In principle
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Two remarks, though:

> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -20,10 +20,30 @@
>  #ifndef __ASSEMBLY__
>  
>  struct cpuinfo_x86 {
> -    unsigned char x86;                 /* CPU family */
> -    unsigned char x86_vendor;          /* CPU vendor */
> -    unsigned char x86_model;
> -    unsigned char x86_mask;
> +    /* TODO: Phase out the x86 prefixed names. */
> +    union {
> +        struct {
> +            union {
> +                uint8_t x86_model;
> +                uint8_t model;
> +            };
> +            union {
> +                uint8_t x86;
> +                uint8_t family;
> +            };
> +            union {
> +                uint8_t x86_vendor;
> +                uint8_t vendor;
> +            };
> +            uint8_t _rsvd;

Can we perhaps name this e.g. _zero, so it's clear that it cannot be
repurposed?

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -178,7 +178,9 @@ void *stack_start = cpu0_stack + STACK_SIZE - sizeof(struct cpu_info);
>  /* Used by the boot asm and EFI to stash the multiboot_info paddr. */
>  unsigned int __initdata multiboot_ptr;
>  
> -struct cpuinfo_x86 __read_mostly boot_cpu_data = { 0, 0, 0, 0, -1 };
> +struct cpuinfo_x86 __read_mostly boot_cpu_data = {
> +    .cpuid_level = -1,
> +};

So you retain the bogus setting of this field. Would you mind taking a
look at [1], one of the many things that I never heard back on? I'm
deliberately purging that non-sense there as a (side-)effect. Plus
really I'm getting tired of having to re-base my long-pending changes
over ones you are helped getting in pretty quickly. No matter that this
one's going to be one of the easy ones (I hope).

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2024-02/msg00726.html

