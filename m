Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11676AB8279
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 11:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985025.1370958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUq3-00036z-Un; Thu, 15 May 2025 09:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985025.1370958; Thu, 15 May 2025 09:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUq3-00034R-RS; Thu, 15 May 2025 09:25:15 +0000
Received: by outflank-mailman (input) for mailman id 985025;
 Thu, 15 May 2025 09:25:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFUq2-000343-Eb
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 09:25:14 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80e19074-316e-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 11:25:12 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-326c1795b8bso21019061fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 02:25:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad517293728sm78312766b.22.2025.05.15.02.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 02:25:00 -0700 (PDT)
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
X-Inumbo-ID: 80e19074-316e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747301112; x=1747905912; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ODTUbsP+3x4qGj8EevNb80Ywf/WIQ/JGQbYi03Bq3Po=;
        b=LkBckQUoupdjsLFKuNuPrUF7t12pKeOhUoXdeh7TfbiO7QaV0sBzVkentJ/fK2k/Fv
         H57qZ4JLNM3MMRSTqMVaDAIZ9jb/fAqIXAoVzV2lQ6cP/CEvxeKueDuo7LFFLyn9koXv
         ypIxb+91SuOyGk8C+MsnV7nXGciCkkpIX6J0QmRzlQ/tTOn7cMBG6+NdtawvsJt668iV
         hsUV98YuMmde7yt0vdcjTX2fTyUfmD9FdOYSahE6k/YuAQbmJRMFFVlNaFO8phPVoWg5
         /09DrsQnrsF2fwIKgzyBUnszrDOnybZ0ah5qeVlXY+HoG5wkbUyt2mOnqZ3vIIoub5g+
         VCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747301112; x=1747905912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODTUbsP+3x4qGj8EevNb80Ywf/WIQ/JGQbYi03Bq3Po=;
        b=RmBiMqTIZvJ1MAGUFtNVzBxJjX8UJcWLU7JDyTdrBEfGAw5+YglScHO5iyEqWvo8FA
         F0IQVjRjX3nuHEdZwqyFRb57UBMUOfqJxHrNZs2Z6QbfvYH8uflPFcFcBkNGOZZg7cOe
         Y625UQv5KySBZhFgM/IG5FO/QDf8hsVB2U9lKjVev0Re1KOyMr7h96aWKYp18rj2B5P5
         Wde0/n9w05/1jW2j8pVfZhWdIvBJPKpln6mKca9jw8l9+nYl/Pnf2uBpOicM2sZjIHjL
         v8wfdtQUrvFTMP2D7HQRRdx+iL1af8yyotivjEG2XRqWjk1KqWyokvFhHa5jcOGHf7pK
         AbKA==
X-Forwarded-Encrypted: i=1; AJvYcCXhB34MCpoE64aoAEI+izlCyXLuYGfuqS80jl/MTl7tSXxYscgWqtisdIZQF4hVbsP4CMx0ymwtOEQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEV9/EpuUr7WJmoRaou72YKyXvahHStt0qzdLUN7ySEtEafO/w
	vSSbdfg7m7IuaMpF0WfYZrncvKB6OWqUd+I+FjCbwyr+LymSLZPePLw3aaJ9/nF4KTZa72LxzDo
	=
X-Gm-Gg: ASbGncuvIe+smigP5BNtw0crQSrrdmXB9ADZcX43L2Nu7znzQVkYJo3fKp9aRfxe+c1
	+KSnwemk7bIVarhW8JOqR0uJq9HinvJUoeI33g3hapXvgVJonfXAVmz0tpITs35jQoPwaGhMkfn
	+rpqQ3J4SHXjfKA5NmXG8cOaUJ27WnvY+mNvpEDOA9APnXf280cfEg1XQFJ9tN1NjxtloJT0nEr
	d/jmvhDcI9hXb8uJPeC9afkNA0dEVlqT9/aaSVHCgn1f9rJtbFegyRJ4DSRWdXUXKPc953Irtof
	BBY+h0bIXH1lptiboFaEcAH0ItjRYp1KC0J8r/OHxocvSdudGHJUdXHYAKTmoA0VQogyFmMtZCZ
	AWueXbUB1VICEcfDixkU//nMpiio+wJZiIZ46
X-Google-Smtp-Source: AGHT+IG/31xuYP0PLknjHs8fa/H/gacwymnVUO6M45OZmLBiqCW3otCn+zp64Eirc2ZHifc45WZBoQ==
X-Received: by 2002:a17:907:3f92:b0:aca:c699:8d3c with SMTP id a640c23a62f3a-ad50f613040mr279788566b.2.1747301101222;
        Thu, 15 May 2025 02:25:01 -0700 (PDT)
Message-ID: <8b0fa959-6d00-4bfb-bef0-b3d1ae7ce7e0@suse.com>
Date: Thu, 15 May 2025 11:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vpci: fix handling of BAR overlaps with non-hole
 regions
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250515084123.43289-1-roger.pau@citrix.com>
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
In-Reply-To: <20250515084123.43289-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2025 10:41, Roger Pau Monne wrote:
> For once the message printed when a BAR overlaps with a non-hole regions is
> not accurate on x86.  While the BAR won't be mapped by the vPCI logic, it
> is quite likely overlapping with a reserved region in the memory map, and
> already mapped as by default all reserved regions are identity mapped in
> the p2m.  Fix the message so it just warns about the overlap, without
> mentioning that the BAR won't be mapped, as this has caused confusion in
> the past.
> 
> Secondly, when an overlap is detected the BAR 'enabled' field is not set,
> hence other vPCI code that depends on it like vPCI MSI-X handling won't
> function properly, as it sees the BAR as disabled, even when memory
> decoding is enabled for the device and the BAR is likely mapped in the
> p2m.  Change the handling of BARs that overlap non-hole regions to instead
> remove any overlapped regions from the rangeset, so the resulting ranges to
> map just contain the hole regions.  This requires introducing a new
> pci_sanitize_bar_memory() that's implemented per-arch and sanitizes the
> address range to add to the p2m.
> 
> For x86 pci_sanitize_bar_memory() removes any regions present in the host
> memory map, for ARM this is currently left as a dummy handler to not change
> existing behavior.
> 
> Ultimately the above changes should fix the vPCI MSI-X handlers not working
> correctly when the BAR that contains the MSI-X table overlaps with a
> non-hole region, as then the 'enabled' BAR bit won't be set and the MSI-X
> traps won't handle accesses as expected.

While all of this reads plausible, I may need to look at this again later,
to hopefully grok the connections and implications.

> --- a/xen/arch/x86/include/asm/pci.h
> +++ b/xen/arch/x86/include/asm/pci.h
> @@ -2,6 +2,7 @@
>  #define __X86_PCI_H__
>  
>  #include <xen/mm.h>
> +#include <xen/rangeset.h>

Please don't, ...

> @@ -57,14 +58,7 @@ static always_inline bool is_pci_passthrough_enabled(void)
>  
>  void arch_pci_init_pdev(struct pci_dev *pdev);
>  
> -static inline bool pci_check_bar(const struct pci_dev *pdev,
> -                                 mfn_t start, mfn_t end)
> -{
> -    /*
> -     * Check if BAR is not overlapping with any memory region defined
> -     * in the memory map.
> -     */
> -    return is_memory_hole(start, end);
> -}
> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
> +int pci_sanitize_bar_memory(struct rangeset *r);

... all you need is a struct forward decl here.

> --- a/xen/arch/x86/pci.c
> +++ b/xen/arch/x86/pci.c
> @@ -98,3 +98,53 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
>  
>      return rc;
>  }
> +
> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
> +{
> +    /*
> +     * Check if BAR is not overlapping with any memory region defined
> +     * in the memory map.
> +     */
> +    if ( !is_memory_hole(start, end) )
> +        gdprintk(XENLOG_WARNING,
> +                 "%pp: BAR at [%"PRI_mfn", %"PRI_mfn"] not in memory map hole\n",
> +                 &pdev->sbdf, mfn_x(start), mfn_x(end));
> +
> +    /*
> +     * Unconditionally return true, pci_sanitize_bar_memory() will remove any
> +     * non-hole regions.
> +     */
> +    return true;
> +}
> +
> +/* Remove overlaps with any ranges defined in the host memory map. */
> +int pci_sanitize_bar_memory(struct rangeset *r)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < e820.nr_map; i++ )
> +    {
> +        const struct e820entry *entry = &e820.map[i];
> +        int rc;
> +
> +        if ( !entry->size )
> +            continue;
> +
> +        rc = rangeset_remove_range(r, PFN_DOWN(entry->addr),
> +                                   PFN_UP(entry->addr + entry->size - 1));
> +        if ( rc )
> +            return rc;

Perhaps better continue the loop in a best effort manner, only accumulating
the error to then ...

> +    }
> +
> +    return 0;
> +}

... return here?

Jan

