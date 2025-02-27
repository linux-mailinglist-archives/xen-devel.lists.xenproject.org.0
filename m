Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF74A4775A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 09:11:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897911.1306533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYz8-0004Er-32; Thu, 27 Feb 2025 08:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897911.1306533; Thu, 27 Feb 2025 08:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYz8-0004C4-0P; Thu, 27 Feb 2025 08:11:10 +0000
Received: by outflank-mailman (input) for mailman id 897911;
 Thu, 27 Feb 2025 08:11:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKxr=VS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnYz6-00045s-8b
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 08:11:08 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64f392a7-f4e2-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 09:11:06 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-390e3b3d3f4so189600f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 00:11:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b7a27ab2asm14004275e9.32.2025.02.27.00.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 00:11:05 -0800 (PST)
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
X-Inumbo-ID: 64f392a7-f4e2-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740643866; x=1741248666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nOfrGNQmmxowAQaqFi4XIPOfsqcKlZ8GIDY6AD8oo+8=;
        b=d5o5/Zl1GseHZffsJjMlx0LJJiKSLYGOVcHwT5zIBFkRTJCf2iEr9F+al+IETd5dAk
         /pgSZVb0iM8xtlkAxkCwqFa5EOzYip+x905Tj6Tr0avg0KmRWZvACJkqmbt/9L3sZZYe
         Xmo91j+Pxr2L4G9zcBXDzJyF0iSS3jWZ1XhN1WLe/PBJA7HkC9tuKikQHFEikmu0b/cB
         8/y+fg/CLxAjScy67ztpEE14d9LBIjYzsCU1ysMzrQyG7PbtRHmzLQY4Zs6d3AkC5L91
         NKk/HSccbaOyZpcY/BUcSsi9pmh1VPBCDDY5o6SJS5etNdJaG+dMuDMsIbG55pl2tTRD
         +14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740643866; x=1741248666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOfrGNQmmxowAQaqFi4XIPOfsqcKlZ8GIDY6AD8oo+8=;
        b=P2Xa5LwmO83REe3QRZCtZG5xQzD6Bys3T4dsGJhGl6jBAkBGFizQLDeHa6/39y2gFs
         wPW6Dcyc9w6DPhezzwcRePLjL79B2cVNgHuzlorSso4ebcTlEynbG8j8OOqYakLIWA9k
         AK9NNO2yoXlFhaw69L0gcC99/tLbX4iwIoe0DUe7J1DGcdQq1GMGsaq22wUjBmWMGhL/
         zvcHAR89bHf9jSNiD2izwUl1WLob0XO5FFVcWqoXBEi52Uwp/t2X8CiWFdU0Y+ZrP9mt
         2RSzUUY8MpMlbPStNfypdQHtkoANXNKcin52QJZuG9bm8MaUwIRi357ONpC4F0t3k2bX
         83Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUmYeJKSovw33mBsJgnyQ7dMMR7jNmD/CiqWp92oPhyukQiGWdD2atJjNpqAqmUmNjNHXJ3FSyeY9Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+47yW4lJxuWH6M6HAyhoesnivBSTrQErgCSCdfBpYI+pLRWTc
	7s2OGNkuNxkeZCE/MmkywXxN5jEVlfA6PN0u8L42CyvsV7O6NwPardAkP5Rvhg==
X-Gm-Gg: ASbGnct49i4zY8AYEF+9OBPiH7ULMsZRieo1AJUacUahrIFAo1hclFn3Nu7DRtLFHTu
	Rn5fo5yyfdilRrrTVzL2rwEeGu/T5sOdE9pFFEvggP7QdfkGvcz44nTXldIj0l7U+uFkpqm/r+Q
	7wRjPE5WYgRtiWbSeg490KTlVPiZPt4iIZu6M7j4kx0Ar9ZCAXv6fkN/M5FaLn+yL5Cne53kntm
	ovILeSb6FqO6zwIgjfzvsRcItK1aBOehl+K4nH/WVQQPBCx3/uRxeia5bR3gDgH+nmefQuZweuU
	O0KBJkjJpNTHo+g5AfboFIpfpY3fcd9RiriT7ExtGMFT42EPESaiIH83hRhOmKdRF+gxV1fmWg/
	jPEeZ+vrXnxI=
X-Google-Smtp-Source: AGHT+IF3C46EcqqLsCNB8v54cRYQ5chCcFviLkOzA3pabEFsqN+XW2L1GWXyNKk0xCiNExRT5i8UDw==
X-Received: by 2002:a05:6000:2c7:b0:38f:21ce:aa28 with SMTP id ffacd0b85a97d-38f70827b21mr17522950f8f.36.1740643866147;
        Thu, 27 Feb 2025 00:11:06 -0800 (PST)
Message-ID: <113b2464-c7b2-4068-a179-707cba4f3835@suse.com>
Date: Thu, 27 Feb 2025 09:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/bitops: Use Zbb to provide arch-optimised bitops
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2025 18:20, Andrew Cooper wrote:
> --- a/xen/arch/riscv/include/asm/bitops.h
> +++ b/xen/arch/riscv/include/asm/bitops.h
> @@ -125,6 +125,13 @@ static inline void clear_bit(int nr, volatile void *p)
>  #undef NOT
>  #undef __AMO
>  
> +#define arch_ffs(x)     ((x) ? 1 + __builtin_ctz(x) : 0)
> +#define arch_ffsl(x)    ((x) ? 1 + __builtin_ctzl(x) : 0)
> +#define arch_fls(x)     ((x) ? 32 - __builtin_clz(x) : 0)

I fear you won't like me to say this, but can't we avoid baking in yet
another assumption on sizeof(int) == 4, by using at least sizeof(int) * 8
here (yet better might be sizeof(int) * BITS_PER_BYTE)?

> +#define arch_flsl(x)    ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
> +
> +#define arch_heightl(x) __builtin_popcountl(x)

arch_hweightl()?

Jan


