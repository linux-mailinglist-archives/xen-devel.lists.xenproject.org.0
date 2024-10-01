Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180DE98C1DE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:41:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808302.1220198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svf04-0000YB-K5; Tue, 01 Oct 2024 15:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808302.1220198; Tue, 01 Oct 2024 15:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svf04-0000Wg-HF; Tue, 01 Oct 2024 15:41:20 +0000
Received: by outflank-mailman (input) for mailman id 808302;
 Tue, 01 Oct 2024 15:41:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svf03-0000Wa-EM
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:41:19 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 991fd25c-800b-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 17:41:17 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so10421741a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:41:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c882494856sm6321957a12.94.2024.10.01.08.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:41:16 -0700 (PDT)
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
X-Inumbo-ID: 991fd25c-800b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727797277; x=1728402077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u/OOOJXTELjQOK5vmJZ1RKF7zyc3Z5muk0aShovUEyk=;
        b=P0eMLZMuqeXy+9HH/FLWVUWWSFBzkzrWEMz1w2ve+yfKb8+oydjRGsIgSKSMRfVxJV
         IfpDUAcxoRrXG2PbiJeGjn/+PG4zoZXj1iR0tzyfxgL1fxWCJjJAL4wsfxfH9FbydFkB
         6mTgn5J+xHJ/8EbgFutgZdGo2YYsXDRFH0N4SBASgn/cUMBQGu/DE9gmNNBLv7HYMc76
         sFNHqwAQ0ELqNADQnJmgJF2sxUBehPU8DwdRbXOVkC4e9xEbVq8LNf/hm5Yb8WOtjaqq
         SGmIA78ZP7O8r+GaMe3r1L7YsSlIrFqcIdQsJU09onPTT5q9qD/zvjYu9JWR8TYKhRBH
         u+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727797277; x=1728402077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/OOOJXTELjQOK5vmJZ1RKF7zyc3Z5muk0aShovUEyk=;
        b=uNJJcYBP7rX7ig7QlUvx2D3uDVXK69REVJrTxIB0zAcR8HWTxZsjwXdrVUi57m37Ns
         UABIeyalqkCSzKsJYGDhMjYIo9XxxCnobUXmeSp5k3qbx2s2OnALjpGoCS8757NwU0lD
         /s5Q3yYHAsogM+qcofaI9rtZ3GG/hKUbc8DcMpEm3/ozspI7g4EJLnqqJN4YPwZ1/4Xk
         ciy6iwknHyBXkqO7x/JoX5qTFja8rY16dWgh5h+wAwU/0tALZ50qun1i9EQEQ5SuaCU1
         4CyPQ3dROXYIocQ+FPKzhG8kdL3Z7v5YsrQo1Slg3x30M/fDl8QA0KxO6wjf7CQLOiIj
         AtxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaucBeR8Hkn5EGHNZXT8FiZyyimYC/e4kynvbn+/md8olkW5PmK54HlTBCcDVwK94tQ3/Dxq+7WbE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCIR2w8QZSGm0pvRB3VGTmf5qPrrIsnaMUIEdIitxTiXqLIH53
	HhXfKXtJ/xCPk/O1ucVOD7bH+bgpluq9nk5LunLrYQVUn99DV4CTjfVhH74M3Q==
X-Google-Smtp-Source: AGHT+IFojidQ4FhOjo4QXrIrUkLsOSwhqOgXjMNEKNxO+JEeBHS+43la7nf0xRRpTmmsdiDgvgRPUQ==
X-Received: by 2002:a05:6402:5ca:b0:5c5:bda7:c839 with SMTP id 4fb4d7f45d1cf-5c8a2a782bamr3531569a12.17.1727797276889;
        Tue, 01 Oct 2024 08:41:16 -0700 (PDT)
Message-ID: <61347488-6b4b-442d-9058-cafd65b0834d@suse.com>
Date: Tue, 1 Oct 2024 17:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: implement virt_to_maddr()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727708665.git.oleksii.kurochko@gmail.com>
 <1d4270af6469af2f95ede34abd8e9f98f775c1f1.1727708665.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1d4270af6469af2f95ede34abd8e9f98f775c1f1.1727708665.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 17:08, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -28,7 +28,20 @@ static inline void *maddr_to_virt(paddr_t ma)
>      return NULL;
>  }
>  
> -#define virt_to_maddr(va) ({ BUG_ON("unimplemented"); 0; })
> +static inline unsigned long virt_to_maddr(unsigned long va)
> +{
> +    ASSERT(va >= (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE));
> +    if ((va >= DIRECTMAP_VIRT_START) &&
> +        (va < (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)))
> +        return directmapoff_to_maddr(va - DIRECTMAP_VIRT_START);

While the cover letter states a dependency on another series, I'm unable
to spot directmapoff_to_maddr() in the tree or in that other series.

> +    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
> +    ASSERT(((long)va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
> +           ((long)XEN_VIRT_START >> (PAGETABLE_ORDER + PAGE_SHIFT)));

What's the point of the casts here? va is unsigned long and XEN_VIRT_START
is a literal number (which probably ought to have a UL suffix).

> +    return phys_offset + va;

Don't you need to subtract XEN_VIRT_START here?

Jan

