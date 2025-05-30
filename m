Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8298FAC8FB3
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000934.1381150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzdG-0000xj-AK; Fri, 30 May 2025 13:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000934.1381150; Fri, 30 May 2025 13:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzdG-0000u4-61; Fri, 30 May 2025 13:18:46 +0000
Received: by outflank-mailman (input) for mailman id 1000934;
 Fri, 30 May 2025 13:18:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKzdE-0000ql-Fr
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:18:44 +0000
Received: from 3.mo575.mail-out.ovh.net (3.mo575.mail-out.ovh.net
 [46.105.58.60]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b4d507d-3d58-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 15:18:42 +0200 (CEST)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.2.206])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4b83hx5zZRz28B8
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:18:41 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-2djnr (unknown [10.111.174.16])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9CD20C3BB2;
 Fri, 30 May 2025 13:18:40 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.107])
 by ghost-submission-5b5ff79f4f-2djnr with ESMTPSA
 id B0t9EzCwOWhgJgAAIK2ldA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:18:40 +0000
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
X-Inumbo-ID: 9b4d507d-3d58-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-107S001d1b71519-d27e-408c-8523-b9c0e2d47a6d,
                    A4E380CC922F0B59227EC5DCC46884561651840B) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v3 04/22] x86/boot/slaunch-early: implement early initialization
Date: Fri, 30 May 2025 16:17:46 +0300
Message-ID: <16a544876163afece619d50f80869aaacc9c797c.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12695928826315977884
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepffejgfduveektedugeeuiefhtdfhjefgieelkeeugfeggedtgeevheefheeffeeunecuffhomhgrihhnpegsrghsvgdrmhgrphdphhgvrggurdhssgenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekgedrvddvuddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehjeehmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=GvKdVlecLh2PmzTm3hSectebiIzksYZuaxKe05SsphE=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611121; v=1;
 b=YWF4HxQni853VwJ2/M7u7AJUwzUCW2rBUmmo7Iil0Sb4T6MHZdZcw+7Cdx9bGPsaHT9sRnBf
 iKX3omW9+HJ4/rCPVZdIcPc6in7tDPmWlRrzwDBjLRMJFGpU74UwIXTt4P5cUciJ+es+am0T0Rd
 JIDga3+IqfphDU98v6vXoNkMyi7E0pS+ioytkxiVt+gTga1fEcZE9zF+lyCgvBrR7NZy69qv5OD
 84hP29LLpnp69wfRFOGetK/fy0vAu0XW7VvDBE8dd3Dfx9Y2jTbHXRt1rJgHvjBKiBMOeitzg48
 I/QBz1ndITA+URa6BbRvKpdpDMTUMKZKEvCJACaq/n6rA==

Make head.S invoke a C function to retrieve MBI and SLRT addresses in a
platform-specific way.  This is also the place to perform sanity checks
of DRTM.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/Makefile                |  1 +
 xen/arch/x86/boot/Makefile           |  5 +++-
 xen/arch/x86/boot/head.S             | 43 ++++++++++++++++++++++++++++
 xen/arch/x86/boot/slaunch-early.c    | 41 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/intel-txt.h | 16 +++++++++++
 xen/arch/x86/include/asm/slaunch.h   | 26 +++++++++++++++++
 xen/arch/x86/slaunch.c               | 27 +++++++++++++++++
 7 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/x86/boot/slaunch-early.c
 create mode 100644 xen/arch/x86/include/asm/slaunch.h
 create mode 100644 xen/arch/x86/slaunch.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index ce724a9daa..aa20eb42b5 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_COMPAT) += x86_64/physdev.o
 obj-$(CONFIG_X86_PSR) += psr.o
 obj-y += setup.o
 obj-y += shutdown.o
+obj-y += slaunch.o
 obj-y += smp.o
 obj-y += smpboot.o
 obj-y += spec_ctrl.o
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index ff0d61d7ac..5471b966dd 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -5,6 +5,7 @@ obj-bin-y += $(obj64)
 obj32 := cmdline.32.o
 obj32 += reloc.32.o
 obj32 += reloc-trampoline.32.o
+obj32 += slaunch-early.32.o
 
 obj64 := reloc-trampoline.o
 
@@ -28,6 +29,8 @@ $(obj32): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
 $(obj)/%.32.o: $(src)/%.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
+$(obj)/slaunch-early.32.o: XEN_CFLAGS += -D__EARLY_SLAUNCH__
+
 orphan-handling-$(call ld-option,--orphan-handling=error) := --orphan-handling=error
 LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
 LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
@@ -81,7 +84,7 @@ cmd_combine = \
               --bin1      $(obj)/built-in-32.base.bin \
               --bin2      $(obj)/built-in-32.offset.bin \
               --map       $(obj)/built-in-32.base.map \
-              --exports   cmdline_parse_early,reloc,reloc_trampoline32 \
+              --exports   cmdline_parse_early,reloc,reloc_trampoline32,slaunch_early_init \
               --output    $@
 
 targets += built-in-32.S
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index a69107bd81..b4cf423c80 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -472,6 +472,10 @@ __start:
         /* Bootloaders may set multiboot{1,2}.mem_lower to a nonzero value. */
         xor     %edx,%edx
 
+        /* Check for TrenchBoot slaunch bootloader. */
+        cmp     $SLAUNCH_BOOTLOADER_MAGIC, %eax
+        je      .Lslaunch_proto
+
         /* Check for Multiboot2 bootloader. */
         cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
         je      .Lmultiboot2_proto
@@ -487,6 +491,45 @@ __start:
         cmovnz  MB_mem_lower(%ebx),%edx
         jmp     trampoline_bios_setup
 
+.Lslaunch_proto:
+        /*
+         * Upon reaching here, CPU state mostly matches the one setup by the
+         * bootloader with ESP, ESI and EDX being clobbered above.
+         */
+
+        /* Save information that TrenchBoot slaunch was used. */
+        movb    $1, sym_esi(slaunch_active)
+
+        /*
+         * Prepare space for output parameter of slaunch_early_init(), which is
+         * a structure of two uint32_t fields.
+         */
+        sub     $8, %esp
+
+        push    %esp                             /* pointer to output structure */
+        lea     sym_offs(__2M_rwdata_end), %ecx  /* end of target image */
+        lea     sym_offs(_start), %edx           /* target base address */
+        mov     %esi, %eax                       /* load base address */
+        /*
+         * slaunch_early_init(load/eax, tgt/edx, tgt_end/ecx, ret/stk) using
+         * fastcall calling convention.
+         */
+        call    slaunch_early_init
+        add     $4, %esp                         /* pop the fourth parameter */
+
+        /* Move outputs of slaunch_early_init() from stack into registers. */
+        pop     %eax  /* physical MBI address */
+        pop     %edx  /* physical SLRT address */
+
+        /* Save physical address of SLRT for C code. */
+        mov     %edx, sym_esi(slaunch_slrt)
+
+        /* Store MBI address in EBX where MB2 code expects it. */
+        mov     %eax, %ebx
+
+        /* Move magic number expected by Multiboot 2 to EAX and fall through. */
+        movl    $MULTIBOOT2_BOOTLOADER_MAGIC, %eax
+
 .Lmultiboot2_proto:
         /* Skip Multiboot2 information fixed part. */
         lea     (MB2_fixed_sizeof+MULTIBOOT2_TAG_ALIGN-1)(%ebx),%ecx
diff --git a/xen/arch/x86/boot/slaunch-early.c b/xen/arch/x86/boot/slaunch-early.c
new file mode 100644
index 0000000000..c9d364bcd5
--- /dev/null
+++ b/xen/arch/x86/boot/slaunch-early.c
@@ -0,0 +1,41 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
+ */
+
+#include <xen/slr-table.h>
+#include <xen/types.h>
+#include <asm/intel-txt.h>
+
+struct early_init_results
+{
+    uint32_t mbi_pa;
+    uint32_t slrt_pa;
+} __packed;
+
+void asmlinkage slaunch_early_init(uint32_t load_base_addr,
+                                   uint32_t tgt_base_addr,
+                                   uint32_t tgt_end_addr,
+                                   struct early_init_results *result)
+{
+    void *txt_heap;
+    const struct txt_os_mle_data *os_mle;
+    const struct slr_table *slrt;
+    const struct slr_entry_intel_info *intel_info;
+
+    txt_heap = txt_init();
+    os_mle = txt_os_mle_data_start(txt_heap);
+
+    result->slrt_pa = os_mle->slrt;
+    result->mbi_pa = 0;
+
+    slrt = (const struct slr_table *)(uintptr_t)os_mle->slrt;
+
+    intel_info = (const struct slr_entry_intel_info *)
+        slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
+    if ( intel_info == NULL || intel_info->hdr.size != sizeof(*intel_info) )
+        return;
+
+    result->mbi_pa = intel_info->boot_params_base;
+}
diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index cc2d312f4d..7658457e9d 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -292,6 +292,22 @@ static inline void *txt_sinit_mle_data_start(const void *heap)
            sizeof(uint64_t);
 }
 
+static inline void *txt_init(void)
+{
+    void *txt_heap;
+
+    /* Clear the TXT error register for a clean start of the day. */
+    txt_write(TXTCR_ERRORCODE, 0);
+
+    txt_heap = _p(txt_read(TXTCR_HEAP_BASE));
+
+    if ( txt_os_mle_data_size(txt_heap) < sizeof(struct txt_os_mle_data) ||
+         txt_os_sinit_data_size(txt_heap) < sizeof(struct txt_os_sinit_data) )
+        txt_reset(SLAUNCH_ERROR_GENERIC);
+
+    return txt_heap;
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* X86_INTEL_TXT_H */
diff --git a/xen/arch/x86/include/asm/slaunch.h b/xen/arch/x86/include/asm/slaunch.h
new file mode 100644
index 0000000000..df42defd92
--- /dev/null
+++ b/xen/arch/x86/include/asm/slaunch.h
@@ -0,0 +1,26 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
+ */
+
+#ifndef X86_SLAUNCH_H
+#define X86_SLAUNCH_H
+
+#include <xen/types.h>
+
+/* Indicates an active Secure Launch boot. */
+extern bool slaunch_active;
+
+/*
+ * Holds physical address of SLRT.  Use slaunch_get_slrt() to access SLRT
+ * instead of mapping where this points to.
+ */
+extern uint32_t slaunch_slrt;
+
+/*
+ * Retrieves pointer to SLRT.  Checks table's validity and maps it as necessary.
+ */
+struct slr_table *slaunch_get_slrt(void);
+
+#endif /* X86_SLAUNCH_H */
diff --git a/xen/arch/x86/slaunch.c b/xen/arch/x86/slaunch.c
new file mode 100644
index 0000000000..a3e6ab8d71
--- /dev/null
+++ b/xen/arch/x86/slaunch.c
@@ -0,0 +1,27 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
+ */
+
+#include <xen/compiler.h>
+#include <xen/init.h>
+#include <xen/macros.h>
+#include <xen/types.h>
+#include <asm/slaunch.h>
+
+/*
+ * These variables are assigned to by the code near Xen's entry point.
+ *
+ * slaunch_active is not __initdata to allow checking for an active Secure
+ * Launch boot.
+ */
+bool slaunch_active;
+uint32_t __initdata slaunch_slrt; /* physical address */
+
+/* Using slaunch_active in head.S assumes it's a single byte in size, so enforce
+ * this assumption. */
+static void __maybe_unused compile_time_checks(void)
+{
+    BUILD_BUG_ON(sizeof(slaunch_active) != 1);
+}
-- 
2.49.0


