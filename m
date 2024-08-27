Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B46ED9606A8
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 12:06:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783769.1193059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sit5h-0003YY-BE; Tue, 27 Aug 2024 10:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783769.1193059; Tue, 27 Aug 2024 10:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sit5h-0003Va-7x; Tue, 27 Aug 2024 10:06:21 +0000
Received: by outflank-mailman (input) for mailman id 783769;
 Tue, 27 Aug 2024 10:06:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sit5g-0003VU-DM
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 10:06:20 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00953ed2-645c-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 12:06:18 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so60710766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 03:06:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e549f5c1sm90215366b.68.2024.08.27.03.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 03:06:17 -0700 (PDT)
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
X-Inumbo-ID: 00953ed2-645c-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724753178; x=1725357978; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K7B020LNejmQpcsQmDsGhftsIXMYhjSNG2gBAlVB3jI=;
        b=eLjAizbJgf9sN1ZFn9z9vavCYN6qkUnrfaDw9xvPtEmt/QThYgO0HDPP1eDVCDD4hz
         u6DH2Ghp4t32JFz+kaQ/daRfEEWIlWGlMqssvLhKEVmsBa6Eb0KAI3HyKNUfsj7O1+Ds
         0Z1w7dTMgEQG3H07VDjf+x1BAed4Uw2KbVrQK1O7NrMkY7talLjPiVqg07512gI7zhdO
         PrTg9qG8gVT6Zvp7i8WEE/1s5PVyrFclzxXN8PD5XdtcYDbpJP4b2//dCZL2/bqJBh+l
         mWf9jD6CQU0mjgWFnog2S9+yPVA7Sf2PP4GeG8mOZ8yQRrERAer8MMSC5qM/utvNSFfU
         y0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724753178; x=1725357978;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7B020LNejmQpcsQmDsGhftsIXMYhjSNG2gBAlVB3jI=;
        b=VR4rCDBziD0pb8qJGbRPJvlktRmUzgU2vT4D/ii6GlEDPfsVXn7I9ZVg5UW0hPVWha
         f6cwdEbRxWQiFUzwJUJlvatW/JsUPoICs5YgmepdepyEu6a4PQCSM9lGJcCeHRVWMy39
         XP8cYcdeSYJpWKhGXMh09Bw7/tYoa81q2IwqvLVP0CcsT+x+G70/P3cKIi9eEQ2tVtmC
         quBgj5BN71ZrLdX6xyC3S1GqBPn1HI0ViLMyN+GQVhOIIDJUlhmy1YHjeb540xBw9knz
         4DTUlyD1r9/U6acjUdqvfcBA5Al9gu8WFbu0Iv4bGcESy/eCKq11FtwQMC9WYDa/tGJR
         5KDw==
X-Forwarded-Encrypted: i=1; AJvYcCVEj+5WtKNW30o6QBKVL1m/Axpr7norr+ud9HNFbyxDAR4rnwGHQkf0iwcV57YdxKv9GJFep1c7b/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrnBLCB6TQ6FXGQN3tqQAH1uDjv9dAsLNs4aQ/d3hxgrkqxcfR
	wvqVCWx7MLk66vgc2K8nMe53Y1Hrxx1Euaw9sUv5d3+sv0z4NDVEF/8HK8Pkrg==
X-Google-Smtp-Source: AGHT+IEYLo/pLXhFi/u0X5rhBgSECncheOkDFPmxk31bJUo95vJ71JUxWeNJeYGP0zTt3esnAwTTHw==
X-Received: by 2002:a17:907:7b82:b0:a77:c364:c4f2 with SMTP id a640c23a62f3a-a86a54882f6mr822324166b.52.1724753177475;
        Tue, 27 Aug 2024 03:06:17 -0700 (PDT)
Message-ID: <0f9fb47c-91d1-4ee9-b6bf-1d491339e904@suse.com>
Date: Tue, 27 Aug 2024 12:06:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] xen/riscv: use {read,write}{b,w,l,q}_cpu() to
 define {read,write}_atomic()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
 <5140f9eb3d1cb0b69e3b1cbbcce6167ff8d59e4c.1724256026.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5140f9eb3d1cb0b69e3b1cbbcce6167ff8d59e4c.1724256026.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2024 18:06, Oleksii Kurochko wrote:
> In Xen, memory-ordered atomic operations are not necessary,

This is an interesting statement. I'd like to suggest that you at least
limit it to the two constructs in question, rather than stating this
globally for everything.

> based on {read,write}_atomic() implementations for other architectures.
> Therefore, {read,write}{b,w,l,q}_cpu() can be used instead of
> {read,write}{b,w,l,q}(), allowing the caller to decide if additional
> fences should be applied before or after {read,write}_atomic().
> 
> Change the declaration of _write_atomic() to accept a 'volatile void *'
> type for the 'x' argument instead of 'unsigned long'.
> This prevents compilation errors such as:
> 1."discards 'volatile' qualifier from pointer target type," which occurs
>   due to the initialization of a volatile pointer,
>   e.g., `volatile uint8_t *ptr = p;` in _add_sized().

I don't follow you here. It's the other argument of write_atomic() that
has ptr passed there.

> 2."incompatible type for argument 2 of '_write_atomic'," which can occur
>   when calling write_pte(), where 'x' is of type pte_t rather than
>   unsigned long.

How's this related to the change at hand? That isn't different ahead of
this change, is it?

> --- a/xen/arch/riscv/include/asm/atomic.h
> +++ b/xen/arch/riscv/include/asm/atomic.h
> @@ -31,21 +31,17 @@
>  
>  void __bad_atomic_size(void);
>  
> -/*
> - * Legacy from Linux kernel. For some reason they wanted to have ordered
> - * read/write access. Thereby read* is used instead of read*_cpu()
> - */
>  static always_inline void read_atomic_size(const volatile void *p,
>                                             void *res,
>                                             unsigned int size)
>  {
>      switch ( size )
>      {
> -    case 1: *(uint8_t *)res = readb(p); break;
> -    case 2: *(uint16_t *)res = readw(p); break;
> -    case 4: *(uint32_t *)res = readl(p); break;
> +    case 1: *(uint8_t *)res = readb_cpu(p); break;
> +    case 2: *(uint16_t *)res = readw_cpu(p); break;
> +    case 4: *(uint32_t *)res = readl_cpu(p); break;
>  #ifndef CONFIG_RISCV_32
> -    case 8: *(uint32_t *)res = readq(p); break;
> +    case 8: *(uint32_t *)res = readq_cpu(p); break;
>  #endif
>      default: __bad_atomic_size(); break;
>      }
> @@ -58,15 +54,16 @@ static always_inline void read_atomic_size(const volatile void *p,
>  })
>  
>  static always_inline void _write_atomic(volatile void *p,
> -                                       unsigned long x, unsigned int size)
> +                                        volatile void *x,

If this really needs to become a pointer, it ought to also be pointer-
to-const. Otherwise it is yet more confusing which operand is which.

> +                                        unsigned int size)
>  {
>      switch ( size )
>      {
> -    case 1: writeb(x, p); break;
> -    case 2: writew(x, p); break;
> -    case 4: writel(x, p); break;
> +    case 1: writeb_cpu(*(uint8_t *)x, p); break;
> +    case 2: writew_cpu(*(uint16_t *)x, p); break;
> +    case 4: writel_cpu(*(uint32_t *)x, p); break;
>  #ifndef CONFIG_RISCV_32
> -    case 8: writeq(x, p); break;
> +    case 8: writeq_cpu(*(uint64_t *)x, p); break;

Of course you may not cast away const-ness then. You also be casting
away volatile-ness, but (as per above) I question the need for volatile
on x.

Jan

