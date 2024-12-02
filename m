Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF059E0170
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 13:06:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846632.1261789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI5Bb-0001Lp-Tg; Mon, 02 Dec 2024 12:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846632.1261789; Mon, 02 Dec 2024 12:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI5Bb-0001J1-QO; Mon, 02 Dec 2024 12:05:55 +0000
Received: by outflank-mailman (input) for mailman id 846632;
 Mon, 02 Dec 2024 12:05:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI5Ba-0001Iv-SS
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 12:05:54 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5d2a490-b0a5-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 13:05:50 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-434a742481aso33404875e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 04:05:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0d9bef8sm149534845e9.7.2024.12.02.04.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 04:05:47 -0800 (PST)
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
X-Inumbo-ID: c5d2a490-b0a5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmIiLCJoZWxvIjoibWFpbC13bTEteDMyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM1ZDJhNDkwLWIwYTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTQxMTUwLjg4MzUyLCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733141150; x=1733745950; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vMfxcwDyeYhwaV3qN3UgSZfnc2TJWskP0eXG885FWlI=;
        b=Nl49V1R8gDL6U32z122pPCLvYQD/AyvzCjRqHs02/AhA3QAm8wZtL629nv8Z0DiD2N
         I4MBmIW3URp58rtljU95gE6AdT5FitXMwYpQR+OeVi7RGGa96srSt79Afywwp2qXio9I
         AVby0NSfzUyeSlxlDiENi8dB/eawnY3ctgmAsyBodHG0qKcctCCMuKuqZ0dZDrESGQu/
         l2dXuMG4p5YXSf2KGb/R+AYwUAWMd62tOsCvFBHFTxYVngZvIOknw8amaxndBeSCQGcw
         2LGw98u/F4aJ8jHDLHrzingt1XqEJjvj5WM54ZDXrGa0uxdMqTkazSw9fGOuFqFy0JPm
         8ueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733141150; x=1733745950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMfxcwDyeYhwaV3qN3UgSZfnc2TJWskP0eXG885FWlI=;
        b=NM4uMfoFkNaOo4xrC9iYm5BPAlELfnT8KFRXJbjiKB4KrjgPF8vEQ9RZ6LAhFjwR2X
         AfJKP7911H7LkzrO9Dg/awALyPImx0pVmTFmcWCSaBVoOUhro5qZH+/IoYNv8SU6Wexn
         vcbsjHLg5Cd1q+MV3kUX7vYDNXKLZ6hAcAkl5VuiJ9JALsDP/XDKNhaIqQSchZlKwN4D
         KSfeZCcwo25e7MVZHkEq1/JiXiacrHX1+KjjORRvr8CJp8ZPFkjnHKBThJOA+9TvN/4B
         lfDQQ68ufj90gzFq3tfjlwK6nuT/Ty219FyLCPZZKqLbiZ8UlWRyHzb/EB4+adeDuSZc
         uP8g==
X-Forwarded-Encrypted: i=1; AJvYcCVYV9HxW070iKJnfQL+5XkMw7R3U5Du7XhEpGchWRXvW9tGEQHxmPxXYT8MGZum2u4QvCMkLDHyLAY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkBUrT99rwq3iIc/gfPsqEYTnEgs5A0NjIZtSGylMrCke9QqwN
	D87C1dRFVZsDku6IYwaccYmhwFVs1L9O0qgKlOXJC+8qwzJ+B66pDYd4pwYBlA==
X-Gm-Gg: ASbGncvxx9SZlPMz6j6isQDpCjzKCGQ68CSP8+R1ak5WKLiHc3ghw6OAC3LqrDPukdU
	mnnlGtWkVkELMlIh63PK5o0DKCG9qPdnx+kOTzGqGkuIpwaTacT3m/DP/pLUQ9T61wrk5V4c205
	Zbd5jRKmHCH/+dVlqiWNkkXoWYDVpcQiHBXlMCSPCNYSpVvGKflOnsSs/xgcoKbJgt2y/PA3QvM
	V2ARqXucp+Zk55z2qy1aWemJl2emcXDhuw+C3VhwHn+tTvQZfNQA1wKHYru0PM0jSv777hbNc1q
	172YCOasV56OA6aAN8xAf0iU04refqSQVk0=
X-Google-Smtp-Source: AGHT+IGvBOxuDcuUe0rQfPksQn85tsrl38dlno8agmnTthlvxnbJGjVHSemVS1VcFWLSoyi8c1nkqQ==
X-Received: by 2002:a05:600c:3aca:b0:434:9e1d:7626 with SMTP id 5b1f17b1804b1-434a9df6a16mr187537915e9.25.1733141148788;
        Mon, 02 Dec 2024 04:05:48 -0800 (PST)
Message-ID: <5dc478be-7b8a-4966-8889-d4d40bda8770@suse.com>
Date: Mon, 2 Dec 2024 13:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] x86/hyperlaunch: specify dom0 mode with device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-13-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241123182044.30687-13-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2024 19:20, Daniel P. Smith wrote:
> --- a/xen/arch/x86/domain_builder/fdt.c
> +++ b/xen/arch/x86/domain_builder/fdt.c
> @@ -141,6 +141,25 @@ static int __init process_domain_node(
>              bd->domid = (domid_t)val;
>              printk("  domid: %d\n", bd->domid);
>          }
> +        if ( match_fdt_property(fdt, prop, "mode" ) )
> +        {
> +            if ( fdt_prop_as_u32(prop, &bd->mode) != 0 )
> +            {
> +                printk("  failed processing mode for domain %s\n",
> +                       name == NULL ? "unknown" : name);
> +                return -EINVAL;
> +            }
> +
> +            printk("  mode: ");
> +            if ( !(bd->mode & BUILD_MODE_PARAVIRT) ) {

Nit: Brace placement.

> +                if ( bd->mode & BUILD_MODE_ENABLE_DM )
> +                    printk("HVM\n");
> +                else
> +                    printk("PVH\n");
> +            }
> +            else
> +                printk("PV\n");
> +        }
>      }
>  
>      fdt_for_each_subnode(node, fdt, dom_node)
> --- a/xen/arch/x86/include/asm/bootdomain.h
> +++ b/xen/arch/x86/include/asm/bootdomain.h
> @@ -18,6 +18,12 @@ struct boot_domain {
>  
>      domid_t domid;
>  
> +                                          /* On     | Off    */
> +#define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
> +#define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
> +#define BUILD_MODE_LONG          (1 << 2) /* 64 BIT | 32 BIT  */

This last one isn't used anywhere, is it?

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1006,7 +1006,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>      struct boot_domain *bd = &bi->domains[0];
>      struct domain *d;
>  
> -    if ( opt_dom0_pvh )
> +    if ( opt_dom0_pvh ||
> +         (bi->hyperlaunch_enabled && !(bd->mode & BUILD_MODE_PARAVIRT)) )
>      {
>          dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
>                             ((hvm_hap_supported() && !opt_dom0_shadow) ?

What about BUILD_MODE_ENABLE_DM?

Jan

