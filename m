Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8C7939C5A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 10:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762681.1172933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAgX-0000uf-SA; Tue, 23 Jul 2024 08:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762681.1172933; Tue, 23 Jul 2024 08:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAgX-0000rP-Mr; Tue, 23 Jul 2024 08:15:49 +0000
Received: by outflank-mailman (input) for mailman id 762681;
 Tue, 23 Jul 2024 08:15:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0IL=OX=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sWAgV-0008AN-E6
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 08:15:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c37ed557-48cb-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 10:15:46 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-35-51-193.retail.telecomitalia.it [79.35.51.193])
 by support.bugseng.com (Postfix) with ESMTPSA id 0A11F4EE073F;
 Tue, 23 Jul 2024 10:15:44 +0200 (CEST)
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
X-Inumbo-ID: c37ed557-48cb-11ef-bbfe-fd08da9f4363
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [XEN PATCH v5 05/17] xen/x86: address violations of MISRA C:2012 Directive 4.10
Date: Tue, 23 Jul 2024 10:14:57 +0200
Message-Id: <4395577d2a07f6edaebbef937cb96028bb92de31.1721720583.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simone Ballarin <simone.ballarin@bugseng.com>

Add or move inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Inclusion guards must appear at the beginning of the headers
(comments are permitted anywhere).

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

---
Changes in v5:
- remove hard tab that slipped in the makefile
- edit inclusion guards and makefile
Changes in v4:
- modified inclusion guards and makefile.
Changes in v3:
- remove trailing underscores
- change inclusion guard name to adhere to the new standard
Changes in v2:
- remove extra blanks
- drop changes in C files

Note:
Changes in Makefile were not strictly necessary in v1 and a maintainer
asked to removing them since there was a deviation for generated headers.
Now, in v2, they are required since the deviation has been removed by
another patch of this series.
---
 xen/arch/x86/Makefile              | 9 +++++----
 xen/arch/x86/cpu/cpu.h             | 5 +++++
 xen/arch/x86/x86_64/mmconfig.h     | 5 +++++
 xen/arch/x86/x86_emulate/private.h | 5 +++++
 4 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index d902fb7acc..31197dfd96 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -260,17 +260,18 @@ $(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefil
 	$(call filechk,asm-macros.h)
 
 define filechk_asm-macros.h
+    guard=$$(echo ASM__${SRCARCH}__ASM_MACROS_H | tr a-z A-Z);  \
+    echo '#ifndef $$guard'; \
+    echo '#define $$guard'; \
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
+    echo '#endif /* $$guard */'
 endef
 
 $(obj)/efi.lds: AFLAGS-y += -DEFI
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index 8be65e975a..8e52f24e10 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -1,3 +1,6 @@
+#ifndef X86__CPU__CPU_H
+#define X86__CPU__CPU_H
+
 /* attempt to consolidate cpu attributes */
 struct cpu_dev {
 	void		(*c_early_init)(struct cpuinfo_x86 *c);
@@ -26,3 +29,5 @@ void amd_init_spectral_chicken(void);
 void detect_zen2_null_seg_behaviour(void);
 
 void intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c);
+
+#endif /* X86__CPU__CPU_H */
diff --git a/xen/arch/x86/x86_64/mmconfig.h b/xen/arch/x86/x86_64/mmconfig.h
index 3da4b21e9b..0b51d2179e 100644
--- a/xen/arch/x86/x86_64/mmconfig.h
+++ b/xen/arch/x86/x86_64/mmconfig.h
@@ -5,6 +5,9 @@
  * Author: Allen Kay <allen.m.kay@intel.com> - adapted from linux
  */
 
+#ifndef X86__X86_64__MMCONFIG_H
+#define X86__X86_64__MMCONFIG_H
+
 #define PCI_DEVICE_ID_INTEL_E7520_MCH    0x3590
 #define PCI_DEVICE_ID_INTEL_82945G_HB    0x2770
 
@@ -72,3 +75,5 @@ int pci_mmcfg_reserved(uint64_t address, unsigned int segment,
 int pci_mmcfg_arch_init(void);
 int pci_mmcfg_arch_enable(unsigned int idx);
 void pci_mmcfg_arch_disable(unsigned int idx);
+
+#endif /* X86__X86_64__MMCONFIG_H */
diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index 0fa26ba00a..940d511b06 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -6,6 +6,9 @@
  * Copyright (c) 2005-2007 XenSource Inc.
  */
 
+#ifndef X86__X86_EMULATE__PRIVATE_H
+#define X86__X86_EMULATE__PRIVATE_H
+
 #ifdef __XEN__
 
 # include <xen/bug.h>
@@ -836,3 +839,5 @@ static inline int read_ulong(enum x86_segment seg,
     *val = 0;
     return ops->read(seg, offset, val, bytes, ctxt);
 }
+
+#endif /* X86__X86_EMULATE__PRIVATE_H */
-- 
2.34.1


