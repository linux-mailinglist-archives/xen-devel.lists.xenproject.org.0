Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E398C7507
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:13:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723155.1127750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Z2c-0000cA-BP; Thu, 16 May 2024 11:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723155.1127750; Thu, 16 May 2024 11:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Z2c-0000ae-86; Thu, 16 May 2024 11:12:54 +0000
Received: by outflank-mailman (input) for mailman id 723155;
 Thu, 16 May 2024 11:12:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7Z2b-0000aX-9t
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:12:53 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bf10cbd-1375-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 13:12:51 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51f12ccff5eso792411e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:12:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c322c06sm10568492a12.85.2024.05.16.04.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 04:12:50 -0700 (PDT)
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
X-Inumbo-ID: 3bf10cbd-1375-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715857970; x=1716462770; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Adhs2keN3Ebn4OSV/eDbqb4Oz5KNW04jrIJ6ap6R5wU=;
        b=EwgrkQ1mdKZSARcvrYg5GHoCNyMbWYQkgnDZvXsX0071J8IyyhOeKgYSb1TFo4Ig+9
         f7kLOa1kCM1J9FzVArovCHpd/DKJUePCUBAe/aqzpre5t0YpDDjqIBAivKMFLLN9eq/m
         KHR5sORfw/SYPOgfJuCmmje71V01SGvxWHsEnXYTEFP33+iuL6l8Lv9MUhRd91sD1Lpc
         sQIoRJiHTfmiSBDjb6nAyQXYg0N9cIy1axf6gymocMXSJsqjWQK5YIWrfNH1+KciKDoZ
         962mVnB702Emk6KwWGt05mwW04Xy8bmr3FjTcKONLxYPSZ/Q8LZCtM91gBazxKTRUxrb
         axUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715857970; x=1716462770;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Adhs2keN3Ebn4OSV/eDbqb4Oz5KNW04jrIJ6ap6R5wU=;
        b=f2+2ElCukQCaIpaXCtyDpNlSDSHH0PKDGS4QVx+qBfncb1g7pTUaCJ7mloJZcgLfv2
         vh64982zz8Lp/5XBv/FNVpXMd4fQ7yzmASMSwcZgfqapjfPxKtx81zlVOHkxW9KnY7W3
         DC5rnwlJzM+l0SVlAKTjN8if60l0jWla8kWgtGPTdF/QygUtOf6RkTOvMdzyL5tX+MzF
         tFIlWkJANcwIhoyZSY4Eml+/i8J7Qpe+GnC/+C+4bei5Af6QZCFtAVV5Ny+CRhsIPz3m
         hf6ZJW9nkPxW0V9lPCNPPiZCjMxHWb8oI/03yEZZUjWHwcXfV+BjfiQ2+5Ff4hb1gDr7
         ivog==
X-Forwarded-Encrypted: i=1; AJvYcCXXQmEROq7p1d4e5QeXUXHtu1ufH4gWljgSUzWXoD3vs1D7GLM5nkFHPDcnGXu/vnUpeybffgMieOcdyGqKb/zKlDDmIKFrI/gHmeQthm8=
X-Gm-Message-State: AOJu0YxIvnKViNTv/86oo45LdHff5HwhJpL2t2DAXUlJMDv4dx5d29E5
	DW3uo/UOOnUnYo6kYhRzp00x/FCYrMJmIrVlcv6F5LnnIEUE9uZRbvoPt5F7RQ==
X-Google-Smtp-Source: AGHT+IERJ0/GDFYbkKIqdo6yMFqTa9a8SpruvrgTiqhp1jlEDjG5PxM2TB9YWhyDfLjDJa8yqsTZGA==
X-Received: by 2002:a19:e01e:0:b0:51e:ef3f:e74d with SMTP id 2adb3069b0e04-522105847a4mr12845452e87.62.1715857970479;
        Thu, 16 May 2024 04:12:50 -0700 (PDT)
Message-ID: <a881c6a6-2c36-4e5c-8336-21cd0e14b873@suse.com>
Date: Thu, 16 May 2024 13:12:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 07/15] x86: guard cpu_has_{svm/vmx} macros with
 CONFIG_{SVM/VMX}
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <09f1336974c8fd2f788fe8e1d3ca5fee91da5a81.1715761386.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <09f1336974c8fd2f788fe8e1d3ca5fee91da5a81.1715761386.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2024 11:12, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -81,7 +81,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>  #define cpu_has_sse3            boot_cpu_has(X86_FEATURE_SSE3)
>  #define cpu_has_pclmulqdq       boot_cpu_has(X86_FEATURE_PCLMULQDQ)
>  #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
> -#define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
> +#define cpu_has_vmx             ( IS_ENABLED(CONFIG_VMX) && \
> +                                  boot_cpu_has(X86_FEATURE_VMX))
>  #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
>  #define cpu_has_ssse3           boot_cpu_has(X86_FEATURE_SSSE3)
>  #define cpu_has_fma             boot_cpu_has(X86_FEATURE_FMA)
> @@ -109,7 +110,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>  
>  /* CPUID level 0x80000001.ecx */
>  #define cpu_has_cmp_legacy      boot_cpu_has(X86_FEATURE_CMP_LEGACY)
> -#define cpu_has_svm             boot_cpu_has(X86_FEATURE_SVM)
> +#define cpu_has_svm             ( IS_ENABLED(CONFIG_SVM) && \
> +                                  boot_cpu_has(X86_FEATURE_SVM))
>  #define cpu_has_sse4a           boot_cpu_has(X86_FEATURE_SSE4A)
>  #define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
>  #define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)

Hmm, leaving aside the style issue (stray blanks after opening parentheses,
and as a result one-off indentation on the wrapped lines) I'm not really
certain we can do this. The description goes into detail why we would want
this, but it doesn't cover at all why it is safe for all present (and
ideally also future) uses. I wouldn't be surprised if we had VMX/SVM checks
just to derive further knowledge from that, without them being directly
related to the use of VMX/SVM. Take a look at calculate_hvm_max_policy(),
for example. While it looks to be okay there, it may give you an idea of
what I mean.

Things might become better separated if instead for such checks we used
host and raw CPU policies instead of cpuinfo_x86.x86_capability[]. But
that's still pretty far out, I'm afraid.

Jan

