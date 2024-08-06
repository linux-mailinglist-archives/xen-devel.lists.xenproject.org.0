Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF057948DE3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 13:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772827.1183276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbIZB-0006jw-8k; Tue, 06 Aug 2024 11:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772827.1183276; Tue, 06 Aug 2024 11:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbIZB-0006hq-5N; Tue, 06 Aug 2024 11:41:25 +0000
Received: by outflank-mailman (input) for mailman id 772827;
 Tue, 06 Aug 2024 11:41:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPS5=PF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sbIZ9-0006hC-2X
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 11:41:23 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc647c82-53e8-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 13:41:19 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52fcc56c882so3887358e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 04:41:19 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba07891sm1466093e87.22.2024.08.06.04.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 04:41:18 -0700 (PDT)
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
X-Inumbo-ID: cc647c82-53e8-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722944479; x=1723549279; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vG5ncRvairjCkr+MpN3fScaqyU5Vca5xbMf9rFGyo/E=;
        b=RDaCIuR6YgiHcFVzLhqf1M/lsvRnPRT7GRD0wurekTkZaGFnRkII+7/+ELHJXREBkk
         dTtriFXRFpbVqobsR400oc5KF6Zjg6e+gKazgzmUyOyZHunxZ1d4vWr0N/IxnL1VP99p
         y84Hq3fqVtoUJgjYGKIu0uhtBGvPaWevjTyXxXr0E8oU+2G7Zd/a+885uf0bp7mNPpvQ
         K8qU/lqTJhbsVv1KrOWuBIa4Bf0ekrfqB5n2/Ako376nu4AvU6l2Nj0PnqGDjInEjpwi
         KZBxdxG/8+tJDnCedzhMYlWfltvmuGfzCHbLsx1sfsTamhx3h8QF5LlDektkkNW/4iEl
         bdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722944479; x=1723549279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vG5ncRvairjCkr+MpN3fScaqyU5Vca5xbMf9rFGyo/E=;
        b=Jy5JeWR1GjkYsLhNPuYqaTlzzRkY6CuVvTXVqekFc3/xi/hNPGLWNadGBJVRRniX2H
         K9P8DfjBJTU+WSxLYLHuSEZhsddj/nIyRJtHPtE1Pp27ndZDemccTIKCXEW5z+ZH7zV7
         EtddAy2iXZt3d+ewjOD0SExX/YoOAK3qd+9vl+v0LqoCmx1NitKw4hlTBNQcjYLKyug+
         qFV7fPBC8GKh+ShWTZzBB5ATwirk2QYCX3HSlenVcWTA4TACzNdkxNP/5f0nTM2aUz49
         dBaif1jCgDV4i3nOm9VBgmrZNPGzE5wQwi4ZxnD4BdLYOghphtwaErUS1QIMTEMvsSzB
         Ym/A==
X-Gm-Message-State: AOJu0YwYL4S4rdh8fn3iOqolPG+3+NARqTljPvt8hSP37Srj4tYgOzJg
	hLiDBKZQV0TZE5jkAgv1R/ac9oVFxlRw6nIQhvFYc1Vx8VZZc5WukfJ44g==
X-Google-Smtp-Source: AGHT+IEB7EuJa6UojpkoU5DZ+m4t37Ub0hQd0f/BxUhDU5i8Bgfw7ccYoRWRlEQLyx8Sa1w6/Vhx0w==
X-Received: by 2002:a05:6512:3b06:b0:52c:ad70:6feb with SMTP id 2adb3069b0e04-530bb2e8691mr4009661e87.20.1722944478939;
        Tue, 06 Aug 2024 04:41:18 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 2/2] xen/common: Move Arm's bootfdt.c to common
Date: Tue,  6 Aug 2024 13:41:14 +0200
Message-ID: <c98165b4e168d74e8bca91ba7c111e6faaa309a4.1722941799.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722941799.git.oleksii.kurochko@gmail.com>
References: <cover.1722941799.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shawn Anastasio <sanastasio@raptorengineering.com>

Move Arm's bootfdt.c to xen/common so that it can be used by other
device tree architectures like PPC and RISCV.

Remove stubs for process_shm_node() and early_print_info_shmem()
from $xen/arch/arm/include/asm/static-shmem.h.
These stubs are removed to avoid introducing them for architectures
that do not support CONFIG_STATIC_SHM.
The process_shm_node() stub is now implemented in common code to
maintain the current behavior of early_scan_code() on ARM.
The early_print_info_shmem() stub is only used in early_print_info(),
so it's now guarded with #ifdef CONFIG_STATIC_SHM ... #endif.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in V9:
 - add Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in V8:
 - Fix the change log for this patch ( accidentally the change log of the previous
   patch was copied to this ).
 - Drop the stub of process_shm_node() and early_print_info_shmem() in
   xen/arch/arm/include/asm/static-shmem.h as it is moved to common code to not
   re-introduce the same stub for each architecture which doesn't support
   CONFIG_STATIC_SHM now.
 - Drop Acked-by: Julien Grall <julien@xen.org> as after the Ack additional changes were
   done so an additional review is needed.
---
Changes in V7:
 - Nothing changed. Only rebase.
---
Changes in V6:
 - update the version of the patch to v6.
---
Changes in v5:
 - After rebase the Shawn's patch v4 on top of current staging the following
   was done:
   - add guard #ifdef CONFIG_STATIC_SHM around inclusion of <asm/static-shmem.h>
     in common/device-tree/bootfdt.c.
   - add stub for process_shm_node() in case CONFIG_STATIC_SHM isn't enabled.
   - add guard around #ifdef CONFIG_STATIC_SHM aroud early_print_info_shmem() in
     early_print_info().
---
Changes in v4:
  - move function prototypes to patch 2's xen/include/bootfdt.h
  - clean up #includes
---
 xen/arch/arm/Makefile                         |  1 -
 xen/arch/arm/include/asm/setup.h              | 13 ----------
 xen/arch/arm/include/asm/static-shmem.h       |  9 -------
 xen/common/device-tree/Makefile               |  1 +
 .../arm => common/device-tree}/bootfdt.c      | 24 +++++++++++++++----
 xen/include/xen/bootfdt.h                     | 14 +++++++++++
 6 files changed, 34 insertions(+), 28 deletions(-)
 rename xen/{arch/arm => common/device-tree}/bootfdt.c (98%)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 45dc29ea53..da9c979dc4 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -10,7 +10,6 @@ obj-$(CONFIG_TEE) += tee/
 obj-$(CONFIG_HAS_VPCI) += vpci.o
 
 obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
-obj-y += bootfdt.init.o
 obj-y += cpuerrata.o
 obj-y += cpufeature.o
 obj-y += decode.o
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 1748be29e5..64c227d171 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -41,19 +41,6 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
                            void (*cb)(paddr_t ps, paddr_t pe),
                            unsigned int first);
 
-bool check_reserved_regions_overlap(paddr_t region_start, paddr_t region_size);
-
-struct bootmodule *add_boot_module(bootmodule_kind kind,
-                                   paddr_t start, paddr_t size, bool domU);
-struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
-struct bootmodule * boot_module_find_by_addr_and_kind(bootmodule_kind kind,
-                                                             paddr_t start);
-void add_boot_cmdline(const char *name, const char *cmdline,
-                      bootmodule_kind kind, paddr_t start, bool domU);
-struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
-struct bootcmdline * boot_cmdline_find_by_name(const char *name);
-const char *boot_module_kind_as_string(bootmodule_kind kind);
-
 void init_pdx(void);
 void setup_mm(void);
 
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index 806ee41cfc..fd0867c4f2 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -80,15 +80,6 @@ static inline int process_shm_chosen(struct domain *d,
     return 0;
 }
 
-static inline int process_shm_node(const void *fdt, int node,
-                                   uint32_t address_cells, uint32_t size_cells)
-{
-    printk("CONFIG_STATIC_SHM must be enabled for parsing static shared memory nodes\n");
-    return -EINVAL;
-}
-
-static inline void early_print_info_shmem(void) {};
-
 static inline void init_sharedmem_pages(void) {};
 
 static inline int remove_shm_from_rangeset(const struct kernel_info *kinfo,
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index f813f7555f..990abd571a 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,2 +1,3 @@
+obj-y += bootfdt.init.o
 obj-y += bootinfo.init.o
 obj-y += device-tree.o
diff --git a/xen/arch/arm/bootfdt.c b/xen/common/device-tree/bootfdt.c
similarity index 98%
rename from xen/arch/arm/bootfdt.c
rename to xen/common/device-tree/bootfdt.c
index 6e060111d9..f7998979c1 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -4,18 +4,20 @@
  *
  * Copyright (C) 2012-2014 Citrix Systems, Inc.
  */
-#include <xen/types.h>
-#include <xen/lib.h>
-#include <xen/kernel.h>
-#include <xen/init.h>
-#include <xen/efi.h>
+
+#include <xen/bootfdt.h>
 #include <xen/device_tree.h>
+#include <xen/efi.h>
+#include <xen/init.h>
+#include <xen/kernel.h>
 #include <xen/lib.h>
 #include <xen/libfdt/libfdt-xen.h>
 #include <xen/sort.h>
 #include <xsm/xsm.h>
 #include <asm/setup.h>
+#ifdef CONFIG_STATIC_SHM
 #include <asm/static-shmem.h>
+#endif
 
 static void __init __maybe_unused build_assertions(void)
 {
@@ -436,6 +438,16 @@ static int __init process_domain_node(const void *fdt, int node,
                                    MEMBANK_STATIC_DOMAIN);
 }
 
+#ifndef CONFIG_STATIC_SHM
+static inline int process_shm_node(const void *fdt, int node,
+                                   uint32_t address_cells, uint32_t size_cells)
+{
+    printk("CONFIG_STATIC_SHM must be enabled for parsing static shared"
+            " memory nodes\n");
+    return -EINVAL;
+}
+#endif
+
 static int __init early_scan_node(const void *fdt,
                                   int node, const char *name, int depth,
                                   u32 address_cells, u32 size_cells,
@@ -495,7 +507,9 @@ static void __init early_print_info(void)
                mem_resv->bank[i].start,
                mem_resv->bank[i].start + mem_resv->bank[i].size - 1);
     }
+#ifdef CONFIG_STATIC_SHM
     early_print_info_shmem();
+#endif
     printk("\n");
     for ( i = 0 ; i < cmds->nr_mods; i++ )
         printk("CMDLINE[%"PRIpaddr"]:%s %s\n", cmds->cmdline[i].start,
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index c39428d5f5..16fa05f38f 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -157,6 +157,20 @@ struct bootinfo {
 
 extern struct bootinfo bootinfo;
 
+bool check_reserved_regions_overlap(paddr_t region_start,
+                                    paddr_t region_size);
+
+struct bootmodule *add_boot_module(bootmodule_kind kind,
+                                   paddr_t start, paddr_t size, bool domU);
+struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
+struct bootmodule * boot_module_find_by_addr_and_kind(bootmodule_kind kind,
+                                                             paddr_t start);
+void add_boot_cmdline(const char *name, const char *cmdline,
+                      bootmodule_kind kind, paddr_t start, bool domU);
+struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
+struct bootcmdline * boot_cmdline_find_by_name(const char *name);
+const char *boot_module_kind_as_string(bootmodule_kind kind);
+
 void populate_boot_allocator(void);
 
 size_t boot_fdt_info(const void *fdt, paddr_t paddr);
-- 
2.45.2


