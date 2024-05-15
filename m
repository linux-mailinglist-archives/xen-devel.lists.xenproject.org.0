Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0BA8C6995
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 17:23:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722485.1126480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GSo-0002YS-Cm; Wed, 15 May 2024 15:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722485.1126480; Wed, 15 May 2024 15:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GSo-0002Wl-9p; Wed, 15 May 2024 15:22:42 +0000
Received: by outflank-mailman (input) for mailman id 722485;
 Wed, 15 May 2024 15:22:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7GSn-0002Wf-Fz
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 15:22:41 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f73a3c5a-12ce-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 17:22:39 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2e4b90b03a9so77107631fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 08:22:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733becfc2fsm9186024a12.39.2024.05.15.08.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 08:22:38 -0700 (PDT)
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
X-Inumbo-ID: f73a3c5a-12ce-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715786559; x=1716391359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z90oHeb7BmjBCbCyQiMaLsBrK5r6Ef7VhFkt7CjQhXM=;
        b=f4DTcB2je5xJE+gMFG4D54osvPP3YbDcNq9u0d3C2w3BLkLfM4wbYD5CbkmTT6r9jx
         WNowqD/MfnWeKRuQUvRs7B4Cio4/1f/61jscx+nh/eMuWhDXYXDAr64e63OS6SBGSAXL
         a4OoUomjo7veNA9iFpeMJzxlZvvmSfRXNMClzrMUcJCy+1ycW2fx5czv2dIbXcaSxtRA
         Y84VAG7YVsllA1HpuWIdVTwGlkTZclphYmA9zPgS85JI1v+rH7AsZnFS8uUB7t6t0Sx/
         JjWgTis3kB+RPHnqbezDmTmo48qL0iOm3cYb9dcaj2eefTGhgXytG7YdaUyWiQ7XURoh
         UPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715786559; x=1716391359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z90oHeb7BmjBCbCyQiMaLsBrK5r6Ef7VhFkt7CjQhXM=;
        b=BOPg7TCqHK9nsPcMEQshxkcGZodofR56tSUzPA0WDm0vu1w7EauRw4nkRfBm+q4kYF
         JpGuwDU5/++5Ell89npLCMOy8ndGE1MvK70cIvFBdCm6tTacw4V8AjqZ0ZRCMSlr6eyQ
         lnYQSSsRBzEIoRhTzExIL8CRs8jnD7EgowSQ3wkvI67oo4fWeJEDl8dkEIXyWK+siWyy
         PXdFx6Uoi67WvOebxvh/8aQDlJf2YEN4B2MtMzAA44wH3UoHNiExU6CZtqmlq1r6fPTt
         cloFfkycUo/YgB4igzlXJ/OQlrxJulf034sO/ki1eTShEkUdtjefrTXwjyfX9ST0/rme
         Sd7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW62BMrwkj4SmsuwNM7y3CZvM7jswlc9JtXTUYGdYx7vKI1BeN6rU/bGshpN11fLI+9vEX515z34BXqP+YuHE9Q5HQfhXBSW/lQLrhGjYg=
X-Gm-Message-State: AOJu0Yxx3sRRBAyZuKPPhGmeEPFt52He8oIrjs+MG7rkZcW+NkAvpWjU
	0/AbmpyO/hQIaiKB39BEJUGYnT1zJ7VNkdGvQlpVrLnchER9LtEvVo17Rfl8hA==
X-Google-Smtp-Source: AGHT+IGny/G5TgpmQnUjj2uWAuuhJMA91VyHHQYfBP9dBM1G/itLhJh0G66cvVRg+H+d1yuet/rB5g==
X-Received: by 2002:a19:e05a:0:b0:518:ce4b:17ef with SMTP id 2adb3069b0e04-5221006cdd3mr10961201e87.60.1715786558788;
        Wed, 15 May 2024 08:22:38 -0700 (PDT)
Message-ID: <bf49520a-691c-4876-a582-20a6745d4a56@suse.com>
Date: Wed, 15 May 2024 17:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 11/19] x86/setup: Leave early boot slightly
 earlier
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-12-eliasely@amazon.com>
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
In-Reply-To: <20240513134046.82605-12-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2024 15:40, Elias El Yandouzi wrote:
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1751,6 +1751,22 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>  
>      numa_initmem_init(0, raw_max_page);
>  
> +    /*
> +     * When we do not have a direct map, memory for metadata of heap nodes in
> +     * init_node_heap() is allocated from xenheap, which needs to be mapped and
> +     * unmapped on demand. However, we cannot just take memory from the boot
> +     * allocator to create the PTEs while we are passing memory to the heap
> +     * allocator during end_boot_allocator().
> +     *
> +     * To solve this race, we need to leave early boot before
> +     * end_boot_allocator() so that Xen PTE pages are allocated from the heap
> +     * instead of the boot allocator. We can do this because the metadata for
> +     * the 1st node is statically allocated, and by the time we need memory to
> +     * create mappings for the 2nd node, we already have enough memory in the
> +     * heap allocator in the 1st node.
> +     */
> +    system_state = SYS_STATE_boot;
> +
>      if ( max_page - 1 > virt_to_mfn(HYPERVISOR_VIRT_END - 1) )
>      {
>          unsigned long lo = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
> @@ -1782,8 +1798,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>      else
>          end_boot_allocator();
>  
> -    system_state = SYS_STATE_boot;
> -
>      bsp_stack = cpu_alloc_stack(0);
>      if ( !bsp_stack )
>          panic("No memory for BSP stack\n");

I'm pretty wary of this movement, even more so when Arm isn't switched at
the same time. It has (virtually?) always been the case that this state
switch happens _after_ end_boot_allocator(), and I wouldn't be surprised
if there was a dependency on that somewhere. I realize you've been telling
use that at Amazon you've been running with an earlier variant of these
changes for a long time, and you not having hit issues with this is a good
sign. But I'm afraid it's not a proof.

As to possible alternatives - as pointed out by Roger, the comment / patch
description aren't entirely clear as to what exactly needs working around.
One possibility might be to introduce an x86-only boolean controlling from
when on to use the heap allocator for page table allocations, thus
decoupling that from system_state.

Jan

