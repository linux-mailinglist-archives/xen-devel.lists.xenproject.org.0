Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF5379CC3C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:46:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600184.935835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzyr-0006Rh-0G; Tue, 12 Sep 2023 09:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600184.935835; Tue, 12 Sep 2023 09:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzyq-0006OZ-TY; Tue, 12 Sep 2023 09:46:48 +0000
Received: by outflank-mailman (input) for mailman id 600184;
 Tue, 12 Sep 2023 09:46:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qfzrA-0008Jk-Aw
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:38:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d2f9255-5150-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 11:38:49 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id CA0A24EE0745;
 Tue, 12 Sep 2023 11:38:48 +0200 (CEST)
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
X-Inumbo-ID: 2d2f9255-5150-11ee-9b0d-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 05/10] xen/x86: address violations of MISRA C:2012 Directive 4.10
Date: Tue, 12 Sep 2023 11:36:51 +0200
Message-Id: <d8b3bd5c2b1c5042c705c2f8ec89b26c417b2bda.1694510856.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694510856.git.simone.ballarin@bugseng.com>
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add or move inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Inclusion guards must appear at the beginning of the headers
(comments are permitted anywhere).

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Changes in v2:
- remove extra blanks
- drop changes in C files

Note:
Changes in Makefile were not strictly necessary in v1 and a maintainer
asked to removing them since there was a deviation for generated headers.
Now, in v2, they are required since the deviation has been removed by
another patch of this series.
---
 xen/arch/x86/Makefile              | 8 ++++----
 xen/arch/x86/cpu/cpu.h             | 5 +++++
 xen/arch/x86/x86_64/mmconfig.h     | 5 +++++
 xen/arch/x86/x86_emulate/private.h | 5 +++++
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index f3abdf9cd1..40d0cb76af 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -260,17 +260,17 @@ $(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefil
 	$(call filechk,asm-macros.h)
 
 define filechk_asm-macros.h
+    echo '#ifndef __ASM_MACROS_H__'; \
+    echo '#define __ASM_MACROS_H__'; \
     echo '#if 0'; \
     echo '.if 0'; \
     echo '#endif'; \
-    echo '#ifndef __ASM_MACROS_H__'; \
-    echo '#define __ASM_MACROS_H__'; \
     echo 'asm ( ".include \"$@\"" );'; \
-    echo '#endif /* __ASM_MACROS_H__ */'; \
     echo '#if 0'; \
     echo '.endif'; \
     cat $<; \
-    echo '#endif'
+    echo '#endif'; \
+    echo '#endif /* __ASM_MACROS_H__ */'
 endef
 
 $(obj)/efi.lds: AFLAGS-y += -DEFI
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index e3d06278b3..95939c7fb6 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -1,3 +1,6 @@
+#ifndef __X86_CPU_CPU_H__
+#define __X86_CPU_CPU_H__
+
 /* attempt to consolidate cpu attributes */
 struct cpu_dev {
 	void		(*c_early_init)(struct cpuinfo_x86 *c);
@@ -24,3 +27,5 @@ void amd_init_lfence(struct cpuinfo_x86 *c);
 void amd_init_ssbd(const struct cpuinfo_x86 *c);
 void amd_init_spectral_chicken(void);
 void detect_zen2_null_seg_behaviour(void);
+
+#endif /* __X86_CPU_CPU_H__ */
diff --git a/xen/arch/x86/x86_64/mmconfig.h b/xen/arch/x86/x86_64/mmconfig.h
index 2d49fc79a0..c562879c76 100644
--- a/xen/arch/x86/x86_64/mmconfig.h
+++ b/xen/arch/x86/x86_64/mmconfig.h
@@ -5,6 +5,9 @@
  * Author: Allen Kay <allen.m.kay@intel.com> - adapted from linux
  */
 
+#ifndef __X86_X86_64_MMCONFIG_H__
+#define __X86_X86_64_MMCONFIG_H__
+
 #define PCI_DEVICE_ID_INTEL_E7520_MCH    0x3590
 #define PCI_DEVICE_ID_INTEL_82945G_HB    0x2770
 
@@ -72,3 +75,5 @@ int pci_mmcfg_reserved(uint64_t address, unsigned int segment,
 int pci_mmcfg_arch_init(void);
 int pci_mmcfg_arch_enable(unsigned int);
 void pci_mmcfg_arch_disable(unsigned int);
+
+#endif /* __X86_X86_64_MMCONFIG_H__ */
diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index 719dad59cd..ffa134f297 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -6,6 +6,9 @@
  * Copyright (c) 2005-2007 XenSource Inc.
  */
 
+#ifndef __X86_X86_EMULATE_PRIVATE_H__
+#define __X86_X86_EMULATE_PRIVATE_H__
+
 #ifdef __XEN__
 
 # include <xen/kernel.h>
@@ -831,3 +834,5 @@ static inline int read_ulong(enum x86_segment seg,
     *val = 0;
     return ops->read(seg, offset, val, bytes, ctxt);
 }
+
+#endif /* __X86_X86_EMULATE_PRIVATE_H__ */
-- 
2.34.1


