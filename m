Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6185FAA6C31
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 10:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974498.1362349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAlNW-0007X4-6I; Fri, 02 May 2025 08:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974498.1362349; Fri, 02 May 2025 08:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAlNW-0007VU-3f; Fri, 02 May 2025 08:04:14 +0000
Received: by outflank-mailman (input) for mailman id 974498;
 Fri, 02 May 2025 08:04:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uAlNV-0007VM-0Y
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 08:04:13 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07afb2e8-272c-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 10:04:11 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so370571866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 01:04:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189149fc4sm11377966b.36.2025.05.02.01.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 01:04:10 -0700 (PDT)
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
X-Inumbo-ID: 07afb2e8-272c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746173050; x=1746777850; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6vHvO/Ki8AASIXA/ZkTOmnjaGU42zPy2OR3n8qVU1I8=;
        b=Xe0psTJSsGdaaKcT2Y1fqos1ywUayOzanPAgGvORwViOrBZxoVVTu8gVRrAUZjnJ+9
         tWlJeOXWGRa//K/c8p4/qR2zpXvrp6HmLxKtc0Jf8CgQms7ba21WTzIB6MVcOwAf6akm
         fj99fA2+3K+Obnslq+2lKyY7u27ILIT2g1rE+5FGMlPBt+5vTTCwyEyEFGn9nUwH1YaS
         vah15Y7f6TJ2V41wpFkFM2LfWhgOaHTIYKpMhPFJ2mBKhMnYVqz8k0FjBcR/FJPOROvG
         vSApy5uR/HZulTCSqw+lJHJPWP5YkYtLqc+4EJOMGlPkLh2QMzmQLKNuO/Xzo9rHh6uG
         vcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746173050; x=1746777850;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vHvO/Ki8AASIXA/ZkTOmnjaGU42zPy2OR3n8qVU1I8=;
        b=j60l84ONMfBHPj+iyUIMOVoHKs4ejgiwXDOJ6TJwd4M4Z/SXBTVTroEep1ZXGACMbY
         y0zGLnxFP9K2OT+372AjaVd2VrgSVsRlWZcqfkCsYKUUl9CoyZduqxd6Az95LwJ34zv8
         2+s9K0P+74NRWRMa/NIK2DoSViY93jjP3+BWSnNy7ZETsufexxCPtruHuCYM8pgOStEr
         L/0C2vtq7dNu+XzIBzoinZGVMJKfnH+ryfSPuIlnDhosA88c8IcF6u8ru8717PMDkCLB
         uplfJ/TO13i6b7Ru17Qd8B+suDHduo0cXjBdAYWTOgsafiTB6jwlV6nNrx7xsT9upGNU
         Xoyg==
X-Forwarded-Encrypted: i=1; AJvYcCXdvpAHRhNa2IKWMNHFDVYa44sD4DWz1qSh+poYBNLTt42D15Qg20n8Zdzckk/V5X8IM8brYaU7OJY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQK9jhVcq/7et1UC6JyXcO9QYVcEToIu9H6hgR3Fdoj5xPh5y6
	FgToed0BmLHOYn9qL9VcMggWqNb0LRuR7snr6slrUoaQDi5DHOwKOBeIUaSeXA==
X-Gm-Gg: ASbGncvih6/TIQ78PY6+cCJBP3q1vrfBLi56YFN7sPXQcyjFm8KA6I+fSzm5OUA71P/
	RgWCn5uZRrfw8xsHg86f7VOJoRdJsuJfJLdmzAW0ghgd9ia8a13UHcklFhXlR94dBucyD9Zjl31
	lWmWoOhO9wde3cp0RHwuEOnYD0rzBXVPK5ggomLLJ7rbUPfhBK6PDPtdOvbVaF4dX86eUQE3AmT
	Zk5KpFeEu7aAu9du6M/Sq2NeIiQKp51/tHNdfAIdRLezL9S6s6ur4oVQiOKc+Qdp/jYSWXPT2FB
	o+cwDthqiU9wIxNDAeKqnxBOW2O4mVOW3NKLQZuiLHxg1MNPqQlBC3bNTRd3dfEL6ZyB9JMcV3h
	iI3ZjaPRJ1YsvxdcwbPqd+T42Qw==
X-Google-Smtp-Source: AGHT+IFC+vLnT43pAXz4ktb2paUpCH2HYb7YhmMQjAI4SDgeHglfr1O91GBVMG3busT/K9o5wzjYzw==
X-Received: by 2002:a17:907:7b87:b0:ac3:b613:a651 with SMTP id a640c23a62f3a-ad17ad87102mr204990566b.17.1746173050484;
        Fri, 02 May 2025 01:04:10 -0700 (PDT)
Message-ID: <beb23522-cd39-4846-a9ef-a420be557f11@suse.com>
Date: Fri, 2 May 2025 10:04:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vpic: Improve bitops usage
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250501233042.762295-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250501233042.762295-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2025 01:30, Andrew Cooper wrote:
>  * For vpic_get_priority(), introduce a common ror8() helper in plain C.  One
>    thing that I can't persuade the compiler to realise is that a non-zero
>    value rotated is still non-zero, so use __builtin_clz() to help the
>    optimiser out.
> 
>  * vpic_ioport_write() can be simplified to just for_each_set_bit(), which
>    avoids spilling pending to the stack each loop iteration.  Changing pending
>    from unsigned int to uint8_t isn't even strictly necessary given the
>    underlying types of vpic->isr and vpic->irr, but done so clarity.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> One thing I can't seem to avoid is GCC zero extending the result of ror8()
> before passing it to BSF/TZCNT.  Then again, that's very specific to uint8_t,
> and x86's preserving behaviour on byte writes.

It can't know that the upper bits are "don't care" here, related to the aspect
above (it not inferring non-zero of the result of the rotate when the input is
non-zero). And I expect it would be too much of a special case to warrant
getting all of this accounted for, just to remove the zero-ext.

For this specific case we might be able to cheat, but I'm unsure that's worth
it either (and I also haven't tried whether it actually has the intended
effect):

    val8 = ror8(mask, vpic->priority_add);
    asm ( "" : "=r" (val32) : "0" (val8) );
    return __builtin_ctz(val32);

Jan

