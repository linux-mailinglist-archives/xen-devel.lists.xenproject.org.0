Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82564A84263
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945454.1343642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qdS-0006K3-Ec; Thu, 10 Apr 2025 12:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945454.1343642; Thu, 10 Apr 2025 12:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qdS-0006IY-Bm; Thu, 10 Apr 2025 12:03:58 +0000
Received: by outflank-mailman (input) for mailman id 945454;
 Thu, 10 Apr 2025 12:03:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2qdR-00068R-3S
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:03:57 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e054f9d2-1603-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 14:03:55 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39c30d9085aso428343f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 05:03:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f235a5d57sm50040345e9.34.2025.04.10.05.03.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 05:03:54 -0700 (PDT)
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
X-Inumbo-ID: e054f9d2-1603-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744286635; x=1744891435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=llwXOCkC5Wx+w1aDSkV2rgp7nGEu8bLgm3oRjuFqav8=;
        b=QxSpPBeAZquNJFOnvAIgL1zfpuhw+dtsJ021frpxoIpWCCDQ1ZmvIR9fmEXl4k3S+n
         SkaVA+THT5UlCm0mtUAzyg8qHB7nUS0hxLqZdV4zVTsqyXPje4zGJBwha0UJQG7y+yWp
         d0TI4lYVCRQZ0u1E4tQqUcQyEt8CPgzsxwwz2LI5vYeuwgfQ0zE6RkGkTAhrU4OpDQ3b
         V5bkoLoNVGmeob79KREfKbBEVRDIf76LaMJYJaH5Ksxm0n62ojwNjhvVSmo0OgUuaT5s
         9Dg9uxkOLqMIpd+2rsFn4fiGLtFnzPGbRolqECSKN+bN+8c2rZIh3CyQNcTsLdCHB3v9
         OcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744286635; x=1744891435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llwXOCkC5Wx+w1aDSkV2rgp7nGEu8bLgm3oRjuFqav8=;
        b=vLG6IqcRTFeD9269KCiK+3zcMy+S688ULxgBQMm41q5aqxgU4Xw1aZbQ6HizqrbZmi
         9VRItB5mCAG3m2OnPiJe9AanWGkwgD1K8weEBWANbvRRKMg1bTqMXmP4kO9M31rBlM3w
         gEYkd6eex3Wm1N2FaBi+ILIUBhHMmVUwxtf4uQc/hWtWfFIBQDnS2lgq3DvJ1yKSsV+p
         PTzEgjH0WPynV7viA3uLBPsxUC/7T5TDJgzHadKe1lR1sAxldVLCVQBVkD3oQSBh/zNV
         CRDMJJd5s7ldxpVpkOi2Z8bowT+djpIj0qOe9ECC0UruOoCbsCawjBkf0ho2XqjSH/r+
         L+WA==
X-Forwarded-Encrypted: i=1; AJvYcCU0fYoo2MtleyeE6unPQsyD8lXO2U775ooxOogFcrtMFAaQkjSWFolSEeKaQb0Z1/n/hRHEkU0Gtbg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXwmh/CiiDx6uscB5skRzPaCGzGiu37Qz2uYqK8BdOjcOqzLP/
	D24ii1Xm4YJ6LSUbVfO4WwII5EoYvs2gGCnAelG4l/LzxxlvxABzCg93t6thOg==
X-Gm-Gg: ASbGnctZ45g3SUpdQzFDmz5YMbd9ywjvm7NblU6lSIgwWEQep3JyYyBCltb2+S/Lu2F
	Z1kEPFH69ZrC6EMxdG9wTW1PcaaDlS5T70PtBo1g7loxS8LK16Atc19ztgM1QeXUVn8p0srWX/k
	9nrRPPIIDlydEUb0nhlP+Wbsa28EMGCQKkayTvB4wuQ9omLUvs+Zu1UdP+m9AqtZp+nUPmPDv46
	a0FLSu2hXbsEcEFkgkAbEe2EcE9mQjE7HrGxUePtpQdh8OSotzGk+dLy+/ZjzLQZYx/RK3/Ehz2
	eGWQOXuNU7ql/Bxc5Uss/MEOONEAvPF3vYaXJ5j2sPJ51BQrZO8lLCkQF0GWfWdEhGmvd03h0JS
	7lQsBQ3swZg77++EMuv+Oo/VIdQ==
X-Google-Smtp-Source: AGHT+IFNNe1JLDq5cEM8A5dBjpH/GJ/fsx4vNXxUDHlJUgReEOZN6T4tTfi9lp/HBUgdGdOnqj0njA==
X-Received: by 2002:a5d:59ab:0:b0:391:2f15:c1f4 with SMTP id ffacd0b85a97d-39d8f4f7e2emr2059317f8f.55.1744286634805;
        Thu, 10 Apr 2025 05:03:54 -0700 (PDT)
Message-ID: <e78824bc-3b0a-406e-80ac-5a67b127254f@suse.com>
Date: Thu, 10 Apr 2025 14:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/16] x86/hyperlaunch: add memory parsing to domain
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
 <20250408160802.49870-15-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-15-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> @@ -212,6 +213,39 @@ static int __init process_domain_node(
>              else
>                  printk("PV\n");
>          }
> +        else if ( strncmp(prop_name, "memory", name_len) == 0 )
> +        {
> +            uint64_t kb;
> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )

Nit (you know what I have to say here, and again below.)

> +            {
> +                printk("  failed processing memory for domain %s\n", name);
> +                return -EINVAL;

Any reason to override fdt_prop_as_u64()'s return value here?

> +            }
> +            bd->mem_pages = PFN_DOWN(kb * SZ_1K);
> +            printk("  memory: %ld kb\n", kb);
> +        }
> +        else if ( strncmp(prop_name, "mem-min", name_len) == 0 )
> +        {
> +            uint64_t kb;
> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
> +            {
> +                printk("  failed processing memory for domain %s\n", name);
> +                return -EINVAL;
> +            }
> +            bd->min_pages = PFN_DOWN(kb * SZ_1K);
> +            printk("  min memory: %ld kb\n", kb);
> +        }
> +        else if ( strncmp(prop_name, "mem-max", name_len) == 0 )
> +        {
> +            uint64_t kb;
> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
> +            {
> +                printk("  failed processing memory for domain %s\n", name);

All three error messages being identical doesn't help diagnosing issues.

> --- a/xen/include/xen/libfdt/libfdt-xen.h
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -34,6 +34,16 @@ static inline int __init fdt_prop_as_u32(
>      return 0;
>  }
>  
> +static inline int __init fdt_prop_as_u64(
> +    const struct fdt_property *prop, uint64_t *val)
> +{
> +    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u64) )
> +        return -EINVAL;
> +
> +    *val = fdt_cell_as_u64((fdt32_t *)prop->data);

Please avoid casting away const. Looks like I overlooked this in
fdt_prop_as_u32() that was introduced by an earlier patch.

Jan

