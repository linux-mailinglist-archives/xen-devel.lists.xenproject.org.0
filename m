Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3AFC5BA9B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 08:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162300.1489997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJnpq-0000SO-Mf; Fri, 14 Nov 2025 07:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162300.1489997; Fri, 14 Nov 2025 07:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJnpq-0000Qc-Jw; Fri, 14 Nov 2025 07:03:06 +0000
Received: by outflank-mailman (input) for mailman id 1162300;
 Fri, 14 Nov 2025 07:03:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YOW=5W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJnpp-0000QW-Ik
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 07:03:05 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f750e15c-c127-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 08:03:04 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b736cd741c1so50307166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 23:03:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734e9e0f20sm332056466b.0.2025.11.13.23.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 23:03:01 -0800 (PST)
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
X-Inumbo-ID: f750e15c-c127-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763103784; x=1763708584; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ci1I6RRmoHdEIRPBTUPpqieBT26GFNnuyI1sHZDQ+o8=;
        b=OJ9C1L/1c3zRlGQPUDuM+e0onKV8AOwjLwjxeDXhR9LRi/awGMDzNzlro9rMzAi3aL
         SBOTkgQ64jq3MjcptOlfCg6fNSsW9F1/ceY6KfXkbvYNTvTcDyq3XRJpQDhKEhFkUgV5
         56FfYWjSqw0YcitdO0B3tMIfQVPnDpXpvAb8a1ShzKDO7bjv51kRUc4I1+b/O/bSYjn1
         S27O8vdtaDgmPxnK91ZhrS6gtC6D5WzSXvMHlj9hQ0pEXu9nFxUQipL3dXPtc9fAsweN
         YVxETvJODaiUzaJTAisNK39UDnOeICoHpBZ+chj1oTfshFE4IEyKAOVlL8nA1M5sKaL1
         L7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763103784; x=1763708584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ci1I6RRmoHdEIRPBTUPpqieBT26GFNnuyI1sHZDQ+o8=;
        b=kUqOdlh3CFlL0LoA6GkgwmQODeeR74jwlV1bZEE6VKl7Sbn4OJ2/Ej/GQ9GjI9JgjG
         nBba1QeYQe2msqbt5DbxF1uvn9xc9zv8QRQmLcEEkHfzatUpX21sYDCb8xyjrw81gCOH
         hlx80P5dIO4M8o5Bwg921xMTxXkE5vb8uTOy8KDSo1yXpCX2GEeI01hcXbLyzXEaReq4
         tQLw4il0sJMh9REyvkmvhwuH2O55zK3buYHOnZ3UXnmd9EDmd1UUVzRqcxFOFfRYo4nz
         GkysaIrE14yEc4wiQgQCCQ4YcUgfXwPNW6dmyYlNG8/XK4OMS9qPKuUeg7+PJ9HCu+kk
         DkYw==
X-Forwarded-Encrypted: i=1; AJvYcCVAfVeed2Wm2mXy1VE8zWP6wL6veV0WEj/Tl3S5bX7w8nIiD2DOL7uAZ0TXp4VCxXZ8PDCFubuMkzI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyerJI+vJbHqHx2W051w5T+X/BtwxB0hs9IfL2BYC1qfcm04MPH
	VErQzHEXhM78rRqkytkNjbDs+TqvP6kVF8o4ec/j3OxmJD+oSxnFXLpK6Z1XNVGp0Q==
X-Gm-Gg: ASbGncskXU7DAQNCM3Hptc2+lnUHjVpAalhxRZHSe4rSZQnZm8BPKA6UFb6Y41w4xWh
	x9W5+kMSrHd2R9BE8XAkxpVj+Qjptg4ndFrGVAS1D1GclEL/8s7Ymm0+nX/BQCxrpby2NvARz3X
	ZH8ueFaDd8kXEkrM/p3lk9kqbpny8mCbTj8rO06+J+3O4d3NFLzIcwazlI3N8eK2v0wpj0oV6Ok
	PiYdiVOQd9ThkZFzFAgzVFRT2ejJ1XXowRt81azCWO42D/9XhE0kUEYy/SifnLqv8/vHnQz+JkS
	oKJip3/utMcakk7Kz2e+FKhnk3cutpCDjj6EknoDB9FhW9SOSNneKIjSuPdNxU9MiJm9L/b0ARg
	BkzQ948LuYAGr0Y/3Q4nvJDiHbKjdNUBUMbahw1byp/jyYDWU8xxuV9zHwymxxz0yfBrFunV3VH
	AepJ+BZNXRmhBZZcZQdH+EZd/zL5sBadFJECHwnWqwUK/A/B+RZZU8NJV27kqnaj9x
X-Google-Smtp-Source: AGHT+IF6yZAVyEftlez0DNDBtoyLpIHUV45NhCv/eexpR9uppRXJlMKrUIbL5kUoXxVp0e3YLHZwNA==
X-Received: by 2002:a17:906:4fc9:b0:b73:56cc:44b2 with SMTP id a640c23a62f3a-b73678f4befmr191585166b.30.1763103782179;
        Thu, 13 Nov 2025 23:03:02 -0800 (PST)
Message-ID: <58870063-297e-42c0-8bdb-ebab339b11ae@suse.com>
Date: Fri, 14 Nov 2025 08:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2] xen: make VMTRACE support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Teddy Astie <teddy.astie@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251112202442.3879997-1-grygorii_strashko@epam.com>
 <a634c192-9ea3-46d9-a087-f0f48a5c2494@suse.com>
 <9c4294ec-906d-4607-8f7d-b5b1bb7e74f2@epam.com>
 <71334f75-d50b-43f4-909b-a27b288ea1aa@suse.com>
 <cbffc389-a97c-4075-9106-b2a7a90b52cc@epam.com>
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
In-Reply-To: <cbffc389-a97c-4075-9106-b2a7a90b52cc@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 21:40, Grygorii Strashko wrote:
> On 13.11.25 14:58, Jan Beulich wrote:
>> On 13.11.2025 13:53, Grygorii Strashko wrote:
>>> On 13.11.25 10:36, Jan Beulich wrote:
>>>> On 12.11.2025 21:24, Grygorii Strashko wrote:
>>>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>>>> @@ -307,6 +307,7 @@ static int vmx_init_vmcs_config(bool bsp)
>>>>>        rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>>>>>    
>>>>>        /* Check whether IPT is supported in VMX operation. */
>>>>> +#ifdef CONFIG_VMTRACE
>>>>>        if ( bsp )
>>>>>            vmtrace_available = cpu_has_proc_trace &&
>>>>>                                (_vmx_misc_cap & VMX_MISC_PROC_TRACE);
>>>>> @@ -317,6 +318,7 @@ static int vmx_init_vmcs_config(bool bsp)
>>>>>                   smp_processor_id());
>>>>>            return -EINVAL;
>>>>>        }
>>>>> +#endif
>>>>
>>>> Initially I was inclined to ask for use of IS_ENABLED() here, but that wouldn't
>>>> work since vmtrace_available isn't an lvalue when VMTRACE=n. Hence why generally
>>>> I think it is better to check the particular identifier in such cases, rather
>>>> than the original CONFIG_* (i.e. "#ifndef vmtrace_available" here). I'm not
>>>> going to insist though, as I expect opinions may differ on this matter.
>>>
>>> Yep. assignment required ifdef wrapping.
>>>
>>> "#ifndef vmtrace_available" will not work out of the box as there are
>>>
>>> "if (vmtrace_available)" in code. So, can't just "not define"/undef "vmtrace_available".
>>
>> I meant this just for the case here, though. Elsewhere you want to stick to
>> checking CONFIG_VMTRACE.
> 
> I'd prefer to keep this part as is. Please tell me if you insist.

I won't insist, first and foremost again because I expect opinions on this
matter would generally differ anyway.

Jan

