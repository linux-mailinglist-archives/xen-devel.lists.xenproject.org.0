Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50523511C43
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 18:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315249.533719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njkHd-0005lj-7v; Wed, 27 Apr 2022 16:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315249.533719; Wed, 27 Apr 2022 16:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njkHd-0005jO-4F; Wed, 27 Apr 2022 16:12:53 +0000
Received: by outflank-mailman (input) for mailman id 315249;
 Wed, 27 Apr 2022 16:12:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sRcl=VF=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1njkHb-0005N0-MW
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 16:12:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e25d7fd9-c644-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 18:12:50 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79962ED1;
 Wed, 27 Apr 2022 09:12:49 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9072D3F5A1;
 Wed, 27 Apr 2022 09:12:48 -0700 (PDT)
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
X-Inumbo-ID: e25d7fd9-c644-11ec-a405-831a346695d4
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/acpi: don't expose the ACPI IORT SMMUv3 entry to dom0
Date: Wed, 27 Apr 2022 17:12:33 +0100
Message-Id: <e11c57909782c60a6914d81e9c9893ff1712cc5b.1651075724.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen should control the SMMUv3 devices therefore, don't expose the
SMMUv3 devices to dom0. Deny iomem access to SMMUv3 address space for
dom0 and also make ACPI IORT SMMUv3 node type to 0xff.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/acpi/domain_build.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
index bbdc90f92c..ec0b5b261f 100644
--- a/xen/arch/arm/acpi/domain_build.c
+++ b/xen/arch/arm/acpi/domain_build.c
@@ -14,6 +14,7 @@
 #include <xen/acpi.h>
 #include <xen/event.h>
 #include <xen/iocap.h>
+#include <xen/sizes.h>
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
 #include <acpi/actables.h>
@@ -30,6 +31,7 @@ static int __init acpi_iomem_deny_access(struct domain *d)
 {
     acpi_status status;
     struct acpi_table_spcr *spcr = NULL;
+    struct acpi_table_iort *iort;
     unsigned long mfn;
     int rc;
 
@@ -55,6 +57,44 @@ static int __init acpi_iomem_deny_access(struct domain *d)
         printk("Failed to get SPCR table, Xen console may be unavailable\n");
     }
 
+    status = acpi_get_table(ACPI_SIG_IORT, 0,
+                            (struct acpi_table_header **)&iort);
+
+    if ( ACPI_SUCCESS(status) )
+    {
+        int i;
+        struct acpi_iort_node *node, *end;
+        node = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->node_offset);
+        end = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->header.length);
+
+        for ( i = 0; i < iort->node_count; i++ )
+        {
+            if ( node >= end )
+                break;
+
+            switch ( node->type )
+            {
+                case ACPI_IORT_NODE_SMMU_V3:
+                {
+                    struct acpi_iort_smmu_v3 *smmu;
+                    smmu = (struct acpi_iort_smmu_v3 *)node->node_data;
+                    mfn = paddr_to_pfn(smmu->base_address);
+                    rc = iomem_deny_access(d, mfn, mfn + PFN_UP(SZ_128K));
+                    if ( rc )
+                        printk("iomem_deny_access failed for SMMUv3\n");
+                    node->type = 0xff;
+                    break;
+                }
+            }
+            node = ACPI_ADD_PTR(struct acpi_iort_node, node, node->length);
+        }
+    }
+    else
+    {
+        printk("Failed to get IORT table\n");
+        return -EINVAL;
+    }
+
     /* Deny MMIO access for GIC regions */
     return gic_iomem_deny_access(d);
 }
-- 
2.25.1


