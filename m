Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1B4C77BD7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 08:46:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168253.1494309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLqG-0002kr-99; Fri, 21 Nov 2025 07:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168253.1494309; Fri, 21 Nov 2025 07:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMLqG-0002iQ-6M; Fri, 21 Nov 2025 07:46:04 +0000
Received: by outflank-mailman (input) for mailman id 1168253;
 Fri, 21 Nov 2025 07:46:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8OZ7=55=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vMLqF-0002iK-A2
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 07:46:03 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1faa4f88-c6ae-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 08:46:00 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b73875aa527so272195966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 23:46:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-645363ac96dsm3875586a12.4.2025.11.20.23.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 23:45:59 -0800 (PST)
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
X-Inumbo-ID: 1faa4f88-c6ae-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763711160; x=1764315960; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hSZOBRtcFrMZCu6nnoxhFFBzHIulITb66vgJSNlwRq4=;
        b=a89Ek/5vc7oO4pV7ypwya39vL7IAeZ2zocoYoenxNvptoYXjgHdO5Q8yDY9pSkbZEC
         rLboRvoxsg8RwvEeCrU5E6qrjQNPDXXYS3R5GEmVj/bk4Loi+Q/qTG1/P905iLC9MOvC
         XGezz5wRh45q3PS/1ibaLOSEbV6yYQR8/jqdd+loiDosw5hEWOXPokUl4Xb5Z2FcXorG
         cG8gsDDlVHDCfzeWN5vZ1ol7QSH4XX8nkRbNJC/tJvBRACI1eS07IbsnW/saqOg2MxM+
         D5mEYvyvNwhwEQVU/sgZkBIdV1ArX6GYbNfbb5cu4DvrT9HlUx4TDz0A7TCgLk8ptcgG
         rAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763711160; x=1764315960;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSZOBRtcFrMZCu6nnoxhFFBzHIulITb66vgJSNlwRq4=;
        b=Mgr4UCXYBsszdji039qkLEakkQIDdaZ6753AeWcrbV78YzuY+aBpvRWfFumyyeODev
         raxi4ybPJW8UzQqqGN4plgH1n5uo3ZU8XQ723dQoBFAgYI/Puu3JWmNxcOlGa98uHNf4
         qgHR6Ymvc0SGbqqrqwjpoThZCtBpdoPfC6z7C38cSKTomedteYL7p1LmdZjQHn9JzSoo
         dM4S99iV1gH92X6Kan2o5a8CrXumREUiFYO0ZDiAN18GiXaDtwMtmQTnljE5WqZRMYvc
         +lsUa/GknjJFdkq9izW6OJaM/Sk5+TfEwnNRGyvgTg9mi2dlcxqTHv27RsMlkAwkRzt2
         97mw==
X-Forwarded-Encrypted: i=1; AJvYcCVqE1ASnxSHgtkGCddDAJMpx0OW35AIIiRNJopbm8YmsHYkdZfegEk6+3A9wvbjxzERy9svVQwyT48=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrQNifl93btaRxpSNzVEWadQ7zN6kVbNl046QZOO0zhv5qiN4n
	Zgyyb/QZWGAwzhrPiiB6qZ5h92I81CeuqQxCZ9jBZTbd7nke+0yzFbtig/mVTQhB0w==
X-Gm-Gg: ASbGncsNe9wGekGrIh5+ijc4l30WR0CrrORQPOer4aay4aCOfwwhUws5ok1ec7S2TvR
	xCA6+RLrdzc0XpMNgso9T36T/ff/sMbXLn88rxLmrgbnGlTJ3B6o28wMgjg5Q4kYLVqgbuPLJTD
	rjSu7ZV75D4Ro1x3Mn/GkNFTEzX4jQAK+oXSuVnCvHwRcyjw/P2jqeHtPU5+FjMuZYAf2paTlBj
	T1roNGI2sYCWX+PoeeSPLXXqRUTwxb5yeuiEYQOP8VsGNSLnnMgpaVxEcVTcx1r6s7dT5mXI5lA
	KrA5OWPtKKT7rh6erVH8l7E2nESzSSh6d9IOUAcg73rd/qk2ewTAppZsOec1Ws31iUjJ0Fbq1t6
	f53gXtZExJ/DDdDd0K6y7yFuE2YE8woQ20l6tsP9VTcDU8udLltcrEV6uAi4YaMon1I9Jcwxy0N
	jmI6OL04ns3Yh0DNzZF0ZQn2QbFgVoRmuvQJhZImXxNR4NT3U4GhdkTwTGtl4jIEt1xXAr0rgyv
	ELhCFmBPBQG3A==
X-Google-Smtp-Source: AGHT+IGS0+W4X/RQwYN6nDTJF0QZ+71jgREH4X/mWbbYI/bJlCmQy/VVlc8GRClpxk63g+FOVQEw+w==
X-Received: by 2002:a17:907:3f24:b0:b6d:2c70:4542 with SMTP id a640c23a62f3a-b767170cc75mr120059166b.30.1763711160196;
        Thu, 20 Nov 2025 23:46:00 -0800 (PST)
Message-ID: <7ba92200-6249-457d-b462-e6c6226852b7@suse.com>
Date: Fri, 21 Nov 2025 08:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/MCE: restrict allocation of thermal and CMCI
 vector to BSP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
 <638d0954-e889-41ee-b277-282f83170c69@suse.com>
 <ed2f44ce-b28d-482f-b6bb-5ef40149f2b2@citrix.com>
 <5a476cc5-0095-4783-bde9-c84f24740372@suse.com>
 <8c55d065-c663-40ac-a2c5-f4c7d85971a1@citrix.com>
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
In-Reply-To: <8c55d065-c663-40ac-a2c5-f4c7d85971a1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2025 18:25, Andrew Cooper wrote:
> On 20/11/2025 12:11 pm, Jan Beulich wrote:
>> On 20.11.2025 12:51, Andrew Cooper wrote:
>>> On 19/11/2025 10:50 am, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/cpu/mcheck/mce.c
>>>> +++ b/xen/arch/x86/cpu/mcheck/mce.c
>>>> @@ -110,13 +110,13 @@ static void __init mcheck_intel_therm_in
>>>>  }
>>>>  
>>>>  /* P4/Xeon Thermal regulation detect and init */
>>>> -static void intel_init_thermal(struct cpuinfo_x86 *c)
>>>> +static void intel_init_thermal(const struct cpuinfo_x86 *c, bool bsp)
>>>>  {
>>>>      uint64_t msr_content;
>>>>      uint32_t val;
>>>>      int tm2 = 0;
>>>>      unsigned int cpu = smp_processor_id();
>>>> -    static uint8_t thermal_apic_vector;
>>>> +    static uint8_t __ro_after_init thermal_apic_vector;
>>>>  
>>>>      if ( !intel_thermal_supported(c) )
>>>>          return; /* -ENODEV */
>>>> @@ -160,7 +160,8 @@ static void intel_init_thermal(struct cp
>>>>          return; /* -EBUSY */
>>>>      }
>>>>  
>>>> -    alloc_direct_apic_vector(&thermal_apic_vector, intel_thermal_interrupt);
>>>> +    if ( bsp )
>>>> +        alloc_direct_apic_vector(&thermal_apic_vector, intel_thermal_interrupt);
>>> We really don't want both c and bsp passed in.  That can only go wrong.
>>>
>>> Furthermore, this function has 2 other examples generating bsp locally.
>>>
>>> The function is in desperate need of cleanup (MSRs, variable and
>>> constant names), but right now this makes it worse.
>>>
>>> Please either use c == &boot_cpu_data, and I'll do some cleanup later,
>>> or generate bsp = c == &boot_cpu_data and fix up all users in the function.
>> No, throughout mce/ this won't work as long as acpi/power.c:enter_state() has
>>
>>     mcheck_init(&boot_cpu_data, false);
> 
> How's not not already broken then?  As said, intel_init_thermal() is
> already using c == &boot_cpu_data.

That's two printk()s, so not overly severe a bug. And being fixed by "x86/MCE:
adjust S3 resume handling" posted months ago. There I'm actually putting up
the question whether one of the two could/should stay as is.

> This patch introduces a conflicting idea of bsp in this function, and
> that's what I really want to avoid.
> 
> This looks like it wants splitting properly as {bsp,percpu}_init_$FOO()
> like we have elsewhere.

Without detailed checking, I'm not sure that would properly cover things.
Right now we have three modes: BSP (boot), BSP (resume), and AP.

More importantly, though: This would be more than enough content for another
series, i.e. shouldn't block the work here (which really moves things to a
more consistent state, within cpu/mcheck/, just like that other patch also
aims at doing).

Jan

