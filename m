Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 024308956D6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 16:34:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700168.1092856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfDV-0005CB-6D; Tue, 02 Apr 2024 14:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700168.1092856; Tue, 02 Apr 2024 14:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfDV-00059q-2y; Tue, 02 Apr 2024 14:34:25 +0000
Received: by outflank-mailman (input) for mailman id 700168;
 Tue, 02 Apr 2024 14:34:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrfDT-00059Z-MF
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 14:34:23 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18d098f0-f0fe-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 16:34:22 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4156a2aeb43so14469405e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 07:34:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j7-20020adfc687000000b0033ec9ddc638sm14297152wrg.31.2024.04.02.07.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 07:34:21 -0700 (PDT)
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
X-Inumbo-ID: 18d098f0-f0fe-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712068462; x=1712673262; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NCuwUsr7wwEHSPixRvAPKuDTqGjlvcbwydfybkudV/c=;
        b=cm+X/Sff/NBdLNE8IGYOG3jVOWuxUZrBQKFL6o2+8tWMoyeo/P8ZHkkVX3fCINnY9b
         XdIbJX5e88EJsedddI+LMf62VbsMIn9LUr5dssmZdjVGYgpWHo/FE7HP+9lha9RFkBSo
         tH8Ge2atoWFBYX+p6xfQFeeqA1dvl5wD7ngcgd03r0PoGTXa7jYYbyfVKGxksH3k9Gia
         RF5XDp5RcMLSjCpJHFLswJXbwdAQEIrXu8qTxxgO4kCnnn/InHzYyD4hv2Boxf1bHS/d
         dStlWktr2gRHvnm4Qvx3FypT3d/HwRtLftzaFfsFBkDqfWKsuB1semUI/tbPTsTzcMzQ
         yYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712068462; x=1712673262;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NCuwUsr7wwEHSPixRvAPKuDTqGjlvcbwydfybkudV/c=;
        b=CSHbTzM+SEMlrMQRCTYwo/UjaP+WQXrTD5j+TYcrRsEXlF4XV+qGCZ4FLnBoMvLgTV
         /mwM45DHk+vyJKLVQK5sDzqhGoPfgmgeUyuVtHsiK2YgaSa0Z+mSETh8FrxRlOHIgBKN
         7RiUsiKF2faQulDMScEsoNlJ9eiuf32k01ZIXv1/CxqsTUCkp8mKmoZgtezN6FtuTiuY
         r0QGrS6udCq+XCVC/+yDETbmiAMKIauPkQlllXecOZenFfLFwl8iLhqXHBGQuJOat9+o
         9fJKbZr3IwKMQi52lt87Hs1dGQzkRwUfaF8OixgG0/dycp263/Qri+dpiRwJsnbMUosV
         GSiA==
X-Forwarded-Encrypted: i=1; AJvYcCUAaxZr7l1fUs9FwBeYmVbcVBPhhWJob88eI3vm3cQOu1MP0SReeVBmXVhgvCWhv4I6hqHv0WfV1qvmDjVfZnY2dc/J1uD3qsYBXy1XxhQ=
X-Gm-Message-State: AOJu0Yz4REPBe27krDmZz0oSNtX1/GsDaJNNnfT47qeNMqNmwL5HHNcz
	yeT8FJaeLFPqfBrBMnjyGl6tbWlskJL6alIyM/qM4YsORDL52S0kgmsI1tGzOw==
X-Google-Smtp-Source: AGHT+IHWVV7ZCmImhgx4G7BkQx41Yrh1MTFJCaii7Lke5l7MqA4SPABoiltTosTW8T0/9HTLKivYSg==
X-Received: by 2002:a05:600c:3556:b0:414:f58:a086 with SMTP id i22-20020a05600c355600b004140f58a086mr9862237wmq.6.1712068461963;
        Tue, 02 Apr 2024 07:34:21 -0700 (PDT)
Message-ID: <46a99837-fbb4-4dc9-a78c-634bee5c00a5@suse.com>
Date: Tue, 2 Apr 2024 16:34:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240327215102.136001-1-jason.andryuk@amd.com>
 <20240327215102.136001-5-jason.andryuk@amd.com>
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
In-Reply-To: <20240327215102.136001-5-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 22:51, Jason Andryuk wrote:
> v6:
> Select alignment from, in order, Note, PHDRs, then default

The comment in the public header also needs to reflect this change.

> +static bool __init check_and_adjust_load_address(
> +    const struct domain *d, struct elf_binary *elf, struct elf_dom_parms *parms)
> +{
> +    paddr_t reloc_base;
> +
> +    if ( check_load_address(d, elf) )
> +        return true;
> +
> +    if ( !parms->phys_reloc )
> +    {
> +        printk("%pd kernel: Address conflict and not relocatable\n", d);
> +        return false;
> +    }
> +
> +    reloc_base = find_kernel_memory(d, elf, parms);
> +    if ( !reloc_base )
> +    {
> +        printk("%pd kernel: Failed find a load address\n", d);
> +        return false;
> +    }
> +
> +    if ( opt_dom0_verbose )
> +        printk("%pd kernel: Moving [%p, %p] -> [%"PRIpaddr", %"PRIpaddr"]\n", d,
> +               elf->dest_base, elf->dest_base + elf->dest_size - 1,
> +               reloc_base, reloc_base + elf->dest_size - 1);
> +
> +    parms->phys_entry = reloc_base +
> +                            (parms->phys_entry - (uintptr_t)elf->dest_base);

I think this would be easier to read as

    parms->phys_entry =
        reloc_base + (parms->phys_entry - (uintptr_t)elf->dest_base);

Everything else looks good to me now.

Jan

