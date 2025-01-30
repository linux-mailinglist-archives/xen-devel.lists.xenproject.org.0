Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3368BA230BA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 16:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879651.1289868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdW2i-00026V-9O; Thu, 30 Jan 2025 15:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879651.1289868; Thu, 30 Jan 2025 15:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdW2i-00024I-6l; Thu, 30 Jan 2025 15:01:20 +0000
Received: by outflank-mailman (input) for mailman id 879651;
 Thu, 30 Jan 2025 15:01:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdW2g-00023o-Bk
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 15:01:18 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0deefdc2-df1b-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 16:01:16 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ab6da1bb1a8so14671266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 07:01:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7be3sm132767666b.20.2025.01.30.07.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 07:01:14 -0800 (PST)
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
X-Inumbo-ID: 0deefdc2-df1b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738249276; x=1738854076; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=toZgCuzt7GCQoVpVrSpNaSw3cbETjFUKeVCvGGIxgzs=;
        b=HOBXdSwiRnue6Dhpto21eFUKrAxRBhj8aL/s7W4FsU//DMvScyDGtuOU1yG9coxfsy
         c2xgLc2kr+UgYEYb+4OtCfptSIhVgK6bypMjjzHufElsk3vQo9Cn4yEcRmfzDjW2sQe8
         rSPhNXR/3SNxrYLTbpEA/I5xqGc936ZezsfYFcVuvtYZM7yfVKEuCUf1CrA1vYzilFtW
         +Ag4AiSfLFNplKdqfIC012UAvzbz7LbRPPc78ZCsbL+sYa4AkYwKXmpQ29TInLMdVWFC
         DUm3x3MDP2/k6WDGmYLRtelYGSjm2BELy2D5rqu6U2nHuqA4WpPD71SZaK6d9lLtiazT
         QU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738249276; x=1738854076;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toZgCuzt7GCQoVpVrSpNaSw3cbETjFUKeVCvGGIxgzs=;
        b=i5vnLW7QnMGRRgTecG89Hj02V4lffYo7Pol/VRDgIF1TH2S9+Hnrlw1JZ7ffJ1U8wP
         WXN58bSwCLjrMKRJx9i06CG7ec6vg70dq0u6gNdAzt0PtSaQVnfh+Du9A7ro50nt+Wlg
         6s5u+UUJEsFjNou4lnargeU4VVmfa39XBvfZbjTh5WfrZQPYlMyoP89cdMCuLqXyJVuM
         x/JbybUW+rf1+W39LdUbb8EVHSKXjmRFUQnBt3y37tnaYTDtHWtsMFAF2w8NtrQfq8OR
         0gLF3mV/nq4xZkU9qD+P2bsBfR1Re32QgYS65C9QJULlMWVbzmhYEKzQq+KqIuyBXHIz
         q5bg==
X-Forwarded-Encrypted: i=1; AJvYcCVpZcKVNWEnj4T/Vd1E1ySaeYBlympz3aowz8e5aUAwC6QgMU7DU66yRmsgkWBioaj18XcaLsRpAKo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4fjxERLdsCWUBaltSCvFfpYvjD+yHEx1gUi5YgMQROVLA65GL
	5C5mFUjBugtURCJvZbm7D4m/PUTwfYSP6vDmHXxJLrGb1NuXgoibuo7dAx3+Wg==
X-Gm-Gg: ASbGnctRdZ0s7Cw5VyffY36P83YSRIJ7iwL1idafYQWq9MtVOAhzIEu+5dVMtMwDzdP
	LPnfFOkjceN3P6TZAgGPOZFUqAi1Gu+mT9NVKhKaJwzIq9lszeP7HG2dQrsIqi7V+3IMGI3Y69K
	xTneEgUoWtQvP6OoEwHDqLO4Sa1W2WQ+3gjsH9f8X2cWpEm/+SjucZwws+nB1hm/gGpDfxZNLBX
	9f+qd3bkFFNisXPFaCDXI0SfxH07VydBrQ+AtgxGDOEHC/KNpp8c1/j+qXo/uQC9Cin3Jod8yRK
	F1mCpwvTwbialTnLGnMZ3ntgDppUJ9xQ7srOPsJdzvlQ8IyGVDivr2D880fwsJ6qqGPrL7EVRaA
	H
X-Google-Smtp-Source: AGHT+IFnG8Bc2cXaR2m+qMQnE1vy55ehxO1J76HfZaQqD56qSY6Ap1+4v5E0uxkxFhQPmXmqXvAtUg==
X-Received: by 2002:a17:907:7fa8:b0:aa6:2704:4840 with SMTP id a640c23a62f3a-ab6cfe401d5mr770487366b.51.1738249274760;
        Thu, 30 Jan 2025 07:01:14 -0800 (PST)
Message-ID: <cbc3b3a2-60bd-4fdc-a4ac-dfa77420e454@suse.com>
Date: Thu, 30 Jan 2025 16:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] x86/hyperlaunch: initial support for hyperlaunch
 device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-8-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241226165740.29812-8-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.2024 17:57, Daniel P. Smith wrote:
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -13,14 +13,77 @@
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
> +    }
> +    else
> +    {
> +        /* Lood for dom0less config */
> +        int node, chosen_node = fdt_path_offset(fdt, "/chosen");
> +        if ( chosen_node < 0 )

Nit: Blank line between declaration(s) and statement(s) please. I'd also
question "node" being plain int, if libfdt didn't have it like this.

> +            return -ENOENT;
> +
> +        fdt_for_each_subnode(node, fdt, chosen_node)
> +        {
> +            if ( fdt_node_check_compatible(fdt, node, "xen,domain") == 0 )
> +                return chosen_node;
> +        }
> +    }
> +
> +    return -ENODATA;
> +}
> +
>  int __init has_hyperlaunch_fdt(struct boot_info *bi)
>  {
>      int ret = 0;
>      const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
>  
> -    if ( fdt_check_header(fdt) < 0 )
> +    if ( !fdt || fdt_check_header(fdt) < 0 )
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

const?

> +{
> +    int ret = 0, hv_node, node;
> +    void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);

const?

Jan

