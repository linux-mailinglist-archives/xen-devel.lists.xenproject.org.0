Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795F7AA4E3C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 16:16:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973616.1361698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA8EH-00040q-IH; Wed, 30 Apr 2025 14:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973616.1361698; Wed, 30 Apr 2025 14:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA8EH-0003zN-FO; Wed, 30 Apr 2025 14:16:05 +0000
Received: by outflank-mailman (input) for mailman id 973616;
 Wed, 30 Apr 2025 14:16:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA8EF-0003zH-LN
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 14:16:03 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4c56165-25cd-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 16:16:01 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5f4d28d9fd8so9238727a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 07:16:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7035464f1sm8738257a12.62.2025.04.30.07.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 07:16:00 -0700 (PDT)
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
X-Inumbo-ID: a4c56165-25cd-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746022561; x=1746627361; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+9BRMKSY9c/7zbzbkB40d8yjlwDDdMMZTClJe2wodQI=;
        b=STvw3+fx97tth4WdmbeTIXItLCszLyICqBjxTHMbtyMb77203dR3nC2VDad9f9s5GK
         Q//RH7QZBw1vZO5iWi0jduvkxRyWLoJak14cw59JVwvXPFHcdISoLXKNlXnuvMUJhg+W
         nZWI/cuXSotBbi0alpKJr6VAOBuRzSVIsOJ86oNF4T2FgkuH5lty47plPylTs6mL7gO+
         VCLwnt8Su+YQghuab3/0woc5YPTpClGl566fz4Xy7DUCD8x33S6RmxgLGyJvl0K3KsdC
         vbDbT8T1RKonk+foiHkjinIzKb8FWYrFfKhDkLsZ0gAN6qGQC2sEvDAd49jlb2Vd33fB
         BB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746022561; x=1746627361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9BRMKSY9c/7zbzbkB40d8yjlwDDdMMZTClJe2wodQI=;
        b=aOCjdsT66ZEHSzjUP+NfN/ggI+n2gmKoe+GRxDk7/YwRyS7Ciyd88VZBTLGlVhgb2C
         9Tdfl98qc48E1heQGrEAdE8ZBjl2T5AsmkUDVFwDRpb3J5aRnUYRwXYhLEAnA/m/GhjJ
         aR4lgG3m+MEsztGf6PiHZi517BgKXT5eb0/+o4/6s4elnk2uRX0Is/qzIg6F9iRzAK18
         htMzE9YKlDS/bQl3ppVtjgiV0oTtcBecBqnZlaM6eaXK7tU30ofHLD+bif/QvSlwYY3W
         HgFa58Bgx+dTIvEUg5llqy+w/UFfr6xLx4ZwgQFNEa/U8O8IgVSMlruxW2HN+f75g/2R
         AtXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe7W8xwJ5K6xBAOewdXXfWZRLBZqPchHxQhlB13NyIlauS5bMkutx1ej7Sq9V8V9oOPZzYHK+1dNk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWNw64Sn246ya0+qEOrItBb05wL6rqEu15AcukTrmB0AaZjElf
	yz2I9ZvBoZuGc/RWcZF7w89+pWewPI+tiGUGH+4dUmNVI1XXI5eGfksodiRxMA==
X-Gm-Gg: ASbGncvgjNjcNantCkDsucUFUpu103Y+exwiV9UC/dATgVW1omIFm9Fu3GbwoD9gZiu
	m7sOxGy6Pz3qI3Fvg6qiYMn9ZXuD+/PZinFXgab3qSkNdPveJTIqD9Sq5P19ndA8aTuTkoV+Ffs
	6kwNIFOw133XMKjfghKOX25jrvikNIfNfM6oqf5196tYMCCxlgJGxjNx1+c7Uhw1hk9q3iDhzmX
	TX0XH96Zp/mUSiSd1NzgXdWK22OYNBdWjtnYQhVnZIkTwX+kw5Cdd0AL3OBPv7+ePoyHBWjwl5f
	ViylowZn4h+8T2VHd8unfrSQeQYgCZJYxBt5Oowx7KfyjEwaSKMWkQHvDdOw/0XzpW+dRBxGm+A
	2cT/80wNTVUZHljeGPiRgivOgkScdGrf0gsjP
X-Google-Smtp-Source: AGHT+IFw73xQ7w4aVKCar5oYZ6fdYM2vRGUxG6sEgUyC0yEUF124bYzFwAbXeLb0muZcOYVJ/KoXjg==
X-Received: by 2002:a05:6402:3494:b0:5e5:b53:fd49 with SMTP id 4fb4d7f45d1cf-5f8aef17766mr2826691a12.3.1746022560666;
        Wed, 30 Apr 2025 07:16:00 -0700 (PDT)
Message-ID: <3932f6de-ea67-4cc4-95cd-a1b31b342505@suse.com>
Date: Wed, 30 Apr 2025 16:15:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] tools/xenpm: fix unnecessary
 scaling_available_frequencies in CPPC mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-14-Penny.Zheng@amd.com>
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
In-Reply-To: <20250414074056.3696888-14-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 09:40, Penny Zheng wrote:
> In `xenpm get-cpufreq-para <cpuid>`, para scaling_available_frequencies
> only has meaningful value when cpufreq driver in legacy P-states mode.
> 
> So we drop the "has_num" condition check, and mirror the ->gov_num check for
> both ->freq_num and ->cpu_num in xc_get_cpufreq_para().
> In get_cpufreq_para(), add "freq_num" check to avoid copying data to
> op->u.get_para.scaling_available_frequencies in CPPC mode.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

The description doesn't clarify where the bug is that's being fixed (from
the word "fix" in the subject). If there was one, surely there would also
want to be a Fixes: tag.

> ---
>  tools/libs/ctrl/xc_pm.c   | 45 +++++++++++++++++++++------------------
>  xen/drivers/acpi/pmstat.c | 11 ++++++----
>  2 files changed, 31 insertions(+), 25 deletions(-)

xenpm is entirely untouched, unlike suggested by the subject prefix.

> --- a/tools/libs/ctrl/xc_pm.c
> +++ b/tools/libs/ctrl/xc_pm.c
> @@ -212,34 +212,39 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
>      DECLARE_NAMED_HYPERCALL_BOUNCE(scaling_available_governors,
>  			 user_para->scaling_available_governors,
>  			 user_para->gov_num * CPUFREQ_NAME_LEN * sizeof(char), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
> -    bool has_num = user_para->cpu_num && user_para->freq_num;
>  
> -    if ( has_num )
> +    if ( (user_para->cpu_num && !user_para->affected_cpus) ||
> +         (user_para->freq_num && !user_para->scaling_available_frequencies) ||
> +         (user_para->gov_num && !user_para->scaling_available_governors) )
> +    {
> +        errno = EINVAL;
> +        return -1;
> +    }
> +    if ( user_para->cpu_num )
>      {
> -        if ( (!user_para->affected_cpus)                    ||
> -             (!user_para->scaling_available_frequencies)    ||
> -             (user_para->gov_num && !user_para->scaling_available_governors) )
> -        {
> -            errno = EINVAL;
> -            return -1;
> -        }
>          ret = xc_hypercall_bounce_pre(xch, affected_cpus);
>          if ( ret )
>              return ret;
> +    }
> +    if ( user_para->freq_num )
> +    {
>          ret = xc_hypercall_bounce_pre(xch, scaling_available_frequencies);
>          if ( ret )
>              goto unlock_2;
> -        if ( user_para->gov_num )
> -            ret = xc_hypercall_bounce_pre(xch, scaling_available_governors);
> -        if ( ret )
> -            goto unlock_3;
> +    }
> +    if ( user_para->gov_num )
> +        ret = xc_hypercall_bounce_pre(xch, scaling_available_governors);
> +    if ( ret )
> +        goto unlock_3;

Yes, ret is initialized to 0, so functionally this is okay. But can we please
have all three pieces be as similar as possible, to make apparent that they're
_expected_ to be similar?

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -228,10 +228,13 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      ret = copy_to_guest(op->u.get_para.affected_cpus,
>                          data, op->u.get_para.cpu_num);
>  
> -    for ( i = 0; i < op->u.get_para.freq_num; i++ )
> -        data[i] = pmpt->perf.states[i].core_frequency * 1000;
> -    ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
> -                         data, op->u.get_para.freq_num);
> +    if ( op->u.get_para.freq_num )
> +    {
> +        for ( i = 0; i < op->u.get_para.freq_num; i++ )
> +            data[i] = pmpt->perf.states[i].core_frequency * 1000;
> +        ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
> +                             data, op->u.get_para.freq_num);
> +    }

What's the effect of this change? Without it, the loop will simply have zero
iterations, and zero items will be copied to the guest. (As with the previous
patch, this would better be a tools-only one anyway.)

Else the question would be why the same isn't done for cpu_num, which is
becoming optional now, too (according to the libxc change).

Jan

