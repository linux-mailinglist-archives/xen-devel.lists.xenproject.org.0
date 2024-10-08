Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB1A994793
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 13:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813030.1225822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy8g1-0002Ln-8e; Tue, 08 Oct 2024 11:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813030.1225822; Tue, 08 Oct 2024 11:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy8g1-0002Iz-5a; Tue, 08 Oct 2024 11:46:53 +0000
Received: by outflank-mailman (input) for mailman id 813030;
 Tue, 08 Oct 2024 11:46:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sy8fz-0002It-AN
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 11:46:51 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 014b1f5e-856b-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 13:46:50 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so1719485a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 04:46:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05f3969sm4248175a12.87.2024.10.08.04.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 04:46:49 -0700 (PDT)
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
X-Inumbo-ID: 014b1f5e-856b-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728388010; x=1728992810; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6xZaYswXVmoMyaE62q3+SUCu3H/UnIU8UaWHNZvQhqY=;
        b=JJM9QW82zG2kVgjWkAe/+TDEdRkqGKqDgZ2SyDz/WpnCR/p6cQctvH0Aa0X0EGts5v
         HzDpS157SRfrmbOAJEBNjDF97fkL8VyZpTwkLfM80kzxjVMASh+d96TwTgB8GUT53vS8
         dMBqnlwD+c7KeAtKldmcp0ns+3OHzmX1D/OpekrATzBXySdtSdAlZJbpScja2dOnS/wX
         3mke3bzQLYt9Z/p1Hs2QYgtwxQuUWUNVv6MpwvQcFFeCQOdytrH785oBnzYvoAbl7iBl
         BW4Hg0Q4wneMfx7exMcLIztZ8HCOg3nk+xJFa5QOue6Bs/ZNGTWSHIXqpOm7hEqQEEgW
         o0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728388010; x=1728992810;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xZaYswXVmoMyaE62q3+SUCu3H/UnIU8UaWHNZvQhqY=;
        b=h58COp84Gsmny+bxPgCenG5G7C8Bda7oAIBzDma/bD61i6cZzGmmklwi/am1VjIz6c
         N/Z2x0mZ94deRfhK7FDs4cxq/jvUTRWxtZF+h68x4jFds0/cVHo0E4M+nSp/kc4GzoBJ
         x3nrDHIY79ikK0QGXMALVnY9UHTqCHsN1BLGHcVH0vZK6fI9S0uGIgvsMXGg8y88RheZ
         KYahk7OKpbuRdjx6q4CL0OJsIwDg5/BLrP8FFmhHjp1Zo+3bOnBGH7V+yPc3ekV1vDQ7
         Kz+EFXPdTZ/y8BFMsvcmATLIUUZWtBo1pwI0hOj6o7i0eFN6x725JTgqG0HQRqrUot6c
         J7Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXNsf3SAk+WNpjSf76ta6v9bGpP/1lwOUz1Vn8TakS/SM4z/rmzagVZ7wYul92upjtpAe5OKeI816E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyojJcZpoF9znTpkgPe2d9fOWbqg8DjxwEgK7/X2x0X0sQCXDoo
	E3VapVyA8IN7etbyeQF19i7O9Rq8ZqfWXDPO/kFkjhztpNucPnyVImptqPUnMg==
X-Google-Smtp-Source: AGHT+IEURzfQn/D3al1SWEg+uxNFwOrALJKOs5kH4nzZOXjATjyX7EeXIOz9cEFXncQSc0bZ4YA86w==
X-Received: by 2002:a05:6402:2185:b0:5c5:c2a7:d535 with SMTP id 4fb4d7f45d1cf-5c905d2113fmr4116309a12.16.1728388009749;
        Tue, 08 Oct 2024 04:46:49 -0700 (PDT)
Message-ID: <3351f1f4-406f-4081-b3ad-9d71ce4bb279@suse.com>
Date: Tue, 8 Oct 2024 13:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] NUMA: Introduce NODE_DATA->node_present_pages(RAM
 pages)
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241002102331.437048-1-bernhardkaindl7@gmail.com>
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
In-Reply-To: <20241002102331.437048-1-bernhardkaindl7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.10.2024 12:23, Bernhard Kaindl wrote:
> From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> 
> Changes in v2:
> - Remove update of numainfo call, only calculate RAM for each node.
> - Calculate RAM based on page boundaries, coding style fixes

Nit: This shouldn't be part of the description (eventual commit message);
it belongs ...

> Some admin tools like 'xl info -n' like to display the total memory
> for each NUMA node. The Xen backend[1] of hwloc comes to mind too.
> 
> The total amount of RAM on a NUMA node is not needed by Xen internally:
> Xen only uses NODE_DATA->node_spanned_pages, but that can be confusing
> for users as it includes memory holes (can be as large as 2GB on x86).
> 
> Calculate the RAM per NUMA node by iterating over arch_get_ram_range()
> which returns the e820 RAM entries on x86 and update it on memory_add().
> 
> Use NODE_DATA->node_present_pages (like in the Linux kernel) to hold
> this info and in a later commit, find a way for tools to read it.
> 
> [1] hwloc with Xen backend: https://github.com/xenserver-next/hwloc/
> 
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> ---

... below this first (or any later) such separator.

> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -499,15 +499,41 @@ int __init compute_hash_shift(const struct node *nodes,
>      return shift;
>  }
>  
> -/* Initialize NODE_DATA given nodeid and start/end */
> +/**
> + * @brief Initialize a NUMA node's NODE_DATA given nodeid and start/end addrs.
> + *
> + * This function sets up the boot memory for a given NUMA node by calculating
> + * the node's start and end page frame numbers (PFNs) and determining
> + * the number of present RAM pages within the node's memory range.
> + *
> + * @param nodeid The identifier of the node to initialize.
> + * @param start The starting physical address of the node's memory range.
> + * @param end The ending physical address of the node's memory range.
> + */
>  void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
>  {
>      unsigned long start_pfn = paddr_to_pfn(start);
>      unsigned long end_pfn = paddr_to_pfn(end);
> +    unsigned long ram_start_pfn, ram_end_pfn;

These two variables would better live inside the loop, as it's only there
that they're used.

> +    unsigned int idx = 0;
> +    int err;
> +    paddr_t ram_start, ram_end;
>  
>      NODE_DATA(nodeid)->node_start_pfn = start_pfn;
>      NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
>  
> +    /* Calculate the numer of present RAM pages within the node: */

Nit: number

> +    NODE_DATA(nodeid)->node_present_pages = 0;
> +    while ( (err = arch_get_ram_range(idx++, &ram_start, &ram_end)) != -ENOENT )
> +    {
> +        if ( err || ram_start >= end || ram_end <= start )
> +            continue;  /* Not RAM (err != 0) or range is outside the node */
> +
> +        /* Add RAM that in the node's memory range (within start and end): */

Nit: I think you either want "that's" or s/that in/from/ (or something
substantially similar).

> +        ram_end_pfn = min(ram_end, end) >> PAGE_SHIFT;
> +        ram_start_pfn = (PAGE_ALIGN(max(ram_start, start))) >> PAGE_SHIFT;

You effectively do the comparisons twice - once in the if() and then a
second time in the min() / max(). Can't you simply check ram_start_pfn
against ram_end_pfn, totaling to one less comparison?

Also please don't open-code PFN_DOWN() / PFN_UP().

Jan

