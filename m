Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981F985FE84
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 17:55:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684505.1064406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdCLf-0004YV-ON; Thu, 22 Feb 2024 16:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684505.1064406; Thu, 22 Feb 2024 16:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdCLf-0004Vq-L6; Thu, 22 Feb 2024 16:55:03 +0000
Received: by outflank-mailman (input) for mailman id 684505;
 Thu, 22 Feb 2024 16:55:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rdCLe-0004VI-LC
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 16:55:02 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ea5bdae-d1a3-11ee-8a55-1f161083a0e0;
 Thu, 22 Feb 2024 17:55:02 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso8452972a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 08:55:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p24-20020aa7c898000000b005617a858f21sm5571507eds.93.2024.02.22.08.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 08:55:01 -0800 (PST)
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
X-Inumbo-ID: 1ea5bdae-d1a3-11ee-8a55-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708620901; x=1709225701; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+wodz11AuxqAk56yN/n24hcumQ6Q7S3p+gEEetmoBQI=;
        b=Ie5a5Euz11NLDRUvqqgduC4n5/A8WGXJQpBTERDTjpB8EpIo4uPZXjzkQpHDea5It4
         VW9RwpUFDhO1eztcTuSMlCgqDIo5pgxUgU50RABpjfjpRrpXHpyQpKv/pzp1ZansPs0Q
         7JgEE01vhhCp0qUNgNB7YXe4wBh05dVaBOupWEE6zKVZmANVcR202sDNFiys8URMjuLu
         faubLsl1K/h9yaLCFiWa3tmNTash6APVMcNmZ4UQbjnQa7raqj0nLDdsA0szZ8uUlv4K
         +DZoHeDQ0hBIBR8KLcYhONdCrZVILIH0qe/Xdao7yvb3/QCaZiN7I4yQWmOnVpz6i2x8
         V02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708620901; x=1709225701;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wodz11AuxqAk56yN/n24hcumQ6Q7S3p+gEEetmoBQI=;
        b=wE82tj7FZczoLrggTbVlQrUpNjASFLDYV+PxdXGWm0BH6w6AL1fsnvmmXX7UjSvNjg
         0cg82+2XhPNIPSIGGexQ1mnRlRTaxiRiUt5SlGBEpwC2KROFaJCnICpFdrd9IgYobD+B
         nXnm3NP07DGsnt+MLcV06nkJ6Xh0SbLNsbaEaTQtnJObtVRej0vF0kBF/svg1Hp1XqlY
         iJ6T+DjONmKhF3iPqkZCRf+fIH2uZe2yWALmRU16H+G/b8bD0AaKoSp3QsbdvX82vxWb
         fZAWO1a2UMWKew7lQYAc8kSSILRBvkSa5nUaXfhiCpKPfIvhRTfviEL3zG6z99P4T8S+
         nNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbKvcdLytCtDofC9vHCL/5eziWdbl2i+7jBRp/fyX0yICBCvCB8mykb6kt/tKocTa/L7H9BvIMEeVbmXWSPj7VPfpspiDp57cDDiqUy1w=
X-Gm-Message-State: AOJu0YwZeCLXQmp3/1q7BRbROSfdLa6D6ki33Gx9a4bmlZ/UzsKI0VCH
	xZdLdbQF2o+XAcBM4m2j8EPRyzn5DJK36OmeobLEkmhvfYbMGXptGxDciOrjmg==
X-Google-Smtp-Source: AGHT+IG19+3X4IMoUDl/gRiGJ1CIyyb0uylRUMZEsNLc1FpTEbZLzZcwj6iE/g/FSekcBXcVt/f11A==
X-Received: by 2002:aa7:de0a:0:b0:564:bbdc:ac3f with SMTP id h10-20020aa7de0a000000b00564bbdcac3fmr6334225edv.16.1708620901599;
        Thu, 22 Feb 2024 08:55:01 -0800 (PST)
Message-ID: <b1c96b93-fd75-4077-b622-4781b7811ee8@suse.com>
Date: Thu, 22 Feb 2024 17:55:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/altcall: use an union as register type for
 function parameters
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Matthew Grooms <mgrooms@shrew.net>, xen-devel@lists.xenproject.org
References: <20240222164455.67248-1-roger.pau@citrix.com>
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
In-Reply-To: <20240222164455.67248-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.02.2024 17:44, Roger Pau Monne wrote:
> --- a/xen/arch/x86/include/asm/alternative.h
> +++ b/xen/arch/x86/include/asm/alternative.h
> @@ -167,9 +167,25 @@ extern void alternative_branches(void);
>  #define ALT_CALL_arg5 "r8"
>  #define ALT_CALL_arg6 "r9"
>  
> +#ifdef CONFIG_CC_IS_CLANG
> +/*
> + * Use an union with an unsigned long in order to prevent clang from skipping a
> + * possible truncation of the value.  By using the union any truncation is
> + * carried before the call instruction.
> + * https://github.com/llvm/llvm-project/issues/82598
> + */

I think it needs saying that this is relying on compiler behavior not
mandated by the standard, thus explaining why it's restricted to
Clang (down the road we may even want to restrict to old versions,
assuming they fix the issue at some point). Plus also giving future
readers a clear understanding that if something breaks with this, it's
not really a surprise.

Aiui this bug is only a special case of the other, much older one, so
referencing that one here too would seem advisable.

As a nit: I think it is "a union" (spelling according to pronunciation),
and I guess the title could now do with saying "optionally" or
mentioning Clang or some such.

Jan

