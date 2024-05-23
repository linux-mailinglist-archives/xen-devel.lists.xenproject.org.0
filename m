Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B2B8CD789
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 17:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728706.1133727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAAcd-0006Hd-Hh; Thu, 23 May 2024 15:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728706.1133727; Thu, 23 May 2024 15:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAAcd-0006FI-EZ; Thu, 23 May 2024 15:44:51 +0000
Received: by outflank-mailman (input) for mailman id 728706;
 Thu, 23 May 2024 15:44:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sAAcb-0006F7-OA
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 15:44:49 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6257fe40-191b-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 17:44:48 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56e47843cc7so11032856a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 08:44:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a615e5c1a3asm630681466b.71.2024.05.23.08.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 08:44:47 -0700 (PDT)
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
X-Inumbo-ID: 6257fe40-191b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716479087; x=1717083887; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LuimNe0L2wEtC6DnemaR8lXlDcRoIQwC7UQakkWNGXc=;
        b=WeZHSVhbqTI1w3FrgtM5yicqy8CmB/KLXZMdBpu4k62+f8/RBJPpVwcn7yJ0Uzz7+8
         1dMvxed+bRm3v7CPhwsSwPnfyvPHGSEn9oCNLFY/4/xtdJPS4JLq18+P0fPgrPg9oDjm
         S+G8YQ9gr+TQQX+OiA1HTkbKvcAsXeiKQjaCsI1B6pV1/5q8DQgsfiW2R4v+ktwD9fap
         HD8XT2ZANDBP3wQvGuCJ99qNJcbMPkTDqtq8g0JwYk6ymg5K1y3VKJ+LS3qNcaaGmtZz
         h5btc45hbERljRydZ3FexqE5MARiRaSdt8Aa2PtUUsc+bwvHY3Td8sQi6o12gUaTk9kf
         Mzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716479087; x=1717083887;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LuimNe0L2wEtC6DnemaR8lXlDcRoIQwC7UQakkWNGXc=;
        b=m1DJzwrE8Q2H35t3SleZ7+7j/VgUAnchQO3gTw2gyzlmukoElBVvRb/SjqhS8XCiUH
         C4BvY45/sYAG1Y0oIxYuwM6xEdZxCEJd56ejfCpstRpQ4kyxed5yTZYCKmchRn3ePWCa
         8gSyEg1RZEuHtgYMNS4WFyTBoj0XOVusXGEY2N//I/QhEAcHakRlD6MfyabNTHzPPjHv
         LvarIxcEQnsreGa+pimPQHxdsvFX5ptnRkaGYdxNop1NcpPWzby+fOzYIYsxLJJhXI5o
         sE+9tGrP3V3Z5YO4Q+zrijpSRfCP6yhhjqPCpwwSnf1letdkY3Pb1uo+wUniRY6j7qqJ
         YpSA==
X-Forwarded-Encrypted: i=1; AJvYcCV/Or2XGr4r8uLZD1jXF8HFdCLU/RyVhJbDl0I9uG+IYHqfMXzaw/sYQzHUVwlnDLwrgLAbayPjmVLqax/zfnyyeKkGfBfT4yzQpM2ytFg=
X-Gm-Message-State: AOJu0YzapMqmtWNwp0auAPSw8mYr8xLOjBc63Kgkl4wz0QiFuV6oY3PA
	CtF5174y6Qh+KNhyu88HwuJMqaRkCEuw0gVtlFJS5oYuePtcojbmwC7tCkcjyQ==
X-Google-Smtp-Source: AGHT+IFB2SBLDetBouZHJ46cqlSVTXJDHrktJzbVBFe1TjHnRvKmlUzY34Jns4B/klBk+YuBDYCWjg==
X-Received: by 2002:a17:906:b6d3:b0:a59:aae5:5840 with SMTP id a640c23a62f3a-a622818fd7cmr344324766b.75.1716479087434;
        Thu, 23 May 2024 08:44:47 -0700 (PDT)
Message-ID: <8245f0ce-2964-4ecb-a31d-3e182a6d3e0b@suse.com>
Date: Thu, 23 May 2024 17:44:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] x86/boot: Collect the Raw CPU Policy earlier on boot
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
 <20240523111627.28896-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240523111627.28896-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.05.2024 13:16, Andrew Cooper wrote:
> This is a tangle, but it's a small step in the right direction.
> 
> xstate_init() is shortly going to want data from the Raw policy.
> calculate_raw_cpu_policy() is sufficiently separate from the other policies to
> be safe to do.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Would you mind taking a look at
https://lists.xen.org/archives/html/xen-devel/2021-04/msg01335.html
to make clear (to me at least) in how far we can perhaps find common grounds
on what wants doing when? (Of course the local version I have has been
constantly re-based, so some of the function names would have changed from
what's visible there.)

> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -845,7 +845,6 @@ static void __init calculate_hvm_def_policy(void)
>  
>  void __init init_guest_cpu_policies(void)
>  {
> -    calculate_raw_cpu_policy();
>      calculate_host_policy();
>  
>      if ( IS_ENABLED(CONFIG_PV) )
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1888,7 +1888,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>  
>      tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
>  
> -    identify_cpu(&boot_cpu_data);
> +    calculate_raw_cpu_policy(); /* Needs microcode.  No other dependenices. */
> +
> +    identify_cpu(&boot_cpu_data); /* Needs microcode and raw policy. */

You don't introduce any dependency on raw policy here, and there cannot possibly
have been such a dependency before (unless there was a bug somewhere). Therefore
I consider this latter comment misleading at this point.

Jan

