Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA0D8794B1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 13:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691807.1078190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1ic-000308-Pc; Tue, 12 Mar 2024 12:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691807.1078190; Tue, 12 Mar 2024 12:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1ic-0002yQ-N5; Tue, 12 Mar 2024 12:58:58 +0000
Received: by outflank-mailman (input) for mailman id 691807;
 Tue, 12 Mar 2024 12:58:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk1ib-0002yK-BR
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 12:58:57 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 483bb404-e070-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 13:58:54 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5683576ea18so5141667a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 05:58:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a26-20020aa7cf1a000000b005666465520dsm4013234edy.26.2024.03.12.05.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 05:58:53 -0700 (PDT)
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
X-Inumbo-ID: 483bb404-e070-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710248334; x=1710853134; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AWmWDrEJEcNjx63rF6lgczAz86xnCvV9Z4oBvib0A8Y=;
        b=RWhPi60hNAcDyUlYrcAt1EhdasOUAeCW63krFc/UHlZA4nnKm5S8FJeC4gT8/3Q4nB
         EXUSYSHdVa6gMTyIeJtznq+iXmyirwznDVZdmEOsWfu8+xaethkg6cVngIb3bdpqJ8lC
         s72mpkk/stl01aal+HNQnyY10BkxUe4AAJX3325Bpaj+ywjVSDisT86aHcUUyhe4wmee
         XMdNgEGkcwB2lAby/6LzXZc7J6uqtglYIppNY9L7zyvcYnh2hkx/L0nVrS/NejrOKmfe
         Egal7KK5N8uVposdUYew7+gmhfY6byEnGMtpk9RaUkYwHhkFy5Mgxg2OQta+ZHcpZ7A0
         iB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710248334; x=1710853134;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AWmWDrEJEcNjx63rF6lgczAz86xnCvV9Z4oBvib0A8Y=;
        b=WNiKQiCU4DdE291ga3N9YG/LmGTqwlYzVBx6/7AwOFOEENijRmqZB4wv7jGTCAwCbk
         NUzt39e9W1IICdZ8xg6bjjf82EzX3T1bZfEwMdC63/g/fDLaEjP0EdPKPFBrVlAoKWaZ
         VfUFA1O4/rJUn2o/AwvWc3HTw/Sn5HHVsNQo6OAGxiKWSt5X18QHQ9BOc5OUflnikuK5
         QkLjeYvPv3EMivhDD+2MuQi7IrlEJ95/2Mp7h3/WdfnpCSuRShg3X9Ets46MJVY8AkCB
         Qf1Ps2+KvN21jXvf6GOll4MBx0QdSvbOsq3yOTGIOEPm8UKz5fd/SrFKEkC/58tIO9xM
         GE5g==
X-Gm-Message-State: AOJu0Yw+a+fTUC+2I7E5LHSqEJbtbdZg6TwAunagHwmxeTOFqx0DVn9c
	TFhna3zidWf40YFint8d+qh3ZGAR2vxRgNxYYPgf8qT/2PwE2dv9SNjasuoUQRoEiNF2hZgQRHw
	=
X-Google-Smtp-Source: AGHT+IGNhlaXasu2Ahyc2DADJQLbF0elzGw+nUkj2GixXriUmgDs9vNqC/uoHtzJFjCk3Yomnm80lQ==
X-Received: by 2002:a50:c30d:0:b0:565:cc2d:533 with SMTP id a13-20020a50c30d000000b00565cc2d0533mr6427491edb.1.1710248334409;
        Tue, 12 Mar 2024 05:58:54 -0700 (PDT)
Message-ID: <8cfb88de-e0b9-41c3-bf74-e994aaf023d0@suse.com>
Date: Tue, 12 Mar 2024 13:58:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86: amend 'n' debug-key output with SMI count
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... if available only, of course.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I don't really like issuing an IPI (and having another cf_check
function) here, yet then again this is issued only when the debug key
is actually used, and given how simple the handling function is
(including that it doesn't use its parameter) it also looks difficult
to abuse.
---
v3: Invert "verbose" dependency in early_cpu_init().
v2: Actually read each CPU's SMI count in do_nmi_stats().

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -407,9 +407,15 @@ void __init early_cpu_init(bool verbose)
 		paddr_bits -= (ebx >> 6) & 0x3f;
 	}
 
-	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
+	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON))) {
+		uint64_t smi_count;
+
 		park_offline_cpus = opt_mce;
 
+		if (verbose && !rdmsr_safe(MSR_SMI_COUNT, smi_count))
+			setup_force_cpu_cap(X86_FEATURE_SMI_COUNT);
+	}
+
 	initialize_cpu_data(0);
 }
 
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -24,7 +24,7 @@ XEN_CPUFEATURE(APERFMPERF,        X86_SY
 XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
 XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
 XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */
-/* Bit 12 unused. */
+XEN_CPUFEATURE(SMI_COUNT,         X86_SYNTH(12)) /* MSR_SMI_COUNT exists */
 XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
 XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
 XEN_CPUFEATURE(SC_NO_BRANCH_HARDEN, X86_SYNTH(15)) /* (Disable) Conditional branch hardening */
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -28,6 +28,8 @@
 #define  TEST_CTRL_SPLITLOCK_DETECT         (_AC(1, ULL) << 29)
 #define  TEST_CTRL_SPLITLOCK_DISABLE        (_AC(1, ULL) << 31)
 
+#define MSR_SMI_COUNT                       0x00000034
+
 #define MSR_INTEL_CORE_THREAD_COUNT         0x00000035
 #define  MSR_CTC_THREAD_MASK                0x0000ffff
 #define  MSR_CTC_CORE_MASK                  _AC(0xffff0000, U)
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -585,15 +585,34 @@ static void cf_check do_nmi_trigger(unsi
     self_nmi();
 }
 
+static DEFINE_PER_CPU(unsigned int, smi_count);
+
+static void cf_check read_smi_count(void *unused)
+{
+    unsigned int dummy;
+
+    rdmsr(MSR_SMI_COUNT, this_cpu(smi_count), dummy);
+}
+
 static void cf_check do_nmi_stats(unsigned char key)
 {
     const struct vcpu *v;
     unsigned int cpu;
     bool pend, mask;
 
-    printk("CPU\tNMI\n");
+    printk("CPU\tNMI%s\n", boot_cpu_has(X86_FEATURE_SMI_COUNT) ? "\tSMI" : "");
+
+    if ( boot_cpu_has(X86_FEATURE_SMI_COUNT) )
+        on_each_cpu(read_smi_count, NULL, 1);
+
     for_each_online_cpu ( cpu )
-        printk("%3u\t%3u\n", cpu, per_cpu(nmi_count, cpu));
+    {
+        printk("%3u\t%3u", cpu, per_cpu(nmi_count, cpu));
+        if ( boot_cpu_has(X86_FEATURE_SMI_COUNT) )
+            printk("\t%3u\n", per_cpu(smi_count, cpu));
+        else
+            printk("\n");
+    }
 
     if ( !hardware_domain || !(v = domain_vcpu(hardware_domain, 0)) )
         return;

