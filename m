Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A53D86BE13
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 02:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686827.1069344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfUwE-0007wk-PK; Thu, 29 Feb 2024 01:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686827.1069344; Thu, 29 Feb 2024 01:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfUwE-0007um-Mf; Thu, 29 Feb 2024 01:10:18 +0000
Received: by outflank-mailman (input) for mailman id 686827;
 Thu, 29 Feb 2024 01:10:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPQN=KG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfUwD-0007ud-Q5
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 01:10:17 +0000
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b9fcd7b-d69f-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 02:10:16 +0100 (CET)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-686a92a8661so1427736d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 17:10:15 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 mf15-20020a0562145d8f00b0068cc0b46682sm171047qvb.4.2024.02.28.17.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 17:10:13 -0800 (PST)
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
X-Inumbo-ID: 4b9fcd7b-d69f-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709169014; x=1709773814; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zigJQi4wIFSrs+HGgYuL+wnmWC7wTVrxj7zxCQOvnJk=;
        b=CgPXXa19FGXATcFrbDQbJ4qzeiLcK5QRs1hlGbSYWW9a0h2NmhxfNoiCfVNqDSU0Y2
         UtMNZ2+O4ChaHkaZA3qcP4dTkkp+HjbDt9uoc7WeRJficvQ0suL0sNiZjAdDGHEAzb3z
         ++CRosLv/HPxJ4rBM8bt8pPda6joMgmme9xqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709169014; x=1709773814;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zigJQi4wIFSrs+HGgYuL+wnmWC7wTVrxj7zxCQOvnJk=;
        b=uSGQ0r67EneZJBCA7h54D/8YtEuuw64NS2qtVL1yENFckjsf6kVEqnVEQ+g4tOK+vb
         QSzdfAmclbp1UF0dl6MPOzAfxDVctSaUc/meL6i9BHtS5wEZ2uwC3Iz/wKNAa1nZ87Nx
         cApSVQaCMKEJKqFhyoHiDUS6a3vsuXF21+TmvE64/jM6XTbutbdBOvO4/cU094xbBruz
         penFW+T/w2APlD6CCIXUsjT2CfbNEV8II861vOy9RPDm+5Vszk18NqP5GVENnidpnaAr
         FgHqHD3gdcf4DUVhQ3qVM/XNrX/7z2V7xDPcmAAwkvKaOH3ooRlMIK7MFGisDPR8UgEA
         98pg==
X-Forwarded-Encrypted: i=1; AJvYcCWHfuzMi59d7tW64gk6dDeymUNRzZoFoBioH87tOQrJNPqT5HF8kb5dv+YZfB7a2BINbEOudxXTEGE/6cOUyE30xMyMxQlPirGPoH8c/3U=
X-Gm-Message-State: AOJu0YyznLqbMzv5sllFQPoYdfTagkTRncdKHXBeio1CUWSaPiSpcl9a
	UqXsLczrrI5Ylcy672O+KZbGcCyCDR6z+bVZuAr4BOIkTcBkGkN/im6zSYJVZD0=
X-Google-Smtp-Source: AGHT+IEA5AtkoR0X4zpaCMVeZsWvIwRV0mkiA2sJfSNX+rt1LcO47BcjG5FGEflT3JCZHtNEg5gj8w==
X-Received: by 2002:a0c:da03:0:b0:68f:2c18:3b8a with SMTP id x3-20020a0cda03000000b0068f2c183b8amr749829qvj.61.1709169014634;
        Wed, 28 Feb 2024 17:10:14 -0800 (PST)
Message-ID: <3bc3a319-45a8-4b22-b225-a2b19ee04c28@citrix.com>
Date: Thu, 29 Feb 2024 01:10:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: serializing of non-serializing MSR writes
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Dave Hansen <dave.hansen@intel.com>
References: <58656398-2d64-48b8-9ddc-c6836847a586@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <58656398-2d64-48b8-9ddc-c6836847a586@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/02/2024 2:48 pm, Jan Beulich wrote:
> Linux commit 25a068b8e9a4e ("x86/apic: Add extra serialization for non-
> serializing MSRs") explains why an MFENCE+LFENCE pair is generally
> needed ahead of ICR writes in x2APIC mode, and also why at least in
> theory such is also needed ahead of TSC_DEADLINE writes. A comment of
> our own in send_IPI_mask_x2apic_phys() further explains a condition
> under which the LFENCE can be avoided.
>
> Further Linux commit 04c3024560d3 ("x86/barrier: Do not serialize MSR
> accesses on AMD") explains that this barrier isn't needed on AMD or
> Hygon, and is in fact hampering performance in a measurable way.
>
> Introduce a similarly named helper function, but with a parameter
> allowing callers to specify whether a memory access will follow, thus
> permitting the LFENCE to be omitted.
>
> Putting an instance in apic_wait_icr_idle() is to be on the safe side.
> The one case where it was clearly missing is in send_IPI_shortcut(),
> which is also used in x2APIC mode when called from send_IPI_mask().
>
> Function comment shamelessly borrowed (but adapted) from Linux.
>
> Fixes: 5500d265a2a8 ("x86/smp: use APIC ALLBUT destination shorthand when possible")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I question the need for a fence ahead of writing TSC_DEADLINE: The Linux
> commit message talks about LVT being accessed via MMIO in xAPIC mode,
> but that should not be relevant here: It's all the local CPU, so there
> ought to not be visibility concerns (much like for a self-IPI no fence
> is needed ahead of the ICR write). If that wasn't needed, we could
> further use alternatives patching to remove the fence also from
> apic_wait_icr_idle() when in xAPIC mode. (And only then would I agree to
> have APIC in the feature identifier, like Linux has it.)
>
> A number of apic_write() may better be turned into apic_mem_write(), in
> particular e.g. the ones in send_IPI_mask_{flat,phys}(). That way it
> would be quite a bit easier to spot paths taken only in xAPIC mode.
>
> The INIT-INIT-SIPI sequence for AP startup doesn't use any barrier, also
> not in Linux afaics. I can't explain the lack thereof, though.

I have some opinions about what Linux did here...  I don't think a
single vendor/arch-neutral helper can possibly be right.

It is vendor and uarch dependent which WRMSR's transparently degrade to
WRMSRNS, and it is vendor dependent which serialising sequence to use
(if any).  e.g. AMD have recently (Zen2 uarch I believe) retroactively
defined FS/GS_BASE to be non-serialising.  (And this is another CPUID
bit we need to OR backwards in time.)

Furthermore, IIRC AMD still owe us an update to the APM; the APM
currently says that a serialising sequence is needed for ICR.  I'm told
this isn't actually true, but I'm also very wary making an adjustment
which is directly contradicted by the docs.


The Linux change explains why in principle the IPI can be emitted before
the stores are visible.

This does actually explain TSC_DEADLINE too.  Setting a deadline in the
past gets you an interrupt immediately, and if you combine that with a
WRMSR being ordered ahead of an MFENCE, then causality is violated. 
You'll take the interrupt on whichever instruction boundary has most
recently retired, which will can be the wrong side of the WRMSR
triggering the interrupts, at which point you'll livelock taking timer
interrupts and re-arming the timer in the past.


Now, for fencing, things are more complicated.  AMD define MFENCE as
architecturally serialising.  Intel do not, hence why apparently a WRMSR
can possibly move across it.  The LFENCE is added for it's new
speculative property of dispatch serialising.

We don't actually care about architecturally serialising.  If someone is
interacting with these MSRs with relevant data in WC memory, then they
get to keep all resulting pieces.

However, we do care about plain stores, and for that we do need an
MFENCE;LFENCE on Intel  (The jury is out on whether a single
SERIALIZE[sic] would be better, but it should have the correct semantics
architecturally speaking.)

In particular, ...


>
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -1309,6 +1309,12 @@ int reprogram_timer(s_time_t timeout)
>  
>      if ( tdt_enabled )
>      {
> +        /*
> +         * WRMSR to TSC_DEADLINE is not serializing.  We could pass @timeout
> +         * here, but the passed value is preferably compile-time-constant.
> +         */
> +        weak_wrmsr_fence(false);
> +
>          wrmsrl(MSR_IA32_TSC_DEADLINE, timeout ? stime2tsc(timeout) : 0);
>          return 1;
>      }
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -675,8 +675,12 @@ void amd_log_freq(const struct cpuinfo_x
>  
>  void cf_check early_init_amd(struct cpuinfo_x86 *c)
>  {
> -	if (c == &boot_cpu_data)
> +	if (c == &boot_cpu_data) {
> +		/* No fencing needed ahead of certain MSR writes. */
> +		setup_force_cpu_cap(X86_FEATURE_NO_WRMSR_FENCE);
> +
>  		amd_init_levelling();
> +	}
>  
>  	ctxt_switch_levelling(NULL);
>  }
> --- a/xen/arch/x86/genapic/x2apic.c
> +++ b/xen/arch/x86/genapic/x2apic.c
> @@ -97,15 +97,15 @@ static void cf_check send_IPI_mask_x2api
>  
>      /*
>       * Ensure that any synchronisation data written in program order by this
> -     * CPU is seen by notified remote CPUs. The WRMSR contained within
> -     * apic_icr_write() can otherwise be executed early.
> +     * CPU is seen by notified remote CPUs. The WRMSR contained in the loop
> +     * below can otherwise be executed early.
>       * 
> -     * The reason smp_mb() is sufficient here is subtle: the register arguments
> +     * The reason MFENCE is sufficient here is subtle: the register arguments
>       * to WRMSR must depend on a memory read executed after the barrier. This
>       * is guaranteed by cpu_physical_id(), which reads from a global array (and
>       * so cannot be hoisted above the barrier even by a clever compiler).
>       */
> -    smp_mb();
> +    weak_wrmsr_fence(true);
>  
>      local_irq_save(flags);
>  
> @@ -130,7 +130,7 @@ static void cf_check send_IPI_mask_x2api
>      const cpumask_t *cluster_cpus;
>      unsigned long flags;
>  
> -    smp_mb(); /* See above for an explanation. */
> +    weak_wrmsr_fence(true); /* See above for an explanation. */
>  
>      local_irq_save(flags);
>  
> --- a/xen/arch/x86/include/asm/cpufeatures.h
> +++ b/xen/arch/x86/include/asm/cpufeatures.h
> @@ -24,7 +24,7 @@ XEN_CPUFEATURE(APERFMPERF,        X86_SY
>  XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
>  XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
>  XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */
> -/* Bit 12 unused. */
> +XEN_CPUFEATURE(NO_WRMSR_FENCE,    X86_SYNTH(12)) /* No MFENCE{,+LFENCE} ahead of certain WRMSR. */
>  XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
>  XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
>  XEN_CPUFEATURE(SC_NO_BRANCH_HARDEN, X86_SYNTH(15)) /* (Disable) Conditional branch hardening */
> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -97,6 +97,25 @@ static inline void msr_split(struct cpu_
>      regs->rax = (uint32_t)val;
>  }
>  
> +/*
> + * Make previous memory operations globally visible before a WRMSR.  Most
> + * WRMSRs are full serializing instructions themselves and do not require this
> + * barrier.  This may only be required for the TSC_DEADLINE and x2APIC MSRs.
> + *
> + * MFENCE makes writes visible, but only affects load/store instructions.
> + * WRMSR is unfortunately not a load/store instruction and is unaffected by
> + * MFENCE.

[ On Intel.   AMD didn't end up with this (mis)behaviour. ]

>   The LFENCE ensures that the WRMSR is not reordered, but callers
> + * can indicate to avoid it when they have a suitable memory access between
> + * the invocation of this function and the WRMSR in question.

... this makes no sense.

We need the LFENCE for dispatch serialising properties, not it's load
ordering properties.  What use will other memory have, when the entire
problem is that WRMSR doesn't interact with them?

Worse, it's a Spectre-v1 gadget and we're now acutely familiar with how
the CPU will find its way around these.  So even expressing "I
critically need the LFENCE" still gets you pot luck on whether it has
any effect against a causality-violating WRMSR.

~Andrew

> + */
> +static inline void weak_wrmsr_fence(bool have_mem_access)
> +{
> +    alternative("mfence", "", X86_FEATURE_NO_WRMSR_FENCE);
> +
> +    if ( !have_mem_access )
> +        alternative("lfence", "", X86_FEATURE_NO_WRMSR_FENCE);
> +}
> +
>  static inline uint64_t rdtsc(void)
>  {
>      uint32_t low, high;
> --- a/xen/arch/x86/smp.c
> +++ b/xen/arch/x86/smp.c
> @@ -39,7 +39,10 @@ static unsigned int prepare_ICR2(unsigne
>  void apic_wait_icr_idle(void)
>  {
>      if ( x2apic_enabled )
> +    {
> +        weak_wrmsr_fence(false);
>          return;
> +    }
>  
>      while ( apic_read(APIC_ICR) & APIC_ICR_BUSY )
>          cpu_relax();


