Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A857186B0CE
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 14:52:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686639.1068887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKLz-00013M-UD; Wed, 28 Feb 2024 13:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686639.1068887; Wed, 28 Feb 2024 13:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKLz-00011m-RS; Wed, 28 Feb 2024 13:52:11 +0000
Received: by outflank-mailman (input) for mailman id 686639;
 Wed, 28 Feb 2024 13:52:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfKLy-0000eZ-Ax
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 13:52:10 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90714bbd-d640-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 14:52:08 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so878413366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 05:52:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s24-20020a170906bc5800b00a3efa4e033asm1870713ejv.151.2024.02.28.05.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 05:52:07 -0800 (PST)
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
X-Inumbo-ID: 90714bbd-d640-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709128328; x=1709733128; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gaX7a4NCHOeGdWCkg8kUSL8PRj5hzXXfo73pbxAntJ8=;
        b=bwZLe610hPexq3V1s2hT6jb5Wkg6RJ3QLjqeyoR1QAVC3Wqd5Wm/IFnMS5QDEAFuNl
         yG9t1lqEYfusKKMRT+RV8e3I0AVK0vUVjtFUCJUOBUdFVb9kJNqrpbD+vJMF8iBCS+z4
         NKKwV15nWYLVfnbIsmE3EhHoJthM9ReuJA4hhlrttgu0tEwX2xzjnlKRSfeiDXuRxkAu
         mO2vgO81Mj0o9M1TZOCs7HLcKyYLwLQie59Q323tJbmQEvC8kTmxjVj2iD7I7TJut/Ub
         Jl3+47gHgBzqUtOSobDuiQQcdUrhWjHgvR+GMWMUYqNTMY9F54sFZjS1fem5QN5T3S1Z
         te3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709128328; x=1709733128;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaX7a4NCHOeGdWCkg8kUSL8PRj5hzXXfo73pbxAntJ8=;
        b=JJIAvTxvRsMagmKhooOXwBP/QKIuprxgrijJO9tcWX0PbKdJ9PhnR57gTXg7nnSNmJ
         0mDy5LQ9z7EjYmvxfP+7QI+LEbMx1k64LEd4OJjS7jffnVrnfvLoNAsKTo+fcU47pbsA
         sd3EvJUWbuS42AZ3NnVdgwvBuVwZD6bIxiydjB9vgarnQzkiXKNtbY1vBbucarAFvfsy
         uhobAyy0kB2qg5P8YO6s4B6NoOeNYlPqY96WJOK7Bhhdkv8dm4feu9tqz+EZIZJep6x3
         ZMpyo2aPPcXUAF1Ogm9KjrYAvawk/Ia9ojY8+1GJuH76PWnlnYGaBR/HJLka5qQ+0RVb
         bKgg==
X-Gm-Message-State: AOJu0YwtlNmfkPuILH0lbhRLtKDcwMWT2BBr1lYY5cfhZ2fRsbQYF1tf
	rpkFnxUMtqScaWl6qKDD6BXgO6ipPmgjYESCP+sknPqYxPryp3NlWFbhaNLdYxrjb3XX1FITZuM
	=
X-Google-Smtp-Source: AGHT+IF962mt3eRDy21WIUNAu+Y3BfGUsdDO1T8wRDs+WGYmPyqGL5DdVNU2BOS3piXY0SkY/N1xRw==
X-Received: by 2002:a17:906:70c:b0:a40:189d:c5bb with SMTP id y12-20020a170906070c00b00a40189dc5bbmr8228552ejb.0.1709128328039;
        Wed, 28 Feb 2024 05:52:08 -0800 (PST)
Message-ID: <0ad4543b-8eed-4147-b32d-b68d21fade98@suse.com>
Date: Wed, 28 Feb 2024 14:52:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/4] x86: record SSP at non-guest entry points
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <33da6f8b-af22-48c8-acce-3aa55c0e0414@suse.com>
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
In-Reply-To: <33da6f8b-af22-48c8-acce-3aa55c0e0414@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

We will want to use that value for call trace generation, and likely
also to eliminate the somewhat fragile shadow stack searching done in
fixup_exception_return(). For those purposes, guest-only entry points do
not need to record that value.

To keep the saving code simple, record our own SSP that corresponds to
an exception frame, pointing to the top of the shadow stack counterpart
of what the CPU has saved on the regular stack. Consuming code can then
work its way from there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
To record the full 64-bit value, some of the unused bits in the %cs slot
could be used. Sadly that slot has saved_upcall_mask in an unhelpful
location, otherwise simply storing low and high 32 bits in those two
separate half-slots would be a pretty obvious choice. As long as
"entry_ssp" is used in non-guest-entry frames only, we could of course
put half of it into a union with saved_upcall_mask ...

Else may want to put a BUILD_BUG_ON(VADDR_BITS > 48) somewhere, but I'm
afraid I can't really identify a good place for such to live.

Leveraging that the CPU stores zero in the upper bits of the selector
register slots, the save sequence could also be

        shl   $16, %rcx
        or    %rcx, UREGS_entry_ssp-2(%rsp)

That's shorter and avoids a 16-bit operation, but may be less desirable,
for being a read-modify-write access.

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1354,6 +1354,7 @@ void arch_get_info_guest(struct vcpu *v,
     if ( !compat )
     {
         memcpy(&c.nat->user_regs, &v->arch.user_regs, sizeof(c.nat->user_regs));
+        c.nat->user_regs.entry_ssp = 0;
         if ( is_pv_domain(d) )
             memcpy(c.nat->trap_ctxt, v->arch.pv.trap_ctxt,
                    sizeof(c.nat->trap_ctxt));
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -94,7 +94,7 @@ __UNLIKELY_END(nsvm_hap)
         sti
         vmrun
 
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         GET_CURRENT(bx)
 
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -25,7 +25,7 @@
 #define VMLAUNCH     .byte 0x0f,0x01,0xc2
 
 ENTRY(vmx_asm_vmexit_handler)
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         mov  %cr2,%rax
         GET_CURRENT(bx)
@@ -119,7 +119,7 @@ UNLIKELY_END(realmode)
 
 .Lvmx_vmentry_fail:
         sti
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         /*
          * SPEC_CTRL_ENTRY notes
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -221,7 +221,7 @@ static always_inline void stac(void)
 #endif
 
 #ifdef __ASSEMBLY__
-.macro SAVE_ALL compat=0
+.macro SAVE_ALL compat=0 ssp=IS_ENABLED(CONFIG_XEN_SHSTK)
         addq  $-(UREGS_error_code-UREGS_r15), %rsp
         cld
         movq  %rdi,UREGS_rdi(%rsp)
@@ -235,6 +235,9 @@ static always_inline void stac(void)
         movq  %rax,UREGS_rax(%rsp)
         xor   %eax, %eax
 .if !\compat
+.if \ssp
+        rdsspq %rcx
+.endif
         movq  %r8,UREGS_r8(%rsp)
         movq  %r9,UREGS_r9(%rsp)
         movq  %r10,UREGS_r10(%rsp)
@@ -264,6 +267,11 @@ static always_inline void stac(void)
         xor   %r13d, %r13d
         xor   %r14d, %r14d
         xor   %r15d, %r15d
+.if \ssp && !\compat
+        mov   %cx, UREGS_entry_ssp(%rsp)
+        shr   $16, %rcx
+        mov   %ecx, UREGS_entry_ssp+2(%rsp)
+.endif
 .endm
 
 #define LOAD_ONE_REG(reg, compat) \
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -48,6 +48,7 @@ void __dummy__(void)
     OFFSET(UREGS_eflags, struct cpu_user_regs, rflags);
     OFFSET(UREGS_rsp, struct cpu_user_regs, rsp);
     OFFSET(UREGS_ss, struct cpu_user_regs, ss);
+    OFFSET(UREGS_entry_ssp, struct cpu_user_regs, entry_ssp);
     OFFSET(UREGS_kernel_sizeof, struct cpu_user_regs, es);
     BLANK();
 
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -257,7 +257,7 @@ FUNC(lstar_enter)
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
@@ -296,7 +296,7 @@ FUNC(cstar_enter)
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
@@ -339,7 +339,7 @@ LABEL(sysenter_eflags_saved, 0)
         pushq $0
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         movb  $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
@@ -394,7 +394,7 @@ FUNC(entry_int80)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
         movb  $0x80, EFRAME_entry_vector(%rsp)
-        SAVE_ALL
+        SAVE_ALL ssp=0
 
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
--- a/xen/include/public/arch-x86/xen-x86_64.h
+++ b/xen/include/public/arch-x86/xen-x86_64.h
@@ -183,7 +183,19 @@ struct cpu_user_regs {
     uint8_t  _pad1[3];
     __DECL_REG_LO16(flags); /* rflags.IF == !saved_upcall_mask */
     __DECL_REG_LO8(sp);
-    uint16_t ss, _pad2[3];
+    uint16_t ss;
+#if !defined(__XEN__)
+    uint16_t _pad2[3];
+#elif defined(COMPILE_OFFSETS)
+    uint16_t entry_ssp[3];
+#else
+    /*
+     * This points _at_ the corresponding shadow stack frame; it is _not_ the
+     * outer context's SSP.  That, if the outer context has CET-SS enabled,
+     * is stored in the top slot of the pointed to shadow stack frame.
+     */
+    signed long entry_ssp:48;
+#endif
     uint16_t es, _pad3[3];
     uint16_t ds, _pad4[3];
     uint16_t fs, _pad5[3];


