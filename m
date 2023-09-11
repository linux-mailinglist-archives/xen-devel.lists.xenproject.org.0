Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5DF79A247
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 06:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598945.934165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfYFW-0002vU-Qe; Mon, 11 Sep 2023 04:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598945.934165; Mon, 11 Sep 2023 04:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfYFW-0002tD-MS; Mon, 11 Sep 2023 04:10:10 +0000
Received: by outflank-mailman (input) for mailman id 598945;
 Mon, 11 Sep 2023 04:10:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ExPs=E3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qfYBP-0005n2-R9
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 04:05:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8058e0d1-5058-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 06:05:53 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B327D75;
 Sun, 10 Sep 2023 21:06:30 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2DD003F67D;
 Sun, 10 Sep 2023 21:05:49 -0700 (PDT)
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
X-Inumbo-ID: 8058e0d1-5058-11ee-9b0d-b553b5be7939
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v4 10/10] xen/arm: create another /memory node for static shm
Date: Mon, 11 Sep 2023 12:04:42 +0800
Message-Id: <20230911040442.2541398-11-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911040442.2541398-1-Penny.Zheng@arm.com>
References: <20230911040442.2541398-1-Penny.Zheng@arm.com>
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
 xen/arch/arm/domain_build.c | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index dad234e4b5..21e5c622a3 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1714,6 +1714,25 @@ static int __init make_memory_node(const struct domain *d,
 }
 
 #ifdef CONFIG_STATIC_SHM
+static int __init export_shm_memory_node(const struct domain *d,
+                                         const struct kernel_info *kinfo,
+                                         int addrcells, int sizecells)
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
 static int __init make_shm_memory_node(const struct domain *d,
                                        void *fdt,
                                        int addrcells, int sizecells,
@@ -1782,6 +1801,14 @@ static int __init make_shm_memory_node(const struct domain *d,
     return res;
 }
 #else
+static int __init export_shm_memory_node(const struct domain *d,
+                                         const struct kernel_info *kinfo,
+                                         int addrcells, int sizecells)
+{
+    ASSERT_UNREACHABLE();
+    return -EOPNOTSUPP;
+}
+
 static int __init make_shm_memory_node(const struct domain *d,
                                        void *fdt,
                                        int addrcells, int sizecells,
@@ -2877,6 +2904,14 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
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
@@ -3437,6 +3472,14 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
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
-- 
2.25.1


