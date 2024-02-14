Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9176854A80
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 14:30:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680761.1058866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFKV-0003n7-Fo; Wed, 14 Feb 2024 13:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680761.1058866; Wed, 14 Feb 2024 13:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFKV-0003ki-D8; Wed, 14 Feb 2024 13:29:39 +0000
Received: by outflank-mailman (input) for mailman id 680761;
 Wed, 14 Feb 2024 13:29:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raFKU-0003jM-9M
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 13:29:38 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1917a68d-cb3d-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 14:29:37 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-411f42986e1so3367605e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 05:29:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h16-20020a056000001000b0033cdedb3e84sm3964907wrx.18.2024.02.14.05.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 05:29:36 -0800 (PST)
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
X-Inumbo-ID: 1917a68d-cb3d-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707917376; x=1708522176; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rPbjGDf8TwEUCNn9c+jGy03coUPmzqiLsxJcqNOBLPE=;
        b=cO0gHFnJbO38dUcHGjrsHqy953SgC4JmpPeR1J44HtL+wX2DL6SO+1ZAHu2blnFhjN
         he59y/ES86KorzAZM5mzh8Fr2apq7Um0+WOQR/mXtrqFvTe9p1p8jM+Xap4oqUlWwm/9
         /DY5y6gSwV5B6ExsaZLGmrAPEI3V4IHrzh4EZVJKlA7+rLmPvTpi0MxV8cqG4LrdOBUg
         5q9Lnp6Nx91dMXFRI+YI28CibAzf0X+yg7vF55k+i0gDhFsczxrZPEjrTt6ZadiykB9e
         zhO1jyHQS6CVcCmewJ9OPUXKYpDz71ONwDzVtb24ia2qqFd4X0DjqYBdk9KJRPedrv95
         p60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707917376; x=1708522176;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rPbjGDf8TwEUCNn9c+jGy03coUPmzqiLsxJcqNOBLPE=;
        b=iV40rX/G2rclRZWySjc6Ne0Trwuygau0jZb7eyNQ6cgJqU08pebRf64YVia5JQvZMh
         DG0sQkDmEul1ifYaYOj1bhMi0Z0At6VH2SuUZKmvSIlJEffoy3hJnzez/3woJF9TzkUJ
         9gdG9nrsqM5E2s8vtRoQ+JA0zxnxk22AUBaRDqfURCrq4A7DPBLF5tit5LYw2884Nl0N
         AWnK3gTZMS4Xhiqt110QAJvQrXlE3KkB5Ya0cdoq401r4AdrLJI4pq4gU8CUksb5pp0I
         N8a69otqQ3NLqHSvnscln9jHuTAdDU70xI9cGcitmWsXfnpjhK7kSt8+UmN+eNFW8IZg
         SrqA==
X-Forwarded-Encrypted: i=1; AJvYcCXGXSMLoNDxDanzHma+FjeVpNK6XeFJSo9T7kJ/IPvc8t837IaFMRy8q7cyAAr4gdIRgm953qXYBxUPVsMjx1wIJKCWRdg9qfxHNntFKns=
X-Gm-Message-State: AOJu0YyKXGygmKfOHuIhY8mXMR0QXE8MpnWaM6bfOp8BQ61Hbkp6NcEy
	lsAxtuyGF27UoS4mhptzTblSuBHMEOXXN5AvVeiFxEIPlCT6f2BuaKRjKzEpaMqei0uZTx96fSo
	=
X-Google-Smtp-Source: AGHT+IGAsy+86rwubyJeg5mFDTN0xo4pqz5SrPlCddDPRfhGWZmUSg9+3Et6lxyUZcAW5bBN6Z6LxQ==
X-Received: by 2002:a5d:5143:0:b0:33c:d5a7:4fc with SMTP id u3-20020a5d5143000000b0033cd5a704fcmr1824072wrt.16.1707917376565;
        Wed, 14 Feb 2024 05:29:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXE6OYxzKnF0xybTpGLJlSQkqfp2K+HA1hLK2pP9CIzpw5Xt354hg83W3CtRriNp6Yr4sQ1tozj7z+PW6tTr1vB/CK/kzWcL5orO32b84EbTP26RTW3rfyf48G40wN6nh1Z1golSpScUlQ=
Message-ID: <16de2e3e-7807-4754-852b-e486c1fde95c@suse.com>
Date: Wed, 14 Feb 2024 14:29:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] iommu/x86: use full addresses internally for the
 IVMD/RMRR range checks
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240214103741.16189-1-roger.pau@citrix.com>
 <20240214103741.16189-4-roger.pau@citrix.com>
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
In-Reply-To: <20240214103741.16189-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2024 11:37, Roger Pau Monne wrote:
> Adjust the code in the checker to use full addresses rather than frame numbers,
> as it's only page_get_ram_type() that requires an mfn parameter.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

In this very shape I'd like to leave this to Paul or Andrew: I'm not outright
opposed, but I think this either goes too far (most type-safety being lost
again), or not far enough (both callers convert addresses to MFNs, just for
them to be converted back here).

Jan

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -794,28 +794,26 @@ __initcall(adjust_irq_affinities);
>  
>  bool __init iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end)
>  {
> -    mfn_t addr;
> +    paddr_t s = mfn_to_maddr(start), e = mfn_to_maddr(end);
>  
> -    if ( e820_all_mapped(mfn_to_maddr(start), mfn_to_maddr(end) + PAGE_SIZE,
> -                         E820_RESERVED) )
> +    if ( e820_all_mapped(s, e + PAGE_SIZE, E820_RESERVED) )
>          return true;
>  
>      printk(XENLOG_WARNING
>             "%s: [%#lx, %#lx] is not (entirely) in reserved memory\n",
> -           prefix, mfn_to_maddr(start), mfn_to_maddr(end));
> +           prefix, s, e);
>  
> -    for ( addr = start; mfn_x(addr) <= mfn_x(end); addr = mfn_add(addr, 1) )
> +    for ( paddr_t addr = s; addr <= e; addr += PAGE_SIZE )
>      {
> -        unsigned int type = page_get_ram_type(addr);
> +        unsigned int type = page_get_ram_type(maddr_to_mfn(addr));
>  
>          if ( type == RAM_TYPE_UNKNOWN )
>          {
> -            if ( e820_add_range(mfn_to_maddr(addr),
> -                                mfn_to_maddr(addr) + PAGE_SIZE, E820_RESERVED) )
> +            if ( e820_add_range(addr, addr + PAGE_SIZE, E820_RESERVED) )
>                  continue;
>              printk(XENLOG_ERR
> -                   "%s: page at %#" PRI_mfn " couldn't be reserved\n",
> -                   prefix, mfn_x(addr));
> +                   "%s: page at %#lx couldn't be reserved\n",
> +                   prefix, paddr_to_pfn(addr));
>              return false;
>          }
>  
> @@ -829,9 +827,8 @@ bool __init iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end)
>                       RAM_TYPE_UNUSABLE) )
>              continue;
>  
> -        printk(XENLOG_ERR
> -               "%s: page at %#" PRI_mfn " can't be converted\n",
> -               prefix, mfn_x(addr));
> +        printk(XENLOG_ERR "%s: page at %#lx can't be converted\n",
> +               prefix, paddr_to_pfn(addr));
>          return false;
>      }
>  


