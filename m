Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279409862AE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804099.1215079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTiw-0007n5-0U; Wed, 25 Sep 2024 15:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804099.1215079; Wed, 25 Sep 2024 15:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTiv-0007Zq-DY; Wed, 25 Sep 2024 15:14:37 +0000
Received: by outflank-mailman (input) for mailman id 804099;
 Wed, 25 Sep 2024 15:02:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Shjt=QX=flex--ardb.bounces.google.com=39yX0ZggKCVIuBxv+02D08805y.w86Hy7-xyFy552CDC.Hy79B83ywD.8B0@srs-se1.protection.inumbo.net>)
 id 1stTWz-0002UM-4w
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:02:17 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26f2c6d0-7b4f-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:02:16 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6d3e062dbeeso14659177b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:02:16 -0700 (PDT)
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
X-Inumbo-ID: 26f2c6d0-7b4f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276535; x=1727881335; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mwy8kTVjZ/08dn4MFhxsJ/CPkFSWb32MIOuFSl+DFsU=;
        b=yuJL3YfnW9YPMSjKYiH8T4oVSqPYL2G32BXfjuSsEThWhl0PBUrmY+s1famn5m3AOJ
         90lUqwn+jPiqbUilIFFE9cUecTnS9CF7L1dBmc9D51g0AuI9HIWWb/krz/hZr1MdnoGm
         a8nV7dpYTYvJNpWopsnDZqXBezrYZwumt6iOP7upy788wxJhCVwTeQcTNfyARy+7UsSC
         89cHyutiFHDA4wKbIiFGvS06/6lwTjUNBPwjZkFMYnDcCrqGdpWJfFTYwy6C3evSFqpK
         3tqY13erx3phXeAOG1g6JOc8sxKPiXE6JpR4lVKw+N/qPeXJOGiPvTubb3Aig4oNMR0A
         N/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276535; x=1727881335;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mwy8kTVjZ/08dn4MFhxsJ/CPkFSWb32MIOuFSl+DFsU=;
        b=QWUbUOfBLSMxoUdTzUhs7BdY4EHi6AVTHINi4GN0MSeJuBrIwstVV/J55cN7KFH05w
         9y0LERs4CvmAeVukqy8/FCa9EeoW6OV9vorxUxG8UUn3cv8wDwijbVhQ7DrysdKF8XSQ
         7G1wEJT7t1Pyh0J3ZWTMDYqC1mopQI4U310aoudZ6qiHV5KSE3vHKbJ1YmsI9ociNFX4
         kg47ZB2MGSJctMRRds04KrjVnB7wHHEd6LYhFoMmE8B9wBl2uo5bgOf4g4ASND2yh3zA
         WoAK27fajDheWNWgO3Y5vllH1FjhBKcYptDm7Y+kCWoGoZj01njbs4odxUY9oIMAmZu7
         JJNg==
X-Forwarded-Encrypted: i=1; AJvYcCUHiGFuFMM820lk3rTmVZIkBY1h8/4SwGDbgdMNx6uZjHTCsJytbTCKK1N9hSSs/z6wP4MFh70SwFI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxba+2Elv/+n9AEjX5CHS/jSNdnmGKSJlVDOv+CWUqDzPl0Fc6g
	gBIHBXT0ucNABvvydVsK/DRIL/gGJoleRZCl/3NdBuQaW4zhDJMj9f/x7DdkokBkroUi1g==
X-Google-Smtp-Source: AGHT+IEEpXdESu+AVZ5xAH4ocoULrkWfhbmfoqTWPQarKhwafrufRJLTuhlZhXvWoZ56ZcFdzDjPCpOs
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:6a0d:b0:6da:3596:21b8 with SMTP id
 00721157ae682-6e2089c8234mr1848507b3.4.1727276535155; Wed, 25 Sep 2024
 08:02:15 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:10 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4217; i=ardb@kernel.org;
 h=from:subject; bh=umOxUEgpm+XSdzq7sqW2wzWT3DKWlT715fLzy00ZrIc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6q4zMe0fH8zn/6yon+W25vvljx/znOb8fBedfXMvk
 4PJy+hrHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiC5MZGX675CxMX+/71dxB
 RTLX6OaHWScZikUU3t9k3TfnWIl7YijDP8vjN+r/hng3npecsefHgZqi2WFz5zPUNTIeVXy24tT y6awA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-40-ardb+git@google.com>
Subject: [RFC PATCH 10/28] x86/xen: Avoid relocatable quantities in Xen ELF notes
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

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/vmlinux.lds.S | 13 +++++++++++++
 arch/x86/platform/pvh/head.S  |  6 +++---
 arch/x86/tools/relocs.c       |  1 +
 arch/x86/xen/xen-head.S       |  6 ++++--
 4 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 00f82db7b3e1..52b8db931d0f 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -111,6 +111,19 @@ PHDRS {
 SECTIONS
 {
 	. = __START_KERNEL;
+
+#ifdef CONFIG_XEN_PV
+xen_elfnote_entry_offset =
+	ABSOLUTE(xen_elfnote_entry) + ABSOLUTE(startup_xen);
+xen_elfnote_hypercall_page_offset =
+	ABSOLUTE(xen_elfnote_hypercall_page) + ABSOLUTE(hypercall_page);
+#endif
+
+#ifdef CONFIG_PVH
+xen_elfnote_phys32_entry_offset =
+	ABSOLUTE(xen_elfnote_phys32_entry) + ABSOLUTE(pvh_start_xen - LOAD_OFFSET);
+#endif
+
 #ifdef CONFIG_X86_32
 	phys_startup_32 = ABSOLUTE(startup_32 - LOAD_OFFSET);
 #else
diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 11245ecdc08d..adbf57e83e4e 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -50,7 +50,7 @@
 #define PVH_CS_SEL		(PVH_GDT_ENTRY_CS * 8)
 #define PVH_DS_SEL		(PVH_GDT_ENTRY_DS * 8)
 
-SYM_CODE_START_LOCAL(pvh_start_xen)
+SYM_CODE_START(pvh_start_xen)
 	UNWIND_HINT_END_OF_STACK
 	cld
 
@@ -165,5 +165,5 @@ SYM_DATA_START_LOCAL(early_stack)
 	.fill BOOT_STACK_SIZE, 1, 0
 SYM_DATA_END_LABEL(early_stack, SYM_L_LOCAL, early_stack_end)
 
-	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY,
-	             _ASM_PTR (pvh_start_xen - __START_KERNEL_map))
+	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY, .global xen_elfnote_phys32_entry;
+		xen_elfnote_phys32_entry: _ASM_PTR xen_elfnote_phys32_entry_offset - .)
diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index 942c029a5067..22c2d3f07a57 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -57,6 +57,7 @@ static const char * const	sym_regex_kernel[S_NSYMTYPES] = {
 	[S_ABS] =
 	"^(xen_irq_disable_direct_reloc$|"
 	"xen_save_fl_direct_reloc$|"
+	"xen_elfnote_.+_offset$|"
 	"VDSO|"
 	"__kcfi_typeid_|"
 	"__crc_)",
diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index faadac7c29e6..4d246a48a85f 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -88,7 +88,8 @@ SYM_CODE_END(xen_cpu_bringup_again)
 	ELFNOTE(Xen, XEN_ELFNOTE_VIRT_BASE,      _ASM_PTR __START_KERNEL_map)
 	/* Map the p2m table to a 512GB-aligned user address. */
 	ELFNOTE(Xen, XEN_ELFNOTE_INIT_P2M,       .quad (PUD_SIZE * PTRS_PER_PUD))
-	ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          _ASM_PTR startup_xen)
+	ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          .globl xen_elfnote_entry;
+		xen_elfnote_entry: _ASM_PTR xen_elfnote_entry_offset - .)
 	ELFNOTE(Xen, XEN_ELFNOTE_FEATURES,       .ascii "!writable_page_tables")
 	ELFNOTE(Xen, XEN_ELFNOTE_PAE_MODE,       .asciz "yes")
 	ELFNOTE(Xen, XEN_ELFNOTE_L1_MFN_VALID,
@@ -109,7 +110,8 @@ SYM_CODE_END(xen_cpu_bringup_again)
 #else
 # define FEATURES_DOM0 0
 #endif
-	ELFNOTE(Xen, XEN_ELFNOTE_HYPERCALL_PAGE, _ASM_PTR hypercall_page)
+	ELFNOTE(Xen, XEN_ELFNOTE_HYPERCALL_PAGE, .globl xen_elfnote_hypercall_page;
+		xen_elfnote_hypercall_page: _ASM_PTR xen_elfnote_hypercall_page_offset - .)
 	ELFNOTE(Xen, XEN_ELFNOTE_SUPPORTED_FEATURES,
 		.long FEATURES_PV | FEATURES_PVH | FEATURES_DOM0)
 	ELFNOTE(Xen, XEN_ELFNOTE_LOADER,         .asciz "generic")
-- 
2.46.0.792.g87dc391469-goog


