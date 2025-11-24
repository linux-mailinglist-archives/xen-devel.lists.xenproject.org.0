Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0690C80781
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170504.1495578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNViK-00071W-UY; Mon, 24 Nov 2025 12:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170504.1495578; Mon, 24 Nov 2025 12:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNViK-000705-Qk; Mon, 24 Nov 2025 12:30:40 +0000
Received: by outflank-mailman (input) for mailman id 1170504;
 Mon, 24 Nov 2025 12:30:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNViI-0004cg-Qc
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:30:38 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61c011c0-c931-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:30:38 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42b3669ca3dso1711245f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:30:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f34fddsm29199079f8f.14.2025.11.24.04.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:30:37 -0800 (PST)
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
X-Inumbo-ID: 61c011c0-c931-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763987437; x=1764592237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cLRL3+uYW8mTZJpIYDPRqMA57ukZVFvfr5R4kBjg4KY=;
        b=OYJjjF6X6fj9HVft6v+V4KgTTFbU7OMPFlP6L/LYVkCa0KTvBv+5Syu/iMQFiv5y89
         OyY0jd46zBv3r5xaN4FUEKGLmgZ20Xte8lCtH+ZBJU4rxROLW14oKTkkXpcKNmzOwFHI
         krRplfvqYpnGu8AoyavAdsJycst+dNyd/ZrPVp77JgZ2+muM3Igr7VLDOg3uWhqGuH2S
         dHc05/iHR6lOCI4qVhIz9rHjWI6tsyAuHzTF0jyjVKljL9nLMslsdY/JOQQoPlz3hwKm
         w7Vkr0aiSQtyPqGQ+lJAPArYkTMgO95Bnxt1A09lf2C7ltVxA7G+dNFY0vznTFbcYYZe
         aa+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987437; x=1764592237;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLRL3+uYW8mTZJpIYDPRqMA57ukZVFvfr5R4kBjg4KY=;
        b=SLAet+nflclUnl/56C6YrwTFsyknbz1L7LB2ZbgzkEHZ8pwpLDDK0TGMT2xjPPDcPo
         kWSJ/SVomgZh+ZFsY8HGrhznAMqfxJGT7/8eLJayCNynjuDnqsUcCDIgMzMVCjSr9jA/
         nmKq1fuR9C3Md3xulzyjk7s6Mq7OEXSs+BLXsR+HFuoPh+lCpscKdamJQjG7joqNM9sx
         ox+6/gGDOMEsCixlv6A04T61+wGW6ErNRH5DDx9jww+O90Pi2pqDXotUaIvNBP+e4uVK
         t1WFuX9uaQUk3P2/PYYwn9lvCFhnXk/OLMVMoIf9OYBrVYvkggRoJOMr8Cp3K3UObBzd
         PPzg==
X-Gm-Message-State: AOJu0YwCNTkH2u6DzkqwwJjf9zuZ9qQ00ds6JZFhRxVcF0Ls4TCxJRtX
	lgYhPKhbBWnAjlb0EBJZ7UGPvoAIeiCAXiR2WRmFOWZCdR1N4QZIafwmieKOSkfW+hjbfnlcTZi
	hKz0=
X-Gm-Gg: ASbGncuA0ifw7KWBg79RJaM8Bi8lT1qseEwvhhxUtb9tq80wHU8LL+8wlHjPEs3EXVg
	H3k4X/vA0My0DMZ/wL2gw1xMVSusEnbVW7tAnH4hA4hzyZJI0alQg/CUc0nBoex89Mhoe5ZXRSU
	K7KBiwVLEwOuNq07txeHhfBQvjuEF+sFpCoK68p3xCan0lDdrDia7jg8ULgMIJ26ML38RSUVf1p
	+GT9BhAOBUIjf64bsYzqiwJpXHHThgvoc1OE5KXxtY+WCpjsi5oU938AnfVelsjK2sTyocSdxWM
	YChagPs65Zf41E3F960sdJc7GeNw/th489eUuG70z9zUaIJ726TBjUvEayyw2BbWYMTLMNTEjkk
	JKJMpP7zfVvcd8ray68NVBijOSSWntkVLFIQwvCaU5iJ8HIMW75QZJ79SIlC3pIqBF3ypbspGs1
	YVc5abGpfu0uboYdAJUzut0K7IUIrk/3GJsUzNGdc463PwUYkj0dSpa/FcbHytx1O001bo+V/ie
	rA=
X-Google-Smtp-Source: AGHT+IEM4p5ClNaoIlR+EwMjxV3393KV4qYIpcRb3vKdTSU9Iy1DUsTuApQp/kvXk7ivGLSOHjuGHQ==
X-Received: by 2002:adf:b30a:0:b0:42b:3366:634b with SMTP id ffacd0b85a97d-42cc1d0cecfmr8055683f8f.31.1763987437328;
        Mon, 24 Nov 2025 04:30:37 -0800 (PST)
Message-ID: <d751bafc-5146-4b31-bce8-ce534500e978@suse.com>
Date: Mon, 24 Nov 2025 13:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/4] x86/vPMU: don't statically reserve the interrupt
 vector
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

Move the setup to vPMU code, doing the allocation of a vector only when
one is actually going to be needed. With that the handler functions also
don't need to be scattered across two places anymore.

Add the freed up vector to the dynamically allocatable range.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
In case down the road we also want to have a build mode with vPMU code
excluded, this may also simplify things a little there.
---
v2: Re-base over patch moving the APIC ack and over change to
    alloc_direct_apic_vector().

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1313,16 +1313,6 @@ static void cf_check error_interrupt(voi
            entries[3], entries[2], entries[1], entries[0]);
 }
 
-/*
- * This interrupt handles performance counters interrupt
- */
-
-static void cf_check pmu_interrupt(void)
-{
-    vpmu_do_interrupt();
-    ack_APIC_irq();
-}
-
 void __init apic_intr_init(void)
 {
     smp_intr_init();
@@ -1333,9 +1323,6 @@ void __init apic_intr_init(void)
     /* IPI vectors for APIC spurious and error interrupts */
     set_direct_apic_vector(SPURIOUS_APIC_VECTOR, spurious_interrupt);
     set_direct_apic_vector(ERROR_APIC_VECTOR, error_interrupt);
-
-    /* Performance Counters Interrupt */
-    set_direct_apic_vector(PMU_APIC_VECTOR, pmu_interrupt);
 }
 
 /*
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -40,6 +40,8 @@ static struct arch_vpmu_ops __initdata v
 static DEFINE_SPINLOCK(vpmu_lock);
 static unsigned vpmu_count;
 
+static uint8_t __ro_after_init pmu_apic_vector;
+
 static DEFINE_PER_CPU(struct vcpu *, last_vcpu);
 
 static int __init cf_check parse_vpmu_params(const char *s)
@@ -94,7 +96,7 @@ void vpmu_lvtpc_update(uint32_t val)
 
     vpmu = vcpu_vpmu(curr);
 
-    vpmu->hw_lapic_lvtpc = PMU_APIC_VECTOR | (val & APIC_LVT_MASKED);
+    vpmu->hw_lapic_lvtpc = pmu_apic_vector | (val & APIC_LVT_MASKED);
 
     /* Postpone APIC updates for PV(H) guests if PMU interrupt is pending */
     if ( has_vlapic(curr->domain) || !vpmu->xenpmu_data ||
@@ -160,7 +162,7 @@ static inline struct vcpu *choose_hwdom_
     return hardware_domain->vcpu[idx];
 }
 
-void vpmu_do_interrupt(void)
+static void vpmu_do_interrupt(void)
 {
     struct vcpu *sampled = current, *sampling;
     struct vpmu_struct *vpmu;
@@ -322,6 +324,12 @@ void vpmu_do_interrupt(void)
 #endif
 }
 
+static void cf_check vpmu_interrupt(void)
+{
+    vpmu_do_interrupt();
+    ack_APIC_irq();
+}
+
 #ifdef CONFIG_MEM_SHARING
 int vpmu_allocate_context(struct vcpu *v)
 {
@@ -369,7 +377,7 @@ void vpmu_save(struct vcpu *v)
 
     vpmu_reset(vpmu, VPMU_CONTEXT_SAVE);
 
-    apic_write(APIC_LVTPC, PMU_APIC_VECTOR | APIC_LVT_MASKED);
+    apic_write(APIC_LVTPC, pmu_apic_vector | APIC_LVT_MASKED);
 }
 
 int vpmu_load(struct vcpu *v, bool from_guest)
@@ -432,7 +440,7 @@ static int vpmu_arch_initialise(struct v
         return ret;
     }
 
-    vpmu->hw_lapic_lvtpc = PMU_APIC_VECTOR | APIC_LVT_MASKED;
+    vpmu->hw_lapic_lvtpc = pmu_apic_vector | APIC_LVT_MASKED;
     vpmu_set(vpmu, VPMU_INITIALIZED);
 
     return 0;
@@ -860,6 +868,8 @@ static int __init cf_check vpmu_init(voi
         register_cpu_notifier(&cpu_nfb);
         printk(XENLOG_INFO "VPMU: version " __stringify(XENPMU_VER_MAJ) "."
                __stringify(XENPMU_VER_MIN) "\n");
+
+        pmu_apic_vector = alloc_direct_apic_vector(vpmu_interrupt);
     }
     else
     {
--- a/xen/arch/x86/include/asm/irq-vectors.h
+++ b/xen/arch/x86/include/asm/irq-vectors.h
@@ -8,13 +8,12 @@
 #define EVENT_CHECK_VECTOR	0xfc
 #define CALL_FUNCTION_VECTOR	0xfb
 #define LOCAL_TIMER_VECTOR	0xfa
-#define PMU_APIC_VECTOR 	0xf9
 /*
  * High-priority dynamically-allocated vectors. For interrupts that
  * must be higher priority than any guest-bound interrupt.
  */
 #define FIRST_HIPRIORITY_VECTOR	0xf1
-#define LAST_HIPRIORITY_VECTOR  0xf8
+#define LAST_HIPRIORITY_VECTOR  0xf9
 /* IRQ0 (timer) is statically allocated but must be high priority. */
 #define IRQ0_VECTOR             0xf0
 
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -99,7 +99,6 @@ static inline bool vpmu_are_all_set(cons
 
 void vpmu_lvtpc_update(uint32_t val);
 int vpmu_do_msr(unsigned int msr, uint64_t *msr_content, bool is_write);
-void vpmu_do_interrupt(void);
 void vpmu_initialise(struct vcpu *v);
 void vpmu_destroy(struct vcpu *v);
 void vpmu_save(struct vcpu *v);


