Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D206A458AE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 09:44:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896258.1304942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnD1x-00022O-25; Wed, 26 Feb 2025 08:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896258.1304942; Wed, 26 Feb 2025 08:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnD1w-0001zG-V8; Wed, 26 Feb 2025 08:44:36 +0000
Received: by outflank-mailman (input) for mailman id 896258;
 Wed, 26 Feb 2025 08:44:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnD1v-0001zA-KR
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 08:44:35 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e721da3a-f41d-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 09:44:34 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-390dd35c78dso89257f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 00:44:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd882af4sm4722205f8f.47.2025.02.26.00.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 00:44:33 -0800 (PST)
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
X-Inumbo-ID: e721da3a-f41d-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740559474; x=1741164274; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cPQkb62eNsvaBaCt7oLZ5OR18rLO0pxphtrRxlv2Lds=;
        b=Xp2aEnrVzg+3QjNXNjYykr4A9C2w0IdnnJga0Mmv3Tcf7TZu2ewp2aaiNo/JJ1XEfD
         QWoDdK0AmJ0lal0OIuV+pWgbHDIDsooqIXFv7S7qbVS1Q+uMTNyTqMyCXxVJe7GdULLF
         00gBzcNqet859BF5qRR3NZQ8iwAUJqvazaHTHSXDYq8h4YmzsfHm+qXsJa4rZvPR2M5H
         vFdDTg3E59R+DMdlQxtYzeOXQ0eSbjxZpyqRADcQjr6RQhOiTW56t0xjyPyJGAWVxDGN
         wqyA+RYr03rT8SjhXm+uajUhWbdMaErIfZCYmbUGku1RNvy8bX8oTOFS7QpCxRgYIr1u
         ggiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740559474; x=1741164274;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPQkb62eNsvaBaCt7oLZ5OR18rLO0pxphtrRxlv2Lds=;
        b=tdg76BkUL/XQdOGhZNm4skHUDijzfMzD0bE58vhzjzcTw5PiR/sAt7DIESEr5LDP3z
         OFE0p1sxKlPEVm86WyFu2KmQhOEjleqVBWokVhB8tYiHvkfGJ8KNhDYs0q7zDctBE4Cy
         zbWs58czsFkNaOL8NmQsbsKx5jj9vGz6sBNlBJ6KAxiqdBrdttPL0kushyapV015ftKk
         rzqj/ece+TVLbrgvlBqxRq5HyNu6nClzw4Z7RoEvXVfoctU2cbSUoZyXZmJKw/9pupz9
         rxPy88lybD7+5kJswcPDtUcm6aGPeVxSEaIG0xE+e/nTUW7VlpnXprMEy1dNaaQ7aoTb
         40OA==
X-Forwarded-Encrypted: i=1; AJvYcCXGbVQGVlGzKDx4j7QagMFbNd3VuqFxt9w6X5hOcZ+Ga+JQSnjOceu4IKJaame5Mf7t4b8OA3O/KNU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFSWnHEzELlADtbkYzfUNb/ydkrVbXG0UvMEpoF9VGco0lLUgf
	6B8C0k9+O8VU+s5gk9CVifN0pPY5XcglJzp/ziXf8C+PUy9kqpi5jjjCIQ/CDQ==
X-Gm-Gg: ASbGncvRVi0PneJEBKtEs0sGxFGx8JfEc0rEI5rXzzRgxo+W6XvQJlQudPFJA8r6YXG
	5SBIdN/V2Fi4oD0pm8tyr8ssDo2mO5a0+if+AJxVvQSUIQyLNMqBFCPsvh9TNaaL9vuknFIUFh0
	aDOMa/9dnVGfXgMomw7na2JXIUZSws/4ZefDojyHzJkxoqQzRr1E36fIvPwjt4A91FHtyk+OJpO
	805u5kJuMGTQ7NkVbfl3lKUHVDmjC4dZOjihVmH+dRqZ9/ZM4M74lxLvlr8PpIa4frq78AOyp+/
	jFOdr7G2C9cDD5gXeVQl4simMmiK/XJIDGBgKv4Bc/fYL5KZ2AqPO6RKvlTJboRGuHbMqPGBf7s
	Z+Y89Nlxq4Pk=
X-Google-Smtp-Source: AGHT+IF+J/hiKeAZIBz09PTz4XhpC5OEpbZeSs9K/JFE3q7avruVg/e3/Z+t+aXlyJqcDm6HiPLJGw==
X-Received: by 2002:a5d:6486:0:b0:38f:2c10:da1e with SMTP id ffacd0b85a97d-38f6f51db8amr15543620f8f.27.1740559473652;
        Wed, 26 Feb 2025 00:44:33 -0800 (PST)
Message-ID: <b9bdba63-82a4-4833-b8bd-b3788fd02321@suse.com>
Date: Wed, 26 Feb 2025 09:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/elf: Improve code generation in elf_core_save_regs()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225224559.1226079-1-andrew.cooper3@citrix.com>
 <68a14ea8-b6f0-448e-8713-e9696c024c43@suse.com>
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
In-Reply-To: <68a14ea8-b6f0-448e-8713-e9696c024c43@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2025 08:44, Jan Beulich wrote:
> On 25.02.2025 23:45, Andrew Cooper wrote:
>> A CALL with 0 displacement is handled specially, and is why this logic
>> functions even with CET Shadow Stacks active.  Nevertheless a rip-relative LEA
>> is the more normal way of doing this in 64bit code.
>>
>> The retrieval of flags modifies the stack pointer so needs to state a
>> dependency on the stack pointer.  Despite it's name, ASM_CALL_CONSTRAINT is
>> the way to do this.
>>
>> read_sreg() forces the answer through a register, causing code generation of
>> the form:
>>
>>     mov    %gs, %eax
>>     mov    %eax, %eax
>>     mov    %rax, 0x140(%rsi)
>>
>> Encode the reads directly with a memory operand.  This results in a 16bit
>> store instead of an 64bit store, but the backing memory is zeroed.
> 
> Raises the question whether we shouldn't change read_sreg(). At least the
> emulator uses of it would also benefit from storing straight to memory. And
> the remaining uses ought to be optimizable by the compiler, except that I
> don't expect we'd be able to express the zero-extending nature when the
> destination is a register. Or wait, maybe I can make up something (whether
> that's going to be liked is a separate question).

Here you go.

Jan

x86: make read_sreg() "bi-modal"

Permit use sites to control whether to store directly to memory; right
now both elf_core_save_regs() and the insn emulator's put_fpu()
needlessly go through an intermediate GPR. Note that in both cases the
apparent loss of zero-extension isn't a problem: The fields written to
start out zero-initialized anyway.

No change in generated code for the use sites not being touched.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Whether to make the change to put_fpu() is up for discussion: In my
build it increases code size slightly, despite the reduction of number
of insns emitted. An alternative (leaving the decision to the compiler)
might be to drop the if() and use "=g" as constraint.

I was considering to omit the assignment to sel_ on the if() branch,
expecting the compiler to then flag uses of the return value (as
consuming uninitialized data) when a 2nd argument is passed. However,
gcc14 then already flags the "sel_;" at the end of the macro as
consuming uninitialized data.

--- a/xen/arch/x86/include/asm/regs.h
+++ b/xen/arch/x86/include/asm/regs.h
@@ -16,10 +16,20 @@
     !diff || ((r)->cs != __HYPERVISOR_CS);                                    \
 })
 
-#define read_sreg(name) ({                           \
-    unsigned int __sel;                              \
-    asm ( "mov %%" STR(name) ",%0" : "=r" (__sel) ); \
-    __sel;                                           \
+#define read_sreg(name, dst...) ({                       \
+    unsigned int sel_;                                   \
+    BUILD_BUG_ON(count_args(dst) > 1);                   \
+    if ( count_args(dst) )                               \
+    {                                                    \
+        typeof(LASTARG(&sel_, ## dst)) dst_ =            \
+            LASTARG(&sel_, ## dst);                      \
+        asm ( "mov %%" STR(name) ",%0" : "=m" (*dst_) ); \
+        /* The compiler ought to optimize this out. */   \
+        sel_ = *dst_;                                    \
+    }                                                    \
+    else                                                 \
+        asm ( "mov %%" STR(name) ",%0" : "=r" (sel_) );  \
+    sel_;                                                \
 })
 
 static inline void read_sregs(struct cpu_user_regs *regs)
--- a/xen/arch/x86/include/asm/x86_64/elf.h
+++ b/xen/arch/x86/include/asm/x86_64/elf.h
@@ -55,16 +55,16 @@ static inline void elf_core_save_regs(EL
 
     /* orig_rax not filled in for now */
     asm ( "call 0f; 0: popq %0" : "=m" (core_regs->rip) );
-    core_regs->cs = read_sreg(cs);
+    read_sreg(cs, &core_regs->cs);
     asm ( "pushfq; popq %0" : "=m" (core_regs->rflags) );
     asm ( "movq %%rsp, %0" : "=m" (core_regs->rsp) );
-    core_regs->ss = read_sreg(ss);
+    read_sreg(ss, &core_regs->ss);
     rdmsrl(MSR_FS_BASE, core_regs->thread_fs);
     rdmsrl(MSR_GS_BASE, core_regs->thread_gs);
-    core_regs->ds = read_sreg(ds);
-    core_regs->es = read_sreg(es);
-    core_regs->fs = read_sreg(fs);
-    core_regs->gs = read_sreg(gs);
+    read_sreg(ds, &core_regs->ds);
+    read_sreg(es, &core_regs->es);
+    read_sreg(fs, &core_regs->fs);
+    read_sreg(gs, &core_regs->gs);
 
     asm ( "mov %%cr0, %0" : "=r" (xen_core_regs->cr0) );
     asm ( "mov %%cr2, %0" : "=r" (xen_core_regs->cr2) );
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -465,10 +465,10 @@ static void put_fpu(
             else if ( is_pv_vcpu(current) )
                 switch ( state->ea.mem.seg )
                 {
-                case x86_seg_ds: aux.ds = read_sreg(ds);  break;
-                case x86_seg_es: aux.ds = read_sreg(es);  break;
-                case x86_seg_fs: aux.ds = read_sreg(fs);  break;
-                case x86_seg_gs: aux.ds = read_sreg(gs);  break;
+                case x86_seg_ds: read_sreg(ds, &aux.ds);  break;
+                case x86_seg_es: read_sreg(es, &aux.ds);  break;
+                case x86_seg_fs: read_sreg(fs, &aux.ds);  break;
+                case x86_seg_gs: read_sreg(gs, &aux.ds);  break;
                 case x86_seg_ss: aux.ds = ctxt->regs->ss; break;
                 default:         ASSERT_UNREACHABLE();    break;
                 }



