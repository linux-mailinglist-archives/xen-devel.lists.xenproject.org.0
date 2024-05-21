Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 393028CA7CE
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 08:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726573.1130893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9IdE-00018N-25; Tue, 21 May 2024 06:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726573.1130893; Tue, 21 May 2024 06:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9IdD-00016E-VS; Tue, 21 May 2024 06:05:51 +0000
Received: by outflank-mailman (input) for mailman id 726573;
 Tue, 21 May 2024 06:05:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9IdC-000168-46
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 06:05:50 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b5547ec-1738-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 08:05:48 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-571be483ccaso8061002a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 23:05:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574ec5fb906sm8725595a12.30.2024.05.20.23.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 23:05:47 -0700 (PDT)
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
X-Inumbo-ID: 2b5547ec-1738-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716271548; x=1716876348; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8a67SusQOOo6uuZnruLFLJSizKvhZntR0mjj5FUY0FA=;
        b=JXfM/X3planU0mwk6KFZnzextjG0zFOK+4dguU929fXCxD5sidyRtTrPFPEhP3Ut5s
         XCbNDc7Lxl5s8+4MXOS0pvyIocJwVaQTBDIIUxOvrPBoRjGaRTAhfxVqfxOLcJZar0ve
         VaTmlDiRbOqHuqUEyC+KG8RJzmlwOGO73ngR6iYkRaiD9t3w4BCOdLqP02ktilpiRYsq
         dZ7SFb5eTxf+sLjmzdJi4DpSW1Oparij59qHTtDx88nn5+u+1MxsmOR49NIZ1FDTMae5
         XYAWtQ95cFfFNAGSarhCACiWDLX+oX07JpSGF//Vg6VJr2TRS+LdtKLCff5IX/G+pCyN
         kaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716271548; x=1716876348;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8a67SusQOOo6uuZnruLFLJSizKvhZntR0mjj5FUY0FA=;
        b=Gzq5kQPDZlreqkVFUEJQpTmohF2dtbAkKQQUQi6Ys2ovS2JHFouJUgXlkqs0N32qDX
         k4GVwAJpUPlfksuWWglKq0ZuVD5FBTQznih9XdkEKYH9Ti1LYJr+9kUxs7ci1kem170z
         iZp+d7rZk6UYTnaN+x7xXROeEWDk8lvG8q8E5nEj9/azFim5ydso+DOTDX0J657gfJ3m
         L4oEfLg/bYojodZ+SLK8j29rDm0TuomEDiNV3o0m5nUXkMFK/oW3bcXkL/TR4aOdEnK1
         LhtDpx6q4u4NCn+yWaj87XVP3rKCni+QbHDr9WNySL2GdBlORH8R8YcSdIAmSEuPpqR2
         5U4w==
X-Forwarded-Encrypted: i=1; AJvYcCXpMyK6Smk4SlZ6tdzEjVFTbjBvtmqRYOUsjHLnIpQecbXUESDWAG/s7RFaJt3xyQ6Y6KuTo66Rw3CSAypQ1C5sNnSgnjdf4t0g55mj35w=
X-Gm-Message-State: AOJu0YyPgLVkwGWGv7ti4EwpLNGpZAD7UIAuphYsXC6urXekjLkWxjc+
	cM6/8jzz5ZPHAAsF3LQy9WeC++TVDgSSyGGY1A6z4IVXoWLwyZY7Xon1h0r0MA==
X-Google-Smtp-Source: AGHT+IH8vuWsyWqODV3gdg/udFHQjdc0SH8kFNPRhT/eczjbN0opEPH9hZ9z4M1T6yC61/VsiGnGYg==
X-Received: by 2002:a50:8ac1:0:b0:578:258c:1091 with SMTP id 4fb4d7f45d1cf-578258c11d6mr152477a12.4.1716271548038;
        Mon, 20 May 2024 23:05:48 -0700 (PDT)
Message-ID: <276192d0-9119-467c-ba8d-b4d808863364@suse.com>
Date: Tue, 21 May 2024 08:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 2/6] x86/intel: move vmce_has_lmce() routine to
 header
Content-Language: en-US
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
 <77bc29d74cdc43539a060bca26495a4115171f6e.1715673586.git.Sergiy_Kibrik@epam.com>
 <a21691b7-224e-446b-a2db-761ffa48107e@suse.com>
 <68e2b3b5-649f-4e53-8700-350bdb8e5b09@epam.com>
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
In-Reply-To: <68e2b3b5-649f-4e53-8700-350bdb8e5b09@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.05.2024 11:32, Sergiy Kibrik wrote:
> 16.05.24 12:39, Jan Beulich:
>> On 14.05.2024 10:20, Sergiy Kibrik wrote:
>>> Moving this function out of mce_intel.c would make it possible to disable
>>> build of Intel MCE code later on, because the function gets called from
>>> common x86 code.
>>
>> Why "would"? "Will" or "is going to" would seem more to the point to me.
> 
> yes, sure
> 
>> But anyway.
>>
>>> --- a/xen/arch/x86/cpu/mcheck/mce.h
>>> +++ b/xen/arch/x86/cpu/mcheck/mce.h
>>> @@ -170,6 +170,11 @@ static inline int mce_bank_msr(const struct vcpu *v, uint32_t msr)
>>>       return 0;
>>>   }
>>>   
>>> +static inline bool vmce_has_lmce(const struct vcpu *v)
>>> +{
>>> +    return v->arch.vmce.mcg_cap & MCG_LMCE_P;
>>> +}
>>
>> Is there a particular reason this is placed here, rather than ...
>>
>>> --- a/xen/arch/x86/include/asm/mce.h
>>> +++ b/xen/arch/x86/include/asm/mce.h
>>> @@ -41,7 +41,6 @@ extern void vmce_init_vcpu(struct vcpu *v);
>>>   extern int vmce_restore_vcpu(struct vcpu *v, const struct hvm_vmce_vcpu *ctxt);
>>>   extern int vmce_wrmsr(uint32_t msr, uint64_t val);
>>>   extern int vmce_rdmsr(uint32_t msr, uint64_t *val);
>>> -extern bool vmce_has_lmce(const struct vcpu *v);
>>>   extern int vmce_enable_mca_cap(struct domain *d, uint64_t cap);
>>
>> ... in the file the declaration was in, thus avoiding ...
>>
>>> --- a/xen/arch/x86/msr.c
>>> +++ b/xen/arch/x86/msr.c
>>> @@ -24,6 +24,8 @@
>>>   
>>>   #include <public/hvm/params.h>
>>>   
>>> +#include "cpu/mcheck/mce.h"
>>
>> ... the need for such a non-standard, cross-directory #include?
>>
> 
> 
> This is because MCG_LMCE_P is defined in arch/x86/cpu/mcheck/x86_mca.h 
> -- so either MCG_LMCE_P (+ a bunch of MCG_* declarations) has to be 
> moved to common header to be accessible, or local x86_mca.h got to be 
> included from common arch/x86/include/asm/mce.h.
> 
> As for the MCG_* declarations movement I didn't think there's a good 
> enough reason to do it; as for the inclusion of x86_mca.h it didn't look 
> nice at all.

I'm afraid I don't follow the latter: Why's including x86_mca.h any worse
than what you do right now?

Jan

