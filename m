Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDDFB1E6E2
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 12:58:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074299.1436966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukKnk-00013z-Nm; Fri, 08 Aug 2025 10:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074299.1436966; Fri, 08 Aug 2025 10:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukKnk-00011P-Kh; Fri, 08 Aug 2025 10:58:20 +0000
Received: by outflank-mailman (input) for mailman id 1074299;
 Fri, 08 Aug 2025 10:58:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ukKni-00011G-FM
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 10:58:18 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 968b4d5b-7446-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 12:58:17 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6157ed5dc51so3082878a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 03:58:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a078afbsm1472476166b.4.2025.08.08.03.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 03:58:16 -0700 (PDT)
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
X-Inumbo-ID: 968b4d5b-7446-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754650697; x=1755255497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jl73XMyaXmupn5Rj/nJpGseDEzad6aGCPwYOw8VsIyQ=;
        b=Og1qnjlsLR0aH1n0SUSBep985p1XOQdX8e3FBL+prnxkVHeIciMnjNZpz51Syj53IP
         UNW7Qmn5sXRnbybdXL5QwpdIS7bsynwu1/JG5EsqT51EnxaO5nyXeqNAwwvXW7VB4V6l
         437ognyXYKPm/KiZkgEefXwXKQJikBrpGgvVdBTT3EBTYguX73Enl/J0YjZZ85fxdOlg
         Il8CLnOcNGXn3e0+BAIks6P4NKKpeJhm3GlOXU9fibY4Si/lZF4qS+iNc0OAtu5X26AF
         QcoHJD4mjff+6/K+uL2mYEE6xfY68r5/8TfGRaf+WaOp/vDqR6WsN0Pd+S7MoUuTTxs0
         IYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754650697; x=1755255497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jl73XMyaXmupn5Rj/nJpGseDEzad6aGCPwYOw8VsIyQ=;
        b=aACcrdRzX+C7xJTitYi/VNlHDWq8t8/BJFXX3G0I5EcJjMHnIkm4o5gYr/ZG1YQs4g
         vDsx/vS+zhoejM4OA/fR5/QTAz7IJaGG0V5LVUFdinAuDLIdP80BCyERuG5xZgi8WwZx
         Ea1xVaUHABgajO3vgGmsx3eszAL7bxKQ1t/ikEyk2Lz79GbLYaPmqFEL80iGAAnsV/rh
         aIYbwx1fn4dQfhmzr9wWNfjzN6j1OD13DpEvsYMUe+ztdtet1ITnIaJLCTZynGHLCTgp
         qs8D2ART/4OJcsxN7Wo0yr4Nyi44AACRn4+PPhZOwJq7BlJeM/+YeVv9d6mGkSAYvVA5
         mHfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFTwLhuTe5f0vEZhdNY5jqVUa4wF4reGghT518Y7UdTAKquuOmTjF23+lOKF4RltbE/KoJ+hye/Vk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQqwUxFzaRynb2gKvtz69I64pmlapbJ6BBvISTLTpRuEZupBDk
	ftJoBKdYp/vt4/gev6yR6ht1RbTXJisDP/oWixm6+bj1YAEuDFT1HpJRwNYRg+qChg==
X-Gm-Gg: ASbGnctI/6/skBRv67YavkwtwW9hoexolYhdJ5qoHoo1mcrmIGhGwtxTx21tM7LzMHT
	0sqzexC75Ild8mg16lUQxXNyHHXnbFkGznIaq4q4xBid3esiwROgOOdyaZrq3y2PqopkNiFsAzZ
	uDgjimmD7y9hsQO1JwOUgAAGGRCNlrV03nRDBZJlCzzwx0FSDDn/bPD8pzmI5GtG6SgA/a2kbJk
	xnmUOXefmEUrBWY4soynxEvikKcA/ozih4MNZ4QiJgW+uQEzwK9JXoy/3X+EqKhhmte4cds35HU
	NK2LQsnspubyCSyZDY4i4UiYavWDdbEt8hYAo4psTScAZft99/aVeFDZ0eri99G95Z7/mSYpqMv
	XOf4MvBKl7z2dR93iYseRuSvRro8OY07mh3NQw/X9pXUEa2EfwwEkwPeKfsX5U/ZJleqDrr+d7P
	JE3h6Br4g=
X-Google-Smtp-Source: AGHT+IHeQNKIXxmjbxdDqcsQGAg6pIwmxe2qjpuXyT9zwlxbNqfrkmVGJz9pbGyV3cWKGPa+DtiI2g==
X-Received: by 2002:a17:907:3c84:b0:ad5:d597:561e with SMTP id a640c23a62f3a-af9c659f0c9mr219708666b.56.1754650696596;
        Fri, 08 Aug 2025 03:58:16 -0700 (PDT)
Message-ID: <789c023e-4098-4e54-acea-abab9e24bb0d@suse.com>
Date: Fri, 8 Aug 2025 12:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Remove x86 prefixed names from cpuinfo
To: Kevin Lampis <kevin.lampis@cloud.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20250808104349.635091-1-kevin.lampis@cloud.com>
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
In-Reply-To: <20250808104349.635091-1-kevin.lampis@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 12:43, Kevin Lampis wrote:
> struct cpuinfo_x86
>   .x86        => .family
>   .x86_vendor => .vendor
>   .x86_model  => .model
>   .x86_mask   => .stepping
> 
> No functional change.
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> ---
>  xen/arch/x86/acpi/cpu_idle.c             | 20 +++---
>  xen/arch/x86/acpi/cpufreq/acpi.c         |  2 +-
>  xen/arch/x86/acpi/cpufreq/cpufreq.c      |  4 +-
>  xen/arch/x86/acpi/cpufreq/powernow.c     |  4 +-
>  xen/arch/x86/alternative.c               |  8 +--
>  xen/arch/x86/apic.c                      |  8 +--
>  xen/arch/x86/cpu/amd.c                   | 84 ++++++++++++------------
>  xen/arch/x86/cpu/centaur.c               |  4 +-
>  xen/arch/x86/cpu/common.c                | 38 +++++------
>  xen/arch/x86/cpu/hygon.c                 |  4 +-
>  xen/arch/x86/cpu/intel.c                 | 30 ++++-----
>  xen/arch/x86/cpu/intel_cacheinfo.c       |  6 +-
>  xen/arch/x86/cpu/mcheck/amd_nonfatal.c   |  2 +-
>  xen/arch/x86/cpu/mcheck/mcaction.c       |  2 +-
>  xen/arch/x86/cpu/mcheck/mce.c            | 30 ++++-----
>  xen/arch/x86/cpu/mcheck/mce.h            |  2 +-
>  xen/arch/x86/cpu/mcheck/mce_amd.c        | 16 ++---
>  xen/arch/x86/cpu/mcheck/mce_intel.c      |  5 +-
>  xen/arch/x86/cpu/mcheck/non-fatal.c      |  2 +-
>  xen/arch/x86/cpu/mcheck/vmce.c           |  8 +--
>  xen/arch/x86/cpu/mtrr/generic.c          |  6 +-
>  xen/arch/x86/cpu/mwait-idle.c            |  4 +-
>  xen/arch/x86/cpu/vpmu.c                  |  4 +-
>  xen/arch/x86/cpu/vpmu_amd.c              |  6 +-
>  xen/arch/x86/cpu/vpmu_intel.c            |  4 +-
>  xen/arch/x86/cpuid.c                     |  2 +-
>  xen/arch/x86/dom0_build.c                |  4 +-
>  xen/arch/x86/domain.c                    | 12 ++--
>  xen/arch/x86/e820.c                      |  2 +-
>  xen/arch/x86/hvm/hvm.c                   |  2 +-
>  xen/arch/x86/hvm/svm/svm.c               |  6 +-
>  xen/arch/x86/hvm/vmx/vmcs.c              |  4 +-
>  xen/arch/x86/hvm/vmx/vmx.c               | 28 ++++----
>  xen/arch/x86/i8259.c                     |  2 +-
>  xen/arch/x86/include/asm/cpufeature.h    | 21 ++----
>  xen/arch/x86/include/asm/intel-family.h  |  4 ++
>  xen/arch/x86/io_apic.c                   |  2 +-
>  xen/arch/x86/irq.c                       |  4 +-
>  xen/arch/x86/mpparse.c                   |  8 +--
>  xen/arch/x86/msr.c                       |  4 +-
>  xen/arch/x86/nmi.c                       | 12 ++--
>  xen/arch/x86/platform_hypercall.c        |  6 +-
>  xen/arch/x86/pv/domain.c                 |  2 +-
>  xen/arch/x86/pv/emul-priv-op.c           | 30 ++++-----
>  xen/arch/x86/setup.c                     |  6 +-
>  xen/arch/x86/traps-setup.c               |  4 +-
>  xen/arch/x86/tsx.c                       |  4 +-
>  xen/drivers/passthrough/amd/iommu_init.c |  6 +-
>  48 files changed, 234 insertions(+), 244 deletions(-)

Can you perhaps get this broken up some? The bigger such a patch, the easier it
is that one unintended change slips through.

When doing the conversion wholesale, backporting considerations also come into
play: More adjustments may then need making all in one go when crossing the
4.21 / 4.20 boundary.

Jan

