Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C0D8173E3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:40:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656063.1024007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEn6-0002x2-GY; Mon, 18 Dec 2023 14:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656063.1024007; Mon, 18 Dec 2023 14:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEn6-0002us-Ci; Mon, 18 Dec 2023 14:40:20 +0000
Received: by outflank-mailman (input) for mailman id 656063;
 Mon, 18 Dec 2023 14:40:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFEn4-0001hV-Kv
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 14:40:18 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bfc2054-9db3-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 15:40:16 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c31f18274so39447275e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 06:40:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c470900b0040c4acaa4bfsm31329915wmo.19.2023.12.18.06.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 06:40:15 -0800 (PST)
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
X-Inumbo-ID: 5bfc2054-9db3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702910416; x=1703515216; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4DiAqokvVXPd3MpiYleSixbq9Tt+MTQdnErWjsgoNBk=;
        b=Fy1I60LwA5NUhDj+BRYKoXo+Y1L6EeLzM57ehmrzrR5exZWfakOfuy2FDPVmuyamVh
         PCS3ZjH8DK6RLluIXVmefpTT2Y1GlbwtfVG654Z7AS+HHf4XPNOrTJyF35qa5ppsDel4
         WHa8PfR2YCfw80EKJDkei6ud4rJ/YzGG1JyYou0o2Opt8bkX2GmKG3HgXol6QTKb8Eix
         KSlBi/4craO4PllucAkc+6h7IDM3k0cQSLktvpZXlJB4DIpsAojA5sM2NAwiD+QPUoEH
         /zYecECT1RBeN1Nz7vQE3hc1zl1MYt7Xmo/Y8ByaQTT9dM3YlGBqTlRiqN+fXl1MXaAg
         0LWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702910416; x=1703515216;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DiAqokvVXPd3MpiYleSixbq9Tt+MTQdnErWjsgoNBk=;
        b=Jti+uhj1QnWba+v1BV/ZsMQJ4ZLU5zVp9OB4b8OueEaIYRIIJ72jPW4vII/3GpvxIX
         2x6M96bhQmal0h71op+lWn9AUhS/mBUZbLRQ8q7D3ur/82gAX/RkJFFy1t4Y/Qm+W6zO
         aZzWWgP4LDGP4l4H9bIya0LXot5eqpApKZQ4QkmuSnjGvDmucbRikQThWm3HuDK1g5p+
         81Q3iOM02uHTxBk6YoHaGLVB9rLi0zEUkJS3+SKIeMh9iG+ZjJPBx3bHUU472L5eyM/Z
         8+7xDlznGwK34R1MwTcki7jOJWnj4i4aDYf1ywxmtyEPituayCCWcF08jH2p19UiFa9q
         M/2A==
X-Gm-Message-State: AOJu0YwrDVtgNnZAshdwwAnATGjFqVL49r5zlcY8BR8HiBQgt1DiPvpj
	DNSCANX1IfeTRa8InCcs8DS09lQd0kj/9CKd8CVc
X-Google-Smtp-Source: AGHT+IFMLpzKTNORPRPFLBDCtaO+CZBNJmfJ5d+xy3Kd9QX0KblH5lsAi7/62hsZEtGlNqIpHkMQng==
X-Received: by 2002:a05:600c:4e8d:b0:401:b6f6:d90c with SMTP id f13-20020a05600c4e8d00b00401b6f6d90cmr7854855wmq.35.1702910415796;
        Mon, 18 Dec 2023 06:40:15 -0800 (PST)
Message-ID: <4ed8bbd2-f893-4c12-b804-2df56d55209e@suse.com>
Date: Mon, 18 Dec 2023 15:40:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 2/5] x86/HVM: adjust save/restore hook registration for
 optional check handler
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
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
In-Reply-To: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Register NULL uniformly as a first step.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: New.

--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -374,7 +374,7 @@ static int cf_check vmce_load_vcpu_ctxt(
     return err ?: vmce_restore_vcpu(v, &ctxt);
 }
 
-HVM_REGISTER_SAVE_RESTORE(VMCE_VCPU, vmce_save_vcpu_ctxt,
+HVM_REGISTER_SAVE_RESTORE(VMCE_VCPU, vmce_save_vcpu_ctxt, NULL,
                           vmce_load_vcpu_ctxt, 1, HVMSR_PER_VCPU);
 #endif
 
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -458,7 +458,7 @@ static int cf_check pit_load(struct doma
     return rc;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, pit_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, NULL, pit_load, 1, HVMSR_PER_DOM);
 #endif
 
 /* The intercept action for PIT DM retval: 0--not handled; 1--handled. */
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -692,7 +692,7 @@ static int cf_check hpet_load(struct dom
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(HPET, hpet_save, hpet_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(HPET, hpet_save, NULL, hpet_load, 1, HVMSR_PER_DOM);
 
 static void hpet_set(HPETState *h)
 {
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -793,7 +793,7 @@ static int cf_check hvm_load_tsc_adjust(
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(TSC_ADJUST, hvm_save_tsc_adjust,
+HVM_REGISTER_SAVE_RESTORE(TSC_ADJUST, hvm_save_tsc_adjust, NULL,
                           hvm_load_tsc_adjust, 1, HVMSR_PER_VCPU);
 
 static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
@@ -1189,7 +1189,7 @@ static int cf_check hvm_load_cpu_ctxt(st
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(CPU, hvm_save_cpu_ctxt, hvm_load_cpu_ctxt, 1,
+HVM_REGISTER_SAVE_RESTORE(CPU, hvm_save_cpu_ctxt, NULL, hvm_load_cpu_ctxt, 1,
                           HVMSR_PER_VCPU);
 
 #define HVM_CPU_XSAVE_SIZE(xcr0) (offsetof(struct hvm_hw_cpu_xsave, \
@@ -1538,6 +1538,7 @@ static int __init cf_check hvm_register_
     hvm_register_savevm(CPU_XSAVE_CODE,
                         "CPU_XSAVE",
                         hvm_save_cpu_xsave_states,
+                        NULL,
                         hvm_load_cpu_xsave_states,
                         HVM_CPU_XSAVE_SIZE(xfeature_mask) +
                             sizeof(struct hvm_save_descriptor),
@@ -1546,6 +1547,7 @@ static int __init cf_check hvm_register_
     hvm_register_savevm(CPU_MSR_CODE,
                         "CPU_MSR",
                         hvm_save_cpu_msrs,
+                        NULL,
                         hvm_load_cpu_msrs,
                         HVM_CPU_MSR_SIZE(ARRAY_SIZE(msrs_to_send)) +
                             sizeof(struct hvm_save_descriptor),
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -784,9 +784,9 @@ static int cf_check irq_load_link(struct
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PCI_IRQ, irq_save_pci, irq_load_pci,
+HVM_REGISTER_SAVE_RESTORE(PCI_IRQ, irq_save_pci, NULL, irq_load_pci,
                           1, HVMSR_PER_DOM);
-HVM_REGISTER_SAVE_RESTORE(ISA_IRQ, irq_save_isa, irq_load_isa,
+HVM_REGISTER_SAVE_RESTORE(ISA_IRQ, irq_save_isa, NULL, irq_load_isa,
                           1, HVMSR_PER_DOM);
-HVM_REGISTER_SAVE_RESTORE(PCI_LINK, irq_save_link, irq_load_link,
+HVM_REGISTER_SAVE_RESTORE(PCI_LINK, irq_save_link, NULL, irq_load_link,
                           1, HVMSR_PER_DOM);
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -773,7 +773,7 @@ static int cf_check hvm_load_mtrr_msr(st
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(MTRR, hvm_save_mtrr_msr, hvm_load_mtrr_msr, 1,
+HVM_REGISTER_SAVE_RESTORE(MTRR, hvm_save_mtrr_msr, NULL, hvm_load_mtrr_msr, 1,
                           HVMSR_PER_VCPU);
 
 void memory_type_changed(struct domain *d)
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -300,7 +300,7 @@ static int cf_check acpi_load(struct dom
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PMTIMER, acpi_save, acpi_load,
+HVM_REGISTER_SAVE_RESTORE(PMTIMER, acpi_save, NULL, acpi_load,
                           1, HVMSR_PER_DOM);
 
 int pmtimer_change_ioport(struct domain *d, uint64_t version)
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -797,7 +797,7 @@ static int cf_check rtc_load(struct doma
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(RTC, rtc_save, rtc_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(RTC, rtc_save, NULL, rtc_load, 1, HVMSR_PER_DOM);
 
 void rtc_reset(struct domain *d)
 {
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -88,6 +88,7 @@ static struct {
 void __init hvm_register_savevm(uint16_t typecode,
                                 const char *name,
                                 hvm_save_handler save_state,
+                                hvm_check_handler check_state,
                                 hvm_load_handler load_state,
                                 size_t size, int kind)
 {
@@ -96,6 +97,7 @@ void __init hvm_register_savevm(uint16_t
     ASSERT(hvm_sr_handlers[typecode].check == NULL);
     ASSERT(hvm_sr_handlers[typecode].load == NULL);
     hvm_sr_handlers[typecode].save = save_state;
+    hvm_sr_handlers[typecode].check = check_state;
     hvm_sr_handlers[typecode].load = load_state;
     hvm_sr_handlers[typecode].name = name;
     hvm_sr_handlers[typecode].size = size;
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -631,7 +631,8 @@ static int cf_check ioapic_load(struct d
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, ioapic_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, NULL, ioapic_load, 1,
+                          HVMSR_PER_DOM);
 
 void vioapic_reset(struct domain *d)
 {
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -1145,7 +1145,7 @@ static int cf_check viridian_load_domain
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_DOMAIN, viridian_save_domain_ctxt,
+HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_DOMAIN, viridian_save_domain_ctxt, NULL,
                           viridian_load_domain_ctxt, 1, HVMSR_PER_DOM);
 
 static int cf_check viridian_save_vcpu_ctxt(
@@ -1188,7 +1188,7 @@ static int cf_check viridian_load_vcpu_c
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_VCPU, viridian_save_vcpu_ctxt,
+HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_VCPU, viridian_save_vcpu_ctxt, NULL,
                           viridian_load_vcpu_ctxt, 1, HVMSR_PER_VCPU);
 
 static int __init cf_check parse_viridian_version(const char *arg)
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1617,9 +1617,9 @@ static int cf_check lapic_load_regs(stru
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(LAPIC, lapic_save_hidden,
+HVM_REGISTER_SAVE_RESTORE(LAPIC, lapic_save_hidden, NULL,
                           lapic_load_hidden, 1, HVMSR_PER_VCPU);
-HVM_REGISTER_SAVE_RESTORE(LAPIC_REGS, lapic_save_regs,
+HVM_REGISTER_SAVE_RESTORE(LAPIC_REGS, lapic_save_regs, NULL,
                           lapic_load_regs, 1, HVMSR_PER_VCPU);
 
 int vlapic_init(struct vcpu *v)
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -449,7 +449,7 @@ static int cf_check vpic_load(struct dom
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PIC, vpic_save, vpic_load, 2, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(PIC, vpic_save, NULL, vpic_load, 2, HVMSR_PER_DOM);
 
 void vpic_reset(struct domain *d)
 {
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -113,6 +113,7 @@ typedef int (*hvm_load_handler) (struct
 void hvm_register_savevm(uint16_t typecode,
                          const char *name, 
                          hvm_save_handler save_state,
+                         hvm_check_handler check_state,
                          hvm_load_handler load_state,
                          size_t size, int kind);
 
@@ -122,12 +123,13 @@ void hvm_register_savevm(uint16_t typeco
 
 /* Syntactic sugar around that function: specify the max number of
  * saves, and this calculates the size of buffer needed */
-#define HVM_REGISTER_SAVE_RESTORE(_x, _save, _load, _num, _k)             \
+#define HVM_REGISTER_SAVE_RESTORE(_x, _save, check, _load, _num, _k)      \
 static int __init cf_check __hvm_register_##_x##_save_and_restore(void)   \
 {                                                                         \
     hvm_register_savevm(HVM_SAVE_CODE(_x),                                \
                         #_x,                                              \
                         &_save,                                           \
+                        check,                                            \
                         &_load,                                           \
                         (_num) * (HVM_SAVE_LENGTH(_x)                     \
                                   + sizeof (struct hvm_save_descriptor)), \


