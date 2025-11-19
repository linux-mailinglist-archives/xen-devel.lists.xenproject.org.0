Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCB5C6E100
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 11:51:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165786.1492477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLfmI-0004f9-Tr; Wed, 19 Nov 2025 10:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165786.1492477; Wed, 19 Nov 2025 10:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLfmI-0004cs-R1; Wed, 19 Nov 2025 10:51:10 +0000
Received: by outflank-mailman (input) for mailman id 1165786;
 Wed, 19 Nov 2025 10:51:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLfmG-0003Dg-Kj
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 10:51:08 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a71dca3f-c535-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 11:51:07 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b736cd741c1so820364766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 02:51:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fedb2eesm1580727666b.68.2025.11.19.02.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 02:51:06 -0800 (PST)
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
X-Inumbo-ID: a71dca3f-c535-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763549467; x=1764154267; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UtnZFSIGU7bG1vfdAcW2qaHOgH8mtrYWLBBQLVZWajw=;
        b=JMDx/mazn8LOGl1CnahVgsdpLuwMZqvljBKmaKpeV2qxkDJEwMv7JE8MVt/cK8n+XK
         +onHGPCa/u9psOtq0jKc9fAueTxfD/hcltvytc3nU+NMn83hF1djsQq7m1IXaihwqffl
         ZAwasDOT92z5MQyn1MILi0rchPf+GQlMrqN6UBEwPxUp8vV2we7Egna1pya4efnJzBtP
         nTkkYwMgziT4D4Ekpp0QxBeMKbfKFdPsTxLuZcD8j/0+Eruj02rluMSIW7kBdsTWWXeO
         iZhuqHz6MbnWKxqS1OkVyNNwZ2B7AwIOn/6kjbQMvvORfUCBhTHCxADuZ4onRlQ3m0Ci
         +qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763549467; x=1764154267;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtnZFSIGU7bG1vfdAcW2qaHOgH8mtrYWLBBQLVZWajw=;
        b=SII/+GezYzHlKFMeOV/oYXNaG4ux9KI2tXmrqnxSwV5UvO+82h9DLzWo7uedNlIM17
         DZNXmCid/u4xDdO4vJgbgUbF7X83h1v/2Jz62PhB3sqOf6SJ+nml3YxksgR7W55lTgaV
         285nIjPHZJpD8dT5nv2mS74xlJtI2Q40qXwDxDxlP8ZLnbnm1YStcBeEj1OFj1pzTrJk
         6CkkMlTH9xisVDA/j/MuCpAJet6myKOU+2uQYsQyBTUu+tsfEbaax6s9weCD/I8/cbF7
         /7pyIAsR5jjCJS9GvrD/uBkthXJXBKd2M8Vaon5+JYDA0f4uShAbfXhdDLdO+Lr6aZ9t
         UdLw==
X-Gm-Message-State: AOJu0YymXrUwoCUKOdmQ0Q8dXl3xKQFbMpSKiG0RpllTYttwW4CH4iwB
	LdcbkzWZxej/ZOHEU4yu0bX8qGCyVraanW/qoVg+pULy58tvwZrn4UIv/xzlKYztzQbmsiKFNvE
	9XG4=
X-Gm-Gg: ASbGnctuCuI1rGtXZIPTIffxClMwy8sm+5hUKDYd4YqR7EXJ6iiLBeebSN0D7OdgxXV
	QRybmDBNyDj5Y+VvU93GOojjgFipjMCjxISWUAw+uHygUnahbYpsIil6jsXhB+NQ34VEbEJyxgN
	l5uhi/pBofbOBVBO2+8azPwKvL4DB48Y5bSdhj9voWnpcma0bK/g9RlOfTPZwIWJidsjfqz+/Jp
	POqfQaspq1vokH8fQ2U6cK5zPEiZp71GAbFceTW0c/R7t0aDd7IkIkLKNyxXmXONReuBZJUsqA/
	Z/5h40N//N4h1ZKpnGPJU+Tzy1kaLYdjItMOIGJX8dcY4HuGHmh7nlczL0S8HXFn7qIt6RlgYUj
	UcrJWK2xYenFgz5lka5xAWP1hCD9YYhFvoE+l2Ooy57hks4pLk2F75Hv8aOXepr7WiekHWEFRr9
	i3BrwCWDpu+HmG0fmn/ayAmkEljKXHsvo2IYuO1XNYSh4XpihKnLSN8GusBDigCeq27923rg0G1
	dfAB6U23OZSmul0mb+6VpZ2
X-Google-Smtp-Source: AGHT+IE2WtzPthZ9szFJm6vcoB7pTMXSg78Zs6a7lb6QJzF8tCzGLaldMkWOBo/FvokuUh0HrOh19w==
X-Received: by 2002:a17:906:c103:b0:b72:5bdf:6074 with SMTP id a640c23a62f3a-b7637897967mr247384266b.20.1763549467155;
        Wed, 19 Nov 2025 02:51:07 -0800 (PST)
Message-ID: <06f2081b-64e0-47f5-b66a-26363979cfdb@suse.com>
Date: Wed, 19 Nov 2025 11:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/4] x86/vPMU: don't statically reserve the interrupt vector
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
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
In-Reply-To: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Move the setup to vPMU code, doing the allocation of a vector only when
one is actually going to be needed. With that the handler function also
doesn't need to be split across two places anymore.

Add the freed up vector to the dynamically allocatable range.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In case down the road we also want to have a build mode with vPMU code
excluded, this may also simplify things a little there.

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
-    ack_APIC_irq();
-    vpmu_do_interrupt();
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
+static void cf_check vpmu_interrupt(void)
 {
     struct vcpu *sampled = current, *sampling;
     struct vpmu_struct *vpmu;
@@ -169,6 +171,8 @@ void vpmu_do_interrupt(void)
     uint32_t vlapic_lvtpc;
 #endif
 
+    ack_APIC_irq();
+
     /*
      * dom0 will handle interrupt for special domains (e.g. idle domain) or,
      * in XENPMU_MODE_ALL, for everyone.
@@ -369,7 +373,7 @@ void vpmu_save(struct vcpu *v)
 
     vpmu_reset(vpmu, VPMU_CONTEXT_SAVE);
 
-    apic_write(APIC_LVTPC, PMU_APIC_VECTOR | APIC_LVT_MASKED);
+    apic_write(APIC_LVTPC, pmu_apic_vector | APIC_LVT_MASKED);
 }
 
 int vpmu_load(struct vcpu *v, bool from_guest)
@@ -432,7 +436,7 @@ static int vpmu_arch_initialise(struct v
         return ret;
     }
 
-    vpmu->hw_lapic_lvtpc = PMU_APIC_VECTOR | APIC_LVT_MASKED;
+    vpmu->hw_lapic_lvtpc = pmu_apic_vector | APIC_LVT_MASKED;
     vpmu_set(vpmu, VPMU_INITIALIZED);
 
     return 0;
@@ -860,6 +864,8 @@ static int __init cf_check vpmu_init(voi
         register_cpu_notifier(&cpu_nfb);
         printk(XENLOG_INFO "VPMU: version " __stringify(XENPMU_VER_MAJ) "."
                __stringify(XENPMU_VER_MIN) "\n");
+
+        alloc_direct_apic_vector(&pmu_apic_vector, vpmu_interrupt);
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


