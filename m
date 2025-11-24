Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D665C8076F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:30:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170494.1495567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVi1-0006Ym-Iw; Mon, 24 Nov 2025 12:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170494.1495567; Mon, 24 Nov 2025 12:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVi1-0006Vv-Fa; Mon, 24 Nov 2025 12:30:21 +0000
Received: by outflank-mailman (input) for mailman id 1170494;
 Mon, 24 Nov 2025 12:30:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNVi0-00053p-A9
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:30:20 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56099bda-c931-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:30:18 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so23805535e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:30:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf1e86b3sm227956435e9.6.2025.11.24.04.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:30:17 -0800 (PST)
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
X-Inumbo-ID: 56099bda-c931-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763987418; x=1764592218; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tp+i/cfVucDDUMwChy0ACXhvtjRm+kadP0KVDlNVdFY=;
        b=ELyyH2BNaQGCzhcUPfOe/KTNq/w+qI/itRZgfkzjOmmGsU4rAbTDA+q66LC54q/o8e
         fMpdGzR2giR1gnQJijKScO7KGgMWY8CYqr5BQ8VJRpms+hmf6UGErr6Q7hhIRy4s3oTv
         lpaI30X3E1K6CJcnmnm3fhqvaETlM/tEnCbxNQivy3AgfO0FtcwJNWoikvcke+GgfUeB
         ly0rmN0LaAOZKy/gC0Vkl6JCS69hVNe0FrkSu6aVFxxqJDizLTdNSIZVpQNPEBqUQM/0
         CF746EH+2K1SxzYbt7zILeSWeQts7+131S4MILbcpygfFIgpvt3OthWTcYapLPIxRsMT
         FIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987418; x=1764592218;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tp+i/cfVucDDUMwChy0ACXhvtjRm+kadP0KVDlNVdFY=;
        b=he14Oj0G73gdusK12vNx7ReSZiKYFZfw24eNApoAeQpriRgvKTdFj9RX0kP9BlS4PL
         52ye/4TpBvjNdszcHPGxozRPHDpa9trOxPnFueQh/3QPgm+B7gs4vyCou16jM6G/b2lQ
         +0sjn3+N7Aar61ew6SzipaGWCw5f3OIjYeaja3fUStZ5yiTGbSk/D1Hb0tjyah+woYQp
         JQVnZJPfBvQRpDubGm9TqSWJ6cXR9EHYBOnJQ0tFmQBROdabAof8PyvzuMU2hKZ7ucoc
         NUpyq6brGGuchOrazP3EZqDAAVTeDDIFA6VIiA2UIwa9LPfhhJ+dkFSMM6NeeNzgW3qm
         fjvQ==
X-Gm-Message-State: AOJu0YzEqiK8n6F2FWKvAhU/f1pKlIm+9PUFa2haXUTbCoCAFB79/TYK
	UwTXBXGaE5jyJhEVT6rferU7O5LYu6ZTi957tAGV5zGS3jqRVe3J+5IBIg7AONS4JG8XRXWmbiH
	GhfY=
X-Gm-Gg: ASbGncsCGc06BPtlPfKkN6uOiWl6ylmkuviwNfJx30FDbagUJmBV2pMfM/qnYWOtk4P
	QeBMuZOXnpNAqF7DIQIn5qBi4NQ4+mcRsK+IYVQzYi741Y/fUB5ByJXWED7u8jtJUnnHyX13vTc
	L2G5XoWpiGgqKnQMIFBpnCMLyzQk6HB+L+iZYLEruDwTXdAENtkpvCMT7sU3XScAUwVY9lL4ZYa
	nfthLDVXKrEeG5iVf9sl/8s0S02BycG6v33RKpWIxJvJ563K5QR2D9XWZ5Bi6I/u90r5rmSb8I1
	iDF9skna2P2rtph6Ay2bfcWaXDtliBvLmWkVMhEVmSv1dwWrwJiPvBOEIbFf44yCOOS/v+gumVX
	52+PFs0ePm31WtrBliHpcw8L122RXPVRK67h2/OTr6t1zhOqkN/DP0NsoQy/LiXtP3tpvWZqgY4
	gc3t3D1ZIDoqJG4DPzdtcH9yptirKUCS5C4P/7TnPl3FceRQ+MqaWtSvEpJ+yMMIKn80w5vyxXT
	98=
X-Google-Smtp-Source: AGHT+IEFQcTpHEJ1+VAIief0RR0eJLlhlKIioP/kCJtvv1FC07NrLWROgp7R6dYhwWkowpZBrEWJ8A==
X-Received: by 2002:a05:600c:3146:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-477c01b2211mr111541015e9.18.1763987417740;
        Mon, 24 Nov 2025 04:30:17 -0800 (PST)
Message-ID: <cf407534-b44e-446d-9249-694787e5963a@suse.com>
Date: Mon, 24 Nov 2025 13:30:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/4] x86/IRQ: direct-APIC-vector setting is now init-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <5ac2e9b1-81f2-41d9-8f05-d546a49c43a7@suse.com>
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
In-Reply-To: <5ac2e9b1-81f2-41d9-8f05-d546a49c43a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

With all callers of alloc_direct_apic_vector() now being limited to BSP
setup, it and its helpers (whose other callers have already been init-
only) can become __init. As a result data items can be adjusted, too.

With alloc_direct_apic_vector() now being __init, it's meaningless to use
a lock, and the indirection is also pretty pointless. Drop both while at
it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-work alloc_direct_apic_vector().

--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -161,7 +161,7 @@ static void intel_init_thermal(const str
     }
 
     if ( bsp )
-        alloc_direct_apic_vector(&thermal_apic_vector, intel_thermal_interrupt);
+        thermal_apic_vector = alloc_direct_apic_vector(intel_thermal_interrupt);
 
     /* The temperature transition interrupt handler setup */
     val = thermal_apic_vector;    /* our delivery vector */
@@ -689,7 +689,7 @@ static void intel_init_cmci(struct cpuin
     }
 
     if ( bsp )
-        alloc_direct_apic_vector(&cmci_apic_vector, cmci_interrupt);
+        cmci_apic_vector = alloc_direct_apic_vector(cmci_interrupt);
 
     apic = cmci_apic_vector;
     apic |= (APIC_DM_FIXED | APIC_LVT_MASKED);
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -293,7 +293,7 @@ static void __init cf_check setup(void)
                XEN_LEGACY_MAX_VCPUS);
     }
 
-    alloc_direct_apic_vector(&evtchn_upcall_vector, xen_evtchn_upcall);
+    evtchn_upcall_vector = alloc_direct_apic_vector(xen_evtchn_upcall);
 
     BUG_ON(init_evtchn());
 }
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3181,10 +3181,10 @@ const struct hvm_function_table * __init
 
     if ( cpu_has_vmx_posted_intr_processing )
     {
-        alloc_direct_apic_vector(&posted_intr_vector, pi_notification_interrupt);
+        posted_intr_vector = alloc_direct_apic_vector(pi_notification_interrupt);
         if ( iommu_intpost )
         {
-            alloc_direct_apic_vector(&pi_wakeup_vector, pi_wakeup_interrupt);
+            pi_wakeup_vector = alloc_direct_apic_vector(pi_wakeup_interrupt);
 
             vmx_function_table.pi_update_irte = vmx_pi_update_irte;
         }
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -119,7 +119,7 @@ uint8_t alloc_hipriority_vector(void);
 void free_lopriority_vector(uint8_t vector);
 
 void set_direct_apic_vector(uint8_t vector, void (*handler)(void));
-void alloc_direct_apic_vector(uint8_t *vector, void (*handler)(void));
+uint8_t alloc_direct_apic_vector(void (*handler)(void));
 
 void do_IRQ(struct cpu_user_regs *regs);
 
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -970,31 +970,28 @@ void pirq_set_affinity(struct domain *d,
 DEFINE_PER_CPU(unsigned int, irq_count);
 static DEFINE_PER_CPU(bool, check_eoi_deferral);
 
-uint8_t alloc_hipriority_vector(void)
+uint8_t __init alloc_hipriority_vector(void)
 {
-    static uint8_t next = FIRST_HIPRIORITY_VECTOR;
+    static uint8_t __initdata next = FIRST_HIPRIORITY_VECTOR;
     BUG_ON(next < FIRST_HIPRIORITY_VECTOR);
     BUG_ON(next > LAST_HIPRIORITY_VECTOR);
     return next++;
 }
 
-static void (*direct_apic_vector[X86_IDT_VECTORS])(void);
-void set_direct_apic_vector(uint8_t vector, void (*handler)(void))
+static void (*__ro_after_init direct_apic_vector[X86_IDT_VECTORS])(void);
+void __init set_direct_apic_vector(uint8_t vector, void (*handler)(void))
 {
     BUG_ON(direct_apic_vector[vector] != NULL);
     direct_apic_vector[vector] = handler;
 }
 
-void alloc_direct_apic_vector(uint8_t *vector, void (*handler)(void))
+uint8_t __init alloc_direct_apic_vector(void (*handler)(void))
 {
-    static DEFINE_SPINLOCK(lock);
+    uint8_t vec = alloc_hipriority_vector();
 
-    spin_lock(&lock);
-    if (*vector == 0) {
-        *vector = alloc_hipriority_vector();
-        set_direct_apic_vector(*vector, handler);
-    }
-    spin_unlock(&lock);
+    set_direct_apic_vector(vec, handler);
+
+    return vec;
 }
 
 /* This could free any vectors, but is needed only for low-prio ones. */


