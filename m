Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6357D1F219
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 14:44:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203114.1518413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg1Al-0002xw-Ps; Wed, 14 Jan 2026 13:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203114.1518413; Wed, 14 Jan 2026 13:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg1Al-0002vS-ML; Wed, 14 Jan 2026 13:44:31 +0000
Received: by outflank-mailman (input) for mailman id 1203114;
 Wed, 14 Jan 2026 13:44:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vg1Ak-0001vr-5Z
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 13:44:30 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25ed765f-f14f-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 14:44:29 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so48164515e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 05:44:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee2840b7csm19538585e9.14.2026.01.14.05.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 05:44:28 -0800 (PST)
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
X-Inumbo-ID: 25ed765f-f14f-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768398269; x=1769003069; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OMhFYAP0uDgitdjy3newUKs3PAfrZxLBZ1KDOJga+EI=;
        b=U/UtIQeH6aAFX4hC3pA0zQZyIGoyag/vbmKRG2IwPWLwQ/0pJvte7QU2twxt9Es2GS
         lLnSlmj165HiaT+FFFsvYfUz+Kp35pAuvSuMKOBSdlz28ctftygXz2PZMxlIJZE6QAY7
         Nru6OW6DpSeq5m59HthDIHk61JstIwuqrx1plxQ62v6MMdB5vcKeaUf14zs0ZbFXGzh5
         hQnNOyxcoPtOA2mnBts6wtfvtFRfBrK8+NWRb1ihKE2M8q6q92ljrj7+HxGiMBTuzk7m
         IhSLXixQqv4fjfOXaeYx2TuLqgU2LO+oUmq0/zdQIZ194yLp7PHfYLbVW+HZUqBillvY
         pDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768398269; x=1769003069;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMhFYAP0uDgitdjy3newUKs3PAfrZxLBZ1KDOJga+EI=;
        b=FwCUfIIxegCveutiEwvI/S8YAwTryohKpoVbCbpBj+jCW9RrhGOex1hJXdOJniLIBX
         ny8th1yRchLxGmAUrBdR19b86eYTgU97/+aj1z0bHn5wR14ChFbocb/FAn3BnhXnuNPo
         nS/Kga43m9E6vRDVfovV1h7mmH7SInMGUwGx4BFcqoGLL/gioNJ1s0NyS88iGvBo93Cu
         aLhrS/DANkBx9tys0qKmKbed5Oy3px4YKKYn/KKIddpn1E7L0a/di3wm8Mpt68mDgrUR
         htEYtkvF7NL5UX66/3XDbU+w8IJW5U3azMiH8ZZ/Szq9jFMSovGKczU3rQSxFRDJ5t6f
         yAAg==
X-Gm-Message-State: AOJu0YwIMDADAmFQrfH0HB/KKUBX59c20wGXSaSFHsoiq4CGN8vAean7
	qm/6Y+ICx39+FSUrE0QOcht1oH8+9MzNERTlD+K3npQlgIIq8t9BwIXJ5L8e3sWIi38XlSf8rkN
	qMQQ=
X-Gm-Gg: AY/fxX7wA4M36/ZZ26CFb9UTYa+UZTMeornYW1+LJhSIRrxx/Ap2X8sGVqkrmm8QIpR
	wp1v1nokodNZpiDMP/+/+GX9r3zpw1wjeWq68gteyKTNGo09xpdEcM4/Mso9rFiT/DaFOLn7IP0
	Z1jLI28HiqPNa0hZUEOwJTAWHJcILEQ86UXY7cc2oo4dEeI4YhxFsmZMG9jy8IDmqvwBNMU6osh
	xwT70/P56YDwX4wrjJH+xBhpbmXRBMQeJ/yv2f7jnRsSMYwxPNH2rBsxSSjfJiKyZNV9mRvVtBI
	aKXZo1nTlez7hmvwAt2bqOzDGIHpFdLaTms89VaPCiviFmEos64+Dw6LVJoTrjaHrJoMH2oQpLJ
	+q4HmySAdeQDBaq7DHpzTvGuXTmXdx1txIEx2ftQ2+TRQau6g7sOtdsGSFBRxQbE954Fjwd9+9Y
	lZjtcaePU28WlGc8w1S3NQVrpS/7oefRPEyALsziIODRSKH590vjTZIM9oczIgnpyw+HOcnKx0y
	30=
X-Received: by 2002:a05:600c:8289:b0:47e:de23:dd6f with SMTP id 5b1f17b1804b1-47ee33441c9mr28442215e9.12.1768398268726;
        Wed, 14 Jan 2026 05:44:28 -0800 (PST)
Message-ID: <9d7de9e6-11ef-4cd5-94e1-4c1829ea94a3@suse.com>
Date: Wed, 14 Jan 2026 14:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/6] x86: rename ARAT feature flag
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <4d3a3576-2d3c-42ec-8551-18f1f0982e17@suse.com>
Content-Language: en-US
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
In-Reply-To: <4d3a3576-2d3c-42ec-8551-18f1f0982e17@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add a XEN infix, to properly distinguish it from the CPUID feature flag
(leaf 6 EAX bit 2).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Question is whether we still need opt_arat (and the command line option),
or whether we could go directly from the CPUID bit (overriding it to 1
for older AMD [and Hygon?] CPUs). Or whether to have opt_arat affect the
(host) CPU policy directly.

--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -109,7 +109,7 @@ void (*__read_mostly lapic_timer_on)(voi
 
 bool lapic_timer_init(void)
 {
-    if ( boot_cpu_has(X86_FEATURE_ARAT) )
+    if ( boot_cpu_has(X86_FEATURE_XEN_ARAT) )
     {
         lapic_timer_off = lapic_timer_nop;
         lapic_timer_on = lapic_timer_nop;
@@ -1463,7 +1463,7 @@ static void amd_cpuidle_init(struct acpi
 
         if ( !vendor_override )
         {
-            if ( !boot_cpu_has(X86_FEATURE_ARAT) )
+            if ( !boot_cpu_has(X86_FEATURE_XEN_ARAT) )
                 hpet_broadcast_init();
 
             if ( !lapic_timer_init() )
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1239,7 +1239,7 @@ static void cf_check init_amd(struct cpu
 	 * running in deep C states.
 	 */
 	if ( opt_arat && c->x86 > 0x11 )
-		__set_bit(X86_FEATURE_ARAT, c->x86_capability);
+		__set_bit(X86_FEATURE_XEN_ARAT, c->x86_capability);
 
 	/*
 	 * Prior to Family 0x14, perf counters are not reset during warm reboot.
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -81,7 +81,7 @@ static void cf_check init_hygon(struct c
 
 	/* Hygon processors have APIC timer running in deep C states. */
 	if (opt_arat)
-		__set_bit(X86_FEATURE_ARAT, c->x86_capability);
+		__set_bit(X86_FEATURE_XEN_ARAT, c->x86_capability);
 
 	if (cpu_has(c, X86_FEATURE_EFRO)) {
 		rdmsrl(MSR_K8_HWCR, value);
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -668,7 +668,7 @@ static void cf_check init_intel(struct c
 	if ( opt_arat &&
 	     ( c->cpuid_level >= 0x00000006 ) &&
 	     ( cpuid_eax(0x00000006) & (1u<<2) ) )
-		__set_bit(X86_FEATURE_ARAT, c->x86_capability);
+		__set_bit(X86_FEATURE_XEN_ARAT, c->x86_capability);
 
 	if ((opt_cpu_info && !(c->apicid & (c->x86_num_siblings - 1))) ||
 	    c == &boot_cpu_data )
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1633,7 +1633,7 @@ static int __init mwait_idle_probe(void)
 	icpu = id->driver_data;
 	cpuidle_state_table = icpu->state_table;
 
-	if (boot_cpu_has(X86_FEATURE_ARAT))
+	if (boot_cpu_has(X86_FEATURE_XEN_ARAT))
 		lapic_timer_reliable_states = LAPIC_TIMER_ALWAYS_RELIABLE;
 
 	pr_debug(PREFIX "v" MWAIT_IDLE_VERSION " model %#x\n",
@@ -1792,7 +1792,7 @@ int __init mwait_idle_init(struct notifi
 		return -ENODEV;
 
 	err = mwait_idle_probe();
-	if (!err && !boot_cpu_has(X86_FEATURE_ARAT)) {
+	if (!err && !boot_cpu_has(X86_FEATURE_XEN_ARAT)) {
 		hpet_broadcast_init();
 		if (xen_cpuidle < 0 && !hpet_broadcast_is_available())
 			err = -ENODEV;
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -13,7 +13,7 @@
 /* Synthetic features */
 XEN_CPUFEATURE(CONSTANT_TSC,      X86_SYNTH( 0)) /* TSC ticks at a constant rate */
 XEN_CPUFEATURE(NONSTOP_TSC,       X86_SYNTH( 1)) /* TSC does not stop in C states */
-XEN_CPUFEATURE(ARAT,              X86_SYNTH( 2)) /* Always running APIC timer */
+XEN_CPUFEATURE(XEN_ARAT,          X86_SYNTH( 2)) /* Xen may utilize always running APIC timer */
 XEN_CPUFEATURE(ARCH_PERFMON,      X86_SYNTH( 3)) /* Intel Architectural PerfMon */
 XEN_CPUFEATURE(TSC_RELIABLE,      X86_SYNTH( 4)) /* TSC is known to be reliable */
 XEN_CPUFEATURE(XTOPOLOGY,         X86_SYNTH( 5)) /* cpu topology enum extensions */
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2644,7 +2644,7 @@ static int _disable_pit_irq(bool init)
      * XXX dom0 may rely on RTC interrupt delivery, so only enable
      * hpet_broadcast if FSB mode available or if force_hpet_broadcast.
      */
-    if ( cpuidle_using_deep_cstate() && !boot_cpu_has(X86_FEATURE_ARAT) )
+    if ( cpuidle_using_deep_cstate() && !boot_cpu_has(X86_FEATURE_XEN_ARAT) )
     {
         init ? hpet_broadcast_init() : hpet_broadcast_resume();
         if ( !hpet_broadcast_is_available() )


