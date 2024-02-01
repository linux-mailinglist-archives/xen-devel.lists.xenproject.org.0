Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 747FC845687
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 12:51:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674356.1049209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVVaD-0002HG-IO; Thu, 01 Feb 2024 11:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674356.1049209; Thu, 01 Feb 2024 11:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVVaD-0002Ew-FI; Thu, 01 Feb 2024 11:50:17 +0000
Received: by outflank-mailman (input) for mailman id 674356;
 Thu, 01 Feb 2024 11:50:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cAD+=JK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rVVaB-0002DW-Pu
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 11:50:15 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f061d62-c0f8-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 12:50:13 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so116894166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 03:50:13 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 fj17-20020a1709069c9100b00a36d0dae491sm275054ejc.202.2024.02.01.03.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 03:50:12 -0800 (PST)
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
X-Inumbo-ID: 0f061d62-c0f8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706788213; x=1707393013; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/b2nCxVuhiNKnJIcxnoWW7CsS5U/pLdZUbH4D9pjupQ=;
        b=RJT6t6omnWCpwhysmMmIuy8b22WELM6osuIkyrBpCYL7NdW9KLJpq4cCjqcodKXn21
         Bd6eUMdpi8LH/6aFyncqyO4sFGEtV6JHOQ+qcQodJB0TGAZV8RzKqHuRaCYpdTD85uVV
         udEiBiAjJgBVufw5wztPfzFzf7rISVjayjbWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706788213; x=1707393013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/b2nCxVuhiNKnJIcxnoWW7CsS5U/pLdZUbH4D9pjupQ=;
        b=dKtxvCVZH11mCgB16oHEKy6tIO9wp6wSjDhH6DIPprky2yygYX2NJL4jp7Ok8SbXox
         eJ6zLNKtnfQbP0iED0CKpFvjs72yXxIXQY4FOLAWw2rKqp3h03+0Dyqrff90xKk3e17Z
         GiPFVQ2EbQbATuCJoTYhiyXmkCuNYa5eLbHJPOBFDtgftvpQ5hHqRrtchs0jMVi4F7rO
         GS+0eRiOlCMeYIYOegBazFPnlFRGdObuj9NU7XJW9S7nGNTi667sOpDhhzroFO0r+28D
         7NoyWstFP4Tdnt5D92i06nZ8EBF/c4USeGGppn2v8tdDub+ARPH4F1t6wj3LOcreHmHq
         IIKQ==
X-Gm-Message-State: AOJu0Ywz3YBzZpxkpvzM/cxSN+TM2xemw8X1bMSvRxKwgqgrxWP6vRoD
	DjZIINNHw+/1I+BNxMuVl8uCjhY+0A9qOQhQJWOMRxYkZmLwUO6zNdD5QMPj9PQ=
X-Google-Smtp-Source: AGHT+IEx/y0d9DNtQS9M0vQ0aGFGc9W/x/9Cnr/JO2o61EjFrMzGGqzlCsG5Kr9w497A1VY4CBEMUQ==
X-Received: by 2002:a17:906:260b:b0:a36:34b6:9ca4 with SMTP id h11-20020a170906260b00b00a3634b69ca4mr1758930ejc.64.1706788212751;
        Thu, 01 Feb 2024 03:50:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXVZ+Yq4REdfLsj1fV3tQfEcqzAeR0Cu2JkvNGBlJ3yO5Hj1WF4Uu2XxMDuv/vspIDPCtaTc8BVvGNYDbVsCBruAPuTk/RtKBxNEBTJOQ5Lak4jeIAindJhSH2iboYHv4ts8I2NaZX+2+xbmVEXG4Sv+JIDlAa2yqPyABc4diL8I6rEqw==
Date: Thu, 1 Feb 2024 12:50:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v4 3/8] VMX: tertiary execution control infrastructure
Message-ID: <ZbuFc-ha-iv6B9ui@macbook>
References: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
 <aa553449-888f-4e52-85b7-0bc0b7f010b4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aa553449-888f-4e52-85b7-0bc0b7f010b4@suse.com>

On Thu, Jan 11, 2024 at 10:00:10AM +0100, Jan Beulich wrote:
> This is a prereq to enabling the MSRLIST feature.
> 
> Note that the PROCBASED_CTLS3 MSR is different from other VMX feature
> reporting MSRs, in that all 64 bits report allowed 1-settings.
> 
> vVMX code is left alone, though, for the time being.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
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

I know it's done to match the surrounding style, but couldn't you move
the name parameter one line up, and then limit the call to two lines?

(I don't think it will compromise readability).

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
> +    printk("SecondaryExec=%08x TertiaryExec=%08lx\n",

For consistency, shouldn't TertiaryExec use 016 instead of 08 (as it's
a 64bit filed).

> +           vmr32(SECONDARY_VM_EXEC_CONTROL),
> +           vmr(TERTIARY_VM_EXEC_CONTROL));
>      printk("EntryControls=%08x ExitControls=%08x\n", vmentry_ctl, vmexit_ctl);
>      printk("ExceptionBitmap=%08x PFECmask=%08x PFECmatch=%08x\n",
>             vmr32(EXCEPTION_BITMAP),
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -114,6 +114,7 @@ struct vmx_vcpu {
>      /* Cache of cpu execution control. */
>      u32                  exec_control;
>      u32                  secondary_exec_control;
> +    uint64_t             tertiary_exec_control;
>      u32                  exception_bitmap;
>  
>      uint64_t             shadow_gs;
> @@ -196,6 +197,7 @@ void vmx_vmcs_reload(struct vcpu *v);
>  #define CPU_BASED_RDTSC_EXITING               0x00001000U
>  #define CPU_BASED_CR3_LOAD_EXITING            0x00008000U
>  #define CPU_BASED_CR3_STORE_EXITING           0x00010000U
> +#define CPU_BASED_ACTIVATE_TERTIARY_CONTROLS  0x00020000U
>  #define CPU_BASED_CR8_LOAD_EXITING            0x00080000U
>  #define CPU_BASED_CR8_STORE_EXITING           0x00100000U
>  #define CPU_BASED_TPR_SHADOW                  0x00200000U
> @@ -260,6 +262,13 @@ extern u32 vmx_vmentry_control;
>  #define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000U
>  extern u32 vmx_secondary_exec_control;
>  
> +#define TERTIARY_EXEC_LOADIWKEY_EXITING         BIT(0, UL)
> +#define TERTIARY_EXEC_ENABLE_HLAT               BIT(1, UL)
> +#define TERTIARY_EXEC_EPT_PAGING_WRITE          BIT(2, UL)
> +#define TERTIARY_EXEC_GUEST_PAGING_VERIFY       BIT(3, UL)
> +#define TERTIARY_EXEC_IPI_VIRT                  BIT(4, UL)

While at it, my copy of the SDM also has:

#define TERTIARY_EXEC_VIRT_SPEC_CTRL               BIT(7, UL)

> +extern uint64_t vmx_tertiary_exec_control;
> +
>  #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
>  #define VMX_EPT_WALK_LENGTH_4_SUPPORTED                     0x00000040
>  #define VMX_EPT_MEMORY_TYPE_UC                              0x00000100
> @@ -295,6 +304,8 @@ extern u64 vmx_ept_vpid_cap;
>      (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
>  #define cpu_has_vmx_secondary_exec_control \
>      (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
> +#define cpu_has_vmx_tertiary_exec_control \
> +    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS)
>  #define cpu_has_vmx_ept \
>      (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
>  #define cpu_has_vmx_dt_exiting \
> @@ -422,6 +433,7 @@ enum vmcs_field {
>      VIRT_EXCEPTION_INFO             = 0x0000202a,
>      XSS_EXIT_BITMAP                 = 0x0000202c,
>      TSC_MULTIPLIER                  = 0x00002032,
> +    TERTIARY_VM_EXEC_CONTROL        = 0x00002034,
>      GUEST_PHYSICAL_ADDRESS          = 0x00002400,
>      VMCS_LINK_POINTER               = 0x00002800,
>      GUEST_IA32_DEBUGCTL             = 0x00002802,
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -347,6 +347,7 @@
>  #define MSR_IA32_VMX_TRUE_EXIT_CTLS             0x48f
>  #define MSR_IA32_VMX_TRUE_ENTRY_CTLS            0x490
>  #define MSR_IA32_VMX_VMFUNC                     0x491
> +#define MSR_IA32_VMX_PROCBASED_CTLS3            0x492

Shouldn't this be added above the "Legacy MSR constants in need of
cleanup.  No new MSRs below this comment." line?

>  
>  /* K7/K8 MSRs. Not complete. See the architecture manual for a more
>     complete list. */
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -760,6 +760,12 @@ void vmx_update_secondary_exec_control(s
>                    v->arch.hvm.vmx.secondary_exec_control);
>  }
>  
> +void vmx_update_tertiary_exec_control(struct vcpu *v)

const vcpu?

Thanks, Roger.

