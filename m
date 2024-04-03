Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F288896C5C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:29:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700427.1093598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxr8-0007E0-HR; Wed, 03 Apr 2024 10:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700427.1093598; Wed, 03 Apr 2024 10:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxr8-0007CK-DW; Wed, 03 Apr 2024 10:28:34 +0000
Received: by outflank-mailman (input) for mailman id 700427;
 Wed, 03 Apr 2024 10:28:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrxr7-0007CE-DL
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:28:33 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb78be13-f1a4-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 12:28:32 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-415446af364so4508255e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:28:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 je14-20020a05600c1f8e00b00414887d9329sm21035000wmb.46.2024.04.03.03.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 03:28:31 -0700 (PDT)
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
X-Inumbo-ID: eb78be13-f1a4-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712140112; x=1712744912; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u7KPOAEjE2s4I8YgVgYnndw4CobOf/M7qttYHxgRVlU=;
        b=NsdMQ5qpeRZCdW6XrZiDNA3bnWXPeicXN8G7diM0QR+B2Opv2kDd2PWyb4VoPjLtCB
         +LA8oSzQd2Ac5noKD+exybGIwerMOJhKFSHiRI3nlRKSinW3/YTZeC/7gIODJl/yBj2q
         QU9TSVoXLd/rE+mP88R4fghYt8ft+44XfdzzGayB636gSStol6mETLIcd9QANjvqz19B
         KlwY+jtj6cfo/PXZl+niuLR7b0dW+2C/MQ/RDbX3sWU8WTAgDMiD0cH6rGcodjBUlVZw
         I8d+r5gDfQZ6b1ju3aqa1KBHI+2SCkA2D0Lyu1gQdlZadgJCWr92w4zMl19r1Db4cn12
         rhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712140112; x=1712744912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7KPOAEjE2s4I8YgVgYnndw4CobOf/M7qttYHxgRVlU=;
        b=xRYKPk+wA/4/U2I+y3UUbFJcSLqxjm4YUk/VyJiD0eMYzAyB8LzGNyyQvZLva1AAnU
         eqmSV7ogUc6IdzTZHDTjNXbKcnDsP3P2i5uJsvwz5px8spNHpUgQmBa+9AVyM1n+P0yq
         QIvN6IrvmqOToeOlirhPwWEoDTNx2AI+Kbl8tRkt3jdWseop00qpPtuPV9bH2ygpziLB
         DkLteDEB25TG3e3BAd7t52xD4643+Vn6nYWW9rD3loiVoMGA1m8j+GF0U9G8LqLfXrtG
         bOz8AWC9KgqYGTlJuLE6jKeVjfdCXd1GkzoYRdCHAkmHWXxtVyj+vgUKk4TM6i1q1zBe
         FSFg==
X-Forwarded-Encrypted: i=1; AJvYcCVLsSfZmuPCireGj6nAgGeEy3vujGjSkTMCQdaMspjQXxmyfrcaQe6vrFlgLLDr2qd7rQNduyXPQhtelGDEeNN/SRzS8YqjxF7CcL9E7OY=
X-Gm-Message-State: AOJu0YwL6GHwMz4npQ6NG2KBnebqLppoqC1pIpQM73SlnVZM9A2x4Mvq
	5Y/U5zORUNl2C9vZq4fXO9jl+Fho6whQo9KCSOZdKDqN3f5L2ANggg6pwqGn3g==
X-Google-Smtp-Source: AGHT+IHILVhw/zW3KP880Gy7L3lmgT2mexJzvE6Q2KI9sbnIyB7sQU6OVLFY6KUvOZf6vNvLMpYqaw==
X-Received: by 2002:a05:600c:1c19:b0:414:8f85:6e50 with SMTP id j25-20020a05600c1c1900b004148f856e50mr1867451wms.19.1712140111898;
        Wed, 03 Apr 2024 03:28:31 -0700 (PDT)
Message-ID: <e3da3546-f2a7-4eab-b157-51b6570dcbf9@suse.com>
Date: Wed, 3 Apr 2024 12:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/19] xen/riscv: disable unnecessary configs
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <c2ba247adce76c69ecd6400d791db36495b85b75.1712137031.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c2ba247adce76c69ecd6400d791db36495b85b75.1712137031.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 12:19, Oleksii Kurochko wrote:
> This patch disables unnecessary configs for two cases:
> 1. By utilizing EXTRA_FIXED_RANDCONFIG for randconfig builds (GitLab CI jobs).
> 2. By using tiny64_defconfig for non-randconfig builds.
> 
> Only configs which lead to compilation issues were disabled.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V7:
>  - Disable only configs which cause compilation issues.

Since the description doesn't go into details: While I can see that
PERF_COUNTERS and LIVEPATCH may require (a little / some more) extra
work, are HYPFS, ARGO, and XSM really causing issues?

> --- a/xen/arch/riscv/configs/tiny64_defconfig
> +++ b/xen/arch/riscv/configs/tiny64_defconfig
> @@ -1,12 +1,11 @@
> -# CONFIG_SCHED_CREDIT is not set
> -# CONFIG_SCHED_RTDS is not set
> -# CONFIG_SCHED_NULL is not set
> -# CONFIG_SCHED_ARINC653 is not set
> -# CONFIG_TRACEBUFFER is not set
>  # CONFIG_HYPFS is not set
>  # CONFIG_GRANT_TABLE is not set
> -# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
>  # CONFIG_MEM_ACCESS is not set
> +# CONFIG_ARGO is not set
> +# CONFIG_PERF_COUNTERS is not set
> +# CONFIG_COVERAGE is not set
> +# CONFIG_LIVEPATCH is not set
> +# CONFIG_XSM is not set
>  
>  CONFIG_RISCV_64=y
>  CONFIG_DEBUG=y

The description also says nothing about the items being removed.

Jan

