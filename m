Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFFF9862BB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:15:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804159.1215251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTjP-0006LD-99; Wed, 25 Sep 2024 15:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804159.1215251; Wed, 25 Sep 2024 15:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTjN-0005vx-ET; Wed, 25 Sep 2024 15:15:05 +0000
Received: by outflank-mailman (input) for mailman id 804159;
 Wed, 25 Sep 2024 15:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IzCT=QX=flex--ardb.bounces.google.com=3ICb0ZggKCXsZqca+fhsfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@srs-se1.protection.inumbo.net>)
 id 1stTXf-0002k3-F1
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:59 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f932ee6-7b4f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 17:02:57 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6e20e4e55bbso31302567b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:57 -0700 (PDT)
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
X-Inumbo-ID: 3f932ee6-7b4f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276576; x=1727881376; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NyUlP50R7ff/vN5G1h18De2z2GbJesVTam/AShMXJgw=;
        b=TTGSC8GUJXMztNiV2M88C0L8+mLFEfHZpFhwyXgOB70IC2PqCE/QYGBY5flgP721ru
         TL2wZP/wqQLTfh71E13TwovZ3twv5NfvdCnlMDRXyi9PVyxkwU5q0RsfsXNWr4b48Ger
         Sr3PCZUO+nawoUCFRO7fbdZkUWRD/fjFRoxoqm4KQWAzbCNUYbGmzEy9ARuOPW4JO/op
         K2pIbguKtoatGSn/FSN7D7doDW2zwga7HhZ15Qeg5nHhP0mArSmYIXKLmD7bpM4zseyj
         h7qqQduapqnH8RjPMV2DbqHZ19r0oCV0GzvZOUVIcXWUlDHnsMaDbvegn0ibOc8DTL4J
         /lcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276576; x=1727881376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyUlP50R7ff/vN5G1h18De2z2GbJesVTam/AShMXJgw=;
        b=kOC/XGF5daKkliIzuF1eB1HSqaIx62iUnpf2QANlSIhcSQz/SDhK3hPptNf52f7xlS
         iW4ZehMl8D+9GckQlM1YjGl9rYLmQfaPnRb8j45SYeNqb6pcsu8icqOrGA22Q7cmB/dp
         0QmRkCO1LubHSYI9peErvkNBc39Nypi7NlS9Kv4kwUMWMHVAFFbAtus8IWHQBKUzuvu4
         FGdBTru7Ps1rUogS8AEoS5xlbrVG1cqSIN1dLqEdqprmxBvKz4UkwA026ixcYfssOgWq
         fTgl5IB8mofzXcqStd5TwC5BhGnAAXPCLbtK9lZqflLrVnwUzZhpYKnouvc4t3EhugfU
         J/NA==
X-Forwarded-Encrypted: i=1; AJvYcCVfFRTa+ew/3EzVdIRCuqp2tdBODkJhzYXk/LOPp9nEYE7GlfAAj/9rwjpcknFnmURZdZmKaPDvnMQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOp2W/LWZpUSkcK7LQAkYOQq9tvZICHRRPsAvY0hS5VuSTgGDF
	fuTQAY5AW1qQ+P3agVkppg/G699lHUff9pEO14+tNWgULPQCYhxKOSJ5MaqwFB7mdbT0jA==
X-Google-Smtp-Source: AGHT+IF9cT+1HnKGMG9rCL4XBpFAiRqL2rxQrsa7AeT9AU3GHDLsQi/G2t9Fg7OjYNkaCpx/AYMRBr5P
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:3149:b0:6de:19f:34d7 with SMTP id
 00721157ae682-6e21d81e811mr94787b3.2.1727276576540; Wed, 25 Sep 2024 08:02:56
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:26 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=7472; i=ardb@kernel.org;
 h=from:subject; bh=ZjnajWIKcY5DrOh/WpJS8LufZBk9grHctEdumwSdFZ4=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6oXaCAm2n4qhvN+cWPhMgzpaNBxMv/te55wX/7Z/7
 fXGH00dpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCJp0owMs7Y8P9MQNOWv4+0U
 10OXF7hWP92jueKnm9Tq9WavZtsdSmX4Z/Uk0GTGvv61f15k371aLH96espP9/0Kyz6kZF4+IJv 9hR8A
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-56-ardb+git@google.com>
Subject: [RFC PATCH 26/28] x86/boot: Implement support for ELF RELA/RELR relocations
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

Add support for standard dynamic ELF relocations to perform the virtual
relocation of the core kernel at boot. The RELR format results in a 10x
reduction in memory footprint of the relocation data, and can be
generated by the linker directly. This removes the need for
a) a host tool 'relocs' and a bespoke, clunky relocation table format
   where the table is simply concatenated to the vmlinux payload when
   building the decompressor;
b) dependence on the --emit-relocs linker switch, which dumps static,
   intermediate build time relocations into the ELF binary, to be
   subsequently used as runtime relocations.

The latter is especially problematic, as linkers may apply relaxations
that result in the code going out of sync with the static relocation
that annotated it in the input. This requires additional work on the
part of the linker to update the static relocation, which is not even
possible in all cases. Therefore, it is much better to consume a
runtime, dynamic relocation format in the way it was intended.

This will require switching to linking vmlinux in PIE mode - this is
implemented in a subsequent patch.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 Documentation/arch/x86/zero-page.rst  |  3 +-
 arch/x86/Kconfig                      |  1 +
 arch/x86/include/asm/setup.h          |  1 +
 arch/x86/include/uapi/asm/bootparam.h |  2 +-
 arch/x86/kernel/head64.c              | 36 ++++++++++++++++++++
 arch/x86/kernel/head_64.S             |  5 +++
 arch/x86/kernel/vmlinux.lds.S         | 24 +++++++++----
 7 files changed, 64 insertions(+), 8 deletions(-)

diff --git a/Documentation/arch/x86/zero-page.rst b/Documentation/arch/x86/zero-page.rst
index 45aa9cceb4f1..fd18b77113e2 100644
--- a/Documentation/arch/x86/zero-page.rst
+++ b/Documentation/arch/x86/zero-page.rst
@@ -3,7 +3,7 @@
 =========
 Zero Page
 =========
-The additional fields in struct boot_params as a part of 32-bit boot
+The additional fields in struct boot_params as a part of 32/64-bit boot
 protocol of kernel. These should be filled by bootloader or 16-bit
 real-mode setup code of the kernel. References/settings to it mainly
 are in::
@@ -20,6 +20,7 @@ Offset/Size	Proto	Name			Meaning
 060/010		ALL	ist_info		Intel SpeedStep (IST) BIOS support information
 						(struct ist_info)
 070/008		ALL	acpi_rsdp_addr		Physical address of ACPI RSDP table
+078/008		64-bit	kaslr_va_shift		Virtual kASLR displacement of the core kernel
 080/010		ALL	hd0_info		hd0 disk parameter, OBSOLETE!!
 090/010		ALL	hd1_info		hd1 disk parameter, OBSOLETE!!
 0A0/010		ALL	sys_desc_table		System description table (struct sys_desc_table),
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2852fcd82cbd..54cb1f14218b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -26,6 +26,7 @@ config X86_64
 	depends on 64BIT
 	# Options that are inherently 64-bit kernel only:
 	select ARCH_HAS_GIGANTIC_PAGE
+	select ARCH_HAS_RELR
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index 85f4fde3515c..a4d7dd81f773 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -51,6 +51,7 @@ extern void reserve_standard_io_resources(void);
 extern void i386_reserve_resources(void);
 extern unsigned long __startup_64(unsigned long p2v_offset, struct boot_params *bp);
 extern void startup_64_setup_gdt_idt(void);
+extern void startup_64_apply_relocations(struct boot_params *bp);
 extern void early_setup_idt(void);
 extern void __init do_early_exception(struct pt_regs *regs, int trapnr);
 
diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
index 9b82eebd7add..3389b1be234c 100644
--- a/arch/x86/include/uapi/asm/bootparam.h
+++ b/arch/x86/include/uapi/asm/bootparam.h
@@ -120,7 +120,7 @@ struct boot_params {
 	__u64  tboot_addr;				/* 0x058 */
 	struct ist_info ist_info;			/* 0x060 */
 	__u64 acpi_rsdp_addr;				/* 0x070 */
-	__u8  _pad3[8];					/* 0x078 */
+	__u64 kaslr_va_shift;				/* 0x078 */
 	__u8  hd0_info[16];	/* obsolete! */		/* 0x080 */
 	__u8  hd1_info[16];	/* obsolete! */		/* 0x090 */
 	struct sys_desc_table sys_desc_table; /* obsolete! */	/* 0x0a0 */
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 49e8ba1c0d34..6609e1012f2f 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -20,6 +20,7 @@
 #include <linux/io.h>
 #include <linux/memblock.h>
 #include <linux/cc_platform.h>
+#include <linux/elf.h>
 #include <linux/pgtable.h>
 
 #include <asm/asm.h>
@@ -588,3 +589,38 @@ void __head startup_64_setup_gdt_idt(void)
 
 	startup_64_load_idt(handler);
 }
+
+#ifdef CONFIG_RELOCATABLE
+void __head startup_64_apply_relocations(struct boot_params *bp)
+{
+	extern const Elf64_Rela __rela_start[], __rela_end[];
+	extern const u64 __relr_start[], __relr_end[];
+	u64 va_offset = (u64)RIP_REL_REF(_text) - __START_KERNEL;
+	u64 va_shift = bp->kaslr_va_shift;
+	u64 *place = NULL;
+
+	if (!va_shift)
+		return;
+
+	for (const Elf64_Rela *r = __rela_start; r < __rela_end; r++) {
+		if (ELF64_R_TYPE(r->r_info) != R_X86_64_RELATIVE)
+			continue;
+
+		place = (u64 *)(r->r_offset + va_offset);
+		*place += va_shift;
+	}
+
+	for (const u64 *rel = __relr_start; rel < __relr_end; rel++) {
+		if ((*rel & 1) == 0) {
+			place = (u64 *)(*rel + va_offset);
+			*place++ += va_shift;
+			continue;
+		}
+
+		for (u64 *p = place, r = *rel >> 1; r; p++, r >>= 1)
+			if (r & 1)
+				*p += va_shift;
+		place += 63;
+	}
+}
+#endif
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index cc2fec3de4b7..88cdc5a0c7a3 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -74,6 +74,11 @@ SYM_CODE_START_NOALIGN(startup_64)
 	cdq
 	wrmsr
 
+#ifdef CONFIG_RELOCATABLE
+	movq	%r15, %rdi
+	call	startup_64_apply_relocations
+#endif
+
 	call	startup_64_setup_gdt_idt
 
 	/* Now switch to __KERNEL_CS so IRET works reliably */
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 52b8db931d0f..f7e832c2ac61 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -240,6 +240,18 @@ xen_elfnote_phys32_entry_offset =
 	:init
 #endif
 
+	.init.rela : {
+		__rela_start = .;
+		*(.rela.*) *(.rela_*)
+		__rela_end = .;
+	}
+
+	.init.relr : {
+		__relr_start = .;
+		*(.relr.*)
+		__relr_end = .;
+	}
+
 	/*
 	 * Section for code used exclusively before alternatives are run. All
 	 * references to such code must be patched out by alternatives, normally
@@ -469,12 +481,6 @@ xen_elfnote_phys32_entry_offset =
 		*(.got) *(.igot.*)
 	}
 	ASSERT(SIZEOF(.got) == 0, "Unexpected GOT entries detected!")
-#endif
-
-	.plt : {
-		*(.plt) *(.plt.*) *(.iplt)
-	}
-	ASSERT(SIZEOF(.plt) == 0, "Unexpected run-time procedure linkages detected!")
 
 	.rel.dyn : {
 		*(.rel.*) *(.rel_*)
@@ -485,6 +491,12 @@ xen_elfnote_phys32_entry_offset =
 		*(.rela.*) *(.rela_*)
 	}
 	ASSERT(SIZEOF(.rela.dyn) == 0, "Unexpected run-time relocations (.rela) detected!")
+#endif
+
+	.plt : {
+		*(.plt) *(.plt.*) *(.iplt)
+	}
+	ASSERT(SIZEOF(.plt) == 0, "Unexpected run-time procedure linkages detected!")
 }
 
 /*
-- 
2.46.0.792.g87dc391469-goog


