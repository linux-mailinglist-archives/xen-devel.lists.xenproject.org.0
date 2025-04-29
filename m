Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA15AA08B8
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 12:37:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971900.1360301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9iKb-0002ae-5d; Tue, 29 Apr 2025 10:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971900.1360301; Tue, 29 Apr 2025 10:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9iKb-0002Ye-2H; Tue, 29 Apr 2025 10:36:53 +0000
Received: by outflank-mailman (input) for mailman id 971900;
 Tue, 29 Apr 2025 10:36:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9iKZ-0002YY-7E
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 10:36:51 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dae86b36-24e5-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 12:36:49 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac2ab99e16eso1261693666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 03:36:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e586bc6sm757305566b.75.2025.04.29.03.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 03:36:48 -0700 (PDT)
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
X-Inumbo-ID: dae86b36-24e5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745923008; x=1746527808; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pEnMhvYC2y5Xde25PeIv/2HXomTWF2wg5hYhKb9897U=;
        b=LLv01DxQG7Kh+QmPz8bR3UkL4pljJbbvo27qh3GoHDsljK43iO1RVevo34ozALvmbd
         aKsagYtWUte1jYetCim2ApjxkL26d5iiDtHM9b9YRlZxTU0bJ+NuN4wdACcyHW5M69LM
         +bNH3g4qncJNPfMig5r3Wp+ZZvjJZeEsmKgtW6Sz3pVbomT6K9fxRujEpds0XSKvztL4
         /l0IaUe6lwk4CSrXnV++NdDPU9/E5Jf+tAIjODp9cN+cFfnkwCtXr4maFcW470nrGGO3
         QLMlI06AQxw409safOXQPchm1mpoSptHPOX0DJTNdoxmbzd4VAKm1S7160blKuKpNi9N
         b3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745923008; x=1746527808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEnMhvYC2y5Xde25PeIv/2HXomTWF2wg5hYhKb9897U=;
        b=EvWQJqJblGL1J/zxIndBUcCLOmY30k0KK6yt0x7mhOEi3RyltMsTs7y/oUjqPUTZWZ
         cQvAgY1ODzI2WOKBb0eK+559A2UEq1Q1ZHdz8vz/c6BluiXGb3JLJsTA6vEy5uXpbEj8
         H05cUIyjGvrkP0K6W0iWKpU5v1ZjKUNf5lgxDoIZHnmyTdZvg8o841t4YeQU9pNosL1m
         pxQthExc3J7qbreybTY1FBwP0Rr4MKmhz1Iz96zz2XtuPmL+dCInAK0av9DMyaoIIA1e
         ZRWSSNbtcJNxKNugI20UKw49bIYmeh/tY3x7Is4czXpFMv9bP4z9V1nfjRTr0ZPIB52H
         xqcA==
X-Forwarded-Encrypted: i=1; AJvYcCVWmSoVjMnMYdN5qE951LEo8hrkaeF9G6OA+NdmF5J36kZ5ZWPLHi/a8XSRbXgz3DKuKDBVG+tJrIM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIxsaW9kn64m7xWUV/mhl3QfiX2K2lE737GOAZg8enumV1rIf1
	1wUWC1wTxXnfhj72rwWCnWCen4lzzW4feqpjSuzcqm/kbNvnDI61ibdn3mS4LS9KDSUzjvWUH8w
	=
X-Gm-Gg: ASbGncuRdfFQbTM6vaKedgrTPAafWGhFL+0/DLssU+OQaOUyGkvGj7yVtY6v6OGc347
	Xh7QWEo48yN7hfs7UFNneS1gYiA1IsECvwvbFmH4r6ktX8VsX1YB2XHEG4GYlkIr3vh7DaSLP0N
	QUztJwTSMVTYVyCIPfz3yfzyR/AteSzhh7H0zTcx042Y1FSdftMIHBUoKY6knaNuSHcHw3hJyuV
	uMjCE9l3MkAOXT/GO8Zk90t9ercMoJaBXIjUbpMKYmPwm9mW7Fx889GIrJbePnLOp5nuuQD2HbF
	nThqD5mfWK45Q5QdNv5NoO1YKUTzozdWKr7VPByNIUZlN1nJ3yWMmdlt/0+/UDyJSjKeb9CwIWu
	gRtsScCrtTikgwbNOeaDzM3+lTA==
X-Google-Smtp-Source: AGHT+IGDV05kPKmwu/NB27C3nS0lvoW7hvVyaDanbyzHMSXdQisx5G0jMELo4unMsZjagCZwPqTZsg==
X-Received: by 2002:a17:907:7b9d:b0:acb:107c:7aed with SMTP id a640c23a62f3a-acec4f812d1mr308691766b.55.1745923008317;
        Tue, 29 Apr 2025 03:36:48 -0700 (PDT)
Message-ID: <2f3702f3-a46b-4161-a890-7aad9bbbcac4@suse.com>
Date: Tue, 29 Apr 2025 12:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-5-Penny.Zheng@amd.com>
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
In-Reply-To: <20250414074056.3696888-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 09:40, Penny Zheng wrote:
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -71,6 +71,49 @@ unsigned int __initdata cpufreq_xen_cnt = 1;
>  
>  static int __init cpufreq_cmdline_parse(const char *s, const char *e);
>  
> +static bool __init cpufreq_opts_contain(enum cpufreq_xen_opt option)
> +{
> +    unsigned int count = cpufreq_xen_cnt;
> +
> +    while ( count )
> +    {
> +        if ( cpufreq_xen_opts[--count] == option )
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
> +static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
> +{
> +    int ret = 0;
> +
> +    if ( cpufreq_opts_contain(option) )
> +    {
> +        const char *cpufreq_opts_str[] = { "CPUFREQ_xen", "CPUFREQ_hwp" };

        const char *const __initconstrel cpufreq_opts_str[] = { "CPUFREQ_xen", "CPUFREQ_hwp" };

(line wrapped suitably, of course) Or maybe even better

        const char __initconst cpufreq_opts_str[][12] = { "CPUFREQ_xen", "CPUFREQ_hwp" };

for the string literals to also end up in .init.rodata.

However, the CPUFREQ_ prefixes want dropping, as they're an internal of the
implementation, and ...

> +
> +        printk(XENLOG_WARNING
> +               "Duplicate cpufreq driver option: %s",
> +               cpufreq_opts_str[option - 1]);

... aren't necessarily meaningful when presented this way to the user; the user
specified "xen" or "hwp", after all.

> +        return 0;
> +    }
> +
> +    cpufreq_controller = FREQCTL_xen;
> +    cpufreq_xen_opts[cpufreq_xen_cnt++] = option;
> +    switch ( option )
> +    {
> +    case CPUFREQ_hwp:
> +    case CPUFREQ_xen:
> +        xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
> +        break;
> +    default:

Blank line please between non-fall-through case blocks.

With all of the adjustments:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

