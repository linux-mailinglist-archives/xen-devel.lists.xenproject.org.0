Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A972EA05961
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 12:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867138.1278614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVU03-0002U6-KW; Wed, 08 Jan 2025 11:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867138.1278614; Wed, 08 Jan 2025 11:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVU03-0002RA-CJ; Wed, 08 Jan 2025 11:13:23 +0000
Received: by outflank-mailman (input) for mailman id 867138;
 Wed, 08 Jan 2025 11:13:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoWX=UA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVU01-0001rx-Qb
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 11:13:21 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90e76a96-cdb1-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 12:13:19 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-30034ad2ca3so151217771fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 03:13:19 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad99d11sm67292171fa.33.2025.01.08.03.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 03:13:18 -0800 (PST)
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
X-Inumbo-ID: 90e76a96-cdb1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736334799; x=1736939599; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2DRwW9ezeHyV+LdRXJNVZEHINyASGcXSyx28i5zUEk=;
        b=TS5eFIaZWc2uEA8au516hwoLBqp/cAbVptNY/yVs/xQrYI/K1Kzs0doZWyVqYEv8B1
         XP1W0t6R1KhPh/5PrsC6xFuLe4LeV6GcKH3adhTlI0aPxyrbp89II8jcniUAenY/5lTQ
         mLzTnfANXSY6VHPY+4mlV6mAzRVrchgpcCZhb0ruWX54ilWZmRwf5DMwo1nDQddbH9NM
         S5QrU/RwuJp2VplDm4QgXGcyJ2Gz1W38YF0T8q8gbExtXTnN1yKpYbfrR0CyQdfwhzmb
         /dyF49jqPOl2TCTTAbaOznZDxwQJBhcNT4FEiQuGAWQyC3tZQLPLL+hqVRvTqWFbj40j
         hUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736334799; x=1736939599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2DRwW9ezeHyV+LdRXJNVZEHINyASGcXSyx28i5zUEk=;
        b=GY9oItByxVOdGbIEM06Qz3G+VE1zzDB/Swpbk5F0be5lah/CXkyeLFYLGXeTZcAtBh
         gVqgxhn1OhLSYluL3WHR4yJYy7s5SvXcbxKJtlSsiRg85q9oBiJXOItjNALU7V1b4aq6
         pFWSe2JEdWTPVyc9GQ3bxacogD6pwhmC1dTwGmxBZD19TNNEBDg1k+/245tdsr4Ha++S
         3nBcnvQGteOGEoB+ddjh0S9dKd1TE7HCtSiArZOEJMh2DmI5rDasip0GbZkIF4w4/aug
         2YIgcE5eJXcJw0F38y/AFTxIxOnc9lpLqI7yRfKmyL/X5DclIWHgnhNqUXPR+IFH/gPS
         oh1g==
X-Gm-Message-State: AOJu0YyyljeKDjuISuJpPKx6+/y2uxXhJ51MI4cnNtEIX1C6YT1So17D
	5q3/0QUnRbzA3k3Z6smLXuQmHlWzRV/RP3ZoyYdqbRd36G2SQhg76f8EJAWq
X-Gm-Gg: ASbGncsCUMCO6/1QHsrBQwh8ITPPBz+EwoA+IU56HSydVB//QNWzT0085x5RJmMiXBK
	id2N69RoVDF6u06PauZ09odFP2sfjexkv6THtvrDxhh70xIiInpI9F65JFPsXJ3O5/sJQp1HDw0
	j7z4E0qOvbxsTr0r/7Gq/q41OvJqzBVUPoHMEJ3HAt/HXc6+k4YSa/DXfvEvFf9jVhAfn8yhkuC
	a9voJ2RVaatpqdPIUOh32QF75IHzRNrB1+u+J7FbcihhU8xcKMSuyTcrA==
X-Google-Smtp-Source: AGHT+IG+qDjYgt2Gr62pg6Xnv/ZqvLYxmQ5L3XyRVscSUI+HT8/n6r626LNrsrSWfozbDr/qW9BejA==
X-Received: by 2002:a2e:bc28:0:b0:302:4171:51f0 with SMTP id 38308e7fff4ca-305f445cc8dmr5983551fa.0.1736334798706;
        Wed, 08 Jan 2025 03:13:18 -0800 (PST)
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
Subject: [PATCH v1 5/9] asm-generic: move Arm's static-shmem.h to asm-generic
Date: Wed,  8 Jan 2025 12:13:07 +0100
Message-ID: <0203b98aa6a42aa69e22e7c973320add3ff4bb5d.1736334615.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736334615.git.oleksii.kurochko@gmail.com>
References: <cover.1736334615.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Except moving Arm's static-shmem.h to asm-generic #ifdef header guard
is updated: s/__ASM_SHMEM_MEMORY_H_/__ASM_GENERIC_SHMEM_MEMORY_H__.

Update arm/include/asm/Makefile to use asm-generic version of
static-shmem.h for Arm.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/include/asm/Makefile       |   1 +
 xen/arch/arm/include/asm/static-shmem.h | 117 ------------------------
 xen/include/asm-generic/static-shmem.h  | 117 ++++++++++++++++++++++++
 3 files changed, 118 insertions(+), 117 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/static-shmem.h
 create mode 100644 xen/include/asm-generic/static-shmem.h

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index ac8208a81f..9cec55606e 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -9,4 +9,5 @@ generic-y += percpu.h
 generic-y += random.h
 generic-y += softirq.h
 generic-y += static-memory.h
+generic-y += static-shmem.h
 generic-y += vm_event.h
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
deleted file mode 100644
index 828c8e5480..0000000000
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ /dev/null
@@ -1,117 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#ifndef __ASM_STATIC_SHMEM_H_
-#define __ASM_STATIC_SHMEM_H_
-
-#include <xen/types.h>
-#include <asm/kernel.h>
-
-#ifdef CONFIG_STATIC_SHM
-
-/* Worst case /memory node reg element: (addrcells + sizecells) */
-#define DT_MEM_NODE_REG_RANGE_SIZE ((NR_MEM_BANKS + NR_SHMEM_BANKS) * 4)
-
-int make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
-                          int sizecells);
-
-int process_shm(struct domain *d, struct kernel_info *kinfo,
-                const struct dt_device_node *node);
-
-static inline int process_shm_chosen(struct domain *d,
-                                     struct kernel_info *kinfo)
-{
-    const struct dt_device_node *node = dt_find_node_by_path("/chosen");
-
-    return process_shm(d, kinfo, node);
-}
-
-int process_shm_node(const void *fdt, int node, uint32_t address_cells,
-                     uint32_t size_cells);
-
-void early_print_info_shmem(void);
-
-void init_sharedmem_pages(void);
-
-int remove_shm_from_rangeset(const struct kernel_info *kinfo,
-                             struct rangeset *rangeset);
-
-int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
-                              struct membanks *ext_regions);
-
-int make_shm_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
-                              int sizecells);
-
-void shm_mem_node_fill_reg_range(const struct kernel_info *kinfo, __be32 *reg,
-                                 int *nr_cells, int addrcells, int sizecells);
-
-static inline struct membanks *
-kernel_info_get_shm_mem(struct kernel_info *kinfo)
-{
-    return container_of(&kinfo->shm_mem.common, struct membanks, common);
-}
-
-static inline const struct membanks *
-kernel_info_get_shm_mem_const(const struct kernel_info *kinfo)
-{
-    return container_of(&kinfo->shm_mem.common, const struct membanks, common);
-}
-
-#else /* !CONFIG_STATIC_SHM */
-
-/* Worst case /memory node reg element: (addrcells + sizecells) */
-#define DT_MEM_NODE_REG_RANGE_SIZE (NR_MEM_BANKS * 4)
-
-static inline int make_resv_memory_node(const struct kernel_info *kinfo,
-                                        int addrcells, int sizecells)
-{
-    return 0;
-}
-
-static inline int process_shm(struct domain *d, struct kernel_info *kinfo,
-                              const struct dt_device_node *node)
-{
-    return 0;
-}
-
-static inline int process_shm_chosen(struct domain *d,
-                                     struct kernel_info *kinfo)
-{
-    return 0;
-}
-
-static inline void init_sharedmem_pages(void) {};
-
-static inline int remove_shm_from_rangeset(const struct kernel_info *kinfo,
-                                           struct rangeset *rangeset)
-{
-    return 0;
-}
-
-static inline int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
-                                            struct membanks *ext_regions)
-{
-    return 0;
-}
-
-static inline int make_shm_resv_memory_node(const struct kernel_info *kinfo,
-                                            int addrcells, int sizecells)
-{
-    return 0;
-}
-
-static inline void shm_mem_node_fill_reg_range(const struct kernel_info *kinfo,
-                                               __be32 *reg, int *nr_cells,
-                                               int addrcells, int sizecells) {};
-
-#endif /* CONFIG_STATIC_SHM */
-
-#endif /* __ASM_STATIC_SHMEM_H_ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/include/asm-generic/static-shmem.h b/xen/include/asm-generic/static-shmem.h
new file mode 100644
index 0000000000..7c83cb6195
--- /dev/null
+++ b/xen/include/asm-generic/static-shmem.h
@@ -0,0 +1,117 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_GENERIC_STATIC_SHMEM_H__
+#define __ASM_GENERIC_STATIC_SHMEM_H__
+
+#include <xen/types.h>
+#include <asm/kernel.h>
+
+#ifdef CONFIG_STATIC_SHM
+
+/* Worst case /memory node reg element: (addrcells + sizecells) */
+#define DT_MEM_NODE_REG_RANGE_SIZE ((NR_MEM_BANKS + NR_SHMEM_BANKS) * 4)
+
+int make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
+                          int sizecells);
+
+int process_shm(struct domain *d, struct kernel_info *kinfo,
+                const struct dt_device_node *node);
+
+static inline int process_shm_chosen(struct domain *d,
+                                     struct kernel_info *kinfo)
+{
+    const struct dt_device_node *node = dt_find_node_by_path("/chosen");
+
+    return process_shm(d, kinfo, node);
+}
+
+int process_shm_node(const void *fdt, int node, uint32_t address_cells,
+                     uint32_t size_cells);
+
+void early_print_info_shmem(void);
+
+void init_sharedmem_pages(void);
+
+int remove_shm_from_rangeset(const struct kernel_info *kinfo,
+                             struct rangeset *rangeset);
+
+int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
+                              struct membanks *ext_regions);
+
+int make_shm_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
+                              int sizecells);
+
+void shm_mem_node_fill_reg_range(const struct kernel_info *kinfo, __be32 *reg,
+                                 int *nr_cells, int addrcells, int sizecells);
+
+static inline struct membanks *
+kernel_info_get_shm_mem(struct kernel_info *kinfo)
+{
+    return container_of(&kinfo->shm_mem.common, struct membanks, common);
+}
+
+static inline const struct membanks *
+kernel_info_get_shm_mem_const(const struct kernel_info *kinfo)
+{
+    return container_of(&kinfo->shm_mem.common, const struct membanks, common);
+}
+
+#else /* !CONFIG_STATIC_SHM */
+
+/* Worst case /memory node reg element: (addrcells + sizecells) */
+#define DT_MEM_NODE_REG_RANGE_SIZE (NR_MEM_BANKS * 4)
+
+static inline int make_resv_memory_node(const struct kernel_info *kinfo,
+                                        int addrcells, int sizecells)
+{
+    return 0;
+}
+
+static inline int process_shm(struct domain *d, struct kernel_info *kinfo,
+                              const struct dt_device_node *node)
+{
+    return 0;
+}
+
+static inline int process_shm_chosen(struct domain *d,
+                                     struct kernel_info *kinfo)
+{
+    return 0;
+}
+
+static inline void init_sharedmem_pages(void) {};
+
+static inline int remove_shm_from_rangeset(const struct kernel_info *kinfo,
+                                           struct rangeset *rangeset)
+{
+    return 0;
+}
+
+static inline int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
+                                            struct membanks *ext_regions)
+{
+    return 0;
+}
+
+static inline int make_shm_resv_memory_node(const struct kernel_info *kinfo,
+                                            int addrcells, int sizecells)
+{
+    return 0;
+}
+
+static inline void shm_mem_node_fill_reg_range(const struct kernel_info *kinfo,
+                                               __be32 *reg, int *nr_cells,
+                                               int addrcells, int sizecells) {};
+
+#endif /* CONFIG_STATIC_SHM */
+
+#endif /* __ASM_GENERIC_STATIC_SHMEM_H__ */
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
2.47.1


