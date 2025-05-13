Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E109AB5ABB
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:06:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983187.1369566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt5S-0004j3-Ke; Tue, 13 May 2025 17:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983187.1369566; Tue, 13 May 2025 17:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt5S-0004gi-GE; Tue, 13 May 2025 17:06:38 +0000
Received: by outflank-mailman (input) for mailman id 983187;
 Tue, 13 May 2025 17:06:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvFL=X5=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uEt5Q-0003Uz-Up
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:06:36 +0000
Received: from 5.mo576.mail-out.ovh.net (5.mo576.mail-out.ovh.net
 [46.105.43.105]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f880fff-301c-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 19:06:34 +0200 (CEST)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.25.209])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4ZxjYj6W4pz27TK
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 17:06:33 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-q2zpp (unknown [10.111.182.135])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 60E7C1FE55;
 Tue, 13 May 2025 17:06:32 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-q2zpp with ESMTPSA
 id P1daARh8I2hSAAAAOMNtBw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 13 May 2025 17:06:32 +0000
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
X-Inumbo-ID: 9f880fff-301c-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-113S0075f9b7bdb-4fc0-4d16-a0e3-1c660f845f6a,
                    0F27B6D195039ACFBDF5EC7F2AC12BEA7E98F15C) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v2 04/22] x86/boot/slaunch-early: implement early initialization
Date: Tue, 13 May 2025 20:05:41 +0300
Message-ID: <ae8391faf036f7c0101f738c27a571edd5fb452e.1747155790.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8942178535177106588
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeffjefgudevkeetudegueeihfdthfejgfeileekuefggeegtdegveehfeehfeefueenucffohhmrghinhepsggrshgvrdhmrghppdhhvggrugdrshgsnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejiegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=1WE6obMWuo+KNg7UZQNZPIN6Phqk/WygHa2bFXNKWVc=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747155993; v=1;
 b=N6Rl8NbzfyJPvSMlKRuqEMHO2g8ebYlqYv78YFsBuxZwNDav4/8ngZTWaX2kmP/IPx9QBvGl
 4p1Ad+2UjqglgeDsyo8e9GWShfOwE/dWL4jbjid6f8m4+nDuaZgryfvonrpvTHasKloLYYKWQcu
 fBYmlL6LnNWn5UkRL/sqscDX7ztfwyU4DIGEGZVUxDLJ71EncWlcxlp+VQvTzGh5Pza07j8FL1a
 ew23EXbIKI2g6gzwUjRRpVrFsC9F6/FwQkppHGMU6mVOuLL3OFEKszK4UAfdoLoGF0Qco19r3tw
 +W26YWW6xkg0w6wBk3Kml3sw+q7KViKEDoFYSFglplZug==

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
index bedb97cbee..43a80be458 100644
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
index 0000000000..48776ef559
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
+    struct txt_os_mle_data *os_mle;
+    struct slr_table *slrt;
+    struct slr_entry_intel_info *intel_info;
+
+    txt_heap = txt_init();
+    os_mle = txt_os_mle_data_start(txt_heap);
+
+    result->slrt_pa = os_mle->slrt;
+    result->mbi_pa = 0;
+
+    slrt = (struct slr_table *)(uintptr_t)os_mle->slrt;
+
+    intel_info = (struct slr_entry_intel_info *)
+        slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
+    if ( intel_info == NULL || intel_info->hdr.size != sizeof(*intel_info) )
+        return;
+
+    result->mbi_pa = intel_info->boot_params_base;
+}
diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index 07be43f557..7a665b7cc3 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -272,6 +272,22 @@ static inline void *txt_sinit_mle_data_start(void *heap)
         sizeof(uint64_t);
 }
 
+static inline void *txt_init(void)
+{
+    void *txt_heap;
+
+    /* Clear the TXT error register for a clean start of the day. */
+    write_txt_reg(TXTCR_ERRORCODE, 0);
+
+    txt_heap = _p(read_txt_reg(TXTCR_HEAP_BASE));
+
+    if ( txt_os_mle_data_size(txt_heap) < sizeof(struct txt_os_mle_data) ||
+         txt_os_sinit_data_size(txt_heap) < sizeof(struct txt_os_sinit_data) )
+        txt_reset(SLAUNCH_ERROR_GENERIC);
+
+    return txt_heap;
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* ASM__X86__INTEL_TXT_H */
diff --git a/xen/arch/x86/include/asm/slaunch.h b/xen/arch/x86/include/asm/slaunch.h
new file mode 100644
index 0000000000..3fc5f00073
--- /dev/null
+++ b/xen/arch/x86/include/asm/slaunch.h
@@ -0,0 +1,26 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
+ */
+
+#ifndef ASM__X86__SLAUNCH_H
+#define ASM__X86__SLAUNCH_H
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
+#endif /* ASM__X86__SLAUNCH_H */
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


