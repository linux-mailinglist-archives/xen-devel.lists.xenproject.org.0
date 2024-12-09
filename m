Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1272B9E9925
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 15:38:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851461.1265536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKetr-00047q-Qu; Mon, 09 Dec 2024 14:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851461.1265536; Mon, 09 Dec 2024 14:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKetr-00045t-O4; Mon, 09 Dec 2024 14:38:15 +0000
Received: by outflank-mailman (input) for mailman id 851461;
 Mon, 09 Dec 2024 14:38:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKetq-00045b-AI
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 14:38:14 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36ea728c-b63b-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 15:38:11 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3862b40a6e0so1756466f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 06:38:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725e6e024e4sm2681374b3a.153.2024.12.09.06.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 06:38:10 -0800 (PST)
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
X-Inumbo-ID: 36ea728c-b63b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733755091; x=1734359891; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yjznvzia8L7cn+R9yJXaE8tIG2h0LZWNmkUvJzkbIH0=;
        b=TGOycM6ovN30mYI3KiemLrSDxgfbzVrx2JO1xo+d2HfEsB6wyLuotpQ5u/zt7TSIz/
         3kOXzfGtTlYD6BU0uB1G9GLDZWH1cdDyoFyL7lrTFdYezb6FWeoUFYa5W64KQHDR2bAW
         Wo9F+o3UE+T2mMiGCJflVWJvldp5AXkNO8t+Ef3q7Qfy9+xE6cuxXGaX0QKEaMLdzt0/
         lJBWjeWOc3Lx9BWE9DYOyvgW9BpAerNOg+RZB59DTM7BiB2DsApY2skHkYUZgB0B25QI
         zOXF6AfpfNTGdo1ptYz3rKQXvZrc5/QcH2y54hmTEX4wNJFZkYLLUJrcclz9EPYwe+bV
         6F7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733755091; x=1734359891;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjznvzia8L7cn+R9yJXaE8tIG2h0LZWNmkUvJzkbIH0=;
        b=hH3t5lUxIxx56ToScLEU49lTwn9QbmkLozPt2QCRa0ewWLb+zZE3yNeyDBmx8kLVD7
         YCa5ezOJOoKlV8Ag6+jjTaGQq7CTaEAOOUT+dWLtsq7EjbO4Zvfq4kOIkvgVQdpNKzuT
         ats1cbTLE4/84fj5nmz5IfsjLuXHZzNnF4frepDrJcADHKZU9Wf7ijSjAFFzUB5KYPYi
         0yyJsG8et2Si99s1ZRAZLsUjHzifVzw/T9kHIca9L6g0P7q9iLji5S6mIeVmI0v3q/4t
         foufhwwNt/7GLcKtJ6aDJ4kmua7hbojaYmEfaXxbqJLznxhHlogD1xMyg0kz4OHMD7C0
         ykCA==
X-Forwarded-Encrypted: i=1; AJvYcCWU+O6QFHp4mTBJbyeZQI6+1Cd6Xa8GxIrlzL3QyI9B5em8QFVpFdrAanMdvNhYtXHgQ5wwNPqePGY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrHHNvdmAw5ktRjHlZTCco9pzXYWybJLSrPwixxe8hguuwGwm3
	SYgkLCoyJOGttyh/FOtq1aIetHYauds91ZU5y8B19J12urngOQEwEgnae6rNBg==
X-Gm-Gg: ASbGncufdf0g3cXlIyiEy/dytX3Iv4n5KX6gZbsrdEw93xVh35ndmi4PRCC4XlzLo8u
	/2dlVdpiBtl7Gxe7XlQB8arjYTNi0jtDBOj93crRO0FNLRPczXs0+aGcSjXZURQsaYoPyt4k1+e
	qhuyF94PDgvZLyDdzDi3Ch6TGx7lIFz4XLLUr4xoBfmr09odYklw3aDof/a6ZCLpEqq9LoEoPUx
	wqcp6Xp7zyvA0hs7ZuMy1s8qXNSJ/fI/0zk/rjemhNOYFBX2VDxGw6DmD7Ve8A/6P1IEIswt28x
	J+BQNGXJ9PX29HIX9vHWfYlY9n3cH0x0XfI=
X-Google-Smtp-Source: AGHT+IGEYufCWGLGHCMog2quGHZZ/nnkpfO/i8j0k3l/4WmzgkUnIvSiDFDZonOlCZKoBK/mdYyw4w==
X-Received: by 2002:adf:ffc6:0:b0:385:f979:7664 with SMTP id ffacd0b85a97d-38645402da0mr413804f8f.58.1733755091168;
        Mon, 09 Dec 2024 06:38:11 -0800 (PST)
Message-ID: <9d49befe-4592-4e71-ad0b-9a0af34253f5@suse.com>
Date: Mon, 9 Dec 2024 15:38:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] xen/riscv: introduce cache management operations
 (CMO)
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <1310a2fb3b9824ae66f850600925127fdfdb44fa.1732709650.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1310a2fb3b9824ae66f850600925127fdfdb44fa.1732709650.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2024 13:50, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -14,6 +14,9 @@ config ARCH_DEFCONFIG
>  	string
>  	default "arch/riscv/configs/tiny64_defconfig"
>  
> +config HAS_CMO # Cache Management Operations
> +	bool

Hmm, and nothing ever sets this, and hence ...

> @@ -148,9 +149,24 @@ static inline bool pte_is_mapping(pte_t p)
>      return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
>  }
>  
> +#ifndef HAS_CMO
> +static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline int clean_dcache_va_range(const void *p, unsigned long size)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#else
> +int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size);
> +int clean_dcache_va_range(const void *p, unsigned long size);
> +#endif

... all you really provide are stubs and declarations, but no
definition anywhere?

Plus of course this gets us into feature detection territory again: If
RISC-V provided a way to detect presence / absence of certain extensions,
this really shouldn't be a compile time setting, but be determined
dynamically.

>  static inline void invalidate_icache(void)
>  {
> -    BUG_ON("unimplemented");
> +    asm volatile ( "fence.i" ::: "memory" );
>  }

That's a separate extension, Zifencei, which I don't think you can just
assume to be present?

Jan

