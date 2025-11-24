Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCF0C8138E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 16:04:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171367.1496389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNY6a-0003fP-3v; Mon, 24 Nov 2025 15:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171367.1496389; Mon, 24 Nov 2025 15:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNY6a-0003dg-0N; Mon, 24 Nov 2025 15:03:52 +0000
Received: by outflank-mailman (input) for mailman id 1171367;
 Mon, 24 Nov 2025 15:03:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNY2u-0005X4-QO
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 15:00:04 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40d3d50a-c946-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 16:00:02 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so37314335e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 07:00:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf3af0e1sm196682755e9.10.2025.11.24.07.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 07:00:01 -0800 (PST)
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
X-Inumbo-ID: 40d3d50a-c946-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763996402; x=1764601202; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sZUWGoebn4tcYyYHKdiUe8nZOMYNv6ZDM2HTEINqTd0=;
        b=TOpt65lwyO3QYh26zNTeTaZxsruPelTLrU+VUS84rjj/xJGi0vRMRVhIlCo02cfArz
         C5HEDoMUzSCLKthq2M63JQ4QeaCyf/fmOqb1FIEfHNNu4QjkbG4WhdXjQ8rO2e25dlR3
         +pUMq61O6F5KSnQa0pRf5wsIfNq/cyiUyWGTi4S61JVaR75B6qVBpZvPiBdC1yIaD+bz
         qAVhXbinFOwjERlAZCU5oWXjzxUTKu7GmzMe3gDkid1G11br2LhloryuUi9DTr9RwRkp
         swBWkAO797Q7l5pGk6y1Pdz3g0vBHvdNDEJ3jRTl3bSRLOW6eWUO7G39mCPI/qnicLP1
         7OvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996402; x=1764601202;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZUWGoebn4tcYyYHKdiUe8nZOMYNv6ZDM2HTEINqTd0=;
        b=gQWiNHobRNLGuzlwuvwf9m1HGynqyrfroDfBcPnDaQ6z6rzw2sgsBG0hExY2deilEE
         aewOiycZ7NOWX7JnhtyedNK40CBbvSx5rlf/pAMNGfayEa6QTr3b5oN2Gi89x9uWf0+s
         Q83IS6XctXYCnrbYODttMFdkoGVhhasb7X/0JDKELb1zXoXPSSXGrWkUPKstk5vM33I1
         MJvMPLSLJ8R27f+qIpFPHdZNEWQOZzk1WtuWBB5xctCe4vM2h2B/E2DJuIu5Y1Nd7SCX
         uCIYJgpPIWN3hM7l7OJybWxavJ6HBlRh8NPTcIi+DTgdm8zn5gQLg3dvCd192RiHJZWM
         1r3A==
X-Gm-Message-State: AOJu0Yx9PGaGc+k9lmkELCyZACvC9fQLHHmlhlfxUqBiLs3ZKNc5VqvU
	RYK1mCT/AjsP3sKkL0US2UkGzkva+dZ9BpNemDCjWTIy87dTnCBkHKdShT6xJzrKcaFBvsxDFyN
	dGYg=
X-Gm-Gg: ASbGncu/xS1zdoyoCHGA2e955ckDH7YvEQtYUNBGrrZEODM90+O/zFeKbSoa3X4V3bC
	zDNLNIwffdL0GLHaUunzR4SDn+/wfJDDwutj5yev1/cLtg6UQGTgDUKFmXi3HMyBEFozpntah+C
	CvvXkBUsPpej2nKA/mrSWazVX/6k7yStPki3yf+RtGLqur6IxGlCpMicEdgRjOde+RBc6wr8LhP
	DITX53VlCzYiOagW7rwUOjCmtiS0DdrYB75OkpJMfyopT2Ifpv7DY0Din2AQGLpozYRnEn3stlS
	PxIrpi3teMjHbQILRuE7ZoWsnIjFvAWFWlgkJd/BVlqVSg0Kf/PlmKHviq/beDLH1ns1UPNlo6/
	r4hSNyWnICD6CBgNl651vobBPUDAaGkbNAEUCOBzcwOjTbD2mMBs4E5y6RrTRjSIYXVBinrMv+n
	bQfNH07QSCc3SyeGVxhATgqOa0G+5WN/OOxM0/SH6KvURXZ5YSUGODjOqqDMBFAT7nLSSIAx9g8
	EU=
X-Google-Smtp-Source: AGHT+IGI+IIpF3UkbfwF+x5hDiuyQuyVZ2K9dRBHGRzhjHj7jKeSsTIeON0cebx943z2rzipKAwaOg==
X-Received: by 2002:a05:600c:3115:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-477c01f5997mr113970645e9.32.1763996401540;
        Mon, 24 Nov 2025 07:00:01 -0800 (PST)
Message-ID: <86fd4c01-fd01-4767-a9a1-c734eb037b5e@suse.com>
Date: Mon, 24 Nov 2025 16:00:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v9 05/10] VMX: support USER-MSR
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
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
In-Reply-To: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
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
v9: Use wrmsrns(). Do renames where bits are also going to be used for
    MSR-IMM. Re-base.
v8: Re-base.
v5: Introduce user_msr_gpr().
v4: New.

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -821,6 +821,12 @@ static void __init calculate_hvm_max_pol
          * situations until someone has cross-checked the behaviour for safety.
          */
         __clear_bit(X86_FEATURE_PKS, fs);
+
+        /*
+         * Don't expose USER-MSR until it is known how (if at all) it is
+         * virtualized on SVM.
+         */
+        __clear_bit(X86_FEATURE_USER_MSR, fs);
     }
 
     if ( !cpu_has_vmx_msrlist )
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -452,6 +452,10 @@ void domain_cpu_policy_changed(struct do
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
@@ -1391,6 +1391,7 @@ static int cf_check hvm_load_cpu_xsave_s
 
 #define HVM_CPU_MSR_SIZE(cnt) offsetof(struct hvm_msr, msr[cnt])
 static const uint32_t msrs_to_send[] = {
+    MSR_USER_MSR_CTL,
     MSR_SPEC_CTRL,
     MSR_INTEL_MISC_FEATURES_ENABLES,
     MSR_PKRS,
@@ -1545,6 +1546,7 @@ static int cf_check hvm_load_cpu_msrs(st
         {
             int rc;
 
+        case MSR_USER_MSR_CTL:
         case MSR_SPEC_CTRL:
         case MSR_INTEL_MISC_FEATURES_ENABLES:
         case MSR_PKRS:
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -696,13 +696,18 @@ static void cf_check vmx_vcpu_destroy(st
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
+        wrmsrns(MSR_USER_MSR_CTL, 0);
+
     /* No PV guests?  No need to restore host SYSCALL infrastructure. */
     if ( !IS_ENABLED(CONFIG_PV) )
         return;
@@ -756,6 +761,9 @@ static void vmx_restore_guest_msrs(struc
 
     if ( cp->feat.pks )
         wrpkrs(msrs->pkrs);
+
+    if ( msrs->user_msr_ctl.enable )
+        wrmsrns(MSR_USER_MSR_CTL, msrs->user_msr_ctl.raw);
 }
 
 void vmx_update_cpu_exec_control(struct vcpu *v)
@@ -1199,7 +1207,7 @@ static void cf_check vmx_ctxt_switch_fro
     if ( !v->arch.fully_eager_fpu )
         vmx_fpu_leave(v);
     vmx_save_guest_msrs(v);
-    vmx_restore_host_msrs();
+    vmx_restore_host_msrs(v);
     vmx_save_dr(v);
 
     if ( v->domain->arch.hvm.pi_ops.flags & PI_CSW_FROM )
@@ -4245,6 +4253,14 @@ static int vmx_handle_apic_write(void)
     return vlapic_apicv_write(current, exit_qualification & 0xfff);
 }
 
+static unsigned int msr_imm_gpr(void)
+{
+    msr_imm_instr_info_t info;
+
+    __vmread(VMX_INSTRUCTION_INFO, &info.raw);
+    return info.gpr;
+}
+
 static void undo_nmis_unblocked_by_iret(void)
 {
     unsigned long guest_info;
@@ -4745,6 +4761,41 @@ void asmlinkage vmx_vmexit_handler(struc
             hvm_inject_hw_exception(X86_EXC_GP, 0);
         break;
 
+    case EXIT_REASON_URDMSR:
+    {
+        uint64_t msr_content = 0;
+
+        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        switch ( hvm_msr_read_intercept(exit_qualification, &msr_content) )
+        {
+        case X86EMUL_OKAY:
+            *decode_gpr(regs, msr_imm_gpr()) = msr_content;
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
+        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+        switch ( hvm_msr_write_intercept(exit_qualification,
+                                         *decode_gpr(regs, msr_imm_gpr()),
+                                         true) )
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
+
     case EXIT_REASON_VMXOFF:
     case EXIT_REASON_VMXON:
     case EXIT_REASON_VMCLEAR:
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -203,6 +203,8 @@ static inline void pi_clear_sn(struct pi
 #define EXIT_REASON_NOTIFY              75
 #define EXIT_REASON_RDMSRLIST           78
 #define EXIT_REASON_WRMSRLIST           79
+#define EXIT_REASON_URDMSR              80
+#define EXIT_REASON_UWRMSR              81
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
@@ -578,8 +580,18 @@ typedef union ldt_or_tr_instr_info {
         base_reg_invalid        :1,  /* bit 27 - Base register invalid */
         instr_identity          :1,  /* bit 28 - 0:LDT, 1:TR */
         instr_write             :1,  /* bit 29 - 0:store, 1:load */
-                                :34; /* bits 31:63 - Undefined */
+                                :34; /* bits 30:63 - Undefined */
     };
 } ldt_or_tr_instr_info_t;
 
+/* VM-Exit instruction info for URDMSR and UWRMSR */
+typedef union msr_imm_instr_info {
+    unsigned long raw;
+    struct {
+        unsigned int            :3,  /* Bits 0:2 - Undefined */
+        gpr                     :4,  /* Bits 3:6 - Source/Destination register */
+                                :25; /* bits 7:31 - Undefined */
+    };
+} msr_imm_instr_info_t;
+
 #endif /* __ASM_X86_HVM_VMX_VMX_H__ */
--- a/xen/arch/x86/include/asm/guest-msr.h
+++ b/xen/arch/x86/include/asm/guest-msr.h
@@ -8,6 +8,20 @@
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
@@ -280,6 +280,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t
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
@@ -618,6 +624,19 @@ int guest_wrmsr(struct vcpu *v, uint32_t
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
+            wrmsrns(MSR_USER_MSR_CTL, val);
+        break;
+
     case 0x40000000 ... 0x400001ff:
         if ( is_viridian_domain(d) )
         {
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -360,7 +360,7 @@ XEN_CPUFEATURE(AMX_COMPLEX,        15*32
 XEN_CPUFEATURE(AVX_VNNI_INT16,     15*32+10) /*A  AVX-VNNI-INT16 Instructions */
 XEN_CPUFEATURE(UTMR,               15*32+13) /*   User Timer */
 XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
-XEN_CPUFEATURE(USER_MSR,           15*32+15) /*   U{RD,WR}MSR Instructions */
+XEN_CPUFEATURE(USER_MSR,           15*32+15) /*s  U{RD,WR}MSR Instructions */
 XEN_CPUFEATURE(UIRET_UIF,          15*32+17) /*   UIRET updates UIF */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 XEN_CPUFEATURE(SLSM,               15*32+24) /*   Static Lockstep Mode */


