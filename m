Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D017AB43ABD
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 13:51:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109905.1459284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu8UJ-0000es-9K; Thu, 04 Sep 2025 11:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109905.1459284; Thu, 04 Sep 2025 11:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu8UJ-0000ck-5t; Thu, 04 Sep 2025 11:50:47 +0000
Received: by outflank-mailman (input) for mailman id 1109905;
 Thu, 04 Sep 2025 11:50:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uu8UH-0000ce-Dl
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 11:50:45 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63384771-8985-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 13:50:44 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso156525066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 04:50:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff138a8d76sm1394444766b.104.2025.09.04.04.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 04:50:42 -0700 (PDT)
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
X-Inumbo-ID: 63384771-8985-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756986643; x=1757591443; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq9GCpFaYT48FOq3UM86Tduy9jRrqzASQbYY7MHd40c=;
        b=GDU3OVuhZbei3hQUhD69KuP59v5+Oh+XUbRjfhmvJUf/AmV1wq2KTWIZQAz+UwUqCi
         TuWYOc634HFJkSOE7MDlqZT/OwXzu4lnwewzUVXV2CVN+Ha/KuGRV5xcd40pqe9r7G5I
         HH9klriAZrwzYpsPvxAQ51AVKarLZkZ7YAA+HU20MZpgEmDDteyeLCjvwSyuyOAG1NLU
         rJ6NEdvj2tgsRsUfR8e6HnNdFcBtrPDFaX/eiW7LADLfAUiUb2K3WNFU/VMT+8YDJ3ZK
         uwZs+Tig3pazJmxWP6VOKIYZTkDm2Cv/RwNdUfRyiRWwVzkzFRf/a+lVu5EkZbs+nl5H
         vdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986643; x=1757591443;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kq9GCpFaYT48FOq3UM86Tduy9jRrqzASQbYY7MHd40c=;
        b=pIs+e3eltJ4PdBNhdUCD+XLPbkXsKUrQYliB8T6a1Zkuwucd4hqvllh0judTnEc8K4
         Sr3g+yT4gGIYAU1FSJGJSUjF26ciXPJLMW2VdJXZw5GG3OEHb1a/PWwQHypgP50tj0fM
         HqgCoWMdh29/xjPcofIo0MWGu/P7lGUQo1Uqxs/+czubkZnQjhsxXgF6iyf9rRwbmTqg
         APIvUMUbvqBx2/EcB8Ab6VKZMNzlEtF1IEFW2v88aBtTEJG61wY4xLqaMMyIZ9+Qwq+q
         hUE0LQ1o0hUWIDdXXTTJn/JpKnEa21Ga3+ov9Z7f/XGXftCkP5BNubWInLDfmuuFlg0a
         aTSw==
X-Forwarded-Encrypted: i=1; AJvYcCVwdQOiaQUJ3CohW/zYEmLR6RBx7NiHAUQSvzk0wTIU1AaBAmg3ufc9n/rt628ZTOg6yuuzV6neG+E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZ+lFU7/QJXszDxhXPA0thp3CcQv6gg9Zl2tsFn7xwp1gcQLQC
	S2wQjTC+HEDMggX/N2tPtBb5OAiVl5hSelUVCiZt/3BSoqmItK2JNk9QTkKvpShuNw==
X-Gm-Gg: ASbGncvtUqIMuYhQ7PZOlf+AefzkT0Z5wW9/6qVMBdn6o9lkCTEObho7j0izAIWa5r7
	kbzSyPJjz0zrLEBMmTgScnhlyAQjJhKV7o0kSzIF9eFjKYFF0YaSOMBP6XkpzwcNByiscQEm4KM
	zOPwiszq+QD5mp/lKTIBig+9Nd/7yCNwatfT3Kgf6PQgKbUPgft95XmgrfQMGpdkuv7FyidOP+V
	3oj1JgNZTUucM1Uphy3k6T1fIK27yXk1XO9CfMPX6sIhMe3XN3b7Fwazj8DKYTlHW0Z5N0dOYXr
	3vorftEKHWrPk9ZRk2cnjTUfsTnwHJGThXABTllYMXphxRbB3IhyFKh7moKpx9rYp5JfwFGRXAg
	xgHJ7at5HxVPFtxn5mszrk2XMjtbc8gXQduW8yBuhTZ0RLMJ76+GsGzpAtlPRuZrn0B65uCxaU3
	r+hXYUDXY=
X-Google-Smtp-Source: AGHT+IH5QzA0/Fz7AeS0tWtcY9JhCIx75XQWcWbi3GhxNuU03zhPs1jemvU1g/ztBqcjEPXFr9AIHw==
X-Received: by 2002:a17:906:f59f:b0:b04:72bd:2080 with SMTP id a640c23a62f3a-b0472bd2168mr403464666b.60.1756986643143;
        Thu, 04 Sep 2025 04:50:43 -0700 (PDT)
Message-ID: <849f73f1-4004-4d17-a7a9-d755fb0f889b@suse.com>
Date: Thu, 4 Sep 2025 13:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/8] xen/cpufreq: embed hwp into struct
 cpufreq_policy{}
To: Penny Zheng <Penny.Zheng@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <20250904063518.2097629-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20250904063518.2097629-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.09.2025 08:35, Penny Zheng wrote:
> For cpus sharing one cpufreq domain, cpufreq_driver.init() is
> only invoked on the firstcpu, so current per-CPU hwp driver data
> struct hwp_drv_data{} actually fails to be allocated for cpus other than the
> first one. There is no need to make it per-CPU.
> We embed struct hwp_drv_data{} into struct cpufreq_policy{}, then cpus could
> share the hwp driver data allocated for the firstcpu, like the way they share
> struct cpufreq_policy{}. We also make it a union, with "hwp", and later
> "amd-cppc" as a sub-struct.

And ACPI, as per my patch (which then will need re-basing).

> Suggested-by: Jan Beulich <jbeulich@suse.com>

Not quite, this really is Reported-by: as it's a bug you fix, and in turn it
also wants to gain a Fixes: tag. This also will need backporting.

It would also have been nice if you had Cc-ed Jason right away, seeing that
this code was all written by him.

> @@ -259,7 +258,7 @@ static int cf_check hwp_cpufreq_target(struct cpufreq_policy *policy,
>                                         unsigned int relation)
>  {
>      unsigned int cpu = policy->cpu;
> -    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
> +    struct hwp_drv_data *data = policy->u.hwp;
>      /* Zero everything to ensure reserved bits are zero... */
>      union hwp_request hwp_req = { .raw = 0 };

Further down in this same function we have

    on_selected_cpus(cpumask_of(cpu), hwp_write_request, policy, 1);

That's similarly problematic when the CPU denoted by policy->cpu isn't
online anymore. (It's not quite clear whether all related issues would
want fixing together, or in multiple patches.)

> @@ -350,7 +349,7 @@ static void hwp_get_cpu_speeds(struct cpufreq_policy *policy)
>  static void cf_check hwp_init_msrs(void *info)
>  {
>      struct cpufreq_policy *policy = info;
> -    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
> +    struct hwp_drv_data *data = policy->u.hwp;
>      uint64_t val;
>  
>      /*
> @@ -426,15 +425,14 @@ static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  
>      policy->governor = &cpufreq_gov_hwp;
>  
> -    per_cpu(hwp_drv_data, cpu) = data;
> +    policy->u.hwp = data;
>  
>      on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);

If multiple CPUs are in a domain, not all of them will make it here. By
implication the MSRs accessed by hwp_init_msrs() would need to have wider
than thread scope. The SDM, afaics, says nothing either way in this regard
in the Architectural MSRs section. Later model-specific tables have some
data.

Which gets me back to my original question: Is "sharing" actually possible
for HWP? Note further how there are both HWP_REQUEST and HWP_REQUEST_PKG
MSRs, for example. Which one is (to be) used looks to be controlled by
HWP_CTL.PKG_CTL_POLARITY.

> @@ -462,10 +460,8 @@ static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  
>  static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
>  {
> -    struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
> -
> -    per_cpu(hwp_drv_data, policy->cpu) = NULL;
> -    xfree(data);
> +    if ( policy->u.hwp )
> +        XFREE(policy->u.hwp);

No if() needed here.

> @@ -480,7 +476,7 @@ static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
>  static void cf_check hwp_set_misc_turbo(void *info)
>  {
>      const struct cpufreq_policy *policy = info;
> -    struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
> +    struct hwp_drv_data *data = policy->u.hwp;
>      uint64_t msr;
>  
>      data->ret = 0;
> @@ -511,7 +507,7 @@ static int cf_check hwp_cpufreq_update(unsigned int cpu, struct cpufreq_policy *
>  {
>      on_selected_cpus(cpumask_of(cpu), hwp_set_misc_turbo, policy, 1);
>  
> -    return per_cpu(hwp_drv_data, cpu)->ret;
> +    return policy->u.hwp->ret;
>  }
>  #endif /* CONFIG_PM_OP */

Same concern here wrt MSR scope. MISC_ENABLE.TURBO_DISENGAGE's scope is
package as per the few tables which have the bit explicitly explained;
whether that extends to all models is unclear.

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -62,6 +62,7 @@ struct perf_limits {
>      uint32_t min_policy_pct;
>  };
>  
> +struct hwp_drv_data;

This shouldn't be needed.

> @@ -81,6 +82,11 @@ struct cpufreq_policy {
>      int8_t              turbo;  /* tristate flag: 0 for unsupported
>                                   * -1 for disable, 1 for enabled
>                                   * See CPUFREQ_TURBO_* below for defines */
> +    union {
> +#ifdef CONFIG_INTEL
> +        struct hwp_drv_data *hwp; /* Driver data for Intel HWP */
> +#endif

While it may make for a smaller diff, ultimately I think we don't want
this to be a pointer, much like I've done in my patch for the ACPI driver.

> +    } u;

This wants to either not have a name at all, or be named e.g. drv_data.

Jan

