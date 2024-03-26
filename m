Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8893D88C98F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 17:41:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698168.1089587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp9rq-00064D-Em; Tue, 26 Mar 2024 16:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698168.1089587; Tue, 26 Mar 2024 16:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp9rq-00061e-Ah; Tue, 26 Mar 2024 16:41:42 +0000
Received: by outflank-mailman (input) for mailman id 698168;
 Tue, 26 Mar 2024 16:41:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rp9ro-00061Y-Kz
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 16:41:40 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7f87a57-eb8f-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 17:41:39 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso668130066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 09:41:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t25-20020a056402241900b0056bd13ce50esm4275291eda.44.2024.03.26.09.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 09:41:37 -0700 (PDT)
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
X-Inumbo-ID: b7f87a57-eb8f-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711471299; x=1712076099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SToh4zNsyC5pjRRjCJUQKKin0JHu8SHHJfgcIBucdqs=;
        b=RRRb4bfyep5Lt12TiGIwWthi2H52+R2tK12QpF55ERpdAvYenyjvpyTDK+nEW+bOFA
         OmzRGMPkCvvCjwLTloflcK7vwwCQfVF1jV1IT44go9C/+LX7vLjckhtDIuaKKGYkvml8
         ejOekTb0p6AUZMDWLQoyCYv6Xw1GzasxPf/ZjeKawE2wq07ibvY1QAYJ7J24+yYP16PM
         hz8DuZadq65xd904TmbLNiTa3jMNJJTnHkddlHm4/dgw3fGyzxnRTnMOaN5ok1rZOVFO
         5Ooy4KzSulV/GpBepx6hTL+8fKhn+l3Pkx6QZCY6rUz35oDb2yBZ5r8M8KPMxna7eC56
         VLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711471299; x=1712076099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SToh4zNsyC5pjRRjCJUQKKin0JHu8SHHJfgcIBucdqs=;
        b=okM9pPxcBZIRWE5Gguz0XTl263rbyE92csfZA5pqWXtZiOu8TnqqRdnrBxqsmrtnGZ
         j834UvnOUtGiTaNDATgyMPsILo00nrWw2+x1z3g4GVjSQRwtmkjoXTYq0T/HD42wKXb/
         O23BChu08J5ibfqiLpYTzBgcg/8U2kRisulrC0jCpCcPVlyaGSHXZN7F2/wb/P01laPm
         RPxl9YLg5GgJwB89nv8iRAwV8Q58htbVAoDrpYAOXq1Yiqpig96lVtQwJTAH/7OXZRn+
         D3M1d/zq48LM6yvt4aX5b+qMlU/vGwYdzNacxNGBHGBvp49xnCuS8fr9ygW3RrzrpAPT
         tk6w==
X-Forwarded-Encrypted: i=1; AJvYcCWYDoufzQrcDVZBkop3SoLQl+4Pzt5eLfgB2AWXzA0zEJrH/X0R2i63s1ZaUyFkq4Z1P8t1gS0JNxgQ9fxiZhBciWOQu3WF25rf7DHfZ40=
X-Gm-Message-State: AOJu0Yw/1YBCL4C3BHESecDEFNFafGsYoupiOs+JWZ69YSuqGcxE5bYM
	g1Z8wj/Lsh7rYNNd0jfCDK+dRldtCPnxDdpM5cVA+YX3kq381hOBnrvlt+4Ej2bExoLOpajer3s
	=
X-Google-Smtp-Source: AGHT+IHDZsvA+Y5qr3l07fRvqfaMLdrVXKqNExCorZl7gUbey1lfvSqJ12RFwp9BHC30CxnGeCWing==
X-Received: by 2002:a17:906:f816:b0:a47:4862:7fef with SMTP id kh22-20020a170906f81600b00a4748627fefmr1149668ejb.76.1711471298106;
        Tue, 26 Mar 2024 09:41:38 -0700 (PDT)
Message-ID: <14891d02-e9e9-4650-b572-e6f071f1506c@suse.com>
Date: Tue, 26 Mar 2024 17:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] xen/x86: Derive topologically correct x2APIC IDs from
 the policy
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-6-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20240109153834.4192-6-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2024 16:38, Alejandro Vallejo wrote:
> --- a/xen/lib/x86/policy.c
> +++ b/xen/lib/x86/policy.c
> @@ -2,15 +2,78 @@
>  
>  #include <xen/lib/x86/cpu-policy.h>
>  
> -uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t vcpu_id)
> +static uint32_t parts_per_higher_scoped_level(const struct cpu_policy *p, size_t lvl)
>  {
>      /*
> -     * TODO: Derive x2APIC ID from the topology information inside `p`
> -     *       rather than from vCPU ID. This bodge is a temporary measure
> -     *       until all infra is in place to retrieve or derive the initial
> -     *       x2APIC ID from migrated domains.
> +     * `nr_logical` reported by Intel is the number of THREADS contained in
> +     * the next topological scope. For example, assuming a system with 2
> +     * threads/core and 3 cores/module in a fully symmetric topology,
> +     * `nr_logical` at the core level will report 6. Because it's reporting
> +     * the number of threads in a module.
> +     *
> +     * On AMD/Hygon, nr_logical is already normalized by the higher scoped
> +     * level (cores/complex, etc) so we can return it as-is.
>       */
> -    return vcpu_id * 2;
> +    if ( p->x86_vendor != X86_VENDOR_INTEL || !lvl )
> +        return p->topo.subleaf[lvl].nr_logical;

Is "!= Intel" really appropriate here? I'd rather see this being "AMD || Hygon".

Jan

> +    return p->topo.subleaf[lvl].nr_logical / p->topo.subleaf[lvl - 1].nr_logical;
> +}


