Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0D08678CA
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 15:39:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685585.1066540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rec8g-0005CU-B4; Mon, 26 Feb 2024 14:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685585.1066540; Mon, 26 Feb 2024 14:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rec8g-0005AW-8U; Mon, 26 Feb 2024 14:39:30 +0000
Received: by outflank-mailman (input) for mailman id 685585;
 Mon, 26 Feb 2024 14:39:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vKMM=KD=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1rec8f-0005AQ-Bg
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 14:39:29 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d707ea55-d4b4-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 15:39:27 +0100 (CET)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6e46dcd8feaso829831b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 06:39:27 -0800 (PST)
Received: from localhost ([47.254.32.37]) by smtp.gmail.com with ESMTPSA id
 l3-20020a62be03000000b006e04553a4c5sm4068362pff.52.2024.02.26.06.39.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Feb 2024 06:39:25 -0800 (PST)
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
X-Inumbo-ID: d707ea55-d4b4-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708958365; x=1709563165; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3obabIc0frWAPcp78SCT093DaVOW3OCMmYlsqxV6Jrg=;
        b=fTKn5SUFKdupT+67UvhtsrTfu7gAxDb6UDnjbvB3BL/XJorkFUjeZw4KbRdnLms16g
         u2K6SRVVgz/GzvAdxKeUjyeBzQp88npJ0ALb9O6GsqtAgRX/TFACWmeymrvyerseeZzG
         kMrxPp/NUcfmMRGTj0rb0BvrG4Xsqh4OWYTodVEpt9NOCPTFC9iSSg5KqmYrSgSA1A6H
         UstkUqJzOTgYlMR9duAxgKcapO+yMN4ruLS84D7h9zEGOqG97hqRK36WcVu69lN0uOc6
         s//KkMXTZO79qC8O/LVAFXj+1ssjJaDgoRsgZKCfUGvkw3SnwKBKQV8bKYOr4wM2G/hc
         lfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708958365; x=1709563165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3obabIc0frWAPcp78SCT093DaVOW3OCMmYlsqxV6Jrg=;
        b=OIgkP47wUEZQvUfE0rd0pOBIWGIEbVz9l0oyzKYnu8wSBtncBZMW/YAKZp4dGJ02of
         tv18qU9BGxYhMz/yAxc/TFvohrkw5mRHcjN5VTjrS3IGJnAS38F5iIIRSh2rb0KUSO6k
         P/P8jC53ipJnT/xgPmfxfHIrlWiMr/l7rFVwMXP9SDhV7Uw6gEaGgPUV6bmqH9GaM/FS
         x1CpH5gHqj6aF39NSJ6Ko/7yc73eEHfEpYC6QczNoUHKqX7khOa/qtvqK2TiNjIvG94M
         jDp6LngVpn+YtBhFkiPGYc6/KeaSRNXrKPDV+kmADihq3aZLTEWj/gQmiazbXyfHcN/k
         Jc3g==
X-Forwarded-Encrypted: i=1; AJvYcCXwaHz8QM/TO0nAXI6F/Rg2ug83SSuYdAkn/6A38mFUm5oYSTI/HlFxpC2YXnxTY10yCO5WjwrmjVdQz0c7nzw6tCBMTXbOgc67CaRektk=
X-Gm-Message-State: AOJu0YyUG6ck8K2plNlK7hd2IhliSy4xNyPjNoIAr+uk2ApUkr2khuka
	vXjtUXv+jVRuhQDWE1s0Rs+o1bPHVJT5MJnYiC8Tiz+l77X7y2DN
X-Google-Smtp-Source: AGHT+IHxB1SRDNUAQcM9eSd8jCrvT5j7mxZc3ehl/sTVGmSJcJcMTqd/bRM8vjNK9o0eC3pRQdhkvg==
X-Received: by 2002:a05:6a00:1817:b0:6e4:5a0f:b87a with SMTP id y23-20020a056a00181700b006e45a0fb87amr8639641pfa.12.1708958365514;
        Mon, 26 Feb 2024 06:39:25 -0800 (PST)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Lai Jiangshan <jiangshan.ljs@antgroup.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	x86@kernel.org,
	Kees Cook <keescook@chromium.org>,
	Juergen Gross <jgross@suse.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <akaher@vmware.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH 66/73] x86/pvm: Use new cpu feature to describe XENPV and PVM
Date: Mon, 26 Feb 2024 22:36:23 +0800
Message-Id: <20240226143630.33643-67-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20240226143630.33643-1-jiangshanlai@gmail.com>
References: <20240226143630.33643-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hou Wenlong <houwenlong.hwl@antgroup.com>

Some PVOPS are patched as the native version directly if the guest is
not a XENPV guest. However, this approach will not work after
introducing a PVM guest. To address this, use a new CPU feature to
describe XENPV and PVM, and ensure that those PVOPS are patched only
when it is not a paravirtual guest.

Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>
---
 arch/x86/entry/entry_64.S          |  5 ++---
 arch/x86/include/asm/cpufeatures.h |  1 +
 arch/x86/include/asm/paravirt.h    | 14 +++++++-------
 arch/x86/kernel/pvm.c              |  1 +
 arch/x86/xen/enlighten_pv.c        |  1 +
 5 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index fe12605b3c05..6b41a1837698 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -127,9 +127,8 @@ SYM_INNER_LABEL(entry_SYSCALL_64_after_hwframe, SYM_L_GLOBAL)
 	 * In the PVM guest case we must use eretu synthetic instruction.
 	 */
 
-	ALTERNATIVE_2 "testb %al, %al; jz swapgs_restore_regs_and_return_to_usermode", \
-		"jmp swapgs_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV, \
-		"jmp swapgs_restore_regs_and_return_to_usermode", X86_FEATURE_KVM_PVM_GUEST
+	ALTERNATIVE "testb %al, %al; jz swapgs_restore_regs_and_return_to_usermode", \
+		"jmp swapgs_restore_regs_and_return_to_usermode", X86_FEATURE_PV_GUEST
 
 	/*
 	 * We win! This label is here just for ease of understanding
diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index e17e72f13423..72ef58a2db19 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -238,6 +238,7 @@
 #define X86_FEATURE_VCPUPREEMPT		( 8*32+21) /* "" PV vcpu_is_preempted function */
 #define X86_FEATURE_TDX_GUEST		( 8*32+22) /* Intel Trust Domain Extensions Guest */
 #define X86_FEATURE_KVM_PVM_GUEST	( 8*32+23) /* KVM Pagetable-based Virtual Machine guest */
+#define X86_FEATURE_PV_GUEST		( 8*32+24) /* "" Paravirtual guest */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0 (EBX), word 9 */
 #define X86_FEATURE_FSGSBASE		( 9*32+ 0) /* RDFSBASE, WRFSBASE, RDGSBASE, WRGSBASE instructions*/
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index deaee9ec575e..a864ee481ca2 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -143,7 +143,7 @@ static __always_inline unsigned long read_cr2(void)
 {
 	return PVOP_ALT_CALLEE0(unsigned long, mmu.read_cr2,
 				"mov %%cr2, %%rax;",
-				ALT_NOT(X86_FEATURE_XENPV));
+				ALT_NOT(X86_FEATURE_PV_GUEST));
 }
 
 static __always_inline void write_cr2(unsigned long x)
@@ -154,13 +154,13 @@ static __always_inline void write_cr2(unsigned long x)
 static inline unsigned long __read_cr3(void)
 {
 	return PVOP_ALT_CALL0(unsigned long, mmu.read_cr3,
-			      "mov %%cr3, %%rax;", ALT_NOT(X86_FEATURE_XENPV));
+			      "mov %%cr3, %%rax;", ALT_NOT(X86_FEATURE_PV_GUEST));
 }
 
 static inline void write_cr3(unsigned long x)
 {
 	PVOP_ALT_VCALL1(mmu.write_cr3, x,
-			"mov %%rdi, %%cr3", ALT_NOT(X86_FEATURE_XENPV));
+			"mov %%rdi, %%cr3", ALT_NOT(X86_FEATURE_PV_GUEST));
 }
 
 static inline void __write_cr4(unsigned long x)
@@ -694,17 +694,17 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
 static __always_inline unsigned long arch_local_save_flags(void)
 {
 	return PVOP_ALT_CALLEE0(unsigned long, irq.save_fl, "pushf; pop %%rax;",
-				ALT_NOT(X86_FEATURE_XENPV));
+				ALT_NOT(X86_FEATURE_PV_GUEST));
 }
 
 static __always_inline void arch_local_irq_disable(void)
 {
-	PVOP_ALT_VCALLEE0(irq.irq_disable, "cli;", ALT_NOT(X86_FEATURE_XENPV));
+	PVOP_ALT_VCALLEE0(irq.irq_disable, "cli;", ALT_NOT(X86_FEATURE_PV_GUEST));
 }
 
 static __always_inline void arch_local_irq_enable(void)
 {
-	PVOP_ALT_VCALLEE0(irq.irq_enable, "sti;", ALT_NOT(X86_FEATURE_XENPV));
+	PVOP_ALT_VCALLEE0(irq.irq_enable, "sti;", ALT_NOT(X86_FEATURE_PV_GUEST));
 }
 
 static __always_inline unsigned long arch_local_irq_save(void)
@@ -776,7 +776,7 @@ void native_pv_lock_init(void) __init;
 .endm
 
 #define SAVE_FLAGS	ALTERNATIVE "PARA_IRQ_save_fl;", "pushf; pop %rax;", \
-				    ALT_NOT(X86_FEATURE_XENPV)
+				    ALT_NOT(X86_FEATURE_PV_GUEST)
 #endif
 #endif /* CONFIG_PARAVIRT_XXL */
 #endif	/* CONFIG_X86_64 */
diff --git a/arch/x86/kernel/pvm.c b/arch/x86/kernel/pvm.c
index c38e46a96ad3..d39550a8159f 100644
--- a/arch/x86/kernel/pvm.c
+++ b/arch/x86/kernel/pvm.c
@@ -300,6 +300,7 @@ void __init pvm_early_setup(void)
 		return;
 
 	setup_force_cpu_cap(X86_FEATURE_KVM_PVM_GUEST);
+	setup_force_cpu_cap(X86_FEATURE_PV_GUEST);
 
 	wrmsrl(MSR_PVM_VCPU_STRUCT, __pa(this_cpu_ptr(&pvm_vcpu_struct)));
 	wrmsrl(MSR_PVM_EVENT_ENTRY, (unsigned long)(void *)pvm_early_kernel_event_entry - 256);
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index aeb33e0a3f76..c56483051528 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -335,6 +335,7 @@ static bool __init xen_check_xsave(void)
 static void __init xen_init_capabilities(void)
 {
 	setup_force_cpu_cap(X86_FEATURE_XENPV);
+	setup_force_cpu_cap(X86_FEATURE_PV_GUEST);
 	setup_clear_cpu_cap(X86_FEATURE_DCA);
 	setup_clear_cpu_cap(X86_FEATURE_APERFMPERF);
 	setup_clear_cpu_cap(X86_FEATURE_MTRR);
-- 
2.19.1.6.gb485710b


