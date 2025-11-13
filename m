Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29873C57805
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:58:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161346.1489314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWtu-0005Tz-RD; Thu, 13 Nov 2025 12:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161346.1489314; Thu, 13 Nov 2025 12:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWtu-0005SP-Nq; Thu, 13 Nov 2025 12:58:10 +0000
Received: by outflank-mailman (input) for mailman id 1161346;
 Thu, 13 Nov 2025 12:58:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJWts-0005SJ-Tw
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:58:08 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6612f71d-c090-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:58:07 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b72cbc24637so135977766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 04:58:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd80a6dsm158972266b.47.2025.11.13.04.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 04:58:06 -0800 (PST)
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
X-Inumbo-ID: 6612f71d-c090-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763038686; x=1763643486; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i58DwYmRHS+Tw6iXL/b4HOMEONUYegxrqQ2t4H5pgeU=;
        b=geUgrW4YPo2XcIsS7AL1Vp/j21LZVD4/gc6eA2MNY7NsbQNydI4ppFBTfJSxM+4LfE
         /RHyAq021aY5TcgHBOTp7qwLEJ33ag3b0SLUDw93LuIdSkG9EtdYSSjKqlPuEJ/eTVWe
         6ZdcQx9C01wDLKCDHXP2/6DNqEkhOxjVh+R6i4iJpSO3n/TlRkt+DQnR89Fzeavq976R
         PfLrymFFrw4k2jk+KV58jI+zZm3GW0/wDWjwCe21iD/20zs3OXYsikMIN6+cGBIoqFqD
         qnUHkN3Gl7zRecFVIuNQLEYcbHFag1jq2Scrh71ImJoCCou0MgpOzvfWMS2jt16+ydXk
         E08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763038686; x=1763643486;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i58DwYmRHS+Tw6iXL/b4HOMEONUYegxrqQ2t4H5pgeU=;
        b=KHuzuh6IOIvO2wIp5bXFY9ZpsC5chw1R1Yj520H+ep1Xj8y0fg3squNBixuqYhJsyv
         yWuEutK4yeVsUvuEDkbOPOS197TkgN80yNZjNf/Vcrzesjpz4AbEQ613KOz8Lp8JMdJz
         P8tYh57eF/pODhmJVB8kLOz8FXm93a9V7riBxWJ+Pjq2N4xiqQqzRsYXxEUwxBBcX77a
         nHTtI3iwHh+/nVaeJErB+z6Fqsf1vIkb91moyGXND+4qG6xONnlFOaCgjyeGZVif0lXB
         noleb8QE8SL5zOhWr209q3PC20hjEOmEMB07203wEOZCre8+Z364jDJG01r9XPnuVJ4p
         ajCA==
X-Forwarded-Encrypted: i=1; AJvYcCW7BqAbPn+GUJZf2vHIx7qmVIbhRDV/3wqNdH72BogHD+EUkpVZ/blkmK1oorzHSKW9ndd0V0eXLbw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWzwj4SitfFPmwEDROEtvpHuAzvAycVeQs5O02oDpzPpkjl4Q9
	KywaqR7fQeXMnsWEKpZIQjBEELXg9lOT2MRFceW+4NiX00cX20SRva/MGs10OEBWjw==
X-Gm-Gg: ASbGnctEhU2Qm20CJ2zjhUfQpfEBwk0k9kBl+PCRrlcb54+iuartXFpz9gIa1yyd+fk
	mU22uCx3IuGS7WAc7ZPZsZj2xjPWwXDBhs51jmkSSeubGKzyWcLyo30KjKSSnR9wvTLY6aLBAfF
	yXILIgs3fyR4ovHp6vTMTweQSzLkywJ5K7r40XV9BLdw4QtH7GZjEpuscitP0wAS3HV7/m0fNki
	0vesbuL9/VuzTL2bNAQ+7lfiXJUbS5FSe8cwQB2Y2f/gSPCA46wruQ/jmV1Nevug8epyPbLNYl1
	dIYFbiSExctjKDXM+6YfB6eWg4ZlT9rY8L6+d6kyg97x8De8Ow7QnsknaRHQLN0LFOf0EYvKxwW
	f05CsNEbHGm/aRxW0gVmASFWDhw5nh7oUoGd1JJU5BWzMZTh+xTj+d7wznRjStwC/vlIkRN72zv
	AmFV4gRJefmE6HVAIjXHLh4cinv5Mff4/2QoYnIsKio2kihhHv87w4kfsx48QVuhXAsAHQbzr/5
	7Ng8J7c28TPXg==
X-Google-Smtp-Source: AGHT+IHyBbzlNQEcKfSUrnkmhf6XqfDO7FZaHtgzB8j2tVyHvVRDmDi6d9oSLMdSzbLw0yzyNo66VQ==
X-Received: by 2002:a17:906:f58c:b0:b73:5acd:4650 with SMTP id a640c23a62f3a-b735acd47e4mr79844166b.23.1763038686365;
        Thu, 13 Nov 2025 04:58:06 -0800 (PST)
Message-ID: <71334f75-d50b-43f4-909b-a27b288ea1aa@suse.com>
Date: Thu, 13 Nov 2025 13:58:04 +0100
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
In-Reply-To: <9c4294ec-906d-4607-8f7d-b5b1bb7e74f2@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 13:53, Grygorii Strashko wrote:
> On 13.11.25 10:36, Jan Beulich wrote:
>> On 12.11.2025 21:24, Grygorii Strashko wrote:
>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>> @@ -307,6 +307,7 @@ static int vmx_init_vmcs_config(bool bsp)
>>>       rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>>>   
>>>       /* Check whether IPT is supported in VMX operation. */
>>> +#ifdef CONFIG_VMTRACE
>>>       if ( bsp )
>>>           vmtrace_available = cpu_has_proc_trace &&
>>>                               (_vmx_misc_cap & VMX_MISC_PROC_TRACE);
>>> @@ -317,6 +318,7 @@ static int vmx_init_vmcs_config(bool bsp)
>>>                  smp_processor_id());
>>>           return -EINVAL;
>>>       }
>>> +#endif
>>
>> Initially I was inclined to ask for use of IS_ENABLED() here, but that wouldn't
>> work since vmtrace_available isn't an lvalue when VMTRACE=n. Hence why generally
>> I think it is better to check the particular identifier in such cases, rather
>> than the original CONFIG_* (i.e. "#ifndef vmtrace_available" here). I'm not
>> going to insist though, as I expect opinions may differ on this matter.
> 
> Yep. assignment required ifdef wrapping.
> 
> "#ifndef vmtrace_available" will not work out of the box as there are
> 
> "if (vmtrace_available)" in code. So, can't just "not define"/undef "vmtrace_available".

I meant this just for the case here, though. Elsewhere you want to stick to
checking CONFIG_VMTRACE.

>>> @@ -735,6 +737,7 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
>>>   bool altp2m_vcpu_emulate_ve(struct vcpu *v);
>>>   #endif /* CONFIG_ALTP2M */
>>>   
>>> +#ifdef CONFIG_VMTRACE
>>>   static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
>>>   {
>>>       if ( hvm_funcs.vmtrace_control )
>>> @@ -769,13 +772,20 @@ static inline int hvm_vmtrace_get_option(
>>>   
>>>       return -EOPNOTSUPP;
>>>   }
>>> +#else
>>> +int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos);
>>> +#endif
>>
>> There not being any definition for this declaration (regardless of configuration),
>> a comment might have been warranted here. 
> 
> /* Function declaration(s) here are used without definition(s) to make compiler
>     happy when VMTRACE=n while all call sites expected to be protected by ifdefs or
>     IS_ENABLED() guards, so compiler DCE will eliminate unused code and overall
>     build succeeds */
> 
> a little bit long :( ?

Yes. I'm sure you can shorten this quite a bit.

>> Furthermore, can't the stub further down
>> in the file now go away (addressing a Misra concern of it now being unused, as
>> HVM=n implies VMTRACE=n)? Possibly this applies to a few other stubs there as
>> well?
> 
> You are talking about HVM=n stubs here, right?

Yes. Are there any others there?

>>>   static inline int hvm_vmtrace_reset(struct vcpu *v)
>>>   {
>>> +#ifdef CONFIG_VMTRACE
>>>       if ( hvm_funcs.vmtrace_reset )
>>>           return alternative_call(hvm_funcs.vmtrace_reset, v);
>>>   
>>>       return -EOPNOTSUPP;
>>> +#else
>>> +    return 0;
>>> +#endif
>>>   }
>>
>> This doesn't look right - if absence of a hook results in -EOPNOTSUPP, so should
>> VMTRACE=n do. (There's no practical effect from this though, as - perhaps wrongly -
>> neither caller checks the return value.)
> 
> It might be a time to make it void() - what do you think?

Possibly (in a separate patch). I didn't check the call sites, though, i.e.
I can't exclude that the return value ought to be checked there instead.

Jan

