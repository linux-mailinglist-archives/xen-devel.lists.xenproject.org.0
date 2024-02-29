Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843EE86C46F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 10:03:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686896.1069478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfcJF-00087u-36; Thu, 29 Feb 2024 09:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686896.1069478; Thu, 29 Feb 2024 09:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfcJF-00086O-0H; Thu, 29 Feb 2024 09:02:33 +0000
Received: by outflank-mailman (input) for mailman id 686896;
 Thu, 29 Feb 2024 09:02:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfcJD-00086G-SS
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 09:02:31 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 442d1994-d6e1-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 10:02:30 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-565a3910f86so987544a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 01:02:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s12-20020a056402520c00b0056691924615sm414578edd.2.2024.02.29.01.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 01:02:28 -0800 (PST)
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
X-Inumbo-ID: 442d1994-d6e1-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709197349; x=1709802149; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A440DB1rpePBv7q7I/YQhlrb420DWDiyJv6Tx+CZ5uA=;
        b=LhWVjAGytZvsTdpaZlaY+BFkmvYjdfu6FJ7YOUvahGT7Vgd57zoMjwwnct8ew3aMWI
         7j4unoyj8N1TfVHLLqMH+T/HG/L+VeK8MkajG3StKnZtRiciCzINRqNjHjb1xJUfbiR7
         TmTwXTIpr1CoVAFt/Xn3lQJPw1yeY+siUfhMJ6+pw9NSd4+VcLczhVVWxynwv6Vo0OiF
         wIH5hW1TVPPsl7heG9tOdVybrUHvD1tzvSEeEWRTSUAHQOptksfEZfNAJubz8s59d3VO
         FK+aMmKCaM/bSok/F02MKtdlt8CW/MBeRqJJl2od0koIn9TsBQ8+vUKzCmGG3SepGrLo
         BXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709197349; x=1709802149;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A440DB1rpePBv7q7I/YQhlrb420DWDiyJv6Tx+CZ5uA=;
        b=wRNjLTWddP8n515vTH0mhV8EEDqmyOER3KUW9EiyjP5ooFX2ZkxaAlYLJbnE/kZu5R
         ItA26z0OW90Vwhmqh97V7y3fF0XlaqN5BYHPUQiC3/MOZWb+FyT2uLZRN/99App46eMB
         QMjqhDL2ra0D2mZJl7jMLt+W+5TsujqPpxOLMdDt8ub7c5PiOO4up6vowMk4YwoL1cFc
         2hhdixQhL7eLn/QHNvReYno+4l1tZqfVY6vGqWF1ITywteUhkzY3S7sB5Ch9cyrDdWPY
         3KABf11Gg5PME+uWPboBdk6leOUmkI7rQC0riUMEbhE14CSGAfn2+PrJRZ+sSYMsLMFB
         zdCA==
X-Forwarded-Encrypted: i=1; AJvYcCVkzDLP4VpZ+0fX1MTA6qpFp7sD5w/IkmtWSkmMvBHCmWeQuJAsPevrN5wXg7hGya2NNO7f6dd2vEgmBMvFCafKRKEzNwVSljAoWk8yCf0=
X-Gm-Message-State: AOJu0Yxs0iC7Fk4nH57I6slM3mqR7GmcsxjNTMHxBxq8bTQvlbsHOA+j
	VCUlmyvh1tYBbrwwLXJwFzSsL5y+u0LsZwGCt2WLcWMiFipzrYZKqDU8DYGNJQ==
X-Google-Smtp-Source: AGHT+IEQ35IA/S9f+UX5V7UcXXAkVypu3ElqFMIJRrUFLmS7faCc3K40/tciZ8nMfraRgVEPVn1mug==
X-Received: by 2002:a05:6402:2153:b0:565:bb25:bb7b with SMTP id bq19-20020a056402215300b00565bb25bb7bmr1031236edb.6.1709197349201;
        Thu, 29 Feb 2024 01:02:29 -0800 (PST)
Message-ID: <e9140136-3446-4d0f-a977-549d5aed11a1@suse.com>
Date: Thu, 29 Feb 2024 10:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: serializing of non-serializing MSR writes
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Dave Hansen <dave.hansen@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <58656398-2d64-48b8-9ddc-c6836847a586@suse.com>
 <3bc3a319-45a8-4b22-b225-a2b19ee04c28@citrix.com>
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
In-Reply-To: <3bc3a319-45a8-4b22-b225-a2b19ee04c28@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.02.2024 02:10, Andrew Cooper wrote:
> On 28/02/2024 2:48 pm, Jan Beulich wrote:
>> Linux commit 25a068b8e9a4e ("x86/apic: Add extra serialization for non-
>> serializing MSRs") explains why an MFENCE+LFENCE pair is generally
>> needed ahead of ICR writes in x2APIC mode, and also why at least in
>> theory such is also needed ahead of TSC_DEADLINE writes. A comment of
>> our own in send_IPI_mask_x2apic_phys() further explains a condition
>> under which the LFENCE can be avoided.
>>
>> Further Linux commit 04c3024560d3 ("x86/barrier: Do not serialize MSR
>> accesses on AMD") explains that this barrier isn't needed on AMD or
>> Hygon, and is in fact hampering performance in a measurable way.
>>
>> Introduce a similarly named helper function, but with a parameter
>> allowing callers to specify whether a memory access will follow, thus
>> permitting the LFENCE to be omitted.
>>
>> Putting an instance in apic_wait_icr_idle() is to be on the safe side.
>> The one case where it was clearly missing is in send_IPI_shortcut(),
>> which is also used in x2APIC mode when called from send_IPI_mask().
>>
>> Function comment shamelessly borrowed (but adapted) from Linux.
>>
>> Fixes: 5500d265a2a8 ("x86/smp: use APIC ALLBUT destination shorthand when possible")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I question the need for a fence ahead of writing TSC_DEADLINE: The Linux
>> commit message talks about LVT being accessed via MMIO in xAPIC mode,
>> but that should not be relevant here: It's all the local CPU, so there
>> ought to not be visibility concerns (much like for a self-IPI no fence
>> is needed ahead of the ICR write). If that wasn't needed, we could
>> further use alternatives patching to remove the fence also from
>> apic_wait_icr_idle() when in xAPIC mode. (And only then would I agree to
>> have APIC in the feature identifier, like Linux has it.)
>>
>> A number of apic_write() may better be turned into apic_mem_write(), in
>> particular e.g. the ones in send_IPI_mask_{flat,phys}(). That way it
>> would be quite a bit easier to spot paths taken only in xAPIC mode.
>>
>> The INIT-INIT-SIPI sequence for AP startup doesn't use any barrier, also
>> not in Linux afaics. I can't explain the lack thereof, though.
> 
> I have some opinions about what Linux did here...  I don't think a
> single vendor/arch-neutral helper can possibly be right.
> 
> It is vendor and uarch dependent which WRMSR's transparently degrade to
> WRMSRNS, and it is vendor dependent which serialising sequence to use
> (if any).  e.g. AMD have recently (Zen2 uarch I believe) retroactively
> defined FS/GS_BASE to be non-serialising.  (And this is another CPUID
> bit we need to OR backwards in time.)
> 
> Furthermore, IIRC AMD still owe us an update to the APM; the APM
> currently says that a serialising sequence is needed for ICR.  I'm told
> this isn't actually true, but I'm also very wary making an adjustment
> which is directly contradicted by the docs.

I can see you wanting the doc to be corrected. What I'm having trouble
with is you having indicated (long ago) that we can avoid this fence on
AMD, just to now effectively object to me (finally) getting around to
actually doing so?

> The Linux change explains why in principle the IPI can be emitted before
> the stores are visible.
> 
> This does actually explain TSC_DEADLINE too.  Setting a deadline in the
> past gets you an interrupt immediately, and if you combine that with a
> WRMSR being ordered ahead of an MFENCE, then causality is violated. 
> You'll take the interrupt on whichever instruction boundary has most
> recently retired, which will can be the wrong side of the WRMSR
> triggering the interrupts, at which point you'll livelock taking timer
> interrupts and re-arming the timer in the past.

Are you saying the interrupt is raised ahead of the insn retiring? That
would be concerning, imo.

Irrespective of that, as to live-locking: If that would really be a
possible issue, moving lapic_timer_on() ahead of local_irq_enable() in
acpi_processor_idle() and mwait_idle() would avoid that; the sole other
use of reprogram_timer() already runs with IRQs off.

> Now, for fencing, things are more complicated.  AMD define MFENCE as
> architecturally serialising.  Intel do not, hence why apparently a WRMSR
> can possibly move across it.  The LFENCE is added for it's new
> speculative property of dispatch serialising.
> 
> We don't actually care about architecturally serialising.  If someone is
> interacting with these MSRs with relevant data in WC memory, then they
> get to keep all resulting pieces.
> 
> However, we do care about plain stores, and for that we do need an
> MFENCE;LFENCE on Intel  (The jury is out on whether a single
> SERIALIZE[sic] would be better, but it should have the correct semantics
> architecturally speaking.)
> 
> In particular, ...
> 
>> --- a/xen/arch/x86/genapic/x2apic.c
>> +++ b/xen/arch/x86/genapic/x2apic.c
>> @@ -97,15 +97,15 @@ static void cf_check send_IPI_mask_x2api
>>  
>>      /*
>>       * Ensure that any synchronisation data written in program order by this
>> -     * CPU is seen by notified remote CPUs. The WRMSR contained within
>> -     * apic_icr_write() can otherwise be executed early.
>> +     * CPU is seen by notified remote CPUs. The WRMSR contained in the loop
>> +     * below can otherwise be executed early.
>>       * 
>> -     * The reason smp_mb() is sufficient here is subtle: the register arguments
>> +     * The reason MFENCE is sufficient here is subtle: the register arguments
>>       * to WRMSR must depend on a memory read executed after the barrier. This
>>       * is guaranteed by cpu_physical_id(), which reads from a global array (and
>>       * so cannot be hoisted above the barrier even by a clever compiler).
>>       */
>> -    smp_mb();
>> +    weak_wrmsr_fence(true);
>>  
>>      local_irq_save(flags);
>>  
>> @@ -130,7 +130,7 @@ static void cf_check send_IPI_mask_x2api
>>      const cpumask_t *cluster_cpus;
>>      unsigned long flags;
>>  
>> -    smp_mb(); /* See above for an explanation. */
>> +    weak_wrmsr_fence(true); /* See above for an explanation. */
>>  
>>      local_irq_save(flags);
>>  
>> --- a/xen/arch/x86/include/asm/cpufeatures.h
>> +++ b/xen/arch/x86/include/asm/cpufeatures.h
>> @@ -24,7 +24,7 @@ XEN_CPUFEATURE(APERFMPERF,        X86_SY
>>  XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
>>  XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
>>  XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */
>> -/* Bit 12 unused. */
>> +XEN_CPUFEATURE(NO_WRMSR_FENCE,    X86_SYNTH(12)) /* No MFENCE{,+LFENCE} ahead of certain WRMSR. */
>>  XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
>>  XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
>>  XEN_CPUFEATURE(SC_NO_BRANCH_HARDEN, X86_SYNTH(15)) /* (Disable) Conditional branch hardening */
>> --- a/xen/arch/x86/include/asm/msr.h
>> +++ b/xen/arch/x86/include/asm/msr.h
>> @@ -97,6 +97,25 @@ static inline void msr_split(struct cpu_
>>      regs->rax = (uint32_t)val;
>>  }
>>  
>> +/*
>> + * Make previous memory operations globally visible before a WRMSR.  Most
>> + * WRMSRs are full serializing instructions themselves and do not require this
>> + * barrier.  This may only be required for the TSC_DEADLINE and x2APIC MSRs.
>> + *
>> + * MFENCE makes writes visible, but only affects load/store instructions.
>> + * WRMSR is unfortunately not a load/store instruction and is unaffected by
>> + * MFENCE.
> 
> [ On Intel.   AMD didn't end up with this (mis)behaviour. ]
> 
>>   The LFENCE ensures that the WRMSR is not reordered, but callers
>> + * can indicate to avoid it when they have a suitable memory access between
>> + * the invocation of this function and the WRMSR in question.
> 
> ... this makes no sense.
> 
> We need the LFENCE for dispatch serialising properties, not it's load
> ordering properties.  What use will other memory have, when the entire
> problem is that WRMSR doesn't interact with them?

Are you suggesting the comment (and code) in send_IPI_mask_x2apic_*()
(left visible in context further up) are wrong then? I consider it
correct (looking forward to see you prove it wrong), and with that
having a way to avoid the LFENCE looks correct to me. Plus the comment
here doesn't say "load ordering" anywhere. It's strictly execution
ordering, guaranteed by a memory access the WRMSR input is dependent
upon. For load ordering, MFENCE alone would be enough.

> Worse, it's a Spectre-v1 gadget and we're now acutely familiar with how
> the CPU will find its way around these.  So even expressing "I
> critically need the LFENCE" still gets you pot luck on whether it has
> any effect against a causality-violating WRMSR.

Hmm, besides me possibly taking this as "drop this patch" (which could
do with making explicit, if that was meant), I'm afraid I can't view
this remark as actionable in any way. Yet I firmly expect an IPI to not
be raised speculatively (and, as said above, neither an LAPIC timer
interrupt), so I'm even having trouble seeing how this would form a
Spectre-v1 gadget.

Jan

