Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB11989C73
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 10:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807088.1218296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBaj-0007zB-7g; Mon, 30 Sep 2024 08:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807088.1218296; Mon, 30 Sep 2024 08:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBaj-0007xP-4h; Mon, 30 Sep 2024 08:17:13 +0000
Received: by outflank-mailman (input) for mailman id 807088;
 Mon, 30 Sep 2024 08:17:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svBai-0007xH-DG
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 08:17:12 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63bc27b1-7f04-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 10:17:10 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a90349aa7e5so604458666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 01:17:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2947fdfsm489415566b.102.2024.09.30.01.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 01:17:09 -0700 (PDT)
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
X-Inumbo-ID: 63bc27b1-7f04-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727684230; x=1728289030; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QfWezRIiPZUQw3/LeJubTZ7b1n+hqdCekRErPBEMroc=;
        b=CzJ2AnYnE7q3WvcKO8SxWqR0xmKBln54q2S8O5z4DhatTkrWdeEbTDiDytIJFBIgmz
         kc/Cgddul4KRIhpoegyO+bSGKa4R4bgHVw2hptTwZiRYOFee/3Cge6JQIu7f+GxbSv6A
         o7SIqg63d1f+iI3piNdmBGw0nvYe7L2uZ6fG4o0CnDa/U3WT3CwCERH5Evg8nSRezyQ2
         8IwR1LRPpi/EsnQ3BbFaoyaYJXhmlA8RlEHvnuNhuwaOgmn0+F80GN7KsOZE6QinYgNH
         ejrlf0QqvA/HVi6fLvR/TXPPHMHHNtZ4CjHF0xaIwcDhBSSFGyQ6mU+N7ReK4UqvbR0i
         Xxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727684230; x=1728289030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfWezRIiPZUQw3/LeJubTZ7b1n+hqdCekRErPBEMroc=;
        b=YN/Tpn7UpZHi/9ujNtD7ATk126UarAPCaZ2x9OHfKM7J54K+4g11E8dz1/BWzwP4nR
         0fjPpJ0QR+aJOsMbaoFdtpnRStyNwXm36Lb/yDKnkgUzniyAeAuHwyVsDXle603eoPyG
         GCw2VeUPHN50kI3lHbciX05PsUcliuuxsrXQnfbdBwJK22jWRlifY5lgut8CCnTkhvMa
         JVy9LJTJKwS94DUw0TLHobgcUJVWfPGG467Gst6fzSX2swLs9+qrC/odXTMXc9/yzAsO
         9DBayqUbZ+AGprbu9hMfVG421KtWP0mfqrHfv/2RmxA/diy/PHgvw2wZG66bz1fWU1Na
         pKMw==
X-Forwarded-Encrypted: i=1; AJvYcCX4pcUBIa7ZbPVL9bTJFvC6/LvTYlBEQaxTdZUhG7ZeDEcjf2LPyHHFrVlZz3A8SC30A8mvuXCmGIA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkXjDe05Pe5IhifRa2ulkGN/VboYPhvuNyuV8AA8jfFAoSjQds
	fZls8Ss/SJnsyuDyNKj7BlsNOliB7df9d4IJJBUYmWTrxpGrLN4ggQ1q4XHbow==
X-Google-Smtp-Source: AGHT+IGjwCvfXFMMOOrKjd0zFxwm+u4ucb2DfkGamVd5ftDXnciYCkgBtOiuPJCvKOhQYYB6nrdEEg==
X-Received: by 2002:a17:907:318a:b0:a86:743e:7a08 with SMTP id a640c23a62f3a-a93c494887emr1170008666b.31.1727684229643;
        Mon, 30 Sep 2024 01:17:09 -0700 (PDT)
Message-ID: <863cdc98-a811-485d-8c21-fbde9dedd070@suse.com>
Date: Mon, 30 Sep 2024 10:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] device tree mapping
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cover.1727449154.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.09.2024 18:33, Oleksii Kurochko wrote:
> Current patch series introduces device tree mapping for RISC-V
> and necessary things for that such as:
> - Fixmap mapping
> - pmap
> - Xen page table processing

While nothing is being said here towards a dependency, ...

> ---
> Changes in v8:
>  - The following patch was merged to staging:
>      [PATCH v5 1/7] xen/riscv: use {read,write}{b,w,l,q}_cpu() to define {read,write}_atomic()
>  - All other changes are patch specific so please look at the patch.
> ---
> Changes in v7:
>  - Drop the patch "xen/riscv: prevent recursion when ASSERT(), BUG*(), or panic() are called"
>  - All other changes are patch specific so please look at the patch.
> ---
> Changes in v6:
>  - Add patch to fix recursion when ASSERT(), BUG*(), panic() are called.
>  - Add patch to allow write_atomic() to work with  non-scalar types for consistence
>    with read_atomic().
>  - All other changes are patch specific so please look at the patch. 
> ---
> Changes in v5:
>  - The following patch was merged to staging:
>      [PATCH v3 3/9] xen/riscv: enable CONFIG_HAS_DEVICE_TREE
>  - Drop depedency from "RISCV basic exception handling implementation" as
>    it was meged to staging branch.
>  - All other changes are patch specific so please look at the patch.
> ---
> Changes in v4:
>  - Drop depedency from common devicre tree patch series as it was merged to
>    staging.
>  - Update the cover letter message.
>  - All other changes are patch specific so please look at the patch.
> ---
> Changes in v3:
>  - Introduce SBI RFENCE extension support.
>  - Introduce and initialize pcpu_info[] and __cpuid_to_hartid_map[] and functionality
>    to work with this arrays.
>  - Make page table handling arch specific instead of trying to make it generic.
>  - All other changes are patch specific so please look at the patch.
> ---
> Changes in v2:
>  - Update the cover letter message
>  - introduce fixmap mapping
>  - introduce pmap
>  - introduce CONFIG_GENREIC_PT
>  - update use early_fdt_map() after MMU is enabled.
> ---
> 
> Oleksii Kurochko (7):
>   xen/riscv: allow write_atomic() to work with non-scalar types
>   xen/riscv: set up fixmap mappings
>   xen/riscv: introduce asm/pmap.h header
>   xen/riscv: introduce functionality to work with CPU info
>   xen/riscv: introduce and initialize SBI RFENCE extension
>   xen/riscv: page table handling
>   xen/riscv: introduce early_fdt_map()
> 
>  xen/arch/riscv/Kconfig                      |   1 +
>  xen/arch/riscv/Makefile                     |   2 +
>  xen/arch/riscv/include/asm/atomic.h         |  11 +-
>  xen/arch/riscv/include/asm/config.h         |  16 +-
>  xen/arch/riscv/include/asm/current.h        |  27 +-
>  xen/arch/riscv/include/asm/fixmap.h         |  46 +++
>  xen/arch/riscv/include/asm/flushtlb.h       |  15 +
>  xen/arch/riscv/include/asm/mm.h             |   6 +
>  xen/arch/riscv/include/asm/page.h           |  99 +++++
>  xen/arch/riscv/include/asm/pmap.h           |  36 ++
>  xen/arch/riscv/include/asm/processor.h      |   3 -
>  xen/arch/riscv/include/asm/riscv_encoding.h |   2 +
>  xen/arch/riscv/include/asm/sbi.h            |  62 +++
>  xen/arch/riscv/include/asm/smp.h            |  18 +
>  xen/arch/riscv/mm.c                         | 101 ++++-
>  xen/arch/riscv/pt.c                         | 421 ++++++++++++++++++++
>  xen/arch/riscv/riscv64/asm-offsets.c        |   3 +
>  xen/arch/riscv/riscv64/head.S               |  14 +
>  xen/arch/riscv/sbi.c                        | 273 ++++++++++++-
>  xen/arch/riscv/setup.c                      |  17 +

... I had to fiddle with three of the patches touching this file, to
accommodate for an apparent debugging patch you have in your tree.
Please can you make sure to submit patches against plain staging, or
to clearly state dependencies?

Jan

