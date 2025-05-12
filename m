Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3023DAB38A4
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 15:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981451.1367849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uET5m-0001Sg-0L; Mon, 12 May 2025 13:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981451.1367849; Mon, 12 May 2025 13:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uET5l-0001QM-TP; Mon, 12 May 2025 13:21:13 +0000
Received: by outflank-mailman (input) for mailman id 981451;
 Mon, 12 May 2025 13:21:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uET5k-0001QG-Kp
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 13:21:12 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7b60d5f-2f33-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 15:21:09 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad21cc2594eso469559166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 06:21:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad240b9eef6sm355368766b.18.2025.05.12.06.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 06:21:08 -0700 (PDT)
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
X-Inumbo-ID: f7b60d5f-2f33-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747056069; x=1747660869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8/Jdp6xh00TVYrcHdZBiDTzzdhUl51dq6C2/tTNi7/M=;
        b=axqpGMMgw93/mM1f66IANxHI4F0vyJbLU7JF68GH9JJAmRjkPZJM0oZwv0qEQU7eVj
         sLJ/F+MCM7gbTxy/lbeOtzPEsieXmy7Gt/0Iv4qKQED7bT80GxDr4azUdrTXsXDM52yt
         YfXc24RqcwKaWbu2TfHKawGNuFe0HflwiW17k/pLsLon+t1r9w8chga4wHy54o4RRID+
         upbSYG5RGjcW+mT9DdW+ggLmX43GJ8OghubTM/Y5WPjrrrjflfthwpDhsKcg6mbOqwTg
         7GJu1+1lByfOKDSKkPCO/cVDpYKSCFoqEWWQrh17j0WRQEk0qCeV+sKhuBfV5d6Xnu5t
         Pbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056069; x=1747660869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/Jdp6xh00TVYrcHdZBiDTzzdhUl51dq6C2/tTNi7/M=;
        b=Mgu+zCi84O0heFAvrV03OzC+trUoGR4TOrt7Q52Gfr+HoyzM37VkHmi5jnW+Ci6q05
         7NuctraIMoySd6TWIR53mkHv2+98/AQ11yE6g5DlUQlb1TNdywCiP7gkE8AiwxGzixCm
         Km24lcNRgGtf88oEE58C2LCmW/FS5BnbEimH53FcYpUp3l1tQZxE6RHHIxRhM5r0Wzx2
         bqF/uAaFDx+0njakLew/6MQArtVJLYO+ELjpK5JMpMv7rrdg97KrC/rhcfwBnx7pQ/NK
         nwFLmuICXfl49GXr0C3Hrmek0+aCf9Holkv5kBXkzLF5yRbCCRFdpsZVwGeWiySDekQ6
         dpEg==
X-Forwarded-Encrypted: i=1; AJvYcCWGne1ZdY1XZpK3V6Ujm6CkdGxbEE1TVaK+RlvtYcUQzYJWKPZdwQyXc8MkUK8EQlaoUNXYVkHqItg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgbHC/Bh4qhz4tupO2gftHY1zhLGIUQLR6uXayrJOJVXXiUvmD
	qX6Gmr9rHGsuZ/oYXy6h+2jmXy9fl4Li6bEAQNACV+1K21RCHReTfsQcgYnR3A==
X-Gm-Gg: ASbGncu2uk+0mt5aArxN1I71XE6XI5fDV+p+okJaZdWuc3OS8uaQfu/0BdNBOGi3v6r
	nkgwPALZHJGQ0csXcwadTuj9xUnB2c9Opacxf0dGc4CoHG6zGgCFrRqfuUwZOr+XOqZ+HPBKazu
	bqHEaVAPmMXODgNIZnwQBAZYAaY93Vwp3kk3eqMzyHujTPBDK2Fgql0PbUVL9C8WAwWsYCcZLSL
	cxbp3zCEcdyp9ple6uZaWBBoGkCrAuofAFY5BySrmiCdeicGPG8VLBUE7SMGuRNDt/9220BjZZB
	Yv2EMsLRmh8jmvYP9viQcKicfnn0/ccgRaew+Cn6rPdjCNa+beWd/bEpK+rIIsjT1utFU5pFI/t
	Npq5f1sNK72xUf57gPF4N+CChQ/yZd3FQB1XxOm5GdG39PfE=
X-Google-Smtp-Source: AGHT+IGHi15OEk7tmogpsygRQCDXYrkbHMNo9o2DGJc8iLaPkyF9gX1MvGX/EAzyqhTJO8yhkqnaTA==
X-Received: by 2002:a17:907:9729:b0:ad2:53fc:a876 with SMTP id a640c23a62f3a-ad253fcad19mr398914766b.31.1747056068894;
        Mon, 12 May 2025 06:21:08 -0700 (PDT)
Message-ID: <af50a50c-599f-4cf9-92db-7d2aee8cedec@suse.com>
Date: Mon, 12 May 2025 15:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/idt: Minor improvements to _update_gate_addr_lower()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250512115821.3444375-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250512115821.3444375-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.05.2025 13:58, Andrew Cooper wrote:
> --- a/xen/arch/x86/include/asm/idt.h
> +++ b/xen/arch/x86/include/asm/idt.h
> @@ -92,15 +92,16 @@ static inline void _set_gate_lower(idt_entry_t *gate, unsigned long type,
>   * Update the lower half handler of an IDT entry, without changing any other
>   * configuration.
>   */
> -static inline void _update_gate_addr_lower(idt_entry_t *gate, void *addr)
> +static inline void _update_gate_addr_lower(idt_entry_t *gate, void *_addr)

Considering comment and name of the function, ...

>  {
> +    unsigned long addr = (unsigned long)_addr;
> +    unsigned int addr1 = addr & 0xffff0000U; /* GCC force better codegen. */
>      idt_entry_t idte;
> -    idte.a = gate->a;
>  
> -    idte.b = ((unsigned long)(addr) >> 32);
> -    idte.a &= 0x0000FFFFFFFF0000ULL;
> -    idte.a |= (((unsigned long)(addr) & 0xFFFF0000UL) << 32) |
> -        ((unsigned long)(addr) & 0xFFFFUL);
> +    idte.b = addr >> 32;

... doesn't this line want dropping altogether? Or at best be an assertion?

Jan

> +    idte.a = gate->a & 0x0000ffffffff0000UL;
> +    idte.a |= (unsigned long)addr1 << 32;
> +    idte.a |= addr & 0xffff;
>  
>      _write_gate_lower(gate, &idte);
>  }


