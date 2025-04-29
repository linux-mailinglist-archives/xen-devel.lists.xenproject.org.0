Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5272AA0A75
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 13:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972097.1360524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jQW-00050I-0J; Tue, 29 Apr 2025 11:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972097.1360524; Tue, 29 Apr 2025 11:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jQV-0004yq-Th; Tue, 29 Apr 2025 11:47:03 +0000
Received: by outflank-mailman (input) for mailman id 972097;
 Tue, 29 Apr 2025 11:47:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9jQU-0004yk-AH
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 11:47:02 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9a8d631-24ef-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 13:47:01 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5eb92df4fcbso11417746a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 04:47:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7016f6418sm7514894a12.40.2025.04.29.04.46.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 04:46:59 -0700 (PDT)
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
X-Inumbo-ID: a9a8d631-24ef-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745927221; x=1746532021; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tc+niupRHkYFRLjY4KEJGAyJRfidDOGzQCo0i8IsPs8=;
        b=bztqOMrg2z/hGEIDfXNNZBh2FM5teKiFVw4q6ybQPgH/KvMMcf4YevW8pOLabZJuEC
         KKU0zgPrjhZi3gXgz8tVQxSyL4K8/RnndLijVC9bgP+QLW/RYHfNcxvibZUQa56gPrPn
         kzfTLY6BdBtACTjhHV8OapHVIKIa0YdT8ZcAtXTBaeUtWQh1Hb3eKBn1Q6ZlKM3xiSfN
         edZ40JchMiv4Iy1Zo5/UEG4t+tkNjPPu3mitBpVb60SDVwz9qhvdUMM0WQ+THD+3GB7V
         ONF/hUfnMMwN8ipxVbb6qiXk9XtJE23r5tCj7moSScD/eEqhkb/tBvsPAbCyKTwQBuIq
         WO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745927221; x=1746532021;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tc+niupRHkYFRLjY4KEJGAyJRfidDOGzQCo0i8IsPs8=;
        b=NHoCnPljEK2q+s+pw+ErjWisSf950WX1QPno0BkG9ev4im3blul1C+G+xF5CtARnGt
         HkU/Fj/pvpgBqj5qdT9c7x7URfX23FN8gUhm4SHmujNQPaDMGHj76pHqgLBlMnHWqLLp
         0sorGjMp/9BJnbMTpbiJO6wqI/g+7iQGsj9uGljqLlOMspGF45jqp0FY2BzEsFi4XFGJ
         nrVufVWOdcrs2zbctr1G8oBVbcI+kD+7anxDo/rhS4ZxUjoF7IEYo1RL4vUn7csaQjrt
         VEOs8jNWOq2fyj/yFxLDeqDYLuUlXWaytxno94Er06pMhaymc/GYiMBXPYd86YF4NUXL
         v8Fw==
X-Forwarded-Encrypted: i=1; AJvYcCW8lkFDJBLdgUP7SM797rAF4FTY77/O9HeJBoTKGA7SbhqYl2WvplrWGWf5yyf7rcaomcNBd15fj9M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0hqamyyGMLVAu+WFJQ3PVXJWQlQFdGPPWe7Enu7Ma+Ba/AAB2
	LSNZBsd14hq1JFyqgHDgyW6EMhjaaZLVxycypDQA+zdBO2t/I29005T0OYool4hpGmzKUctprjw
	=
X-Gm-Gg: ASbGncsQXp+158ZJyNISeTBvFe3KNnYBmWkIhFzC/z3xy0FWa/E/BREUMDo9udfxtQ3
	+fkmqnmzICg4NsbBnq76JZDOs2H4efUuE8c+NwIVeAPbt1BNPwSHt/3dk1sK8jnGEYzg8R42oUV
	/sPCpm1DCrXlCHofnw+owfUONahujeedjYDnbZD4XobL2PlzMlXoHLTMR+LjoIhqPc/9QQNhXZv
	7txp4tLhE2sN4+gD3JmdMoKvIxzpbVxCzw5WBfwGNInSwjkxf53rV03cNlbX0RBBS9KC0fFj7uI
	v+EGc/cbvPdJ3gAC3N8bsvEw828Ew2rpob7Tg5vWEtVtOTEXZJjw+Y2uqOel/gbnLW+WSx7a/54
	EZyUaZFuUv90CofliY+TkVTukubEAbLErgYHF
X-Google-Smtp-Source: AGHT+IGRfiXaviz9ArCc8fV4o6SpRwL+1USsfAhxUjEPdM6Pi8JSijTRhDx0RpNBe2qXBJhl45VUow==
X-Received: by 2002:a05:6402:1ed2:b0:5f6:23b1:ab4b with SMTP id 4fb4d7f45d1cf-5f73984e636mr10874611a12.30.1745927219822;
        Tue, 29 Apr 2025 04:46:59 -0700 (PDT)
Message-ID: <889d2b2b-db42-43d2-9da0-dcd130d64d9c@suse.com>
Date: Tue, 29 Apr 2025 13:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
From: Jan Beulich <jbeulich@suse.com>
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-5-Penny.Zheng@amd.com>
 <2f3702f3-a46b-4161-a890-7aad9bbbcac4@suse.com>
Content-Language: en-US
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
In-Reply-To: <2f3702f3-a46b-4161-a890-7aad9bbbcac4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2025 12:36, Jan Beulich wrote:
> On 14.04.2025 09:40, Penny Zheng wrote:
>> --- a/xen/drivers/cpufreq/cpufreq.c
>> +++ b/xen/drivers/cpufreq/cpufreq.c
>> @@ -71,6 +71,49 @@ unsigned int __initdata cpufreq_xen_cnt = 1;
>>  
>>  static int __init cpufreq_cmdline_parse(const char *s, const char *e);
>>  
>> +static bool __init cpufreq_opts_contain(enum cpufreq_xen_opt option)
>> +{
>> +    unsigned int count = cpufreq_xen_cnt;
>> +
>> +    while ( count )
>> +    {
>> +        if ( cpufreq_xen_opts[--count] == option )
>> +            return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
>> +{
>> +    int ret = 0;
>> +
>> +    if ( cpufreq_opts_contain(option) )
>> +    {
>> +        const char *cpufreq_opts_str[] = { "CPUFREQ_xen", "CPUFREQ_hwp" };
> 
>         const char *const __initconstrel cpufreq_opts_str[] = { "CPUFREQ_xen", "CPUFREQ_hwp" };
> 
> (line wrapped suitably, of course) Or maybe even better
> 
>         const char __initconst cpufreq_opts_str[][12] = { "CPUFREQ_xen", "CPUFREQ_hwp" };
> 
> for the string literals to also end up in .init.rodata.

Actually, it didn't even occur to me that there might be a "static" missing
here, too. Plus I'm missing any arrangement for the array slots to remain in
sync with the corresponding enumerators. With that ...

> With all of the adjustments:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'm sorry, but I need to take this back. There are just too many issues.

Jan

