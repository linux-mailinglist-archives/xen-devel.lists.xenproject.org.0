Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A639F4B69
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 14:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859092.1271237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNXBb-0005Fo-LN; Tue, 17 Dec 2024 13:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859092.1271237; Tue, 17 Dec 2024 13:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNXBb-0005D3-Hy; Tue, 17 Dec 2024 13:00:27 +0000
Received: by outflank-mailman (input) for mailman id 859092;
 Tue, 17 Dec 2024 13:00:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNXBa-0005Cx-Lc
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 13:00:26 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1141920-bc76-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 14:00:24 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso36854135e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 05:00:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625550563sm172103825e9.4.2024.12.17.05.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 05:00:23 -0800 (PST)
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
X-Inumbo-ID: e1141920-bc76-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734440423; x=1735045223; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x8qvu4o47wK/pytc4D/YTHNJcW8odwf9szi5sjyxz70=;
        b=BPUANYUGx3FiDbpNrsaIGyeLlP65LuBTRUsGH8s+BhRPmvqsvifJCLAWYxVQGs/di8
         9z+jnpsR5HJAsSV8DmGfZnrlB5mhzqnHMJshoOWvOj36/va95+owVzT3chXlADgNJ9i2
         N92vY7loG0Ja0SdqZRNajgj0UHr4eDQ7/bTHDjf3no46NIAjPudwPsIb+Nej4LfQ47xx
         rE4lpfgZQS/jle1lWZhJECrRsoRjOeIdldQwXHG+WG+wKFhufC9IjYLs8CmlqjIiyYn2
         s2d6vxA8bEbeIqFD0xAN8x9rQczBvrIiO9M7KARRGTsr3xb29c7XAKA1OGF/yAxjCi96
         cf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734440423; x=1735045223;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8qvu4o47wK/pytc4D/YTHNJcW8odwf9szi5sjyxz70=;
        b=nHtS5vs1rwQdv6vsnCrBuSYsaIUMHykYiCuldpPlrSWE+gDR9MWt78woNFF/+7fDVK
         V2l/3rio9BCSu/h89/3QsdS85JhLCgprF+wJddgOyIlMfjksc9JgKuBICtUEn5B5XGbP
         4rSxpA8eZTK9//d7cve0sRAy+F3y7as/pii7PfNSXTw+TjMn7qN3gIN6JmH7MjzYytTd
         Bk2Eclc6CX1oduwlQMw7ciBFtLoiEExLH2jjyAfEHlpeYkHIzwsj7C5qIyyjqde7fJz2
         ZVD9tjFAh6k4OWYKxWdklWNkP9RGPOtTL7jHxAGcC3JWG+EcM/7GkPH2fep9St4cMaX7
         X7Og==
X-Forwarded-Encrypted: i=1; AJvYcCU+MFQvUfLYP0kLLGiR9qrNwdnGLjzUhHsVvIWbLU7dYzFf1iHAy3iW+RQxYi8ugb9vERQ1RI5r9dw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyu9U1uBLzviumfuGpVGb2mEWPYzgcHNt41T9PgqM9aC1f/Lhkf
	61K1GjW97Wk6S8L/lJ3fz0vGI58BHTjzac7JrJxLX5eBGRZdFO/HztRfF6D0Mg==
X-Gm-Gg: ASbGncvkOPW3Vq+LMDULNDGpVicv9xIOR876dbs2JroRa5mH8eLcaLiXFDIrDrkHTMj
	Ppm11CYVYTVNnfFTeNpOsrYUDNeMOXBRZ62hTVHq01VIQFddqRfbxdW8nrOAQNXyTD7F8G1mWgI
	E1NnBzOaATZsyYPeeBwkW2tRknbrtp1u1LPAObuVmRZlxD8flNc6GG83n+MdqBwumsBBrVNbmkM
	/RxGHmakigRVjgkaLxrpHB+vOH1xmyRh52DTT2eFY149e2SZKbn62gQLg9cw+eOH+Vi3weD5A/J
	X/AC32O3DSG3mkkjAJga4BHYrkoDySDT/q3DPDctrQ==
X-Google-Smtp-Source: AGHT+IGaC/QwC0kiOXCCN4qTrSsBt1V9zmm/0t6K2VNXvFsxgObj0RXZ9cMvJXHmM2VAKhZSIFt2eQ==
X-Received: by 2002:a05:600c:1da9:b0:434:9936:c823 with SMTP id 5b1f17b1804b1-4362aa3e32bmr159564375e9.18.1734440423517;
        Tue, 17 Dec 2024 05:00:23 -0800 (PST)
Message-ID: <4ef8626a-0ff9-4c02-a1bf-72e39b950e8a@suse.com>
Date: Tue, 17 Dec 2024 14:00:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] arm: introduce kconfig options to disable
 hypercalls
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241216114358.2845447-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20241216114358.2845447-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2024 12:43, Sergiy Kibrik wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -516,4 +516,31 @@ config TRACEBUFFER
>  	  to be collected at run time for debugging or performance analysis.
>  	  Memory and execution overhead when not active is minimal.
>  
> +menu "Supported hypercall interfaces"
> +	visible if DOM0LESS_BOOT && EXPERT
> +
> +config SYSCTL
> +	bool "Enable sysctl hypercall"
> +	default y
> +
> +config DOMCTL
> +	bool "Enable domctl hypercalls"
> +	default y
> +
> +config HVM_OP
> +	bool "Enable HVM hypercalls"
> +	depends on HVM
> +	default y
> +
> +config PLATFORM_HYP
> +	bool "Enable platform hypercalls"
> +	depends on !PV_SHIM_EXCLUSIVE

Any reason you don't do the shim related conversion also for domctl and
sysctl?

Much like you have HVM_OP, may I suggest PLATFORM_OP here and ...

> +	default y
> +
> +config PHYSDEVOP
> +	bool "Enable physdev hypercall"
> +	default y

... PHYSDEV_OP here?

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1053,7 +1053,9 @@ int domain_kill(struct domain *d)
>          d->is_dying = DOMDYING_dying;
>          rspin_barrier(&d->domain_lock);
>          argo_destroy(d);
> +#ifdef CONFIG_DOMCTL
>          vnuma_destroy(d->vnuma);
> +#endif

There is a stub already for this, just that right now it's shim-specific.

> --- a/xen/include/hypercall-defs.c
> +++ b/xen/include/hypercall-defs.c
> @@ -234,7 +234,7 @@ stack_switch                       do:2     do:2     -        -        -
>  set_callbacks                      compat   do       -        -        -
>  fpu_taskswitch                     do       do       -        -        -
>  sched_op_compat                    do       do       -        -        dep
> -#ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +#if defined(CONFIG_PLATFORM_HYP)

Nit: Why not #ifdef, like it was, and like you have it ...

> @@ -247,7 +247,9 @@ set_timer_op                       compat   do       compat   do       -
>  event_channel_op_compat            do       do       -        -        dep
>  xen_version                        do       do       do       do       do
>  console_io                         do       do       do       do       do
> +#ifdef CONFIG_PHYSDEV
>  physdev_op_compat                  compat   do       -        -        dep
> +#endif
>  #if defined(CONFIG_GRANT_TABLE)
>  grant_table_op                     compat   do       hvm      hvm      do
>  #elif defined(CONFIG_PV_SHIM)
> @@ -269,14 +271,20 @@ callback_op                        compat   do       -        -        -
>  xenoprof_op                        compat   do       -        -        -
>  #endif
>  event_channel_op                   do       do       do:1     do:1     do:1
> +#ifdef CONFIG_PHYSDEVOP
>  physdev_op                         compat   do       hvm      hvm      do_arm
> -#ifdef CONFIG_HVM
> +#endif
> +#ifdef CONFIG_HVM_OP
>  hvm_op                             do       do       do       do       do
>  #endif
>  #ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +#ifdef CONFIG_SYSCTL
>  sysctl                             do       do       do       do       do
> +#endif
> +#ifdef CONFIG_DOMCTL
>  domctl                             do       do       do       do       do
>  #endif
> +#endif
>  #ifdef CONFIG_KEXEC
>  kexec_op                           compat   do       -        -        -
>  #endif
> @@ -293,7 +301,9 @@ hypfs_op                           do       do       do       do       do
>  #endif
>  mca                                do       do       -        -        -
>  #ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +#ifdef CONFIG_DOMCTL
>  paging_domctl_cont                 do       do       do       do       -
>  #endif
> +#endif

... everywhere else?

> --- a/xen/include/xen/hypercall.h
> +++ b/xen/include/xen/hypercall.h
> @@ -24,6 +24,18 @@
>  /* Needs to be after asm/hypercall.h. */
>  #include <xen/hypercall-defs.h>
>  
> +#if !defined(CONFIG_DOMCTL) && !defined(CONFIG_DOM0LESS_BOOT)
> +#error "domctl and dom0less can't be disabled simultaneously"
> +#endif
> +
> +#if !defined(CONFIG_PHYSDEVOP) && !defined(CONFIG_DOM0LESS_BOOT)
> +#error "physdevop and dom0less can't be disabled simultaneously"
> +#endif
> +
> +#if !defined(CONFIG_SYSCTL) && !defined(CONFIG_DOM0LESS_BOOT)
> +#error "sysctl and dom0less can't be disabled simultaneously"
> +#endif

I'm puzzled by this: It covers only 3 of the 5, and it really only
re-checks what Kconfig already enforces.

Jan

