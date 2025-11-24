Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E64BC809BB
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170855.1495877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNW8F-0003kc-Kr; Mon, 24 Nov 2025 12:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170855.1495877; Mon, 24 Nov 2025 12:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNW8F-0003iK-IK; Mon, 24 Nov 2025 12:57:27 +0000
Received: by outflank-mailman (input) for mailman id 1170855;
 Mon, 24 Nov 2025 12:57:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNW8F-0003iE-2W
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:57:27 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f80522c-c935-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:57:24 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42b387483bbso3165119f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:57:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3592sm26967062f8f.21.2025.11.24.04.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:57:23 -0800 (PST)
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
X-Inumbo-ID: 1f80522c-c935-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763989044; x=1764593844; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=coIS1yurgMPk61iUM6HiDX3be+bFx+z8d5FqBQaYy8Q=;
        b=UBAOrdJhR/H9zF5x+R2Og4cIP5MA9YiK9UDZ1y/BmeDGkUAvckbn2vZRApmgwLwztA
         QsH8mPqOfKd/zYWW4d2NysubeZXVdoxp3V/kmc0dg/wCe+PzDtoOHpI38L4ANhSu69I3
         jLO01TToAqjSTJwPTu4Uv3w+9wM0yp3RjGRn4iotKTcmcROYccp0Jhu1Mcg114a/CUTa
         CI+sCxLt5qT+VMPyO2JdeTLJRKHqUWKRBfRmMqMXa39i0bhnvu2rGpHz4/4Y9MN1x6RF
         FQBF7ZXgFW61eXh2wL8L4KYVvh4gzPkdoiIPXCs4HJb/08oGwPvUMWk5eNBuXTtIYGGh
         D2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763989044; x=1764593844;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coIS1yurgMPk61iUM6HiDX3be+bFx+z8d5FqBQaYy8Q=;
        b=Eh2EFnEF/MiaJwaxnf58nL8qipEFrUubV3aCqtMO1tg/NuTVl3d5sHeSAL+H0/y5fa
         Svp3SQzssMqSSKcEbGdhvCBir6gKwGkJSg3fjt2H7/byky+jmc/nBz7Q5AnW1tb7r3Pa
         dDgYCfa/9RoDQ8OdURtkrBvDeq/NPQdYv2QsuOUW31AskLB+JEVgyLrotMzjHmEPmRBr
         d9eczzi0hloVFE3+0x2OctyTBFyu3jl1N5Y/Sod0/ZgKqBFG35wZqXnmzUoplsU//o1+
         R4iZP0aJZEbSzc5q6JsxcpbbeUWwifbvw/lOR9LIuwW4agIo7P6B6oCUGPDDDaovj80a
         7J2A==
X-Forwarded-Encrypted: i=1; AJvYcCWN8Ev5oa/R/bK+KyPld+PeZGRRjkaP6zWprPf0Pn9OZWOs1NDzhcl0Ti6+xmrRNUAc3DmhruNeV9M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwF6hM+iy+/KmmomyVQQH3u72KtcLSnVkNfALoZWs003JDU9rGY
	AxRw2EDJbuCDxc9VMtiODsPeOij9lZGy3P0Xp4W8RUeB5zxin6e+RCidu1jzuR4jEw==
X-Gm-Gg: ASbGncvPj5hHclxLWl2zX3JLuIn7CfqRfontkRDYlrQNVXi0qRjwNvV5L1uAOWrhCXV
	ai5SlauuoLXqeROVydqoABSDdxI9pB8U/9INN5cO9QLnHs19mqBZxNPFvxTJaD4nLqp8DjF6pNa
	DH61PG4CM3q4kA1hgHAarkABGThlcQXUxNJrpYjktlJc5Ij1jUtdbWkhr+bo+3uL9w1luWHXBm/
	uxgJz5W33SJwmwIAXsyyFnT+9Wro5xvv7t1arwrTnRygBmSqDMg4BrDC8+nu/urzxrtqUYdvgaL
	zR4GNWaIQPUsPc8Wbefi5JJ65Q2AbqnH3BmNiiZdo7ot8hSQnp4ui/ZwsM9NIX2WqJJReEPLiG9
	IujB+khZGy+lRzYPtzrWe9MZeJlHOF3HCzT23HzPBc3k9tXudSXaW/XzvfDQMEPtmMoB80Lbgn9
	sj7D+hJKn5xFEuAC5/Q4qte+Cj56a6c8JUIXB+9yxORz8YAnM8zIH+4gN9tYP+kRQkRHt3rvmxS
	n4=
X-Google-Smtp-Source: AGHT+IGLBIt+UcG6FsHTcKuAmeOKq2MtfE6ttCqPw3JxVlbp1GSvK0xwCTPwPcmrpPLPmrh/RZeNTg==
X-Received: by 2002:a05:6000:2387:b0:429:dc9a:ed35 with SMTP id ffacd0b85a97d-42cc1d3479cmr12245740f8f.43.1763989044248;
        Mon, 24 Nov 2025 04:57:24 -0800 (PST)
Message-ID: <b0c69f60-94da-4279-ad34-261c036fde7e@suse.com>
Date: Mon, 24 Nov 2025 13:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] x86/irq: convert irq_desc pending_mask field to
 integer
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120095826.25782-1-roger.pau@citrix.com>
 <20251120095826.25782-7-roger.pau@citrix.com>
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
In-Reply-To: <20251120095826.25782-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.11.2025 10:58, Roger Pau Monne wrote:
> @@ -779,10 +775,10 @@ void move_masked_irq(struct irq_desc *desc)
>       *
>       * For correct operation this depends on the caller masking the irqs.
>       */
> -    if ( likely(cpumask_intersects(pending_mask, &cpu_online_map)) )
> -        desc->handler->set_affinity(desc, pending_mask);
> +    if ( likely(cpu_online(desc->arch.pending_cpu)) )

Same remark again regarding the guarding against hitting ...

> +        desc->handler->set_affinity(desc, cpumask_of(desc->arch.pending_cpu));
>  
> -    cpumask_clear(pending_mask);
> +    desc->arch.pending_cpu = CPU_INVALID;

... the value stored here.

Jan

