Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A820C3BB79
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 15:26:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157022.1485961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH0wB-0003pJ-En; Thu, 06 Nov 2025 14:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157022.1485961; Thu, 06 Nov 2025 14:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH0wB-0003mK-Br; Thu, 06 Nov 2025 14:26:07 +0000
Received: by outflank-mailman (input) for mailman id 1157022;
 Thu, 06 Nov 2025 14:26:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vH0w9-0003kn-Kx
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 14:26:05 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84f3291f-bb1c-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 15:26:01 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-640ca678745so1876583a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 06:26:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f866dd5sm1849709a12.32.2025.11.06.06.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 06:26:00 -0800 (PST)
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
X-Inumbo-ID: 84f3291f-bb1c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762439161; x=1763043961; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Eh790BDJdUDGA8lspaIvEJ7wUkfPCub/5bhXGPpdv9M=;
        b=YYe3TuPr0BYr2Y84ux914V3FLC8W9fliwH4LYATfK0BacUmSssUg+Q895AsXG8e9Hd
         YeLX0SjRUJjBXzdqtIG/V4dwFdb9tw7J4dmSVgSJwOVK01fumm/kT0K5nx8lsoExskO2
         ABCA+AWTQ/QG97WxRZpk1xvEfpEBytGyvW1M4RCB70Cdaxr0l6a8fF6uYUZ2Ma0PQkFh
         Eg4l2j8Jgvjo4EiQ4AeuMqqjWExoYfpEAAbYQAjWr8gcREygmCtI0qku1VOgGVGoRigm
         ju0cXRqnS3lMTSiFOgleESXnG284BRn3Ee4Gnv0iqMrk2uqP5FExRMKdbyMD9FItTEI1
         bQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762439161; x=1763043961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eh790BDJdUDGA8lspaIvEJ7wUkfPCub/5bhXGPpdv9M=;
        b=DH3SpBROWx6oJfnoxbEwI1VWuD+AJzqo0ckERVQ+RsXNqLaWx8zXY65hs3EENn6ALB
         VvJdt6FpvALcP9MBITCbCuRamryFp14r/06uwHOa0fMlh5mxN+4gEKcrtJwpmq6X2QjG
         RN9t4Y4/Lp2DGSKwybfspeH+lkvVKyCQGT5VPnCdkg9Cl6fHttvO3SiDTCs1uzgMhV8b
         BJS1w36DljEzJ+CuPk52jaJOyGjYwhTgy0nfaSjhSoPTgoWBiy+xyo9z7qnkaLxa0uTk
         NQ5tJ6RKIu2lHplNg/2vIubdAbygk+JR/+Ul9uCCX95g6/FxXRAMXhgW4heBgbRe/0Cw
         vChA==
X-Forwarded-Encrypted: i=1; AJvYcCUibkAtFf0MersgYYm4nEp5ZJ1QCm9c6z28JggXQKXl3KGDNgauqF6DTSdO/fv0Me1KZDsuiFS0FqI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEcGaHJqOQexb8WAUrdAdxSjEXKJGGs3i1SPJacsRNFJcM6+Tj
	DDEzntwui+HQLYk+4tKr70HX4IEksvrG4APv3+5ACCVpEs5s9qMwCAve2N6NaeGJdQ==
X-Gm-Gg: ASbGnctNVU7XGfZ5a2FFbQZzJUq7oEu0qfpPnO6TDF+0+enVD0yIYeVpr0+wlwOYRX2
	HikhiY3+OLQa+souEnSXw/IhHeaKsJT8gJGy0uBEHUP/J4UQIly8W6ibexWg5kwNQIZT6cHFnVE
	iP1QlT9ssfgg6jcJGJOs80QMY/Jrrhv7VtBMlGrai5GqtpqFfhThkkTNdcsw+jv5c1IHpHXmKef
	j5JUw0TSEeggGYo4rfbMsUoPr44YTZa1ZNDRj4AsnLYNVNIpZ8iiggov5Bucd8rH1DGtHxjNCK/
	VgVnuDIJMbl5LjZbQkKQ9lEJ57125S2jnRbtfKlVp7G4lNRZIa9jnXPb7l7mD/XAKw4iXqHuaKx
	DW4k07nFcwKbZiYkD7XF2fdRJSI2LIg/i4KeuecQRsAc7tZv2LUFA7XML8mxRueEp7/CI7fSjNj
	Jywdcr5vVN1rfFieExTa5JCXToM0C3FKbaQO882Bc7tozt+1Gurw/ESJA04SwZ
X-Google-Smtp-Source: AGHT+IE+yLlXVE6Ej5O+s2G7Up6FgTx1oABnGDC2XCxnfXAVd8QBQCHXwG8v+WAa2zE4DWlWvn7HdA==
X-Received: by 2002:a05:6402:1465:b0:640:ea9b:503c with SMTP id 4fb4d7f45d1cf-64105ca6b96mr6449673a12.38.1762439160677;
        Thu, 06 Nov 2025 06:26:00 -0800 (PST)
Message-ID: <8e3b791c-22ca-43e2-a3bf-f440032ab1ed@suse.com>
Date: Thu, 6 Nov 2025 15:25:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 05/18] xen/riscv: add root page table allocation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <81d36dc5277d4756442f3ad5d64f37148787394a.1760974017.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <81d36dc5277d4756442f3ad5d64f37148787394a.1760974017.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.10.2025 17:57, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -3,6 +3,7 @@
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/macros.h>
> +#include <xen/domain_page.h>
>  #include <xen/mm.h>
>  #include <xen/paging.h>
>  #include <xen/rwlock.h>
> @@ -103,6 +104,70 @@ void __init pre_gstage_init(void)
>      vmid_init();
>  }
>  
> +static void clear_and_clean_page(struct page_info *page, bool clean_dcache)
> +{
> +    clear_domain_page(page_to_mfn(page));
> +
> +    /*
> +     * If the IOMMU doesn't support coherent walks and the p2m tables are
> +     * shared between the CPU and IOMMU, it is necessary to clean the
> +     * d-cache.
> +     */
> +    if ( clean_dcache )
> +        clean_dcache_va_range(page, PAGE_SIZE);

This cleans part of frame_table[], but not the memory page in question.

> --- a/xen/arch/riscv/paging.c
> +++ b/xen/arch/riscv/paging.c
> @@ -4,46 +4,67 @@
>  #include <xen/sched.h>
>  #include <xen/spinlock.h>
>  
> +static int paging_ret_page_to_domheap(struct domain *d)
> +{
> +    struct page_info *page;
> +
> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
> +
> +    /* Return memory to domheap. */
> +    page = page_list_remove_head(&d->arch.paging.freelist);
> +    if( page )
> +    {
> +        d->arch.paging.total_pages--;
> +        free_domheap_page(page);
> +    }
> +    else
> +    {
> +        printk(XENLOG_ERR
> +                "Failed to free P2M pages, P2M freelist is empty.\n");

Nit: See earlier remark regarding full stops in log messages. The double
"P2M" also looks unnecessary to me.

> +static int paging_add_page_to_freelist(struct domain *d)
> +{
> +    struct page_info *page;
> +
> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
> +
> +    /* Need to allocate more memory from domheap */
> +    page = alloc_domheap_page(d, MEMF_no_owner);
> +    if ( page == NULL )
> +    {
> +        printk(XENLOG_ERR "Failed to allocate pages.\n");

Again. (Also log messages typically wouldn't start with a capital letter,
unless of course it's e.g. an acronym.)

> @@ -55,6 +76,39 @@ int paging_freelist_adjust(struct domain *d, unsigned long pages,
>      return 0;
>  }
>  
> +int paging_refill_from_domheap(struct domain *d, unsigned int nr_pages)
> +{
> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
> +
> +    for ( unsigned int i = 0; i < nr_pages; i++ )
> +    {
> +        int rc = paging_add_page_to_freelist(d);

The anomaly is more pronounced here, with the other function name in context:
paging_refill_from_domheap() doesn't suggest there's a page (or several) being
handed to it. paging_add_page_to_freelist() suggests one of its parameter
would want to be struct page_info *. Within the naming model you chose, maybe
paging_refill_from_domheap_one() or paging_refill_one_from_domheap()? Or
simply _paging_refill_from_domheap()?

> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return 0;
> +}
> +
> +int paging_ret_to_domheap(struct domain *d, unsigned int nr_pages)
> +{
> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
> +
> +    if ( d->arch.paging.total_pages < nr_pages )
> +        return false;
> +
> +    for ( unsigned int i = 0; i < nr_pages; i++ )
> +    {
> +        int rc = paging_ret_page_to_domheap(d);

Somewhat similarly here. Maybe simply insert "one" in the name?

Jan

