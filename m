Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D104D8A98D9
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 13:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708249.1106954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxQA7-0007jM-IP; Thu, 18 Apr 2024 11:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708249.1106954; Thu, 18 Apr 2024 11:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxQA7-0007h2-Eb; Thu, 18 Apr 2024 11:42:43 +0000
Received: by outflank-mailman (input) for mailman id 708249;
 Thu, 18 Apr 2024 11:42:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxQA5-0007gw-LX
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 11:42:41 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c267897f-fd78-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 13:42:39 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-418c2bf2f90so4463235e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 04:42:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c155100b00418db9e4228sm2429110wmg.29.2024.04.18.04.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 04:42:38 -0700 (PDT)
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
X-Inumbo-ID: c267897f-fd78-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713440559; x=1714045359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xdMl06WuRfrxx5+fvdNURaxTH9Y2QdRVFiGXY/wb6RU=;
        b=W92ix81NtznB9O1uFHQ+1KEZxeRkO9nISHXm4hYntBkSowUBXD/OxilXi49iQyePuq
         bY4eO5LUIwoFWREsLyK2zv8p+UoMols25EYYpa/TK+7oJccLxg5LzN34j90epBT10tOg
         EpSPGVTqP5/PWF3uD6OVkG4tS5wZJQXPOgLBxDpasiaCv+7l8VRuT1xbfS+opC8U2X3z
         AbWUUuVxNKTKtXyuVTsglWHrQJLy0qqC8Rx5WCc0vzcqDOPWgka5eYAe5krHajpBrwER
         Hb5EqYNMqzIq7Yh5IhYlNwLpG3wJq6B7c1/yuBpqf7cvgSxi9xKBWt/qohkPCXEyLUEk
         MunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713440559; x=1714045359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xdMl06WuRfrxx5+fvdNURaxTH9Y2QdRVFiGXY/wb6RU=;
        b=Wim1jI3r7Soxe6zqx75PQ7PEiBt2IgSy+8Wd6Dt2AkJiOtfI46Un52PmP4RI00N3Pl
         gKkHA1JiF0O7aSQq296nxfqkCqNqc7AwdYGkQugb7xvAlB49mWwY0fCgReQY/8HLlidf
         A8ZTp281nY5v7Ogmib2ynC0fp03qQziMfpf6nq7mX+ePLA2xoRODa0iO8M6CyfuD3+DR
         rhW0GVHPsqvVe7QV7oa65k+OTbJDiR2hH3vmairbfyu97MQLKDrS9+uXUAH9GnGPewN6
         tLGVzNVSVcYvyAQpUPJ3VAnFn/eHGC2zv4iZ7vAa4EnMAKu+r3RruyVJuFxih9kcM+sZ
         CEMA==
X-Forwarded-Encrypted: i=1; AJvYcCXBoBtbaxCkLGCTyYYcxcxCq3F9ftkK5BK5MR1I0cXTpI8TMIFpvYxbR+zlNjXZFVxhtbDkYx5biPxfelXK1EJ4r8RmUbScBQ45xkfssLI=
X-Gm-Message-State: AOJu0Yx/Otzw9AUnYxOzsxWdrA0JBA6Qc+AvJczEL2wwZRBzfKw+JqDR
	p4d4AzPMEKwmMQWkWcl9iu6+HXrq0pFk+1HxkJnoYL1ZbqhfJ2t6SEsNPy4AAA==
X-Google-Smtp-Source: AGHT+IFYBXBZCiHTRHxg5dZ87vQvYcru+PmicEI/SZXJGqz/e9pplXesvg4Y0/iu7IMh40kT63gdvw==
X-Received: by 2002:a05:600c:524f:b0:415:ff48:59fc with SMTP id fc15-20020a05600c524f00b00415ff4859fcmr1632408wmb.8.1713440558959;
        Thu, 18 Apr 2024 04:42:38 -0700 (PDT)
Message-ID: <a694f56e-cc71-409a-8b9c-f47efbbb364f@suse.com>
Date: Thu, 18 Apr 2024 13:42:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 13/15] x86: wire cpu_has_{svm/vmx}_* to false when
 svm/vmx not enabled
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240416064606.3470052-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20240416064606.3470052-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2024 08:46, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/include/asm/hvm/svm/svm.h
> +++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
> @@ -38,10 +38,18 @@ extern u32 svm_feature_flags;
>  #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
>  #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
>  
> +#ifdef CONFIG_SVM
>  static inline bool cpu_has_svm_feature(unsigned int feat)
>  {
>      return svm_feature_flags & (1u << feat);
>  }
> +#else
> +static inline bool cpu_has_svm_feature(unsigned int feat)
> +{
> +    return false;
> +}
> +#endif

Already

static inline bool cpu_has_svm_feature(unsigned int feat)
{
#ifdef CONFIG_SVM
     return svm_feature_flags & (1u << feat);
#else
    return false;
#endif
}

would be less redundancy. But why not simply

static inline bool cpu_has_svm_feature(unsigned int feat)
{
     return is_ENABLED(CONFIG_SVM) && (svm_feature_flags & (1u << feat));
}

?

Jan

