Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AC784CC99
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 15:25:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677688.1054456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXirH-0004vX-UE; Wed, 07 Feb 2024 14:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677688.1054456; Wed, 07 Feb 2024 14:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXirH-0004tt-Pr; Wed, 07 Feb 2024 14:25:03 +0000
Received: by outflank-mailman (input) for mailman id 677688;
 Wed, 07 Feb 2024 14:25:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXirG-0004ey-Ct
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 14:25:02 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id add73098-c5c4-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 15:25:01 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3394b892691so401529f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 06:25:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w14-20020a05600c474e00b00410232ffb2csm307940wmo.25.2024.02.07.06.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 06:25:00 -0800 (PST)
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
X-Inumbo-ID: add73098-c5c4-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707315901; x=1707920701; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5ICgbt0/W6ckB4/A7YpRur4Ixkx6v4ImUf/u2oPtk0=;
        b=d+AbupH0Zjagyp82KchuJVrVlGTq30Toef9fjDvEEyHTaXdBZepCCl5EXncuEr2p4D
         v9w53ccgkx4Eq+V+ZutM5+pvNi92utH4SRJAd22AYc3VLm+2TKyRhtVmFUqBAZ57cXuM
         8hephYDBD4WlsJztnoLLMTwcTbL25AldHxYgivyRObZ/ss3t6q93Q7dG6bM1+qObqryO
         vYuydBFCNAliGg1N9M4f1l8iiSWBZimwyoIVOn+8Hlr+GkZhu95gpZh1ipLesWtOBBIz
         EYqOu5EpsMbbuaJrbFI9IWIJKuIuV22G221xJe4M82yWKyi3S0Vk57Q3XySIW+3iqsy6
         QVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707315901; x=1707920701;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5ICgbt0/W6ckB4/A7YpRur4Ixkx6v4ImUf/u2oPtk0=;
        b=h5uOGv1Qtu/wGS2vc1/XamUsPLHXFaAgtD1UEIcm4E1q/9A4JXGqtB7KaMlWdv5Icm
         q84tHq6doUqWzQDByV0b8Q5oeg2D+WAF4RDwzQ2YC1R9R5JDwofEpEjxqEO/1L7g+4S/
         vIFxPV3mMeLSQQzozsaemViPLgzz0Z4jlQz0QV9nor16KPYcyXkotc/y6tpOE167YN56
         nUC+wooYcXd0Ru/SLhiblHaBHyIyrUbQdpaj0J5xaQ9Y3MRtznIl1/bymJCi10vKMP8Q
         1riIY/21RvDE+ZykfVhsA2Fy8aukuXUdXFWjjWB9h0tpgVU0uREf99+mOAiBvy5EvSVF
         8GoQ==
X-Gm-Message-State: AOJu0Yy2Pvs53V4J4spBr8jxku8NAWCFaFcWtzH6xesLePBQQo3yfyYT
	4XPXcCiaifiqpm2OxkvM5fBppazTLXS/HV7Yh89LhBim8cQZidnnRc2jjFOMkw==
X-Google-Smtp-Source: AGHT+IHFfYQma5nIGhVhm7U+qLj0KtfWMYEcHNVW1FkFkMLeY+PEC/w3nQTrm/dm/gS2yyCoXIZUfg==
X-Received: by 2002:adf:ea01:0:b0:33b:26c3:4fe0 with SMTP id q1-20020adfea01000000b0033b26c34fe0mr3914606wrm.6.1707315901213;
        Wed, 07 Feb 2024 06:25:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2BDCNa3cAHpOW4ksLdgggKkvmRP+f1u8BJ2O5Vur0F41syCvmTmTVGZBCAM6uJAewbGJ82dsF53uF51t5iUqMAIrVKkJRhN8/L5/JC92FsN6PTNS+HcPwovO6h0yxOFAm2Ns5PMyESqqo3k8U+O6BAw1ODkis/SP0vnMJpwXVndz0h9HUHzNGRB6wrmmRqxCaCJDf0M7APkTDNLnAVozGWDU5sngnM7CqiQHY
Message-ID: <a6bf6d72-5796-4ccc-aa3e-38438f986b32@suse.com>
Date: Wed, 7 Feb 2024 15:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] VMX: convert entry point annotations
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <3ba82c3a-ff95-43d0-8672-a63b23bc2cdc@suse.com>
 <5fc304c0-be1f-46dd-a783-4030ec76a2f8@suse.com>
 <c11bd472-fc43-49c5-8482-4fc7ed836269@citrix.com>
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
In-Reply-To: <c11bd472-fc43-49c5-8482-4fc7ed836269@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.02.2024 14:55, Andrew Cooper wrote:
> On 07/02/2024 1:37 pm, Jan Beulich wrote:
>> Use the generic framework from xen/linkage.h.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v6: New.
>>
>> --- a/xen/arch/x86/hvm/vmx/entry.S
>> +++ b/xen/arch/x86/hvm/vmx/entry.S
>> @@ -24,7 +24,7 @@
>>  #define VMRESUME     .byte 0x0f,0x01,0xc3
>>  #define VMLAUNCH     .byte 0x0f,0x01,0xc2
>>  
>> -ENTRY(vmx_asm_vmexit_handler)
>> +FUNC(vmx_asm_vmexit_handler)
>>          SAVE_ALL
>>  
>>          mov  %cr2,%rax
>> @@ -132,7 +132,7 @@ UNLIKELY_END(realmode)
>>          call vmx_vmentry_failure
>>          jmp  .Lvmx_process_softirqs
>>  
>> -ENTRY(vmx_asm_do_vmentry)
>> +LABEL(vmx_asm_do_vmentry)
> 
> This really is a function, not a label.
> 
> xen.git/xen$ git grep vmx_asm_do_vmentry
> arch/x86/hvm/vmx/entry.S:135:ENTRY(vmx_asm_do_vmentry)
> arch/x86/hvm/vmx/vmcs.c:1855:void noreturn vmx_asm_do_vmentry(void);
> arch/x86/hvm/vmx/vmcs.c:1929:    reset_stack_and_jump(vmx_asm_do_vmentry);
> 
> It is giant mess, of two functions forming part of the same loop.
> 
> Considering that you declines to take CODE, I don't know what to
> suggest.  The point of CODE, distinct to FUNC, was to identify the
> places where weird things were going on, and this absolutely counts.

What's not clear to me: How would CODE() differ from both FUNC() and
LABEL()? And if the symbol is to be a function, what's wrong with
using FUNC() here as is? There's in particular no real need to have
all FUNC()s paired with END()s, afaict.

Jan

