Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6138568E7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 17:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681901.1060900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raeHC-0003bC-Un; Thu, 15 Feb 2024 16:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681901.1060900; Thu, 15 Feb 2024 16:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raeHC-0003YN-RJ; Thu, 15 Feb 2024 16:07:54 +0000
Received: by outflank-mailman (input) for mailman id 681901;
 Thu, 15 Feb 2024 16:07:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raeHC-0003YH-3z
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 16:07:54 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f82b2bc-cc1c-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 17:07:53 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-411f895c8b6so9038675e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 08:07:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hg27-20020a05600c539b00b0040fc56712e8sm2341350wmb.17.2024.02.15.08.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 08:07:52 -0800 (PST)
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
X-Inumbo-ID: 5f82b2bc-cc1c-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708013272; x=1708618072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3CDoS0ibWubzHiJ00+gQSX3l991Mbf6fIF8GroC3PN0=;
        b=VKm8qpCnmL7o9FxWly8XqyE95lfpLeSNh887M66lkfz5qSng+5Ij2OLJp8KrQMf3Q7
         N2ys9xudnvX2Q/MVaebYFdUUL+BHGG4yDsdjwCsbebT/8EOQEPrJu9Lv0M/jodB+9Cew
         nhjKi1gOV43Zew8027nbLqfHDP7zMV752DV3tFk0Lq5PMoK0tAisnf4WY1B6myNBmb5S
         ayVS6MRSZ7GpOrWlSnWf3FCcXl9eOaId/Fx/EHnKOXd9U3ApCRodN85Vk5sEoVYfdKCa
         WF3Upxj2YEbSRMptB7geZOw07hCi0kcqBE5jAbWDmv8XfvE2ybWFqKgKjc+tvmInl58Z
         njiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013272; x=1708618072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3CDoS0ibWubzHiJ00+gQSX3l991Mbf6fIF8GroC3PN0=;
        b=oxkF/kvSbm0QCFi+6CaRh4jX6Z6qbIGVhMfoO2lZyqR4oqew+wemVf/bBm59/Mhvou
         KMeX+bTYxE5rNqHoxHlmFe4Fd2UHPQYk2AV7vDWaJOHvfCZAsG9u0ggooVwcWlBQLFgv
         M1BrZYfbtdJRuU9N5qy5fr/W9Wkn/jnbkVjsYBfo2h903zK1nAHtPtHHVJQlohp6eILP
         EGOkuvQ7T0GImF4yXWyJBf83iLJPnYSTGMMyg/4MoThvs2O1DyWJUKqcButXwnJX4MB0
         dbb2KL6V8KnYeBy0GGfRdOT/f9bdVk06flNzsYvlCNYBwu2u4/HSuRbb6kRwc1uJqnBs
         cW3g==
X-Forwarded-Encrypted: i=1; AJvYcCVI3MKVaVLIa90e2hiqbV0+zfcqFHMtbkvK5Su/2n68P2LX133rT3WUykthr6KcZu6FkbXWg6GYHARM67Dh1tM6o7gCh4SI0pXdfFIEwqs=
X-Gm-Message-State: AOJu0YxpoXtaUyXkktl0oxHrXwtvFOyN568mkpwbyIHvznOMpP1KKMDq
	0oPZ0amE9zCVJIZK7KmmA9PfKSGr8oRW5msR7DTiWjTFsa83XZgpVHmFCdErcA==
X-Google-Smtp-Source: AGHT+IGcZ9P0nWTcyapnKtbaY1mV7T34TaEf7To7XFROE/A7E8/314DXM8uP1ObMDmtpZr7LSomjjg==
X-Received: by 2002:a05:600c:218f:b0:411:f0c2:8877 with SMTP id e15-20020a05600c218f00b00411f0c28877mr1776998wme.38.1708013272485;
        Thu, 15 Feb 2024 08:07:52 -0800 (PST)
Message-ID: <67306bde-9877-4d6d-a964-3ea964256ce4@suse.com>
Date: Thu, 15 Feb 2024 17:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vmx: add support for virtualize SPEC_CTRL
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240209114045.97005-1-roger.pau@citrix.com>
 <09cf678e-bdbd-47a9-8c9d-533e7bee9450@suse.com> <Zc4zyLgM-OUNc6xG@macbook>
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
In-Reply-To: <Zc4zyLgM-OUNc6xG@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.02.2024 16:54, Roger Pau Monné wrote:
> On Mon, Feb 12, 2024 at 03:09:01PM +0100, Jan Beulich wrote:
>> On 09.02.2024 12:40, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -823,18 +823,29 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
>>>      {
>>>          vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
>>>  
>>> -        rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
>>> -        if ( rc )
>>> -            goto out;
>>> +        if ( !cpu_has_vmx_virt_spec_ctrl )
>>> +        {
>>> +            rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
>>> +            if ( rc )
>>> +                goto out;
>>> +        }
>>>      }
>>>      else
>>>      {
>>>          vmx_set_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
>>>  
>>> -        rc = vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
>>> -        if ( rc && rc != -ESRCH )
>>> -            goto out;
>>> -        rc = 0; /* Tolerate -ESRCH */
>>> +        /*
>>> +         * NB: there's no need to clear the virtualize SPEC_CTRL control, as
>>> +         * the MSR intercept takes precedence.  The SPEC_CTRL shadow VMCS field
>>> +         * is also not loaded on guest entry/exit if the intercept is set.
>>> +         */
>>
>> It wasn't so much the shadow field than the mask one that I was concerned
>> might be used in some way. The shadow one clearly is used only during
>> guest RDMSR/WRMSR processing. To not focus on "shadow", maybe simple say
>> "The SPEC_CTRL shadow VMCS fields are also not ..."?
> 
> What about:
> 
> "The SPEC_CTRL shadow and mask VMCS fields don't take effect if the
> intercept is set."

SGTM.

Jan

