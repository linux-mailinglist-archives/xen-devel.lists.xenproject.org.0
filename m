Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8975C986298
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:14:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804089.1215033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTis-0006fq-7v; Wed, 25 Sep 2024 15:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804089.1215033; Wed, 25 Sep 2024 15:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTir-0006RS-PD; Wed, 25 Sep 2024 15:14:33 +0000
Received: by outflank-mailman (input) for mailman id 804089;
 Wed, 25 Sep 2024 15:02:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FllF=QX=flex--ardb.bounces.google.com=36iX0ZggKCUUhyki+np0nvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@srs-se1.protection.inumbo.net>)
 id 1stTWm-0002UM-V4
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:04 +0000
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [2607:f8b0:4864:20::b4a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f4fd640-7b4f-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:02:03 +0200 (CEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-e1dc0585fbfso9533456276.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:03 -0700 (PDT)
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
X-Inumbo-ID: 1f4fd640-7b4f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276522; x=1727881322; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hcBJaG4CjYcevMfAnFyKwMdAr3oBLta0TuXom4JmDi8=;
        b=dQsEZOGWYaFQ90s2E71Bs10dCUP9iy3IGeT9N0SedxW8/udyExYFdJp2f7cdLosK9Q
         pXJbyuI1oG1Sqj3EQ4dBFC48/vZASTes+o2Zz/P+1AV4oWGFfsQVGn87kh9NtNGcuz3B
         eGnQt0wjtIB2vc57iFuy4E64MonAaUamwYhiwBisVC8isBPlko/hER/HdGbvB1Hm1I5x
         a7Bpe0O1DP57e4wAM5jchmHJ1jX6jzV/EBvmbnUujm127eTj3KXDayBjoYmUZAMGzPC2
         qPNxTnoFp74YeSyllWzKNjOw6Qra3O2P8+YLrh5KsmvDbbO61kayxVMbZ4VFnMXOC+11
         M6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276522; x=1727881322;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hcBJaG4CjYcevMfAnFyKwMdAr3oBLta0TuXom4JmDi8=;
        b=OiQCvkZEcH9eVpNhDmfTxm/ff7brN/N0lXBSPO1lQWikzQZnXxKmaTVcumep9sf45S
         /w6BpmwDZozcjmTskxy+Fj2LAlxpZCssGXSE9T8xIJYs1KLUfQUBzel6+hB77nqX3seR
         Cwyej6GTx0X2hjPMIA6XwFMoXc817Fnse1kGBRFLawCNdn/O/lSxBU3+oFZP1VzsbPp5
         mBIBnf2TigHYT/3BXuso4/wpc3jicMmdpHGMfuq15+2t5LhXZqXFPrETOpfMwOAJymau
         lJK+Nnz3Y4Nl0NnUhGHRmfqH550r98k21X76FkbDoWWAdwajGD2Hco5wK02MTNmJmg8j
         +Y4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVe/7TSNnxmZnia0vEn3pxUcSbJJ6hdtHGyqxfW+orSU6zh6pkfWgryotWZPb8vaihPQOyxYkuRHNU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzW4d9+u3nBj4+MkLwNKoh+74KuJvO9l3U6Bogg/WpLBZmaucAi
	j1In8yrM/8k9upbw4gDhYtmCznzW80Njrbv3sr09uFoT6yBaI25YLCELzx2SZz/ndRo0Sg==
X-Google-Smtp-Source: AGHT+IHVPP/hq0VdoG8mz8zZDpKENYQvppd12tQOBs96+ky0ZuGKlW9zxaw1GBiDRtGEwfqJMJeN7cfB
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:d695:0:b0:e1a:70ed:6ec9 with SMTP id
 3f1490d57ef6-e24d7352785mr29529276.2.1727276522332; Wed, 25 Sep 2024 08:02:02
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:05 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4340; i=ardb@kernel.org;
 h=from:subject; bh=I7lWAHThqqqqnrpiqIQsu32XeIcDrKE8EBFU/14ypJ4=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6manxvx6ho28axaYV4atC9wvG5Igfbri2+G3gWYqn
 maGuz52lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIl4nmVkaA1czF6Uafzbsi92
 efGhdw7lev3pD99ze/Rc9uE4U+u6lZHhb2nzhL8Z7seME5YcX8rFdHZX6uJJe7jF87S7K1vP1Mh zAQA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-35-ardb+git@google.com>
Subject: [RFC PATCH 05/28] x86: Define the stack protector guard symbol explicitly
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

Specify the guard symbol for the stack cookie explicitly, rather than
positioning it exactly 40 bytes into the per-CPU area. Doing so removes
the need for the per-CPU region to be absolute rather than relative to
the placement of the per-CPU template region in the kernel image, and
this allows the special handling for absolute per-CPU symbols to be
removed entirely.

This is a worthwhile cleanup in itself, but it is also a prerequisite
for PIE codegen and PIE linking, which can replace our bespoke and
rather clunky runtime relocation handling.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/Makefile                     |  4 ++++
 arch/x86/include/asm/init.h           |  2 +-
 arch/x86/include/asm/processor.h      | 11 +++--------
 arch/x86/include/asm/stackprotector.h |  4 ----
 tools/perf/util/annotate.c            |  4 ++--
 5 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 6b3fe6e2aadd..b78b7623a4a9 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -193,6 +193,10 @@ else
         KBUILD_RUSTFLAGS += -Cno-redzone=y
         KBUILD_RUSTFLAGS += -Ccode-model=kernel
 
+        ifeq ($(CONFIG_STACKPROTECTOR),y)
+                KBUILD_CFLAGS += -mstack-protector-guard-symbol=fixed_percpu_data
+        endif
+
         # Don't emit relaxable GOTPCREL relocations
         KBUILD_AFLAGS_KERNEL += -Wa,-mrelax-relocations=no
         KBUILD_CFLAGS_KERNEL += -Wa,-mrelax-relocations=no
diff --git a/arch/x86/include/asm/init.h b/arch/x86/include/asm/init.h
index 14d72727d7ee..3ed0e8ec973f 100644
--- a/arch/x86/include/asm/init.h
+++ b/arch/x86/include/asm/init.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_X86_INIT_H
 #define _ASM_X86_INIT_H
 
-#define __head	__section(".head.text")
+#define __head	__section(".head.text") __no_stack_protector
 
 struct x86_mapping_info {
 	void *(*alloc_pgt_page)(void *); /* allocate buf for page table */
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 4a686f0e5dbf..56bc36116814 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -402,14 +402,9 @@ struct irq_stack {
 #ifdef CONFIG_X86_64
 struct fixed_percpu_data {
 	/*
-	 * GCC hardcodes the stack canary as %gs:40.  Since the
-	 * irq_stack is the object at %gs:0, we reserve the bottom
-	 * 48 bytes of the irq stack for the canary.
-	 *
-	 * Once we are willing to require -mstack-protector-guard-symbol=
-	 * support for x86_64 stackprotector, we can get rid of this.
+	 * Since the irq_stack is the object at %gs:0, the bottom 8 bytes of
+	 * the irq stack are reserved for the canary.
 	 */
-	char		gs_base[40];
 	unsigned long	stack_canary;
 };
 
@@ -418,7 +413,7 @@ DECLARE_INIT_PER_CPU(fixed_percpu_data);
 
 static inline unsigned long cpu_kernelmode_gs_base(int cpu)
 {
-	return (unsigned long)per_cpu(fixed_percpu_data.gs_base, cpu);
+	return (unsigned long)&per_cpu(fixed_percpu_data, cpu);
 }
 
 extern asmlinkage void entry_SYSCALL32_ignore(void);
diff --git a/arch/x86/include/asm/stackprotector.h b/arch/x86/include/asm/stackprotector.h
index 00473a650f51..d1dcd22a0a4c 100644
--- a/arch/x86/include/asm/stackprotector.h
+++ b/arch/x86/include/asm/stackprotector.h
@@ -51,10 +51,6 @@ static __always_inline void boot_init_stack_canary(void)
 {
 	unsigned long canary = get_random_canary();
 
-#ifdef CONFIG_X86_64
-	BUILD_BUG_ON(offsetof(struct fixed_percpu_data, stack_canary) != 40);
-#endif
-
 	current->stack_canary = canary;
 #ifdef CONFIG_X86_64
 	this_cpu_write(fixed_percpu_data.stack_canary, canary);
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 37ce43c4eb8f..7ecfedf5edb9 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -2485,10 +2485,10 @@ static bool is_stack_operation(struct arch *arch, struct disasm_line *dl)
 
 static bool is_stack_canary(struct arch *arch, struct annotated_op_loc *loc)
 {
-	/* On x86_64, %gs:40 is used for stack canary */
+	/* On x86_64, %gs:0 is used for stack canary */
 	if (arch__is(arch, "x86")) {
 		if (loc->segment == INSN_SEG_X86_GS && loc->imm &&
-		    loc->offset == 40)
+		    loc->offset == 0)
 			return true;
 	}
 
-- 
2.46.0.792.g87dc391469-goog


