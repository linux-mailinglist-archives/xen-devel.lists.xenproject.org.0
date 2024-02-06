Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E8A84B16F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 10:38:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676706.1052936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXHtm-00053q-Ts; Tue, 06 Feb 2024 09:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676706.1052936; Tue, 06 Feb 2024 09:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXHtm-000527-R3; Tue, 06 Feb 2024 09:37:50 +0000
Received: by outflank-mailman (input) for mailman id 676706;
 Tue, 06 Feb 2024 09:37:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXHtk-000520-LZ
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 09:37:48 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6276fda5-c4d3-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 10:37:46 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5114cd44fdbso4043375e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 01:37:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d6-20020a5d5386000000b0033af5086c2dsm1626212wrv.58.2024.02.06.01.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 01:37:45 -0800 (PST)
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
X-Inumbo-ID: 6276fda5-c4d3-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707212266; x=1707817066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9un3fFUe0EdRZG6+nIG7Cnyyr83cTu3bB29nOdSiALU=;
        b=SU6jI8dSsPWi7eabpP3kgWuYxEWiG8JEWDBmcT4yyqeyZePyUX2+Zr9rOwOojdXBIy
         VkgOy+URlaMPVqQ11wx/z5JsiukzVJrSn+nTA/qk4gK0oJlgF6MwAFXwJX9ZVRE+77RH
         aG2L4nhwF+lQx7GeCSpgaZH7hZHQBgi4fB7aHahjKhTQaUCdSv2xCtq9o9rkbkYDggFn
         /XoHcfQOuLJe6NETL3ApuGJiLZL4uO9ZHzsWlITpCp0EFAUVRwJIJOHt3Me1GVg4gvZO
         YumBcLbSBjJ7AVWx3/myge/yW1Xkr0DOyfw3VouERnGb5lzqXIaUUkak0V1vPsO+6/6O
         MkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707212266; x=1707817066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9un3fFUe0EdRZG6+nIG7Cnyyr83cTu3bB29nOdSiALU=;
        b=TAvp4oOOVr0H/QohA93DZMpXFCM/Mtw4zzY4WfFrXjaFaw9qo/Xk1Jv+iXydKU4rXw
         A0mXdjX8ccfqC24/s8kNCSKOGJXKRHs6wcjVyGuBB0PK6ABI1Psot+Gkzw0mAjku93uN
         0uRTiB3ZimW2hKXDz3WZaA79w6WvAL1s+dLl3rik73SxxnnzpLy+o7GA7HK3BpX6YWJS
         Wuk1Owbawr7mg3jyjIch/4zmzSKSyUl1JO8oYmmxBBCgdRKOgvkN9dm7UN0SnGUbuafI
         CtNZ4fKWzjDhJrtIvrpqGfwYj1DK+Sw+55XGpkOv97JmjR07Vbl5iAPrwOc7RkyUPYdh
         7Bzw==
X-Gm-Message-State: AOJu0Ywr8P0xX4aWx0I79s6fxC9h+6uzCgeykYbFluebJlX6euYQT39S
	Ckla4/i2QvWCwWKxDJbFSqC/ZzgpB+KsYD9a0OXPBtn7Ww95Ew4twQIbLEaFBw==
X-Google-Smtp-Source: AGHT+IFKyYlASpDPaTxHBmtUYrRmHkjLup9BqfUxS6DDzuFLiCgufNhQs+hKF2eKd45YHRJcMfwPqg==
X-Received: by 2002:a05:6512:2028:b0:511:4967:9f0a with SMTP id s8-20020a056512202800b0051149679f0amr1358976lfs.57.1707212266076;
        Tue, 06 Feb 2024 01:37:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWSRN+t5t0jQKvBqHzFJ6ZeOpmgadrvi8r3qClWw45C/ctZ0WDwoLpqxvIRZIBcVClDhNVw7pNVq4OXfpj1mBRtgoZnhEqzNbwIp7/kPsoppNliNsDdIq2Ft54Y1H/UBAkbsPSo4A6byPuMrcV1qICeJFePdaFskSi4OksymAMfQPUDew==
Message-ID: <3125dcdd-573a-4bad-a0a2-9c501d94cc82@suse.com>
Date: Tue, 6 Feb 2024 10:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4.5 3/8] VMX: tertiary execution control infrastructure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
 <aa553449-888f-4e52-85b7-0bc0b7f010b4@suse.com>
 <bc782b14-d897-4a94-b71d-97c4abeb85df@suse.com> <ZcH7uwpxwYUq9yR0@macbook>
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
In-Reply-To: <ZcH7uwpxwYUq9yR0@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.02.2024 10:28, Roger Pau Monné wrote:
> On Mon, Feb 05, 2024 at 02:37:44PM +0100, Jan Beulich wrote:
>> This is a prereq to enabling e.g. the MSRLIST feature.
>>
>> Note that the PROCBASED_CTLS3 MSR is different from other VMX feature
>> reporting MSRs, in that all 64 bits report allowed 1-settings.
>>
>> vVMX code is left alone, though, for the time being.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> @@ -2068,10 +2111,12 @@ void vmcs_dump_vcpu(struct vcpu *v)
>>                 vmr(HOST_PERF_GLOBAL_CTRL));
>>  
>>      printk("*** Control State ***\n");
>> -    printk("PinBased=%08x CPUBased=%08x SecondaryExec=%08x\n",
>> +    printk("PinBased=%08x CPUBased=%08x\n",
>>             vmr32(PIN_BASED_VM_EXEC_CONTROL),
>> -           vmr32(CPU_BASED_VM_EXEC_CONTROL),
>> -           vmr32(SECONDARY_VM_EXEC_CONTROL));
>> +           vmr32(CPU_BASED_VM_EXEC_CONTROL));
>> +    printk("SecondaryExec=%08x TertiaryExec=%016lx\n",
> 
> I thought you wanted to split the print into two 32bit halves here?

Indeed I wanted to, but when about to do so I noticed several other
uses of %016lx in the same function. I value consistency higher here;
if we want to introduce such splitting, I think we want to do it
uniformly. And then we may even want to think about possible ways of
indicating the desire for such splitting right in the format string.

Jan

