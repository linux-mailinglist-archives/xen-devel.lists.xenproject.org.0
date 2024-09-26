Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD45E9871C5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:42:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805306.1216396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlwi-0004fO-1r; Thu, 26 Sep 2024 10:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805306.1216396; Thu, 26 Sep 2024 10:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlwh-0004d3-U7; Thu, 26 Sep 2024 10:42:03 +0000
Received: by outflank-mailman (input) for mailman id 805306;
 Thu, 26 Sep 2024 10:42:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9uic=QY=flex--ardb.bounces.google.com=3dzr1ZggKCf4gxjh+mozmuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@srs-se1.protection.inumbo.net>)
 id 1stlwg-0003NZ-Cu
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:42:02 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f59e4404-7bf3-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 12:42:00 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6e230808388so11262237b3.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:42:00 -0700 (PDT)
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
X-Inumbo-ID: f59e4404-7bf3-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727347319; x=1727952119; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wVQAOpFtZ+IFLD65Dag6PltLcshQiZuKZHS02xe9k5U=;
        b=xXQDoImyuZtfONSN9x+fiwECyckkWeZMLq0brxnJrcSU63eaEsipO0E6gDlbEkt+SH
         83pKvPu9K/4e1EDhgB++57q37vy8Zzw9tEIf7XUBiANSthrPmpq424WjsKlB03aSWkt7
         oUOkaLTeaZIEy0WZeCU+mk/p/8XgSdfuXI00KqKLx8NcBC4/FGn5vGx9rt/Psx+IltLG
         HhSMT44GogenNZioNYNIIBrUPlxdYlB1VvtBU4ivXz+I2bIJzXBAveGX5Qp4gwSNEVEI
         UzH3HUILNJqmP9kUHzn+4Pdi/m1RFugkzcSsOLDTV5BCGIoec7O5DIiph2oT7rdmcsqi
         Wayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347319; x=1727952119;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wVQAOpFtZ+IFLD65Dag6PltLcshQiZuKZHS02xe9k5U=;
        b=VNn6yvCbNJxHhCFCtmgml3cpiCEFwKpo5aWtsJcL6zXQeTk+atK+bP9OIy6X5rrjzU
         mDUUcMcViI4fIU0GSRpx7juvIosthOyTpkM78Kwp3vLAWBSD/xnsCg9/y3kJ+4cNrIha
         DbzdNvj4GzXBlN9TzEi9wSzDMNDPxlFpzh5kNoidzC4Iq4Hq/B5DJ4XnAehZ9iOXy1SB
         NooVhheIfozW7FDandfEvR3gNhAoPfoMJcMsI59WLBMO4sqb1j13qtarVeriHbz0P6PU
         xoWsoYCHKoR5IKPpvVnd8vLa3MThuXenPImRSe5DEmxartwIAMMFBo3EbhSPdCysjGCr
         ydrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvzv0mKkEjdY+Uj6IAgB2TRv8y2e3R/cnLiCsUXLOPtDXGCanpHyZLiFh6TGTSXZ6HdZ8xckCmP0o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywhqc+fVbC1tPUSWaGipfwtDRRc3GQW4Nmnhuqy2rGWjEfQ397S
	sRO/wQt4R7Vm4WiTQsgIbsP6CFeAyj9fsHZRm2fbRCV9IH3TaJvZ1xNC8nQN9AIYLbsN8w==
X-Google-Smtp-Source: AGHT+IGFqzFJ5DM6fuJFCR9nZvBpCXoaxNKegwYh6rQwKhd8Opr932KfMh+UgrKPITetFqVET84sn/lt
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:d85:b0:6db:e107:75a2 with SMTP id
 00721157ae682-6e21da5c761mr677017b3.4.1727347319432; Thu, 26 Sep 2024
 03:41:59 -0700 (PDT)
Date: Thu, 26 Sep 2024 12:41:18 +0200
In-Reply-To: <20240926104113.80146-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20240926104113.80146-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4265; i=ardb@kernel.org;
 h=from:subject; bh=V807GS2Tj3E3lwWN+K0J1jVOybFlVVUTSd+sKKD/vLg=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2rVcAFH7mbsx6l51p3OK/XkT7d39ii1zab++TUyPqe6
 dzqXu87SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwERMtjIy/Lorcfi/7fSyDmlr
 bgmlmHNfalct0FVotHljq82yv2j2Z4b/tTuXXZiuvNlx21qDp+Kncn/93HKUh2/Hq8SWB7kzTk5 nZQQA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240926104113.80146-11-ardb+git@google.com>
Subject: [PATCH 4/5] x86/xen: Avoid relocatable quantities in Xen ELF notes
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

While at it, switch to a 32-bit field for XEN_ELFNOTE_PHYS32_ENTRY,
which better matches the intent as well as the Xen documentation and
source code.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/vmlinux.lds.S | 12 ++++++++++++
 arch/x86/platform/pvh/head.S  |  6 +++---
 arch/x86/tools/relocs.c       |  1 +
 arch/x86/xen/xen-head.S       |  6 ++++--
 4 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 6e73403e874f..dce17afcc186 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -528,3 +528,15 @@ INIT_PER_CPU(irq_stack_backing_store);
 #endif
 
 #endif /* CONFIG_X86_64 */
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
diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 592747f2d731..e2ab4c74f596 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -52,7 +52,7 @@
 #define PVH_CS_SEL		(PVH_GDT_ENTRY_CS * 8)
 #define PVH_DS_SEL		(PVH_GDT_ENTRY_DS * 8)
 
-SYM_CODE_START_LOCAL(pvh_start_xen)
+SYM_CODE_START(pvh_start_xen)
 	UNWIND_HINT_END_OF_STACK
 	cld
 
@@ -299,5 +299,5 @@ SYM_DATA_END(pvh_level2_kernel_pgt)
 		     .long KERNEL_IMAGE_SIZE - 1)
 #endif
 
-	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY,
-	             _ASM_PTR (pvh_start_xen - __START_KERNEL_map))
+	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY, .global xen_elfnote_phys32_entry;
+		xen_elfnote_phys32_entry: .long xen_elfnote_phys32_entry_offset - .)
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
index 758bcd47b72d..3deaae3601f7 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -94,7 +94,8 @@ SYM_CODE_END(xen_cpu_bringup_again)
 	ELFNOTE(Xen, XEN_ELFNOTE_VIRT_BASE,      _ASM_PTR __START_KERNEL_map)
 	/* Map the p2m table to a 512GB-aligned user address. */
 	ELFNOTE(Xen, XEN_ELFNOTE_INIT_P2M,       .quad (PUD_SIZE * PTRS_PER_PUD))
-	ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          _ASM_PTR startup_xen)
+	ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          .globl xen_elfnote_entry;
+		xen_elfnote_entry: _ASM_PTR xen_elfnote_entry_offset - .)
 	ELFNOTE(Xen, XEN_ELFNOTE_FEATURES,       .ascii "!writable_page_tables")
 	ELFNOTE(Xen, XEN_ELFNOTE_PAE_MODE,       .asciz "yes")
 	ELFNOTE(Xen, XEN_ELFNOTE_L1_MFN_VALID,
@@ -115,7 +116,8 @@ SYM_CODE_END(xen_cpu_bringup_again)
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


