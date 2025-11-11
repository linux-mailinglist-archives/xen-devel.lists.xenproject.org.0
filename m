Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFC2C4C4FA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 09:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158807.1487220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIjVd-0004Do-S9; Tue, 11 Nov 2025 08:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158807.1487220; Tue, 11 Nov 2025 08:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIjVd-0004Bn-PI; Tue, 11 Nov 2025 08:13:49 +0000
Received: by outflank-mailman (input) for mailman id 1158807;
 Tue, 11 Nov 2025 08:13:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vIjVb-0004Bf-RQ
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 08:13:47 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52858937-bed6-11f0-980a-7dc792cee155;
 Tue, 11 Nov 2025 09:13:36 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-640a503fbe8so7002650a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Nov 2025 00:13:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbcaeaasm1337125666b.1.2025.11.11.00.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 00:13:35 -0800 (PST)
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
X-Inumbo-ID: 52858937-bed6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762848816; x=1763453616; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GhQCzFDE+/IZZdWnVD3OLYOkqAxegmWsEGoaRQC8V9c=;
        b=YTCwlaaTqk+/mBMAKmkVnrgVCa5/THjjPuSoffoIFM7AEw6JSDpfeJMSNGnGlaQS/u
         9td9eG588qq3DAYa0gx75w3Zq57VsxiN532G2Pkte2SfU1I0TaPPtZ7dv8bbcUkUNyA0
         o06WikI+nDbaCtsHvkFVZA74/3F3a7cbPfhpGz0lL+Fdvkg+8rr3ckYH7huuaNu32Wus
         28Otp4yDF6oV7jW5nx8bpoY718cen11PrEZxRdMFOI7X88DDKzSRo2HOHYg/3gD7AWnw
         8nVsGFFo4ghB3F4saZyU1kAd82mt34pIeNTb4lokWsRKgBfg8SYzYoFYNLXHdFLcfq7o
         bAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762848816; x=1763453616;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhQCzFDE+/IZZdWnVD3OLYOkqAxegmWsEGoaRQC8V9c=;
        b=htsFZg5Rl4kED/3ePmfz36lG+WWnaT5T/6KRtBLlf6iCioku2zOSQcngn7JNI/4iB9
         M7Io33d4h/bwB5swcGUHSqnPxos6IQ2Dv9CkOWABoPzM6VhET0PuDNevYF6K5AMRyzZ7
         xYo93BPpXvRyxb/2Ab5jeTyQzdX0hc3VCKu9LZikU5ECCup+cqREOd/q6FaiOnO62eqC
         TYE6dJHYN/tPQ4pQv1SSsvhApf/nZPId7CrwACE1AnGxb4+PbhjRBmA2nmeP7+mHnB34
         gPboEGZSokh3RIVtfY1AVXVeOAO1pR3dVQMQeFCETzOWb4QyQ4ly+hE6ZpWW4JfbCySs
         Rutw==
X-Forwarded-Encrypted: i=1; AJvYcCW0L/VhK9UzMrp8w3ZU+DdrZX+z76uzCzzmKkEnWebJ9YJRKzWV0FnZtwVteth0kSyfHNsPcEgclIA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxt9BiE1yCKgxhXUMl4u8PN9Hot3OtGjeBGkvVnoq078Bn0Vyzp
	ioJyWPNyLizKtL+HtoNAnSb+ZJSxcVbKwx2x819UngPqgMjROhAWRrSqULfPZ4k2HQ==
X-Gm-Gg: ASbGncsApcqvixDtt+sU66F8jm6Pie7s2qyQZTsH11KZTXTVyRXPWsTtVR2A62giknZ
	0S1tsy0VyZskDq8glOU31Jz9TKyvLMMiGX+2LSYX7kbmH55gy5XW3cA3dgRZrSVAPLmBXGpes/+
	O1yrtH4Fbpo8eMOsUTZ4pThZ2GE/HZkqSeoEzbmprcQC2r9IjSHmdR76uJN6moZJM+2UGE4ojs8
	hDtDqNVlVT8Dmdlk46/EGFyd2fM3LXSY+Q1MgnR1LDQZOv2npr9LhkpaQjo+g94EMK0kOsGIrBz
	WanlZaHCBRSNSRaZ6c6wdDqlEW2HT9+VekZwDw4K5nW44hcvTNvhgUrgXXzM9TTLRhdLw6DJbcK
	H2Wls69EXH5Wr398A6P7IQpEoizoNT+F1ORxZMi2EIdcaqmfW19HrT4c8k0wlIDkPKZplV9jjur
	iFUzjbt0qeBcOXyi5b5yk0to/iRqEAjQN0vl1ZfE0ND6IkI5IH36+5PlobMzOc7w7oXZdqo409E
	/PxPiWb0XtMng==
X-Google-Smtp-Source: AGHT+IHy2v0PYGZGvkBvaCsBHMbknsqU0SqQ5b9Ci+RLIJQ0ZgFE1esX4oQY0e66jaLJz5eHeQA9hw==
X-Received: by 2002:a05:6402:26d0:b0:640:cd2a:3cc1 with SMTP id 4fb4d7f45d1cf-6415db564bbmr9211727a12.0.1762848815988;
        Tue, 11 Nov 2025 00:13:35 -0800 (PST)
Message-ID: <c1fbdd8a-1c4d-4dda-8dff-e0206ab1cdc1@suse.com>
Date: Tue, 11 Nov 2025 09:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/28] xen/vm_event: consolidate CONFIG_VM_EVENT
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "oleksii.kurochko@gmail.com" <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-10-Penny.Zheng@amd.com>
 <1a9ac91c-2295-4749-8807-668fcecf8f8e@suse.com>
 <DM4PR12MB84515407D91133DF7B182BF1E1CFA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84515407D91133DF7B182BF1E1CFA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2025 08:08, Penny, Zheng wrote:
> [Public]
> 
> Hi,
> 
> Sorry for the late response. Just got back from long annual leaves
> 
>> -----Original Message-----
>>> --- a/xen/arch/x86/include/asm/mem_access.h
>>> +++ b/xen/arch/x86/include/asm/mem_access.h
>>> @@ -14,6 +14,7 @@
>>>  #ifndef __ASM_X86_MEM_ACCESS_H__
>>>  #define __ASM_X86_MEM_ACCESS_H__
>>>
>>> +#ifdef CONFIG_VM_EVENT
>>>  /*
>>>   * Setup vm_event request based on the access (gla is -1ull if not available).
>>>   * Handles the rw2rx conversion. Boolean return value indicates if event type
>>> @@ -25,6 +26,14 @@
>>>  bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
>>>                            struct npfec npfec,
>>>                            struct vm_event_st **req_ptr);
>>> +#else
>>> +static inline bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
>>> +                                        struct npfec npfec,
>>> +                                        struct vm_event_st **req_ptr)
>>> +{
>>> +    return false;
>>
>> Leaving *req_ptr untouched feels dangerous; the fact that the sole caller has
>> what it uses set to NULL up front is secondary.
>>
> 
> If we *req_ptr = NULL; compiler will not DCE the following code block when VM_EVENT=n:
> ```
>         if ( req_ptr )
>         {
>                 if ( monitor_traps(curr, sync, req_ptr) < 0 )
>                         rc = 0;
> 
>                 xfree(req_ptr);
>         }
>         return rc;
> ```
> Or am I misunderstanding what you suggest?

First: It would have helped if you had also said where that code fragment actually
was taken from.

Seeing it's in hvm_hap_nested_page_fault(), I'm having trouble following why the
compiler wouldn't be able to see that the local variable "req_ptr" there would
never change value, i.e. remain NULL throughout its lifetime. If indeed there's a
compiler shortcoming, that either wants working around or properly writing down.

Jan

