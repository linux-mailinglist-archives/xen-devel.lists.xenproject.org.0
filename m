Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA324AFCFF6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 18:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036852.1409364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZAkB-0007Yg-5q; Tue, 08 Jul 2025 16:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036852.1409364; Tue, 08 Jul 2025 16:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZAkB-0007WJ-2d; Tue, 08 Jul 2025 16:00:31 +0000
Received: by outflank-mailman (input) for mailman id 1036852;
 Tue, 08 Jul 2025 16:00:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZAk8-0007WD-VY
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 16:00:28 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a801c83d-5c14-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 18:00:23 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so2964086f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 09:00:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce35cda0bsm12104783b3a.60.2025.07.08.09.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 09:00:22 -0700 (PDT)
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
X-Inumbo-ID: a801c83d-5c14-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751990423; x=1752595223; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VfZHcOM2R6kNt1g4LcBXITDerQ5aqYF+sr5FbY4MHME=;
        b=evSKnGsUE+ThNfDOCine45/ZWNNNIWJfwlXaUvCcOvtorXE3T5hDoUd7Tza1XjSGOe
         zMQiNB16baVn1dKII0Jts7A0ySaFMR3uR6gIX7kyMPr72bko9BCz+Vu7NriYNHQdcHV2
         C8vbTB/I6zLbQRRNNEgEVB18dj7QdpDHze6mO0X01uKtg7adOKSC6L2dyL7vaQN1N2Ly
         jCHrl/0dHBTwSv+HduvihxzyfwfTLnoACZkIoLh/7mAkc32dZZhVW2N+UOz5RlFmBxPx
         ZM+aOxMXR1boByTjCP0R6F6kx5SsVTw9vlqslVL9L2NC+ObPVD/u4KHsfy8rOVQGQG7K
         FttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751990423; x=1752595223;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfZHcOM2R6kNt1g4LcBXITDerQ5aqYF+sr5FbY4MHME=;
        b=GrSGyGkKpQGM2k3w50nTndx6+7riwPEI0IYLlvjC04Zmk9NcDpW8/B6G5YSmSpX3Kx
         wSmc6+KvM5AZSS6q0aQtbBd0vsFo8Uwbn0jWtJpsPzPcSfjLRldbkgdwLKXiX77DFRzb
         CN8QACTedBfknp0Iag0r5sjGUOWInyxrIOqMun1L7y6omwF/tl9BySuaQEkrUX6spEF+
         oqqnJujeSImsYx4VsMT1DlUkR2U/lhmJmZB5u/wEwpSv+AQGI6Vb90sGe5UQOn/22AlL
         8n1GRSm8f+NlSvJAtPVppwDkiDWPNWh5aA8f/wVcbHsVbKjquyv75CNmSneCgeYKqleD
         Bj6w==
X-Forwarded-Encrypted: i=1; AJvYcCVFZVUuSFm2IwQ2OgjJnKl1s/meWDugXrOTMxGw4QwvwfBjybydgU4X+KiHKGokmUSrL0xs5GpJCNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKGoZIVIu28iUHVVlCoDmylmSoP8HHeSp5yby1eQ8cmauxhkHa
	D2zIhKPkXELES3hRe3/qrDAEKmOPmBreWsWOt3O9o6OIkrxNWnHS26DHz9xXIqYaSg==
X-Gm-Gg: ASbGnct6VltI8AOnjIGQTUG3QSiMU87EGIr1MMXeOpbesfoUiBYd+ou11yn8sTc7u4J
	ykE6f8XjnAnTqnc9D8yQN5PkNOXQRdz+TlsUdkR1Cr7Gl7LLbybg3rfIeW+CnOjQygLwcb+0bKn
	y5+DGN+deS7Cwm5qw23WDCMDY/Ewbnlcd5uEazGiC1QH5dIWyR/x6dIWCC0GXcR3QEkcKzt7q7V
	ngZBCvn2PDZoWxdIPsy3p5EgQH2A2nk2olIfBZ1gnAGPWz7DaSK9BqxZC1akf6YMdHQ1hzp5Y9h
	ZAqNWNldogAIdWC7mcP92enqCoU74AtO+uAUWzyXUrzQMwm0pwpFxFq8JN7M5iZH0kgWd+fjUDT
	kvboyIrQWR+9vxE6Uy7xgRN7/jjzbLqLMobfmP14F8dSzS60=
X-Google-Smtp-Source: AGHT+IEdyNBYGYWBbgtlpN5/OI0YLiJ/zV6AsHBeoXNqNPuO9pToMlynRb7q3odBS5qZTsEHwyt21g==
X-Received: by 2002:a05:6000:2dc7:b0:3a4:f63b:4bfc with SMTP id ffacd0b85a97d-3b5ddecd077mr3029731f8f.34.1751990422844;
        Tue, 08 Jul 2025 09:00:22 -0700 (PDT)
Message-ID: <0024c24f-39a4-4b5e-af7b-536f7cebfaff@suse.com>
Date: Tue, 8 Jul 2025 18:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/22] x86/boot/slaunch-early: early TXT checks and
 boot data retrieval
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <a05ef5d70803eb25ab959de011c9717ce9194558.1748611041.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <a05ef5d70803eb25ab959de011c9717ce9194558.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> --- a/xen/arch/x86/include/asm/intel-txt.h
> +++ b/xen/arch/x86/include/asm/intel-txt.h
> @@ -93,6 +93,8 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +#include <xen/slr-table.h>
> +
>  /* Need to differentiate between pre- and post paging enabled. */
>  #ifdef __EARLY_SLAUNCH__
>  #include <xen/macros.h>
> @@ -308,6 +310,116 @@ static inline void *txt_init(void)
>      return txt_heap;
>  }
>  
> +static inline int is_in_pmr(const struct txt_os_sinit_data *os_sinit,
> +                            uint64_t base, uint32_t size, int check_high)
> +{
> +    /* Check for size overflow. */
> +    if ( base + size < base )
> +        txt_reset(SLAUNCH_ERROR_INTEGER_OVERFLOW);
> +
> +    /* Low range always starts at 0, so its size is also end address. */
> +    if ( base >= os_sinit->vtd_pmr_lo_base &&
> +         base + size <= os_sinit->vtd_pmr_lo_size )

If you leverage what the comment says in the 2nd comparsion, why not also
in the first (which means that could be dropped altogether)? If the start
is always zero, why does the field exist in the first place?

> +        return 1;
> +
> +    if ( check_high && os_sinit->vtd_pmr_hi_size != 0 )
> +    {
> +        if ( os_sinit->vtd_pmr_hi_base + os_sinit->vtd_pmr_hi_size <
> +             os_sinit->vtd_pmr_hi_size )
> +            txt_reset(SLAUNCH_ERROR_INTEGER_OVERFLOW);
> +        if ( base >= os_sinit->vtd_pmr_hi_base &&
> +             base + size <= os_sinit->vtd_pmr_hi_base +
> +                            os_sinit->vtd_pmr_hi_size )
> +            return 1;
> +    }
> +
> +    return 0;
> +}
> +
> +static inline void txt_verify_pmr_ranges(
> +    const struct txt_os_mle_data *os_mle,
> +    const struct txt_os_sinit_data *os_sinit,
> +    const struct slr_entry_intel_info *info,
> +    uint32_t load_base_addr,
> +    uint32_t tgt_base_addr,
> +    uint32_t xen_size)
> +{
> +    int check_high_pmr = 0;

Just like Ross mentioned for the return value of is_in_pmr(), this one also
looks as if it wanted to be bool.

> +    /* Verify the value of the low PMR base. It should always be 0. */
> +    if ( os_sinit->vtd_pmr_lo_base != 0 )
> +        txt_reset(SLAUNCH_ERROR_LO_PMR_BASE);
> +
> +    /*
> +     * Low PMR size should not be 0 on current platforms. There is an ongoing
> +     * transition to TPR-based DMA protection instead of PMR-based; this is not
> +     * yet supported by the code.
> +     */
> +    if ( os_sinit->vtd_pmr_lo_size == 0 )
> +        txt_reset(SLAUNCH_ERROR_LO_PMR_SIZE);
> +
> +    /* Check if regions overlap. Treat regions with no hole between as error. */
> +    if ( os_sinit->vtd_pmr_hi_size != 0 &&
> +         os_sinit->vtd_pmr_hi_base <= os_sinit->vtd_pmr_lo_size )
> +        txt_reset(SLAUNCH_ERROR_HI_PMR_BASE);
> +
> +    /* All regions accessed by 32b code must be below 4G. */
> +    if ( os_sinit->vtd_pmr_hi_base + os_sinit->vtd_pmr_hi_size <=
> +         0x100000000ULL )
> +        check_high_pmr = 1;

The addition overflowing is only checked later, and that check may be bypassed
based on the result here. Is that not a possible problem?

> +    /*
> +     * ACM checks that TXT heap and MLE memory is protected against DMA. We have
> +     * to check if MBI and whole Xen memory is protected. The latter is done in
> +     * case bootloader failed to set whole image as MLE and to make sure that
> +     * both pre- and post-relocation code is protected.
> +     */
> +
> +    /* Check if all of Xen before relocation is covered by PMR. */
> +    if ( !is_in_pmr(os_sinit, load_base_addr, xen_size, check_high_pmr) )
> +        txt_reset(SLAUNCH_ERROR_LO_PMR_MLE);
> +
> +    /* Check if all of Xen after relocation is covered by PMR. */
> +    if ( load_base_addr != tgt_base_addr &&
> +         !is_in_pmr(os_sinit, tgt_base_addr, xen_size, check_high_pmr) )
> +        txt_reset(SLAUNCH_ERROR_LO_PMR_MLE);
> +
> +    /*
> +     * If present, check that MBI is covered by PMR. MBI starts with 'uint32_t
> +     * total_size'.
> +     */
> +    if ( info->boot_params_base != 0 &&
> +         !is_in_pmr(os_sinit, info->boot_params_base,
> +                    *(uint32_t *)(uintptr_t)info->boot_params_base,

What is this "MBI" which "starts with 'uint32_t total_size'"? Do you perhaps
mean multiboot2_fixed_t? If you really can't use a proper structure ref here,
please at least mention whatever type that is in our code base, so the use
can be found by e.g. grep.

> +                    check_high_pmr) )
> +        txt_reset(SLAUNCH_ERROR_BUFFER_BEYOND_PMR);
> +
> +    /* Check if TPM event log (if present) is covered by PMR. */
> +    /*
> +     * FIXME: currently commented out as GRUB allocates it in a hole between
> +     * PMR and reserved RAM, due to 2MB resolution of PMR. There are no other
> +     * easy-to-use DMA protection mechanisms that would allow to protect that
> +     * part of memory. TPR (TXT DMA Protection Range) gives 1MB resolution, but
> +     * it still wouldn't be enough.
> +     *
> +     * One possible solution would be for GRUB to allocate log at lower address,
> +     * but this would further increase memory space fragmentation. Another
> +     * option is to align PMR up instead of down, making PMR cover part of
> +     * reserved region, but it is unclear what the consequences may be.
> +     *
> +     * In tboot this issue was resolved by reserving leftover chunks of memory
> +     * in e820 and/or UEFI memory map. This is also a valid solution, but would
> +     * require more changes to GRUB than the ones listed above, as event log is
> +     * allocated much earlier than PMRs.
> +     */
> +    /*
> +    if ( os_mle->evtlog_addr != 0 && os_mle->evtlog_size != 0 &&
> +         !is_in_pmr(os_sinit, os_mle->evtlog_addr, os_mle->evtlog_size,
> +                    check_high_pmr) )
> +        txt_reset(SLAUNCH_ERROR_BUFFER_BEYOND_PMR);
> +    */
> +}
> +
>  #endif /* __ASSEMBLY__ */

These inline functions are pretty large. Why do they need to be inline ones?

Jan

