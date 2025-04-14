Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA5FA887DF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950715.1346989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MB4-0001Af-Hk; Mon, 14 Apr 2025 15:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950715.1346989; Mon, 14 Apr 2025 15:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MB4-00018V-E2; Mon, 14 Apr 2025 15:56:54 +0000
Received: by outflank-mailman (input) for mailman id 950715;
 Mon, 14 Apr 2025 15:56:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdIb=XA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4MB3-0008LI-3P
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:56:53 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1455e5e2-1949-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 17:56:51 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ac289147833so904633266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 08:56:51 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4288sm951760866b.96.2025.04.14.08.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 08:56:49 -0700 (PDT)
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
X-Inumbo-ID: 1455e5e2-1949-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744646210; x=1745251010; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZ8ilnGbjlP1yuQbeojo9A7mCx6DCnxf3o5NdQt6Z4Y=;
        b=QpF1Q+8KVaS5WatA6PkW/XlgIaLS6R7TqcHNh7MaAtaji1dMMSmz4HWGNCyMfAewWZ
         7JCYdR722FGXZSZOiPgZgedIH4cDYliryZo09/20kb8pRdwQRPIRNoLuDHlLNS9NrrZK
         xJOBtDUCEQZlaoHQi+HgsnQjIRjk8ruW3xHtGMVePZ9Nz9oYKoUOYaZd8dhFUi2TdKu7
         UQxCiQ9Q/qHmIITlJcaIT7MuLdvvzlx3yIyS2sUocTTKoOlsPeNtqcmZ11E9jmVBsV61
         B5SSozr55om/Tvac43L0Fw7faWZ93nVDieozcZ2u9d2V0EtV44Mv+24qtrFdPRW1nDj7
         P3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744646210; x=1745251010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZ8ilnGbjlP1yuQbeojo9A7mCx6DCnxf3o5NdQt6Z4Y=;
        b=s2YW58BmLI0I6MlQ/qIgTVLlPsSNc9C+QEFapBo9cWooC+2TNoDsj0cQ9WtweTWR9U
         B/u5H2W7Dq8YsKkuqWQrNaYnVDU0WgkRxVGfRKki48aJAIDrlQf/qa1QUY6kIllRJwqv
         UwH88kivqlqBe5ii+b99ptKytiXCaPC9sDFKRyVYIu0WdWYkdeV00Eb9x5JCQfOhABuq
         mU28sqt92t1nsu+4FTSAHj994jdQe1e9Quc1MofHegFEjPKX9AQQB5+LjL6DTRHQwVlS
         ePpKCZiKM9PZMRU3DkrbZbtlGA+bwdMcvKdIImL7n6/Zpdh/rQ7Yv24TYMJdDpYomGg1
         +0Hg==
X-Gm-Message-State: AOJu0Yw9FgeBMjN3jh0cZQeU0IdxEbDLVbqwgrdqUJTrt2WRs9XjvV06
	pqq7Ot3c0pgr/Z4pdL26mGHxU4Wq2zqhz/Mf8bt25fzK9tEyqXxii+Ne3g==
X-Gm-Gg: ASbGnctYWZPuMXO8K0/uETpXofEtYVGvA9EzOUvR9natLWDvjjtyBZHHQNg6/uLyxPR
	T9rqNJfqiyylDVm3JmurWgcjtyxnNZaCGHJldhY4OMrZ6i+BRdwwwdLiSRmH7Fyi4invG2oWo3V
	y+4Uk1F0795YSVpqlQDKWHGCGT3Y8CqOaJ3VuDMwmkoy5wkzjhZvAj1/TjrJgo+L3ENOyTmqyA0
	Xsr8MJWSnwu9V20ETTkTx6sMuOKDxT/EZx5hW1Moa18sGOjcz5dEuHKu7Pd2gbnLQAA5zUtms2q
	uBYXToZ9xSmGJkOBZYXRcWNaofC6+uHlSJUg1KpHyiWT16V3iJG3vMLmbbnazB+4xh4dCwthxuv
	vAcOmow0qI6EpqqvOK2uM
X-Google-Smtp-Source: AGHT+IG0C0ZurGkiwvr+LZl7qZuXUegCn9ZRSjOc7uzRpnyAXHlFf7rk+YLGhIy5MyPirggeRe76Gw==
X-Received: by 2002:a17:907:3d0e:b0:ac4:5fd:6e29 with SMTP id a640c23a62f3a-acad34d8a60mr1232191666b.26.1744646210030;
        Mon, 14 Apr 2025 08:56:50 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 5/8] asm-generic: move some parts of Arm's domain_build.h to common
Date: Mon, 14 Apr 2025 17:56:38 +0200
Message-ID: <1c67078147c4a89e46f253f040bef5046fac9ca9.1744626032.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744626032.git.oleksii.kurochko@gmail.com>
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing changed. Only some functions declaration are moved to xen/include/
headers as they are expected to be used by common code of domain builing
or dom0less.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Chnages in v2:
  - Add missed declaration of construct_hwdom().
  - Drop unnessary blank line.
  - Introduce xen/fdt-domain-build.h and move parts of Arm's domain_build.h to
    it.
  - Update the commit message.
---
 xen/arch/arm/acpi/domain_build.c        |  2 +-
 xen/arch/arm/dom0less-build.c           |  2 +-
 xen/arch/arm/domain_build.c             |  2 +-
 xen/arch/arm/include/asm/domain_build.h | 18 +---------
 xen/arch/arm/kernel.c                   |  2 +-
 xen/arch/arm/static-shmem.c             |  2 +-
 xen/include/xen/fdt-domain-build.h      | 46 +++++++++++++++++++++++++
 7 files changed, 52 insertions(+), 22 deletions(-)
 create mode 100644 xen/include/xen/fdt-domain-build.h

diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
index f9ca8b47e5..2b0768b7d5 100644
--- a/xen/arch/arm/acpi/domain_build.c
+++ b/xen/arch/arm/acpi/domain_build.c
@@ -10,6 +10,7 @@
  */
 
 #include <xen/compile.h>
+#include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
@@ -19,7 +20,6 @@
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
 #include <acpi/actables.h>
-#include <asm/domain_build.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 122739061c..ca78cff655 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <xen/device_tree.h>
 #include <xen/domain_page.h>
+#include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/err.h>
 #include <xen/event.h>
@@ -17,7 +18,6 @@
 
 #include <asm/arm64/sve.h>
 #include <asm/dom0less-build.h>
-#include <asm/domain_build.h>
 #include <asm/setup.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a19914f836..75f048f58c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <xen/init.h>
 #include <xen/compile.h>
+#include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/lib.h>
 #include <xen/llc-coloring.h>
@@ -30,7 +31,6 @@
 #include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
 #include <asm/dom0less-build.h>
-#include <asm/domain_build.h>
 #include <asm/static-shmem.h>
 #include <xen/event.h>
 
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 7136857ce4..5f9b063be1 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -5,27 +5,11 @@
 #include <xen/sched.h>
 
 typedef __be32 gic_interrupt_t[3];
-typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
-                                     unsigned int order, void *extra);
-bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
-                             alloc_domheap_mem_cb cb, void *extra);
-bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
-                          paddr_t tot_size);
-void allocate_memory(struct domain *d, struct kernel_info *kinfo);
-int construct_domain(struct domain *d, struct kernel_info *kinfo);
-int construct_hwdom(struct kernel_info *kinfo);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
-int make_chosen_node(const struct kernel_info *kinfo);
-int make_cpus_node(const struct domain *d, void *fdt);
-int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
-                         int addrcells, int sizecells);
-int make_memory_node(const struct kernel_info *kinfo, int addrcells,
-                     int sizecells, const struct membanks *mem);
 int make_psci_node(void *fdt);
-int make_timer_node(const struct kernel_info *kinfo);
 void evtchn_allocate(struct domain *d);
 
-unsigned int get_allocation_size(paddr_t size);
+int construct_hwdom(struct kernel_info *kinfo);
 
 /*
  * Helper to write an interrupts with the GIC format
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 5482cf4239..164f417e75 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -6,6 +6,7 @@
  */
 #include <xen/domain_page.h>
 #include <xen/errno.h>
+#include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/guest_access.h>
 #include <xen/gunzip.h>
@@ -17,7 +18,6 @@
 #include <xen/vmap.h>
 
 #include <asm/byteorder.h>
-#include <asm/domain_build.h>
 #include <asm/setup.h>
 
 #define UIMAGE_MAGIC          0x27051956
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 14ae48fb1e..07ebd8b41f 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -1,11 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/device_tree.h>
+#include <xen/fdt-domain-build.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/rangeset.h>
 #include <xen/sched.h>
 
-#include <asm/domain_build.h>
 #include <asm/setup.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
new file mode 100644
index 0000000000..41454e75ca
--- /dev/null
+++ b/xen/include/xen/fdt-domain-build.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_FDT_DOMAIN_BUILD_H__
+#define __XEN_FDT_DOMAIN_BUILD_H__
+
+#include <xen/bootfdt.h>
+#include <xen/device_tree.h>
+#include <xen/fdt-kernel.h>
+#include <xen/types.h>
+
+#if __has_include(<asm/domain_build.h>)
+#   include <asm/domain_build.h>
+#endif
+
+struct domain;
+struct page_info;
+struct membanks;
+
+typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
+                                     unsigned int order, void *extra);
+bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
+                             alloc_domheap_mem_cb cb, void *extra);
+
+bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
+                          paddr_t tot_size);
+void allocate_memory(struct domain *d, struct kernel_info *kinfo);
+int construct_domain(struct domain *d, struct kernel_info *kinfo);
+int make_chosen_node(const struct kernel_info *kinfo);
+int make_cpus_node(const struct domain *d, void *fdt);
+int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
+                         int addrcells, int sizecells);
+int make_memory_node(const struct kernel_info *kinfo, int addrcells,
+                     int sizecells, const struct membanks *mem);
+int make_timer_node(const struct kernel_info *kinfo);
+
+unsigned int get_allocation_size(paddr_t size);
+
+#endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.49.0


