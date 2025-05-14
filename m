Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDB3AB6E2F
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 16:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984361.1370502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFD9S-0002tG-JI; Wed, 14 May 2025 14:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984361.1370502; Wed, 14 May 2025 14:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFD9S-0002qb-G8; Wed, 14 May 2025 14:32:06 +0000
Received: by outflank-mailman (input) for mailman id 984361;
 Wed, 14 May 2025 14:32:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFD9R-0002qV-8I
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 14:32:05 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3473e21f-30d0-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 16:32:04 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad2216ef31cso895491566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 07:32:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad238b66188sm764781066b.173.2025.05.14.07.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 07:32:03 -0700 (PDT)
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
X-Inumbo-ID: 3473e21f-30d0-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747233123; x=1747837923; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AXiMn2waGFGE2aCtWgcKf/2y80/Pq5qkn9qEzVeTGXQ=;
        b=BDnKn4U7Ih4bofytPSVBFC0AFG0mQ0pLcWJHDqipkl9mKfuw5jar0isAWTo4ImkfeB
         w9bZV3LM0mreRaIYNlF/H18n8bDgtH/JOT5QiFWKoQ4ezx5P/LyDe3KRvNv7Ll4fBTtL
         iYHr5Jqa4Y8y9/Kzq5wX+6pC4w3zLztJEbMoRm6AZn8TLAyIemETATRBOKdNR/ImNZCj
         WRPo480Il+kUWzjkDxSHCHF6YxOgvDLX3kozMCjmq0byxQWBlxojtsk9b5jRm+YrS0xk
         ADyQEkx2Ngp4tTFNcTZFc2Jj4Ks3cnj6BwBhl4NseIQEGnhkssumZO6fYp5pIXLn466w
         u84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747233123; x=1747837923;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXiMn2waGFGE2aCtWgcKf/2y80/Pq5qkn9qEzVeTGXQ=;
        b=QUa4NCFefwvqT1XYr6e4aZBedOXRnhZWpE8YdO69nzoMjcOKqb8oWK0khdMo1sw5cb
         rh0FMnKOGwM2YMqOCg1T8Y+heirCJfJGVSJtxrBrxduIslGhGXCWMbYb1wyhVYCfVf7U
         NPyfcnLIOK9ivuhLEod7K03Eml+/PBuL/GNLpLDAbZ6PbP3A440WQw/XprZfvVtNZrU/
         b9F+eDLLGj/XCHSR6+sCIWfBZuh7jIGK1jxNjdspyrk2+WnS8V3/KS4DOSGiE06rZxIC
         uTds7m6wCrmAN1+lLjH3LHZ4aXtKTlJVZYOjwhHfrOsvgU9vPwz+oCncxE1OXKZaQO/Z
         agLA==
X-Forwarded-Encrypted: i=1; AJvYcCU/th0RUZeSotq9xlhn4B/7f7vPtSECgvnaBVMEnbMI5XNQH6uIPPeXQM2GPu870qy7j53Hn1hWfuY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySEE9pqeYo4Bx5gxDPBqMDgG4LMMDqL1ME/gtMh0r+FxNxVOpZ
	ogjvJoI0D8XzycxNL+2ujVNl32M78zRk4zgT5Djryv3CBJ947LRB5RmX0e7Weg==
X-Gm-Gg: ASbGnctxJpcaUQ7JpBJj8kkKAdV71iL9meyt3E/U7r4ytQTd2U2FQXPrjTxSQYVEH3W
	a5GLIWd/EjTsH4nwO72oZ0+1wHD6HgelGz1f7dwg9EST37M52/zGVjqchCJ6+EwODyINtJlukBt
	FevUlrelcVj+ByQXEULn/tvGgOZYp5YCunIqYrKSNuX5j6xFfYSIKKVWmyxWDgmm3qiFrnesmic
	Dw7y5PgklUniM1Mn5Aouj7Xdqkjjq38p0TOGUgodZpuL2Y8y7QgPD2lh7b8UZsWwcvNLNN/UPx6
	b3K2+uSbzqXabftgY2FYf7gKlpsf7MMN5QF+Qv2RX0XeZgst+hXQzNucJNtBlS+HRDTuG4T7e84
	owTYgAirzXqrTXfrG/lr/GoidAf0XSe2Jo7Oo
X-Google-Smtp-Source: AGHT+IEq9yKSJ93qAmMcKCd+hUSc8APMXaH2ruSUrBpApV1rrvO+RBRbQBc00MbRJDzdxsDXqB4Kng==
X-Received: by 2002:a17:907:d40d:b0:ad2:40ee:5e26 with SMTP id a640c23a62f3a-ad4f70f62camr360266566b.4.1747233123566;
        Wed, 14 May 2025 07:32:03 -0700 (PDT)
Message-ID: <0fbe380e-2011-4238-9847-a007c754af6f@suse.com>
Date: Wed, 14 May 2025 16:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/16] xen/riscv: add ioremap_*() variants using
 ioremap_attr()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <0258c1ac04a73b7d3f9f849507539a329b2998e3.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0258c1ac04a73b7d3f9f849507539a329b2998e3.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> @@ -583,3 +584,36 @@ void *__init arch_vmap_virt_end(void)
>  {
>      return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
>  }
> +
> +static void *ioremap_attr(paddr_t start, size_t len, pte_attr_t attributes)
> +{
> +    mfn_t mfn = _mfn(PFN_DOWN(start));
> +    unsigned int offs = start & (PAGE_SIZE - 1);
> +    unsigned int nr = PFN_UP(offs + len);
> +    void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
> +
> +    if ( ptr == NULL )
> +        return NULL;
> +
> +    return ptr + offs;
> +}
> +
> +void __iomem *ioremap_nocache(paddr_t start, size_t len)
> +{
> +    return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
> +}

Why do you need both this and ...

> +void __iomem *ioremap_cache(paddr_t start, size_t len)
> +{
> +    return ioremap_attr(start, len, PAGE_HYPERVISOR);
> +}
> +
> +void __iomem *ioremap_wc(paddr_t start, size_t len)
> +{
> +    return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
> +}
> +
> +void *ioremap(paddr_t pa, size_t len)
> +{
> +    return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
> +}

... this? And why's the 1st parameter named differently for this last
one? Can't they all be in sync in this regard?

Jan

