Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A05DA77B63
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 14:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934063.1335869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzb9G-00040d-7n; Tue, 01 Apr 2025 12:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934063.1335869; Tue, 01 Apr 2025 12:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzb9G-0003ys-56; Tue, 01 Apr 2025 12:55:22 +0000
Received: by outflank-mailman (input) for mailman id 934063;
 Tue, 01 Apr 2025 12:55:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzb9E-0003ym-6n
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 12:55:20 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 903b76ff-0ef8-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 14:55:18 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso55964375e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 05:55:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82efe389sm197293005e9.19.2025.04.01.05.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 05:55:17 -0700 (PDT)
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
X-Inumbo-ID: 903b76ff-0ef8-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743512118; x=1744116918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rz52h27Y0K49eVUrNNhBULweTSr/z2skN7gf7HWe99E=;
        b=OnoMYFqzxkoZtCjG5Dd4xzO7TdwJjxGjUmWRgT57+PVmL0hqo6BBMQ6r6L+hdVPPp9
         Mnc/69mv7b1/c0Bj8ZTX+M26V26Nr7yB6TV/XEwWRPHGhqLIy6Z7SoVniF+pR+Em8Oom
         QNUB4bs0sNSXm3pxed31SrTD7m0p1lSUmako1K5CGzS1PBiZsWG35kUfbbZtVrTU8JXH
         9i+s6cJdRNSBGam/l2bOqKeU4WRTAHizSY61AAjo0UQ9zmahQhVGJdvOtIxp0JF3xiAY
         QNSZHi2kjLSMaGpLbpHMVum5mVXG4YF9WXnAULHaYkn2CB7z/BklIGPtkc4YNp4xic02
         IXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512118; x=1744116918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rz52h27Y0K49eVUrNNhBULweTSr/z2skN7gf7HWe99E=;
        b=NT8hbdJMxlQ1Zbxng42nofhdbtSRgr4vCYjHedAdf/ToU0uCh/ggY4pDqpA9r9QVCV
         BjFMpRXeUd0yAm7W9Rkg7ZPsvPD2y85bd0B0Tm9SGQEHjpGgtpMEyrphWy5fdK+W5yQo
         OKH4I/Fp07azn0E1CaykPC1ZDUeXHqRUD9Xnw4ggWgJMy8n6usJR3ZwQmflq+T9a4M3M
         s6wXsft2OZu38WShOF4B393HRKU4H3YXjfAYeSf4c3itrdilL0wbORURIPkU9dVAMx4+
         4mZ6loPbh6e4g+1kHGazexkgvkqN30xEuUw5464YfJb14zpDnfUtd68MEKOJcuqRCiU6
         cWRA==
X-Forwarded-Encrypted: i=1; AJvYcCX7Qi6GvltvaYmyHufCCeX2Gj8LO+OgfWp4bFAyFSL0xYprxcKwA81Wz5FMIMwEY3LC9yDobevfLGU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxn/NNskr7bZYGU29/kh3TA/MH23sb4Ft7LRSkE2hb6yQOIgW4m
	phBpQb+VIe8/BLGYCpxsK30fWQvhlMFHlmi6xOxrfATUJIo4SwanviaDo9RMnQ==
X-Gm-Gg: ASbGncsKo0/LWozr/48I778+zlR/qW4gRH5RoKrJVs6dvUbH+x/PJhPbc85y2E9j5Ze
	+UQTid1aYwSAbj/pKysDMJlJwbdEH3CCqYct56GteltwcRr3+UwD//BgWFEclAv0gzOeWbYdntr
	URxHU7ySlrtSABeTm8nzNYSXPSDG2mqFjGBXB8fPTDiLh1A64kM+0LvnqAFFwUtVZR3DurQRAIg
	328EC8T+LOqo5Lnid2+xaBrBhf2tjcHOgfePGkck8ymFsS2aEc6jtkKT2/pyhV9qVFL294Boc1M
	dTEydYPjeK/A+d7OxKvNKzhhnhysfro1FeLhtYQ84G3WYQEsOAX5wjQib6G1bMB/D1PtehA0T2t
	mIXEDXbZyzVufkqWBsgBgeiBJMiqWeQ==
X-Google-Smtp-Source: AGHT+IEZThWwMBojUtCw7qoNrDEnvdpzW9YtRgSzOwbY3IHgFK8YCdY1KM2Gh+g7RFcAKF5ycKrHfQ==
X-Received: by 2002:a05:600c:154b:b0:43c:f81d:f with SMTP id 5b1f17b1804b1-43db6228077mr116479535e9.8.1743512117822;
        Tue, 01 Apr 2025 05:55:17 -0700 (PDT)
Message-ID: <2383a0ba-0c6b-47a4-8bbb-896c98edf51a@suse.com>
Date: Tue, 1 Apr 2025 14:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/19] xen/pmstat: clean up pmstat.c
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-10-Penny.Zheng@amd.com>
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
In-Reply-To: <20250326055053.3313146-10-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 06:50, Penny Zheng wrote:
> We intend to move the following functions into drivers/acpi/pmstat.c, as they
> are all designed for performance statistic:

"We intend to ..." describes future plans. Yet this is what you're doing in this
very patch.

> - cpufreq_residency_update
> - cpufreq_statistic_reset
> - cpufreq_statistic_update
> - cpufreq_statistic_init
> - cpufreq_statistic_exit
> and moving out acpi_set_pdc_bits(), as it is the handler for sub-hypercall
> XEN_PM_PDC, and shall stay with the other handlers together in
> drivers/cpufreq/cpufreq.c.
> This commit also applies various style corrections while moving these
> functions

Nit - I'd like to remind you of how to (not) word commit messages.

As to what the sentence says - you staying vague leaves unclear which
style violations may have been left in place, for perhaps a good
reason. For example I observe u32 in code being moved.

> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - new commit
> ---
>  xen/drivers/acpi/pmstat.c                 | 199 ++++++++++++++++++----
>  xen/drivers/cpufreq/cpufreq.c             |  31 ++++
>  xen/drivers/cpufreq/utility.c             | 162 ------------------
>  xen/include/acpi/cpufreq/processor_perf.h |   2 -
>  4 files changed, 199 insertions(+), 195 deletions(-)

Nit: Considering that code is being moved _into_ pmstat.c, "clean up"
in the subject is somewhat misleading. Maybe "consolidate code into
pmstat.c"?

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -43,6 +43,174 @@
>  
>  DEFINE_PER_CPU_READ_MOSTLY(struct pm_px *, cpufreq_statistic_data);
>  
> +DEFINE_PER_CPU(spinlock_t, cpufreq_statistic_lock);

If you really move everything that's statistics-related, then both of
the above items ought to be possible to become static now.

> +/*********************************************************************
> + *                    Px STATISTIC INFO                              *
> + *********************************************************************/
> +
> +static void cpufreq_residency_update(unsigned int cpu, uint8_t state)
> +{
> +    uint64_t now, total_idle_ns;
> +    int64_t delta;
> +    struct pm_px *pxpt = per_cpu(cpufreq_statistic_data, cpu);
> +
> +    total_idle_ns = get_cpu_idle_time(cpu);
> +    now = NOW();
> +
> +    delta = (now - pxpt->prev_state_wall) -
> +            (total_idle_ns - pxpt->prev_idle_wall);
> +
> +    if ( likely(delta >= 0) )
> +        pxpt->u.pt[state].residency += delta;
> +
> +    pxpt->prev_state_wall = now;
> +    pxpt->prev_idle_wall = total_idle_ns;
> +}
> +
> +void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to)
> +{
> +    struct pm_px *pxpt;
> +    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
> +    spinlock_t *cpufreq_statistic_lock =
> +               &per_cpu(cpufreq_statistic_lock, cpu);
> +
> +    spin_lock(cpufreq_statistic_lock);
> +
> +    pxpt = per_cpu(cpufreq_statistic_data, cpu);
> +    if ( !pxpt || !pmpt ) {

Hmm, you said style corrections are being made, yet the brace here is
misplaced.

> +        spin_unlock(cpufreq_statistic_lock);
> +        return;
> +    }
> +
> +    pxpt->u.last = from;
> +    pxpt->u.cur = to;
> +    pxpt->u.pt[to].count++;
> +
> +    cpufreq_residency_update(cpu, from);
> +
> +    (*(pxpt->u.trans_pt + from * pmpt->perf.state_count + to))++;

I came across this line the other day, iirc when reviewing you other
series. I find it expremely odd that this doesn't use array notation:

    pxpt->u.trans_pt[from * pmpt->perf.state_count + to]++;

Could you please switch to that, unless of course you see an issue with
it?

> +    spin_unlock(cpufreq_statistic_lock);
> +}
> +
> +int cpufreq_statistic_init(unsigned int cpu)
> +{
> +    uint32_t i, count;

Here any elsewhere - converting to unsigned int would also fall under
style corrections.

> +static void cpufreq_statistic_reset(unsigned int cpu)
> +{
> +    uint32_t i, j, count;
> +    struct pm_px *pxpt;
> +    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
> +    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
> +
> +    spin_lock(cpufreq_statistic_lock);
> +
> +    pxpt = per_cpu(cpufreq_statistic_data, cpu);
> +    if ( !pmpt || !pxpt || !pxpt->u.pt || !pxpt->u.trans_pt )
> +    {
> +        spin_unlock(cpufreq_statistic_lock);
> +        return;
> +    }
> +
> +    count = pmpt->perf.state_count;
> +
> +    for ( i = 0; i < count; i++ )
> +    {
> +        pxpt->u.pt[i].residency = 0;
> +        pxpt->u.pt[i].count = 0;
> +
> +        for ( j = 0; j < count; j++ )
> +            *(pxpt->u.trans_pt + i * count + j) = 0;

Preferrably array notation again, please.

Jan

