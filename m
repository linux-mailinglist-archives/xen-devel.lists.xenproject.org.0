Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C8F8B760F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 14:46:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714804.1116120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mrq-0004iE-B8; Tue, 30 Apr 2024 12:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714804.1116120; Tue, 30 Apr 2024 12:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mrq-0004fj-7w; Tue, 30 Apr 2024 12:45:54 +0000
Received: by outflank-mailman (input) for mailman id 714804;
 Tue, 30 Apr 2024 12:45:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1mro-0004fd-DT
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 12:45:52 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 927002fa-06ef-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 14:45:50 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41bca450fa3so24733555e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 05:45:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b0041b434e5869sm19907252wmq.43.2024.04.30.05.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 05:45:48 -0700 (PDT)
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
X-Inumbo-ID: 927002fa-06ef-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714481149; x=1715085949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fn8AdUIIW+67qtzypSNmCQ57THGG9csKI8vw90VjI/k=;
        b=LZVZXLGgYs9nSVL+O0SBUefsOLtx0zzdVYFhSpouNTq9FQeZOeBbarGZ9z7PzNnYDB
         N6UJoCezHG6HWE3fLw393G3kdRd6ER5S7qPmCGiPiDuhFHTk3ESDjetb1oa3Fs9RO4Kp
         +YuXcF1DsCrXUl3Hl61yfwck/BJAEicKucXyWgb2HPidjlTw9Iu2+IfyPlNrotTTq0Lg
         hYIVeld/fwtQ+3kEyRJb2hk8jwHWk1r81hv9LtxZ76t23XdXDvGaM2QSi1Gj1DrvwCN3
         pAR9c90cDBCOBD6h8Yu4GHMaKVfx4YhGUfy7E9iB4mEp8+i4OV7UZbvgV+BiUeo5J+jl
         RqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481149; x=1715085949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fn8AdUIIW+67qtzypSNmCQ57THGG9csKI8vw90VjI/k=;
        b=xIrLjWJFf4vybvGwinArae15x8rlFU5pWAeVfwpB9uzqobq7mTdr9LoYLpOS2HkLbz
         WQlOEeoyTYVZLC+2pFAIxtEJNsbvFMfP5sxV3M1ULj/LV3l+BQPv8C3hp+En3/LvSxCJ
         wsTOcTlzVaFjj9fhwzlp/nwAChp0bBqlgNT/KRv/M1h5LYO6/MrZjZbh42o4Ob0UCJ1S
         Gazx/D9PCMgQHvzJqntmF7NXtdOnfisaTY3qk1uOOuKrSB6FDPrfYMPMlheb8YiAgpK1
         Jv6Z751Yhagu4vUztXgke1qQPI/7ozwAorW5UbQ+IoGS5thTgvkaCqB6bdVu5epZP8B1
         74tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbiVIutUoZr4Yc5yxE/EKS4MAbMRgxQ6f24dsm5xonwGA8LeCzwO6E2veaDjOj0GnBHu1DrgARLKBGpfchaKVZM8rYId+srSVHPVvgsIw=
X-Gm-Message-State: AOJu0YyuIJUFfDZuDb7I1ix1kF1AnO4Ox1mHzO6/s/LpI6sBBaiIQxvc
	ch+yx/8kerTjz0X/ZuHXxwF1jgqTRdnyqaDOKY0Et59lJQOQn6zFh306BHamtA==
X-Google-Smtp-Source: AGHT+IGCjS2vXVMycPlAz/ruD2zhYG9nhbbWw55kjLXYVeVWFSER/hqR/diVBZz8dmPmT/au+0+Yow==
X-Received: by 2002:a05:600c:501f:b0:41b:b884:f151 with SMTP id n31-20020a05600c501f00b0041bb884f151mr2070405wmr.34.1714481149058;
        Tue, 30 Apr 2024 05:45:49 -0700 (PDT)
Message-ID: <766b178a-5e32-437f-ac02-4cb9ad8cb248@suse.com>
Date: Tue, 30 Apr 2024 14:45:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/cpu-policy: Infrastructure for the AMD SVM and
 SEV leaves
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrei Semenov <andrei.semenov@vates.fr>,
 Vaishali Thakkar <vaishali.thakkar@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240429151625.977884-1-andrew.cooper3@citrix.com>
 <20240429151625.977884-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240429151625.977884-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2024 17:16, Andrew Cooper wrote:
> Allocate two new feature leaves, and extend cpu_policy with the non-feature
> fields too.
> 
> The CPUID dependency between the SVM bit on the whole SVM leaf is
> intentionally deferred, to avoid transiently breaking nested virt.

In reply to this I meant to ask that you at least add those dependencies in
commented-out form, such that from looking at gen-cpuid.py it becomes clear
they're intentionally omitted. But you don't add feature identifiers either,
making dependencies impossible to express. Maybe this sentence was really
meant for another of the patches? (Then my request would actually apply
there.)

> @@ -296,7 +298,16 @@ struct cpu_policy
>              uint32_t /* d */:32;
>  
>              uint64_t :64, :64; /* Leaf 0x80000009. */
> -            uint64_t :64, :64; /* Leaf 0x8000000a - SVM rev and features. */
> +
> +            /* Leaf 0x8000000a - SVM rev and features. */
> +            uint8_t svm_rev, :8, :8, :8;
> +            uint32_t /* b */ :32;
> +            uint32_t nr_asids;

According to the doc I'm looking at it is %ebx which holds the number of
ASIDs and %ecx is reserved. With that adjusted
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

