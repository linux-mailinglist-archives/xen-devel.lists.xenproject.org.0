Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD0E845701
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 13:10:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674379.1049219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVVsa-0005uN-J2; Thu, 01 Feb 2024 12:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674379.1049219; Thu, 01 Feb 2024 12:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVVsa-0005sP-GI; Thu, 01 Feb 2024 12:09:16 +0000
Received: by outflank-mailman (input) for mailman id 674379;
 Thu, 01 Feb 2024 12:09:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVVsY-0005sJ-Os
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 12:09:14 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6984565-c0fa-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 13:09:13 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40fc22f372cso1963085e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 04:09:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c4f5500b0040fb03f803esm4285986wmq.24.2024.02.01.04.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 04:09:12 -0800 (PST)
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
X-Inumbo-ID: b6984565-c0fa-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706789353; x=1707394153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tH/k2x+4r+PxB4CU+/h65fC4pUhID4rLTMIEaTjk6kc=;
        b=N1ybM8BjZTsNbZJVm2PRgBJ68eC9SFowJseY04ZE6tzDoMtYuyX7MAB019B3hPtys7
         4IcVZj1nxIY/2zPutO5zI2Rf2CumrEiepycntX7/d/4uGXzzO0N4ZhlalIUdtT+v7toE
         jmzLSiJH/wnjtyKj1d2iofJ8+ZPHeyLkYUEBy0i5epGiPvuQuD39EO+EQruuTPtEVkNW
         B/3x07UrjqRumjKibespMtYf64UlrappmbRlGzJdKUi+t4j/ZT8yFg082dn49gcqFv/Y
         pcZZP7fBuIMPDI4DeQntvepG2SsDYDBNRZDAdaLlKnEzhtHFDfFvRE0jNtst42mtdTxv
         n9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706789353; x=1707394153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tH/k2x+4r+PxB4CU+/h65fC4pUhID4rLTMIEaTjk6kc=;
        b=Kv+WxlcD2LLq+0Br+U4h9wQyRMB1X3mRZxoilawig/kO0ePCk6s3yIQYgwWojTYFDT
         ow211IFMwQl7nsTBt6GPxe2bPRAaE7IvwZFEQdh+eOTxGHDi31JOPzS1LC+UYBVBruRE
         +cMtlDgLb5rtIpDdJIgA/iniI3KR2CX06lDuEOaqalUhnW++MbzcQJfDD3A+useOvOZB
         UXReXNyo18vAxjv3GehZiRzk95mX5icRA9dLQebaiaOnesTSYvwUOhh+qMzxYywYwgp9
         cy3D1eMaRWvXQ1tbXBEgcfXrHPA1GZlFpPnFMyjJAJfaLM70+swg3MQvxFL6ZAmVHQHq
         PinQ==
X-Gm-Message-State: AOJu0YxGBmyVIVR100qH72SS/DjDNgQ5mt3RbLDh3N0t96PwPICYFMSK
	RT1jrqntFTzc9VSD6hnMWQhb1xgxiDv2jhevQZNt8pOipkG6OuiZg/UJaj4jaA==
X-Google-Smtp-Source: AGHT+IFh1Xug2JOLJu4UIO6rBKLgHJ8iKOfKC4MlaViuy7J+pQcLHi7b+niGlM2CJVtBIroCGY1lMw==
X-Received: by 2002:a05:600c:4288:b0:40e:fbc8:401 with SMTP id v8-20020a05600c428800b0040efbc80401mr4018713wmc.20.1706789352844;
        Thu, 01 Feb 2024 04:09:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCURuCvjHFZf6Q2hgZhVvg+SRJ3Jz4SHOk7TUi/MvgeKj79V3sTzZ+/dSh3NnjcK+sLZKofsVwBge2HzDit2M86H4Uw5ujpMuMCpwqIwYQfDbzLTENUpiMlbxTP2q7QOzbVPkfr/wVqmHluT5J3qJ/vHKBq9HKGGe8rq73uGFcirSSJ5Vw==
Message-ID: <56822f9c-6156-4652-9de1-3d599e22c51a@suse.com>
Date: Thu, 1 Feb 2024 13:09:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] VMX: tertiary execution control infrastructure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>
References: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
 <aa553449-888f-4e52-85b7-0bc0b7f010b4@suse.com> <ZbuFc-ha-iv6B9ui@macbook>
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
In-Reply-To: <ZbuFc-ha-iv6B9ui@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.02.2024 12:50, Roger Pau Monné wrote:
> On Thu, Jan 11, 2024 at 10:00:10AM +0100, Jan Beulich wrote:
>> @@ -503,6 +538,9 @@ static int vmx_init_vmcs_config(bool bsp
>>              "Secondary Exec Control",
>>              vmx_secondary_exec_control, _vmx_secondary_exec_control);
>>          mismatch |= cap_check(
>> +            "Tertiary Exec Control",
>> +            vmx_tertiary_exec_control, _vmx_tertiary_exec_control);
> 
> I know it's done to match the surrounding style, but couldn't you move
> the name parameter one line up, and then limit the call to two lines?
> 
> (I don't think it will compromise readability).

You mean like this:

        mismatch |= cap_check("Tertiary Exec Control",
            vmx_tertiary_exec_control, _vmx_tertiary_exec_control);

? No, I view this as a mix of two possible styles. If the string literal
was moved up, the other legitimate style would only be

        mismatch |= cap_check("Tertiary Exec Control",
                              vmx_tertiary_exec_control,
                              _vmx_tertiary_exec_control);

aiui (again extending over 3 lines). Yet none of this is written down
anywhere.

But anyway - consistency with surrounding code trumps here, I think.

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
>> +    printk("SecondaryExec=%08x TertiaryExec=%08lx\n",
> 
> For consistency, shouldn't TertiaryExec use 016 instead of 08 (as it's
> a 64bit filed).

Perhaps, assuming we'll gets bits 32 and populated sooner or later.
However, I view 16-digit literal numbers as hard to read, so I'd be
inclined to insert a separator (e.g. an underscore) between the low
and high halves. Thoughts?

>> @@ -260,6 +262,13 @@ extern u32 vmx_vmentry_control;
>>  #define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000U
>>  extern u32 vmx_secondary_exec_control;
>>  
>> +#define TERTIARY_EXEC_LOADIWKEY_EXITING         BIT(0, UL)
>> +#define TERTIARY_EXEC_ENABLE_HLAT               BIT(1, UL)
>> +#define TERTIARY_EXEC_EPT_PAGING_WRITE          BIT(2, UL)
>> +#define TERTIARY_EXEC_GUEST_PAGING_VERIFY       BIT(3, UL)
>> +#define TERTIARY_EXEC_IPI_VIRT                  BIT(4, UL)
> 
> While at it, my copy of the SDM also has:
> 
> #define TERTIARY_EXEC_VIRT_SPEC_CTRL               BIT(7, UL)

Ah yes, this must have appeared in the over 9 months that have
passed since I originally wrote this patch.

>> --- a/xen/arch/x86/include/asm/msr-index.h
>> +++ b/xen/arch/x86/include/asm/msr-index.h
>> @@ -347,6 +347,7 @@
>>  #define MSR_IA32_VMX_TRUE_EXIT_CTLS             0x48f
>>  #define MSR_IA32_VMX_TRUE_ENTRY_CTLS            0x490
>>  #define MSR_IA32_VMX_VMFUNC                     0x491
>> +#define MSR_IA32_VMX_PROCBASED_CTLS3            0x492
> 
> Shouldn't this be added above the "Legacy MSR constants in need of
> cleanup.  No new MSRs below this comment." line?

Now this is a question I'd like to forward to Andrew. Imo grouping the
new MSR with the other VMX ones is more important than respecting that
comment. But yes, I could of course add yet another patch to move the
entire block up first ...

>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -760,6 +760,12 @@ void vmx_update_secondary_exec_control(s
>>                    v->arch.hvm.vmx.secondary_exec_control);
>>  }
>>  
>> +void vmx_update_tertiary_exec_control(struct vcpu *v)
> 
> const vcpu?

Hmm, yes - overly blind copy-and-paste.

Jan

