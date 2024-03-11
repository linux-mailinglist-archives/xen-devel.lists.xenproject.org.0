Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70574877C16
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:00:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691265.1077079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW5-0007hR-4M; Mon, 11 Mar 2024 09:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691265.1077079; Mon, 11 Mar 2024 09:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW4-0007aH-Mj; Mon, 11 Mar 2024 09:00:16 +0000
Received: by outflank-mailman (input) for mailman id 691265;
 Mon, 11 Mar 2024 09:00:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjbW3-0006iu-8G
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:00:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5c13633-df85-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 10:00:13 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 2A4544EE0C9C;
 Mon, 11 Mar 2024 10:00:13 +0100 (CET)
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
X-Inumbo-ID: c5c13633-df85-11ee-afdc-a90da7624cb6
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Subject: [XEN PATCH v3 05/16] xen/x86: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 11 Mar 2024 09:59:14 +0100
Message-Id: <dd042e7d17e7833e12a5ff6f28dd560b5ff02cf7.1710145041.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710145041.git.simone.ballarin@bugseng.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
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
Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>

---
Changes in v3:
- remove trailing underscores
- change inclusion guard name to adhere to the new standard
Changes in v2:
- remove extra blanks
- drop changes in C files

Note:
Changes in Makefile were not strictly necessary in v1 and a maintainer
asked to remove them since there was a deviation for generated headers.
Starting from v2, they are required since the deviation has been removed by
another patch of this series.
---
 xen/arch/x86/Makefile              | 10 ++++++----
 xen/arch/x86/cpu/cpu.h             |  5 +++++
 xen/arch/x86/x86_64/mmconfig.h     |  5 +++++
 xen/arch/x86/x86_emulate/private.h |  5 +++++
 4 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 26d8740529..4548cdc53d 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -258,18 +258,20 @@ $(obj)/asm-macros.i: CFLAGS-y += -P
 $(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefile
 	$(call filechk,asm-macros.h)
 
+ARCHDIR = $(shell echo $(SRCARCH) | tr a-z A-Z)
+
 define filechk_asm-macros.h
+    echo '#ifndef ASM_$(ARCHDIR)_ASM_MACROS_H'; \
+    echo '#define ASM_$(ARCHDIR)_ASM_MACROS_H'; \
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
+    echo '#endif /* ASM_$(ARCHDIR)_ASM_MACROS_H */'
 endef
 
 $(obj)/efi.lds: AFLAGS-y += -DEFI
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index e3d06278b3..b763cdf3da 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -1,3 +1,6 @@
+#ifndef XEN_ARCH_X86_CPU_CPU_H
+#define XEN_ARCH_X86_CPU_CPU_H
+
 /* attempt to consolidate cpu attributes */
 struct cpu_dev {
 	void		(*c_early_init)(struct cpuinfo_x86 *c);
@@ -24,3 +27,5 @@ void amd_init_lfence(struct cpuinfo_x86 *c);
 void amd_init_ssbd(const struct cpuinfo_x86 *c);
 void amd_init_spectral_chicken(void);
 void detect_zen2_null_seg_behaviour(void);
+
+#endif /* XEN_ARCH_X86_CPU_CPU_H */
diff --git a/xen/arch/x86/x86_64/mmconfig.h b/xen/arch/x86/x86_64/mmconfig.h
index 3da4b21e9b..c8e67a67db 100644
--- a/xen/arch/x86/x86_64/mmconfig.h
+++ b/xen/arch/x86/x86_64/mmconfig.h
@@ -5,6 +5,9 @@
  * Author: Allen Kay <allen.m.kay@intel.com> - adapted from linux
  */
 
+#ifndef XEN_ARCH_X86_X86_64_MMCONFIG_H
+#define XEN_ARCH_X86_X86_64_MMCONFIG_H
+
 #define PCI_DEVICE_ID_INTEL_E7520_MCH    0x3590
 #define PCI_DEVICE_ID_INTEL_82945G_HB    0x2770
 
@@ -72,3 +75,5 @@ int pci_mmcfg_reserved(uint64_t address, unsigned int segment,
 int pci_mmcfg_arch_init(void);
 int pci_mmcfg_arch_enable(unsigned int idx);
 void pci_mmcfg_arch_disable(unsigned int idx);
+
+#endif /* XEN_ARCH_X86_X86_64_MMCONFIG_H */
diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index 0fa26ba00a..835161cb53 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -6,6 +6,9 @@
  * Copyright (c) 2005-2007 XenSource Inc.
  */
 
+#ifndef XEN_ARCH_X86_X86_EMULATE_PRIVATE_H
+#define XEN_ARCH_X86_X86_EMULATE_PRIVATE_H
+
 #ifdef __XEN__
 
 # include <xen/bug.h>
@@ -836,3 +839,5 @@ static inline int read_ulong(enum x86_segment seg,
     *val = 0;
     return ops->read(seg, offset, val, bytes, ctxt);
 }
+
+#endif /* XEN_ARCH_X86_X86_EMULATE_PRIVATE_H */
-- 
2.34.1


