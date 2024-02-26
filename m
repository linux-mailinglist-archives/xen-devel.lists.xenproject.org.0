Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 096718678C3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 15:38:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685582.1066531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rec7U-0004PW-4A; Mon, 26 Feb 2024 14:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685582.1066531; Mon, 26 Feb 2024 14:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rec7T-0004Ng-Vi; Mon, 26 Feb 2024 14:38:15 +0000
Received: by outflank-mailman (input) for mailman id 685582;
 Mon, 26 Feb 2024 14:38:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vKMM=KD=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1rec7S-0003yd-TM
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 14:38:14 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aad8289b-d4b4-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 15:38:13 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1dc49b00bdbso26417105ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 06:38:13 -0800 (PST)
Received: from localhost ([198.11.176.14]) by smtp.gmail.com with ESMTPSA id
 d3-20020a170903230300b001d9edac54b1sm4015055plh.171.2024.02.26.06.38.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Feb 2024 06:38:11 -0800 (PST)
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
X-Inumbo-ID: aad8289b-d4b4-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708958291; x=1709563091; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gfvWhFbgTyzu48YJx+Ed8XWBq6XxX8rbNsTiG4trvc=;
        b=NWr8iBgzMx6GwoNN1MlI7HCe9dO04ZwaAKjtznu6PrYRna7SSUs9pZTmNLB2Fgt4RO
         O9iaQCEDRsWITgj5E99SzcSrc9HHIVCJ9b6NXkiXOvaCzseuRMzoLzb7CTKIWYvk+kbe
         4f8pBvvOC4ocpt4A5a4WxzFvraDS1hPp/J591/cdv3NSL0YPlPUKhHN/SI/wOQvY1RzS
         oqWAK9XNgp5mhrQpzYH6ng7it0KqQwV01/kPQ0GzZo9ia9y3tYd0Vl7eCxloBHI8oJXR
         grUiPyDpcUV17JoOxSNF3DWKei5BA8iCr2C4fx9+OSL8kTsBb3Ro4EuqDdzKu0Od825m
         OZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708958291; x=1709563091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gfvWhFbgTyzu48YJx+Ed8XWBq6XxX8rbNsTiG4trvc=;
        b=VHpDVJaKsh1P4KYOuVEFEP1hnZJJ8DJwUu9AGd6nlJdu+gCNRXKfa+rl724Lien7x4
         1v3qBHeYFPnrPb3WdzGOD9FSI3mpzLode6N4E96jq6faWW+KA+aeGE7mqjy0PkxDnahQ
         227c9pyakRdzA/afb4w4Xb2MeCGbFQ03IGpOl8MYPhijtMcnedCNkKaLts5gyoCqL5GL
         CJZIKhCJsYKjqbrYxeQHVs8GPNFPG9guChL6E4yIMjBZ5a8eyeMkZvyC+rlQm/KvJvVw
         btzMR+xkkR5RArKoPdyaewRJGNLLSxfGioRC8yN1oQDbyJjcxqM7RpNFwoeNZ3ldnzYg
         +pxg==
X-Forwarded-Encrypted: i=1; AJvYcCU7DobnMkrjlGyfbPWBGkWbMNCV6JgIJt/uk5sQwS15DAE+/Qu7SGjd388ivxhuQtCTD7r6MMsOYHgYv8d3yROCimfHV+zWo6KAw1E1/O0=
X-Gm-Message-State: AOJu0Ywa8iPQYTUYm9J4iN2E3FlTqkS81qcSyIAqaS/W9/vZ4KlXDUld
	Hj/Bx+qE96xUs62tuAfdlhGwe8i2Y7DfTlyg2vNcNShaIceADXWj
X-Google-Smtp-Source: AGHT+IEIutnYKn12v5tvNLy/G9rTRg1goq2sEiyOH6n7oCM/wCUKEcvtJKvKWrDR0plMg8cjveFEyw==
X-Received: by 2002:a17:902:8349:b0:1dc:1fda:202e with SMTP id z9-20020a170902834900b001dc1fda202emr6685293pln.51.1708958291395;
        Mon, 26 Feb 2024 06:38:11 -0800 (PST)
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
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Darren Hart <dvhart@infradead.org>,
	Andy Shevchenko <andy@infradead.org>,
	xen-devel@lists.xenproject.org,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 56/73] x86/pvm: Relocate kernel image early in PVH entry
Date: Mon, 26 Feb 2024 22:36:13 +0800
Message-Id: <20240226143630.33643-57-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20240226143630.33643-1-jiangshanlai@gmail.com>
References: <20240226143630.33643-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hou Wenlong <houwenlong.hwl@antgroup.com>

For a PIE kernel, it runs in a high virtual address in the PVH entry, so
it needs to relocate the kernel image early in the PVH entry for the PVM
guest.

Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>
---
 arch/x86/include/asm/init.h       |  5 +++++
 arch/x86/kernel/head64_identity.c |  5 -----
 arch/x86/platform/pvh/enlighten.c | 22 ++++++++++++++++++++++
 arch/x86/platform/pvh/head.S      |  4 ++++
 4 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/init.h b/arch/x86/include/asm/init.h
index cc9ccf61b6bd..f78edef60253 100644
--- a/arch/x86/include/asm/init.h
+++ b/arch/x86/include/asm/init.h
@@ -4,6 +4,11 @@
 
 #define __head	__section(".head.text")
 
+#define SYM_ABS_VA(sym) ({					\
+	unsigned long __v;					\
+	asm("movabsq $" __stringify(sym) ", %0":"=r"(__v));	\
+	__v; })
+
 struct x86_mapping_info {
 	void *(*alloc_pgt_page)(void *); /* allocate buf for page table */
 	void *context;			 /* context for alloc_pgt_page */
diff --git a/arch/x86/kernel/head64_identity.c b/arch/x86/kernel/head64_identity.c
index 4e6a073d9e6c..f69f9904003c 100644
--- a/arch/x86/kernel/head64_identity.c
+++ b/arch/x86/kernel/head64_identity.c
@@ -82,11 +82,6 @@ static void __head set_kernel_map_base(unsigned long text_base)
 }
 #endif
 
-#define SYM_ABS_VA(sym) ({					\
-	unsigned long __v;					\
-	asm("movabsq $" __stringify(sym) ", %0":"=r"(__v));	\
-	__v; })
-
 static unsigned long __head sme_postprocess_startup(struct boot_params *bp, pmdval_t *pmd)
 {
 	unsigned long vaddr, vaddr_end;
diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
index 00a92cb2c814..8c64c31c971b 100644
--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/acpi.h>
+#include <linux/pgtable.h>
 
 #include <xen/hvc-console.h>
 
+#include <asm/init.h>
 #include <asm/io_apic.h>
 #include <asm/hypervisor.h>
 #include <asm/e820/api.h>
@@ -113,6 +115,26 @@ static void __init hypervisor_specific_init(bool xen_guest)
 		xen_pvh_init(&pvh_bootparams);
 }
 
+#ifdef CONFIG_PVM_GUEST
+void pvm_relocate_kernel(unsigned long physbase);
+
+void __init pvm_update_pgtable(unsigned long physbase)
+{
+	pgdval_t *pgd;
+	pudval_t *pud;
+	unsigned long base;
+
+	pvm_relocate_kernel(physbase);
+
+	pgd = (pgdval_t *)init_top_pgt;
+	base = SYM_ABS_VA(_text);
+	pgd[pgd_index(base)] = pgd[0];
+	pgd[pgd_index(page_offset_base)] = pgd[0];
+	pud = (pudval_t *)level3_ident_pgt;
+	pud[pud_index(base)] = (unsigned long)level2_ident_pgt + _KERNPG_TABLE_NOENC;
+}
+#endif
+
 /*
  * This routine (and those that it might call) should not use
  * anything that lives in .bss since that segment will be cleared later.
diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index baaa3fe34a00..127f297f7257 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -109,6 +109,10 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	wrmsr
 
 #ifdef CONFIG_X86_PIE
+#ifdef CONFIG_PVM_GUEST
+	leaq	_text(%rip), %rdi
+	call	pvm_update_pgtable
+#endif
 	movabs  $2f, %rax
 	ANNOTATE_RETPOLINE_SAFE
 	jmp *%rax
-- 
2.19.1.6.gb485710b


