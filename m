Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58D8A84210
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 13:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945368.1343602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qPh-0007Q3-Gx; Thu, 10 Apr 2025 11:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945368.1343602; Thu, 10 Apr 2025 11:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qPh-0007OT-E7; Thu, 10 Apr 2025 11:49:45 +0000
Received: by outflank-mailman (input) for mailman id 945368;
 Thu, 10 Apr 2025 11:49:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2qPg-0007OL-Oi
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 11:49:44 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e40ca308-1601-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 13:49:42 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39c1efc457bso381059f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 04:49:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2a13sm48332185e9.10.2025.04.10.04.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 04:49:41 -0700 (PDT)
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
X-Inumbo-ID: e40ca308-1601-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744285782; x=1744890582; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=59h1vr1bm4CPuKPO0Fm+eOU2RvTYJ2NcX9b++sQP+P4=;
        b=GAnyr8LljUp24AoNYrWSF360KNLZf2GBS7p4wy5SCDer6fmj6BBypgRtNRC0u+07cB
         Ta48wfVPzQRdRFnH/jYIZWVI5mqAZtWtbu3ADh2T3sSqmeGrXGw3MQ7bNMoV1uE9b8Fu
         DSiuoMan2R2j37ljLbqhaxK1JFEc1pFKlyQ/LP9nXVjn4yscYmBFGm7fFkZWWZYRrcGt
         dqgadIZ4VK9rgy2EADKe3Fr4VjWLB0qKZS0kAimTr7GHq8INJoYnmpXCKTpfeBD6Lup4
         TE5BrS4UXHr1OSpIrVQtQcyBOIo0UYzZLAc+673yPJTr+TcLX+P/98Fkn1s8H1/nKT7l
         ABcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744285782; x=1744890582;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59h1vr1bm4CPuKPO0Fm+eOU2RvTYJ2NcX9b++sQP+P4=;
        b=L2+UqpqFcVBl0IBvEUNNfMIN1nN+hDnOJTFhxrtX1BY9binyLRGsZii9sjIDw91sTg
         A3D4qVZH3qArkTL1bvXfn6pU1wEiWeCe6W83uB0GSjktfCb0h54b41Le4SfQ4n4o4/tD
         eqXx57C7ngjVSXZz6N9QcQBqmNAyVwOqG+qTwA1h/NZY3X7D561v8+t1YQ1o8Z+inHlB
         yDCCklsBZsvu4VQt22eCLJlq4O/+mlunBGAteXBKPOocI5szM/TWE6m6L4oFRhDKhRfI
         UMkEsUTFbwGwPOpLUv/73jDa1KyG3NvPTFnxpie8hcoihQJP2he1JroKElv03enCxj5z
         B3DQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4SHR5yTs5Ej06+6sRUI3HhfgmuReNRuWpajJXzeuKxhHy7Ncz33lOLkI3ciLmVZlLLqzz7Er2V2U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAWiXfqA/V3KzRsgljxx5LYPXFUONV87hGViEzH8jPmVvJpr9u
	3xKuaj0F/U9sR5wqSUoKy0XrCUnLuinGr1roe5l3sP9i9sSOpdrwYUdGIP0g5pi1RlDBQJ8L07g
	=
X-Gm-Gg: ASbGncv/2WyN6Q2eyKosBdI4fzeCYeh/e39EeJsbjyGPGxIW2qRZ0zvN1S454hvFsy7
	KXW7jve1Tr7mq20t4hqaHDitexnAN6KQ3ooehup8SKRwgnJbDgJsEqAZd6oAdns0+DmZIslk2K+
	yAeULrJGxNLPTo3ayeDKXAxScz33BvNp987KaqaE3sc2V/9KKdkKy1k24CP9R8ohr6+vr6OcNU4
	vgtGaZKLWLHsPWpdMzhF7MsqdO+1TgETz+Ps7nJZBWK745bhlv6IvTA5sVapxcP9wV02VY/t2dl
	aX5o0FtJX5Pym99hIL8xyNALbC9/LIgd046g/9VhczUZ7xxZqPjSQZw0gYYcaBY9ec+v0CqbOQp
	MvTlwu16ObvYy4E0ZNXqb0fJIAHBRrCbm6/b9
X-Google-Smtp-Source: AGHT+IH9Kb5V1AFX60GEsvBGyDYExpdMKMWLdr9UzrsPu0ehLFXSZJTT0K+HxMfCSPoWA8SX0r8UFQ==
X-Received: by 2002:a05:6000:4387:b0:39c:1257:c96f with SMTP id ffacd0b85a97d-39d8f4ffa3bmr1861799f8f.59.1744285782160;
        Thu, 10 Apr 2025 04:49:42 -0700 (PDT)
Message-ID: <6ce79cc0-1fec-4ad9-834e-680ef1f81549@suse.com>
Date: Thu, 10 Apr 2025 13:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/16] x86/hyperlaunch: add domain id parsing to domain
 config
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-13-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-13-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Introduce the ability to specify the desired domain id for the domain
> definition. The domain id will be populated in the domid property of the
> domain
> node in the device tree configuration.

Nit: Odd splitting of lines.

> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -8,6 +8,7 @@
>  #include <xen/libfdt/libfdt.h>
>  
>  #include <asm/bootinfo.h>
> +#include <asm/guest.h>

What is this needed for?

> @@ -158,12 +159,42 @@ int __init fdt_read_multiboot_module(const void *fdt, int node,
>  static int __init process_domain_node(
>      struct boot_info *bi, const void *fdt, int dom_node)
>  {
> -    int node;
> +    int node, property;
>      struct boot_domain *bd = &bi->domains[bi->nr_domains];
>      const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
>      int address_cells = fdt_address_cells(fdt, dom_node);
>      int size_cells = fdt_size_cells(fdt, dom_node);
>  
> +    fdt_for_each_property_offset(property, fdt, dom_node)
> +    {
> +        const struct fdt_property *prop;
> +        const char *prop_name;
> +        int name_len;
> +
> +        prop = fdt_get_property_by_offset(fdt, property, NULL);
> +        if ( !prop )
> +            continue; /* silently skip */
> +
> +        prop_name = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), &name_len);
> +
> +        if ( strncmp(prop_name, "domid", name_len) == 0 )
> +        {
> +            uint32_t val = DOMID_INVALID;
> +            if ( fdt_prop_as_u32(prop, &val) != 0 )

Nit: Blank line please between declaration(s) and statement(s).

> +            {
> +                printk("  failed processing domain id for domain %s\n", name);
> +                return -EINVAL;
> +            }
> +            if ( val >= DOMID_FIRST_RESERVED )
> +            {
> +                printk("  invalid domain id for domain %s\n", name);
> +                return -EINVAL;
> +            }
> +            bd->domid = (domid_t)val;

And a conflict with other domains' IDs will not be complained about?

> +            printk("  domid: %d\n", bd->domid);

If the error messages log "name" for (I suppose) disambiguation, why would
the success message here not also do so?

> @@ -233,6 +264,12 @@ static int __init process_domain_node(
>          return -ENODATA;
>      }
>  
> +    if ( bd->domid == DOMID_INVALID )
> +        bd->domid = get_initial_domain_id();
> +    else if ( bd->domid != get_initial_domain_id() )
> +        printk(XENLOG_WARNING
> +               "WARN: Booting without initial domid not supported.\n");

I'm not a native speaker, but (or perhaps because of that) "without" feels
wrong here.

Also nit: No full stops please at the end of log messages, at least in the
common case.

Is the resolving of DOMID_INVALID invalid really needed both here and ...

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1033,8 +1033,9 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>      if ( iommu_enabled )
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
> -    /* Create initial domain.  Not d0 for pvshim. */
> -    bd->domid = get_initial_domain_id();
> +    if ( bd->domid == DOMID_INVALID )
> +        /* Create initial domain.  Not d0 for pvshim. */
> +        bd->domid = get_initial_domain_id();

... here?

> @@ -23,6 +24,16 @@ static inline uint64_t  __init fdt_cell_as_u64(const fdt32_t *cell)
>      return ((uint64_t)fdt32_to_cpu(cell[0]) << 32) | fdt32_to_cpu(cell[1]);
>  }
>  
> +static inline int __init fdt_prop_as_u32(
> +    const struct fdt_property *prop, uint32_t *val)
> +{
> +    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u32) )
> +        return -EINVAL;
> +
> +    *val = fdt_cell_as_u32((fdt32_t *)prop->data);
> +    return 0;
> +}

Path 08 looks to (partly) open-code this. Perhaps better to introduce already
there?

Jan

