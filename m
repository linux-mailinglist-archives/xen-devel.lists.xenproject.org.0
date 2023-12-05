Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358238057E2
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:51:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647980.1011823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWl7-0000dN-F6; Tue, 05 Dec 2023 14:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647980.1011823; Tue, 05 Dec 2023 14:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWl7-0000ax-C1; Tue, 05 Dec 2023 14:50:49 +0000
Received: by outflank-mailman (input) for mailman id 647980;
 Tue, 05 Dec 2023 14:50:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAWl5-0000ar-LL
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:50:47 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abfd4d7a-937d-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 15:50:46 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3332ad5b3e3so4107691f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 06:50:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u29-20020adfa19d000000b003332db7d91dsm13280602wru.39.2023.12.05.06.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 06:50:45 -0800 (PST)
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
X-Inumbo-ID: abfd4d7a-937d-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701787846; x=1702392646; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7qLqTbRP5u4rxG8SX4Y7wH/O9oBeBnRlY48dCWEpWlk=;
        b=G8gxEwynstU/rUldO6G2DETFaYqh5HK26Y5yZ6G9GRUR3qOxX/+O51B47rEXfneANA
         Jp3b9lfewJrwRWt2KRKW6wvqTHAWl9Ra27xVIo/GLxF8nThTaekJSY/iN187XzJ4gVB3
         hscugi5ExMr7h2GdmVBST0Plyn63cnTpXD4f1NMdMjFcJXqSSO+rw19SYpMSDh10hbIx
         ln2Xq+1z1HMW28HBCRzhvJJUSVudRYK7xu33zlvkKcRGo52J6jUM1nLLCRI0H96kYNrJ
         fPgVANDI3vcn+JrCoz+jbUdODsYbbMhNnZi+pD0Xvgb6rHOiQYRZzYjGYtKN0kck0Z9W
         IsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701787846; x=1702392646;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7qLqTbRP5u4rxG8SX4Y7wH/O9oBeBnRlY48dCWEpWlk=;
        b=tO0zhoB4r8+yHiodVPf0CRZm29VEFiSvQaRG2yIyb+YiLLe0fyBRNq6B5pVNttT1z0
         y5gE0R+FyVfaJFR3wjBqfstezRXO0j5eAnxBRSCfOvWA7/fWYbhwNr6k9pg1BmyePbTC
         Pbap8g28Hf/2Uyo54ex/yIkQ+X8nCH3LPAPsJwixYS1EZBu3wt7+yX+3uLuYZCrEwZAx
         GJ0jeuDidZPid4pEDSSLreYA5slIb6v6xXAY4G+ah3gEtPC3G5W7tlb2f9EESGsclijR
         SxSXsZYCgvUwQKcKKFVkAYZHbl7FY/24Sc91GL8QTg5uy7F3Fbi8KsDGQK+rscZ7xdDg
         jG0g==
X-Gm-Message-State: AOJu0Yw0ULHPRB/B7zDCoY1mZ/wYmNrtpVd78CTA948VkSZPVUkDGzni
	aWhMWLnzJvOeSTF+wtjjJbgj
X-Google-Smtp-Source: AGHT+IFe1bpUVLYeBfF+eKFEPox/PE8MtVE41c2XzupOVJ2XIZ9Ix6NsnTJe2KfwpYi+VEijJ8Hwsg==
X-Received: by 2002:a5d:4b42:0:b0:333:7c5:560d with SMTP id w2-20020a5d4b42000000b0033307c5560dmr4735446wrs.10.1701787845639;
        Tue, 05 Dec 2023 06:50:45 -0800 (PST)
Message-ID: <93b57f96-e47e-493b-b0f4-a8183ba8466f@suse.com>
Date: Tue, 5 Dec 2023 15:50:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] x86/iommu: introduce a rangeset to perform hwdom
 IOMMU setup
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-4-roger.pau@citrix.com>
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
In-Reply-To: <20231204094305.59267-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2023 10:43, Roger Pau Monne wrote:
> This change just introduces the boilerplate code in order to use a rangeset
> when setting up the hardware domain IOMMU mappings.  The rangeset is never
> populated in this patch, so it's a non-functional change as far as the mappings
> the domain gets established.
> 
> Note there's a change for HVM domains (ie: PVH dom0) that will get switched to
> create the p2m mappings using map_mmio_regions() instead of
> p2m_add_identity_entry(), so that ranges can be mapped with a single function
> call if possible.  Note that the interface of map_mmio_regions() doesn't allow
> creating read-only mappings, but so far there are no such mappings created for
> PVH dom0 in arch_iommu_hwdom_init().

I don't understand this paragraph: The rangeset remains empty, so nothing is
changing right here. DYM there is going to be such a change as a result of
this patch, but in a later part of this series?

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -370,10 +370,77 @@ static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
>      return perms;
>  }
>  
> +struct map_data {
> +    struct domain *d;
> +    unsigned int flush_flags;
> +    bool ro;
> +};
> +
> +static int __hwdom_init cf_check identity_map(unsigned long s, unsigned long e,
> +                                              void *data)
> +{
> +    struct map_data *info = data;
> +    struct domain *d = info->d;
> +    long rc;
> +
> +    if ( iommu_verbose )
> +        printk(XENLOG_INFO " [%010lx, %010lx] R%c\n",
> +               s, e, info->ro ? 'O' : 'W');
> +
> +    if ( paging_mode_translate(d) )
> +    {
> +        if ( info->ro )
> +        {
> +            ASSERT_UNREACHABLE();
> +            return 0;
> +        }
> +        while ( (rc = map_mmio_regions(d, _gfn(s), e - s + 1, _mfn(s))) > 0 )
> +        {
> +            s += rc;
> +            process_pending_softirqs();
> +        }
> +    }
> +    else
> +    {
> +        const unsigned int perms = IOMMUF_readable | IOMMUF_preempt |
> +                                   (info->ro ? 0 : IOMMUF_writable);
> +
> +        if ( info->ro && !iomem_access_permitted(d, s, e) )

How is r/o-ness related to iomem_access_permitted()? The present callers
are such that there is a connection, but that's invisible here. I guess
either the field wants to change name (maybe mmio_ro or ro_mmio or even
just mmio), or there wants to be a comment.

> +        {
> +            /*
> +             * Should be more fine grained in order to not map the forbidden
> +             * frame instead of rejecting the region as a whole, but it's only
> +             * for read-only MMIO regions, which are very limited.
> +             */

How certain are you/we that no two adjacent ones may appear, with
different permissions granted to Dom0?

> +            printk(XENLOG_DEBUG
> +                   "IOMMU read-only mapping of region [%lx, %lx] forbidden\n",
> +                   s, e);
> +            return 0;
> +        }
> +        while ( (rc = iommu_map(d, _dfn(s), _mfn(s), e - s + 1,
> +                                perms, &info->flush_flags)) > 0 )
> +        {
> +            s += rc;
> +            process_pending_softirqs();
> +        }
> +    }
> +    ASSERT(rc <= 0);
> +    if ( rc )
> +        printk(XENLOG_WARNING
> +               "IOMMU identity mapping of [%lx, %lx] failed: %ld\n",
> +               s, e, rc);
> +
> +    /* Ignore errors and attempt to map the remaining regions. */
> +    return 0;
> +}
> +
>  void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>  {
>      unsigned long i, top, max_pfn, start, count;
>      unsigned int flush_flags = 0, start_perms = 0;
> +    struct rangeset *map;
> +    struct map_data map_data = { .d = d };
> +    int rc;
>  
>      BUG_ON(!is_hardware_domain(d));
>  
> @@ -397,6 +464,10 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>      if ( iommu_hwdom_passthrough )
>          return;
>  
> +    map = rangeset_new(NULL, NULL, 0);
> +    if ( !map )
> +        panic("IOMMU init: unable to allocate rangeset\n");
> +
>      max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
>      top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
>  
> @@ -451,6 +522,24 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>              goto commit;
>      }
>  
> +    if ( iommu_verbose )
> +        printk(XENLOG_INFO "d%u: identity mappings for IOMMU:\n",
> +               d->domain_id);

%pd: ?

> +    rc = rangeset_report_ranges(map, 0, ~0UL, identity_map, &map_data);
> +    if ( rc )
> +        panic("IOMMU unable to create mappings: %d\n", rc);
> +    if ( is_pv_domain(d) )
> +    {
> +        map_data.ro = true;
> +        rc = rangeset_report_ranges(mmio_ro_ranges, 0, ~0UL, identity_map,
> +                                    &map_data);
> +        if ( rc )
> +            panic("IOMMU unable to create read-only mappings: %d\n", rc);
> +    }
> +
> +    rangeset_destroy(map);

This could move up, couldn't it?

>      /* Use if to avoid compiler warning */
>      if ( iommu_iotlb_flush_all(d, flush_flags) )

Don't you need to fold map.flush_flags into flush_flags ahead of this call?
Or can the variable perhaps go away altogether, being replaced by the struct
field?

Jan

>          return;


