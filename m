Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ACCCC6732
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 08:57:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188597.1509730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVmP9-0004sD-EF; Wed, 17 Dec 2025 07:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188597.1509730; Wed, 17 Dec 2025 07:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVmP9-0004pq-BY; Wed, 17 Dec 2025 07:57:03 +0000
Received: by outflank-mailman (input) for mailman id 1188597;
 Wed, 17 Dec 2025 07:57:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVmP8-0004pk-0B
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 07:57:02 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7940af2-db1d-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 08:57:00 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477b5e0323bso1378335e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 23:57:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd993f026sm23790605e9.12.2025.12.16.23.56.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 23:56:59 -0800 (PST)
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
X-Inumbo-ID: f7940af2-db1d-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765958220; x=1766563020; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6bS2HtutJIOKEgHvKCYmMbwkYl2FVxLkCBY4kdmTe4w=;
        b=KVtG/zhfCFUu6MKtk7K5aKmEl1seebVvtqyTyHofHJr2FEyszjUwJ7oWCs+X/eCgy4
         MlHv6bUfWA8kSbPxYjfnv3swc7twraECvTvW7npOaFuG55Rr/YAm+Sy4MdelrrhkalrG
         R8zgidxF3EQ2HaH/cPKhEVTvaKwVtM9pe1V5QZ6cpSAv6lSJ89HdiscmXSJ50DH3GuEQ
         QaD01bofVjxgwhTN2W5fBeIJEt9gXxeRlK3mwGFTXRp3vfCdF7uF0L12Y4blg6q9ruX3
         mQwwbrywDGxDIi+Yjc7kF+uqyFlstXlMHT8aGiU0Q3T4PmmzOo0TctSV2enU3WZNclMl
         NveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765958220; x=1766563020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bS2HtutJIOKEgHvKCYmMbwkYl2FVxLkCBY4kdmTe4w=;
        b=QZYWvCgSvzij6QdQdT0+G+6uZ77840LtO9g1YYy34IYIy0b1rSf91gXVUypNDfnD8r
         9su/eDFNlaUJ41d26L1oeQCaV+DkR34MAWQrkbEjAQXcZc41/2bVRAhHJTqx/CIUHgc0
         DwZPgwtwbmsInCP34w82bOvKdXAiCTJmVNBc+RUUuoHKyDbdFRgBYBkPiRBcwqjoMSJN
         +Rdhr87Af5um4+HqOSyxERIOmi5MX3AfpOS1vab/F9Lyy4UuYjkoyl3Bt4px/xrRrXyz
         OJrF9P9/coyRbzMvpSmjkgOlXYSLIP+Voc4dDFTkSb8hCLTAPZyEQwcaPMFaTREVE4yK
         kzWg==
X-Forwarded-Encrypted: i=1; AJvYcCUBZCipL6KjsfCxoyz33jAsp2mCavXMb+IaTkqL8wUKjEweBxCMwHbUqYricJFqS9d7zK/L9jKbzA0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLwmzO/nuT2F67NuH3V6hKuL634BVIHZpisuERjl+dOPJHyFsv
	uzs3lfUA6lHznmRN6hAYnOkQN7V/mod9rB7HVQAQFOPUASNJhmkmnjekChhTdb1pRw==
X-Gm-Gg: AY/fxX7bOTHotkgkC5M3elkCDUtqhGmejwDxo0m4cjlCGQEhmPqS/V/GgG/55tZwIAw
	xY49qc+G33d5Gt6ldhF2Uc+0PC3iRCgw1wdDOgz3ZPvnYJOcZjGC1UV8BQr15L0ZKjRYFH+ReBX
	jMLNgEY+dwIc0PpuJOl+prGulAMLsJa8WmFAeFcaytzAaQFIhhQvwDb55SlcigChEmXGvTw6Sdl
	dh/mvX72bDWGNzTmZ2QXZsNrHlGrOGqV7lX6X41OmohvGrYia/EV9MTvEC5vqbGnRcL0SOvghk3
	qgztU3pzCFt8rKgEyfP3k/Zr2YsSNG46SFXKm3mXOZOMTlkUPzSmKjNruJJ2ZaOJ4rbiQFDUP+F
	APyjPcyCqx+liizTwo4YcStrBwnVhD+nfCJOuP82yTlHPaai9XCZROKWsjfXHr077UlQ7pGpIlR
	fbcJ1PWUvvyjQjA/mpIcibII/GOm3UggSADbBEAvhvLhKD4Cl8V7T6K2G0wfhjXZsb6vPQ9bXlJ
	GY=
X-Google-Smtp-Source: AGHT+IEGgMmiug20du4vdt4sFwvZJXH6H4IWs89UQUWbL9GsW5tXn3l5Q5DmZzHGEY15cr/cfEXfYw==
X-Received: by 2002:a05:600c:529b:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-47a8f09428fmr185098925e9.1.1765958219702;
        Tue, 16 Dec 2025 23:56:59 -0800 (PST)
Message-ID: <d3c61635-875c-46e3-967d-64def04c7df4@suse.com>
Date: Wed, 17 Dec 2025 08:56:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] xen/x86: move domain_clamp_alloc_bitsize() into
 pv32 code
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251216231348.3897820-1-grygorii_strashko@epam.com>
 <20251216231348.3897820-2-grygorii_strashko@epam.com>
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
In-Reply-To: <20251216231348.3897820-2-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2025 00:13, Grygorii Strashko wrote:
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -619,8 +619,16 @@ void __iomem *ioremap_wc(paddr_t pa, size_t len);
>  
>  extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
>  
> -unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bits);
> -#define domain_clamp_alloc_bitsize(d, bits) domain_clamp_alloc_bitsize(d, bits)
> +#ifdef CONFIG_PV32
> +#define domain_clamp_alloc_bitsize(d, bits) ({                                 \
> +    struct domain *_d = (d);                                                   \

This imo wants to be pointer-to-const. Question is whether then I'm upsetting you
again, Andrew?

> +    ((_d &&                                                                    \
> +      _d->arch.physaddr_bitsize)                                               \
> +         ? min_t(unsigned int, _d->arch.physaddr_bitsize, bits)                \
> +         : bits);                                                              \

This imo wants to look more like

    ((_d && _d->arch.physaddr_bitsize)                      \
     ? min_t(unsigned int, _d->arch.physaddr_bitsize, bits) \
     : (bits));                                             \

The parenthesization of the latter use of "bits" is a must.

With the adjustments (happy to carry out while committing, so long as there's
agreement):
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Albeit, as indicated before, I'm not quite happy with the use of min_t(). Maybe
another macro-local variable _bits should be introduced?

Jan

