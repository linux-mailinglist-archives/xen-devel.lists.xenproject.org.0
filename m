Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF02824030
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 12:04:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661499.1031210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLLWR-0008DO-Ha; Thu, 04 Jan 2024 11:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661499.1031210; Thu, 04 Jan 2024 11:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLLWR-0008Au-E1; Thu, 04 Jan 2024 11:04:23 +0000
Received: by outflank-mailman (input) for mailman id 661499;
 Thu, 04 Jan 2024 11:04:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLLWP-0008Am-Kx
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 11:04:21 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02cfe1ba-aaf1-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 12:04:20 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cd20d9d483so4325491fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 03:04:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w21-20020a029695000000b0046df10baf97sm235185jai.36.2024.01.04.03.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 03:04:19 -0800 (PST)
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
X-Inumbo-ID: 02cfe1ba-aaf1-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704366260; x=1704971060; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGh4cn3QHmlAtXNzq7jjH9bBqsLN1Fv+teEIf7raKkQ=;
        b=ClP3a6VvA2e4NYyy8oMG5nzefH5jI43AZFUXpCmEJBx6E4Co1nFyrfgSBh1qd8OJSX
         57p4MRIIeQgYrMq6JMgZrp6QSrCk63HA7pldRR5H4QWyOwQUlIIjzwQFmHmSneLevVZ2
         aTJthJixPGdj7LfZL2/QvyzEEIrEikyZ+3d23L/7oy8EYqdYyU8yq/SLYQDFTqxGeTnt
         7dTTMjP3R0ZnqPfi94NWg8iWi0QzqMIs6AWVRsaRVXbuHwbD57u3vQT2Fl97uDfeaNXj
         bsKDCkwSGed+IC58eMXAEx+cJLJFSmjpLSnCBfnUQx0duZyJBUyCJwadyBVRDFEy83xK
         +U8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704366260; x=1704971060;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGh4cn3QHmlAtXNzq7jjH9bBqsLN1Fv+teEIf7raKkQ=;
        b=eGmsZY1zG3qMVVfkZjjzUutOYoLkEUALOL2lq8iXhJsG86t6yrG0Mb3woiLfRNNwpJ
         NyUnqQqYLCdrdt/YA49HDP+C6vD2Ce2jrci9oXH/Eoc/HSsOyxLvDFT5vgghaEKgPuoB
         0nyLTsIdsHxhoQy+PC2Cf8BtixNtiBTppk2W0zeN3Mdvzf/xuWe17Fao25jMUx5VeI1I
         VVs0nxVpI5Mu1VKWBLC1lEEWAGgCHGECaw9M+l0zyERZtmkbgJv7VitJz/VWx7BaorA0
         YhYxSY8gFfDTRB991QY3W6i9JZIeRLxkzisVG5yS50K1dp2ISJzxLNKPRg1315CRHXi+
         44hg==
X-Gm-Message-State: AOJu0Yy/13PRrs5l/A888d+FOS0kOM6eoUgUwFdWWLONO34SDQir0Xka
	S0V70h4aLnRZT1Nap4mtyqV/qVA8KJIq
X-Google-Smtp-Source: AGHT+IH6MZFas3E8OV1QA/3GJzKgpY4strCZZfLqI8q0uuqhszBZ2GyeA6Pot63voqr6tfOXuNTOzg==
X-Received: by 2002:a2e:b0f5:0:b0:2cc:7156:b631 with SMTP id h21-20020a2eb0f5000000b002cc7156b631mr267175ljl.9.1704366260302;
        Thu, 04 Jan 2024 03:04:20 -0800 (PST)
Message-ID: <b1731dc3-96e3-4763-9bd4-978f44e3a6a9@suse.com>
Date: Thu, 4 Jan 2024 12:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/34] xen: avoid generation of empty asm/iommu.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <e2a51f6197fce8f2ad636885ed231a6725d4cd8a.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e2a51f6197fce8f2ad636885ed231a6725d4cd8a.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:12, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

The change looks okay-ish, but again needs a description: You want to
explain why you use the absolute minimum of the scopes the two (or,
in principle, possibly more) #ifdef-s cover.

Jan

> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -337,7 +337,9 @@ extern int iommu_add_extra_reserved_device_memory(unsigned long start,
>  extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
>                                                    void *ctxt);
>  
> +#ifdef CONFIG_HAS_PASSTHROUGH
>  #include <asm/iommu.h>
> +#endif
>  
>  #ifndef iommu_call
>  # define iommu_call(ops, fn, args...) ((ops)->fn(args))
> @@ -345,7 +347,9 @@ extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
>  #endif
>  
>  struct domain_iommu {
> +#ifdef CONFIG_HAS_PASSTHROUGH
>      struct arch_iommu arch;
> +#endif
>  
>      /* iommu_ops */
>      const struct iommu_ops *platform_ops;


