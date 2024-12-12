Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BD89EE547
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 12:44:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855864.1268658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhba-0004OV-3W; Thu, 12 Dec 2024 11:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855864.1268658; Thu, 12 Dec 2024 11:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhba-0004MP-0X; Thu, 12 Dec 2024 11:43:42 +0000
Received: by outflank-mailman (input) for mailman id 855864;
 Thu, 12 Dec 2024 11:43:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLhbY-0004MJ-69
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 11:43:40 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5445cf4e-b87e-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 12:43:39 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso791731a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 03:43:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa671f1482asm709572466b.107.2024.12.12.03.43.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 03:43:38 -0800 (PST)
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
X-Inumbo-ID: 5445cf4e-b87e-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734003819; x=1734608619; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLxheR2Ho1Fpke9iVPI8LqPgTq9RQohZDcOeJ7ONy6M=;
        b=JZvrUrqwabE6KzNa4CwK6v6UEZFT55xBMhUoOpDQS8sOZm8suom0pweqndrWH60Tuo
         1nV7xpE0PCHAH7nFcy6r0NW21RMKuQcPqCjMJ9g298yWdjtT7G+eMwHhriLY2wFaPhTX
         UG3PUm+sOjXqYLZ/mrpbPgstWGbFeA8XTY+H3+yU7466sAwe2bXQM7dZQVx7v6LO+QZa
         qbIHs8TuNAagwlBNbN/h1m32qemG6CEgGcsHP4ZLaIsVeMPhfnpagIe4csVoDzUno97u
         hw5o5vkYP3WYdQZYnqVu8qL5Kb5r5/GOW6MJHG26TYSYYJr9D5DXrCCvyVy4doNMSG/4
         QPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734003819; x=1734608619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLxheR2Ho1Fpke9iVPI8LqPgTq9RQohZDcOeJ7ONy6M=;
        b=enJYltP0a9Fa+0WPuMIl1cS2mUakvlWJ8DmV/LavDgmxrFTv6Hk9CaCc4JRv06r/m2
         LrphhWX1AyA3QTgy+RLlJOn5XqKRULGuW7LuOlUZdinVo2+ipvd2KO1Nw1TsRSPb+PRY
         EXypeQVST3ZuklPBbRCwR7J+X07m5JsSh3AIfz+BH+/J4BGWHYnOHkofe6YAUjJNEPNd
         ZFKOCLUo+azSiRuLiaAelTh38Lfiw6nO8QST7XPLIJ6kk0U2BzxolOBIUf08GzySO8xU
         zCme0STpD4cI6sJ89cLiN8DmALJLkyaDLlAzd4Q8If1+tLhLNXv9rbMGAgS6M58m+tF2
         wuow==
X-Forwarded-Encrypted: i=1; AJvYcCWSJZB3YVJrMd0WDSVx5ieMnwaO3JUgA6Z71lVwbLSOhY7zgrLbplWJwYc2SBAxD+lGaDh4BYcRAEQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8BSYNdOo7Pjzpwlqi6WaL0SNw7VBJXDX/KLfmcVk8h2c9KL86
	Lj2CGmMoLijzEhHyzqyuguZu9KJJFafs/lxvxivoEo2d7RRwAMDgkGiS9o8giA==
X-Gm-Gg: ASbGncs3syXP2fylEgqeFaf/qqogm89IcYKwcUgeiqPqK2u6sLGvrZYaK0NuWEO6sUS
	4YyUgX00Q4a5ueol0Q5SNnj7o/aVozYwKoMBhgN+9v03R/a6QdtvbCnyfx2LjxAaTVInWNXwrWs
	/ZsqVm2HaHD/3x0qyRI237ZX69877wUF+1wDnCTOuHrJEI/ONZu05QJ/TO1UzUB1AoVLxl749QU
	J/kdgn3s05DFYqYRmDMKRYqQeWO3pl6Qmkcz7YELlKwn09f3n127OCGokriJqnXuh3gHx0gUBFi
	SJD/UXJM2RjQUjQVp9b1Z4AilvmjjrlofblzMRD+AA==
X-Google-Smtp-Source: AGHT+IH0yL6bpgM1iYl7AsYlLzKLbffRJhYltBpymT7VWOBE9JbXxaHM1PxPh0GmudxtLMShuOehQA==
X-Received: by 2002:a17:906:9c9:b0:aa6:7f3d:4f9c with SMTP id a640c23a62f3a-aa6c1cefd42mr348810866b.38.1734003818642;
        Thu, 12 Dec 2024 03:43:38 -0800 (PST)
Message-ID: <d7a286d3-ba85-4903-91c7-920ad35f9580@suse.com>
Date: Thu, 12 Dec 2024 12:43:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] xen/riscv: add destroy_xen_mappings() to remove
 mappings in Xen page tables
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
 <d52c84417ae4aedb8ce9f73dfa2340fceea137a4.1733937787.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d52c84417ae4aedb8ce9f73dfa2340fceea137a4.1733937787.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 18:27, Oleksii Kurochko wrote:
> Introduce the destroy_xen_mappings() function, which removes page
> mappings in Xen's page tables between a start address s and an end
> address e.
> The function ensures that both s and e are page-aligned
> and verifies that the start address is less than or equal to the end
> address before calling pt_update() to invalidate the mappings.
> The pt_update() function is called with INVALID_MFN and PTE_VALID=0
> in the flags, which tell pt_update() to remove mapping. No additional
> ASSERT() is required to check these arguments, as they are hardcoded in
> the call to pt_update() within destroy_xen_mappings().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Apparently I just shouldn't provide advance acks, when ...

> --- a/xen/arch/riscv/pt.c
> +++ b/xen/arch/riscv/pt.c
> @@ -421,6 +421,14 @@ int map_pages_to_xen(unsigned long virt,
>      return pt_update(virt, mfn, nr_mfns, flags);
>  }
>  
> +int destroy_xen_mappings(unsigned long s, unsigned long e)
> +{
> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
> +
> +    return ( s < e ) ? pt_update(s, INVALID_MFN, PFN_DOWN(e - s), 0) : -EINVAL;

... then you introduce basic style violations like the excess blanks here.

Jan

