Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E16FDC91192
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 09:08:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174560.1499514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOtWb-0005hn-RK; Fri, 28 Nov 2025 08:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174560.1499514; Fri, 28 Nov 2025 08:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOtWb-0005fP-Oc; Fri, 28 Nov 2025 08:08:17 +0000
Received: by outflank-mailman (input) for mailman id 1174560;
 Fri, 28 Nov 2025 08:08:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOtWa-0005fJ-Is
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 08:08:16 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64325d10-cc31-11f0-9d18-b5c5bf9af7f9;
 Fri, 28 Nov 2025 09:08:15 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42b31c610fcso1359319f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 00:08:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5168acsm7501952f8f.0.2025.11.28.00.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Nov 2025 00:08:14 -0800 (PST)
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
X-Inumbo-ID: 64325d10-cc31-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764317295; x=1764922095; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=88iysHFwOy4+kY1NoN3WPvJ6ombGukt3p7pocEbX1mk=;
        b=gAF6jED2QaxsC6P3zRC1VQyMO2nGgQ9zRlW0SP6mBPqsvbnHWN2m6xiDghc/B3PDVj
         42gOfE7sLfQTeWPXoKKq4/ziDUPrSg8mp06jgEmX5tsT06l+x/ek2jOBHvc5hL4/6kZv
         NITmHANgaTWZtQUKELmY9ldH1MmipHUjgSS8YzPnb7N/02GFPaxa+GCf4XuAdaK7lcZs
         72JhXFks1FJ2DLt7ogch9/SpbCQ1wA6Stg+v3qVWscd/ZPyx//NxwT0f9gmlQPuO7k7v
         yQiwLlbr92CQADUTyVdSIld11IV+qiIV/2UPTs1qKk+Zqaa9uSC4dgpb6hBSOtBogyQ/
         7BSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764317295; x=1764922095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88iysHFwOy4+kY1NoN3WPvJ6ombGukt3p7pocEbX1mk=;
        b=KG+M/bOnX4guz8QbSfIvbwrSDXkyrjYo6JvrlhMbx/k1fbXO4LhOknS5AMEXYsAQ1R
         fJ3gVWfxwvDbliBtQI7Jr9cAB4QPEdRXlISZqpm6968nz+jHxwKU//0rxyUHeF8CzeGr
         p/x0ffglP6Et4IL6yujkWVrsFzSfPG71Je/xIWQfU+FuckWIRQQBeCyj+FpjpZ8yIYjW
         tNZjV4krIFpv/R+b9KXqblwVbsWpf/AwP0bMeQO12tmko2g8kR7n6d1FbNJ8Bw3CenHA
         +m/0/I+/L+jsvqBELnUayZb2EhKz0VLJS7Cjkx6B+EqXLMn5FqFIPRw3uD3ZZIYBR0VH
         e3sg==
X-Forwarded-Encrypted: i=1; AJvYcCWq5x74uaLN/48/L9ek9uAn5KqiUTgGs5Nh0XSdRJAu+zggdKDHgZKTXd3z2VZk1myYnoHTzV0vZ2s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7JGQL0Hp98qh27N5gxtFPLxTxgoWgkFcDqOBY1jJxgrOdOI6y
	LSypCoFD5cGV0qIHv6qGeYfrB9Wo9efrJppS8nufgWGXx9ubf8fqooTmtQQLHpH5NA==
X-Gm-Gg: ASbGnctHlMWgwVQJJsTbdyrC9nnW9v83sVGnfeOhtC8RQDumxHoFM22TOtqzdCXhpva
	QjFPBqjXxP+Fj7K/rsgMPWh6iYkgY3rGIMt66iFLOGpaGFzJ03EHh6m/ieeX7W8LJc6p06Coo4J
	9JIvTd4PL/P9x5mD8B2LCjh9zTrL9rj7z/y1NQ0CdCMCAB/NybLmCQh0+saLlCyzKPL7vc4bEXA
	StOYvh+LYMd6b+Em9a1e1sTkbRH+eEYDYhnVwvcn0kPnoKCOAEFGY2oAs/u6ty7UAn1kX5MLwXh
	drJqNxGICP5DmxruO9Q8/3RtRY4+EglIh0R6MOrLB+F/JBrq1Z6AXRERFOQySRrjRtKC3pHVEWS
	l834yYLBGGgHM2+lhu7veTZRnEu0t9nIGGcpQrYrVWdrWdOvUdl/paUXYjDuGz5tBVs41RdgfG6
	t1jedHOR3FDU0SDoFb1S/ExyCrsz9B4i5+R01jxOTBWFHXBsng4vKS4rzDRCM2ZezgRNtcWlPvM
	fo=
X-Google-Smtp-Source: AGHT+IGeSpG/Jm/g4Q4qCNtQLbaxq2zOaKe9vBY4fu0ljqE+FT2DyWoJBS9ridL0uQP1V2GaWVrdhA==
X-Received: by 2002:a05:600c:3b97:b0:477:9e8f:dae8 with SMTP id 5b1f17b1804b1-47904a685c0mr155642545e9.0.1764317294983;
        Fri, 28 Nov 2025 00:08:14 -0800 (PST)
Message-ID: <9825dea1-6686-42f0-87c7-2b1a98d54331@suse.com>
Date: Fri, 28 Nov 2025 09:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/domain: introduce generic functions for domain
 struct allocation and freeing
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <0a66c71356e8d6ea788022438d7a73dbff8aa5b9.1764243466.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0a66c71356e8d6ea788022438d7a73dbff8aa5b9.1764243466.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.11.2025 17:26, Oleksii Kurochko wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
> 
> Move x86's free_domain_struct() to common code since it is shared between
> architectures.
> 
> Move the x86 version of alloc_domain_struct() to common code as most of the
> logic is architecture-independent. To handle the remaining architectural
> differences, introduce arch_domain_struct_memflags() for x86-specific
> allocation requirements.
> 
> No functional change.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> [Introduce an arch-specific function instead of using a weak function]
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
ideally with ...

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -799,6 +799,28 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>      return arch_sanitise_domain_config(config);
>  }
>  
> +struct domain *alloc_domain_struct(void)
> +{
> +#ifndef arch_domain_struct_memflags
> +# define arch_domain_struct_memflags() 0
> +#endif
> +
> +    struct domain *d;
> +
> +    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
> +
> +    d = alloc_xenheap_pages(0, arch_domain_struct_memflags());

... this now becoming the initializer of the variable.

> +    if ( d != NULL )

Personally I'd also prefer if the "!= NULL" was dropped at this occasion.

Jan

