Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEE29970A0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 18:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814890.1228622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZFV-0005WM-HO; Wed, 09 Oct 2024 16:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814890.1228622; Wed, 09 Oct 2024 16:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZFV-0005TW-Bx; Wed, 09 Oct 2024 16:09:17 +0000
Received: by outflank-mailman (input) for mailman id 814890;
 Wed, 09 Oct 2024 16:09:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEIt=RF=flex--ardb.bounces.google.com=3qaoGZwgKCVg0H31+68J6EE6B4.2ECN4D-34L4BB8IJI.N4DFHE942J.EH6@srs-se1.protection.inumbo.net>)
 id 1syZFT-0004OJ-1A
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 16:09:15 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d39c20ff-8658-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 18:09:14 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6e3231725c9so491607b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 09:09:14 -0700 (PDT)
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
X-Inumbo-ID: d39c20ff-8658-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728490153; x=1729094953; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qfTuALibAeUjzZyHnaTNb0n9bb4hHeONDW14sDZ6lQE=;
        b=4drxnG1osMxRlkJ3Jat3MK1sAaqG4B6nRRBqKn2j6TDDTalBgCe8gqt3ckRz+p3x5j
         Qri+2B+oRYDsPCU15htNC4vX+z3DXzY7dhQIRIy8MHQ2nCpwbX2djXNQKcr2DUmDi2F9
         b524GaW8kl6osHjeCLe5rdXwjKm1sTpg0AEV/Ne9rXazjgSLIZVNSgAwhzn2yMF6YeRx
         KtuZg57dV/4ur8Qf2PLBZb7VogMuqjbo9hFKhKR85QtZ/D5l6aabeKjX3qudVVKhDrWf
         vxsDG+AYyKLTlFAxN4Iz4YtL+aZ4ZSfCNhjgJp44e3ixm2SF5I0nk1YP+jlfjfJCCOAD
         p9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490153; x=1729094953;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qfTuALibAeUjzZyHnaTNb0n9bb4hHeONDW14sDZ6lQE=;
        b=Q9b78d5Nw1CuemH1Wb/LH2gnytKvp33gZQ2bXS7PfFqPlVzsA5eUlhy9ZMwbobXW3j
         iXVHykApnIzPrMONS7HjjmNibjlIewI+/ZFah/TuVX/FYOh/uKj4lB4Unc/yuFgm4jdF
         tWg9+C3/hbzPokTsMIqh7dMlVsC7EgrtI7eMMqo9t5wI9beKqYIq73MlT/MMWt4mWjJm
         6h+qgz+ovgf4BujQz3L64Mjlqhvs+JefarNvXspXYTXUpbBpiyLgYox/8MsViGvMFWRw
         2Y7T3aWva2qRWKzmo6ZkzgMHTSSk+Gicbn/XAB7sDY4C+pyyZvXCeTDduD/QgtV4ur76
         0qZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWitfGKzJwtrYVsHOgo3lcbw50E+bM3viWgHlUEKfz3s1htx2E5RJC/YloSJxhH9+Bf7a8JzgLxDK8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz04OdEk8cO1EnvDE7MhLI2K/kF+RcuK+GNfcLHsAKiaNJSIPRA
	xHLZOAO2UmhynsYX+JqeInCoVAJdMnzq6Fjya3oZWqKxsWyA5O6OVqO/0cii2MPIxnBZqg==
X-Google-Smtp-Source: AGHT+IGSwzDDwa9vfi8McEdFMoR0PLLZMRY7iqvUgt19TSvNHlS6capqTKRHK6X82aIm2RwCa+IhAMD6
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:df09:0:b0:e28:fc1c:eb4d with SMTP id
 3f1490d57ef6-e28fe32b721mr58962276.1.1728490153207; Wed, 09 Oct 2024 09:09:13
 -0700 (PDT)
Date: Wed,  9 Oct 2024 18:04:43 +0200
In-Reply-To: <20241009160438.3884381-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20241009160438.3884381-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4449; i=ardb@kernel.org;
 h=from:subject; bh=AQt8zs3Emx4CUUaeR6x58jNDJibSKr6ifPlMsbVG+cQ=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ1t5ZwCb7dpkU8nOf9OFdq2+mPT7Qerpm6yWpi6sTF9c
 YQ2O+P9jlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRHfMZ/vA9beh7s984n3lF
 nbt8C5vrhH0L+bUzNWZc2rptzvfbi9Yz/C/2LdZQ9yvoyEoxXnp71/ubzTvKvmpbXurczZbm/Dj kCAcA
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009160438.3884381-11-ardb+git@google.com>
Subject: [PATCH v3 4/5] x86/xen: Avoid relocatable quantities in Xen ELF notes
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Xen puts virtual and physical addresses into ELF notes that are treated
by the linker as relocatable by default. Doing so is not only pointless,
given that the ELF notes are only intended for consumption by Xen before
the kernel boots. It is also a KASLR leak, given that the kernel's ELF
notes are exposed via the world readable /sys/kernel/notes.

So emit these constants in a way that prevents the linker from marking
them as relocatable. This involves place-relative relocations (which
subtract their own virtual address from the symbol value) and linker
provided absolute symbols that add the address of the place to the
desired value.

Tested-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/vmlinux.lds.S | 19 +++++++++++++++++++
 arch/x86/platform/pvh/head.S  |  6 +++---
 arch/x86/tools/relocs.c       |  1 +
 arch/x86/xen/xen-head.S       |  6 ++++--
 4 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 6726be89b7a6..495f88c9d9f8 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -527,3 +527,22 @@ INIT_PER_CPU(irq_stack_backing_store);
 #endif
 
 #endif /* CONFIG_X86_64 */
+
+/*
+ * The symbols below are referenced using relative relocations in the
+ * respective ELF notes. This produces build time constants that the
+ * linker will never mark as relocatable. (Using just ABSOLUTE() is not
+ * sufficient for that).
+ */
+#ifdef CONFIG_XEN
+#ifdef CONFIG_XEN_PV
+xen_elfnote_entry_value =
+	ABSOLUTE(xen_elfnote_entry) + ABSOLUTE(startup_xen);
+#endif
+xen_elfnote_hypercall_page_value =
+	ABSOLUTE(xen_elfnote_hypercall_page) + ABSOLUTE(hypercall_page);
+#endif
+#ifdef CONFIG_PVH
+xen_elfnote_phys32_entry_value =
+	ABSOLUTE(xen_elfnote_phys32_entry) + ABSOLUTE(pvh_start_xen - LOAD_OFFSET);
+#endif
diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 7ca51a4da217..e6f39d77f0b4 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -52,7 +52,7 @@
 #define PVH_CS_SEL		(PVH_GDT_ENTRY_CS * 8)
 #define PVH_DS_SEL		(PVH_GDT_ENTRY_DS * 8)
 
-SYM_CODE_START_LOCAL(pvh_start_xen)
+SYM_CODE_START(pvh_start_xen)
 	UNWIND_HINT_END_OF_STACK
 	cld
 
@@ -300,5 +300,5 @@ SYM_DATA_END(pvh_level2_kernel_pgt)
 		     .long KERNEL_IMAGE_SIZE - 1)
 #endif
 
-	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY,
-	             _ASM_PTR (pvh_start_xen - __START_KERNEL_map))
+	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY, .global xen_elfnote_phys32_entry;
+		xen_elfnote_phys32_entry: _ASM_PTR xen_elfnote_phys32_entry_value - .)
diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index c101bed61940..3ede19ca8432 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -56,6 +56,7 @@ static const char * const	sym_regex_kernel[S_NSYMTYPES] = {
 	[S_ABS] =
 	"^(xen_irq_disable_direct_reloc$|"
 	"xen_save_fl_direct_reloc$|"
+	"xen_elfnote_.+_offset$|"
 	"VDSO|"
 	"__kcfi_typeid_|"
 	"__crc_)",
diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index 758bcd47b72d..7f6c69dbb816 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -94,7 +94,8 @@ SYM_CODE_END(xen_cpu_bringup_again)
 	ELFNOTE(Xen, XEN_ELFNOTE_VIRT_BASE,      _ASM_PTR __START_KERNEL_map)
 	/* Map the p2m table to a 512GB-aligned user address. */
 	ELFNOTE(Xen, XEN_ELFNOTE_INIT_P2M,       .quad (PUD_SIZE * PTRS_PER_PUD))
-	ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          _ASM_PTR startup_xen)
+	ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          .globl xen_elfnote_entry;
+		xen_elfnote_entry: _ASM_PTR xen_elfnote_entry_value - .)
 	ELFNOTE(Xen, XEN_ELFNOTE_FEATURES,       .ascii "!writable_page_tables")
 	ELFNOTE(Xen, XEN_ELFNOTE_PAE_MODE,       .asciz "yes")
 	ELFNOTE(Xen, XEN_ELFNOTE_L1_MFN_VALID,
@@ -115,7 +116,8 @@ SYM_CODE_END(xen_cpu_bringup_again)
 #else
 # define FEATURES_DOM0 0
 #endif
-	ELFNOTE(Xen, XEN_ELFNOTE_HYPERCALL_PAGE, _ASM_PTR hypercall_page)
+	ELFNOTE(Xen, XEN_ELFNOTE_HYPERCALL_PAGE, .globl xen_elfnote_hypercall_page;
+		xen_elfnote_hypercall_page: _ASM_PTR xen_elfnote_hypercall_page_value - .)
 	ELFNOTE(Xen, XEN_ELFNOTE_SUPPORTED_FEATURES,
 		.long FEATURES_PV | FEATURES_PVH | FEATURES_DOM0)
 	ELFNOTE(Xen, XEN_ELFNOTE_LOADER,         .asciz "generic")
-- 
2.47.0.rc0.187.ge670bccf7e-goog


