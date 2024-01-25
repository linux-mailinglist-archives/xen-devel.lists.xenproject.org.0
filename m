Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4654683C8D8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 17:56:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671673.1045145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT30z-0001Ik-KW; Thu, 25 Jan 2024 16:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671673.1045145; Thu, 25 Jan 2024 16:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT30z-0001G7-GS; Thu, 25 Jan 2024 16:55:45 +0000
Received: by outflank-mailman (input) for mailman id 671673;
 Thu, 25 Jan 2024 16:55:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT30y-0001G0-RV
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 16:55:44 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93f409e2-bba2-11ee-8a42-1f161083a0e0;
 Thu, 25 Jan 2024 17:55:43 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a2e0be86878so188767966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 08:55:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s4-20020a92c5c4000000b00361a7db24e4sm4852224ilt.57.2024.01.25.08.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 08:55:42 -0800 (PST)
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
X-Inumbo-ID: 93f409e2-bba2-11ee-8a42-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706201743; x=1706806543; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GoAzlCIARaqGmBCt9LvtfR+hrmC+N8QP92P3NFqBjuc=;
        b=eG7Wki/uhCwrfPCSKNyAp5oYL4Yn5UYGioo99yHY+1DbmFg7BM4tNKtls1TDnCdiSt
         dTc6JDLlQYIOd4Nap68vuEh+sxe1nFVtKGgtaiv9jxypTKwiHblSGwZHaMJirZEyMuCb
         rEGO7w9TOMoXDVIbLl8O2Ka/J/c6SPeyad7NzoiRtyRkz0QntdeOMqQza2oaFM+5O+F6
         5qylzXAMJaWnbjO0el0NM5NsBnQgXtmg0Rny2Sk22GrWZVg9LJ17INF/5zY9QZQOrLT5
         KzRvmN/nLCYQZeWdXPcqHUv12JBxniNlHvHAEi3mOcjFNsiEEoMuzkPrdYES9/uHUyi/
         pzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706201743; x=1706806543;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GoAzlCIARaqGmBCt9LvtfR+hrmC+N8QP92P3NFqBjuc=;
        b=HkQB0eglVPYNVYZfMlrRJjzTsY/uZcejrk9Hy1o+OaphIzoLNl3AnrezUsjnRLvBCr
         bZUXTvAj5/XTk62cLt7/R+mQdWb9G1deicm7xG6Ktx+9zxuvxH2d6R6p5g94oK9fDqDt
         +uXauiNGxvu1pj0ZEtr7I71TMwvOIG86xrOvDxIbPBFm/yXgJW/ohepXBkdUCfZprZqX
         mtfP2XBVuVp+IUt3czLpfEB3lLCWj3dNxYmdsaLXdyi2ynd++bcUdaGAaAl29jcYwAdm
         Cow0J4uVo7hmbOoznp7uM9ry5igXgoaeBkx8+JiTWs+6eeOTHdpvZKf9HMbIDflSfSQP
         w2nQ==
X-Gm-Message-State: AOJu0YxdXLYpe5TNockoyhdsLKQfBZshj+dRc8M62MmRwWOvlBnKkFYo
	gpE6ePReiVULUqyDTJ+1hE7VOu1fGIBTEgVM/qa24S3GmMjnMXG4vQBzx6VvADRIh7EnXgk+T4c
	=
X-Google-Smtp-Source: AGHT+IH20hRUPdzUzKnR7qdOZAKJ0Z7NZXuIYsBgnYpgYfkgtpGmZqyBUtJp8QlXGH45l9yc3IYmww==
X-Received: by 2002:a17:906:847c:b0:a31:8299:3781 with SMTP id hx28-20020a170906847c00b00a3182993781mr169788ejc.20.1706201743258;
        Thu, 25 Jan 2024 08:55:43 -0800 (PST)
Message-ID: <d5fd3646-18b3-4dae-8da7-6afa187f930e@suse.com>
Date: Thu, 25 Jan 2024 17:55:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: increase NMI timer frequency if necessary
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

Since the performance counters used for the NMI watchdog count non-
halted cycles, they may count at a rate higher than cpu_khz. Thus the
watchdog tick may occur more frequently than invocations of the timer
if we don't account for the ratio between nominal and maximum CPU clock
speeds, which would be a problem in particular when "watchdog_timeout=1"
is in effect (for high enough ratios even larger timout values may pose
a problem).

Leverage the so far display-only data we collect on newer Intel and AMD
CPUs. On older CPUs we just have to (continue to) hope that the default
frequency of 1 Hz is okay(-ish) to use.

While adding the new variable, also move the (now adjacent) cpu_khz to
.data.ro_after_init.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This renders the "log" in the function names somewhat stale, but I don't
think this strictly warrants renaming the functions right away.

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -657,12 +657,18 @@ void amd_log_freq(const struct cpuinfo_x
 		                     : (((v) & 0xff) * 25 * 8) / (((v) >> 8) & 0x3f))
 	if (idx && idx < h &&
 	    !rdmsr_safe(0xC0010064 + idx, val) && (val >> 63) &&
-	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
+	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63)) {
+		if (c == &boot_cpu_data)
+			cpu_max_mhz = FREQ(hi);
 		printk("CPU%u: %lu (%lu ... %lu) MHz\n",
 		       smp_processor_id(), FREQ(val), FREQ(lo), FREQ(hi));
-	else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
+	}
+	else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63)) {
+		if (c == &boot_cpu_data)
+			cpu_max_mhz = FREQ(hi);
 		printk("CPU%u: %lu ... %lu MHz\n",
 		       smp_processor_id(), FREQ(lo), FREQ(hi));
+	}
 	else
 		printk("CPU%u: %lu MHz\n", smp_processor_id(), FREQ(lo));
 #undef FREQ
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -456,7 +456,11 @@ static void intel_log_freq(const struct
             if ( eax )
                 printk(" base: %u MHz", eax);
             if ( ebx )
+            {
+                if ( c == &boot_cpu_data )
+                    cpu_max_mhz = ebx;
                 printk(" max: %u MHz", ebx);
+            }
             printk("\n");
         }
     }
@@ -522,6 +526,8 @@ static void intel_log_freq(const struct
     printk("CPU%u: ", smp_processor_id());
     if ( min_ratio )
         printk("%u ... ", (factor * min_ratio + 50) / 100);
+    if ( c == &boot_cpu_data && !cpu_max_mhz )
+        cpu_max_mhz = (factor * max_ratio + 50) / 100;
     printk("%u MHz\n", (factor * max_ratio + 50) / 100);
 }
 
--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -8,6 +8,8 @@ typedef u64 cycles_t;
 
 extern bool disable_tsc_sync;
 
+extern unsigned int cpu_max_mhz;
+
 static inline cycles_t get_cycles(void)
 {
     return rdtsc_ordered();
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -213,10 +213,12 @@ void __init check_nmi_watchdog(void)
     return;
 }
 
+static unsigned int __ro_after_init timer_gap = MILLISECS(1000);
+
 static void cf_check nmi_timer_fn(void *unused)
 {
     this_cpu(nmi_timer_ticks)++;
-    set_timer(&this_cpu(nmi_timer), NOW() + MILLISECS(1000));
+    set_timer(&this_cpu(nmi_timer), NOW() + timer_gap);
 }
 
 void disable_lapic_nmi_watchdog(void)
@@ -477,8 +479,17 @@ bool watchdog_enabled(void)
 
 int __init watchdog_setup(void)
 {
+    unsigned long cpu_mhz = cpu_khz / 1000;
     unsigned int cpu;
 
+    if ( cpu_max_mhz > cpu_mhz )
+    {
+        timer_gap = timer_gap * cpu_mhz / cpu_max_mhz;
+        /* To be on the safe side, bound to 1ms. */
+        if ( timer_gap < MILLISECS(1) )
+            timer_gap = MILLISECS(1);
+    }
+
     /*
      * Activate periodic heartbeats. We cannot do this earlier during 
      * setup because the timer infrastructure is not available.
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -47,7 +47,9 @@
 static char __initdata opt_clocksource[10];
 string_param("clocksource", opt_clocksource);
 
-unsigned long __read_mostly cpu_khz;  /* CPU clock frequency in kHz. */
+unsigned long __ro_after_init cpu_khz;    /* CPU clock frequency in kHz. */
+unsigned int __ro_after_init cpu_max_mhz; /* CPU max (known) clkfreq in MHz. */
+
 DEFINE_SPINLOCK(rtc_lock);
 unsigned long pit0_ticks;
 

