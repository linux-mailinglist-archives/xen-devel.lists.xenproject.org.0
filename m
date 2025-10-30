Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8EAC203A0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 14:25:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153686.1483975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vESe7-0005r5-25; Thu, 30 Oct 2025 13:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153686.1483975; Thu, 30 Oct 2025 13:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vESe6-0005oU-VB; Thu, 30 Oct 2025 13:24:54 +0000
Received: by outflank-mailman (input) for mailman id 1153686;
 Thu, 30 Oct 2025 13:24:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vESe4-0005oO-Rh
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 13:24:52 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d08971eb-b593-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 14:24:51 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4770c2cd96fso8141245e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 06:24:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db99asm32377378f8f.32.2025.10.30.06.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 06:24:48 -0700 (PDT)
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
X-Inumbo-ID: d08971eb-b593-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761830691; x=1762435491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qvoXvPrvm9r2iTSitXgoIT+trhns4VnlScXPRUJhdt4=;
        b=eisP9EW5H51Gey6CP/23mhrEZr8fw9TMKmzPjQH81A44YYI0xjwoIXNjNO3VI/mfYJ
         FiHr0uHzVLdRyliMGC1JVa/PKh5qNF85FNHHAfP4OjUuiV/6Lf28WdObdwVqJ28ETByc
         BaqzhVsJ2jMsmZ68/2MGrYaVHvGznGu+dl0/+O4vTAZo7LqZzaDtgmRxE6KSNJi4Svh+
         rpp1CILvQKommOmBb6TjvwKMaccOlzhpb3VrM4MDS3d6bH0pNjTfnBrSvmgqcEYWP9de
         D4LxYAtVW9WUFIfMUn5lDxN1uIC1tpGT0Ju4aKOf1lW7phigUcLC7Wro3Lkxfp3ioAUb
         XvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761830691; x=1762435491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvoXvPrvm9r2iTSitXgoIT+trhns4VnlScXPRUJhdt4=;
        b=EAoFGJ9pmSuWY2NWGkZlhdIJCg+VXp0Z2nsXC29ebnBz9XKZ8i1MIaKeMQ3+Fk8Tps
         QWRIhIbGHbMpQ8p9JECGlWA1NlTfLQzuQRdFkluy/GBfCQjGJkpNm156jDX9ZMJb+aSW
         CMPFksvcle7lSfjwtg9srVkVPhLtNP6wIFxherZhyh6ZYZ8TLIhbw2eJ32I2A7BgLQdX
         NRa3RXw1V9I4rK1hp/Gx9B9fPbqm9monNrlGH5opahQ1DoXjLJzslYmdgPuenSLSik/e
         HEa+sg8Ak+LdIXoeXRjdajiE1gIjy0cSsTtSEMyNpmSicrwLZB2OCg9QDApyVHql7tlY
         nxyA==
X-Forwarded-Encrypted: i=1; AJvYcCUy0XJcScFvmS9twWaajumk1z410O0TczltGYjFz4fpdA0EhTFyvHWL7vqb1K69nNVzATa/KbjI/Ac=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2wCkN5EakAZ3aS4sHTNEW8zX7DIspamK80HfaLxTdzCF+9ymt
	isN9QWn4obrAzV5PM1esmDuwvZAHgrFXT5Wq7T4y+ZzcQUwLbpu6UabaZAfns3vzqw==
X-Gm-Gg: ASbGnct97C1ZZejfOf/A3ELjVLG1nE9lyzElrAoEDV5JKnLH4jIwC8EV4g6Ukf7u3Wp
	pTmBtRnZfAPDygLvbca3MgBjSpxyjbaDYOVHssWKFDpAk2X7CkErRMFpKjSL1n9CBxV4M5HJBrm
	FsZEG+EW7AgRj2CAvSispzcR6Z7pXa7znKRiZfTBr4PSOd8SyOs02AVmFGI3yTTN5aSSC3YjD+l
	/RaLp1tNe8Z1MEgxqI+QM1Zic8FTKe7QvvrUK/DVsXBuWg2XWB0PP622whvmJw2sI27TKpSBi+x
	FJ4I9S4ge4NM19zGPpxXADNsIPpYzUBrjaeVVFkqpppwkQ25uXVA86ZLGpCd/syG2Gd/+ewYdC3
	Jrh/0Zpocb62DVR06WPxFTkNbrqaTVWClfxnqFtw+ooOZr8tGcnG6VyBOalFujj7egHa8GxsWKL
	bPnQkPJaGcPClj4jc7OR2NNVAH8Dsp7qdzf+zgl4nQvDRDW+CYXrQouXM+OFHoKrXcwHyrkaw=
X-Google-Smtp-Source: AGHT+IEMB2CXIar889qDPFfKd1jJRN0/jHqQlXMOuJwm4jX0risCidzU/pyfaBHWF24M9SwVvVRKBw==
X-Received: by 2002:a5d:5e8d:0:b0:429:b805:1165 with SMTP id ffacd0b85a97d-429b80512e8mr1582519f8f.49.1761830689014;
        Thu, 30 Oct 2025 06:24:49 -0700 (PDT)
Message-ID: <604ba4aa-a527-40af-9683-473ee331fcbb@suse.com>
Date: Thu, 30 Oct 2025 14:24:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/28] xen/domctl: wrap arch-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-27-Penny.Zheng@amd.com>
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
In-Reply-To: <20251013101540.3502842-27-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 12:15, Penny Zheng wrote:
> Function arch_do_domctl() is responsible for arch-specific domctl-op,
> and shall be wrapped with CONFIG_MGMT_HYPERCALLS
> Tracking its calling chain and the following functions shall be wrapped with
> CONFIG_MGMT_HYPERCALLS too. Otherwise they will all become unreachable when
> MGMT_HYPERCALLS=n, and hence violating Misra Rule 2.1.
> For x86:
> - hvm_save_one
> - hvm_acpi_power_button
> - hvm_acpi_sleep_button
> - hvm_debug_op
> - mem_sharing_domctl
> - make P2M_AUDIT depend on CONFIG_MGMT_HYPERCALLS
> - make PG_log_dirty depend on CONFIG_MGMT_HYPERCALLS
> - do_vmtrace_op
>   - hvm_vmtrace_control
>     - hvm_funcs.vmtrace_control
>   - hvm_vmtrace_get_option
>     - hvm_funcs.vmtrace_get_option
>   - hvm_vmtrace_set_option
>     - hvm_funcs.vmtrace_set_option
>   - hvm_vmtrace_output_position
>     - hvm_funcs.vmtrace_output_position
> - paging_domctl_cont
> - make policy.o/msr.o depend on CONFIG_MGMT_HYPERCALLS
> For ARM:
> - subarch_do_domctl
> We put the guardian in Makefile for the arch-specific domctl.o compilation.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - split out xsm parts
> - adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
> - wrap default-case and arch_get_domain_info() transiently
> ---
> v2 -> v3:
> - add missing guardian in arm/Makefile
> - cover RTIT_CTL{,STATUS}_MASK #define-s
> - add missing guardian for .vmtrace_output_position
> - guard the whole static inline function
> - address "violating Misra rule 2.1" in commit message
> - remove transient wrapping around default-case and arch_get_domain_info()
> ---
>  xen/Kconfig.debug                  | 2 +-
>  xen/arch/arm/Makefile              | 2 +-
>  xen/arch/arm/arm32/Makefile        | 2 +-
>  xen/arch/arm/arm64/Makefile        | 2 +-
>  xen/arch/x86/Makefile              | 2 +-
>  xen/arch/x86/hvm/hvm.c             | 2 ++
>  xen/arch/x86/hvm/pmtimer.c         | 2 ++
>  xen/arch/x86/hvm/vmx/vmx.c         | 4 ++++
>  xen/arch/x86/include/asm/hvm/hvm.h | 4 ++++
>  xen/arch/x86/include/asm/p2m.h     | 2 +-
>  xen/arch/x86/include/asm/paging.h  | 2 +-
>  xen/arch/x86/mm/mem_sharing.c      | 2 ++
>  xen/include/hypercall-defs.c       | 4 ++--
>  xen/lib/x86/Makefile               | 4 ++--
>  14 files changed, 25 insertions(+), 11 deletions(-)

This again might better be split, perhaps (at least) into an Arm and an x86 patch.
Possibly the do_vmtrace_op() set of changes could also be a separate patch.

> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -15,7 +15,7 @@ if DEBUG || EXPERT
>  
>  config GDBSX
>  	bool "Guest debugging with gdbsx"
> -	depends on X86
> +	depends on X86 && MGMT_HYPERCALLS

Likely better

	depends on MGMT_HYPERCALLS
	depends on X86

such that when (if ever) another arch is to be added, a simpler modification will
do.

> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -2322,6 +2322,7 @@ out:
>      return rc;
>  }
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  int mem_sharing_domctl(struct domain *d, struct xen_domctl_mem_sharing_op *mec)
>  {
>      int rc;
> @@ -2339,6 +2340,7 @@ int mem_sharing_domctl(struct domain *d, struct xen_domctl_mem_sharing_op *mec)
>  
>      return rc;
>  }
> +#endif /* CONFIG_MGMT_HYPERCALLS */

See again my MEM_SHARING related remark.

> --- a/xen/lib/x86/Makefile
> +++ b/xen/lib/x86/Makefile
> @@ -1,3 +1,3 @@
>  obj-y += cpuid.o
> -obj-y += msr.o
> -obj-y += policy.o
> +obj-$(CONFIG_MGMT_HYPERCALLS) += msr.o
> +obj-$(CONFIG_MGMT_HYPERCALLS) += policy.o

What about e.g. x86_cpuid_copy_{to,from}_buffer(), living in cpuid.o?

Jan

