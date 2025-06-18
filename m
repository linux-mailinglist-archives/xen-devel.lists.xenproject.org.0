Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E595EADE8E0
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 12:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019039.1395897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRq1d-0005P2-H2; Wed, 18 Jun 2025 10:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019039.1395897; Wed, 18 Jun 2025 10:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRq1d-0005Mr-Dh; Wed, 18 Jun 2025 10:28:13 +0000
Received: by outflank-mailman (input) for mailman id 1019039;
 Wed, 18 Jun 2025 10:28:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRq1b-0005Ml-KZ
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 10:28:11 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ede9c377-4c2e-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 12:28:09 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so3825996f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 03:28:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365e0cffe6sm95788225ad.245.2025.06.18.03.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 03:28:08 -0700 (PDT)
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
X-Inumbo-ID: ede9c377-4c2e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750242489; x=1750847289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fGeFrsVfOPDpETi8ACldN3VXeYoeBYMm5S1M4SvLJ+w=;
        b=TEGrefr+krZvKFgRXCHD+g3p6FfPn4VYpKEYMf+WadnqsVn/x6pSZsXzBTq9+r/+pE
         WuqGjnAW2s5rasyci+dqC8LE+rgwuPI6jcWmRWk9ulQsaTlgHMYkXpgtqgRjNCF6O4Ui
         lq/iu+VGspIIFDcE5m6Gy/j54GKuXHKrK90xX0Ga5u8hTR4d/oAurlRWJt4UztVO21SK
         xTbHHJFgAkViBOIhdpMR9+yTG92wwRwDjzjBAe8ogAk58NUfUlKcyUmu9SJzq0dKb+bN
         bRuCUPyRdG+rsWRujuwpEp5Uy01rIXzRomqUOS8p61sbmWwkMj9smJBfeOhKcZ9HaGu2
         8AeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242489; x=1750847289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGeFrsVfOPDpETi8ACldN3VXeYoeBYMm5S1M4SvLJ+w=;
        b=T27a7wPnkS9ayJWN/3/p3CTAxtiTOnYKJsCLhiJ6PrUL7fbkGWqqV9wXavvFuqP0TN
         5D17/YOt1RApIQ7EdbUzbHgkWBlHIH4nWMTuNVLdh5jKKfsRecABHpulO4fNNuTg5g7E
         aQ1dODtx7W5Yqvf218JMfoaMBjKTy9QrHxltYv4COtcCMvGsJ1nPINdlFN4ISl8Ng6Xf
         u2OL90Fb+byhyWfANVMxnAXPfXwjgiHNZIVywKXkwwYPOTzgxKssS1Q66Alm02fAiSCg
         +1CennzoS9IlorLItKU75rkcgaleDBKvif1szBLtdrPJ7fQWRh0bBtg42/MWVL4jeEvu
         pzdw==
X-Forwarded-Encrypted: i=1; AJvYcCW5vc11+thnneyo+eFOLjOf5ZVIJk2eDF5Z4HayOPQLb/bAv8V416FWzLKIfeN6C8RWjm+ap2nDPps=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoRsdgG3WcMeV+jJBor1zhgtv98zYwEBUFWX6FFy6zuPu14HPS
	LmIuLf5R5FE7YWndSo+0BXr/1Rz/t+6d+OE1Rx+X6WRtla2/c5QditBoiR3PEt6oCQ==
X-Gm-Gg: ASbGncsp/i+Bls9XU1omZB0xQObulzpSxuL2rc0zO7ef0WuX2Mq3BbdS6B6qAGOFyB0
	2EftmaygFD32q4pjEPFxOmWHePWWiouNtzfKwuoWqNK4uAGrJUzXkNiv3pRB1WmnFDTKlya9NXP
	QnF1gWrvuUeJ3i5zEsMgtnQoRVwVYWZnuxC6GanGNjYCz73rsbUftJPZ9Idg6TQ7AXNZLhplHXD
	tRWixi5aC2SNoTHcNg1mymh+ky7i8r1oQxoZySe2LG4YGKRyfHQ313R8wcJ1kfW19W7JjX0aNUs
	ll9PEZ6mVXk5XPaXm/OsPpKt4Iuf5jKP/KE88Ntw4Wg1iIopP0oMdXQzQkv+q5oaMv2xuV0o+qf
	LAOGwaYbHJseQz6c7LEOSk19LbCgyWNVNYup/ZlT3u4F/QebWrUuITtQDEQ==
X-Google-Smtp-Source: AGHT+IHcFqHKstTzlqOf8MRwCPVNqzb2i9CCIMgWnpLUPEbBBCt9uXIHtpwwdqe1pENOjjQHvnjQeg==
X-Received: by 2002:a05:6000:4602:b0:3a5:2182:bd11 with SMTP id ffacd0b85a97d-3a572373c13mr15065840f8f.20.1750242488744;
        Wed, 18 Jun 2025 03:28:08 -0700 (PDT)
Message-ID: <e516e18a-b529-4389-8973-a15ef356fcdc@suse.com>
Date: Wed, 18 Jun 2025 12:28:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/20] xen/pmstat: consolidate code into pmstat.c
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20250528091708.390767-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2025 11:16, Penny Zheng wrote:
> We move the following functions into drivers/acpi/pmstat.c, as they
> are all designed for performance statistic:
> - cpufreq_residency_update()
> - cpufreq_statistic_reset()
> - cpufreq_statistic_update()
> - cpufreq_statistic_init()
> - cpufreq_statistic_exit()

You say move, but ...

> +int cpufreq_statistic_init(unsigned int cpu)
> +{
> +    unsigned int i, count;
> +    struct pm_px *pxpt;
> +    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
> +    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
> +
> +    spin_lock_init(cpufreq_statistic_lock);
> +
> +    if ( !pmpt )
> +        return -EINVAL;
> +
> +    spin_lock(cpufreq_statistic_lock);
> +
> +    pxpt = per_cpu(cpufreq_statistic_data, cpu);
> +    if ( pxpt )
> +    {
> +        spin_unlock(cpufreq_statistic_lock);
> +        return 0;
> +    }
> +
> +    count = pmpt->perf.state_count;
> +
> +    pxpt = xzalloc(struct pm_px);
> +    if ( !pxpt )
> +    {
> +        spin_unlock(cpufreq_statistic_lock);
> +        return -ENOMEM;
> +    }
> +    per_cpu(cpufreq_statistic_data, cpu) = pxpt;

... how come this moved up (back) here, when it was ...

> -int cpufreq_statistic_init(unsigned int cpu)
> -{
> -    uint32_t i, count;
> -    struct pm_px *pxpt;
> -    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
> -    spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
> -
> -    spin_lock_init(cpufreq_statistic_lock);
> -
> -    if ( !pmpt )
> -        return -EINVAL;
> -
> -    spin_lock(cpufreq_statistic_lock);
> -
> -    pxpt = per_cpu(cpufreq_statistic_data, cpu);
> -    if ( pxpt ) {
> -        spin_unlock(cpufreq_statistic_lock);
> -        return 0;
> -    }
> -
> -    count = pmpt->perf.state_count;
> -
> -    pxpt = xzalloc(struct pm_px);
> -    if ( !pxpt ) {
> -        spin_unlock(cpufreq_statistic_lock);
> -        return -ENOMEM;
> -    }
> -
> -    pxpt->u.trans_pt = xzalloc_array(uint64_t, count * count);
> -    if (!pxpt->u.trans_pt) {
> -        xfree(pxpt);
> -        spin_unlock(cpufreq_statistic_lock);
> -        return -ENOMEM;
> -    }
> -
> -    pxpt->u.pt = xzalloc_array(struct pm_px_val, count);
> -    if (!pxpt->u.pt) {
> -        xfree(pxpt->u.trans_pt);
> -        xfree(pxpt);
> -        spin_unlock(cpufreq_statistic_lock);
> -        return -ENOMEM;
> -    }
> -
> -    pxpt->u.total = count;
> -    pxpt->u.usable = count - pmpt->perf.platform_limit;
> -
> -    for ( i = 0; i < count; i++ )
> -        pxpt->u.pt[i].freq = pmpt->perf.states[i].core_frequency;
> -
> -    pxpt->prev_state_wall = NOW();
> -    pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
> -
> -    per_cpu(cpufreq_statistic_data, cpu) = pxpt;

... moved down here just a few weeks ago? See a1ce987411f61 ("cpufreq: don't
leave stale statistics pointer"). I'll make yet another patch, but you want
to be more careful when re-basing. The other recent change, c6e0a55396233
("cpufreq: use existing local var in cpufreq_statistic_init()"), was also
lost.

Jan

