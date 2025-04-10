Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A4BA84023
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 12:10:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945204.1343445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2orR-0007rp-2n; Thu, 10 Apr 2025 10:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945204.1343445; Thu, 10 Apr 2025 10:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2orQ-0007qS-W1; Thu, 10 Apr 2025 10:10:16 +0000
Received: by outflank-mailman (input) for mailman id 945204;
 Thu, 10 Apr 2025 10:10:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2orP-0007qF-4L
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 10:10:15 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe724179-15f3-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 12:10:14 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso4971115e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 03:10:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893f0b09sm4405994f8f.63.2025.04.10.03.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 03:10:13 -0700 (PDT)
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
X-Inumbo-ID: fe724179-15f3-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744279813; x=1744884613; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lAdcojYXNmts2RZv+NS1hU6JVJ7zLv+o+fbk/NGOn2A=;
        b=P/No0bjyNX02A+dtns3K3p8+CkNbykdZ2yv9X5YXpaw+Kz9EaQRazp1DgIugQxGvT5
         nwDL/QJKw8YTxIUWAGsd35nW/5ESSEC//uAbOglyfgdIfnAIWHoCAU1mjaVaTEH+HGCo
         17wHDXr3Q96W9qwXsrlcSslhmG8Fa0Wx57VH5ilEhJQippZ3W/tP7FmKZ7fYjBVV5pl/
         aQBaO+jkbI0vbarFMURD3WoxKvXW7/8LrNS6ekEXbrPW2CGE/zug7RwLAzAz092kwl28
         R/KvxGpUQWi5TGUFTQxlqGyM7ksrBcHDsBls4Fwni6xoUgSI3HYuj2pZb5j/Z5YFk2u0
         kP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279813; x=1744884613;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAdcojYXNmts2RZv+NS1hU6JVJ7zLv+o+fbk/NGOn2A=;
        b=QVqtQpfV8i4kdrC4wGRNCORU8twq9pUYUzleAcnh1VK3emT5pqwzBX+gYqDxeOy6dl
         PISxZt+O+ZSl7rkY+WA+FamJILtL3X0GBqN5GIFRVfAn5cM1/pI1ksKES1I3SRxw2P3x
         6mAGoZupIQGiKLPSGEcuyMRryVdyVquHCWF5oZ9Z+ztY2fXCzZsc3KFL2GHeiY1X5Vh6
         BGCjfDs2bqvzbomM1JDAcp/rZ2Z7uQ/ceGm8a/6jdGhbQ5AU8j0QinfVeV/88qG4kcmc
         y29z1bCZiau7glIC7r8YeLrYBTU+3fEBUq98eUg25uTM2UiaD3sRlDyIxCaPJF1AHugT
         CRYg==
X-Forwarded-Encrypted: i=1; AJvYcCXunihmjLAjMJq0OxxXx9/ivk20s7kzjfvbULbtLkbx6uv3y/FOKV6dx7RPrX/N3ViGTABrSjpsXMk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIL3cre7Dr2lxoTCALUA4sxxTr2TuQfyNrrsb94xm/x6TXtN9j
	Zanbj0Dmmb0nY/ZuI9beYd+2U4ton5AAp0PqO6XSDzOkJRzEy2kIJzPXW/4WYw==
X-Gm-Gg: ASbGncuSTQmfs0YDIVdRpg0eYkqC16rafRyXwQ3/osIx7DGzlQNWFIqPphhfob0hWan
	uGhNXoFtBqdHXc8fD5LckPP4DlZLuaB959JTZPNa+7tZZcLADd9RCRdFhw/IMwmnDDNnZats7ll
	1Bj/D2wkU3llSbP/ugkHCXHRz6QFPjsVPSOW+SBEdyjP4fOIjg2dvEKAePsUz4n7Pqe5jMiixmV
	Ee9bkZ4c9bGtp1GJ9HUitrCSZJW4/2j6m8qvG+QeO30owCcJBxA6fZmYYQYtiqDmoF/qSfOhy9D
	WtZAYEtyslIq05xLYdrmB2y41UCWZ4PSUbMyWcQhk9+NWMXfO0ZW7PNBuLe8XYO6cuWRvVAP9oD
	1FJC47JQhJKkhCCvV+ezDYaO0IA==
X-Google-Smtp-Source: AGHT+IGDdczee2yei4Hnu3vDzTnI7UZSwb7toHT3DN+AZc1shTQP8cqqGcidLYp8+KEDmWMbxkWMXA==
X-Received: by 2002:a05:600c:4c19:b0:43c:f00b:d581 with SMTP id 5b1f17b1804b1-43f2f359441mr11236275e9.29.1744279813453;
        Thu, 10 Apr 2025 03:10:13 -0700 (PDT)
Message-ID: <04fcb576-7a6f-48d9-abb5-72f5fd728013@suse.com>
Date: Thu, 10 Apr 2025 12:10:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/16] x86/hyperlaunch: initial support for hyperlaunch
 device tree
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-8-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-8-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/domain-builder/core.c
> +++ b/xen/arch/x86/domain-builder/core.c
> @@ -44,6 +44,21 @@ void __init builder_init(struct boot_info *bi)
>              break;
>          }
>      }
> +
> +    if ( bi->hyperlaunch_enabled )
> +    {

Not knowing what else if going to appear here and in what shape, could the
if() here be avoided by making case blocks in the earlier switch setting
the field to false (which is kind of redundant anyway with it starting out
false) use "return" instead of "break"? The the setting of the field to
true could also be centralized below the switch().

> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -13,6 +13,36 @@
>  
>  #include "fdt.h"
>  
> +static int __init find_hyperlaunch_node(const void *fdt)
> +{
> +    int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
> +
> +    if ( hv_node >= 0 )
> +    {
> +        /* Anything other than zero indicates no match */
> +        if ( fdt_node_check_compatible(fdt, hv_node, "hypervisor,xen") )
> +            return -ENODATA;
> +        else
> +            return hv_node;

Could I talk you into omitting such unnecessary "else"?

> @@ -20,7 +50,41 @@ int __init has_hyperlaunch_fdt(const struct boot_info *bi)
>  
>      if ( !fdt || fdt_check_header(fdt) < 0 )
>          ret = -EINVAL;
> +    else
> +        ret = find_hyperlaunch_node(fdt);
> +
> +    bootstrap_unmap();
> +
> +    return ret < 0 ? ret : 0;
> +}
> +
> +int __init walk_hyperlaunch_fdt(struct boot_info *bi)
> +{
> +    int ret = 0, hv_node, node;
> +    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
> +
> +    if ( unlikely(!fdt) )
> +        return -EINVAL;
> +
> +    hv_node = find_hyperlaunch_node(fdt);
> +    if ( hv_node < 0 )
> +    {
> +        ret = hv_node;
> +        goto err_out;
> +    }
> +
> +    fdt_for_each_subnode(node, fdt, hv_node)
> +    {
> +        ret = fdt_node_check_compatible(fdt, node, "xen,domain");
> +        if ( ret == 0 )
> +            bi->nr_domains++;
> +    }
> +
> +    /* Until multi-domain construction is added, throw an error */
> +    if ( !bi->nr_domains || bi->nr_domains > 1 )

Simply "!= 1"?

> --- a/xen/arch/x86/domain-builder/fdt.h
> +++ b/xen/arch/x86/domain-builder/fdt.h
> @@ -11,11 +11,16 @@ struct boot_info;
>  
>  #ifdef CONFIG_DOMAIN_BUILDER
>  int has_hyperlaunch_fdt(const struct boot_info *bi);
> +int walk_hyperlaunch_fdt(struct boot_info *bi);
>  #else
>  static inline int __init has_hyperlaunch_fdt(const struct boot_info *bi)
>  {
>      return -EINVAL;
>  }
> +static inline int __init walk_hyperlaunch_fdt(struct boot_info *bi)
> +{
> +    return -EINVAL;
> +}

There's no need for this stub (nor the has_hyperlaunch_fdt() one, as I
notice only now) - even with present arrangements calling code is guarded
such that DCE will take care of eliminating the call, and hence having a
declaration suffices.

Jan

