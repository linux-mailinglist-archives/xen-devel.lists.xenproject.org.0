Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5112F806A8F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 10:19:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649044.1013325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAo4F-0003Pw-H9; Wed, 06 Dec 2023 09:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649044.1013325; Wed, 06 Dec 2023 09:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAo4F-0003Np-EZ; Wed, 06 Dec 2023 09:19:43 +0000
Received: by outflank-mailman (input) for mailman id 649044;
 Wed, 06 Dec 2023 09:19:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4rn=HR=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1rAnsB-00022d-Qi
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 09:07:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d870d2bf-9416-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 10:07:13 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66524139F;
 Wed,  6 Dec 2023 01:07:59 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6D7DB3F762;
 Wed,  6 Dec 2023 01:07:10 -0800 (PST)
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
X-Inumbo-ID: d870d2bf-9416-11ee-9b0f-b553b5be7939
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org,
	michal.orzel@amd.com
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v5 11/11] xen/arm: create another /memory node for static shm
Date: Wed,  6 Dec 2023 17:06:23 +0800
Message-Id: <20231206090623.1932275-12-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206090623.1932275-1-Penny.Zheng@arm.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Static shared memory region shall be described both under /memory and
/reserved-memory.

We introduce export_shm_memory_node() to create another /memory node to
contain the static shared memory ranges.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>

---
v3 -> v4:
new commit
---
v4 -> v5:
rebase and no changes
---
 xen/arch/arm/dom0less-build.c           |  8 ++++++++
 xen/arch/arm/domain_build.c             |  8 ++++++++
 xen/arch/arm/include/asm/static-shmem.h | 10 ++++++++++
 xen/arch/arm/static-shmem.c             | 19 +++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index ac096fa3fa..870b8a553f 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -645,6 +645,14 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
+    /* Create a memory node to store the static shared memory regions */
+    if ( kinfo->shminfo.nr_banks != 0 )
+    {
+        ret = export_shm_memory_node(d, kinfo, addrcells, sizecells);
+        if ( ret )
+            goto err;
+    }
+
     ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
     if ( ret )
         goto err;
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f098678ea3..4e450cb4c7 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1873,6 +1873,14 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                 return res;
         }
 
+        /* Create a memory node to store the static shared memory regions */
+        if ( kinfo->shminfo.nr_banks != 0 )
+        {
+            res = export_shm_memory_node(d, kinfo, addrcells, sizecells);
+            if ( res )
+                return res;
+        }
+
         /* Avoid duplicate /reserved-memory nodes in Device Tree */
         if ( !kinfo->resv_mem )
         {
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index 6cb4ef9646..385fd24c17 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -38,6 +38,10 @@ int make_shm_memory_node(const struct domain *d,
                          void *fdt,
                          int addrcells, int sizecells,
                          const struct kernel_info *kinfo);
+
+int export_shm_memory_node(const struct domain *d,
+                           const struct kernel_info *kinfo,
+                           int addrcells, int sizecells);
 #else /* !CONFIG_STATIC_SHM */
 
 static inline int make_resv_memory_node(const struct domain *d, void *fdt,
@@ -86,6 +90,12 @@ static inline int make_shm_memory_node(const struct domain *d,
     return 0;
 }
 
+static inline int export_shm_memory_node(const struct domain *d,
+                                         const struct kernel_info *kinfo,
+                                         int addrcells, int sizecells)
+{
+    return 0;
+}
 #endif /* CONFIG_STATIC_SHM */
 
 #endif /* __ASM_STATIC_SHMEM_H_ */
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index bfce5bbad0..e583aae685 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -505,6 +505,25 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
     return 0;
 }
 
+int __init export_shm_memory_node(const struct domain *d,
+                                  const struct kernel_info *kinfo,
+                                  int addrcells, int sizecells)
+{
+    unsigned int i = 0;
+    struct meminfo shm_meminfo;
+
+    /* Extract meminfo from kinfo.shminfo */
+    for ( ; i < kinfo->shminfo.nr_banks; i++ )
+    {
+        shm_meminfo.bank[i].start = kinfo->shminfo.bank[i].membank.start;
+        shm_meminfo.bank[i].size = kinfo->shminfo.bank[i].membank.size;
+        shm_meminfo.bank[i].type = MEMBANK_DEFAULT;
+    }
+    shm_meminfo.nr_banks = kinfo->shminfo.nr_banks;
+
+    return make_memory_node(d, kinfo->fdt, addrcells, sizecells, &shm_meminfo);
+}
+
 int __init make_shm_memory_node(const struct domain *d, void *fdt,
                                 int addrcells, int sizecells,
                                 const struct kernel_info *kinfo)
-- 
2.25.1


