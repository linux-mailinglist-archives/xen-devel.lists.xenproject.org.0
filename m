Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84961696A5F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:53:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495392.765755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyY7-0007AP-W1; Tue, 14 Feb 2023 16:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495392.765755; Tue, 14 Feb 2023 16:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyY7-00077P-T1; Tue, 14 Feb 2023 16:52:59 +0000
Received: by outflank-mailman (input) for mailman id 495392;
 Tue, 14 Feb 2023 16:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LsmO=6K=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRyY7-00077J-6K
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:52:59 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06f9b3a4-ac88-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 17:52:55 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id hx15so41587872ejc.11
 for <xen-devel@lists.xenproject.org>; Tue, 14 Feb 2023 08:52:55 -0800 (PST)
Received: from [192.168.67.143] ([62.74.15.167])
 by smtp.gmail.com with ESMTPSA id
 le3-20020a170907170300b0087be1055f83sm8434006ejc.206.2023.02.14.08.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 08:52:54 -0800 (PST)
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
X-Inumbo-ID: 06f9b3a4-ac88-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+auUcu4xd0KJc072de5A24JuTtsRCj3j5PFLESmXT+k=;
        b=QVHVQvipkuB7jmtW8DAug2GwtZ58YqlpssFt63fsJtrubR1YojPOgi+ewNkMOYlKyr
         VMQ8AvwYASPjTYF6SnwittveDaQRQX7V1y78RR3vIlZcXRJa1Xfv7Q22TvAUJ1IvuMdG
         r6ohemC6zyKnccURfohSfRJbIiOWFDhTO4X6KuwG2Yz3TKnDCWnpnj633MEU/8UUbLHE
         zkV/bc6Nv/+cwADDLV1D66MZQ5aCL38apbINUh5ZR34X0edfmh6kTG8STyEW2Jo3LWU7
         rC7Yl8qo4SpIDIBm/4ZkmtgOD4WC4J+XLiyEcEUl9CfZsg1MhT8M7iLGRh+cUYXff7A+
         Oy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+auUcu4xd0KJc072de5A24JuTtsRCj3j5PFLESmXT+k=;
        b=cFRP7fwS0ODYpxN0sN4aeaoffw12Iwjzf4XNjvU6Azb10itJedeDktrwvpzh8fvH2E
         Ld6tje9HukLwI4EXoNqVhIVg4tceoGLQ1s3jEmfWjj6cSm2KGO3K0uvfVoprlEJlaQuY
         mJCcLgJDFLe8kjhuljEjAl4Qwzavo18dsS9KbdgsmCy1Ks/T2LkoIomZiVimIhQB5U4c
         bynk40tCuwXnluX3DxY/GVkhZvULYMkELnBfwtURybJyEak4MaHoKRaWHJ86SgvXlspb
         rcgQ33UExKFC0uRb/bAfZIGxoZBYXfXXbQyD9oeRSBvIOzT8t4ohYD+jeI8is1hw7UEG
         iIBA==
X-Gm-Message-State: AO0yUKUvMjYyZg7bJf0E/5/lW17uQHtEYwayQOXA0zrVugcOopvzmJyM
	nH2/3IgKQM2D1R7FxW8xU8g=
X-Google-Smtp-Source: AK7set/Mu6ZpugzeHDSvAPR6Kjf1QcWiOV7Zm4xGqpZmaBnGmGzR+FPpvSdlwuP7k3QV6yUsdy2eAA==
X-Received: by 2002:a17:906:6015:b0:889:7781:f62e with SMTP id o21-20020a170906601500b008897781f62emr3462114ejj.22.1676393574685;
        Tue, 14 Feb 2023 08:52:54 -0800 (PST)
Message-ID: <cf77b0f3-a04b-894a-0d5f-8988bdb0de4a@gmail.com>
Date: Tue, 14 Feb 2023 18:52:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC 08/10] x86: wire cpu_has_svm/vmx_* to false when svm/vmx not
 enabled
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-9-burzalodowa@gmail.com>
 <6ddf5aa2-8bb2-9831-fdc6-833bb4d259f7@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <6ddf5aa2-8bb2-9831-fdc6-833bb4d259f7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/14/23 18:36, Jan Beulich wrote:
> On 13.02.2023 15:57, Xenia Ragiadakou wrote:
>> To be able to use cpu_has_svm/vmx_* macros in common code without enclosing
> 
> Both in the title and here the spelling you use made me first think that
> you talk about "cpu_has_svm". May I suggest you follow what we typically
> do and use "cpu_has_{svm,vmx}_*" instead in such a case? However, the
> title may want changing anyway:

Ok, I will use the conventional way from now on.

> 
>> --- a/xen/arch/x86/include/asm/hvm/svm/svm.h
>> +++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
>> @@ -80,6 +80,7 @@ extern u32 svm_feature_flags;
>>   #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
>>   #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
>>   
>> +#ifdef CONFIG_AMD_SVM
>>   #define cpu_has_svm_feature(f) (svm_feature_flags & (1u << (f)))
> 
> Why don't you simply provide a 2nd form of this one macro, leaving all
> others alone?

You are right. That way there will be less changes.

> 
>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>> @@ -294,6 +294,7 @@ extern u64 vmx_ept_vpid_cap;
>>   
>>   #define VMX_TSC_MULTIPLIER_MAX                  0xffffffffffffffffULL
>>   
>> +#ifdef CONFIG_INTEL_VMX
>>   #define cpu_has_wbinvd_exiting \
>>       (vmx_secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
>>   #define cpu_has_vmx_virtualize_apic_accesses \
>> @@ -352,6 +353,36 @@ extern u64 vmx_ept_vpid_cap;
>>       (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
>>   #define cpu_has_vmx_notify_vm_exiting \
>>       (vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
>> +#else
>> +#define cpu_has_wbinvd_exiting false
>> +#define cpu_has_vmx_virtualize_apic_accesses false
>> +#define cpu_has_vmx_tpr_shadow false
>> +#define cpu_has_vmx_vnmi false
>> +#define cpu_has_vmx_msr_bitmap false
>> +#define cpu_has_vmx_secondary_exec_control false
>> +#define cpu_has_vmx_ept false
>> +#define cpu_has_vmx_dt_exiting false
>> +#define cpu_has_vmx_vpid false
>> +#define cpu_has_monitor_trap_flag false
>> +#define cpu_has_vmx_pat false
>> +#define cpu_has_vmx_efer false
>> +#define cpu_has_vmx_unrestricted_guest false
>> +#define vmx_unrestricted_guest(v) false
>> +#define cpu_has_vmx_ple false
>> +#define cpu_has_vmx_apic_reg_virt false
>> +#define cpu_has_vmx_virtual_intr_delivery false
>> +#define cpu_has_vmx_virtualize_x2apic_mode false
>> +#define cpu_has_vmx_posted_intr_processing false
>> +#define cpu_has_vmx_vmcs_shadowing false
>> +#define cpu_has_vmx_vmfunc false
>> +#define cpu_has_vmx_virt_exceptions false
>> +#define cpu_has_vmx_pml false
>> +#define cpu_has_vmx_mpx false
>> +#define cpu_has_vmx_xsaves false
>> +#define cpu_has_vmx_tsc_scaling false
>> +#define cpu_has_vmx_bus_lock_detection false
>> +#define cpu_has_vmx_notify_vm_exiting false
>> +#endif /* CONFIG_INTEL_VMX */
> 
> For VMX you first of all want to separate out vmx_unrestricted_guest(v).
> Maybe we can even get away without a 2nd form. Then I think it would be
> much neater a change if, like we have for SVM, a couple (three I think)
> helper macros were introduced, which then is all that needs providing a
> 2nd form for. (Both steps may want doing in separate, prereq patches.)

Ok will do.

> 
>> @@ -374,8 +405,12 @@ extern u64 vmx_ept_vpid_cap;
>>   #define VMX_BASIC_DEFAULT1_ZERO		(1ULL << 55)
>>   
>>   extern u64 vmx_basic_msr;
>> +#ifdef CONFIG_INTEL_VMX
>>   #define cpu_has_vmx_ins_outs_instr_info \
>>       (!!(vmx_basic_msr & VMX_BASIC_INS_OUT_INFO))
>> +#else
>> +#define cpu_has_vmx_ins_outs_instr_info false
>> +#endif /* CONFIG_INTEL_VMX */
> 
> I don't think you need an alternative here - it's used solely in VMX
> code. If one wanted to this could even be moved to vmcs.c.

Ok. I ll take a closer look at this one.

> 
>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> @@ -289,6 +289,7 @@ typedef union cr_access_qual {
>>   
>>   extern uint8_t posted_intr_vector;
>>   
>> +#ifdef CONFIG_INTEL_VMX
>>   #define cpu_has_vmx_ept_exec_only_supported        \
>>       (vmx_ept_vpid_cap & VMX_EPT_EXEC_ONLY_SUPPORTED)
>>   
>> @@ -301,6 +302,17 @@ extern uint8_t posted_intr_vector;
>>   #define cpu_has_vmx_ept_ad    (vmx_ept_vpid_cap & VMX_EPT_AD_BIT)
>>   #define cpu_has_vmx_ept_invept_single_context   \
>>       (vmx_ept_vpid_cap & VMX_EPT_INVEPT_SINGLE_CONTEXT)
>> +#else
>> +#define cpu_has_vmx_ept_exec_only_supported false
>> +
>> +#define cpu_has_vmx_ept_wl4_supported false
>> +#define cpu_has_vmx_ept_mt_uc false
>> +#define cpu_has_vmx_ept_mt_wb false
>> +#define cpu_has_vmx_ept_2mb false
>> +#define cpu_has_vmx_ept_1gb false
>> +#define cpu_has_vmx_ept_ad false
>> +#define cpu_has_vmx_ept_invept_single_context false
>> +#endif /* CONFIG_INTEL_VMX */
> 
> Same suggestion for introducing a helper macro here, which would then
> also be usable ...
> 
>> @@ -310,12 +322,18 @@ extern uint8_t posted_intr_vector;
>>   #define INVEPT_SINGLE_CONTEXT   1
>>   #define INVEPT_ALL_CONTEXT      2
>>   
>> +#ifdef CONFIG_INTEL_VMX
>>   #define cpu_has_vmx_vpid_invvpid_individual_addr                    \
>>       (vmx_ept_vpid_cap & VMX_VPID_INVVPID_INDIVIDUAL_ADDR)
>>   #define cpu_has_vmx_vpid_invvpid_single_context                     \
>>       (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT)
>>   #define cpu_has_vmx_vpid_invvpid_single_context_retaining_global    \
>>       (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL)
>> +#else
>> +#define cpu_has_vmx_vpid_invvpid_individual_addr false
>> +#define cpu_has_vmx_vpid_invvpid_single_context false
>> +#define cpu_has_vmx_vpid_invvpid_single_context_retaining_global false
>> +#endif /* CONFIG_INTEL_VMX */
> 
> ... here.

Thanks.

> 
> Jan

-- 
Xenia

