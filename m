Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB905C8072A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:24:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170436.1495508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVc8-0002Ni-Pn; Mon, 24 Nov 2025 12:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170436.1495508; Mon, 24 Nov 2025 12:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVc8-0002Ld-M6; Mon, 24 Nov 2025 12:24:16 +0000
Received: by outflank-mailman (input) for mailman id 1170436;
 Mon, 24 Nov 2025 12:24:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNVc7-0001k4-Iw
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:24:15 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c7dd318-c930-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:24:13 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so44004825e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:24:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf216ddasm190515955e9.0.2025.11.24.04.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:24:12 -0800 (PST)
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
X-Inumbo-ID: 7c7dd318-c930-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763987053; x=1764591853; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l952tUPPdDWlCF9wpnrcqEjrz6Dm8KdXWLLA7A5cT8I=;
        b=CjBrV74+Ufep+6LCZRYIkiwXbdO6l9dqSb0s9X4g9s5Np25AYKSPGsixfNE3p5+fvF
         6GPXYVpBZ2XS92FNy+8UkBcOF99XaI5rOAWaTSll8tiepRKY89onRhbhmiCJ2IgfkmGm
         JTQcTzdhQfQh4HeWE+OcIPKrZ/kET7kSPxNJkj1nLvYgel3f5woHkX9p9/InGthasOVB
         +PkdxnN3ASlluJoQ1z6ajWICr6oWUwQ1eZOCWCPJeA2R5bp6+WzICtrMd99Y39okCMaG
         VCwYU2qo9eAsFXrma+kLZnUOq5ygUBDMkpC1M6ubgfrm7G83dv0tt1yVa7mPmIIU4wqj
         KkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987053; x=1764591853;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l952tUPPdDWlCF9wpnrcqEjrz6Dm8KdXWLLA7A5cT8I=;
        b=nJrFNNRjOb7jPmHp+Rp/VLcTphSTT1L2/ojBt0IX2Qr+XDU+qDuxgzDuJvi0Nfrnak
         VMVip714ipBA5lmJmKt7V07z/35oYks+c96JUOrkvbIZzeHPFSfU83Zo7xY+HBVHE+gb
         WrwzFZ72fCA6/XTMLY6QG6AZKbSB7X452J+mkYSoBTb3/YCrIw1GEjbhHeKHAUxAJqnF
         rMIDD8gt2ZfrkcfZ7pQC1RE0AEM5x6MWw5TTiiiP81aTrDK+EkpOuVfNQ0OG8JCadxH7
         N1KtZapoW6QgmJAcyvhbDcy8ST4HPeaA92/ccbWsOcyiQGHYyNINXHGnIPP+zqrRgKuJ
         SbMQ==
X-Gm-Message-State: AOJu0Yy2VhPLrpHNw0hUEAV4frzORQAdeeRyvRiC16XODk3qNid1gjRL
	YVW3bwPkkgTjXqdfPZpNJZI8mF1ZUhSxod7wjaojjVBmtde78SdiCBnzBfazYCUAIX8/yOIKJiX
	u1rM=
X-Gm-Gg: ASbGncshOOiUZLOqb1foqO0zqygvOM2cnGWT9/fucr87hNE4mhpWjgnPFtfiTRJXPoH
	u6jgszQK8Wak9v1F1+HGtCnbsjGZgfdRuq8LylF1Kp00hLAp9vx1iiGkuOPTxE7iOu0zVHLMQY2
	XBXD+MFXAf9ngeOCnKVBLzO0o2v5NDXoqNH+xkgZ3M6Lq/zzLejVDfxkw9+C3UlfPJUTMJBPioW
	C+1/TuL0RH/lbMlUFu3GuvI2J1zalcY2y9U00C/usWpFv5GsEYOqWqePYTaCvscSzhfjFB4+bso
	leMzkGUzKjFGSh1o1jDJ0Hj4TmdKcH5Nzywwylez225Zy546nCTWj1ouSjJlimQrhMy7Zupt3HW
	Zpid6DH7ghduF9h90i3UinkKz5F/ekSyef0konCHeXAK+neWBjs/NVmhQPYcYiMTeyeh+qnkL72
	1r0bnP9T+lTv68siKhWJGJgDL1dDjy0DUw8dNl2Y8Y+ikxazzYqeNyD8sWotBClrNMUGpfqE8Vg
	mJY8te+0kRGRg==
X-Google-Smtp-Source: AGHT+IGVMfVJEik/q/1IhgYgIYQ7vTGl1DoVH8z7W7NvWvnBgPChKbJsX7iHs6/D6IODTe34syWCEA==
X-Received: by 2002:a05:600c:4f48:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-477c01e02e5mr107226105e9.28.1763987052673;
        Mon, 24 Nov 2025 04:24:12 -0800 (PST)
Message-ID: <480b4638-31bf-472a-8c99-70d912bccd0f@suse.com>
Date: Mon, 24 Nov 2025 13:24:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/6] x86: rename ARAT feature flag
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
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
In-Reply-To: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add a XEN infix, to properly distinguish it from the CPUID feature flag
(leaf 6 EAX bit 2).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
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
@@ -1355,7 +1355,7 @@ static void cf_check init_amd(struct cpu
 	 * running in deep C states.
 	 */
 	if ( opt_arat && c->x86 > 0x11 )
-		__set_bit(X86_FEATURE_ARAT, c->x86_capability);
+		__set_bit(X86_FEATURE_XEN_ARAT, c->x86_capability);
 
 	/*
 	 * Prior to Family 0x14, perf counters are not reset during warm reboot.
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -76,7 +76,7 @@ static void cf_check init_hygon(struct c
 
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
@@ -2642,7 +2642,7 @@ static int _disable_pit_irq(bool init)
      * XXX dom0 may rely on RTC interrupt delivery, so only enable
      * hpet_broadcast if FSB mode available or if force_hpet_broadcast.
      */
-    if ( cpuidle_using_deep_cstate() && !boot_cpu_has(X86_FEATURE_ARAT) )
+    if ( cpuidle_using_deep_cstate() && !boot_cpu_has(X86_FEATURE_XEN_ARAT) )
     {
         init ? hpet_broadcast_init() : hpet_broadcast_resume();
         if ( !hpet_broadcast_is_available() )


