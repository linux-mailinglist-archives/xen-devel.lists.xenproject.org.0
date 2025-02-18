Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EABA3A0A5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 15:59:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891849.1300866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkP40-0005xJ-Up; Tue, 18 Feb 2025 14:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891849.1300866; Tue, 18 Feb 2025 14:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkP40-0005u5-Px; Tue, 18 Feb 2025 14:59:08 +0000
Received: by outflank-mailman (input) for mailman id 891849;
 Tue, 18 Feb 2025 14:59:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkP3y-0005q8-V8
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 14:59:06 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5a3c040-ee08-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 15:59:05 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ab78e6edb99so846338766b.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 06:59:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb77551c60sm665200666b.63.2025.02.18.06.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 06:59:04 -0800 (PST)
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
X-Inumbo-ID: e5a3c040-ee08-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739890745; x=1740495545; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3vYnN60prt1wcX/7qsGrr+zj6vFYHdrLM/BScpvlN1c=;
        b=W5b7b1jktW+6rsbnKM4cvjrAvaK3GXwTaqnl/j2ZozxVaHq/1V5qW5pFElC1ymqNIq
         o/V/rp02W66x8xPtjeFKp0CklK5u2qFSl/yWM9G+KnqTNHbgl84cgZdIXYokogwLPPWe
         Oy7qBdTz/HtKpRGvAnJFxX5iYEZxNwkX9OHinjjbw/kxKOA/Bvev4OR6mmGYHXQ2HpPM
         iermogWAQkmjmPWILIBntjUty6YnVL86iaBY1GQ6WqXu9no2F/MSvhRgnCCbx+fy3+as
         +TD6PzIvogCUZKU2yGS5G2bw2Dyfk56DKU/Up/lKZnkjm1bWJ1uVF9WD0cjy2Wxft+/a
         dHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739890745; x=1740495545;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vYnN60prt1wcX/7qsGrr+zj6vFYHdrLM/BScpvlN1c=;
        b=q3x+pGIbAVTkpE5pdklSgQC9qMLubPDnoJW6prOuhOR1L1pw1VwBkG6lOBpk074Ier
         /YsonG/ti+uERv3SMfCb2Zl1CErRQDFMHWSlwmqcGAsevQQy/mB0x5HNu6S5gToW3WVs
         ijZTufvIItGCPTzaLcS1hynWOWzJ2JK3C1aSVpN800P9hQq/7oZVBR+owxrxTyScH6HF
         iGQsEbzs99NEF95sYlbUJHVK9OWGCDI/2jdibuQuJIEc5vObNQncSQ7sVuCxRIWHyuwb
         //gLB6zIfHVy2ipb0p6VZWBkUUo7pVNvuRZfa9LqJGtbm1o7OIgDBIe4hT9zUGUakQ0Q
         bWDw==
X-Forwarded-Encrypted: i=1; AJvYcCXU0iFCcTjLyh+JVmpDNaQd+6cKreIiYNTz6GWMgTDqS5Olc785rbnLJ6QErN8q1Sqk7V1IHYQtzRM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yymt0qZehzS395oL4JrCiAPRCJi2RUuDoFJWf5i9dwxCqvSWKKX
	gRO0Mgbfdzb5mjZUyLcKztynY41+q4Ue/w52qyGhLsN7CQ9v5cY55EyYvI0tBw==
X-Gm-Gg: ASbGncscBCe2eWmBog+JMUF4ggsjnYkOxHQZTWBIjEcWogJaNQvCM3SwVXe6t7bEvFh
	73YKCVKVKwwL/ZqfQk18O2HHYtMImk7rN4Xx/7JOTbcJ2EbBhjdCxddef3DXzFr1mXWPr+TVKEL
	w/aMI9LxaVDLVXAThTRY13MLF/Qlr5XPbWIZhrX9itYXdml81iU4jWVmMWqI1RcglAoDBppXj0p
	nFjoeAKf9qFuczAA07ZXT3nMkIDWhBZWEXAwe6/Exwfsj+5qjhWeqW6LJw12aB7JGFhc6QRVgvF
	1QR4KLH0pJQb1N8jc0ikVs5VfDjpDcAxC4uOYcDKwrvjLdug+/VlZHzN/HmKWM55TbWoSvh41cy
	h
X-Google-Smtp-Source: AGHT+IGb7XCD7aLCYMKHMs/7MloRWWntejk11tTFAw7xtp3FlreHwFxblqKlGRiHeZbBY2zBwTEq1g==
X-Received: by 2002:a17:907:da4:b0:ab7:ea47:ded1 with SMTP id a640c23a62f3a-abb70dce167mr1168069566b.47.1739890744656;
        Tue, 18 Feb 2025 06:59:04 -0800 (PST)
Message-ID: <6200aaee-25cf-4fe1-b71b-b8a0a3798afc@suse.com>
Date: Tue, 18 Feb 2025 15:59:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] xen/amd: export processor max frequency value
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
 <Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-5-Penny.Zheng@amd.com>
 <5d19f9a6-2be8-4a69-a9c8-19a0e4196e44@suse.com>
 <DM4PR12MB8451598930C730001060B1DEE1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451598930C730001060B1DEE1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.02.2025 07:14, Penny, Zheng wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, February 11, 2025 9:57 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andryuk, Jason
>> <Jason.Andryuk@amd.com>; Andrew Cooper <andrew.cooper3@citrix.com>;
>> Roger Pau Monné <roger.pau@citrix.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v2 04/11] xen/amd: export processor max frequency value
>>
>> On 06.02.2025 09:32, Penny Zheng wrote:
>>> --- a/xen/arch/x86/cpu/amd.c
>>> +++ b/xen/arch/x86/cpu/amd.c
>>> @@ -56,6 +56,8 @@ bool __initdata amd_virt_spec_ctrl;
>>>
>>>  static bool __read_mostly fam17_c6_disabled;
>>>
>>> +DEFINE_PER_CPU_READ_MOSTLY(uint64_t, max_freq_mhz);
>>
>> Such an AMD-only variable would better have an amd_ prefix.
>>
>>> @@ -669,7 +671,12 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
>>>             printk("CPU%u: %lu ... %lu MHz\n",
>>>                    smp_processor_id(), FREQ(lo), FREQ(hi));
>>>     else
>>> +   {
>>>             printk("CPU%u: %lu MHz\n", smp_processor_id(), FREQ(lo));
>>> +           return;
>>> +   }
>>> +
>>> +   per_cpu(max_freq_mhz, smp_processor_id()) = FREQ(hi);
>>
>> this_cpu() please, or latch the result of smp_processor_id() into a local variable
>> (there are further uses in the function which then would want replacing).
>>
>> The function has "log" in its name for a reason. Did you look at the conditional at its
>> very top? You won't get here for all CPUs. You won't get here at all for Fam1A
>> CPUs, as for them the logic will first need amending.
> 
> Sorry to overlook that
> Then I shall add a specific amd_export_cpufreq_mhz to cover all scenarios...
> For Fam1A, I could think of bringing back early DMI method right now...

How reliable is DMI data going to be? Not to speak of it being available
everwhere.

> May I ask what is the more addressed specific reason for not applying to Fam1A?

I'm sorry, I may not understand the question. What I understand was already
addressed by me having said "for them the logic will first need amending".

Jan

