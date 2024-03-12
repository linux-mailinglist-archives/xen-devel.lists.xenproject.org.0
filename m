Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD218794B9
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 14:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691813.1078236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nS-0005Mf-Hr; Tue, 12 Mar 2024 13:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691813.1078236; Tue, 12 Mar 2024 13:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nS-0005IX-Bb; Tue, 12 Mar 2024 13:03:58 +0000
Received: by outflank-mailman (input) for mailman id 691813;
 Tue, 12 Mar 2024 13:03:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91vH=KS=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rk1nQ-0004WU-MH
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 13:03:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id fafeec37-e070-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 14:03:54 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC53F1570;
 Tue, 12 Mar 2024 06:04:31 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 679BE3F762;
 Tue, 12 Mar 2024 06:03:53 -0700 (PDT)
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
X-Inumbo-ID: fafeec37-e070-11ee-a1ee-f123f15fe8a2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 04/11] xen/arm: Conditional compilation of kernel_info.shm_mem member
Date: Tue, 12 Mar 2024 13:03:24 +0000
Message-Id: <20240312130331.78418-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312130331.78418-1-luca.fancellu@arm.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The user of shm_mem member of the 'struct kernel_info' is only
the code managing the static shared memory feature, which can be
compiled out using CONFIG_STATIC_SHM, so in case the feature is
not requested, that member won't be used and will waste memory
space.

To address this issue, protect the member with the Kconfig parameter
and modify the signature of the only function using it to remove
any reference to the member from outside the static-shmem module.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/dom0less-build.c           |  3 +--
 xen/arch/arm/domain_build.c             |  3 +--
 xen/arch/arm/include/asm/kernel.h       | 10 +++++++++-
 xen/arch/arm/include/asm/static-shmem.h | 11 ++++++-----
 xen/arch/arm/static-shmem.c             |  8 +++++---
 5 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 0165da6f2986..fe2a771d4984 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -647,8 +647,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
-                                &kinfo->shm_mem.common);
+    ret = make_resv_memory_node(d, kinfo, addrcells, sizecells);
     if ( ret )
         goto err;
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 62fcdfbdaff2..b254f252e7cb 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1780,8 +1780,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                 return res;
         }
 
-        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
-                                    &kinfo->shm_mem.common);
+        res = make_resv_memory_node(d, kinfo, addrcells, sizecells);
         if ( res )
             return res;
     }
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index d28b843c01a9..5785da985ccf 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -39,7 +39,9 @@ struct kernel_info {
     void *fdt; /* flat device tree */
     paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
     struct meminfo mem;
+#ifdef CONFIG_STATIC_SHM
     struct meminfo shm_mem;
+#endif
 
     /* kernel entry point */
     paddr_t entry;
@@ -81,10 +83,16 @@ struct kernel_info {
 #define kernel_info_get_mem(kinfo) \
     (&(kinfo)->mem.common)
 
+#ifdef CONFIG_STATIC_SHM
+#define KERNEL_INFO_SHM_MEM_INIT .shm_mem.common.max_banks = NR_MEM_BANKS,
+#else
+#define KERNEL_INFO_SHM_MEM_INIT
+#endif
+
 #define KERNEL_INFO_INIT \
 { \
     .mem.common.max_banks = NR_MEM_BANKS, \
-    .shm_mem.common.max_banks = NR_MEM_BANKS, \
+    KERNEL_INFO_SHM_MEM_INIT \
 }
 
 /*
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index cc6b414ed79b..108cedb55a9f 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -7,8 +7,9 @@
 
 #ifdef CONFIG_STATIC_SHM
 
-int make_resv_memory_node(const struct domain *d, void *fdt, int addrcells,
-                          int sizecells, const struct membanks *mem);
+int make_resv_memory_node(const struct domain *d,
+                          const struct kernel_info *kinfo, int addrcells,
+                          int sizecells);
 
 int process_shm(struct domain *d, struct kernel_info *kinfo,
                 const struct dt_device_node *node);
@@ -26,9 +27,9 @@ int process_shm_node(const void *fdt, int node, uint32_t address_cells,
 
 #else /* !CONFIG_STATIC_SHM */
 
-static inline int make_resv_memory_node(const struct domain *d, void *fdt,
-                                        int addrcells, int sizecells,
-                                        const struct membanks *mem)
+static inline int make_resv_memory_node(const struct domain *d,
+                                        const struct kernel_info *kinfo,
+                                        int addrcells, int sizecells)
 {
     return 0;
 }
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index fdc3bccde402..8b7da952be6e 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -490,13 +490,15 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
     return 0;
 }
 
-int __init make_resv_memory_node(const struct domain *d, void *fdt,
-                                 int addrcells, int sizecells,
-                                 const struct membanks *mem)
+int __init make_resv_memory_node(const struct domain *d,
+                                 const struct kernel_info *kinfo,
+                                 int addrcells, int sizecells)
 {
     int res = 0;
     /* Placeholder for reserved-memory\0 */
     const char resvbuf[16] = "reserved-memory";
+    const struct membanks *mem = &kinfo->shm_mem.common;
+    void *fdt = kinfo->fdt;
 
     if ( mem->nr_banks == 0 )
         /* No shared memory provided. */
-- 
2.34.1


