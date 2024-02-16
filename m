Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA54857897
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 10:12:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682055.1061106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rauG3-00072P-Ps; Fri, 16 Feb 2024 09:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682055.1061106; Fri, 16 Feb 2024 09:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rauG3-000704-Mo; Fri, 16 Feb 2024 09:11:47 +0000
Received: by outflank-mailman (input) for mailman id 682055;
 Fri, 16 Feb 2024 09:11:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dcAy=JZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rauG3-0006zy-4C
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 09:11:47 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 685f0bbd-ccab-11ee-8a4f-1f161083a0e0;
 Fri, 16 Feb 2024 10:11:45 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d109e7bed2so23203341fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 01:11:45 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05620a22ad00b0078565ed2bc6sm1336749qkh.124.2024.02.16.01.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 01:11:44 -0800 (PST)
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
X-Inumbo-ID: 685f0bbd-ccab-11ee-8a4f-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708074705; x=1708679505; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UhNCxLnq2Bh/M+Qg1rjlgZSPcWfjNiUbNdNc86SOifE=;
        b=cpgV194Hv0ED1EfVBvj8lIHvVJeM9w0Ilgc+GPZE40ANDlF99xWdLQTGr8EDmLPFA1
         3/Gd4VfHSuh3p+rdBS+w+40q4ISpAMvKz5ZKaxpG98cHJhZngwKPR7Y71tIwTJSSpEwF
         Wnw5Fu4Jw2LU64LKZPHorCLovoqUGMb/f5IwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708074705; x=1708679505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhNCxLnq2Bh/M+Qg1rjlgZSPcWfjNiUbNdNc86SOifE=;
        b=FLvIcE/wG/9H5ydUtawoUPOxQal3bAs7XkQIvrWV+XS/o1wU2qwBZnUeUUeUuQLHau
         dpUoWBSVveNhXamEwz5mRTYJ2rkXiqwiGK54WuAobn1YvwS8Swi6d+aqjHU4ObFyRQiJ
         1dHLRI6CvMHk4aVpJzgUnB17BfQui1ESwRrv9FTTgB7R7TYZ/LhXjkmZf/whfVbNbWlR
         bKN/OBIXMk13ekr44H3KdE4q6V48r5HXiu02TdSfDI3bC8GlCnG+yO3y4dSWPA2KiVmI
         WeGaolenndhER0hzHD5/0H7IN9HKHTkCoMGjGNUgU57g4cqIBTUesiBSyFA1eQz/hMky
         KcOg==
X-Gm-Message-State: AOJu0Yw2Q3F1Qonp/1ijChPTQXLalDc2UQO1QQqibp6QtbaIzOOfa77n
	KqTYiMbsL0Fp7NcEObR+0alwE0TsKf4OAG+e2kM8dMo/z1muAln5UWeTKp3D8C8=
X-Google-Smtp-Source: AGHT+IG36kIwA9kRzfLhRc+OotuuzAsRXdzaJfGfrqRkDL2NBMY4AZZUvinOAkKdOKI7V46jQI1wLQ==
X-Received: by 2002:a2e:b707:0:b0:2d2:1c15:dc0b with SMTP id j7-20020a2eb707000000b002d21c15dc0bmr462761ljo.40.1708074705285;
        Fri, 16 Feb 2024 01:11:45 -0800 (PST)
Date: Fri, 16 Feb 2024 10:11:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86: amend 'n' debug-key output with SMI count
Message-ID: <Zc8mzlzLTJNwBJup@macbook>
References: <549909b7-e34c-4a5c-aa21-9892a1724042@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <549909b7-e34c-4a5c-aa21-9892a1724042@suse.com>

On Wed, Feb 14, 2024 at 11:15:51AM +0100, Jan Beulich wrote:
> ... if available only, of course.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I don't really like issuing an IPI (and having another cf_check
> function) here, yet then again this is issued only when the debug key
> is actually used, and given how simple the handling function is
> (including that it doesn't use its parameter) it also looks difficult
> to abuse.
> ---
> v2: Actually read each CPU's SMI count in do_nmi_stats().
> 
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -407,9 +407,15 @@ void __init early_cpu_init(bool verbose)
>  		paddr_bits -= (ebx >> 6) & 0x3f;
>  	}
>  
> -	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
> +	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON))) {
> +		uint64_t smi_count;
> +
>  		park_offline_cpus = opt_mce;
>  
> +		if (!verbose && !rdmsr_safe(MSR_SMI_COUNT, smi_count))
> +			setup_force_cpu_cap(X86_FEATURE_SMI_COUNT);

Why make it dependent on !verbose?  The call with !verbose is tied to
part of the ucode loading being half-functional (for example
MCU_CONTROL_DIS_MCU_LOAD not being set) but I don't see that as a
signal that SMI count shouldn't be used.

does it need to be part of the early cpu initialization instead of
being in the (later) Intel specific init code part of the
identify_cpu()?

> +	}
> +
>  	initialize_cpu_data(0);
>  }
>  
> --- a/xen/arch/x86/include/asm/cpufeatures.h
> +++ b/xen/arch/x86/include/asm/cpufeatures.h
> @@ -24,7 +24,7 @@ XEN_CPUFEATURE(APERFMPERF,        X86_SY
>  XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
>  XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
>  XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */
> -/* Bit 12 unused. */
> +XEN_CPUFEATURE(SMI_COUNT,         X86_SYNTH(12)) /* MSR_SMI_COUNT exists */
>  XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
>  XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
>  XEN_CPUFEATURE(SC_NO_BRANCH_HARDEN, X86_SYNTH(15)) /* (Disable) Conditional branch hardening */
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -28,6 +28,8 @@
>  #define  TEST_CTRL_SPLITLOCK_DETECT         (_AC(1, ULL) << 29)
>  #define  TEST_CTRL_SPLITLOCK_DISABLE        (_AC(1, ULL) << 31)
>  
> +#define MSR_SMI_COUNT                       0x00000034
> +
>  #define MSR_INTEL_CORE_THREAD_COUNT         0x00000035
>  #define  MSR_CTC_THREAD_MASK                0x0000ffff
>  #define  MSR_CTC_CORE_MASK                  _AC(0xffff0000, U)
> --- a/xen/arch/x86/nmi.c
> +++ b/xen/arch/x86/nmi.c
> @@ -585,15 +585,34 @@ static void cf_check do_nmi_trigger(unsi
>      self_nmi();
>  }
>  
> +static DEFINE_PER_CPU(unsigned int, smi_count);
> +
> +static void cf_check read_smi_count(void *unused)
> +{
> +    unsigned int dummy;
> +
> +    rdmsr(MSR_SMI_COUNT, this_cpu(smi_count), dummy);
> +}
> +
>  static void cf_check do_nmi_stats(unsigned char key)
>  {
>      const struct vcpu *v;
>      unsigned int cpu;
>      bool pend, mask;
>  
> -    printk("CPU\tNMI\n");
> +    printk("CPU\tNMI%s\n", boot_cpu_has(X86_FEATURE_SMI_COUNT) ? "\tSMI" : "");
> +
> +    if ( boot_cpu_has(X86_FEATURE_SMI_COUNT) )
> +        on_each_cpu(read_smi_count, NULL, 1);
> +
>      for_each_online_cpu ( cpu )
> -        printk("%3u\t%3u\n", cpu, per_cpu(nmi_count, cpu));
> +    {
> +        printk("%3u\t%3u", cpu, per_cpu(nmi_count, cpu));
> +        if ( boot_cpu_has(X86_FEATURE_SMI_COUNT) )
> +            printk("\t%3u\n", per_cpu(smi_count, cpu));
> +        else
> +            printk("\n");
> +    }
>  
>      if ( !hardware_domain || !(v = domain_vcpu(hardware_domain, 0)) )
>          return;

Could you also amend the debug-key help text to mention SMI?

Thanks, Roger.

