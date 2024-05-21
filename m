Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967C18CB11C
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 17:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726977.1131366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9REe-0006RE-AY; Tue, 21 May 2024 15:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726977.1131366; Tue, 21 May 2024 15:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9REe-0006PP-6i; Tue, 21 May 2024 15:17:04 +0000
Received: by outflank-mailman (input) for mailman id 726977;
 Tue, 21 May 2024 15:17:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9REd-0006OJ-6z
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 15:17:03 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b6181d3-1785-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 17:17:01 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a5dcb5a0db4so387913966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 08:16:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17cc5sm1616303866b.205.2024.05.21.08.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 08:16:59 -0700 (PDT)
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
X-Inumbo-ID: 2b6181d3-1785-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716304619; x=1716909419; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqDWoDoB9/P1jqXa+vy9bE5aV3gSEt16LrMoswx/xD0=;
        b=D1h+O3pNkPh1aMCRDCgwO2dmzCiixb/zvnF3K4HRVSVYWQSQQ4nUeQutnQm4YWg8YO
         AzybpYtFBJQu/ruvUdgOdcgxkJscmEutwJkiwjGEnol34XzBrzxUTOzNVOyGQdzhfYLH
         DcDGo8zZeYVfeVoGzlC94etu1SfcvBwROFFaYpf93nl0CP3bheZlB/GXibOXkXUGV7Ip
         w91Hp2gZtHxiUOlQhf2FISH0GVHjTqDzX6OhizPrh2LsJEIXEo4KPG7W4PKve5P2NZxQ
         BkHyaGg7oZydcQ7aXNbqj2keDeRpl8lBqgpcwxsWo/R6GJEoDOZQYcQVuyEk76CjUUg8
         vlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716304619; x=1716909419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aqDWoDoB9/P1jqXa+vy9bE5aV3gSEt16LrMoswx/xD0=;
        b=SZyDubLU9NIkbdGD6q0BnRADgwp+5iIaqbGf7aNq8kEVIYnnEgyVl0aSgEru3a2G/c
         vu9eqLiod9CVlSU5ulRuqoOFklqmJuL9FefBsBRknHIHIWHtNHk9qA2cg02HcLC/wwFL
         BnM5zIrPahZMKfwVz2sP2+18AjK4YstRW/4JKFDYwPs0Jbeyh7VBqatuLygg44RzCJMr
         FiKNJ/Ek4Y/Bmriod1VurSjqzeIj1k/jLeq6kMZ3p8kQDhni4qQp7VEm8RRpcY+Nx91d
         WcSRbtyGuyZiBWYSIm3mgpMxqOHDFNRgizo/DvvVEOeI6IHWXB749PGON9lWLaTBFkUN
         6M8A==
X-Forwarded-Encrypted: i=1; AJvYcCUJr/XVazAyQLB14Drn3H9R500hXBF9rCyCKcVqVVSz7iDHb4/1jrg7rc/oZuDWkUcENCks+C5ahT3uY+Z0U6oPrJjsnQKacetyKZea2ZU=
X-Gm-Message-State: AOJu0YzgIoR+MKn2tFRuhCb/slescrxDi4lg7aYXVVimrGjiWyFCbchX
	7OZxf8ktVB/8xZNBL8e5t3nF1F7Ela2VS74z5EgzbK5coKHpeARglrW2cAjJnRfD7jNNTFYpfNk
	=
X-Google-Smtp-Source: AGHT+IEwq48Jgw2CfTXIM1p6tKBcXU8w8YTVw9PxOxzR2rgCaB/xgaMzW6uokku+ziJf88PfZ7VWhw==
X-Received: by 2002:a17:906:97c8:b0:a5a:a2b6:ba8b with SMTP id a640c23a62f3a-a5aa2b6bf6fmr1182722466b.0.1716304619365;
        Tue, 21 May 2024 08:16:59 -0700 (PDT)
Message-ID: <245e535a-5b23-4d3e-83e5-dc797068652c@suse.com>
Date: Tue, 21 May 2024 17:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
 <2596964a55f710a300143aa5ae195566bacb4e00.1716260066.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <2596964a55f710a300143aa5ae195566bacb4e00.1716260066.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.05.2024 04:54, Marek Marczykowski-Górecki wrote:
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -522,9 +522,27 @@ extern struct rangeset *mmio_ro_ranges;
>  void memguard_guard_stack(void *p);
>  void memguard_unguard_stack(void *p);
>  
> +/*
> + * Add more precise r/o marking for a MMIO page. Range specified here
> + * will still be R/O, but the rest of the page (not marked as R/O via another
> + * call) will have writes passed through.
> + * The start address and the size must be aligned to SUBPAGE_MMIO_RO_ALIGN.
> + *
> + * This API cannot be used for overlapping ranges, nor for pages already added
> + * to mmio_ro_ranges separately.
> + *
> + * Return values:
> + *  - negative: error
> + *  - 0: success
> + */
> +#define SUBPAGE_MMIO_RO_ALIGN 8

This isn't just alignment, but also (and perhaps more importantly) granularity.
I think the name wants to express this.

> @@ -4910,6 +4921,260 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      return rc;
>  }
>  
> +/*
> + * Mark part of the page as R/O.
> + * Returns:
> + * - 0 on success - first range in the page
> + * - 1 on success - subsequent range in the page
> + * - <0 on error
> + *
> + * This needs subpage_ro_lock already taken */

Nit: Comment style (full stop and */ on its own line).

> +static int __init subpage_mmio_ro_add_page(
> +    mfn_t mfn, unsigned int offset_s, unsigned int offset_e)
> +{
> +    struct subpage_ro_range *entry = NULL, *iter;
> +    unsigned int i;
> +
> +    list_for_each_entry(iter, &subpage_ro_ranges, list)
> +    {
> +        if ( mfn_eq(iter->mfn, mfn) )
> +        {
> +            entry = iter;
> +            break;
> +        }
> +    }
> +    if ( !entry )
> +    {
> +        /* iter == NULL marks it was a newly allocated entry */
> +        iter = NULL;
> +        entry = xzalloc(struct subpage_ro_range);
> +        if ( !entry )
> +            return -ENOMEM;
> +        entry->mfn = mfn;
> +    }
> +
> +    for ( i = offset_s; i <= offset_e; i += SUBPAGE_MMIO_RO_ALIGN )
> +    {
> +        int oldbit = __test_and_set_bit(i / SUBPAGE_MMIO_RO_ALIGN,
> +                                        entry->ro_qwords);

Why int, not bool?

> +        ASSERT(!oldbit);
> +    }
> +
> +    if ( !iter )
> +        list_add(&entry->list, &subpage_ro_ranges);
> +
> +    return iter ? 1 : 0;
> +}
> +
> +/* This needs subpage_ro_lock already taken */
> +static void __init subpage_mmio_ro_remove_page(
> +    mfn_t mfn,
> +    int offset_s,
> +    int offset_e)

Can either of these be negative? The more that ...

> +{
> +    struct subpage_ro_range *entry = NULL, *iter;
> +    unsigned int i;

... this is used ...

> +    list_for_each_entry(iter, &subpage_ro_ranges, list)
> +    {
> +        if ( mfn_eq(iter->mfn, mfn) )
> +        {
> +            entry = iter;
> +            break;
> +        }
> +    }
> +    if ( !entry )
> +        return;
> +
> +    for ( i = offset_s; i <= offset_e; i += SUBPAGE_MMIO_RO_ALIGN )

... with both of them?

> +        __clear_bit(i / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords);
> +
> +    if ( !bitmap_empty(entry->ro_qwords, PAGE_SIZE / SUBPAGE_MMIO_RO_ALIGN) )
> +        return;
> +
> +    list_del(&entry->list);
> +    if ( entry->mapped )
> +        iounmap(entry->mapped);
> +    xfree(entry);
> +}
> +
> +int __init subpage_mmio_ro_add(
> +    paddr_t start,
> +    size_t size)
> +{
> +    mfn_t mfn_start = maddr_to_mfn(start);
> +    paddr_t end = start + size - 1;
> +    mfn_t mfn_end = maddr_to_mfn(end);
> +    unsigned int offset_end = 0;
> +    int rc;
> +    bool subpage_start, subpage_end;
> +
> +    ASSERT(IS_ALIGNED(start, SUBPAGE_MMIO_RO_ALIGN));
> +    ASSERT(IS_ALIGNED(size, SUBPAGE_MMIO_RO_ALIGN));
> +    if ( !IS_ALIGNED(size, SUBPAGE_MMIO_RO_ALIGN) )
> +        size = ROUNDUP(size, SUBPAGE_MMIO_RO_ALIGN);
> +
> +    if ( !size )
> +        return 0;
> +
> +    if ( mfn_eq(mfn_start, mfn_end) )
> +    {
> +        /* Both starting and ending parts handled at once */
> +        subpage_start = PAGE_OFFSET(start) || PAGE_OFFSET(end) != PAGE_SIZE - 1;
> +        subpage_end = false;
> +    }
> +    else
> +    {
> +        subpage_start = PAGE_OFFSET(start);
> +        subpage_end = PAGE_OFFSET(end) != PAGE_SIZE - 1;
> +    }
> +
> +    spin_lock(&subpage_ro_lock);
> +
> +    if ( subpage_start )
> +    {
> +        offset_end = mfn_eq(mfn_start, mfn_end) ?
> +                     PAGE_OFFSET(end) :
> +                     (PAGE_SIZE - 1);
> +        rc = subpage_mmio_ro_add_page(mfn_start,
> +                                      PAGE_OFFSET(start),
> +                                      offset_end);
> +        if ( rc < 0 )
> +            goto err_unlock;
> +        /* Check if not marking R/W part of a page intended to be fully R/O */
> +        ASSERT(rc || !rangeset_contains_singleton(mmio_ro_ranges,
> +                                                  mfn_x(mfn_start)));
> +    }
> +
> +    if ( subpage_end )
> +    {
> +        rc = subpage_mmio_ro_add_page(mfn_end, 0, PAGE_OFFSET(end));
> +        if ( rc < 0 )
> +            goto err_unlock_remove;
> +        /* Check if not marking R/W part of a page intended to be fully R/O */
> +        ASSERT(rc || !rangeset_contains_singleton(mmio_ro_ranges,
> +                                                  mfn_x(mfn_end)));
> +    }
> +
> +    spin_unlock(&subpage_ro_lock);
> +
> +    rc = rangeset_add_range(mmio_ro_ranges, mfn_x(mfn_start), mfn_x(mfn_end));
> +    if ( rc )
> +        goto err_remove;
> +
> +    return 0;
> +
> + err_remove:
> +    spin_lock(&subpage_ro_lock);
> +    if ( subpage_end )
> +        subpage_mmio_ro_remove_page(mfn_end, 0, PAGE_OFFSET(end));
> + err_unlock_remove:
> +    if ( subpage_start )
> +        subpage_mmio_ro_remove_page(mfn_start, PAGE_OFFSET(start), offset_end);
> + err_unlock:
> +    spin_unlock(&subpage_ro_lock);
> +    return rc;
> +}
> +
> +static void __iomem *subpage_mmio_get_page(struct subpage_ro_range *entry)
> +{
> +    void __iomem *mapped_page;
> +
> +    if ( entry->mapped )
> +        return entry->mapped;
> +
> +    mapped_page = ioremap(mfn_x(entry->mfn) << PAGE_SHIFT, PAGE_SIZE);

mfn_to_maddr() or some such?

> +    spin_lock(&subpage_ro_lock);
> +    /* Re-check under the lock */
> +    if ( entry->mapped )
> +    {
> +        spin_unlock(&subpage_ro_lock);
> +        iounmap(mapped_page);

What if ioremap() failed?

Jan

