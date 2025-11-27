Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB750C8D733
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 10:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173603.1498624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOY2G-00055c-PQ; Thu, 27 Nov 2025 09:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173603.1498624; Thu, 27 Nov 2025 09:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOY2G-00052E-Mc; Thu, 27 Nov 2025 09:11:32 +0000
Received: by outflank-mailman (input) for mailman id 1173603;
 Thu, 27 Nov 2025 09:11:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOY2E-000525-Ng
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 09:11:30 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e72fd5f-cb71-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 10:11:28 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47778b23f64so3297215e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 01:11:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791165b1fesm20266235e9.15.2025.11.27.01.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 01:11:25 -0800 (PST)
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
X-Inumbo-ID: 0e72fd5f-cb71-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764234688; x=1764839488; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RxkrbZOrTNl+hjOp2sbXJ0ecd4hzqExMAY28zRo/5Oc=;
        b=MrwjebDp8iFK00MOM3xqwD3Yhix7QjwO3Nl8FFUBN6uL1KQZfKcAFmcquPLJDwiojl
         nkJqSnQ7J/5n5mwctzgC6BONbYgUJTjn9o/cO8FYkShEbo5XlMLMhK4VHurFmMYb3fag
         8upGEMe5ndV8nesfhPy2O5jtd7GRadkUBJ/jvE4lVo08Z6Vl7tCdb8nCajgU9DT5aOh/
         pco1fVmEfg712o/X/z+14yCNuhNVJ7K3OKG3bV3t7Nswi3HbiEc8FNpO2Dkd1A4WxBNY
         xwh+GrhNxT0DuBcvZCfT5rxRTjiQOXEiV+52HyTnPp2ulVAoCcMgGgoy2o0ijn2lgGmK
         ejQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764234688; x=1764839488;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxkrbZOrTNl+hjOp2sbXJ0ecd4hzqExMAY28zRo/5Oc=;
        b=mkYRUSija7K9wKM1jOE3Dk6UyyHmWPEzvigu5wandyx4rrmn0SkZpASyW3tVYjxlqd
         ytocErEhvS7RYL6xfXa+DcMcRKtqUEj46nFqvklFddMebCxKw5MCGoyHjvaRaIpvJl69
         I2n2ck5N9tZanFtQUG/DYk9YqKqfD+n4zKtyaLO7sKbbE4Wk/jjfHjUgjGHNqlereBij
         kKL4yA7JAPba4GKyT5C6A9Znu2LkA36HVb5NbA0i39uXqrMu4o+hBKhzNRJarxz20SGa
         Km5LJNXWSw0eMECCO0/4ONt+DumCV1FepZowsrP6oW+bJWfNkGAhMeUdbQDBhEAwBTiM
         fFUA==
X-Forwarded-Encrypted: i=1; AJvYcCV5WHyezRtTRXZedaPuoJeQHDFKKtMQbAYJhNmxdLaULCClTU3VzBZNZUrwK3zg7jOEpILmMgHSUIU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywj36s6gz12gNpUFFG6hXoIcGYUOmd0IIRN7Rm+nqR9BI1qqdZz
	7aQebWN0PHH3Dtg9wQxGNRVi2rUNH9w/+5zMjqTmWhe0T2l3iZZCeYEJ2oGS60QuAg==
X-Gm-Gg: ASbGncuoE27yZds1BNZ/P2OeqyxQBXe8OkrDPHYV2S5MGXJIdtzvvbW08jPkyei8tXD
	C0x9SdXhNIcRW8pLkHLHHJcY5fQYM9UnyiDbmGD1ZlGKchYZ3aMjzOuaYc9mEp/+jm/YGnPUiWW
	agm/MasEjATGJkJi9OEYYWVsk0Nv6qLdjnp8NUHbQCIBaTGdYjxlTutiDlRtb/xYzMitA740KbH
	iwOe2tvASduXxcqu3YtptQCOnjPWXIEZTXIabybToMLYU2aNguTCSPXg4u5md+qpJsygcrACG+m
	SS0+IorNers6kZ3/BUEbY174MP2q9Z9kU7oo7Sxi0AyVhlETNGh9lsLj5wu3wCXvvhz7G5M8vg1
	LDw3+oDZ60RK+oyT7Wf4zZvWYy6ixNn11zaV3Fm9BOtLOPqvxv8PpqhXadyxGYGcUoQZPZsHd9f
	UOJGZyGdIw57Xbbeg/yXo4I1qGdnZmN6aYMUNHZJdHz1/EQiim084q8ygEK2bobYBoqpGVh/u+m
	jEFpAZ4h25Y4g==
X-Google-Smtp-Source: AGHT+IFcQm4dqtZe5NYAJatlIxIz9NGXqtk7Br/er8kzPhO/+QoAKJNqSnZN589kaYr1Dh6WB2WZJw==
X-Received: by 2002:a05:600c:19ca:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-477c1143073mr214542645e9.22.1764234687802;
        Thu, 27 Nov 2025 01:11:27 -0800 (PST)
Message-ID: <abaa055e-9ac4-4272-b348-a58f181fe719@suse.com>
Date: Thu, 27 Nov 2025 10:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251126204331.3395888-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251126204331.3395888-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 21:43, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The d->arch.physaddr_bitsize field is used only by PV32 code, so:
> 
> - move domain_set_alloc_bitsize() function into PV32 code and clean up
> unused domain_set_alloc_bitsize() defines from other arches
> 
> - move domain_clamp_alloc_bitsize() function into PV32 code,
> rename to _domain_clamp_alloc_bitsize() and use generic
> domain_clamp_alloc_bitsize() define instead, clean up
> domain_clamp_alloc_bitsize() defines from !X86 arches
> 
> - move d->arch.physaddr_bitsize field under PV32 ifdef
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>  xen/arch/arm/include/asm/mm.h     |  3 ---
>  xen/arch/ppc/include/asm/mm.h     |  3 ---

As I noticed only by getting a mail delivery failure back - please also be sure
your submissions are up-to-date wrt ./MAINTAINERS: You meant to Cc Timothy for
PPC, not Shawn.

Jan

>  xen/arch/riscv/include/asm/mm.h   |  3 ---
>  xen/arch/x86/include/asm/domain.h |  2 +-
>  xen/arch/x86/include/asm/mm.h     | 10 +++++++---
>  xen/arch/x86/pv/dom0_build.c      |  2 ++
>  xen/arch/x86/pv/domain.c          | 21 +++++++++++++++++++++
>  xen/arch/x86/x86_64/mm.c          | 20 --------------------
>  xen/include/xen/mm.h              |  4 ++++
>  9 files changed, 35 insertions(+), 33 deletions(-)

