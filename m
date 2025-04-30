Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C531AA4DF8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 15:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973604.1361689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA7te-0000ws-Tp; Wed, 30 Apr 2025 13:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973604.1361689; Wed, 30 Apr 2025 13:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA7te-0000tk-Qs; Wed, 30 Apr 2025 13:54:46 +0000
Received: by outflank-mailman (input) for mailman id 973604;
 Wed, 30 Apr 2025 13:54:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA7td-0000te-Qb
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 13:54:45 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab84cdf1-25ca-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 15:54:44 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5e5e8274a74so11565303a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 06:54:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f70354635csm8899567a12.49.2025.04.30.06.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 06:54:43 -0700 (PDT)
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
X-Inumbo-ID: ab84cdf1-25ca-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746021283; x=1746626083; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qm5V+Wob99MxsSrvD1n6mOrFTNiwoxMPJz0ngQ0qeU4=;
        b=cUwbkypHQ6twLYqb+3+IA5V8rjz5iM3dtOGES91t/2gcMdPE9g1LNnVRRZ7cTOV30B
         U+xaV3ccCUl0ZFPILuNo0dSI3ZXvRkz2vPp5sFU7O0CaQIkd/X3w3rIx0WfG0A1yO98j
         xhzccJ09v+s/loeqWoRIL7Km+rdRKyW/tCYDtkDrAQ2WXVXJA2i4EXQFjxubySFVLYma
         Z0jcspUmP57KRI+r/MMddeBc/VjU3W79QYF6pTrud5WaUdvoNn1wdqVaiFYlRWIae8zJ
         8UGSjWrjzMtFFMoXiv46kc6vWi+bDrhJNT5tefKH1k8wIBVlV49ijFIgawWY431hFo+e
         CWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746021283; x=1746626083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qm5V+Wob99MxsSrvD1n6mOrFTNiwoxMPJz0ngQ0qeU4=;
        b=oRy7Pff/Sx1MrAkkUmR+pzYBf+bFVX1Vb9BIQ9bOgD3uW3zf0RuxkHOjwl+j9aRpBx
         E0nXdIwGgPdl2SZF//wcurSjoTO1Px9RDEcKDODZ4jwrZcs0IgXec6F8sVRHBPaLERNq
         66TCFwN+9/BMxS8Bep0zIxiqOKvsjK8SXrDoJw2iyU+cAnAkUETAVcBfGqrkXjAub56E
         KKg1fOyCSAfzKp3V8XFaPMZH/T8G0QESG5gNBX1PSoOTtnjwD3NipX0rmQstT3jRlt7V
         W1Up+SflwEQzzbRdnNA9tIqfxwN+kkL83JegROLAaj6ZSIQy/R1UE9gg4aBH8q6FBNIg
         WegA==
X-Forwarded-Encrypted: i=1; AJvYcCXEYvJDN9A9y27GuWbOWIxjffl2a+lWWXzZ3pDz2GqgYEl0voeI5iS6ilFup5hap7W8FGeWNnwH0jk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7Fv40O5x0k84nBvAZRch5WD6mG3cbfMzPP7GPbuUe6fJ1r8gh
	3eOeDvKMMykGZrYofe9plauuUEnUYEzR8VdpjwNN8rKahIAHPgeBvr2izEAjwQ==
X-Gm-Gg: ASbGncuny/vzWRRS2/PhMATZJX70SNMOSMRc8pdmpt0MJEs/QtcVFCIzO7xA3ehfa0c
	6D5tBWoy1wgdygcQZvqOjYYXujf8UxV9bSduhTkZXW92N2W75ObHk1NyUxZH3aL/CrQCggmqyZE
	25wmgahbnIhDmeiC4seED1bJCfZ293OV5nKblKj/E8cYqR4Xr+uomcot/uf4P7azZU3KfMLNJ/y
	mv672ZWXIYXcmao9MiK5I2IOE+uSllN5TDAS8PxRvIQBxjcgH5h8McC9vwGb5FOE4pHk17VlT+d
	u8k0YNfZOzTTEO3r0j+jBAsLGwVZoDiUKm2OQoHBpStLxNKmzKB7DxTrNy1xxHxZNJ/Of8ZeDMJ
	ASskeQm4imQZTxOC+09jsEmsFyQ==
X-Google-Smtp-Source: AGHT+IFVR9ZP6CqWaG6On9gxxKoBFXs6DQAtdRRmaOtCqjeplVQkWICoQUppOpA4RLS9xGEzANl5dQ==
X-Received: by 2002:a17:907:6089:b0:ac3:8d34:1d73 with SMTP id a640c23a62f3a-acee215d48bmr244014666b.8.1746021283509;
        Wed, 30 Apr 2025 06:54:43 -0700 (PDT)
Message-ID: <63b3b016-551c-4201-a3b3-db19b27ea649@suse.com>
Date: Wed, 30 Apr 2025 15:54:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] tools/xenpm: Print CPPC parameters for amd-cppc
 driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-13-Penny.Zheng@amd.com>
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
In-Reply-To: <20250414074056.3696888-13-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 09:40, Penny Zheng wrote:
> HWP, amd-cppc, amd-cppc-epp are all the implementation
> of ACPI CPPC (Collaborative Processor Performace Control),
> so we introduce cppc_mode flag to print CPPC-related para.
> 
> And HWP and amd-cppc-epp are both governor-less driver,
> so we introduce hw_auto flag to bypass governor-related print.

But in the EPP driver you use the information which governor is active.

> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -790,9 +790,18 @@ static unsigned int calculate_activity_window(const xc_cppc_para_t *cppc,
>  /* print out parameters about cpu frequency */
>  static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>  {
> -    bool hwp = strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) == 0;
> +    bool cppc_mode = false, hw_auto = false;
>      int i;
>  
> +    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
> +         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_DRIVER_NAME) ||
> +         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME) )
> +        cppc_mode = true;
> +
> +    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
> +         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME) )
> +        hw_auto = true;

Please avoid doing the same strcmp()s twice. There are several ways how to, so
I'm not going to make a particular suggestion.

> @@ -800,7 +809,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>          printf(" %d", p_cpufreq->affected_cpus[i]);
>      printf("\n");
>  
> -    if ( hwp )
> +    if ( hw_auto )
>          printf("cpuinfo frequency    : base [%"PRIu32"] max [%"PRIu32"]\n",
>                 p_cpufreq->cpuinfo_min_freq,
>                 p_cpufreq->cpuinfo_max_freq);
> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -201,7 +201,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      pmpt = processor_pminfo[op->cpuid];
>      policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
>  
> -    if ( !pmpt || !pmpt->perf.states ||
> +    if ( !pmpt || ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||
>           !policy || !policy->governor )
>          return -EINVAL;

This looks questionable all on its own. Where is it that ->perf.states allocation
is being avoided? I first thought it might be patch 06 which is related, but that
doesn't look to be it. In any event further down from here there is

    for ( i = 0; i < op->u.get_para.freq_num; i++ )
        data[i] = pmpt->perf.states[i].core_frequency * 1000;

i.e. an access to the array solely based on hypercall input.

Both this and ...

> @@ -461,9 +461,10 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
>      switch ( op->cmd & PM_PARA_CATEGORY_MASK )
>      {
>      case CPUFREQ_PARA:
> -        if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
> +        if ( !(xen_processor_pmbits & (XEN_PROCESSOR_PM_PX |
> +                                       XEN_PROCESSOR_PM_CPPC)) )
>              return -ENODEV;
> -        if ( !pmpt || !(pmpt->init & XEN_PX_INIT) )
> +        if ( !pmpt || !(pmpt->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
>              return -EINVAL;
>          break;
>      }

... this hunk also look as if they would belong (partly?) in maybe patch 03?
Even more so as per the title this is solely a tool stack (xenpm) change.

Jan

