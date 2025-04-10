Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2697DA84777
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 17:13:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945954.1344013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tab-0007E2-2g; Thu, 10 Apr 2025 15:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945954.1344013; Thu, 10 Apr 2025 15:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2taa-0007Bq-US; Thu, 10 Apr 2025 15:13:12 +0000
Received: by outflank-mailman (input) for mailman id 945954;
 Thu, 10 Apr 2025 15:13:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2taZ-0007BV-Q6
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 15:13:11 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5006e0b3-161e-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 17:13:09 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so7910295e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 08:13:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecac8sm58448425e9.4.2025.04.10.08.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 08:13:08 -0700 (PDT)
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
X-Inumbo-ID: 5006e0b3-161e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744297989; x=1744902789; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yg71LhBZ2CW2YNo9Od5ozUq0AwF3AihC17Znv53EKe4=;
        b=ceMfNubvdGyZycprJbCs04LRVQbhXsmZaJms4GQ4PWNICWGT36GaXOpM5bGpx9ZKmD
         3VQgJ4oND2X2D+It/QJZcmmPIA0nfJuWFVnZSzkO//6mwmm/0KFgVWAKJkoVECIoLPdK
         tIdJlc7av9ZLE6tFjZqv+8huZgaC7OzZWkYAs3WJgUpyLwkDfzcxf2kO/gxxWqDatQI8
         JGihwMa8TVrwmrgigSBV+xXkC2/wfNAOw+BRMdmgtL4qyeqp1d5a2Hk3AjSvOARpGmh9
         bn6DuMKvm2JH8XDwv/bMig/049iRzT0u+yGzHCSPF6NfaRUZvc+Eltw3UjuxAGYJZKZE
         hXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744297989; x=1744902789;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yg71LhBZ2CW2YNo9Od5ozUq0AwF3AihC17Znv53EKe4=;
        b=ZaWlfEL7TnS33qqX3a3GE0xD4+0srO8uSKLM0UaWgNv1aQWMrUy2MO9A12Lfcor75E
         N3aIMRv9jwrFro2SOJ6xWIX5OrBuqzDNAyXZSBZnsYaB7cu6teJhns/mHwzhb66ESK3l
         tQvAhgFxWeJ5SYBC4KXnor2YBxJDtOhMTyxUdo2OLYzYbJkXhPhUsqXIuGeD0C7LRTwA
         nBelifeoq2l9jpZTOEHI7lh++3AZfFVyHgJmzax4or6Z10HiaCgCt02TGF/pttGkFhAz
         1hqP8erfyKpb4D7InRV+ZTzh25a9m57+F+PAWnvSgh5zhRUDtmWDrbIQ4hf3zEAPtAdk
         j8Pg==
X-Forwarded-Encrypted: i=1; AJvYcCU7vTuVBBLEaxZVBFDNU5Fw1HxcYGiBKKOd5lUhUk/Lf1C1e9IC8cobLhIyen62wxaFNkcIoivMPyI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySCFSEWNEuK6V9MR1I/q517QCjyBbQv2vXjUMQwyxiSFHui+5u
	djMIOG2wx++hkfh5uE998sfEsKDFocSDX/pq4vCn5wSGst9pq3GLNrWCyUW9Fw==
X-Gm-Gg: ASbGncuX9I4cVGPLdUlOnvtW4Lp8n3kNyok7mNfAPjFVKvacUtbjvJKjKvTmmMKksFN
	QLCSTj1vnj30rj5v4m731blDzJ32UL1yo/o41zMUbh/wDnO2MeVQmOgT+2uU3jLS2qWGVnc1/YL
	Ql8xPIMpGTpRoWUQW0mDsaEY/MNV5p/43h0/CruwfbR5wQKJp5J3DyOrcZaVRtr2MhUQrWgyw2k
	rdi9zLNrJuIcIMC4eeEBJajMJj370LpzvTQgo2TEbYcnIyRs2AN3EcgISMyyAxep1CzdsTifbkj
	CxmW3VZtOKI8buP9eTtlgjyoQoOapVmW3yKdjqv8e5chHbzg6P9p+ADGZ7elJreW0kBAwJo5a0I
	ycixoASJ/FonDwiPoRdh/1kQ07w==
X-Google-Smtp-Source: AGHT+IFZO0ZqHrIvaQM8f8NtHhhbH+UU775GquID2TihslrIKuet5q607qRlYBfBDXge6QC7RIOp2Q==
X-Received: by 2002:a05:600c:34c7:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-43f2d7e9318mr37025505e9.18.1744297989072;
        Thu, 10 Apr 2025 08:13:09 -0700 (PDT)
Message-ID: <84089b6d-efeb-4613-85b9-eb10d11d7338@suse.com>
Date: Thu, 10 Apr 2025 17:13:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/14] xen/riscv: introduce ioremap()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <6d91eeabe2735de93bfcf2a2420e2059a8f35e52.1744126720.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6d91eeabe2735de93bfcf2a2420e2059a8f35e52.1744126720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:57, Oleksii Kurochko wrote:
> Based on RISC-V unpriviliged spec ( Version 20240411 ):
> ```
> For implementations that conform to the RISC-V Unix Platform Specification,
> I/O devices and DMA operations are required to access memory coherently and
> via strongly ordered I/O channels. Therefore, accesses to regular main memory
> regions that are concurrently accessed by external devices can also use the
> standard synchronization mechanisms. Implementations that do not conform
> to the Unix Platform Specification and/or in which devices do not access
> memory coherently will need to use mechanisms
> (which are currently platform-specific or device-specific) to enforce
> coherency.
> 
> I/O regions in the address space should be considered non-cacheable
> regions in the PMAs for those regions. Such regions can be considered coherent
> by the PMA if they are not cached by any agent.
> ```
> and [1]:
> ```
> The current riscv linux implementation requires SOC system to support
> memory coherence between all I/O devices and CPUs. But some SOC systems
> cannot maintain the coherence and they need support cache clean/invalid
> operations to synchronize data.
> 
> Current implementation is no problem with SiFive FU540, because FU540
> keeps all IO devices and DMA master devices coherence with CPU. But to a
> traditional SOC vendor, it may already have a stable non-coherency SOC
> system, the need is simply to replace the CPU with RV CPU and rebuild
> the whole system with IO-coherency is very expensive.
> ```
> 
> and the fact that all known ( to me ) CPUs that support the H-extension
> and that ones is going to be supported by Xen have memory coherency
> between all I/O devices and CPUs, so it is currently safe to use the
> PAGE_HYPERVISOR attribute.
> However, in cases where a platform does not support memory coherency, it
> should support CMO extensions and Svpbmt. In this scenario, updates to
> ioremap will be necessary.
> For now, a compilation error will be generated to ensure that the need to
> update ioremap() is not overlooked.
> 
> [1] https://patchwork.kernel.org/project/linux-riscv/patch/1555947870-23014-1-git-send-email-guoren@kernel.org/

But MMIO access correctness isn't just a matter of coherency. There may not
be any caching involved in most cases, or else you may observe significantly
delayed or even dropped (folded with later ones) writes, and reads may be
serviced from the cache instead of going to actual MMIO. Therefore ...

> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -15,6 +15,18 @@ config ARCH_DEFCONFIG
>  	string
>  	default "arch/riscv/configs/tiny64_defconfig"
>  
> +config HAS_SVPBMT
> +	bool
> +	help
> +	  This config enables usage of Svpbmt ISA-extension ( Supervisor-mode:
> +	  page-based memory types).
> +
> +	  The memory type for a page contains a combination of attributes
> +	  that indicate the cacheability, idempotency, and ordering
> +	  properties for access to that page.
> +
> +	  The Svpbmt extension is only available on 64-bit cpus.

... I kind of expect this extension (or anything else that there might be) will need
making use of.

> @@ -548,3 +549,21 @@ void clear_fixmap(unsigned int map)
>                                FIXMAP_ADDR(map) + PAGE_SIZE) != 0 )
>          BUG();
>  }
> +
> +void *ioremap(paddr_t pa, size_t len)
> +{
> +    mfn_t mfn = _mfn(PFN_DOWN(pa));
> +    unsigned int offs = pa & (PAGE_SIZE - 1);
> +    unsigned int nr = PFN_UP(offs + len);
> +
> +#ifdef CONFIG_HAS_SVPBMT
> +    #error "an introduction of PAGE_HYPERVISOR_IOREMAP is needed for __vmap()"
> +#endif

While, as per above, I don't think this can stay, just in case: As indicated
earlier, pre-processor directives want to have the # in the first column.

Jan

