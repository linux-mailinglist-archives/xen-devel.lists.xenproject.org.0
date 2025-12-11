Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5FCCB5058
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 08:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183604.1506239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTbSd-0005OC-JR; Thu, 11 Dec 2025 07:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183604.1506239; Thu, 11 Dec 2025 07:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTbSd-0005MM-GD; Thu, 11 Dec 2025 07:51:39 +0000
Received: by outflank-mailman (input) for mailman id 1183604;
 Thu, 11 Dec 2025 07:51:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTbSc-0005MG-Bd
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 07:51:38 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37b0a17a-d666-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 08:51:35 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42f9ed40b8fso268159f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 23:51:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b85d1esm3887430f8f.26.2025.12.10.23.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 23:51:35 -0800 (PST)
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
X-Inumbo-ID: 37b0a17a-d666-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765439495; x=1766044295; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zD9AKYovvfVOsnkYxku+GEY0D2V91PqdigXEXM1V5W4=;
        b=N6hzFu2naweI0+fWhc4dzvI53/4i+E2Uhr1fBO92GLP9mMvGCiAACrY5EAQM7k3qrF
         IexTxxvdSH9oGZNnKbS3xBpkhFc8cZ44A2rUl9RkbGQQ9LQb9loWuy9xBTU5GftsJpoY
         Pr6amU6n7lVt1LObnj5HV9RPiMTBHWTdDUiuDsgpGoWHICHjEhVbqO73g2OlIjYVqX9v
         POYFCKLuoNlZyFYMRiY12a6SXAKHWW2SKKieR/v531yIDDIGT3Ad3oNNQpsliyXdM1h1
         uvKWZpuk/z7hQi+V9775PczQMMIsdOtFI/dZTOhqtLVKUG3D2EKWWN0288G37QJcxEN8
         6HKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765439495; x=1766044295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zD9AKYovvfVOsnkYxku+GEY0D2V91PqdigXEXM1V5W4=;
        b=DKDly5ENwzLpfOOocbjqvjB9yiYNCBB9btj3mMOoik/9jA80IV6/K1JKOskBEFgoJD
         M8/1V8AV+OwXy80mcqYL6ervxbQZgYCRhCqapWVQYiFJEFlTsBmkC/HGbMz800DhvgsZ
         ZOtWCYVQAXy2d3Jajsx0mDMw0/m4/2I3dOV+uxFQoU+UbvChOwmL0GnT2O5LqgH/DF5t
         KmhhoH/48d5C+L/zoE0OOZ67kciQirZo+p1sYgGiwdMZSeeWexV/zZsa2UDDwR4uloYv
         cvEQzAuUb1uqMaLWQIXOXiuMxyNROgs+yVqHKs+b1jRzm/zG/OEyhX1ghJIziPnZgWzE
         9HBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrVPKfgGs9l9BW890Bg/4bWUfUcnqxFjYMZS/zahT61wiomljWj+2+LC862wHjWCX7soIq0fUnXkA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4ay2DKZrYd9bOroY0SpUoeDVjl+fHfiySnoanEgv6kACJEkim
	acFcRzDu64mZ4lrJIR7fJZnYCw70e9oP7UHd/HT/8GzA6vPkauWtCldFO0L5VylyMA==
X-Gm-Gg: AY/fxX7FjkIW7479Ncg4hbJxeL6GlsEKsehtqa/vM4fREI7hxEFFchYSzamVK5Q7oRz
	/KbUk3bqzpsSOPSgCvkgTL/2t9Kbz0vVPMMTr59xW3UB0k8GNb+XRFSewb88nmUQMsQt19bb0wu
	dgBhHZLk+2ux5Nc7oU2L9bEyNwv9E/1whex/Ksv+n0aomXOCqMjojJoWKGTfHoXSbUmF8B22S/Z
	iJpQBSYiebczAj1WGNfKkM8hL7k2wOKYLMXzQolFqOYyyGEEQhD8pkUIUsSq62DGZYJXDXv7f5L
	XT57ZZCiyyMu+jFlUcMmXAeHm0+xaIHx1fw4nJlqwkNdzPJ9+3TwrnI/HCExi/jWr03VipMc0zt
	5ugP4LLXjlx7Z80E5YjLVFCcU50f6Z+tyojE5HMcai8EvWpg9S8TOecfqJRktlU+N6J5yaKF4bS
	NL+Cdnk479Llkd+YARUY6b7wB/pqyoqOz43zx5LHzcKyhjzwwYskdh9L7ex1/xQAr8iRPGelSvr
	LG6JkJFY0M1qA==
X-Google-Smtp-Source: AGHT+IEchYXYx3e6nGbAC3jj8c77XQfR2s7OpXKpLYkv59YCrIz9FxgqTDBeBDWsxLoJvDN+JsDdLQ==
X-Received: by 2002:a05:6000:2210:b0:42b:4061:2416 with SMTP id ffacd0b85a97d-42fa3b19914mr5593014f8f.52.1765439495317;
        Wed, 10 Dec 2025 23:51:35 -0800 (PST)
Message-ID: <43ba31c7-a180-4e03-90e2-e80a9b551d30@suse.com>
Date: Thu, 11 Dec 2025 08:51:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] x86/cpufreq: use host CPU policy in HWP driver
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
 <bacee005-8ba3-468e-8de4-681af1cc4856@suse.com>
 <ad7daa54-0529-4e14-9eff-32d42a24f9e3@citrix.com>
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
In-Reply-To: <ad7daa54-0529-4e14-9eff-32d42a24f9e3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2025 15:11, Andrew Cooper wrote:
>> --- a/xen/arch/x86/include/asm/cpufeature.h
>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>> @@ -115,14 +115,6 @@ static inline bool boot_cpu_has(unsigned
>>  }
>>  
>>  #define CPUID_PM_LEAF                                6
>> -#define CPUID6_EAX_HWP                               BIT(7, U)
>> -#define CPUID6_EAX_HWP_NOTIFICATION                  BIT(8, U)
>> -#define CPUID6_EAX_HWP_ACTIVITY_WINDOW               BIT(9, U)
>> -#define CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE BIT(10, U)
>> -#define CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST         BIT(11, U)
>> -#define CPUID6_EAX_HDC                               BIT(13, U)
>> -#define CPUID6_EAX_HWP_PECI                          BIT(16, U)
>> -#define CPUID6_EAX_HW_FEEDBACK                       BIT(19, U)
>>  
>>  /* CPUID level 0x00000001.edx */
>>  #define cpu_has_fpu             1
>> @@ -179,6 +171,14 @@ static inline bool boot_cpu_has(unsigned
>>  /* CPUID level 0x00000006.eax */
>>  #define cpu_has_turbo           host_cpu_policy.basic.turbo
>>  #define cpu_has_arat            host_cpu_policy.basic.arat
>> +#define cpu_has_hwp             host_cpu_policy.basic.hwp
>> +#define cpu_has_hwp_notification host_cpu_policy.basic.hwp_notification
>> +#define cpu_has_hwp_activity_window host_cpu_policy.basic.hwp_activity_window
>> +#define cpu_has_hwp_epp        host_cpu_policy.basic.hwp_epp
>> +#define cpu_has_hwp_plr        host_cpu_policy.basic.hwp_plr
>> +#define cpu_has_hdc            host_cpu_policy.basic.hdc
>> +#define cpu_has_hwp_peci       host_cpu_policy.basic.hwp_peci
>> +#define cpu_has_hw_feedback    host_cpu_policy.basic.hw_feedback
> 
> The indentation of these final 5 is one-too-few spaces.
> 
> I can't help but feel that notification could be shortened to notify. 
> Except upon looking in the SDM, it's named HWP_INTERRUPT because it
> enumerates MSR_HWP_INTERRUPT.
> 
> Similarly, HWP_PLR is really HWP_REQUEST_PKG because it enumerates
> MSR_HWP_REQUEST_PKG.
> 
> ACTIVITY_WINDOW and EPP are wonky because they're out of order WRT
> PLR/REQUEST_PKG.  It clearly means they all came in together, but have
> SKU controls.
> 
> But I digress.  ACTIVITY_WINDOW can probably be shortened to just
> WINDOW, and that fixes the two egregiously long ones.

To be honest, I see only one of two options: Either we stick to what we had
settled on when the HWP driver went in (switching to acronyms where helpful),
or we strictly follow the SDM. In the latter case I think I will need to
split this patch, for every of the renames to be separate (to be easier to
verify). And the naming decisions then want applying in patch 1 as well.

Unless I hear otherwise (soon), I'll go the "strictly per SDM" route. Still,
the union-or-not question in patch 1 also needs sorting, so I'm dependent
anyway upon you replying in a somewhat timely manner.

Jan

