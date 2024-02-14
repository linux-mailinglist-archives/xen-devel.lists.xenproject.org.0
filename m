Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A447B8546ED
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 11:16:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680359.1058503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raCJ2-0005uj-4r; Wed, 14 Feb 2024 10:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680359.1058503; Wed, 14 Feb 2024 10:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raCJ2-0005sA-2D; Wed, 14 Feb 2024 10:15:56 +0000
Received: by outflank-mailman (input) for mailman id 680359;
 Wed, 14 Feb 2024 10:15:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raCJ0-0005s0-Fx
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 10:15:54 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08e6ee03-cb22-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 11:15:53 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so68847641fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 02:15:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c290700b00410add3af79sm1463796wmd.23.2024.02.14.02.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 02:15:52 -0800 (PST)
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
X-Inumbo-ID: 08e6ee03-cb22-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707905753; x=1708510553; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4KlJ7kp1NtwjByIFJtrdaNCRwIi1KERZlr5Saiakv8g=;
        b=ZNjIjfGaRjur/98ZY6sray/PP5V7yNkEonKkygX9nYv0w4FXt2vKSqYCGC9blBcJT6
         umVK2+pmr6Sk5XQZANmTANDJ98m82y5B+UUdPJ9ZyMm7KmrQefd1QLSTvLWiRnu49c7R
         3mWqDo1otRUwgJDSnzN5/Vc/xlij7+9D4P3kV+oHYeGlNZyfh5NumwdP25cXy0PqLq4a
         y06q5qpY8dvYHjJY+l2jAQTDFM9H2p1u3hsvj9cjoMDbvESrAJbd3EFj3an5IvAaYg6J
         y8Xdw1y2MfwO0CRcZYk0du+Im7PNNer9IwdUz94pVnxh24Kfv6GykSia7bzsTRb2pDwp
         tj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707905753; x=1708510553;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4KlJ7kp1NtwjByIFJtrdaNCRwIi1KERZlr5Saiakv8g=;
        b=Xc6QFhC0BqUxPrVVIk3k5imMvtcfklds2Qkg8mYOo9WQdcbbyWc0uIEo617rEdc1M4
         2/Trt7REo0Wp1JksIvCZTtqRy0k2hQB+Hd6sINpXoUCRgXEsBSYXzP649Hgrgy2oPlMS
         5Q6a8lB9ggms0BYpW0otOnIrt6TwY926gBV3thAwMQcWPHqN+Uv17unuooZZyvDJNijz
         FavQKycZyFuv0Hvf877hioo6mYMPePpZ/NkhwK0oSoSYPXTGz0l0mVHxlX4QNgHL+lMG
         zWcFMEtzRD989NxLjQ1nJ4daogwR6Plw9Gcw3ZH05/X2MjEpD2gadQRT1/cjJiByxB66
         GRMA==
X-Gm-Message-State: AOJu0YwppzWKBTehPWyokQO4yaSbNIeOuNYPwscdUdI4XO2E7k8c/+Ne
	FWBzQzSSf3EgMYqQTpcl6p/XFKPcbGgu86TSgxGE4q0cK8OYxFGSvZ7WjVNdr83Ak6c1jYVIte0
	=
X-Google-Smtp-Source: AGHT+IEcNpbWnQmLEF+7pKuEWC1eEnPFDHeiiwaDEdpI8BGwIlrRg6zHzCD+YoakY86fi/XGTyMHdA==
X-Received: by 2002:a05:651c:2112:b0:2d1:1d21:147f with SMTP id a18-20020a05651c211200b002d11d21147fmr843095ljq.39.1707905752982;
        Wed, 14 Feb 2024 02:15:52 -0800 (PST)
Message-ID: <549909b7-e34c-4a5c-aa21-9892a1724042@suse.com>
Date: Wed, 14 Feb 2024 11:15:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: amend 'n' debug-key output with SMI count
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
 
+		if (!verbose && !rdmsr_safe(MSR_SMI_COUNT, smi_count))
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

