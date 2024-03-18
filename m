Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD1B87EA52
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 14:48:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694716.1083760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmDLa-0005dj-EZ; Mon, 18 Mar 2024 13:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694716.1083760; Mon, 18 Mar 2024 13:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmDLa-0005bR-C2; Mon, 18 Mar 2024 13:48:14 +0000
Received: by outflank-mailman (input) for mailman id 694716;
 Mon, 18 Mar 2024 13:48:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmDLY-0005bL-V4
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 13:48:12 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 285b166b-e52e-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 14:48:10 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a466a27d30aso567509566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 06:48:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 wn2-20020a170907068200b00a46c508d661sm814213ejb.176.2024.03.18.06.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 06:48:09 -0700 (PDT)
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
X-Inumbo-ID: 285b166b-e52e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710769690; x=1711374490; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=du66YwXtf6/Ss4etI303MhOow965JdkYQmY9J0bKLhE=;
        b=E/Msq3mZ3jLyxzZqAUi0BywRAAAPTNIctOMr7OjAHmyvFQMF6+Gj6qaV24qboGDGYY
         9lKhQj7O0hkb1gP6miwB2nJ0VAfvNfhY8Wo9tKEq+f8Hx6K7CUeR6YQKA+yJ1L/jNKWr
         Xo4k8n8Ln4ygkWx/CN+LkfhkQnRrnfqDx4vjRz8w4RKmrD+uCTFSB6WJW81u/RBVkVIj
         yvJCLOYF81utvsf7bwBc+fzqEHaQyR/0cEFQ5V+CMpDsAJPy9BVtzIb/sl3IWEIvMcFK
         S+HVy4AxfsAtO1bi5+Gq0fl2k9inP8rTBkc6xvDVKnCAxaAiemsxgwZzJUJk9NhcFxti
         dJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710769690; x=1711374490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=du66YwXtf6/Ss4etI303MhOow965JdkYQmY9J0bKLhE=;
        b=gfgbBunQVYLVOekER34wKJ5WVc0Mbtn312tzM8dXLhsklIfurceTLWa5T/q1m0GY/v
         Q86YjPAsRhemkdx75qjzLxsi4zl0R4+1PC5khpfz84Fe8Z9bRdzp0D8ZSUi0ZKVqszqa
         eKLlxcgjTFD+e0S+Ud+RJoFU36u8eO5/EmSWIcFoD+PmDeHyAzeTj97/X8PhlzNRBFbl
         guR5z5Ice987VGMoe66kWKPx4dmTmoiQ3QZrrgqmoi+WPbeQV5g5tq7JQ/ZchqfUlKih
         dRklQcSaT1/bPBm2LdKzvrExMk3jQgDFxK202ROGkXefCuX4yj+9EqBTRSTWmub7BNOX
         olpA==
X-Forwarded-Encrypted: i=1; AJvYcCUL6toyjSJZ7S+F79MdGvs1NO5cS61L4qFCg0IgcuvB0HT8RElksXP14jSenoxcXah06OKAoUpLmjOOWsz1xLCMAUPnJ2PWB4r0GgWqNLA=
X-Gm-Message-State: AOJu0Yz8NnUNfTSnIVTJ1JzB4PsKJdNBXNJ3qYK7jp4xhxNFlGAbI5wc
	uS8Dw9jWENVI5Lr3YEQWwvV6BYUQmpEwTpYMp5eV+6U2ROZNq3POOPbpDJfH0A==
X-Google-Smtp-Source: AGHT+IEnXlaMjUhNTy1ZLvdl4Nk+vOaoFx/Po/X8mVGdyQHWfBpM0AlRk0B7l19EZZLSF2ryEhKl2g==
X-Received: by 2002:a17:907:1ca4:b0:a46:9e3c:9e62 with SMTP id nb36-20020a1709071ca400b00a469e3c9e62mr5833474ejc.13.1710769689910;
        Mon, 18 Mar 2024 06:48:09 -0700 (PDT)
Message-ID: <351eebc2-7da3-4082-830b-d8e764e2066a@suse.com>
Date: Mon, 18 Mar 2024 14:48:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drivers/char: mark extra reserved device memory in
 memory map
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20240312162541.384793-1-marmarek@invisiblethingslab.com>
 <20240312162541.384793-2-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20240312162541.384793-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.03.2024 17:25, Marek Marczykowski-Górecki wrote:
> The IOMMU driver checks if RMRR/IVMD are marked as reserved in memory
> map. This should be true for addresses coming from the firmware, but
> when extra pages used by Xen itself are included in the mapping, those
> are taken from usable RAM used. Mark those pages as reserved too.
> 
> Not marking the pages as reserved didn't caused issues before due to
> another a bug in IOMMU driver code, that was fixed in 83afa3135830
> ("amd-vi: fix IVMD memory type checks").
> 
> Failing to reserve memory will lead to panic in IOMMU setup code. And
> not including the page in IOMMU mapping will lead to broken console (due
> to IOMMU faults). The pages chosen by the XHCI console driver should
> still be usable by the CPU though, and the console code already can deal
> with too slow console by dropping characters (and console not printing
> anything is a special case of "slow"). When reserving fails print an error
> message showing which pages failed and who requested them. This should
> be enough hint to find why XHCI console doesn't work.
> 
> Fixes: 3a1a7b809ffa "drivers/char: mark DMA buffers as reserved for the XHCI"
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> Alternative error handling could be a panic, but with this version I
> think it can be avoided. And not panicing gives a better chance to
> actually see the error message (from the hopefully started dom0),
> especially as the affected driver is the console one.
> 
> The reserve_e820_ram() is x86-specific. Is there some equivalent API for
> ARM, or maybe even some abstract one? That said, I have no way to test
> XHCI console on ARM, I don't know if such hardware even exists...

These are normal PCI devices, so I don't see why they shouldn't be usable
on non-x86 systems. But this is all okay as long as XHCI depends on X86
in Kconfig.

> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -21,6 +21,9 @@
>  #include <xen/softirq.h>
>  #include <xen/keyhandler.h>
>  #include <xsm/xsm.h>
> +#ifdef CONFIG_X86
> +#include <asm/e820.h>
> +#endif

This could do with a separating newline.

> @@ -715,6 +718,22 @@ int __init iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
>  
>      for ( idx = 0; idx < nr_extra_reserved_ranges; idx++ )
>      {
> +#ifdef CONFIG_X86
> +        if ( !reserve_e820_ram(
> +                &e820,
> +                pfn_to_paddr(extra_reserved_ranges[idx].start),
> +                pfn_to_paddr(extra_reserved_ranges[idx].start +
> +                             extra_reserved_ranges[idx].nr)) )

Indentation is odd here - it should be one level down from the start
of the function name. That side, code here and ...

> +        {
> +            printk(XENLOG_ERR "Failed to reserve [%"PRIx64"-%"PRIx64") for %s, "
> +                   "skipping IOMMU mapping for it, some functionality may be broken\n",
> +                   pfn_to_paddr(extra_reserved_ranges[idx].start),
> +                   pfn_to_paddr(extra_reserved_ranges[idx].start +
> +                                extra_reserved_ranges[idx].nr),

... here would likely benefit from introducing "start" and "end"
local variables.

> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -324,7 +324,8 @@ struct iommu_ops {
>  };
>  
>  /*
> - * To be called by Xen internally, to register extra RMRR/IVMD ranges.
> + * To be called by Xen internally, to register extra RMRR/IVMD ranges for RAM
> + * pages.
>   * Needs to be called before IOMMU initialization.
>   */
>  extern int iommu_add_extra_reserved_device_memory(unsigned long start,
> @@ -334,6 +335,8 @@ extern int iommu_add_extra_reserved_device_memory(unsigned long start,
>  /*
>   * To be called by specific IOMMU driver during initialization,
>   * to fetch ranges registered with iommu_add_extra_reserved_device_memory().
> + * This has a side effect of marking requested ranges as "reserverd" in the

Nit: "reserved"

Jan

> + * memory map.
>   */
>  extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
>                                                    void *ctxt);


