Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F4A98A144
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:58:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807312.1218686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svF2v-0008Mr-W3; Mon, 30 Sep 2024 11:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807312.1218686; Mon, 30 Sep 2024 11:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svF2v-0008Kp-SK; Mon, 30 Sep 2024 11:58:33 +0000
Received: by outflank-mailman (input) for mailman id 807312;
 Mon, 30 Sep 2024 11:58:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svF2u-0008J1-Oc
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:58:32 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 501e7f40-7f23-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 13:58:31 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso793142166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 04:58:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c299af9esm519986366b.216.2024.09.30.04.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 04:58:30 -0700 (PDT)
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
X-Inumbo-ID: 501e7f40-7f23-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727697511; x=1728302311; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dktc4kuIueOUcCc4ig9K+pf1aA2fhfDgPtIRsL/YWI4=;
        b=VDap9SfkSESTZpOulDFsnhJX+/A1VrBAW/LYPk5vClVNKiKeWr6LdgQFufigFJWIvD
         QBtXF5p+Q6/kdrIPRZiqiB8sIG6C7f7yXgZnAmGyIoOo8yIOM5kWV0P+rVALpb9uILhR
         XliKCafww5it2/0mPMDJ9oZw3co1XxNwRPxeEp5x7ObFz+zoKhy6c2+fnV3alFIjCfXm
         12LnwnYiggSlXRi4uVOJM5LrFCBEwM44tsfuc1pUSHN6vxJnZ9Zr25oVRjoAm2ZIoSpB
         URwn3vx+L4RHc9udvRTY+QadFbME4ZWaGkLQUNT1iqijaglSuyy7FKfl59RLMNWnSqjA
         WRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697511; x=1728302311;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dktc4kuIueOUcCc4ig9K+pf1aA2fhfDgPtIRsL/YWI4=;
        b=b4nknsJBBODwG9MPYrethxaMRAO3icjA4xgoAAKU22YuxySyFXnhqux3/geLwFf0Xq
         HsclV2iP0jMZ8X5hxjMPRmADvRmbzHBHiQ/7zzNMOvcDgqDbKl7UBI1zae1axjOD9qS2
         8V7UjcShVCovj6SOkCC1S4I6jImNP1UkZ1VJj4wl/H6rzmZkuKL9/imZiBMh3r/V/gfM
         Xw84H4XKgGAdonSxr4ntZVj3qP5PoN/EYqyqCzC5kgYu/5GxTdzrhYUrfQ4V3VthT+tJ
         9uz7iDjshBMlV7otbvea2o/r2pSSnic+rHUDJM158/6iiNbI6cyT+pNZ2tM9SZuX7e5B
         ZE8w==
X-Gm-Message-State: AOJu0YwP6Q35aD3ogywJUHrkBHt9LkVgXrHe4izYGXrI17yJ440AGYRH
	4xzWscb1uRejokDe3yqJdVCJacNzmZ0taidKrLf0xYe0QDRThD/pny6jattz0RRhkQvTkjROc/4
	=
X-Google-Smtp-Source: AGHT+IFgv0LYCY7sAqZeOwYvJkSFMj7c0xeDlYsvMdS7YTyjn4kirgdc6FOcGVV+oJkr/ZtnkOlRPQ==
X-Received: by 2002:a17:907:d1a:b0:a8d:592d:f56 with SMTP id a640c23a62f3a-a93b167a9ffmr1588593466b.31.1727697510979;
        Mon, 30 Sep 2024 04:58:30 -0700 (PDT)
Message-ID: <3b8403dd-3b0c-4e00-8e20-be39178f0af6@suse.com>
Date: Mon, 30 Sep 2024 13:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v6 2/5] x86emul+VMX: support {RD,WR}MSRLIST
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <88b00dbf-b095-4ce2-9365-2a195ca0d65c@suse.com>
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
In-Reply-To: <88b00dbf-b095-4ce2-9365-2a195ca0d65c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

These are "compound" instructions to issue a series of RDMSR / WRMSR
respectively. In the emulator we can therefore implement them by using
the existing msr_{read,write}() hooks. The memory accesses utilize that
the HVM ->read() / ->write() hooks are already linear-address
(x86_seg_none) aware (by way of hvmemul_virtual_to_linear() handling
this case).

Preemption is being checked for in WRMSRLIST handling only, as only MSR
writes are expected to possibly take long.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: In vmx_vmexit_handler() handling is forwarded to the emulator
     blindly. Alternatively we could consult the exit qualification and
     process just a single MSR at a time (without involving the
     emulator), exiting back to the guest after every iteration. (I
     don't think a mix of both models makes a lot of sense.)

The precise behavior of MSR_BARRIER is still not spelled out in ISE 050,
so the (minimal) implementation continues to be a guess for now.

Wouldn't calculate_hvm_max_policy() for MPX better behave the same way
as done here, at least from an abstract perspective (assuming that AMD
won't add such functionality now that Intel have deprecated it)?
---
v6: Use MSR constants in test harness. Re-base.
v5: Add missing vmx_init_vmcs_config() and construct_vmcs() adjustments.
    Avoid unnecessary uses of r(). Re-base.
v3: Add dependency on LM. Limit exposure to HVM. Utilize new info from
    ISE 050. Re-base.
v2: Use X86_EXC_*. Add preemption checking to WRMSRLIST handling. Remove
    the feature from "max" when the VMX counterpart isn't available.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -342,6 +342,8 @@ static const struct {
     { { 0x01, 0xc4 }, { 2, 2 }, F, N }, /* vmxoff */
     { { 0x01, 0xc5 }, { 2, 2 }, F, N }, /* pconfig */
     { { 0x01, 0xc6 }, { 2, 2 }, F, N }, /* wrmsrns */
+    { { 0x01, 0xc6 }, { 0, 2 }, F, W, pfx_f2 }, /* rdmsrlist */
+    { { 0x01, 0xc6 }, { 0, 2 }, F, R, pfx_f3 }, /* wrmsrlist */
     { { 0x01, 0xc8 }, { 2, 2 }, F, N }, /* monitor */
     { { 0x01, 0xc9 }, { 2, 2 }, F, N }, /* mwait */
     { { 0x01, 0xca }, { 2, 2 }, F, N }, /* clac */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -625,7 +625,7 @@ static int write(
     if ( verbose )
         printf("** %s(%u, %p,, %u,)\n", __func__, seg, (void *)offset, bytes);
 
-    if ( !is_x86_user_segment(seg) )
+    if ( !is_x86_user_segment(seg) && seg != x86_seg_none )
         return X86EMUL_UNHANDLEABLE;
     memcpy((void *)offset, p_data, bytes);
     return X86EMUL_OKAY;
@@ -717,6 +717,10 @@ static int read_msr(
 {
     switch ( reg )
     {
+    case MSR_BARRIER:
+        *val = 0;
+        return X86EMUL_OKAY;
+
     case MSR_EFER:
         *val = ctxt->addr_size > 32 ? EFER_LME | EFER_LMA : 0;
         return X86EMUL_OKAY;
@@ -1434,9 +1438,53 @@ int main(int argc, char **argv)
          (gs_base != 0x0000111122224444UL) ||
          gs_base_shadow )
         goto fail;
+    printf("okay\n");
 
     cpu_policy.extd.nscb = i;
     emulops.write_segment = NULL;
+
+    printf("%-40s", "Testing rdmsrlist...");
+    instr[0] = 0xf2; instr[1] = 0x0f; instr[2] = 0x01; instr[3] = 0xc6;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rsi = (unsigned long)(res + 0x80);
+    regs.rdi = (unsigned long)(res + 0x80 + 0x40 * 2);
+    regs.rcx = 0x0002000100008000UL;
+    gs_base_shadow = 0x0000222244446666UL;
+    memset(res + 0x80, ~0, 0x40 * 8 * 2);
+    res[0x80 + 0x0f * 2] = MSR_GS_BASE;
+    res[0x80 + 0x0f * 2 + 1] = 0;
+    res[0x80 + 0x20 * 2] = MSR_SHADOW_GS_BASE;
+    res[0x80 + 0x20 * 2 + 1] = 0;
+    res[0x80 + 0x31 * 2] = MSR_BARRIER;
+    res[0x80 + 0x31 * 2 + 1] = 0;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[4]) ||
+         regs.rcx ||
+         (res[0x80 + (0x40 + 0x0f) * 2] != (unsigned int)gs_base) ||
+         (res[0x80 + (0x40 + 0x0f) * 2 + 1] != (gs_base >> (8 * sizeof(int)))) ||
+         (res[0x80 + (0x40 + 0x20) * 2] != (unsigned int)gs_base_shadow) ||
+         (res[0x80 + (0x40 + 0x20) * 2 + 1] != (gs_base_shadow >> (8 * sizeof(int)))) ||
+         res[0x80 + (0x40 + 0x31) * 2] || res[0x80 + (0x40 + 0x31) * 2 + 1] )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing wrmsrlist...");
+    instr[0] = 0xf3; instr[1] = 0x0f; instr[2] = 0x01; instr[3] = 0xc6;
+    regs.eip = (unsigned long)&instr[0];
+    regs.rsi -= 0x11 * 8;
+    regs.rdi -= 0x11 * 8;
+    regs.rcx = 0x0002000100000000UL;
+    res[0x80 + 0x0f * 2] = MSR_SHADOW_GS_BASE;
+    res[0x80 + 0x20 * 2] = MSR_GS_BASE;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[4]) ||
+         regs.rcx ||
+         (gs_base != 0x0000222244446666UL) ||
+         (gs_base_shadow != 0x0000111122224444UL) )
+        goto fail;
+
     emulops.write_msr     = NULL;
 #endif
     printf("okay\n");
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -87,6 +87,7 @@ bool emul_test_init(void)
     cpu_policy.feat.rdpid = true;
     cpu_policy.feat.lkgs = true;
     cpu_policy.feat.wrmsrns = true;
+    cpu_policy.feat.msrlist = true;
     cpu_policy.extd.clzero = true;
 
     if ( cpu_has_xsave )
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -745,6 +745,9 @@ static void __init calculate_hvm_max_pol
             __clear_bit(X86_FEATURE_XSAVES, fs);
     }
 
+    if ( !cpu_has_vmx_msrlist )
+        __clear_bit(X86_FEATURE_MSRLIST, fs);
+
     /*
      * Xen doesn't use PKS, so the guest support for it has opted to not use
      * the VMCS load/save controls for efficiency reasons.  This depends on
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -366,7 +366,8 @@ static int vmx_init_vmcs_config(bool bsp
 
     if ( _vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS )
     {
-        uint64_t opt = TERTIARY_EXEC_VIRT_SPEC_CTRL;
+        uint64_t opt = TERTIARY_EXEC_ENABLE_MSRLIST |
+                       TERTIARY_EXEC_VIRT_SPEC_CTRL;
 
         _vmx_tertiary_exec_control = adjust_vmx_controls2(
             "Tertiary Exec Control", 0, opt,
@@ -1119,7 +1120,8 @@ static int construct_vmcs(struct vcpu *v
         v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
 
     v->arch.hvm.vmx.secondary_exec_control = vmx_secondary_exec_control;
-    v->arch.hvm.vmx.tertiary_exec_control  = vmx_tertiary_exec_control;
+    v->arch.hvm.vmx.tertiary_exec_control  = vmx_tertiary_exec_control &
+                                             ~TERTIARY_EXEC_ENABLE_MSRLIST;
 
     /*
      * Disable features which we don't want active by default:
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -871,6 +871,20 @@ static void cf_check vmx_cpuid_policy_ch
     else
         vmx_set_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
 
+    if ( cp->feat.msrlist )
+    {
+        vmx_clear_msr_intercept(v, MSR_BARRIER, VMX_MSR_RW);
+        v->arch.hvm.vmx.tertiary_exec_control |= TERTIARY_EXEC_ENABLE_MSRLIST;
+        vmx_update_tertiary_exec_control(v);
+    }
+    else if ( v->arch.hvm.vmx.tertiary_exec_control &
+              TERTIARY_EXEC_ENABLE_MSRLIST )
+    {
+        vmx_set_msr_intercept(v, MSR_BARRIER, VMX_MSR_RW);
+        v->arch.hvm.vmx.tertiary_exec_control &= ~TERTIARY_EXEC_ENABLE_MSRLIST;
+        vmx_update_tertiary_exec_control(v);
+    }
+
  out:
     vmx_vmcs_exit(v);
 
@@ -3732,6 +3746,22 @@ gp_fault:
     return X86EMUL_EXCEPTION;
 }
 
+static bool cf_check is_msrlist(
+    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
+{
+
+    if ( ctxt->opcode == X86EMUL_OPC(0x0f, 0x01) )
+    {
+        unsigned int rm, reg;
+        int mode = x86_insn_modrm(state, &rm, &reg);
+
+        /* This also includes WRMSRNS; should be okay. */
+        return mode == 3 && rm == 6 && !reg;
+    }
+
+    return false;
+}
+
 static void vmx_do_extint(struct cpu_user_regs *regs)
 {
     unsigned long vector;
@@ -4539,6 +4569,17 @@ void asmlinkage vmx_vmexit_handler(struc
         }
         break;
 
+    case EXIT_REASON_RDMSRLIST:
+    case EXIT_REASON_WRMSRLIST:
+        if ( vmx_guest_x86_mode(v) != 8 || !currd->arch.cpuid->feat.msrlist )
+        {
+            ASSERT_UNREACHABLE();
+            hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
+        }
+        else if ( !hvm_emulate_one_insn(is_msrlist, "MSR list") )
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
+        break;
+
     case EXIT_REASON_VMXOFF:
     case EXIT_REASON_VMXON:
     case EXIT_REASON_VMCLEAR:
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -267,6 +267,7 @@ extern u32 vmx_secondary_exec_control;
 #define TERTIARY_EXEC_EPT_PAGING_WRITE          BIT(2, UL)
 #define TERTIARY_EXEC_GUEST_PAGING_VERIFY       BIT(3, UL)
 #define TERTIARY_EXEC_IPI_VIRT                  BIT(4, UL)
+#define TERTIARY_EXEC_ENABLE_MSRLIST            BIT(6, UL)
 #define TERTIARY_EXEC_VIRT_SPEC_CTRL            BIT(7, UL)
 extern uint64_t vmx_tertiary_exec_control;
 
@@ -391,6 +392,9 @@ extern u64 vmx_ept_vpid_cap;
 #define cpu_has_vmx_notify_vm_exiting \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
+#define cpu_has_vmx_msrlist \
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     (vmx_tertiary_exec_control & TERTIARY_EXEC_ENABLE_MSRLIST))
 
 #define VMCS_RID_TYPE_MASK              0x80000000U
 
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -201,6 +201,8 @@ static inline void pi_clear_sn(struct pi
 #define EXIT_REASON_XRSTORS             64
 #define EXIT_REASON_BUS_LOCK            74
 #define EXIT_REASON_NOTIFY              75
+#define EXIT_REASON_RDMSRLIST           78
+#define EXIT_REASON_WRMSRLIST           79
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -24,6 +24,8 @@
 #define  APIC_BASE_ENABLE                   (_AC(1, ULL) << 11)
 #define  APIC_BASE_ADDR_MASK                _AC(0x000ffffffffff000, ULL)
 
+#define MSR_BARRIER                         0x0000002f
+
 #define MSR_TEST_CTRL                       0x00000033
 #define  TEST_CTRL_SPLITLOCK_DETECT         (_AC(1, ULL) << 29)
 #define  TEST_CTRL_SPLITLOCK_DISABLE        (_AC(1, ULL) << 31)
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 76
+#define VMX_PERF_EXIT_REASON_SIZE 80
 #define VMEXIT_NPF_PERFC 143
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -74,6 +74,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t
     case MSR_AMD_PPIN:
         goto gp_fault;
 
+    case MSR_BARRIER:
+        if ( !cp->feat.msrlist )
+            goto gp_fault;
+        *val = 0;
+        break;
+
     case MSR_IA32_FEATURE_CONTROL:
         /*
          * Architecturally, availability of this MSR is enumerated by the
@@ -347,6 +353,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t
         uint64_t rsvd;
 
         /* Read-only */
+    case MSR_BARRIER:
     case MSR_IA32_PLATFORM_ID:
     case MSR_CORE_CAPABILITIES:
     case MSR_INTEL_CORE_THREAD_COUNT:
--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -11,6 +11,7 @@
 #include "private.h"
 
 #ifdef __XEN__
+#include <xen/event.h>
 #include <asm/prot-key.h>
 #endif
 
@@ -28,6 +29,7 @@ int x86emul_0f01(struct x86_emulate_stat
     switch ( s->modrm )
     {
         unsigned long base, limit, cr0, cr0w, cr4;
+        unsigned int n;
         struct segment_register sreg;
         uint64_t msr_val;
 
@@ -42,6 +44,64 @@ int x86emul_0f01(struct x86_emulate_stat
                                 ((uint64_t)regs->r(dx) << 32) | regs->eax,
                                 ctxt);
             goto done;
+
+        case vex_f3: /* wrmsrlist */
+            vcpu_must_have(msrlist);
+            generate_exception_if(!mode_64bit(), X86_EXC_UD);
+            generate_exception_if(!mode_ring0() || (regs->esi & 7) ||
+                                  (regs->edi & 7),
+                                  X86_EXC_GP, 0);
+            fail_if(!ops->write_msr);
+            while ( regs->r(cx) )
+            {
+                n = __builtin_ffsl(regs->r(cx)) - 1;
+                if ( (rc = ops->read(x86_seg_none, regs->r(si) + n * 8,
+                                     &msr_val, 8, ctxt)) != X86EMUL_OKAY )
+                    break;
+                generate_exception_if(msr_val != (uint32_t)msr_val,
+                                      X86_EXC_GP, 0);
+                base = msr_val;
+                if ( (rc = ops->read(x86_seg_none, regs->r(di) + n * 8,
+                                     &msr_val, 8, ctxt)) != X86EMUL_OKAY ||
+                     (rc = ops->write_msr(base, msr_val, ctxt)) != X86EMUL_OKAY )
+                    break;
+                regs->r(cx) &= ~(1UL << n);
+
+#ifdef __XEN__
+                if ( regs->r(cx) && local_events_need_delivery() )
+                {
+                    rc = X86EMUL_RETRY;
+                    break;
+                }
+#endif
+            }
+            goto done;
+
+        case vex_f2: /* rdmsrlist */
+            vcpu_must_have(msrlist);
+            generate_exception_if(!mode_64bit(), X86_EXC_UD);
+            generate_exception_if(!mode_ring0() || (regs->esi & 7) ||
+                                  (regs->edi & 7),
+                                  X86_EXC_GP, 0);
+            fail_if(!ops->read_msr || !ops->write);
+            while ( regs->r(cx) )
+            {
+                n = __builtin_ffsl(regs->r(cx)) - 1;
+                if ( (rc = ops->read(x86_seg_none, regs->r(si) + n * 8,
+                                     &msr_val, 8, ctxt)) != X86EMUL_OKAY )
+                    break;
+                generate_exception_if(msr_val != (uint32_t)msr_val,
+                                      X86_EXC_GP, 0);
+                if ( (rc = ops->read_msr(msr_val, &msr_val,
+                                         ctxt)) != X86EMUL_OKAY ||
+                     (rc = ops->write(x86_seg_none, regs->r(di) + n * 8,
+                                      &msr_val, 8, ctxt)) != X86EMUL_OKAY )
+                    break;
+                regs->r(cx) &= ~(1UL << n);
+            }
+            if ( rc != X86EMUL_OKAY )
+                ctxt->regs->r(cx) = regs->r(cx);
+            goto done;
         }
         generate_exception(X86_EXC_UD);
 
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -597,6 +597,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
+#define vcpu_has_msrlist()     (ctxt->cpuid->feat.msrlist)
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
 #define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
 #define vcpu_has_avx_vnni_int16() (ctxt->cpuid->feat.avx_vnni_int16)
--- a/xen/arch/x86/x86_emulate/util.c
+++ b/xen/arch/x86/x86_emulate/util.c
@@ -100,6 +100,9 @@ bool cf_check x86_insn_is_mem_access(con
         break;
 
     case X86EMUL_OPC(0x0f, 0x01):
+        /* {RD,WR}MSRLIST */
+        if ( mode_64bit() && s->modrm == 0xc6 )
+            return s->vex.pfx >= vex_f3;
         /* Cover CLZERO. */
         return (s->modrm_rm & 7) == 4 && (s->modrm_reg & 7) == 7;
     }
@@ -160,7 +163,11 @@ bool cf_check x86_insn_is_mem_write(cons
         case 0xff: /* Grp5 */
             break;
 
-        case X86EMUL_OPC(0x0f, 0x01): /* CLZERO is the odd one. */
+        case X86EMUL_OPC(0x0f, 0x01):
+            /* RDMSRLIST */
+            if ( mode_64bit() && s->modrm == 0xc6 )
+                return s->vex.pfx == vex_f2;
+            /* CLZERO is another odd one. */
             return (s->modrm_rm & 7) == 4 && (s->modrm_reg & 7) == 7;
 
         default:
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -313,6 +313,7 @@ XEN_CPUFEATURE(WRMSRNS,      10*32+19) /
 XEN_CPUFEATURE(NMI_SRC,      10*32+20) /*   NMI-source reporting */
 XEN_CPUFEATURE(AMX_FP16,     10*32+21) /*   AMX FP16 instruction */
 XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
+XEN_CPUFEATURE(MSRLIST,      10*32+27) /*s  MSR list instructions */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(NO_NEST_BP,         11*32+ 0) /*A  No Nested Data Breakpoints */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -275,7 +275,7 @@ def crunch_numbers(state):
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
         LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD,
-             LKGS],
+             LKGS, MSRLIST],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.


