Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D2282AA11
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 10:02:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666048.1036487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqxJ-0000Ze-By; Thu, 11 Jan 2024 09:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666048.1036487; Thu, 11 Jan 2024 09:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqxJ-0000WN-8v; Thu, 11 Jan 2024 09:02:29 +0000
Received: by outflank-mailman (input) for mailman id 666048;
 Thu, 11 Jan 2024 09:02:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNqxI-0006N6-BF
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 09:02:28 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24b76380-b060-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 10:02:27 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33765009941so4006043f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 01:02:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h6-20020adf9cc6000000b003375d8b0460sm643239wre.1.2024.01.11.01.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 01:02:26 -0800 (PST)
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
X-Inumbo-ID: 24b76380-b060-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704963747; x=1705568547; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O6gDUVTeesAB+3UgM1HShKtF9ZMrecPCai/9iqbHlNc=;
        b=Q4c7L/lYSqcbpDFUrhThdLd3PQ2sU9xrEExcVi5PFWBqXOOYqq57DWgBuMZgWAZcnS
         9GdVB2FaQOPLm7rYDG2HR7es/5kkgVarGziSDXu0+5+yfHEHieanoMFd9Qiy2/HX6NjL
         TJLcvdegxiqIVrq2F7MaqtG/oo6mHoYyT7MPvrOkOUSInOj+qmHZUu95TovC8QYRhvfk
         aUKKmgxcfnDJ5SivJdkNcGfFsMCVhpJLckFBjO2OqKcp11v9ivfSpw3Gk8mVVB8asPRz
         VjyjRiDta9dKQkTWZ+Wdz97W7RGOi8GGCYrqi4chXOT87Uu8dAzUkkIpo/sggETnLS6z
         ikVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704963747; x=1705568547;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6gDUVTeesAB+3UgM1HShKtF9ZMrecPCai/9iqbHlNc=;
        b=Pb448SdNi0jgJDEDYkHFB/PY/OW7CeCyJXy+Pv6Ro838xDyV/87j2zc5tXgPdgrRIt
         6pLroKf5lBfPwLuxfLBgCiLmcMbO5FjwKHaIVbfgbc59HYjxNI4/mVDttC6J2gwVOPot
         8tGmaFygfsyODCCZDNkjS0B9txMIoe2PTqCAbQsbbymxknoq9nfYlgVMeJRGnsujw/Ad
         vc5H1j9SviIGlPinPuDrhlJ510/ztYwAabdxmMQBjLXS8ebTnXHBLMcO1u7h0UhppcoZ
         azZCjpJ8wEa5yUq1d3ub0Hkz3P6pIpwKxCuxdzhcaMc0hoxAlAh/o5Y3DpTvHYTpiaPl
         62lg==
X-Gm-Message-State: AOJu0YwfOvXstuK8n8Oq5GxZJiexVpCOPmNxvo5ptyy7MkMCcpVivvq5
	JxnzMeC/fiRxicoeE0+uBSrXmzJeXDwbNmDJMl0hjI6V3Q==
X-Google-Smtp-Source: AGHT+IHK7I9EmS58FYFhqOOOzePXRwPQUOluRryL+zHTekF2JdUqtwL5KKfL3tJDC2DsK8eJt4Z5LA==
X-Received: by 2002:a5d:5545:0:b0:337:7298:aeb2 with SMTP id g5-20020a5d5545000000b003377298aeb2mr432461wrw.121.1704963747015;
        Thu, 11 Jan 2024 01:02:27 -0800 (PST)
Message-ID: <e29f16f5-339b-4b15-8292-51ce498c0657@suse.com>
Date: Thu, 11 Jan 2024 10:02:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 8/8] VMX: support USER_MSR
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
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
In-Reply-To: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hook up the new VM exit codes and handle guest accesses, context switch,
and save/restore. At least for now don't allow the guest direct access
to the control MSR; this may need changing if guests were to frequently
access it (e.g. on their own context switch path).

While there also correct a one-off in union ldt_or_tr_instr_info's
comment.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Needing to change two places in hvm.c continues to be unhelpful; I
recall I already did forget to also adjust hvm_load_cpu_msrs() for XFD.
Considering that MSRs typically arrive in the order the table has it,
couldn't we incrementally look up the incoming MSR index there, falling
back to a full lookup only when the incremental lookup failed (and thus
not normally re-iterating through the initial part of the array)?

Said comment in union ldt_or_tr_instr_info is further odd (same for
union gdt_or_idt_instr_info's) in that Instruction Information is only a
32-bit field. Hence bits 32-63 aren't undefined, but simply don't exist.

RFC: The wee attempt to "deal" with nested is likely wrong, but I'm
     afraid I simply don't know where such enforcement would be done
     properly. Returning an error there is also commented out, for
     domain_cpu_policy_changed() returning void without "x86/xstate:
     re-size save area when CPUID policy changes" in place.
---
v4: New.

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -674,6 +674,12 @@ static void __init calculate_hvm_max_pol
          * situations until someone has cross-checked the behaviour for safety.
          */
         __clear_bit(X86_FEATURE_PKS, fs);
+
+        /*
+         * Don't expose USER_MSR until it is known how (if at all) it is
+         * virtualized on SVM.
+         */
+        __clear_bit(X86_FEATURE_USER_MSR, fs);
     }
 
     if ( !cpu_has_vmx_msrlist )
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -447,6 +447,10 @@ void domain_cpu_policy_changed(struct do
         }
     }
 
+    /* Nested doesn't have the necessary processing, yet. */
+    if ( nestedhvm_enabled(d) && p->feat.user_msr )
+        return /* -EINVAL */;
+
     for_each_vcpu ( d, v )
     {
         cpu_policy_updated(v);
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1351,6 +1351,7 @@ static int cf_check hvm_load_cpu_xsave_s
 
 #define HVM_CPU_MSR_SIZE(cnt) offsetof(struct hvm_msr, msr[cnt])
 static const uint32_t msrs_to_send[] = {
+    MSR_USER_MSR_CTL,
     MSR_SPEC_CTRL,
     MSR_INTEL_MISC_FEATURES_ENABLES,
     MSR_PKRS,
@@ -1505,6 +1506,7 @@ static int cf_check hvm_load_cpu_msrs(st
         {
             int rc;
 
+        case MSR_USER_MSR_CTL:
         case MSR_SPEC_CTRL:
         case MSR_INTEL_MISC_FEATURES_ENABLES:
         case MSR_PKRS:
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -680,13 +680,18 @@ static void cf_check vmx_vcpu_destroy(st
 }
 
 /*
- * To avoid MSR save/restore at every VM exit/entry time, we restore
- * the x86_64 specific MSRs at domain switch time. Since these MSRs
- * are not modified once set for para domains, we don't save them,
- * but simply reset them to values set in percpu_traps_init().
+ * To avoid MSR save/restore at every VM exit/entry time, we restore the
+ * x86_64 specific MSRs at vcpu switch time. Since these MSRs are not
+ * modified once set for para domains, we don't save them, but simply clear
+ * them or reset them to values set in percpu_traps_init().
  */
-static void vmx_restore_host_msrs(void)
+static void vmx_restore_host_msrs(const struct vcpu *v)
 {
+    const struct vcpu_msrs *msrs = v->arch.msrs;
+
+    if ( msrs->user_msr_ctl.enable )
+        wrmsrl(MSR_USER_MSR_CTL, 0);
+
     /* No PV guests?  No need to restore host SYSCALL infrastructure. */
     if ( !IS_ENABLED(CONFIG_PV) )
         return;
@@ -740,6 +745,9 @@ static void vmx_restore_guest_msrs(struc
 
     if ( cp->feat.pks )
         wrpkrs(msrs->pkrs);
+
+    if ( msrs->user_msr_ctl.enable )
+        wrmsrl(MSR_USER_MSR_CTL, msrs->user_msr_ctl.raw);
 }
 
 void vmx_update_cpu_exec_control(struct vcpu *v)
@@ -1161,7 +1169,7 @@ static void cf_check vmx_ctxt_switch_fro
     if ( !v->arch.fully_eager_fpu )
         vmx_fpu_leave(v);
     vmx_save_guest_msrs(v);
-    vmx_restore_host_msrs();
+    vmx_restore_host_msrs(v);
     vmx_save_dr(v);
 
     if ( v->domain->arch.hvm.pi_ops.flags & PI_CSW_FROM )
@@ -4552,6 +4560,48 @@ void asmlinkage vmx_vmexit_handler(struc
             hvm_inject_hw_exception(X86_EXC_GP, 0);
         break;
 
+    case EXIT_REASON_URDMSR:
+    {
+        uint64_t msr_content = 0;
+
+        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        switch ( hvm_msr_read_intercept(exit_qualification, &msr_content) )
+        {
+            user_msr_instr_info_t info;
+
+        case X86EMUL_OKAY:
+            __vmread(VMX_INSTRUCTION_INFO, &info.raw);
+            *decode_gpr(regs, info.gpr) = msr_content;
+            update_guest_eip(); /* Safe: URDMSR */
+            break;
+
+        case X86EMUL_EXCEPTION:
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
+            break;
+        }
+        break;
+    }
+
+    case EXIT_REASON_UWRMSR:
+    {
+        user_msr_instr_info_t info;
+
+        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        __vmread(VMX_INSTRUCTION_INFO, &info.raw);
+        switch ( hvm_msr_write_intercept(exit_qualification,
+                                         *decode_gpr(regs, info.gpr), true) )
+        {
+        case X86EMUL_OKAY:
+            update_guest_eip(); /* Safe: UWRMSR */
+            break;
+
+        case X86EMUL_EXCEPTION:
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
+            break;
+        }
+        break;
+    }
+
     case EXIT_REASON_VMXOFF:
     case EXIT_REASON_VMXON:
     case EXIT_REASON_VMCLEAR:
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -204,6 +204,8 @@ static inline void pi_clear_sn(struct pi
 #define EXIT_REASON_NOTIFY              75
 #define EXIT_REASON_RDMSRLIST           78
 #define EXIT_REASON_WRMSRLIST           79
+#define EXIT_REASON_URDMSR              80
+#define EXIT_REASON_UWRMSR              81
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
@@ -675,8 +677,18 @@ typedef union ldt_or_tr_instr_info {
         base_reg_invalid        :1,  /* bit 27 - Base register invalid */
         instr_identity          :1,  /* bit 28 - 0:LDT, 1:TR */
         instr_write             :1,  /* bit 29 - 0:store, 1:load */
-                                :34; /* bits 31:63 - Undefined */
+                                :34; /* bits 30:63 - Undefined */
     };
 } ldt_or_tr_instr_info_t;
 
+/* VM-Exit instruction info for URDMSR and UWRMSR */
+typedef union user_msr_instr_info {
+    unsigned long raw;
+    struct {
+        unsigned int            :3,  /* Bits 0:2 - Undefined */
+        gpr                     :4,  /* Bits 3:6 - Source/Destination register */
+                                :25; /* bits 7:31 - Undefined */
+    };
+} user_msr_instr_info_t;
+
 #endif /* __ASM_X86_HVM_VMX_VMX_H__ */
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -296,6 +296,20 @@ uint64_t msr_spec_ctrl_valid_bits(const
 struct vcpu_msrs
 {
     /*
+     * 0x0000001c - MSR_USER_MSR_CTL
+     *
+     * Value is guest chosen, and always loaded in vcpu context.
+     */
+    union {
+        uint64_t raw;
+        struct {
+            bool enable:1;
+            unsigned int :11;
+            unsigned long bitmap:52;
+        };
+    } user_msr_ctl;
+
+    /*
      * 0x00000048 - MSR_SPEC_CTRL
      * 0xc001011f - MSR_VIRT_SPEC_CTRL (if X86_FEATURE_AMD_SSBD)
      *
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 80
+#define VMX_PERF_EXIT_REASON_SIZE 82
 #define VMEXIT_NPF_PERFC 143
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -204,6 +204,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t
         *val = msrs->xss.raw;
         break;
 
+    case MSR_USER_MSR_CTL:
+        if ( !cp->feat.user_msr )
+            goto gp_fault;
+        *val = msrs->user_msr_ctl.raw;
+        break;
+
     case 0x40000000 ... 0x400001ff:
         if ( is_viridian_domain(d) )
         {
@@ -529,6 +535,19 @@ int guest_wrmsr(struct vcpu *v, uint32_t
         msrs->xss.raw = val;
         break;
 
+    case MSR_USER_MSR_CTL:
+        if ( !cp->feat.user_msr )
+            goto gp_fault;
+
+        if ( (val & ~(USER_MSR_ENABLE | USER_MSR_ADDR_MASK)) ||
+             !is_canonical_address(val) )
+            goto gp_fault;
+
+        msrs->user_msr_ctl.raw = val;
+        if ( v == curr )
+            wrmsrl(MSR_USER_MSR_CTL, val);
+        break;
+
     case 0x40000000 ... 0x400001ff:
         if ( is_viridian_domain(d) )
         {
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -315,7 +315,7 @@ XEN_CPUFEATURE(MCDT_NO,            13*32
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
 XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
 XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
-XEN_CPUFEATURE(USER_MSR,           15*32+15) /*   U{RD,WR}MSR Instructions */
+XEN_CPUFEATURE(USER_MSR,           15*32+15) /*s  U{RD,WR}MSR Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */


