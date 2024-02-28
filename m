Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D271986B24B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 15:48:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686684.1068992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLEF-00016k-7P; Wed, 28 Feb 2024 14:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686684.1068992; Wed, 28 Feb 2024 14:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLEF-00014u-3V; Wed, 28 Feb 2024 14:48:15 +0000
Received: by outflank-mailman (input) for mailman id 686684;
 Wed, 28 Feb 2024 14:48:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfLED-00014o-Ox
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 14:48:13 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 654e27e3-d648-11ee-afd8-a90da7624cb6;
 Wed, 28 Feb 2024 15:48:12 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a3d484a58f6so791806466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 06:48:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 lf7-20020a170907174700b00a4316384159sm1912315ejc.224.2024.02.28.06.48.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 06:48:11 -0800 (PST)
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
X-Inumbo-ID: 654e27e3-d648-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709131692; x=1709736492; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T6SqAr8zRjYU0xw/FLOnzZ8QZ6ZQnxq79TKnjkGfqk=;
        b=YgWsPuF26+YbI64fTVyvvx/9Pe6LnYS23k80Qsow+zVmHxm05bduQ64tKZzBUWJkyp
         7/qhXjYLbQO2kxjpe2pe716WGp9mWQhOqpSbodx8iIY+zAZuh/SxOH1RcIUiLc04B6+f
         SSGFPhXX2WIU4msB0lkz6FngwD0fVMUVBMKqg/XUD8rhcpH7RWWrV69dpDGmknegQ44R
         51kKb8xQES0nY9Mp/a/r2cvE/aLDcukFiyB09To6ORcBzijMaN3p6HME9FgF3yMHdZ60
         0yTc0sPZp3J/TihWDB/MWvIQmQeWyJ4ruFMlINnIy6aTEkGgQXQsBP01QCvDzypJ89xi
         S6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709131692; x=1709736492;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8T6SqAr8zRjYU0xw/FLOnzZ8QZ6ZQnxq79TKnjkGfqk=;
        b=jBDqDTwW/7cCwlZd5GheFpKAVSsFUoUjg68U/uD/hK+RXwjWaNchPOqZ6PEMKpazbO
         AGv1WwVQSWbRh7QCGHJsdGYfiETLRoDwQhIM+TEcjHPbE/iRrOzg7Is6/tqXBIFbUevN
         Z5njAz1yAoV7aZ4+dPUqNRSPGT4baV+tMVzIijFIGat050RuXwQ1JQourRfi/Tv9XctY
         ehm//29X+f0PndY8f+P+NzvMTN+ICyBBZTQyn3ZM1eXh30P1TnTLcCBM7wrobl9ha1zL
         AC8k29IU9ftS5JqgPa7hB6HmQFQn3qlXpMYsCy1tHkwXfwGeW/XJLml+mSdDLTpXi8cW
         irBQ==
X-Gm-Message-State: AOJu0YwA/DdM2C/9u/mBORDyziuDclSGUtT/7vgJTP7wgLMbZklOsoR/
	kj1/b7K6Vdtql7kCDM9RT1NRS08wFM+D2omLo6RiJs9SHCDUBJrjSTvB+9ovf9+ebBzQKcIeCaU
	=
X-Google-Smtp-Source: AGHT+IHIftzain54YhWj9ebHX9KxhqYls7nqAQPwBaAoCPecTYqGy4pwmjZoTEt7VRxpARLXJEwdgA==
X-Received: by 2002:a17:906:ce30:b0:a3f:bd94:4d80 with SMTP id sd16-20020a170906ce3000b00a3fbd944d80mr8515992ejb.76.1709131691832;
        Wed, 28 Feb 2024 06:48:11 -0800 (PST)
Message-ID: <58656398-2d64-48b8-9ddc-c6836847a586@suse.com>
Date: Wed, 28 Feb 2024 15:48:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: serializing of non-serializing MSR writes
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Linux commit 25a068b8e9a4e ("x86/apic: Add extra serialization for non-
serializing MSRs") explains why an MFENCE+LFENCE pair is generally
needed ahead of ICR writes in x2APIC mode, and also why at least in
theory such is also needed ahead of TSC_DEADLINE writes. A comment of
our own in send_IPI_mask_x2apic_phys() further explains a condition
under which the LFENCE can be avoided.

Further Linux commit 04c3024560d3 ("x86/barrier: Do not serialize MSR
accesses on AMD") explains that this barrier isn't needed on AMD or
Hygon, and is in fact hampering performance in a measurable way.

Introduce a similarly named helper function, but with a parameter
allowing callers to specify whether a memory access will follow, thus
permitting the LFENCE to be omitted.

Putting an instance in apic_wait_icr_idle() is to be on the safe side.
The one case where it was clearly missing is in send_IPI_shortcut(),
which is also used in x2APIC mode when called from send_IPI_mask().

Function comment shamelessly borrowed (but adapted) from Linux.

Fixes: 5500d265a2a8 ("x86/smp: use APIC ALLBUT destination shorthand when possible")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I question the need for a fence ahead of writing TSC_DEADLINE: The Linux
commit message talks about LVT being accessed via MMIO in xAPIC mode,
but that should not be relevant here: It's all the local CPU, so there
ought to not be visibility concerns (much like for a self-IPI no fence
is needed ahead of the ICR write). If that wasn't needed, we could
further use alternatives patching to remove the fence also from
apic_wait_icr_idle() when in xAPIC mode. (And only then would I agree to
have APIC in the feature identifier, like Linux has it.)

A number of apic_write() may better be turned into apic_mem_write(), in
particular e.g. the ones in send_IPI_mask_{flat,phys}(). That way it
would be quite a bit easier to spot paths taken only in xAPIC mode.

The INIT-INIT-SIPI sequence for AP startup doesn't use any barrier, also
not in Linux afaics. I can't explain the lack thereof, though.

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1309,6 +1309,12 @@ int reprogram_timer(s_time_t timeout)
 
     if ( tdt_enabled )
     {
+        /*
+         * WRMSR to TSC_DEADLINE is not serializing.  We could pass @timeout
+         * here, but the passed value is preferably compile-time-constant.
+         */
+        weak_wrmsr_fence(false);
+
         wrmsrl(MSR_IA32_TSC_DEADLINE, timeout ? stime2tsc(timeout) : 0);
         return 1;
     }
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -675,8 +675,12 @@ void amd_log_freq(const struct cpuinfo_x
 
 void cf_check early_init_amd(struct cpuinfo_x86 *c)
 {
-	if (c == &boot_cpu_data)
+	if (c == &boot_cpu_data) {
+		/* No fencing needed ahead of certain MSR writes. */
+		setup_force_cpu_cap(X86_FEATURE_NO_WRMSR_FENCE);
+
 		amd_init_levelling();
+	}
 
 	ctxt_switch_levelling(NULL);
 }
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -97,15 +97,15 @@ static void cf_check send_IPI_mask_x2api
 
     /*
      * Ensure that any synchronisation data written in program order by this
-     * CPU is seen by notified remote CPUs. The WRMSR contained within
-     * apic_icr_write() can otherwise be executed early.
+     * CPU is seen by notified remote CPUs. The WRMSR contained in the loop
+     * below can otherwise be executed early.
      * 
-     * The reason smp_mb() is sufficient here is subtle: the register arguments
+     * The reason MFENCE is sufficient here is subtle: the register arguments
      * to WRMSR must depend on a memory read executed after the barrier. This
      * is guaranteed by cpu_physical_id(), which reads from a global array (and
      * so cannot be hoisted above the barrier even by a clever compiler).
      */
-    smp_mb();
+    weak_wrmsr_fence(true);
 
     local_irq_save(flags);
 
@@ -130,7 +130,7 @@ static void cf_check send_IPI_mask_x2api
     const cpumask_t *cluster_cpus;
     unsigned long flags;
 
-    smp_mb(); /* See above for an explanation. */
+    weak_wrmsr_fence(true); /* See above for an explanation. */
 
     local_irq_save(flags);
 
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -24,7 +24,7 @@ XEN_CPUFEATURE(APERFMPERF,        X86_SY
 XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
 XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
 XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */
-/* Bit 12 unused. */
+XEN_CPUFEATURE(NO_WRMSR_FENCE,    X86_SYNTH(12)) /* No MFENCE{,+LFENCE} ahead of certain WRMSR. */
 XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
 XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
 XEN_CPUFEATURE(SC_NO_BRANCH_HARDEN, X86_SYNTH(15)) /* (Disable) Conditional branch hardening */
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -97,6 +97,25 @@ static inline void msr_split(struct cpu_
     regs->rax = (uint32_t)val;
 }
 
+/*
+ * Make previous memory operations globally visible before a WRMSR.  Most
+ * WRMSRs are full serializing instructions themselves and do not require this
+ * barrier.  This may only be required for the TSC_DEADLINE and x2APIC MSRs.
+ *
+ * MFENCE makes writes visible, but only affects load/store instructions.
+ * WRMSR is unfortunately not a load/store instruction and is unaffected by
+ * MFENCE.  The LFENCE ensures that the WRMSR is not reordered, but callers
+ * can indicate to avoid it when they have a suitable memory access between
+ * the invocation of this function and the WRMSR in question.
+ */
+static inline void weak_wrmsr_fence(bool have_mem_access)
+{
+    alternative("mfence", "", X86_FEATURE_NO_WRMSR_FENCE);
+
+    if ( !have_mem_access )
+        alternative("lfence", "", X86_FEATURE_NO_WRMSR_FENCE);
+}
+
 static inline uint64_t rdtsc(void)
 {
     uint32_t low, high;
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -39,7 +39,10 @@ static unsigned int prepare_ICR2(unsigne
 void apic_wait_icr_idle(void)
 {
     if ( x2apic_enabled )
+    {
+        weak_wrmsr_fence(false);
         return;
+    }
 
     while ( apic_read(APIC_ICR) & APIC_ICR_BUSY )
         cpu_relax();

