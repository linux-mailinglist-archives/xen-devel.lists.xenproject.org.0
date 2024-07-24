Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3CF93AF97
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 12:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764066.1174371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWYtj-0001xj-Uq; Wed, 24 Jul 2024 10:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764066.1174371; Wed, 24 Jul 2024 10:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWYtj-0001v0-Rs; Wed, 24 Jul 2024 10:07:03 +0000
Received: by outflank-mailman (input) for mailman id 764066;
 Wed, 24 Jul 2024 10:07:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWYti-0001uu-AB
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 10:07:02 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 783e7188-49a4-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 12:07:01 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7a94aa5080so94895166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 03:07:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a93c62343sm170721966b.201.2024.07.24.03.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 03:07:00 -0700 (PDT)
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
X-Inumbo-ID: 783e7188-49a4-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721815621; x=1722420421; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MGUrZ1/ArdIKegoXeJ9HNWq5JL1/O1F7a6tJEitp6yw=;
        b=dd/t4xHej0HQQZ8UBW4ffOJPdtSAkqVQAw21qz2kUtmWA8UppGXbYelteB9PHq5iTY
         47DtI97mmCFmN8E5a4YVDK0Lw4QR4YZXEKpmtX6zFv92nwE7O6+DnrPiTp6tBGgVUzFE
         wyZj4u0cc+RvyQcUJD9i9uerXUtRAQsiRAGbXkHj0eyhqP+BrBjJA2Xwbc+pVf5o7DWJ
         ubrT23Tqm1KXQW8xL6LgDG35LAKE5LnObYfjN2cUYWxjzaycI7HxCcVTHC9TCzKwRY3m
         632AWNcvBcJyknz5dxUnRtCX752K9ZQU2OXtiaBhdmL26Fpbaq0dbTeFbFYPGDnYml9O
         T7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721815621; x=1722420421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGUrZ1/ArdIKegoXeJ9HNWq5JL1/O1F7a6tJEitp6yw=;
        b=WeDNpjeI2rqahzqUNEhZL3rTgzvbK0J7pdcgTZ9JtQvM0I2VQV5Gk5PmAPGK9U6DC5
         V0lyHXD8q0lmFViycPIw+0akZca9yM+WWJpera45A+2N5Bfc5B9Mo5Rd3Oot8n7aVmRO
         GKAqoqtNl02AS+okx4XithE8GEil3fHDeUDFhfW8kSMOOhiNj0rkpR+smB2qcyKkbPyV
         mloNKdYbpKNpjDjZ2QPx7RK3/ibr8aNYO99EA4/MuDkMcyBWVQhq+qd1o/tuVxTiVqfL
         dM74qwgIgIuK2MGPLTi0zYvAm0uILX/vLLGLFU8/axRCHWpR9nCdQYS4I2uiqCQ32P6g
         L7lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqLRArEcydlg3bWaQuUv3sL7qsJz5bTcwUMNX0b1ChJmPDYqAxXX8Uctm2oZjss+QFuRD4vmAzpcC4bZLy2D3YMGXZ7d6k9t23OHWH1QQ=
X-Gm-Message-State: AOJu0Yy4jyuPDPWG/i7T6k7OXr80dNUX6EBBCfqMEtKfqnFGCoqsRkxR
	P5xmzBkM1som6IqWjyVgyHqMbjPZGG1x3S0hLfJ0UUeffJPNBYfSd8HaGmti3A==
X-Google-Smtp-Source: AGHT+IGM2/wjTz7YLS/HBnmkgvEL000WPVW1usHL9dLRrG5UenrIHqC3bT4jwzuflWA9Kt7Dxk7jiA==
X-Received: by 2002:a17:907:7202:b0:a7a:b070:92d1 with SMTP id a640c23a62f3a-a7ab070a8f1mr125584066b.46.1721815620705;
        Wed, 24 Jul 2024 03:07:00 -0700 (PDT)
Message-ID: <2a839b9c-4584-4386-8b72-c0e047df7cfc@suse.com>
Date: Wed, 24 Jul 2024 12:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 10/14] x86/vmx: guard access to cpu_has_vmx_* in
 common code
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <668355271f01681070cb15f67af1538104bfc651.1720501197.git.Sergiy_Kibrik@epam.com>
 <a89c973e-035a-4e8f-b446-03bbcf724f86@suse.com>
 <e0f86c3f-1d40-4e07-8e43-4806e3f89822@epam.com>
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
In-Reply-To: <e0f86c3f-1d40-4e07-8e43-4806e3f89822@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 11:59, Sergiy Kibrik wrote:
> 22.07.24 14:43, Jan Beulich:
>> On 09.07.2024 08:05, Sergiy Kibrik wrote:
>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -5197,7 +5197,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
>>>       {
>>>           case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
>>>           case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
>>> -            if ( !cpu_has_monitor_trap_flag )
>>> +            if ( !IS_ENABLED(CONFIG_VMX) || !cpu_has_monitor_trap_flag )
>>>                   return -EOPNOTSUPP;
>>>               break;
>>
>> Why at the use site here and ...
>>
>>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>>> @@ -196,7 +196,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>>>           res->a = CPUID4A_RELAX_TIMER_INT;
>>>           if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
>>>               res->a |= CPUID4A_HCALL_REMOTE_TLB_FLUSH;
>>> -        if ( !cpu_has_vmx_apic_reg_virt )
>>> +        if ( !IS_ENABLED(CONFIG_VMX) || !cpu_has_vmx_apic_reg_virt )
>>>               res->a |= CPUID4A_MSR_BASED_APIC;
>>>           if ( viridian_feature_mask(d) & HVMPV_hcall_ipi )
>>>               res->a |= CPUID4A_SYNTHETIC_CLUSTER_IPI;
>>> @@ -236,7 +236,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>>>   
>>>       case 6:
>>>           /* Detected and in use hardware features. */
>>> -        if ( cpu_has_vmx_virtualize_apic_accesses )
>>> +        if ( IS_ENABLED(CONFIG_VMX) && cpu_has_vmx_virtualize_apic_accesses )
>>>               res->a |= CPUID6A_APIC_OVERLAY;
>>>           if ( cpu_has_vmx_msr_bitmap || (read_efer() & EFER_SVME) )
>>>               res->a |= CPUID6A_MSR_BITMAPS;
>>
>> ... here (and in yet a few more places), but ...
>>
>>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>>> @@ -306,7 +306,8 @@ extern u64 vmx_ept_vpid_cap;
>>>   #define cpu_has_vmx_vnmi \
>>>       (vmx_pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
>>>   #define cpu_has_vmx_msr_bitmap \
>>> -    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
>>> +    (IS_ENABLED(CONFIG_VMX) && \
>>> +     vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
>>
>> ... for others right in the definitions, as was suggested before? Yet then
>> not consistently for all of them? Looks like if you did this consistently
>> here, you'd have no need at all to fiddle with any .c file.
>>
> 
> these modifications in .c files are made mainly to track places where 
> build fails and to highlight where global variables are causing a trouble.
> cpu_has_monitor_trap_flag and fellow macros are used within VMX code 
> mostly and don't need these checks inside of them most of the time -- at 
> least so I felt.
> 
> As for those cpu_has_vmx_* macros that are modified in header -- these 
> are being checked in a bit more tricky way, so instead of making complex 
> conditionals even more complicated, I've integrated CONFIG_VMX condition 
> check inside these macros instead.
> 
> Ofc we can proceed with only .h files modifications, if this is more 
> consistent with what is planned for cpu_has_vmx_* checks in future.

Going that route would imo also be more future proof towards guarding
calls to yet to be introduced VMX-only functions.

Jan

