Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6B2818BD0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 17:06:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657010.1025604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcc8-0003hP-C3; Tue, 19 Dec 2023 16:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657010.1025604; Tue, 19 Dec 2023 16:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcc8-0003fF-96; Tue, 19 Dec 2023 16:06:36 +0000
Received: by outflank-mailman (input) for mailman id 657010;
 Tue, 19 Dec 2023 16:06:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFcc6-0003f7-VD
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 16:06:34 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94579cd2-9e88-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 17:06:33 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d2e5e8d1dso4003375e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 08:06:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c358600b0040d2d33312csm1834107wmq.2.2023.12.19.08.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 08:06:32 -0800 (PST)
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
X-Inumbo-ID: 94579cd2-9e88-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703001993; x=1703606793; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hcryKmz36kIW6BYIztc7wshL7qYd2Cg0gQ5SMuE1uss=;
        b=adduQ5+4Qtz61lxfQPRuNJfXPQhfC/Vpggh9bRIWST5jZuyAbY6+fp/QIufiFUAEHg
         OtZD+txXeGMxE0In+uvkiXbjLnsfAe9Ez/wVL5aXLd1AzrumJnHsxM9KJ1ZQiuKqggA+
         BG6Nyck7fyXsurPY8UCiD8flYHI2JNLWiU/tCVWNPBSKZt5AtvhKDVUyIxlcWtmv4f7a
         ECy/GgdudM34g98ryYzB2NI2FMKze2X1zLfn08f1StoyxEaGshDLE4sTjM90sZiaqIxb
         KD+ofEEnx2J39XxYlL4yo/UnrumWxVylLZEHVLhLomsCCa8fuTd8f3ICfPcpTNOVMvPP
         qmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703001993; x=1703606793;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hcryKmz36kIW6BYIztc7wshL7qYd2Cg0gQ5SMuE1uss=;
        b=uJJARHYknq2C4dOYk7V8EE5ibBK8YaQYzLE8bD+jMivS3hqQeRFrxdQdtOi7EksJCb
         Qc6hZjW+jNhYZwlLnT/0dZbEgXiMdzAco1hSFjTQFNVWTG4feSgBOzf0TnTyw6T62m/J
         +Yq8qUphJ4veev/2pIVerQKj6wp1Toj75CG0bd7btI+iFYziCSMXPHCzoj6JmAepsHMD
         BckeLc4PQdSSmCLrnmGQS+3kVo4sk4CSBzhf1iRcAPxIAxmfQ2KDhRJz48FxLVo8Wvg8
         4UU65PwoJDjP2RvuXcwPxBYL0sxJqSlT2f7EJCzAx5QjNCrNjsZJHZiuAAZZ9NDBZ1O8
         EKOg==
X-Gm-Message-State: AOJu0Yz3qz0PNrAm3mxGw7kRC56uvy6kfUOjW8RUfz378WQqdPErgMnf
	XA9rT3QiExxBBYTvhwDVimIBuEyykHpOI8JQRON+
X-Google-Smtp-Source: AGHT+IHP94TOJDh37TCJdxzytTao7Im6Ux24L2B+g0bThxa53USO8ZFtgqh3PBTeCy7Y8U6YLJnP/g==
X-Received: by 2002:a05:600c:474e:b0:40c:4b4e:95a6 with SMTP id w14-20020a05600c474e00b0040c4b4e95a6mr5646529wmo.94.1703001993073;
        Tue, 19 Dec 2023 08:06:33 -0800 (PST)
Message-ID: <454027bf-b07e-49cf-97de-009d431e5f4b@suse.com>
Date: Tue, 19 Dec 2023 17:06:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] x86/iommu: introduce a rangeset to perform hwdom
 IOMMU setup
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231215141832.9492-1-roger.pau@citrix.com>
 <20231215141832.9492-5-roger.pau@citrix.com>
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
In-Reply-To: <20231215141832.9492-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2023 15:18, Roger Pau Monne wrote:
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -370,10 +370,88 @@ static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
>      return perms;
>  }
>  
> +struct map_data {
> +    struct domain *d;
> +    unsigned int flush_flags;
> +    bool mmio_ro;
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
> +               s, e, info->mmio_ro ? 'O' : 'W');
> +
> +    if ( paging_mode_translate(d) )
> +    {
> +        if ( info->mmio_ro )
> +        {
> +            ASSERT_UNREACHABLE();
> +            return 0;

Is this meant to be in line with the main return statement's comment?
I'm inclined to ask for an actual error code (-EOPNOTSUPP?) here.

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
> +                                   (info->mmio_ro ? 0 : IOMMUF_writable);
> +
> +        /*
> +         * Read-only ranges are only created based on the contents of mmio
> +         * read-only rangeset, and hence need the additional iomem permissions
> +         * check.
> +         */
> +        while( info->mmio_ro && s <= e && !iomem_access_permitted(d, s, e) )

Nit: Missing blank after "while".

> +        {
> +            /*
> +             * Consume a frame per iteration until the reminder is accessible

Nit: remainder?

> +             * or there's nothing left to map.
> +             */
> +            if ( iomem_access_permitted(d, s, s) )
> +            {
> +                rc = iommu_map(d, _dfn(s), _mfn(s), 1, perms,
> +                               &info->flush_flags);
> +                if ( rc < 0 )
> +                    break;
> +                /* Must map a frame at least, which is what we request for. */
> +                ASSERT(rc == 1);
> +                process_pending_softirqs();
> +            }
> +            s++;
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
> @@ -397,6 +475,10 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
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
> @@ -451,8 +533,26 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>              goto commit;
>      }
>  
> +    if ( iommu_verbose )
> +        printk(XENLOG_INFO "%pd: identity mappings for IOMMU:\n", d);
> +
> +    rc = rangeset_report_ranges(map, 0, ~0UL, identity_map, &map_data);
> +    if ( rc )
> +        panic("IOMMU unable to create mappings: %d\n", rc);
> +    rangeset_destroy(map);
> +
> +    if ( is_pv_domain(d) )
> +    {
> +        map_data.mmio_ro = true;
> +        rc = rangeset_report_ranges(mmio_ro_ranges, 0, ~0UL, identity_map,
> +                                    &map_data);
> +        if ( rc )
> +            panic("IOMMU unable to create read-only mappings: %d\n", rc);
> +    }

As it stands identity_map() deliberately returns no error. Yet here
you panic() in case of receiving an error, despite that being impossible?

Also if we want/need to panic() here, can we avoid having two instances
of almost the same string literal in .rodata? Along the lines of

    rc = rangeset_report_ranges(map, 0, ~0UL, identity_map, &map_data);
    rangeset_destroy(map);
    if ( !rc && is_pv_domain(d) )
    {
        map_data.mmio_ro = true;
        rc = rangeset_report_ranges(mmio_ro_ranges, 0, ~0UL, identity_map,
                                    &map_data);
    }
    if ( rc )
        panic("IOMMU unable to create %smappings: %d\n",
              map_data.mmio_ro ? "read-only " : "", rc);

?

> +    map_data.flush_flags |= flush_flags;

So you decided to still keep the standalone "flush_flags" around. Is
there a particular reason?

Jan

