Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD508814046
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 03:52:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654836.1022271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJh-0003ee-HB; Fri, 15 Dec 2023 02:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654836.1022271; Fri, 15 Dec 2023 02:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJh-0003b1-Dc; Fri, 15 Dec 2023 02:52:45 +0000
Received: by outflank-mailman (input) for mailman id 654836;
 Fri, 15 Dec 2023 02:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onWf=H2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rDyJg-0002yh-1y
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 02:52:44 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 046989a9-9af5-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 03:52:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 797D682867CE;
 Thu, 14 Dec 2023 20:52:42 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id n4h2h6g4EhV5; Thu, 14 Dec 2023 20:52:41 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6DED582867CC;
 Thu, 14 Dec 2023 20:52:41 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id t9I7Qbp6PaBD; Thu, 14 Dec 2023 20:52:41 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 0B5508285463;
 Thu, 14 Dec 2023 20:52:41 -0600 (CST)
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
X-Inumbo-ID: 046989a9-9af5-11ee-98ea-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 6DED582867CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1702608761; bh=xuXZQRjjBFlAEEWI2+xfJ/TIf6aMhn0vjL1+nXTvXR8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=g0aLQ9Rq6c1615MM3uO5YF0hpHgZtrd24SJlVYziAR4XGHZqmB/0Fq+9ZiEDBKdYB
	 TzLzP3aP1ISCSw+VWL6lasRWnv/I3ktJQy07hDcCWKmtFOmKrHsomMqaZ0F6Efg1hk
	 C1BLNvjKDJXPYSIzbTG0YCNrbeHE8x/VXwgrptLA=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 2/7] xen/asm-generic: Introduce generic setup.h
Date: Thu, 14 Dec 2023 20:43:57 -0600
Message-Id: <1e4f48d753871bf61de3af97a3009e069d25d01e.1702607884.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1702607884.git.sanastasio@raptorengineering.com>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Introduce setup.h to asm-generic based off of ARM's to define all
stubs necessary to compile bootfdt.c

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/include/asm/Makefile |   1 +
 xen/arch/ppc/include/asm/setup.h  |   6 --
 xen/include/asm-generic/setup.h   | 148 ++++++++++++++++++++++++++++++
 3 files changed, 149 insertions(+), 6 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/setup.h
 create mode 100644 xen/include/asm-generic/setup.h

diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index a711cfa856..7167661f86 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -6,5 +6,6 @@ generic-y += iocap.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
+generic-y += setup.h
 generic-y += static-shmem.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/setup.h
deleted file mode 100644
index e4f64879b6..0000000000
--- a/xen/arch/ppc/include/asm/setup.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifndef __ASM_PPC_SETUP_H__
-#define __ASM_PPC_SETUP_H__
-
-#define max_init_domid (0)
-
-#endif /* __ASM_PPC_SETUP_H__ */
diff --git a/xen/include/asm-generic/setup.h b/xen/include/asm-generic/setup.h
new file mode 100644
index 0000000000..0262ad49f9
--- /dev/null
+++ b/xen/include/asm-generic/setup.h
@@ -0,0 +1,148 @@
+#ifndef __ASM_GENERIC_SETUP_H__
+#define __ASM_GENERIC_SETUP_H__
+
+#define max_init_domid (0)
+
+#include <xen/bug.h>
+
+#include <public/version.h>
+#include <asm/p2m.h>
+#include <xen/device_tree.h>
+
+#define MIN_FDT_ALIGN 8
+#define MAX_FDT_SIZE SZ_2M
+
+#define NR_MEM_BANKS 256
+
+#define MAX_MODULES 32 /* Current maximum useful modules */
+
+typedef enum {
+    BOOTMOD_XEN,
+    BOOTMOD_FDT,
+    BOOTMOD_KERNEL,
+    BOOTMOD_RAMDISK,
+    BOOTMOD_XSM,
+    BOOTMOD_GUEST_DTB,
+    BOOTMOD_UNKNOWN
+}  bootmodule_kind;
+
+enum membank_type {
+    /*
+     * The MEMBANK_DEFAULT type refers to either reserved memory for the
+     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
+     * the bank is in 'mem').
+     */
+    MEMBANK_DEFAULT,
+    /*
+     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the memory
+     * bank is bound to a static Xen domain. It is only valid when the bank
+     * is in reserved_mem.
+     */
+    MEMBANK_STATIC_DOMAIN,
+    /*
+     * The MEMBANK_STATIC_HEAP type is used to indicate whether the memory
+     * bank is reserved as static heap. It is only valid when the bank is
+     * in reserved_mem.
+     */
+    MEMBANK_STATIC_HEAP,
+};
+
+/* Indicates the maximum number of characters(\0 included) for shm_id */
+#define MAX_SHM_ID_LENGTH 16
+
+struct membank {
+    paddr_t start;
+    paddr_t size;
+    enum membank_type type;
+};
+
+struct meminfo {
+    unsigned int nr_banks;
+    struct membank bank[NR_MEM_BANKS];
+};
+
+/*
+ * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
+ * The purpose of the domU flag is to avoid getting confused in
+ * kernel_probe, where we try to guess which is the dom0 kernel and
+ * initrd to be compatible with all versions of the multiboot spec.
+ */
+#define BOOTMOD_MAX_CMDLINE 1024
+struct bootmodule {
+    bootmodule_kind kind;
+    bool domU;
+    paddr_t start;
+    paddr_t size;
+};
+
+/* DT_MAX_NAME is the node name max length according the DT spec */
+#define DT_MAX_NAME 41
+struct bootcmdline {
+    bootmodule_kind kind;
+    bool domU;
+    paddr_t start;
+    char dt_name[DT_MAX_NAME];
+    char cmdline[BOOTMOD_MAX_CMDLINE];
+};
+
+struct bootmodules {
+    int nr_mods;
+    struct bootmodule module[MAX_MODULES];
+};
+
+struct bootcmdlines {
+    unsigned int nr_mods;
+    struct bootcmdline cmdline[MAX_MODULES];
+};
+
+struct bootinfo {
+    struct meminfo mem;
+    struct meminfo reserved_mem;
+    struct bootmodules modules;
+    struct bootcmdlines cmdlines;
+    bool static_heap;
+};
+
+extern struct bootinfo bootinfo;
+
+/*
+ * setup.c
+ */
+
+static inline bool check_reserved_regions_overlap(paddr_t region_start,
+                                                  paddr_t region_size)
+{
+    /* Not implemented on GENERIC */
+    BUG();
+}
+
+static inline struct bootmodule *add_boot_module(bootmodule_kind kind,
+                                                 paddr_t start, paddr_t size,
+                                                 bool domU)
+{
+    /* Not implemented on GENERIC */
+    BUG();
+}
+
+static inline void add_boot_cmdline(const char *name, const char *cmdline,
+                                    bootmodule_kind kind, paddr_t start,
+                                    bool domU)
+{
+    /* Not implemented on GENERIC */
+    BUG();
+}
+
+static inline const char *boot_module_kind_as_string(bootmodule_kind kind)
+{
+    /* Not implemented on GENERIC */
+    BUG();
+}
+
+static inline struct bootcmdline *boot_cmdline_find_by_kind(
+    bootmodule_kind kind)
+{
+    /* Not implemented on GENERIC */
+    BUG();
+}
+
+#endif /* __ASM_GENERIC_SETUP_H__ */
-- 
2.30.2


