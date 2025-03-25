Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94041A70303
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 15:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926518.1329361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx4pI-0004XP-PR; Tue, 25 Mar 2025 14:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926518.1329361; Tue, 25 Mar 2025 14:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx4pI-0004Vw-Lb; Tue, 25 Mar 2025 14:00:20 +0000
Received: by outflank-mailman (input) for mailman id 926518;
 Tue, 25 Mar 2025 14:00:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx4pH-0004Vo-Dr
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 14:00:19 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bcaeb76-0981-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 15:00:18 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso38759635e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 07:00:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f995606sm13994650f8f.13.2025.03.25.07.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 07:00:17 -0700 (PDT)
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
X-Inumbo-ID: 7bcaeb76-0981-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742911218; x=1743516018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CqRrUcgdqpa64z35FDwApQhTUpYQYDxMlT5SzQsv32o=;
        b=Qf9OY1OHX0oaFs87c/N3EqGoL6Z89/fA+PDV2TDeL3+1X+f2cZX3StAwyEszZ3LiiS
         VHWLeZ9c5nZEWjO1alqX/GDQANY1LP8QggENH1WAabQEhjIS/y8YC67DpdVpRf7Lf5GF
         Ns4YaJyUOXuxoCGHjFhiosxNLKR7VnJlpFoa9mciZufzfZ7uDcJFTQbrz1sXttzC9kHS
         caSgF0KoTkTzXyd+MZBT/5ixWCydTz4udSmsAC36TtY4Seh40k4J2Ha1y0BPk0kitKaS
         ocHkhcqmBSg5NWYaj5pjtIzPA048NOt/34+y8RtsvEyJMDvERxBaYO7gCxERMYMgw1H3
         El3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911218; x=1743516018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqRrUcgdqpa64z35FDwApQhTUpYQYDxMlT5SzQsv32o=;
        b=Dw0ZeIEFwIo7OTA6qTvj+dnt9EFDNPk9Tm4hojS46aa97cI7y1TtOy6+o8MuXzsMNp
         H/b8+gjgbdiivPVwS6gxj6zobIgxSwAnf53UUb9XZA2saiEM0TLuh4Ftev71qU18lmaK
         G/ezQcSd+tkT1zTiyt0uusahtdpfzqf5vdZZN+tyUpx6qxyGvS+9FJ72ixW5+M2Q++ws
         dJ9TUOOWCJihXoyiIaHc7fmXeStGH2RmHLUVsfoqTpBaAK0DvhzwS48ONEcmhhbJ1eMR
         AycG7DOa+wuJAZjL4CmfoYBTUdxzTsgXBxVw18ZVexuhMhmvd/zZ6BEXnC38RY1CX4i1
         ol0g==
X-Forwarded-Encrypted: i=1; AJvYcCVqTctbZxZXNFVazSdKJ1LJlGq0qZsUw9UsVumnqH/7fdjsKozd1IYOq6IY9AjBs7N6wXvb3jxed0A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlxS/lUcU6tjVDH1/AFLWqe9HTEJQUI11MD3C6UOjJf1A4SWHB
	eO9EoSE6jM2f4Dj/dJtYFGFFISQX9LzPnBpDXWQtb0yMPoR323pW7I7x7bdZ0Q==
X-Gm-Gg: ASbGncty9ZZzi4FCtCoZwHS6225rXxzIOZ6Ix57xp+ynIXXCJRS4KE2YjGGngW2DHRx
	MvqED7veufebBxwHB8z/jazDaoPTfoqjai3Lx3lld54RJJwUeZwuuF3vsi4K7kPvrRVEz+RX22G
	U52tlo8XUi3PG5/qNJPyaKkP7XlqupWkO0fV64s7GxFZHE8wqq7pdCXAYnHw0D/4nGOdLPjOlmC
	af6hBAJ5qWh87u2K/GlX76gf3PQNhiZW2E1v4sbh2jvUH3xBh0Isykfblho473WrPEBXVnowm9n
	gGGK7vQTjodRqscjAd2dHe4eoTGA815lQ3o8oW34otZp0BFoJxPF43lwzXNN00Zw3dS1sDLGpkx
	ZfOEqvKjAplEIjzf45GGSnKlm+odlxQ==
X-Google-Smtp-Source: AGHT+IGecjWzDYTjaW6CXjNDK6u3VWHzDjaj0LPgpnSD1knSRvqELlvbPlidk12dM6woDXpr2Farig==
X-Received: by 2002:a05:600c:1553:b0:43c:e7a7:1e76 with SMTP id 5b1f17b1804b1-43d509e373fmr139336685e9.1.1742911217504;
        Tue, 25 Mar 2025 07:00:17 -0700 (PDT)
Message-ID: <6e252e58-d589-41ba-87ba-d71ef0b04d73@suse.com>
Date: Tue, 25 Mar 2025 15:00:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pmstat: fold two allocations in get_cpufreq_para()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b2f1d0dc-54b0-4520-b4b6-3a1892662e53@suse.com>
 <31635ea1-cac9-4a5e-a4d3-2349d2bfb942@citrix.com>
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
In-Reply-To: <31635ea1-cac9-4a5e-a4d3-2349d2bfb942@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2025 14:52, Andrew Cooper wrote:
> On 25/03/2025 12:53 pm, Jan Beulich wrote:
>> There's little point in allocation two uint32_t[] arrays separately.
>> We'll need the bigger of the two anyway, and hence we can use that
>> bigger one also for transiently storing the smaller number of items.
>>
>> While there also drop j (we can use i twice) and adjust the type of
>> the remaining two variables on that line.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Wow this function is a mess.
> 
> It is an improvement, so Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com>,

Thanks.

> but the allocations could be removed
> entirely by restructuring the logic some more.

Perhaps.

> Also, one extra observation.
> 
>>
>> --- a/xen/drivers/acpi/pmstat.c
>> +++ b/xen/drivers/acpi/pmstat.c
>> @@ -193,11 +193,10 @@ static int get_cpufreq_para(struct xen_s
>>      const struct processor_pminfo *pmpt;
>>      struct cpufreq_policy *policy;
>>      uint32_t gov_num = 0;
>> -    uint32_t *affected_cpus;
>> -    uint32_t *scaling_available_frequencies;
>> +    uint32_t *data;
>>      char     *scaling_available_governors;
>>      struct list_head *pos;
>> -    uint32_t cpu, i, j = 0;
>> +    unsigned int cpu, i = 0;
>>  
>>      pmpt = processor_pminfo[op->cpuid];
>>      policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
>> @@ -219,25 +218,22 @@ static int get_cpufreq_para(struct xen_s
>>          return -EAGAIN;
>>      }
>>  
>> -    if ( !(affected_cpus = xzalloc_array(uint32_t, op->u.get_para.cpu_num)) )
>> +    if ( !(data = xzalloc_array(uint32_t,
>> +                                max(op->u.get_para.cpu_num,
>> +                                    op->u.get_para.freq_num))) )
>>          return -ENOMEM;
>> +
>>      for_each_cpu(cpu, policy->cpus)
>> -        affected_cpus[j++] = cpu;
>> +        data[i++] = cpu;
>>      ret = copy_to_guest(op->u.get_para.affected_cpus,
>> -                       affected_cpus, op->u.get_para.cpu_num);
>> -    xfree(affected_cpus);
>> -    if ( ret )
>> -        return ret;
>> +                        data, op->u.get_para.cpu_num);
>>  
>> -    if ( !(scaling_available_frequencies =
>> -           xzalloc_array(uint32_t, op->u.get_para.freq_num)) )
>> -        return -ENOMEM;
>>      for ( i = 0; i < op->u.get_para.freq_num; i++ )
>> -        scaling_available_frequencies[i] =
>> -                        pmpt->perf.states[i].core_frequency * 1000;
>> +        data[i] = pmpt->perf.states[i].core_frequency * 1000;
>>      ret = copy_to_guest(op->u.get_para.scaling_available_frequencies,
>> -                   scaling_available_frequencies, op->u.get_para.freq_num);
>> -    xfree(scaling_available_frequencies);
>> +                        data, op->u.get_para.freq_num) ?: ret;
>> +
>> +    xfree(data);
>>      if ( ret )
>>          return ret;
>>  
> 
> Not altered by this patch, but `ret` is bogus here.
> 
> It's the number of bytes not copied, and needs transforming into -EFAULT
> here and later.

Oh, right - I noticed this when making the patch, then forgot again. I can
make another patch, unless you have one in the works already.

Jan

