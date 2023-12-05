Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A231780584A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:11:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648006.1011883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAX56-0000G5-Be; Tue, 05 Dec 2023 15:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648006.1011883; Tue, 05 Dec 2023 15:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAX56-0000D2-8Y; Tue, 05 Dec 2023 15:11:28 +0000
Received: by outflank-mailman (input) for mailman id 648006;
 Tue, 05 Dec 2023 15:11:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAX54-0000As-TI
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:11:26 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d94e738-9380-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 16:11:23 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c09fcfa9fso27865495e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:11:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g3-20020a056000118300b0033340b6d3a7sm7773767wrx.76.2023.12.05.07.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:11:22 -0800 (PST)
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
X-Inumbo-ID: 8d94e738-9380-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701789083; x=1702393883; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7KN7JCxDXGaTUes+xf4Le7aTmjMM4e/Ufb7G4jNAVIE=;
        b=PFlzt81MvFkYuqsMlW+pEbsfv/kIb4W9UgQWYxKq9n5C7YN067y4CudOvMZWP9rY6C
         +4Qp+8UvqJvCKha3v7VK89G1h5WCzyaM+KhON9yvRzmuhKMYD25DN7fJsVxb/MDqCtf4
         2Ygj1Ph17hk5s4YHU8HdvwrI/1+7DcXrASS9Cha8chpTqa+PKtzi48d7LcNp/U2uOKl2
         vpz+zmuRpo8K4ULrKFfTUMnrKlOCaO7bzDa15fviTFX3dPrb3hJxEVTsHnW2cZ+GpInb
         IWP6JYAMlGKkN5xYPlHsPN3fhj3fF58QAVxfYEuY2/9otkm9llnU3NXmWkuE/Bm0FLNs
         /cSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701789083; x=1702393883;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KN7JCxDXGaTUes+xf4Le7aTmjMM4e/Ufb7G4jNAVIE=;
        b=gtxNlf8go8y+RwsmFoSkU91H3FtkUkYphKpQyqyelzQrXKJDynDdvsIBfCYj7yEpX6
         aWVcRquuQEMb926S9VYEcnzeZkggz0Cs6H6EdKpvoI1HqWfsX4QlZ2R3vmKrKiHtE5qr
         ZoWJHuqGU7b6O/7ULjxH3pplycJGE1ryjCAfElMEc5YJwiwNGph9hdPV9vLV7+iAzOmY
         3FGcLRc5+tJPn80kcb5WWuCbD4DD2YSxA/9VQACMnr+o9qS8vCO0+oLakgIeaFgBzGCA
         UuX7qPawP+Gv6RWBFqVExrgHrTObt/p8FR+K78btXgc/zUOBnFxVBTHl2WnZ0fcoVjNs
         4LsQ==
X-Gm-Message-State: AOJu0Yyu4AoINEpi1NJ6YQ3iHnZJc0iDZR7i6Y4LTKx2CpGRJR7cltFi
	ORtu5KBVROx935ggesr1ceA8hJfr974P63HfW3gQ
X-Google-Smtp-Source: AGHT+IHeAtOKWHSDJZWXcDcI0T/EnfyoqASQ997zZ3CD2Ol8KwDYF58jKHfM/Uvv8NzzYw9cDQ9IWg==
X-Received: by 2002:a05:600c:11cf:b0:40c:5ce:d4ec with SMTP id b15-20020a05600c11cf00b0040c05ced4ecmr1560602wmi.369.1701789083068;
        Tue, 05 Dec 2023 07:11:23 -0800 (PST)
Message-ID: <d94a20ea-67fa-4219-9184-3d7dd9bcf646@suse.com>
Date: Tue, 5 Dec 2023 16:11:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] x86/iommu: remove regions not to be mapped
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-5-roger.pau@citrix.com>
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
In-Reply-To: <20231204094305.59267-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2023 10:43, Roger Pau Monne wrote:
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2136,6 +2136,54 @@ int __hwdom_init xen_in_range(unsigned long mfn)
>      return 0;
>  }
>  
> +int __hwdom_init remove_xen_ranges(struct rangeset *r)
> +{
> +    paddr_t start, end;
> +    int rc;
> +
> +    /* S3 resume code (and other real mode trampoline code) */
> +    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
> +                               PFN_DOWN(bootsym_phys(trampoline_end)));
> +    if ( rc )
> +        return rc;
> +
> +    /*
> +     * This needs to remain in sync with the uses of the same symbols in
> +     * - __start_xen()
> +     * - is_xen_fixed_mfn()
> +     * - tboot_shutdown()
> +     */

As you're duplicating this comment from xen_in_range(), you want to
- also mention xen_in_range() here,
- also update xen_in_range()'s comment,
- also update the respective comments in __start_xen() that also mention
  xen_in_range().
Everything else here looks good to me.

Jan

