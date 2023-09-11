Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF5F79A246
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 06:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598958.934175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfYFY-0003Aq-1d; Mon, 11 Sep 2023 04:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598958.934175; Mon, 11 Sep 2023 04:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfYFX-00038t-U2; Mon, 11 Sep 2023 04:10:11 +0000
Received: by outflank-mailman (input) for mailman id 598958;
 Mon, 11 Sep 2023 04:10:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ExPs=E3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qfYBM-0005nR-DI
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 04:05:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7e40da3d-5058-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 06:05:50 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD634D75;
 Sun, 10 Sep 2023 21:06:26 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 90BD33F67D;
 Sun, 10 Sep 2023 21:05:46 -0700 (PDT)
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
X-Inumbo-ID: 7e40da3d-5058-11ee-8784-cb3800f73035
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
Subject: [PATCH v4 09/10] xen/arm: fix duplicate /reserved-memory node in Dom0
Date: Mon, 11 Sep 2023 12:04:41 +0800
Message-Id: <20230911040442.2541398-10-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911040442.2541398-1-Penny.Zheng@arm.com>
References: <20230911040442.2541398-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case there is a /reserved-memory node already present in the host dtb,
current Xen codes would create yet another /reserved-memory node specially
for the static shm in Dom0 Device Tree.

Xen will use write_properties() to copy the reserved memory nodes from host dtb
to Dom0 FDT, so we want to insert the shm node along with the copying.
And avoiding duplication, we add a checking before make_resv_memory_node().

Signed-off-by: Penny Zheng <penny.zheng@arm.com>

---
v3 -> v4:
new commit
---
 xen/arch/arm/domain_build.c       | 31 ++++++++++++++++++++++++++++---
 xen/arch/arm/include/asm/kernel.h |  2 ++
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 02d903be78..dad234e4b5 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1401,6 +1401,10 @@ static int __init handle_linux_pci_domain(struct kernel_info *kinfo,
     return fdt_property_cell(kinfo->fdt, "linux,pci-domain", segment);
 }
 
+static int __init make_shm_memory_node(const struct domain *d,
+                                       void *fdt,
+                                       int addrcells, int sizecells,
+                                       const struct kernel_info *kinfo);
 static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
                                    const struct dt_device_node *node)
 {
@@ -1549,6 +1553,23 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
         }
     }
 
+    if ( dt_node_path_is_equal(node, "/reserved-memory") )
+    {
+        kinfo->resv_mem = true;
+
+        /* shared memory provided. */
+        if ( kinfo->shminfo.nr_banks != 0 )
+        {
+            uint32_t addrcells = dt_n_addr_cells(node),
+                     sizecells = dt_n_size_cells(node);
+
+            res = make_shm_memory_node(d, kinfo->fdt,
+                                       addrcells, sizecells, kinfo);
+            if ( res )
+                return res;
+        }
+    }
+
     return 0;
 }
 
@@ -2856,9 +2877,13 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                 return res;
         }
 
-        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
-        if ( res )
-            return res;
+        /* Avoid duplicate /reserved-memory nodes in Device Tree */
+        if ( !kinfo->resv_mem )
+        {
+            res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
+            if ( res )
+                return res;
+        }
     }
 
     res = fdt_end_node(kinfo->fdt);
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 590bc56f6c..d20c8bc2a8 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -38,6 +38,8 @@ struct kernel_info {
     void *fdt; /* flat device tree */
     paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
     struct meminfo mem;
+    /* Whether we have /reserved-memory node in host Device Tree */
+    bool resv_mem;
     /* Static shared memory banks */
     struct {
         unsigned int nr_banks;
-- 
2.25.1


