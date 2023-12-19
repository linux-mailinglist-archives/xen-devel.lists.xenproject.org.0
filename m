Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15627818B58
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 16:39:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656995.1025564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcBJ-0001Zx-ET; Tue, 19 Dec 2023 15:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656995.1025564; Tue, 19 Dec 2023 15:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcBJ-0001Y9-Bi; Tue, 19 Dec 2023 15:38:53 +0000
Received: by outflank-mailman (input) for mailman id 656995;
 Tue, 19 Dec 2023 15:38:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFcBI-0001Y3-82
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 15:38:52 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4af5119-9e84-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 16:38:50 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c38de1ee4so47068395e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 07:38:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c1d0200b004063c9f68f2sm3396999wms.26.2023.12.19.07.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 07:38:49 -0800 (PST)
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
X-Inumbo-ID: b4af5119-9e84-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703000329; x=1703605129; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJBMoGAsqhK2/WPein48jJAqiU5oO52MY0HQDKyEDrY=;
        b=LDz9APnFDsoy4bJ3rF60QjLGKmoQioKQf/RN555c3ae93/Wy3jQ2al5Nx0fIEYx3LS
         DyBOyxhxnT4K0YjdETgQEjkJgcjA06ayjPGiaamZ7hmurfAso7UZ2u4/UM25181gMeIN
         wsXWh7ckd/XlZOmhKiIXWVOTvui2rQE59si0nLYyv4hJtGmnSLdl+xVhgSBpyNdZJi3n
         h/zj7oPtyPjynisUXpkNwsN6DMddoTR4mPavIi65PF1eZL7xMGj57vtmNKCvLwV1vTsZ
         QIJmQ+oGwOnLVI6R1Mx7UjBKKXRvJbu7sfMTVuPucOb4kzoDtUy/WpYc7xj+s5GOh8Cl
         2QpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703000329; x=1703605129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJBMoGAsqhK2/WPein48jJAqiU5oO52MY0HQDKyEDrY=;
        b=NRSZRkNb07s+09EpfiAQMza3yMKG2jrOhaLptx8/4A7k1WLTsetST3751nZ3qRtwxa
         zsyjXcOsgbOt/oSifCJ8LxM2/D4nBGP24lylaKbIc0wkoShaiQ4ELaoxZeBFvM6fECbX
         fZaPTfBvGgi3Kev3Z+pOcMiDqhZ95mlkuhmoPoJARlBDTh8DkxP1q5B5mnIKQFljVMOF
         0aWjS/xQIqtPoLU1olyNZffcjnC6EP5YOkXRdvMWlpEJU+W576jx437rrykvZEH/jqpv
         WN/rGxFQSlTa28WmXPyJoOqz+wnvS/dSr6TbMlYLmwyH0XWoF4EIwwnc2MOB1A0E2nrx
         RpUw==
X-Gm-Message-State: AOJu0YxT7iY+n7xDEVQrIPygDjiLrpVdnIRmGbQDszRqWP5wsZ9gqjw6
	ttxb1wJly9Gr85aswwbzwuaa
X-Google-Smtp-Source: AGHT+IFZhjf2bmXru39VYNBguPdFEpCual8qGzuI/m/J3YAcmhpy5rKL5/dbDMjj9YS3OSuz2vfWsQ==
X-Received: by 2002:a05:600c:518a:b0:405:4776:735a with SMTP id fa10-20020a05600c518a00b004054776735amr9613970wmb.2.1703000329621;
        Tue, 19 Dec 2023 07:38:49 -0800 (PST)
Message-ID: <b97e28eb-6de5-48f0-91c1-bb9da72e24ae@suse.com>
Date: Tue, 19 Dec 2023 16:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] x86/p2m: move and rename paging_max_paddr_bits()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231215141832.9492-1-roger.pau@citrix.com>
 <20231215141832.9492-3-roger.pau@citrix.com>
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
In-Reply-To: <20231215141832.9492-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.12.2023 15:18, Roger Pau Monne wrote:
> The function also supports non-paging domains, and hence it being placed in
> p2m.h and named with the paging_ prefix is misleading.
> 
> Move to x86 domain.c and rename to domain_max_paddr_bits().  Moving to a
> different header is non trivial, as the function depends on helpers declared in
> p2m.h.  There's no performance reason for the function being inline.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, for using it in the next patch either here or there I think the
description wants to clarify that ...

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2552,6 +2552,27 @@ static int __init cf_check init_vcpu_kick_softirq(void)
>  }
>  __initcall(init_vcpu_kick_softirq);
>  
> +unsigned int domain_max_paddr_bits(const struct domain *d)
> +{
> +    unsigned int bits = paging_mode_hap(d) ? hap_paddr_bits : paddr_bits;

... this and ...

> +
> +    if ( paging_mode_external(d) )

... this just so happen to be okay to use with system domains (i.e.
DomIO in particular).

Jan

