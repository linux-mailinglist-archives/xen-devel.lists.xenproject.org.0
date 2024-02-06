Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FBE84B145
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 10:28:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676696.1052916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXHkm-0002x3-SE; Tue, 06 Feb 2024 09:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676696.1052916; Tue, 06 Feb 2024 09:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXHkm-0002vL-Pa; Tue, 06 Feb 2024 09:28:32 +0000
Received: by outflank-mailman (input) for mailman id 676696;
 Tue, 06 Feb 2024 09:28:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x4wk=JP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rXHkl-0002vF-3O
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 09:28:31 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1611637c-c4d2-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 10:28:28 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a380c98e824so78472066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 01:28:28 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 cx6-20020a170907168600b00a381da7b320sm623769ejd.177.2024.02.06.01.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 01:28:28 -0800 (PST)
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
X-Inumbo-ID: 1611637c-c4d2-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707211708; x=1707816508; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rJvSmlDSKQ+A0UGCJt6qFwMR0lxaOLbqyGG2NiGrajQ=;
        b=A8l0HFeK9fPo1xWtlcW6am7l0wvVxx1Thb+dq1VxYg69qWGI3L/MR8pfwa0JirIy2p
         yTmmlUE+ZXunFWIzvdrpwpTp9WI1MhYIHabCNe78qdRf5fpZL1VzVW3l0aEWhFqc0yoB
         5yHS9mAKSqHEwZKmE4M8iLEScc7sLsY11Oxvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707211708; x=1707816508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJvSmlDSKQ+A0UGCJt6qFwMR0lxaOLbqyGG2NiGrajQ=;
        b=Ow3RskDEaNJl8vNNwzxBwUf15upcs3JZcx4dQz652jgOdLo4XBsk365rrlLvqnDdjB
         c0bp/aggWsSDLGvmdSsQ+xcqh+BEm1I57UsLzUU/kCx5ZsZ6oZVjpVd33wUa+ge6pYUC
         kZdxSLdPMg4sQqk6wdoJQFuYVmu2fEy2HWIF5eP71TW2D4c1OH/9VdviSK5FGRh/dIcZ
         eMfFb2fQZQtqpfiXouagSvncNYv8yhjUm4sylhjOG4hXPDsga7fWisP966SMOeWE90JY
         dA1n8Yjx+Yy47OfCZZU4xr5dUYT17uP1mBr9oizLxka43Z7Ay2S6ewqhqVS3zc4uNlYg
         TpDQ==
X-Gm-Message-State: AOJu0YyGV6LBQbIotkFrj0UyUw0XuYrn6Z9S+2FRPIry6z7GpVvvqg97
	GghnXkDdWP/JzQ1n6LrVx5UVdxr3XleiMaUj+C4iZDtNo2zsyRAo+BcQ8Q+AC3Q=
X-Google-Smtp-Source: AGHT+IG9xsl73RafWKOZHSFzGvdyUvUcw60yoFKkmDrKvlNji1NANozWPHJ9ZG3B+kXThzFP1ulU9g==
X-Received: by 2002:a17:906:512:b0:a37:ad51:86dc with SMTP id j18-20020a170906051200b00a37ad5186dcmr1327806eja.9.1707211708400;
        Tue, 06 Feb 2024 01:28:28 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXtyZ2u60eFlJ82YbG7g/CVSzuGf8YwjumT/CR7vTQioOA6+C0Pyaoo+cXuj6tDdFg9KlohKT6r01U5k9piHhx7Mm7/s3a7/9aQvkjITm3UMtx0ACn8RCmdsKZaMVLWbKFdS0gmBtZglfyIFEeOuL3Z1KKuTfvZnNu5AlqMS4FQSrYZgA==
Date: Tue, 6 Feb 2024 10:28:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v4.5 3/8] VMX: tertiary execution control infrastructure
Message-ID: <ZcH7uwpxwYUq9yR0@macbook>
References: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
 <aa553449-888f-4e52-85b7-0bc0b7f010b4@suse.com>
 <bc782b14-d897-4a94-b71d-97c4abeb85df@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc782b14-d897-4a94-b71d-97c4abeb85df@suse.com>

On Mon, Feb 05, 2024 at 02:37:44PM +0100, Jan Beulich wrote:
> This is a prereq to enabling e.g. the MSRLIST feature.
> 
> Note that the PROCBASED_CTLS3 MSR is different from other VMX feature
> reporting MSRs, in that all 64 bits report allowed 1-settings.
> 
> vVMX code is left alone, though, for the time being.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v4.5: Bump zero-padding width in vmcs_dump_vcpu(). Add
>       TERTIARY_EXEC_VIRT_SPEC_CTRL. Constify
>       vmx_update_tertiary_exec_control()'s parameter. Re-base.
> v2: New.
> 
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -164,6 +164,7 @@ static int cf_check parse_ept_param_runt
>  u32 vmx_pin_based_exec_control __read_mostly;
>  u32 vmx_cpu_based_exec_control __read_mostly;
>  u32 vmx_secondary_exec_control __read_mostly;
> +uint64_t vmx_tertiary_exec_control __read_mostly;
>  u32 vmx_vmexit_control __read_mostly;
>  u32 vmx_vmentry_control __read_mostly;
>  u64 vmx_ept_vpid_cap __read_mostly;
> @@ -228,10 +229,32 @@ static u32 adjust_vmx_controls(
>      return ctl;
>  }
>  
> -static bool cap_check(const char *name, u32 expected, u32 saw)
> +static uint64_t adjust_vmx_controls2(
> +    const char *name, uint64_t ctl_min, uint64_t ctl_opt, unsigned int msr,
> +    bool *mismatch)
> +{
> +    uint64_t vmx_msr, ctl = ctl_min | ctl_opt;
> +
> +    rdmsrl(msr, vmx_msr);
> +
> +    ctl &= vmx_msr; /* bit == 0 ==> must be zero */
> +
> +    /* Ensure minimum (required) set of control bits are supported. */
> +    if ( ctl_min & ~ctl )
> +    {
> +        *mismatch = true;
> +        printk("VMX: CPU%u has insufficient %s (%#lx; requires %#lx)\n",
> +               smp_processor_id(), name, ctl, ctl_min);
> +    }
> +
> +    return ctl;
> +}
> +
> +static bool cap_check(
> +    const char *name, unsigned long expected, unsigned long saw)
>  {
>      if ( saw != expected )
> -        printk("VMX %s: saw %#x expected %#x\n", name, saw, expected);
> +        printk("VMX %s: saw %#lx expected %#lx\n", name, saw, expected);
>      return saw != expected;
>  }
>  
> @@ -241,6 +264,7 @@ static int vmx_init_vmcs_config(bool bsp
>      u32 _vmx_pin_based_exec_control;
>      u32 _vmx_cpu_based_exec_control;
>      u32 _vmx_secondary_exec_control = 0;
> +    uint64_t _vmx_tertiary_exec_control = 0;
>      u64 _vmx_ept_vpid_cap = 0;
>      u64 _vmx_misc_cap = 0;
>      u32 _vmx_vmexit_control;
> @@ -274,7 +298,8 @@ static int vmx_init_vmcs_config(bool bsp
>      opt = (CPU_BASED_ACTIVATE_MSR_BITMAP |
>             CPU_BASED_TPR_SHADOW |
>             CPU_BASED_MONITOR_TRAP_FLAG |
> -           CPU_BASED_ACTIVATE_SECONDARY_CONTROLS);
> +           CPU_BASED_ACTIVATE_SECONDARY_CONTROLS |
> +           CPU_BASED_ACTIVATE_TERTIARY_CONTROLS);
>      _vmx_cpu_based_exec_control = adjust_vmx_controls(
>          "CPU-Based Exec Control", min, opt,
>          MSR_IA32_VMX_PROCBASED_CTLS, &mismatch);
> @@ -338,6 +363,15 @@ static int vmx_init_vmcs_config(bool bsp
>              MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
>      }
>  
> +    if ( _vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS )
> +    {
> +        uint64_t opt = 0;
> +
> +        _vmx_tertiary_exec_control = adjust_vmx_controls2(
> +            "Tertiary Exec Control", 0, opt,
> +            MSR_IA32_VMX_PROCBASED_CTLS3, &mismatch);
> +    }
> +
>      /* The IA32_VMX_EPT_VPID_CAP MSR exists only when EPT or VPID available */
>      if ( _vmx_secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
>                                          SECONDARY_EXEC_ENABLE_VPID) )
> @@ -468,6 +502,7 @@ static int vmx_init_vmcs_config(bool bsp
>          vmx_pin_based_exec_control = _vmx_pin_based_exec_control;
>          vmx_cpu_based_exec_control = _vmx_cpu_based_exec_control;
>          vmx_secondary_exec_control = _vmx_secondary_exec_control;
> +        vmx_tertiary_exec_control  = _vmx_tertiary_exec_control;
>          vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
>          vmx_vmexit_control         = _vmx_vmexit_control;
>          vmx_vmentry_control        = _vmx_vmentry_control;
> @@ -503,6 +538,9 @@ static int vmx_init_vmcs_config(bool bsp
>              "Secondary Exec Control",
>              vmx_secondary_exec_control, _vmx_secondary_exec_control);
>          mismatch |= cap_check(
> +            "Tertiary Exec Control",
> +            vmx_tertiary_exec_control, _vmx_tertiary_exec_control);
> +        mismatch |= cap_check(
>              "VMExit Control",
>              vmx_vmexit_control, _vmx_vmexit_control);
>          mismatch |= cap_check(
> @@ -1080,6 +1118,7 @@ static int construct_vmcs(struct vcpu *v
>          v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
>  
>      v->arch.hvm.vmx.secondary_exec_control = vmx_secondary_exec_control;
> +    v->arch.hvm.vmx.tertiary_exec_control  = vmx_tertiary_exec_control;
>  
>      /*
>       * Disable features which we don't want active by default:
> @@ -1134,6 +1173,10 @@ static int construct_vmcs(struct vcpu *v
>          __vmwrite(SECONDARY_VM_EXEC_CONTROL,
>                    v->arch.hvm.vmx.secondary_exec_control);
>  
> +    if ( cpu_has_vmx_tertiary_exec_control )
> +        __vmwrite(TERTIARY_VM_EXEC_CONTROL,
> +                  v->arch.hvm.vmx.tertiary_exec_control);
> +
>      /* MSR access bitmap. */
>      if ( cpu_has_vmx_msr_bitmap )
>      {
> @@ -2068,10 +2111,12 @@ void vmcs_dump_vcpu(struct vcpu *v)
>                 vmr(HOST_PERF_GLOBAL_CTRL));
>  
>      printk("*** Control State ***\n");
> -    printk("PinBased=%08x CPUBased=%08x SecondaryExec=%08x\n",
> +    printk("PinBased=%08x CPUBased=%08x\n",
>             vmr32(PIN_BASED_VM_EXEC_CONTROL),
> -           vmr32(CPU_BASED_VM_EXEC_CONTROL),
> -           vmr32(SECONDARY_VM_EXEC_CONTROL));
> +           vmr32(CPU_BASED_VM_EXEC_CONTROL));
> +    printk("SecondaryExec=%08x TertiaryExec=%016lx\n",

I thought you wanted to split the print into two 32bit halves here?

Thanks, Roger.

