Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67958829CFB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 15:57:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665548.1035766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNa1Q-0007H8-64; Wed, 10 Jan 2024 14:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665548.1035766; Wed, 10 Jan 2024 14:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNa1Q-0007F9-2e; Wed, 10 Jan 2024 14:57:36 +0000
Received: by outflank-mailman (input) for mailman id 665548;
 Wed, 10 Jan 2024 14:57:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/O5u=IU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNa1P-0006ap-63
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 14:57:35 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 957a49f0-afc8-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 15:57:33 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e4d515cdeso23217555e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 06:57:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bg3-20020a05600c3c8300b0040d91fa270fsm2449640wmb.36.2024.01.10.06.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 06:57:32 -0800 (PST)
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
X-Inumbo-ID: 957a49f0-afc8-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704898653; x=1705503453; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3102lstaK73LzoqFwPAeE+Wj//RivVZPDGZVH12C8fY=;
        b=gm+rv0xfPgNhYF706WrdwHRVUqQeZf+eYgRaU9iuv6Z8Ig88WTXHnqnimEV8FRNe0S
         fFbC8bzxqO2y/rM8ZNLa2UVvaP0ZD1tvhEspPvw3WOY7HJpkV+IBkC1TMqaZCxv8aK2a
         W7yxpkO17pu+qCFbn3HwSQAGUiVEDqkyzuBBQaNBEFHJ1BCQcjxpjqIOWpUZnCUmxc4z
         KEYpIzhiK6Y2znP4mUbeEDiVLPUSA/Ybl7MN0OaS6+KTaINiveTDsW+3hHC5YE/+eUNC
         KyzGBp0BrliuhRkVWgNwvixnynh8FinWfnEjESH31RWssLySzRfk+j5E0vNI6XJoJ0XB
         /e1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704898653; x=1705503453;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3102lstaK73LzoqFwPAeE+Wj//RivVZPDGZVH12C8fY=;
        b=VM/hlJzyGnvKJVfckr3GrYXoLPfDnqe3B4RBoPB2QFE9gpQP8e29EjtlOkj94OcvYw
         5q6JKLlUBxQfIuQzrDSvK3pGyq0HEaL+aAXDMyp6WTrTWw+RFglnYKACudlz6GjWECyz
         cpweN1waXajlHMu0OtkO6JqUgG3WShkmwzZedc1agHyj8tgMOS4KWgtYgRr0vNwbwQ9H
         rt8YVhtjSxqvWiNYRy28uH4BSS/ODunU996QMi+X28vSwseAzilCht09OAHLvIIpEdGI
         V2+peLsbrZkGT4dRsmdJ4oAYkjh4mTIBpDJtdFi/7HYGFhkvCrD3rLoKSB6gR7+zsLMI
         sR+Q==
X-Gm-Message-State: AOJu0YzvOfMYCYHVogcaHBAXd/XpHTiVXgwjQBsDrEZCPAyi8ONYq/+f
	HtSgI1GFoQZSAVZ3GsRhLkNzMcehWZoP+xbu0v61ZZ+ifg==
X-Google-Smtp-Source: AGHT+IHDTaTydRkAfyTOn9O75WQzYwxcjetr6RQH5Ef5XnPum+MTJ3GqQR+w4sca2wiRH8biZ8e9Rg==
X-Received: by 2002:a05:600c:4513:b0:40e:44c2:a3ed with SMTP id t19-20020a05600c451300b0040e44c2a3edmr603861wmo.61.1704898652774;
        Wed, 10 Jan 2024 06:57:32 -0800 (PST)
Message-ID: <c64d27cd-0a31-440d-a231-b27b01fa6b2d@suse.com>
Date: Wed, 10 Jan 2024 15:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 2/5] x86/HVM: adjust save/restore hook registration for
 optional check handler
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8110e31e-5411-467e-9c59-06751902853a@suse.com>
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
In-Reply-To: <8110e31e-5411-467e-9c59-06751902853a@suse.com>
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
@@ -1186,7 +1186,7 @@ static int cf_check hvm_load_cpu_ctxt(st
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(CPU, hvm_save_cpu_ctxt, hvm_load_cpu_ctxt, 1,
+HVM_REGISTER_SAVE_RESTORE(CPU, hvm_save_cpu_ctxt, NULL, hvm_load_cpu_ctxt, 1,
                           HVMSR_PER_VCPU);
 
 #define HVM_CPU_XSAVE_SIZE(xcr0) (offsetof(struct hvm_hw_cpu_xsave, \
@@ -1535,6 +1535,7 @@ static int __init cf_check hvm_register_
     hvm_register_savevm(CPU_XSAVE_CODE,
                         "CPU_XSAVE",
                         hvm_save_cpu_xsave_states,
+                        NULL,
                         hvm_load_cpu_xsave_states,
                         HVM_CPU_XSAVE_SIZE(xfeature_mask) +
                             sizeof(struct hvm_save_descriptor),
@@ -1543,6 +1544,7 @@ static int __init cf_check hvm_register_
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


