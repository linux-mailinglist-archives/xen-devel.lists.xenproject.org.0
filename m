Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FA1C2013A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 13:48:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153644.1483935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vES4R-0006r8-Lt; Thu, 30 Oct 2025 12:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153644.1483935; Thu, 30 Oct 2025 12:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vES4R-0006ph-JF; Thu, 30 Oct 2025 12:48:03 +0000
Received: by outflank-mailman (input) for mailman id 1153644;
 Thu, 30 Oct 2025 12:48:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vES4Q-0006pb-UP
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 12:48:02 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aadadb60-b58e-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 13:48:00 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so611308f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 05:48:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718489d96sm70084445e9.0.2025.10.30.05.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 05:47:59 -0700 (PDT)
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
X-Inumbo-ID: aadadb60-b58e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761828480; x=1762433280; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qiMh6+BrJmGkqDAvdfW8fm7PzhCrfXZ5EAPxmDDQYag=;
        b=QANJHzFLJLzuhch1wnorkdxOk6SL8BA+HcrntnEsHdhCZcUQ3PYrUNMASK67rc2sGu
         Kupe2qJ64TSXJeUNTcqPG3kD54aVMEOT1O9QQnTSwm8IhcYkAIjf6BF8NVEikZBv+9BH
         lZ6jx5Utg26b9oW7s1VaehkrvnKf3RaSHqUn85/Sh1+IETEqQZ+DxVlPDL0t+f7NXnEi
         yuenYC0MSxeSHjNV8zltXdkK89Mou2aQWLG14Ck7UcxoN26iZjYBkYiHZEJKHcmLyLOR
         KBE2WoXRwMYEcuFY3Sh/nLZ6lmokvXkBuVmsRS3GajLj5YH00n6MlpgWJgzdBKtrkY2u
         +9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761828480; x=1762433280;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiMh6+BrJmGkqDAvdfW8fm7PzhCrfXZ5EAPxmDDQYag=;
        b=o25D0NzI5/1hqlayuZvezpqipLyO/Y0oDCIk2V+pSAr6Mgm4oKZ3LPG+pwypf5FvAu
         edZAqbSbJiVyx3dT6e2qJGzXflbl1c/NDjFq6RGx3+0ZyLm1VF6HvsNCiGNWnxlW4a+g
         8v88mDc9qDGGLAvJKspcLK8qCjdu+VypdSepsObPMQp/SGWQYpQoPm1wJvONYKEn8LxQ
         iXdfO/KJQkRynhEzD6EDG1TE3aRJFA01JlmoGoIXRxmL6BxDiqh2+PWZJbqECdRd7yIc
         bUXlwBrebq22Z7LZXxzPYgBHpmH427jWT9PON5IJk3Y5tJDyI8/03MJQloG3zCufHN3E
         2mkg==
X-Forwarded-Encrypted: i=1; AJvYcCX4ncL52LuxADzUEbAW3d7sQ7OyP2di+tO7Cm9KVbUyU14oIokKmAbOugFJt6gg6jV28OdUHBeX4+Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyueFfIdZc39ce+nnBu5Ztxzo1BsHm5IkNlAPVeWAI7KBICxah
	lWdyb/EMIchsoNAZwgi92Yy9mORuCD69WgvKwjcI2B071iSEdiWim+AJ0cAK8RLkeQ==
X-Gm-Gg: ASbGnct1rtZrZw+yj+T0/DroqlhyROlJCqFqTFi6OSGWmnYIRMoop5LntxyC8NQh14E
	spE9RtKwpyebfbkMj3/2pL7lLh1k0ov8e1At/2UoNrUeRdHeR1s8TZdBdJ03wHwyhgpULR98nIP
	dlaZEID3E1fiGBFVTo1BgMlJV8jj+w7SqCuTxuXZQJQliTKZQ0CtMBhKc6c6Qp12Ie7K+U11Fn+
	D4DwpvGjBalFnI0nLByhmvIqnj9xVu19qb/dw+Epl6iGzpkQliUYagJIIp9PecCJYdm1kH+i04a
	F8xX2XeARs/3XIBx7jBdpjMU/KCDloxJniZ/xPB7dqnOjEj0dlRgEJBTW96AqmOUBLxzqVMD1y8
	25VRrLU54iYeXZF6DYR/tFyumAyXQittlFHw0iuVsXSYHACGwf6mAvsojr9dsBcQd3dOzoYjm0Y
	Vd2sZ0BgqGq5ZqtcgkwUj1pFbpcoCyz1DEadHHNLpwZX31QgktNQuTa9XjkZKU
X-Google-Smtp-Source: AGHT+IGheiIVxqYxX3K25wZYGMZ/MlfgDZjBw6vXX9XmlIMAMoHA1T7oQk4svOHjws3aoaJb+CMibA==
X-Received: by 2002:a05:6000:238a:b0:405:3028:1bf0 with SMTP id ffacd0b85a97d-429aef77e43mr5578972f8f.10.1761828479915;
        Thu, 30 Oct 2025 05:47:59 -0700 (PDT)
Message-ID: <7f321809-5635-4993-b435-7707b21e6378@suse.com>
Date: Thu, 30 Oct 2025 13:47:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 1/3] x86/hvm: move hvm_shadow_handle_cd() in vmx code
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251029235448.602380-1-grygorii_strashko@epam.com>
 <20251029235448.602380-2-grygorii_strashko@epam.com>
 <308ecf14-e831-47f4-8c64-4005bb4dc857@suse.com>
 <6373016f-9558-4d73-918e-4251d16643ef@epam.com>
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
In-Reply-To: <6373016f-9558-4d73-918e-4251d16643ef@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.10.2025 13:28, Grygorii Strashko wrote:
> On 30.10.25 13:08, Jan Beulich wrote:
>> On 30.10.2025 00:54, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Functions:
>>>   hvm_shadow_handle_cd()
>>>   hvm_set_uc_mode()
>>>   domain_exit_uc_mode()
>>> are used only by Intel VMX code, so move them in VMX code.
>>
>> Nit: I think both in the title and here you mean "to" or "into".
>>
>>> While here:
>>> - minor format change in domain_exit_uc_mode()
>>> - s/(0/1)/(false/true) for bool types
>>>
>>> No functional changes.
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> You did read Andrew's request to also move the involved structure field(s),
>> didn't you? Oh, wait - maybe that's going to be the subject of patch 3. 
> 
> yes. it is patch 3 - It is not small.
> And I really wanted this patch to contain as less modifications as possible on
> top of code moving.

I wonder what other x86 maintainers think here.

>> While
>> often splitting steps helps, I'm not sure that's very useful here. You're
>> touching again immediately what you just have moved, all to reach a single
>> goal.
>>
>>> @@ -1421,6 +1422,64 @@ static void cf_check vmx_set_segment_register(
>>>       vmx_vmcs_exit(v);
>>>   }
>>>   
>>> +/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill. */
>>> +static bool domain_exit_uc_mode(struct vcpu *v)
>>> +{
>>> +    struct domain *d = v->domain;
>>> +    struct vcpu *vs;
>>> +
>>> +    for_each_vcpu(d, vs)
>>> +    {
>>> +        if ( (vs == v) || !vs->is_initialised )
>>> +            continue;
>>> +        if ( (vs->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) ||
>>> +             mtrr_pat_not_equal(vs, v) )
>>> +            return false;
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>> +static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
>>> +{
>>> +    v->domain->arch.hvm.is_in_uc_mode = is_in_uc_mode;
>>> +    shadow_blow_tables_per_domain(v->domain);
>>> +}
>>
>> Similarly I wonder whether this function wouldn't better change to taking
>> struct domain * right away. "v" itself is only ever used to get hold of
>> its domain. At the call sites this will then make obvious that this is a
>> domain-wide operation.
> 
> Agree. but..
> In this patch I wanted to minimize changes and do modifications step by step.
> 
> I can add additional patch such as "rework struct domain access in cache disable mode code".
> Will it work?
> 
>>
>>> +static void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
>>> +{
>>> +    if ( value & X86_CR0_CD )
>>> +    {
>>> +        /* Entering no fill cache mode. */
>>> +        spin_lock(&v->domain->arch.hvm.uc_lock);
>>> +        v->arch.hvm.cache_mode = NO_FILL_CACHE_MODE;
>>> +
>>> +        if ( !v->domain->arch.hvm.is_in_uc_mode )
>>> +        {
>>> +            domain_pause_nosync(v->domain);
>>> +
>>> +            /* Flush physical caches. */
>>> +            flush_all(FLUSH_CACHE_EVICT);
>>> +            hvm_set_uc_mode(v, true);
>>> +
>>> +            domain_unpause(v->domain);
>>> +        }
>>> +        spin_unlock(&v->domain->arch.hvm.uc_lock);
>>> +    }
>>> +    else if ( !(value & X86_CR0_CD) &&
>>> +              (v->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) )
>>> +    {
>>> +        /* Exit from no fill cache mode. */
>>> +        spin_lock(&v->domain->arch.hvm.uc_lock);
>>> +        v->arch.hvm.cache_mode = NORMAL_CACHE_MODE;
>>> +
>>> +        if ( domain_exit_uc_mode(v) )
>>> +            hvm_set_uc_mode(v, false);
>>> +
>>> +        spin_unlock(&v->domain->arch.hvm.uc_lock);
>>> +    }
>>> +}
>>
>> This function, in turn, could do with a local struct domain *d.
>>
>>>   static int cf_check vmx_set_guest_pat(struct vcpu *v, u64 gpat)
>>>   {
>>>       if ( !paging_mode_hap(v->domain) ||
>>
>> Why did you put the code above this function? It's solely a helper of
>> vmx_handle_cd(), so would imo best be placed immediately ahead of that one.
> 
> Right. Hence vmx_x_guest_pat() are also used by vmx_handle_cd() I decided to put before them.

The main purpose of vmx_set_guest_pat() is, however, its use as a hook function.
It's merely an optimization that the function is called directly by VMX code.

>> Bottom line: The change could go in as is, but imo it would be nice if it
>> was tidied some while moving.
> 
> I'd be very much appreciated if this could happen.

"this" being what out of the two or more possible options? (I take it you mean
"could go in as is", but that's guesswork.)

Jan

