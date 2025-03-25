Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334F9A6F229
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 12:26:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926353.1329201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2QH-0004lb-8X; Tue, 25 Mar 2025 11:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926353.1329201; Tue, 25 Mar 2025 11:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2QH-0004iV-5r; Tue, 25 Mar 2025 11:26:21 +0000
Received: by outflank-mailman (input) for mailman id 926353;
 Tue, 25 Mar 2025 11:26:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx2QG-0004iP-Id
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 11:26:20 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f44d544d-096b-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 12:26:11 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-390f5f48eafso3013786f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 04:26:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a6326sm13182295f8f.29.2025.03.25.04.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 04:26:10 -0700 (PDT)
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
X-Inumbo-ID: f44d544d-096b-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742901971; x=1743506771; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3n/0A6DHe08JAM+YkjkdZ4ppo385+DzHaRomhH8+NBc=;
        b=eiM1Yg9bGRQBKHtvuZsnTfhyVndOJaTu35D4pwESrHyMQwFPNpOaHZY6kLNmTPpCOL
         W7ZaUfpErdDccv0xnUrD+qv3nc8ua41IQuarw9Z3fJGf8iA23bE43KUAdQ/YFJiIbHr7
         55z9w1san9f0pi4LA315S92GYckLx5IvEDw71ekO9RxhdJAgXeLTQsd8EmMEaWQUrFKz
         1N85xcCZPIxiDlIxyhy0T0DcyE3JBx5r4obfTZtWMSGw+bc3qplCsopIX4swK/57Omwh
         zK1rA2PkznXvV8r69XDTsCPdkCi2LU+CcJyOaJkTvEDVP/etkGbqQHk13Z71f9r2XEHB
         2K6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742901971; x=1743506771;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3n/0A6DHe08JAM+YkjkdZ4ppo385+DzHaRomhH8+NBc=;
        b=IxYjLjkqnpBqSiaKQJVkZdGu5uHHO4niGFo2vB2xdtNG9q6z7NpYO4TxN1DfdvSGOJ
         cPdSUUOM1FIZe3wvQlEgNliMokiIbZcHGxV+Jns4v96rOsn86auqLPCAHIntFi/EXPtZ
         Kcls2TG6AwyhuTxxiodxFRG+1sxXHijmUvDaJIv3C8ZJchpRKQSF8qqzw9pz6C63HnGl
         xSKPszJnVws1FYBBe5R1h6VIAYhn9PtnW5l1pJ5ZM66esl0dmkzdIzb/FkMBkeZLl5if
         NGC/pdLB5B2uC4nL3yeF4KUdXIIesGxz9L+WntC3RirGN9OTHJWLK6V8UEvEzMfvWlsL
         FKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNjo1txhkrb2cksgtxhGq2zr0EQirkeEa/32qKADKOEzmPxD8wE3DaH6J+LP+7OEA37XMwuMeoi1E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVqstcz8dtijwNMCA48/2D5/E+uj7p0ABC9JGejEr+47yvCHkN
	mkWRu6S6L+J3vRmXdxOngt6JOs+s3JtDpUf3A/LZxoJEhN4Sn3BZbrynqldwooyMvyOioKOETo8
	=
X-Gm-Gg: ASbGncu1M2pxAgEXSbCJ6W0c/tpI19dEMsxesEtZPqr0+sQQB8gSIurFAyrMvrJDDbN
	MIqY52+BBd1EliDVdKJWYbg6hTjiow/Rd50qBL+gYVQFnm2hrnqzSsfOxGYBHKoBG0T8ApMIxMj
	K5NYvFsRcNhfNs024V4KRbEfk41CHC4+3ICeXGZ1iGwDJ6l2eoD+4HGC2W+U64yxM73EO9y9LW8
	6XHaU7wv6DbLsHLX0pEwWFwlLj5/2Xv6O0VKm5Mi8Y5N5fFQaX4a5dt4DteDS27hh/HGqoV6SOc
	GSH1uFoQ9sLwhfiW+EiMAVaTf4LstycxZJyitXppiE9mrodqnJB1zKNjQSYNPCennrCTjviaPWe
	Bi50uTTg2BH7zZvUT3sEJpfoRfG0V4A==
X-Google-Smtp-Source: AGHT+IG7ziVF0+CB0kmm2k4CJ+f0QJ2nxbB/GX8MakcNMgc+eBb0lUIumqzeJR3XOwp99Jfk9ldO5g==
X-Received: by 2002:a5d:648b:0:b0:391:4763:2a with SMTP id ffacd0b85a97d-3997f937afbmr15822151f8f.47.1742901970783;
        Tue, 25 Mar 2025 04:26:10 -0700 (PDT)
Message-ID: <6f5a81d7-c650-46d2-b667-6b7c3bc54c41@suse.com>
Date: Tue, 25 Mar 2025 12:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] xen/xenpm: Adapt cpu frequency monitor in xenpm
To: Penny Zheng <Penny.Zheng@amd.com>, Jason Andryuk <jandryuk@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: ray.huang@amd.com, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-15-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306083949.1503385-15-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 09:39, Penny Zheng wrote:
> Make `xenpm get-cpureq-para/set-cpufreq-para` available in CPPC mode.
> --- a/tools/libs/ctrl/xc_pm.c
> +++ b/tools/libs/ctrl/xc_pm.c
> @@ -214,13 +214,12 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
>  			 user_para->gov_num * CPUFREQ_NAME_LEN * sizeof(char), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
>  
>      bool has_num = user_para->cpu_num &&
> -                     user_para->freq_num &&
>                       user_para->gov_num;
>  
>      if ( has_num )

Something looks wrong here already before your patch: With how has_num is set
and with this conditional, ...

>      {
>          if ( (!user_para->affected_cpus)                    ||
> -             (!user_para->scaling_available_frequencies)    ||
> +             (user_para->freq_num && !user_para->scaling_available_frequencies)    ||
>               (user_para->gov_num && !user_para->scaling_available_governors) )

... this ->gov_num check, ...

>          {
>              errno = EINVAL;
> @@ -228,14 +227,16 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
>          }
>          if ( xc_hypercall_bounce_pre(xch, affected_cpus) )
>              goto unlock_1;
> -        if ( xc_hypercall_bounce_pre(xch, scaling_available_frequencies) )
> +        if ( user_para->freq_num &&
> +             xc_hypercall_bounce_pre(xch, scaling_available_frequencies) )
>              goto unlock_2;
>          if ( user_para->gov_num &&

... this one, and ...

>               xc_hypercall_bounce_pre(xch, scaling_available_governors) )
>              goto unlock_3;
>  
>          set_xen_guest_handle(sys_para->affected_cpus, affected_cpus);
> -        set_xen_guest_handle(sys_para->scaling_available_frequencies, scaling_available_frequencies);
> +        if ( user_para->freq_num )
> +            set_xen_guest_handle(sys_para->scaling_available_frequencies, scaling_available_frequencies);

(Nit: Yet another overly long line. It was too long already before, yes, but
 that's no excuse to make it even longer.  The more that there is better
 formatting right in context below.)

>          if ( user_para->gov_num )

... this one are all dead code. Jason? I expect the has_num variable simply
wants dropping altogether, thus correcting the earlier anomaly and getting
the intended new behavior at the same time.

>              set_xen_guest_handle(sys_para->scaling_available_governors,
>                                   scaling_available_governors);

This is the piece of context I'm referring to in the nit above.

> @@ -301,7 +302,8 @@ unlock_4:
>      if ( user_para->gov_num )
>          xc_hypercall_bounce_post(xch, scaling_available_governors);
>  unlock_3:
> -    xc_hypercall_bounce_post(xch, scaling_available_frequencies);
> +    if ( user_para->freq_num )
> +        xc_hypercall_bounce_post(xch, scaling_available_frequencies);
>  unlock_2:
>      xc_hypercall_bounce_post(xch, affected_cpus);
>  unlock_1:

I'm also puzzled by the function's inconsistent return value - Anthony,
can you explain / spot why things are the way they are?

> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -539,7 +539,7 @@ static void signal_int_handler(int signo)
>                          res / 1000000UL, 100UL * res / (double)sum_px[i]);
>              }
>          }
> -        if ( px_cap && avgfreq[i] )
> +        if ( avgfreq[i] )
>              printf("  Avg freq\t%d\tKHz\n", avgfreq[i]);
>      }

I wonder whether this shouldn't be an independent change (which then
could go in rather sooner).

> @@ -926,7 +926,8 @@ static int show_cpufreq_para_by_cpuid(xc_interface *xc_handle, int cpuid)
>              ret = -ENOMEM;
>              goto out;
>          }
> -        if (!(p_cpufreq->scaling_available_frequencies =
> +        if (p_cpufreq->freq_num &&
> +            !(p_cpufreq->scaling_available_frequencies =
>                malloc(p_cpufreq->freq_num * sizeof(uint32_t))))
>          {
>              fprintf(stderr,

Can someone explain to me how the pre-existing logic here works? All
three ->*_num start out as zero. Hence respective allocations (of zero
size) may conceivably return NULL (the behavior there is implementation
defined after all). Yet then we'd bail from the loop, and hence from the
function. IOW adding a ->freq_num check and also a ->cpu_num one (along
with the ->gov_num one that apparently was added during HWP development)
would once again look like an independent (latent) bugfix to me.

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -202,7 +202,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      pmpt = processor_pminfo[op->cpuid];
>      policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
>  
> -    if ( !pmpt || !pmpt->perf.states ||
> +    if ( !pmpt || ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||
>           !policy || !policy->governor )
>          return -EINVAL;

Wouldn't this change better belong in the earlier patch, where the code
in context of the last hunk below was adjusted?

> @@ -229,17 +229,20 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      if ( ret )
>          return ret;
>  
> -    if ( !(scaling_available_frequencies =
> -           xzalloc_array(uint32_t, op->u.get_para.freq_num)) )
> -        return -ENOMEM;
> -    for ( i = 0; i < op->u.get_para.freq_num; i++ )
> -        scaling_available_frequencies[i] =
> -                        pmpt->perf.states[i].core_frequency * 1000;
> -    ret = copy_to_guest(op->u.get_para.scaling_available_frequencies,
> -                   scaling_available_frequencies, op->u.get_para.freq_num);
> -    xfree(scaling_available_frequencies);
> -    if ( ret )
> -        return ret;
> +    if ( op->u.get_para.freq_num )
> +    {
> +        if ( !(scaling_available_frequencies =
> +               xzalloc_array(uint32_t, op->u.get_para.freq_num)) )
> +            return -ENOMEM;
> +        for ( i = 0; i < op->u.get_para.freq_num; i++ )
> +            scaling_available_frequencies[i] =
> +                            pmpt->perf.states[i].core_frequency * 1000;

Nit: Indentation was bogus here and ...

> +        ret = copy_to_guest(op->u.get_para.scaling_available_frequencies,
> +                    scaling_available_frequencies, op->u.get_para.freq_num);

... here before, and sadly continues to be bogus now.

> +        xfree(scaling_available_frequencies);
> +        if ( ret )
> +            return ret;
> +    }

While (beyond the nit above) I'm okay with this simple change, I think the
code here would benefit from folding the two allocations into one. There
simply is no reason to pay the price of the allocation overhead twice, when
we need a uint32_t[max(.cpu_num, .freq_num)] array anyway. That way the
churn introduced here would then also be smaller.

> @@ -465,7 +468,8 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
>      switch ( op->cmd & PM_PARA_CATEGORY_MASK )
>      {
>      case CPUFREQ_PARA:
> -        if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
> +        if ( !(xen_processor_pmbits & (XEN_PROCESSOR_PM_PX |
> +                                       XEN_PROCESSOR_PM_CPPC)) )
>              return -ENODEV;
>          if ( !pmpt || !(pmpt->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
>              return -EINVAL;

(This is the hunk I'm referring to further up.)

Jan

