Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54856986297
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:14:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804091.1215042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTis-0006sG-Pg; Wed, 25 Sep 2024 15:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804091.1215042; Wed, 25 Sep 2024 15:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTis-0006gv-BS; Wed, 25 Sep 2024 15:14:34 +0000
Received: by outflank-mailman (input) for mailman id 804091;
 Wed, 25 Sep 2024 15:02:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTdi=QX=flex--ardb.bounces.google.com=37CX0ZggKCUcj0mk+pr2pxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@srs-se1.protection.inumbo.net>)
 id 1stTWq-0002k3-26
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:08 +0000
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [2607:f8b0:4864:20::b49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20c42c1b-7b4f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 17:02:06 +0200 (CEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-e035949cc4eso10634904276.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:06 -0700 (PDT)
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
X-Inumbo-ID: 20c42c1b-7b4f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276525; x=1727881325; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eDSZAaST0F7o2pedlrN6lklBaOasvLDlFvV5LwnRCP8=;
        b=bqiyOsnsVCpSPfMnxYFWPDfIX5z2pIHt9o1WYx2D0XuGM2UQJU6C+YJZbUaiVve9kL
         pUNWzOBcX3gMHXEvumBjrRaDpgWVdKbDX+j3t6qNWE8lbLow6aOUZt0F0YbcpVo624IT
         SnNtmgBd/1lFx7C7Gn9ZI+TlO15UflCbU16b5EwsQNQW/18UNfAoIoDHXAD7wKJQ/ZGa
         OLjAQTWiDkzWqZ3yyOOOdC1C7j4Hsbdn5lawCmqTmTjDiC/kzUGvrAugV8E0Ikyy5IJn
         8oYBB+B3k6W1R0Oj3ReIM4dDb3aaFsrs4no+Ro/llg5zs5XuNeQlxgAW0qw10/qiNLDM
         aU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276525; x=1727881325;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eDSZAaST0F7o2pedlrN6lklBaOasvLDlFvV5LwnRCP8=;
        b=RiSseLhrHb1VRsrXLVpgey2uE4cf1J1spP9vNKH2Q6/Ocy908myVjy5qJWeWdgW5P1
         Y9CZf33vc72Kwai2J4QWA6aB/c3UgE7/dAVDQvLYTF42BYRy425qGcxe7sAE+HNJ90hs
         D8BouPvd8KKSC2UCHiLKBwZAPfRF1wtbBHEIPjF/jAzpbrKRQ+QK7uk8yQTLFxkLWYoN
         w7/EpPJM8KMd9QisC6i+Eab/8o+LYDD2RXkVZ4xoQ7k8HsxIM4bRBOVSpKJZI63W0zGU
         Nc6d7/xOAMM/V8U4oquczcUufOzDoVRkh4lJbvMU7IuoFqAhigPSRmOlezH5OLRWKOoC
         M46A==
X-Forwarded-Encrypted: i=1; AJvYcCXFWFdmviFwVfbIcFY+LHRS6yP8e7/ui5Wh5r6SGMOb5t0Zjz4BQVOO18s0MOX1//lJtusJVMO8iy4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGMZGn+WBGhCY0/T2GbwcItiApwGdHivj8cK7TK9qG4C3d0k0v
	UnTIpEf5ZXnNeBRwKiY0zzTsvteedZXZebVQsX1J289fbrOFaORW6Ri3StTz5j90VEdWQA==
X-Google-Smtp-Source: AGHT+IFVWEnfWJexNr1qxNhJJA6KdWYKxMoVe8Dw+8wG1wSOr4X5mOwe9MyKjjmZekWIuFcjH9KvW3oI
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:6902:1782:b0:e0b:958a:3344 with SMTP id
 3f1490d57ef6-e24da39b0c3mr17932276.10.1727276524782; Wed, 25 Sep 2024
 08:02:04 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:06 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=12230; i=ardb@kernel.org;
 h=from:subject; bh=d8zrHLLRsaJb8rjIFgQ7EHO+u22pN8JK1vGiiuXj4lQ=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6pZHteaXk89IXLoXMatcXipz+8w88ZqbTc8vrDt5e
 99Nu9mbO0pZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBE3LsZ/oo9TvHP2+umfelZ
 ulBlzIGvqg9nBs08XVmsmMPN+vzurvOMDNcdmH9HcnIw6q7iylwgUHny+rJVkzYJbJk791Zkl/v XRQwA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-36-ardb+git@google.com>
Subject: [RFC PATCH 06/28] x86/percpu: Get rid of absolute per-CPU variable placement
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

For historic reasons, per-CPU symbols on x86_64 are emitted in an
address space that is disjoint from the ordinary kernel VA space,
starting at address 0x0. This splits a per-CPU symbol reference into a
base plus offset, where the base is programmed into the GS segment
register.

This deviates from the usual approach adopted by other SMP
architectures, where the base is a reference to the variable in the
kernel image's per-CPU template area, and the offset is a per-CPU value
accounting for the displacement of that particular CPU's per-CPU region
with respect to the template area. This gives per-CPU variable
references a range that is identical to ordinary references, and
requires no special handling for the startup code, as the offset will
simply be 0x0 up until the point where per-CPU variables are initialized
properly.

The x86_64 approach was needed to accommodate per-task stack protector
cookies, which used to live at a fixed offset of GS+40, requiring GS to
be treated as a base register. This is no longer the case, though, and
so GS can be repurposed as a true per-CPU offset, adopting the same
strategy as other architectures.

This also removes the need for linker tricks to emit the per-CPU ELF
segment at a different virtual address. It also means RIP-relative
per-CPU variables no longer need to be relocated in the opposite
direction when KASLR is applied, which was necessary because the 0x0
based per-CPU region remains in place even when the kernel is moved
around.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/desc.h      |  1 -
 arch/x86/include/asm/percpu.h    | 22 --------------
 arch/x86/include/asm/processor.h |  5 ++--
 arch/x86/kernel/head64.c         |  2 +-
 arch/x86/kernel/head_64.S        | 12 ++------
 arch/x86/kernel/irq_64.c         |  1 -
 arch/x86/kernel/setup_percpu.c   |  9 +-----
 arch/x86/kernel/vmlinux.lds.S    | 30 --------------------
 arch/x86/platform/pvh/head.S     |  6 ++--
 arch/x86/tools/relocs.c          |  8 +-----
 arch/x86/xen/xen-head.S          | 10 ++-----
 init/Kconfig                     |  1 -
 12 files changed, 13 insertions(+), 94 deletions(-)

diff --git a/arch/x86/include/asm/desc.h b/arch/x86/include/asm/desc.h
index 62dc9f59ea76..ec95fe44fa3a 100644
--- a/arch/x86/include/asm/desc.h
+++ b/arch/x86/include/asm/desc.h
@@ -46,7 +46,6 @@ struct gdt_page {
 } __attribute__((aligned(PAGE_SIZE)));
 
 DECLARE_PER_CPU_PAGE_ALIGNED(struct gdt_page, gdt_page);
-DECLARE_INIT_PER_CPU(gdt_page);
 
 /* Provide the original GDT */
 static inline struct desc_struct *get_cpu_gdt_rw(unsigned int cpu)
diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index c55a79d5feae..1ded1207528d 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -20,12 +20,6 @@
 
 #define PER_CPU_VAR(var)	__percpu(var)__percpu_rel
 
-#ifdef CONFIG_X86_64_SMP
-# define INIT_PER_CPU_VAR(var)  init_per_cpu__##var
-#else
-# define INIT_PER_CPU_VAR(var)  var
-#endif
-
 #else /* !__ASSEMBLY__: */
 
 #include <linux/build_bug.h>
@@ -97,22 +91,6 @@
 #define __percpu_arg(x)		__percpu_prefix "%" #x
 #define __force_percpu_arg(x)	__force_percpu_prefix "%" #x
 
-/*
- * Initialized pointers to per-CPU variables needed for the boot
- * processor need to use these macros to get the proper address
- * offset from __per_cpu_load on SMP.
- *
- * There also must be an entry in vmlinux_64.lds.S
- */
-#define DECLARE_INIT_PER_CPU(var) \
-       extern typeof(var) init_per_cpu_var(var)
-
-#ifdef CONFIG_X86_64_SMP
-# define init_per_cpu_var(var)  init_per_cpu__##var
-#else
-# define init_per_cpu_var(var)  var
-#endif
-
 /*
  * For arch-specific code, we can use direct single-insn ops (they
  * don't give an lvalue though).
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 56bc36116814..d7219e149f24 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -409,11 +409,12 @@ struct fixed_percpu_data {
 };
 
 DECLARE_PER_CPU_FIRST(struct fixed_percpu_data, fixed_percpu_data) __visible;
-DECLARE_INIT_PER_CPU(fixed_percpu_data);
 
 static inline unsigned long cpu_kernelmode_gs_base(int cpu)
 {
-	return (unsigned long)&per_cpu(fixed_percpu_data, cpu);
+	extern unsigned long __per_cpu_offset[];
+
+	return IS_ENABLED(CONFIG_SMP) ? __per_cpu_offset[cpu] : 0;
 }
 
 extern asmlinkage void entry_SYSCALL32_ignore(void);
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 4b9d4557fc94..d4398261ad81 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -559,7 +559,7 @@ void early_setup_idt(void)
  */
 void __head startup_64_setup_gdt_idt(void)
 {
-	struct desc_struct *gdt = (void *)(__force unsigned long)init_per_cpu_var(gdt_page.gdt);
+	struct desc_struct *gdt = (void *)(__force unsigned long)gdt_page.gdt;
 	void *handler = NULL;
 
 	struct desc_ptr startup_gdt_descr = {
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 330922b328bf..ab6ccee81493 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -68,11 +68,10 @@ SYM_CODE_START_NOALIGN(startup_64)
 	/* Set up the stack for verify_cpu() */
 	leaq	__top_init_kernel_stack(%rip), %rsp
 
-	/* Setup GSBASE to allow stack canary access for C code */
+	/* Clear %gs so early per-CPU references target the per-CPU load area */
 	movl	$MSR_GS_BASE, %ecx
-	leaq	INIT_PER_CPU_VAR(fixed_percpu_data)(%rip), %rdx
-	movl	%edx, %eax
-	shrq	$32,  %rdx
+	xorl	%eax, %eax
+	cdq
 	wrmsr
 
 	call	startup_64_setup_gdt_idt
@@ -361,15 +360,10 @@ SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
 
 	/* Set up %gs.
 	 *
-	 * The base of %gs always points to fixed_percpu_data. If the
-	 * stack protector canary is enabled, it is located at %gs:40.
 	 * Note that, on SMP, the boot cpu uses init data section until
 	 * the per cpu areas are set up.
 	 */
 	movl	$MSR_GS_BASE,%ecx
-#ifndef CONFIG_SMP
-	leaq	INIT_PER_CPU_VAR(fixed_percpu_data)(%rip), %rdx
-#endif
 	movl	%edx, %eax
 	shrq	$32, %rdx
 	wrmsr
diff --git a/arch/x86/kernel/irq_64.c b/arch/x86/kernel/irq_64.c
index ade0043ce56e..56bdeecd8ee0 100644
--- a/arch/x86/kernel/irq_64.c
+++ b/arch/x86/kernel/irq_64.c
@@ -27,7 +27,6 @@
 #include <asm/apic.h>
 
 DEFINE_PER_CPU_PAGE_ALIGNED(struct irq_stack, irq_stack_backing_store) __visible;
-DECLARE_INIT_PER_CPU(irq_stack_backing_store);
 
 #ifdef CONFIG_VMAP_STACK
 /*
diff --git a/arch/x86/kernel/setup_percpu.c b/arch/x86/kernel/setup_percpu.c
index b30d6e180df7..57482420ff42 100644
--- a/arch/x86/kernel/setup_percpu.c
+++ b/arch/x86/kernel/setup_percpu.c
@@ -23,17 +23,10 @@
 #include <asm/cpumask.h>
 #include <asm/cpu.h>
 
-#ifdef CONFIG_X86_64
-#define BOOT_PERCPU_OFFSET ((unsigned long)__per_cpu_load)
-#else
-#define BOOT_PERCPU_OFFSET 0
-#endif
-
-DEFINE_PER_CPU_READ_MOSTLY(unsigned long, this_cpu_off) = BOOT_PERCPU_OFFSET;
+DEFINE_PER_CPU_READ_MOSTLY(unsigned long, this_cpu_off) = 0;
 EXPORT_PER_CPU_SYMBOL(this_cpu_off);
 
 unsigned long __per_cpu_offset[NR_CPUS] __ro_after_init = {
-	[0 ... NR_CPUS-1] = BOOT_PERCPU_OFFSET,
 };
 EXPORT_SYMBOL(__per_cpu_offset);
 
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 7f060d873f75..00f82db7b3e1 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -103,9 +103,6 @@ PHDRS {
 	text PT_LOAD FLAGS(5);          /* R_E */
 	data PT_LOAD FLAGS(6);          /* RW_ */
 #ifdef CONFIG_X86_64
-#ifdef CONFIG_SMP
-	percpu PT_LOAD FLAGS(6);        /* RW_ */
-#endif
 	init PT_LOAD FLAGS(7);          /* RWE */
 #endif
 	note PT_NOTE FLAGS(0);          /* ___ */
@@ -225,17 +222,6 @@ SECTIONS
 		__init_begin = .; /* paired with __init_end */
 	}
 
-#if defined(CONFIG_X86_64) && defined(CONFIG_SMP)
-	/*
-	 * percpu offsets are zero-based on SMP.  PERCPU_VADDR() changes the
-	 * output PHDR, so the next output section - .init.text - should
-	 * start another segment - init.
-	 */
-	PERCPU_VADDR(INTERNODE_CACHE_BYTES, 0, :percpu)
-	ASSERT(SIZEOF(.data..percpu) < CONFIG_PHYSICAL_START,
-	       "per-CPU data too large - increase CONFIG_PHYSICAL_START")
-#endif
-
 	INIT_TEXT_SECTION(PAGE_SIZE)
 #ifdef CONFIG_X86_64
 	:init
@@ -356,9 +342,7 @@ SECTIONS
 		EXIT_DATA
 	}
 
-#if !defined(CONFIG_X86_64) || !defined(CONFIG_SMP)
 	PERCPU_SECTION(INTERNODE_CACHE_BYTES)
-#endif
 
 	RUNTIME_CONST(shift, d_hash_shift)
 	RUNTIME_CONST(ptr, dentry_hashtable)
@@ -497,20 +481,6 @@ SECTIONS
 	   "kernel image bigger than KERNEL_IMAGE_SIZE");
 
 #ifdef CONFIG_X86_64
-/*
- * Per-cpu symbols which need to be offset from __per_cpu_load
- * for the boot processor.
- */
-#define INIT_PER_CPU(x) init_per_cpu__##x = ABSOLUTE(x) + __per_cpu_load
-INIT_PER_CPU(gdt_page);
-INIT_PER_CPU(fixed_percpu_data);
-INIT_PER_CPU(irq_stack_backing_store);
-
-#ifdef CONFIG_SMP
-. = ASSERT((fixed_percpu_data == 0),
-           "fixed_percpu_data is not at start of per-cpu area");
-#endif
-
 #ifdef CONFIG_MITIGATION_UNRET_ENTRY
 . = ASSERT((retbleed_return_thunk & 0x3f) == 0, "retbleed_return_thunk not cacheline-aligned");
 #endif
diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index a308b79a887c..11245ecdc08d 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -95,9 +95,9 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	/* 64-bit entry point. */
 	.code64
 1:
-	/* Set base address in stack canary descriptor. */
+	/* Clear %gs so early per-CPU references target the per-CPU load area */
 	mov $MSR_GS_BASE,%ecx
-	mov $_pa(canary), %eax
+	xor %eax, %eax
 	xor %edx, %edx
 	wrmsr
 
@@ -161,8 +161,6 @@ SYM_DATA_START_LOCAL(gdt_start)
 SYM_DATA_END_LABEL(gdt_start, SYM_L_LOCAL, gdt_end)
 
 	.balign 16
-SYM_DATA_LOCAL(canary, .fill 48, 1, 0)
-
 SYM_DATA_START_LOCAL(early_stack)
 	.fill BOOT_STACK_SIZE, 1, 0
 SYM_DATA_END_LABEL(early_stack, SYM_L_LOCAL, early_stack_end)
diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index 880f0f2e465e..10add45b99f1 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -88,7 +88,6 @@ static const char * const	sym_regex_kernel[S_NSYMTYPES] = {
 	"(jiffies|jiffies_64)|"
 #if ELF_BITS == 64
 	"__per_cpu_load|"
-	"init_per_cpu__.*|"
 	"__end_rodata_hpage_align|"
 #endif
 	"__vvar_page|"
@@ -785,10 +784,6 @@ static void percpu_init(void)
  * The GNU linker incorrectly associates:
  *	__init_begin
  *	__per_cpu_load
- *
- * The "gold" linker incorrectly associates:
- *	init_per_cpu__fixed_percpu_data
- *	init_per_cpu__gdt_page
  */
 static int is_percpu_sym(ElfW(Sym) *sym, const char *symname)
 {
@@ -796,8 +791,7 @@ static int is_percpu_sym(ElfW(Sym) *sym, const char *symname)
 
 	return (shndx == per_cpu_shndx) &&
 		strcmp(symname, "__init_begin") &&
-		strcmp(symname, "__per_cpu_load") &&
-		strncmp(symname, "init_per_cpu_", 13);
+		strcmp(symname, "__per_cpu_load");
 }
 
 
diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index 758bcd47b72d..faadac7c29e6 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -51,15 +51,9 @@ SYM_CODE_START(startup_xen)
 
 	leaq	__top_init_kernel_stack(%rip), %rsp
 
-	/* Set up %gs.
-	 *
-	 * The base of %gs always points to fixed_percpu_data.  If the
-	 * stack protector canary is enabled, it is located at %gs:40.
-	 * Note that, on SMP, the boot cpu uses init data section until
-	 * the per cpu areas are set up.
-	 */
+	/* Clear %gs so early per-CPU references target the per-CPU load area */
 	movl	$MSR_GS_BASE,%ecx
-	movq	$INIT_PER_CPU_VAR(fixed_percpu_data),%rax
+	xorl	%eax, %eax
 	cdq
 	wrmsr
 
diff --git a/init/Kconfig b/init/Kconfig
index b05467014041..be8a9a786d3c 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1838,7 +1838,6 @@ config KALLSYMS_ALL
 config KALLSYMS_ABSOLUTE_PERCPU
 	bool
 	depends on KALLSYMS
-	default X86_64 && SMP
 
 # end of the "standard kernel features (expert users)" menu
 
-- 
2.46.0.792.g87dc391469-goog


