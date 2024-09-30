Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E7E989B24
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 09:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807025.1218217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAd9-0000Om-7w; Mon, 30 Sep 2024 07:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807025.1218217; Mon, 30 Sep 2024 07:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAd9-0000Ki-1D; Mon, 30 Sep 2024 07:15:39 +0000
Received: by outflank-mailman (input) for mailman id 807025;
 Mon, 30 Sep 2024 07:15:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PyMv=Q4=flex--ardb.bounces.google.com=3F1D6ZggKCd4ARDB+GITGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@srs-se1.protection.inumbo.net>)
 id 1svAd7-0007Ms-Re
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 07:15:37 +0000
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [2607:f8b0:4864:20::1149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9986869-7efb-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 09:15:36 +0200 (CEST)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-6e230808455so46533497b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 00:15:36 -0700 (PDT)
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
X-Inumbo-ID: c9986869-7efb-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727680535; x=1728285335; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DZtPdBpJzFal/ae5MZUqryOcfcvj4AQCvP+gm4JqXyM=;
        b=1AwIC3WnnFbVVYMPx3Kw4KMsnwaOe8HG2mN6w65iaenrUTQR/RJZ3j1OWhEx0caWAZ
         QWtub4dE9WNVesdzsn+TFkndyF0DtzroKtrkqkJPknhf6zjASl6G4psJgdSqJT0twCD+
         x69b6b/zyliJ+n7cYch31QEgohLI3NMHFi3o9K/tAzW2vZMjSg4bFn3J0Klp+LBiASoO
         LkuerJ4/+ejDDrI9QNEQCq3But5K4iOyjoQs5ZeWVgAMV/hz1v/XpyAHO0NB7lxHjQM5
         25CYRk8jMkttFNlchEb4enFdHfP8Vp9gWfnSdF7jciHCOyv0QS4/pUQbWI71skdD+OLp
         XFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727680535; x=1728285335;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZtPdBpJzFal/ae5MZUqryOcfcvj4AQCvP+gm4JqXyM=;
        b=mAQD+w1gBQmDYVLm0685NJdJ7qnBuQ7vImk09TCi4AnE5opp6pygs8IpcOWI2PKEUF
         IkPwABk14jDXoqz5gMNazgm/UlWsCR0C3ikzp2VCauprgjG42zUXrNDiXhnyHTHMT0Dk
         EN92vN957gG585/Xel5EM+GfLrD08WTPJe55zpZL3fZqTjJnsieFY77/FJ7va7ov7/Xz
         VkC+iFspv5yTGMuDtqGClkKFtJL1DG61T8xcWzDoLHPAY+17WTrnttSXVXO0soHhEHmX
         xegs/H3UV2W4qSQRZnDEJ8UaGHdYsZC735AQQYe+7PbYCbN4UNFhs+kTnW415lnE59TO
         TYmA==
X-Forwarded-Encrypted: i=1; AJvYcCUZPIGRlAHcQJ3DQA7iv6eT4/HY+VDszdxw12dKaCE6r/miCHR68oAJCDTh17awnj6+FsPCNRJfLbs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygQGOZxVlCwEszKIiya9lzR4lsg/o0lagBfmxVCEg3EYCgicG2
	QuOvMfyXthVx2gWKjSfXWsrqKlN+GaFlDSInh4ICp1DfAImhAj+nYcNDopjt3GQTEc3nlw==
X-Google-Smtp-Source: AGHT+IFWZtuu+KunSwgcCbh6Ve5BV0dLmNWi2x2HkYFqhNpsABPu4rTN3FrGFoGmcbxLj6A3YyOTzKqH
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:d045:0:b0:dfb:22ca:1efd with SMTP id
 3f1490d57ef6-e2604b828c6mr119309276.9.1727680535050; Mon, 30 Sep 2024
 00:15:35 -0700 (PDT)
Date: Mon, 30 Sep 2024 09:15:18 +0200
In-Reply-To: <20240930071513.909462-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20240930071513.909462-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4140; i=ardb@kernel.org;
 h=from:subject; bh=eRJBFQWOqzRm644YDaD03sEDODYtOLqKPjomM9zMcVo=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe1XAPuhF2t5+zhSPgu3tTyOidS9aCBp1+yrcNT4n/r00
 JmnTes7SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEQubGVkmJV+Ys/d2PLAmsCY
 qVKPXi7e52T1MUgu5MSrXwo3Q45OSWFk+F3/bv+942nVjqavFqjqp8r0qphbWB66/EGiOXxZ6qO DLAA=
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240930071513.909462-11-ardb+git@google.com>
Subject: [PATCH v2 4/5] x86/xen: Avoid relocatable quantities in Xen ELF notes
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

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/vmlinux.lds.S | 13 +++++++++++++
 arch/x86/platform/pvh/head.S  |  6 +++---
 arch/x86/tools/relocs.c       |  1 +
 arch/x86/xen/xen-head.S       |  6 ++++--
 4 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 6726be89b7a6..2b7c8c14c6fd 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -527,3 +527,16 @@ INIT_PER_CPU(irq_stack_backing_store);
 #endif
 
 #endif /* CONFIG_X86_64 */
+
+#ifdef CONFIG_XEN
+#ifdef CONFIG_XEN_PV
+xen_elfnote_entry_offset =
+	ABSOLUTE(xen_elfnote_entry) + ABSOLUTE(startup_xen);
+#endif
+xen_elfnote_hypercall_page_offset =
+	ABSOLUTE(xen_elfnote_hypercall_page) + ABSOLUTE(hypercall_page);
+#endif
+#ifdef CONFIG_PVH
+xen_elfnote_phys32_entry_offset =
+	ABSOLUTE(xen_elfnote_phys32_entry) + ABSOLUTE(pvh_start_xen - LOAD_OFFSET);
+#endif
diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 7ca51a4da217..2b0d887e0872 100644
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
+		xen_elfnote_phys32_entry: _ASM_PTR xen_elfnote_phys32_entry_offset - .)
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
2.46.1.824.gd892dcdcdd-goog


