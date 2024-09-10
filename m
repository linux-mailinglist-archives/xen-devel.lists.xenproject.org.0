Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FB4973645
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 13:32:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795440.1204804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snz6a-0002yK-Nz; Tue, 10 Sep 2024 11:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795440.1204804; Tue, 10 Sep 2024 11:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snz6a-0002vo-L7; Tue, 10 Sep 2024 11:32:20 +0000
Received: by outflank-mailman (input) for mailman id 795440;
 Tue, 10 Sep 2024 11:32:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snz6Y-0002ve-Pn
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 11:32:18 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54119541-6f68-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 13:32:15 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8d0d82e76aso402555566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 04:32:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c72861sm468805466b.105.2024.09.10.04.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 04:32:13 -0700 (PDT)
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
X-Inumbo-ID: 54119541-6f68-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725967934; x=1726572734; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wGtWOzHTYf4g6bpYkbBQ8hBqInQkRsF3yoJoZTej1cU=;
        b=dIleqxG2hYIkahnwnaTNSYpkCHGaWQoSS0bWU2Lh7348JROSGn+N6Y7OzqED/yBn9i
         z64JDILTjp7eTtWBBlngEuJ7AON5nmCcayDALJxoX/tYqvgZd1bFpbf7R1xViOC2iZAr
         SOAA8UrEPFFC19m6n8RCP8HGdRVvNoEGVh4gFAG7wGP6wVZ2v1PjCxI0rNxZjXBi5aUC
         hjLNkX45mt97zS1S/zFD+lsKZvAPeVqx4e2JVG8R8laxwqJWpcImKHrkSREzmY1cQCTb
         WsQhinQ7EvXE0DvQMa+nvpx0UCxyN1DoHcdLAevRZVTSaNzkNnGRttpEtzaUllrNBDkK
         5sBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725967934; x=1726572734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGtWOzHTYf4g6bpYkbBQ8hBqInQkRsF3yoJoZTej1cU=;
        b=Lb64QrkFCUGKqJXXalKH6X1dCe1mooJ8vq+EeFsaczrwJoQdah7jzPeEHZY+BEdT1U
         xG1ilTXcxVhD5tdek4oxKGJSk9bdZqpu8m7HSRR5tqIy5Q7NPolSyG9KgQum1y6hiciw
         BSzPenRaG2tByTeMBoAhfyCltPg35bm4F0A7RxoI3mztWb5m7pIV4ZUrclOze9ylymZE
         0tbUzJrzNxM7SUXGCTBEbWvmDcsYIS1UwaQVgZm0gquyjpEKn0+D0VK6sFZRQjHJyQUE
         q/3EiWHWoMbjOgAv3fudhdK6a1qj0r/H57huiVM90XV0m+xbkwHovOl5kUSFsVYGJjwM
         z3ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXHHHB2wT5WgKusAZKpJZHiHXy3cE3mjh0dG4ZNBypo3RSm/q4IZI6G7ZScjQHqjY9isIQ3i80Ivjc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwT0t/LbXxgyMgArDChleaPcLLF/7ZivkVAW96tiTYuDxN53G91
	j3WzFlg9YS1f4ZIQj0063OQhU84s8EyfXIkUzCmHeY+C6BltL0Ebq5wS7Bdwkw==
X-Google-Smtp-Source: AGHT+IEJU22oK/7aShjCJp/38lt8xqT+aystOS7X/tYj2ChofFgEq1EABl4tCnween2VzyyWXm35qg==
X-Received: by 2002:a17:906:4fc4:b0:a8d:e4b:d7fe with SMTP id a640c23a62f3a-a8ffa864071mr55383566b.0.1725967934150;
        Tue, 10 Sep 2024 04:32:14 -0700 (PDT)
Message-ID: <6773d2bf-f00f-4f06-ab13-28ff26f1a9f8@suse.com>
Date: Tue, 10 Sep 2024 13:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/9] xen/riscv: introduce and initialize SBI RFENCE
 extension
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
 <83ec05184983bdf9277a11d165b5c45e5116dd5d.1725295716.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <83ec05184983bdf9277a11d165b5c45e5116dd5d.1725295716.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2024 19:01, Oleksii Kurochko wrote:
> Introduce functions to work with the SBI RFENCE extension for issuing
> various fence operations to remote CPUs.
> 
> Add the sbi_init() function along with auxiliary functions and macro
> definitions for proper initialization and checking the availability of
> SBI extensions. Currently, this is implemented only for RFENCE.
> 
> Introduce sbi_remote_sfence_vma() to send SFENCE_VMA instructions to
> a set of target HARTs. This will support the implementation of
> flush_xen_tlb_range_va().
> 
> Integrate __sbi_rfence_v02 from Linux kernel 6.6.0-rc4 with minimal
> modifications:
>  - Adapt to Xen code style.
>  - Use cpuid_to_hartid() instead of cpuid_to_hartid_map[].
>  - Update BIT(...) to BIT(..., UL).
>  - Rename __sbi_rfence_v02_call to sbi_rfence_v02_real and
>    remove the unused arg5.
>  - Handle NULL cpu_mask to execute rfence on all CPUs by calling
>    sbi_rfence_v02_real(..., 0UL, -1UL,...) instead of creating hmask.
>  - change type for start_addr and size to vaddr_t and size_t.
>  - Add an explanatory comment about when batching can and cannot occur,
>    and why batching happens in the first place.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with three more cosmetic things taken care of:

> +static long sbi_ext_base_func(long fid)
> +{
> +    struct sbiret ret;
> +
> +    ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
> +
> +    if ( !ret.error )
> +    {
> +       /*
> +        * I wasn't able to find a case in the SBI spec where sbiret.value
> +        * could be negative.
> +        *
> +        * Unfortunately, the spec does not specify the possible values of
> +        * sbiret.value, but based on the description of the SBI function,
> +        * ret.value >= 0 when sbiret.error = 0. SPI spec specify only
> +        * possible value for sbiret.error (<= 0 whwere 0 is SBI_SUCCESS ).
> +        *
> +        * Just to be sure that SBI base extension functions one day won't
> +        * start to return a negative value for sbiret.value when
> +        * sbiret.error < 0 BUG_ON() is added.
> +        */

The entire comment's indentation is off by one.

> +static int cf_check sbi_rfence_v02(unsigned long fid,
> +                                   const cpumask_t *cpu_mask,
> +                                   vaddr_t start, size_t size,
> +                                   unsigned long arg4, unsigned long arg5)
> +{
> +    unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
> +    int result = -EINVAL;
> +
> +    /*
> +     * hart_mask_base can be set to -1 to indicate that hart_mask can be
> +     * ignored and all available harts must be considered.
> +     */
> +    if ( !cpu_mask )
> +        return sbi_rfence_v02_real(fid, 0UL, -1UL, start, size, arg4);
> +
> +    for_each_cpu ( cpuid, cpu_mask )
> +    {
> +        /*
> +        * Hart IDs might not necessarily be numbered contiguously in
> +        * a multiprocessor system.
> +        *
> +        * This means that it is possible for the hart ID mapping to look like:
> +        *  0, 1, 3, 65, 66, 69
> +        * In such cases, more than one call to sbi_rfence_v02_real() will be
> +        * needed, as a single hmask can only cover sizeof(unsigned long) CPUs:
> +        *  1. sbi_rfence_v02_real(hmask=0b1011, hbase=0)
> +        *  2. sbi_rfence_v02_real(hmask=0b1011, hbase=65)
> +        *
> +        * The algorithm below tries to batch as many harts as possible before
> +        * making an SBI call. However, batching may not always be possible.
> +        * For example, consider the hart ID mapping:
> +        *   0, 64, 1, 65, 2, 66 (1)
> +        *
> +        * Generally, batching is also possible for (1):
> +        *    First (0,1,2), then (64,65,66).
> +        * It just requires a different approach and updates to the current
> +        * algorithm.
> +        */

Except for the initial line, the entire comment's indentation is off by
one.

> +int sbi_remote_sfence_vma(const cpumask_t *cpu_mask,
> +                          vaddr_t start,
> +                          size_t size)

Elsewhere you put multiple parameters on a line when they fit.

Jan

