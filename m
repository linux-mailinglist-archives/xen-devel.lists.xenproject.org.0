Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC68F6A6036
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 21:14:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503750.776061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX6MU-0000Cm-Pj; Tue, 28 Feb 2023 20:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503750.776061; Tue, 28 Feb 2023 20:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX6MU-00009G-MG; Tue, 28 Feb 2023 20:14:10 +0000
Received: by outflank-mailman (input) for mailman id 503750;
 Tue, 28 Feb 2023 20:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VB9=6Y=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pX6MT-000099-V5
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 20:14:09 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7549725d-b7a4-11ed-9699-2f268f93b82a;
 Tue, 28 Feb 2023 21:14:09 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id o12so44978187edb.9
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 12:14:08 -0800 (PST)
Received: from [192.168.1.93] (adsl-150.109.242.227.tellas.gr.
 [109.242.227.150]) by smtp.gmail.com with ESMTPSA id
 gq23-20020a170906e25700b008e40853a712sm4912839ejb.97.2023.02.28.12.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 12:14:04 -0800 (PST)
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
X-Inumbo-ID: 7549725d-b7a4-11ed-9699-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R1dNmKfClY06Aa5L+h7HpDXRG5fzMVTrS1Rvpy2Yqh4=;
        b=hl972ajbGvEPkLN34AULA+v1WNk0v/BdgPH7qbhkUMvmUz7PU+0KuaZpplqEPniHjv
         j0l9M0g2vd9F//DN1NRHNVuitMocES15xba2wCJpDX5eYqdt/XrgTyNrcLI/FCVfi/9S
         Q3v4LcucnbpCrH8WrUKKgig79FTTJH1iMw1rcxZ5DnyeFtowmrXVAGMyNDT96YsSK5Ql
         qTjRjzvjE8/US6Fp2TvM6kWnwlyF5k2Ta27Cz4FP2Y1qHThLMImpo9CkqtQhVMLgc1eq
         mRHaXGegcTV3uGmSAbkJ9nr7rMG4Ag0ZAE9QckLv+HOMJIQ1Ln312d5dS/ytpHaWaT4d
         tVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R1dNmKfClY06Aa5L+h7HpDXRG5fzMVTrS1Rvpy2Yqh4=;
        b=MKkUnISCacWWxDl8SW0ET7o12ewUNAGpeHprEy/DQZxuzTtadv6pKEWowHXo0Jr62f
         RysXxuVudPXKZmPLB3QILrcPEu0BHnucHIfuqLF8DVHnJzD73kXBsDk+6Q7k0DU0hIyJ
         qrlqtxtuDuUaECwx8xOpBagY+LMBCQdturKy0Fn7uzNjOrLPalfN2T2uBhH0tdmEdyFb
         QITO/ba79gqjHIgbG3kmph1LuPAbiKunKcxoNwdcoN3O1VqkmLOfngPdP5SiQGK0eUen
         KdGxB8YWA/Vwam5lTfJj6TdYD/aaKEMA0DtJYQChiLAPrXSJjTcIX/NJnfvM9uy+AJ8+
         nEGg==
X-Gm-Message-State: AO0yUKUGn4w84ZQeoJ9iXgsc5eHrDe8auUY/ZiqVIa7f2BMC63htrL9g
	LglcFjNZ5vvIaoQwIC4XlDo=
X-Google-Smtp-Source: AK7set+B5IDQZveX9IAjKXZNyj7lFIDsDGoHllTaRdB1XGgOc1fMH4saK/BOV0zx7OnNtx7Ik4I6Xg==
X-Received: by 2002:a17:907:c207:b0:8f6:dc49:337f with SMTP id ti7-20020a170907c20700b008f6dc49337fmr5616290ejc.43.1677615248334;
        Tue, 28 Feb 2023 12:14:08 -0800 (PST)
Message-ID: <ab142406-36ed-ac42-a93c-f0fb5cf7950f@gmail.com>
Date: Tue, 28 Feb 2023 22:14:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] x86/hvm: create hvm_funcs for
 {svm,vmx}_{set,clear}_msr_intercept()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
 <20230227075652.3782973-5-burzalodowa@gmail.com>
 <732bbee0-24d3-f5e8-7353-b40a77c3ee2e@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <732bbee0-24d3-f5e8-7353-b40a77c3ee2e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/28/23 16:58, Jan Beulich wrote:
> On 27.02.2023 08:56, Xenia Ragiadakou wrote:
>> Add hvm_funcs hooks for {set,clear}_msr_intercept() for controlling the msr
>> intercept in common vpmu code.
> 
> What is this going to buy us? All calls ...
> 
>> --- a/xen/arch/x86/cpu/vpmu_amd.c
>> +++ b/xen/arch/x86/cpu/vpmu_amd.c
>> @@ -165,9 +165,9 @@ static void amd_vpmu_set_msr_bitmap(struct vcpu *v)
>>   
>>       for ( i = 0; i < num_counters; i++ )
>>       {
>> -        svm_clear_msr_intercept(v, counters[i], MSR_RW);
>> -        svm_set_msr_intercept(v, ctrls[i], MSR_W);
>> -        svm_clear_msr_intercept(v, ctrls[i], MSR_R);
>> +        hvm_clear_msr_intercept(v, counters[i], MSR_RW);
>> +        hvm_set_msr_intercept(v, ctrls[i], MSR_W);
>> +        hvm_clear_msr_intercept(v, ctrls[i], MSR_R);
>>       }
>>   
>>       msr_bitmap_on(vpmu);
>> @@ -180,8 +180,8 @@ static void amd_vpmu_unset_msr_bitmap(struct vcpu *v)
>>   
>>       for ( i = 0; i < num_counters; i++ )
>>       {
>> -        svm_set_msr_intercept(v, counters[i], MSR_RW);
>> -        svm_set_msr_intercept(v, ctrls[i], MSR_RW);
>> +        hvm_set_msr_intercept(v, counters[i], MSR_RW);
>> +        hvm_set_msr_intercept(v, ctrls[i], MSR_RW);
>>       }
>>   
>>       msr_bitmap_off(vpmu);
> 
> ... here will got to the SVM functions anyway, while ...
> 
>> --- a/xen/arch/x86/cpu/vpmu_intel.c
>> +++ b/xen/arch/x86/cpu/vpmu_intel.c
>> @@ -230,22 +230,22 @@ static void core2_vpmu_set_msr_bitmap(struct vcpu *v)
>>   
>>       /* Allow Read/Write PMU Counters MSR Directly. */
>>       for ( i = 0; i < fixed_pmc_cnt; i++ )
>> -        vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
>> +        hvm_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
>>   
>>       for ( i = 0; i < arch_pmc_cnt; i++ )
>>       {
>> -        vmx_clear_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
>> +        hvm_clear_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
>>   
>>           if ( full_width_write )
>> -            vmx_clear_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
>> +            hvm_clear_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
>>       }
>>   
>>       /* Allow Read PMU Non-global Controls Directly. */
>>       for ( i = 0; i < arch_pmc_cnt; i++ )
>> -        vmx_clear_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
>> +        hvm_clear_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
>>   
>> -    vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
>> -    vmx_clear_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
>> +    hvm_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
>> +    hvm_clear_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
>>   }
>>   
>>   static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
>> @@ -253,21 +253,21 @@ static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
>>       unsigned int i;
>>   
>>       for ( i = 0; i < fixed_pmc_cnt; i++ )
>> -        vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
>> +        hvm_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
>>   
>>       for ( i = 0; i < arch_pmc_cnt; i++ )
>>       {
>> -        vmx_set_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
>> +        hvm_set_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
>>   
>>           if ( full_width_write )
>> -            vmx_set_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
>> +            hvm_set_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
>>       }
>>   
>>       for ( i = 0; i < arch_pmc_cnt; i++ )
>> -        vmx_set_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
>> +        hvm_set_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
>>   
>> -    vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
>> -    vmx_set_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
>> +    hvm_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
>> +    hvm_set_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
>>   }
>>   
>>   static inline void __core2_vpmu_save(struct vcpu *v)
> 
> ... all calls here will go to VMX'es. For making either vpmu_<vendor>.c
> build without that vendor's virtualization enabled, isn't it all it
> takes to have ...
> 
>> @@ -916,6 +932,18 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>>       ASSERT_UNREACHABLE();
>>   }
>>   
>> +static inline void hvm_set_msr_intercept(struct vcpu *v, uint32_t msr,
>> +                                         int flags)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +}
>> +
>> +static inline void hvm_clear_msr_intercept(struct vcpu *v, uint32_t msr,
>> +                                           int flags)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +}
> 
> ... respective SVM and VMX stubs in place instead?

IMO it is more readable and they looked very good candidates for being 
abstracted because they are doing the same thing under both technologies.
Are you suggesting that their usage in common code should be discouraged 
and should not be exported via the hvm_funcs interface? Or just that the 
amount of changes cannot be justified.
IIUC Andrew also suggested to use hvm_funcs for msr intercept handling 
but I 'm not sure whether he had this or sth else in mind.

-- 
Xenia

