Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3777EB013EA
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 08:53:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040545.1411964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua7dD-0001BF-I7; Fri, 11 Jul 2025 06:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040545.1411964; Fri, 11 Jul 2025 06:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua7dD-00018I-Ev; Fri, 11 Jul 2025 06:53:15 +0000
Received: by outflank-mailman (input) for mailman id 1040545;
 Fri, 11 Jul 2025 06:53:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw5d=ZY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ua7dB-00018C-IZ
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 06:53:13 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5b40d78-5e23-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 08:53:11 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso1730067f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 23:53:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4285d7asm39181845ad.29.2025.07.10.23.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 23:53:10 -0700 (PDT)
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
X-Inumbo-ID: b5b40d78-5e23-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752216791; x=1752821591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Y+LI5VsojBLHOyQ255h5v/Xeh2Jy0Z7mK5gc5cqJZQ=;
        b=WEcaHcfrv6SNWpDEhRTsUSsH0yky40dWHQRIrmFE5+Hp583l9NUD7+uWFH2dsjAazs
         t12NyzCYnetErkAaML3U8iUI0HVyyGPBafY2VOeCuXIwJh5UBbHvMmFdq8PrzbPYs+ay
         EIYUG2Jol3+x01T+DW1Q95vj88Uvm0nSSrRq6zFQ9WkApluRo1S/qffRD7nnb5H2qBwF
         a6d5mcnZW46MdgEPg1WdO/E4qBoyXDRoeuf2Oxc62AQ0y7+UsVcOsbcXF3I25DfBSC/i
         89C/+NSKAiXDZNYFz+6L5/u52WgJxzUZN4w1r0zyZdBpIqhAypakEC4ty1h9uhOexCn2
         3SPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752216791; x=1752821591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Y+LI5VsojBLHOyQ255h5v/Xeh2Jy0Z7mK5gc5cqJZQ=;
        b=w77KcDky4iENSPcLuH8WapZugVZxKvf6Qi+xcer51TUrH+qCmzq1FXoqVOp8A4Lmeu
         d926NC5KpXUawoArnTQpFXJO06jaWBL58vF3oNjV9kBKCIFYX7a3V8BG9NJ64Mmh19+x
         GkjxIRhRryFLmMU24O0de6LnSV/GvQ5S8gs+Ds/XzHokjGY7+vuWwB5PczNlJkGlRuDY
         K0tsz5fSmhlfoLirNNhwuXrdm49v5E8vElEPRiNEh8HQVW55XwdvXg+Gopwu4L5XLO3n
         Px7bhkgE14jgsYm3Sbb/tJ4L7Ldi9tKU0W0CqskKHirfqvhVSkORfLYbK8lFO51UMaG7
         0Aww==
X-Gm-Message-State: AOJu0YxrysgpZB8w8falQSPSKFzLI0F99Z4PR/ZJCRUXt1AcT5j7SPZt
	M32yprag28QZW96z8vVpOdvySnXqrYRPHIEGneNQBljfV7FaZi2aP+vMqZgJ3hIIDg==
X-Gm-Gg: ASbGncu8Mg9f/xH1Xz4nD8HUXNtTqVDLz7dcMBAX6UZJG/zfVzJUsjx+6LqcswolzJ6
	/68P8hFNlOKZwLm9x0gvQwZOnEfewEzz//aEjytgd4HXtlR/baKw2ucvrdFj07SpFgepIMQIOun
	7jbnvJNOGybNS6DKdXfR5ChWBZM7h1C2tdr1vaT7+KrH54FKIoaO3GrPi9DkMRVEWrDhE2wzlFA
	fsgcUVppjNq2u7JS+iwlxLNC/PjWW6tpcyo9JUE/9DYpYbOUf7sKfRqsmTK6Q27o2D4suaKWa5J
	cjEaO4KxQx08KbmwWPbeXncnU9v0q263sLXDMwzLwBm9rmnHwmxr8RPPzzY1gblRKZ/MKQg/VSm
	PcNWiqij/RzE81XQdg9BRTK4GqnEOo+zWU0+CGrYTPoL28DecA0vLMYdAYwzq8BpXb0TSzmJe/d
	dO8yaNkHc=
X-Google-Smtp-Source: AGHT+IFx2e0Q/XP8N1w3bc+FI0503D7k4Rut6/vb+6PCSHYMgDAA6vl2h0zEp+TNBMuxCLwFqSVVeA==
X-Received: by 2002:a05:6000:4389:b0:3b3:9c85:6b17 with SMTP id ffacd0b85a97d-3b5f2dfd8c0mr1160605f8f.34.1752216790881;
        Thu, 10 Jul 2025 23:53:10 -0700 (PDT)
Message-ID: <79d576ee-9a08-4afc-97ab-6a0f6a6c7397@suse.com>
Date: Fri, 11 Jul 2025 08:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/arm: address violation of MISRA C Rule 10.1
To: Stefano Stabellini <sstabellini@kernel.org>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <d92cf08a64d8197a1d1a45f901e59183105d3da5.1752183472.git.dmytro_prokopchuk1@epam.com>
 <alpine.DEB.2.22.394.2507101715030.605088@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507101715030.605088@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 02:15, Stefano Stabellini wrote:
> On Thu, 10 Jul 2025, Dmytro Prokopchuk1 wrote:
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -773,7 +773,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>>  
>>                  nrspin_lock(&d->page_alloc_lock);
>>                  drop_dom_ref = (dec_count &&
>> -                                !domain_adjust_tot_pages(d, -dec_count));
>> +                                !domain_adjust_tot_pages(d, (-1L) * dec_count));
> 
> ...but I don't understand this? It looks like it would also break 10.1
> and/or 10.3 as well?
> 
> I would rather use casts if needed, which wouldn't change the behavior
> but would highlight the unsigned->signed conversion, making it more
> visible:
> 
>     !domain_adjust_tot_pages(d, -(int)dec_count));

Except that, as more often than not anyway, such casts are fragile.

>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -691,7 +691,7 @@ size_param("low_mem_virq_limit", opt_low_mem_virq);
>>  /* Thresholds to control hysteresis. In pages */
>>  /* When memory grows above this threshold, reset hysteresis.
>>   * -1 initially to not reset until at least one virq issued. */
>> -static unsigned long low_mem_virq_high      = -1UL;
>> +static unsigned long low_mem_virq_high      = ~0UL;
>>  /* Threshold at which we issue virq */
>>  static unsigned long low_mem_virq_th        = 0;
>>  /* Original threshold after all checks completed */
>> @@ -710,7 +710,7 @@ static void __init setup_low_mem_virq(void)
>>       * to ever trigger. */
>>      if ( opt_low_mem_virq == 0 )
>>      {
>> -        low_mem_virq_th = -1UL;
>> +        low_mem_virq_th = ~0UL;
>>          return;
>>      }
>>  
>> @@ -778,7 +778,7 @@ static void check_low_mem_virq(void)
>>          low_mem_virq_th_order++;
>>          low_mem_virq_th = 1UL << low_mem_virq_th_order;
>>          if ( low_mem_virq_th == low_mem_virq_orig )
>> -            low_mem_virq_high = -1UL;
>> +            low_mem_virq_high = ~0UL;
>>          else
>>              low_mem_virq_high = 1UL << (low_mem_virq_th_order + 2);
>>      }
>> --- a/xen/common/time.c
>> +++ b/xen/common/time.c
>> @@ -84,7 +84,7 @@ struct tm gmtime(unsigned long t)
>>      }
>>      tbuf.tm_year = y - 1900;
>>      tbuf.tm_yday = days;
>> -    ip = (const unsigned short int *)__mon_lengths[__isleap(y)];
>> +    ip = (const unsigned short int *)__mon_lengths[(int)__isleap(y)];
> 
> __isleap return bool and we deviated bool conversions in logical
> operations but not here, so I understand why this is needed. OK.

No. If a cast is unavoidable here (which I question), it wants to be to
an unsigned type.

I'm glad I looked at the patch, btw, since these files - contrary to the
patch subject prefix - aren't Arm files.

>> --- a/xen/lib/strtol.c
>> +++ b/xen/lib/strtol.c
>> @@ -13,7 +13,7 @@
>>  long simple_strtol(const char *cp, const char **endp, unsigned int base)
>>  {
>>      if ( *cp == '-' )
>> -        return -simple_strtoul(cp + 1, endp, base);
>> +        return (-1L) * simple_strtoul(cp + 1, endp, base);
>>      return simple_strtoul(cp, endp, base);
>>  }
>>  
>> --- a/xen/lib/strtoll.c
>> +++ b/xen/lib/strtoll.c
>> @@ -13,7 +13,7 @@
>>  long long simple_strtoll(const char *cp, const char **endp, unsigned int base)
>>  {
>>      if ( *cp == '-' )
>> -        return -simple_strtoull(cp + 1, endp, base);
>> +        return (-1LL) * simple_strtoull(cp + 1, endp, base);
>>      return simple_strtoull(cp, endp, base);
>>  }
>>  

Nor are these two.

As to the kind of change here - didn't we deviate applying unary minus to
unsigned types?

Jan

