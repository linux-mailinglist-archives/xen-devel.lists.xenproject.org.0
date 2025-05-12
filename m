Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 224F3AB3A51
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981533.1367940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEU1D-0005Xs-7N; Mon, 12 May 2025 14:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981533.1367940; Mon, 12 May 2025 14:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEU1D-0005Vu-4N; Mon, 12 May 2025 14:20:35 +0000
Received: by outflank-mailman (input) for mailman id 981533;
 Mon, 12 May 2025 14:20:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEU1C-00054b-0U
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:20:34 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4341986e-2f3c-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 16:20:32 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ace333d5f7bso838962466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:20:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad219322b57sm619814466b.41.2025.05.12.07.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 07:20:31 -0700 (PDT)
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
X-Inumbo-ID: 4341986e-2f3c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747059632; x=1747664432; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6lAA44VGM+JLpAluZ7RHOVcz+IBGvEJntmd2pUdfrbE=;
        b=QLNnpvGPBf+g0ztHJjnK58tV1R5Spn89E2BcnY7JM+WnJWE3LWiZ0zT4owEWySo/xZ
         0dQme7FrooMcfDVpOzIYl1ZXH0n+s5zfmnjAAMoOdPZo8WUO002XJLyVxukTBuzPX4B6
         aHZdw3zFhnO1epGUS+E6vr2gB0bG5FCO/DYjegQeweljNe1Z9zOWAR4RPEz14QcgSn6l
         GxQwSzHawoAVjlfKGN1P9OfAC+5ZpAek9Jv9zytB5lkSbId2j53fdZ3PAF2E02/bnqAI
         5NTmIakbjasWHLrZ8KYh2qAKpkbD3g3bcy8ZPUBF1+GjXlTJHYDN+CATOA5uEx6PyV+h
         ZRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059632; x=1747664432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lAA44VGM+JLpAluZ7RHOVcz+IBGvEJntmd2pUdfrbE=;
        b=agX2UGKA6wld6oAoA09clU/3NVnH0hEf4fXfhNPpoOolFTppbpkMRY8/GpHqhoOFND
         JgwBeQze9S1Pwu8q3dkmVxOpy2hgMZaw/6KJERvUCZvrVZylC00a9GbMRYOmbPahGO6/
         jWOjWfB+g/mkz/JPTlO0qOzuue9cux8GpFnmwxpJVgWLUIeZaIk8SmX2ZCdOynxNX/DY
         QiHHO6ks4EAk7DE2wRD+rHseeN1f2JMf+UwXC+JmxpExfYjfJWF6vddNg0H2f3mtPXCM
         mC2ImSN7Td7ieI6Ci5pJa8FI2uVcikwleBCKR5lhVJCFtA8CzJZQEI8Lh6j5ypmlNG8/
         KIKw==
X-Forwarded-Encrypted: i=1; AJvYcCWBMR351HiPzOJBGiLAR+K0dDyvqV7KREhGGc0DQjxERewMP/CT5SaNEKi0iPYP1zNYo/pbLOaIm/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTPP0oIAK7VSdM6VlSKmFkCATdKrxHPuHO7C8tdEeOU0egn9bU
	BW8fzA06vG/eXkaTGfwCUA1DbcatQyRhKL5FFu6lxiKaitMAZApEz7e+s0f7uA==
X-Gm-Gg: ASbGncslRwdA7+ok2zyF+eQFDOTO6+GfFs1pc6xXx3mgAuOa51blfjdiVN81S0THSqN
	0lMQOlYWYc2Bi62WO2nYjOs22K76Hk9/GJhQ8dyZCeSJ9v+JsVziGy03LwdI83gLuMK/K+nvkCk
	9qY59ZX307iWoNkrdStCElTmteriDFXDUJ0yJyRrMsxj/54wcRB3sCk870IVjiF9MRRpwymbl4W
	c+QNJ7Kv+60O4gktWmD99Zqp9r2OdZSYKXhpUwhweXat5aAcuJq17RY9Omh8W4poH6XsNihnJfp
	Um2Lx6PTh7weXNJtxUMYU0lBhKLZ6tgScWbRzd6zdun414AbcYDOIdXadbF4W5QnvIOP1J02oJJ
	7WJW2Olx793MKoqEBrcVbh+K+Scqvvzta2PdS
X-Google-Smtp-Source: AGHT+IENM+5oz2Fjs+uB39H8u3KVEeSGEYIKgmxumu4bawQrnX80jMhT0Oqblo9pKULME3ztrhN3DQ==
X-Received: by 2002:a17:907:7d93:b0:ad2:4464:3278 with SMTP id a640c23a62f3a-ad2446436fcmr608313366b.4.1747059631799;
        Mon, 12 May 2025 07:20:31 -0700 (PDT)
Message-ID: <7102b188-7abe-47a5-b889-d11db3eda674@suse.com>
Date: Mon, 12 May 2025 16:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] x86/pv: fix emulation of wb{,no}invd to flush all
 pCPU caches
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-3-roger.pau@citrix.com>
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
In-Reply-To: <20250506083148.34963-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 10:31, Roger Pau Monne wrote:
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -1193,17 +1193,18 @@ static int cf_check cache_op(
>  {
>      ASSERT(op == x86emul_wbinvd || op == x86emul_wbnoinvd);
>  
> -    /* Ignore the instruction if unprivileged. */
> -    if ( !cache_flush_permitted(current->domain) )
> +    /*
> +     * Ignore the instruction if domain doesn't have cache control.
> +     * Non-physdev domain attempted WBINVD; ignore for now since
> +     * newer linux uses this in some start-of-day timing loops.

That's very old comment, and hence I think "newer" isn't quite applicable
anymore. Either omit the word (if Linux still does so), or say "older"
instead? Also since you touch the comment, upper-casing the L in Linux
might be nice.

> +     */
> +    if ( cache_flush_permitted(current->domain) )
>          /*
> -         * Non-physdev domain attempted WBINVD; ignore for now since
> -         * newer linux uses this in some start-of-day timing loops.
> +         * Handle wbnoinvd as wbinvd, at the expense of higher cost.  Broadcast
> +         * the flush to all pCPUs, Xen doesn't track where the vCPU has ran
> +         * previously.
>           */
> -        ;
> -    else if ( op == x86emul_wbnoinvd /* && cpu_has_wbnoinvd */ )
> -        wbnoinvd();

So this goes away altogether, which isn't nice. It was "only" 2 years ago that
I posted a series where an additional ...

> -    else
> -        wbinvd();
> +        flush_all(FLUSH_CACHE);

... FLUSH_CACHE_WRITEBACK is introduced [1]. I really, really think that should
go in first, for it to then be used here. The more that it's the 1st patch in
that series.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2023-05/msg00242.html

