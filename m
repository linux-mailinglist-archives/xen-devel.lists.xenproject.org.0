Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEAB7013B7
	for <lists+xen-devel@lfdr.de>; Sat, 13 May 2023 03:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534090.831321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxdt4-0001H4-4T; Sat, 13 May 2023 01:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534090.831321; Sat, 13 May 2023 01:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxdt4-0001EL-12; Sat, 13 May 2023 01:17:30 +0000
Received: by outflank-mailman (input) for mailman id 534090;
 Sat, 13 May 2023 01:17:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lw2b=BC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pxdt2-0001E1-Vd
 for xen-devel@lists.xenproject.org; Sat, 13 May 2023 01:17:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb5e9da5-f12b-11ed-8611-37d641c3527e;
 Sat, 13 May 2023 03:17:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0358661DB1;
 Sat, 13 May 2023 01:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0C7C433D2;
 Sat, 13 May 2023 01:17:23 +0000 (UTC)
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
X-Inumbo-ID: eb5e9da5-f12b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683940644;
	bh=2XytKpG4OSRs3JrzoCNRkbwec3tS/ewt5oNDo9tHoCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=clI0cieSNQPbJOut//0+xr5HlGcqxjGzeb4OQjYWS7GeROGV1/7ThtgGAqlS8WEDM
	 T8KNWl1ydCZMZloixzBO1PY+xv8aNNd+/3Ba0ToRPTOlVDZE/zXIIZwT8FBbQ911A7
	 ICmcO7ZhAeWUFc8FE/wykT8xWlN1c58TQmyNrCiu3FgoBhKvqfJfnfrEibnEZ+ABNH
	 up0Hnc5vZ2BJwXJ4gfGuoi7qKw4lXazOF2dX+s4d/2+4i3WGxGiC/B2q02zrKXD98H
	 mj7W3XjeQn6iQL7WR4vzlWyeHBLNSIi4YFq+HXUo7kCl8fUABZ9JtsPivC2jP8T+zf
	 cLj40ROvLnFwA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: roger.pau@citrix.com,
	andrew.cooper3@citrix.com,
	jbeulich@suse.com
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Xenia.Ragiadakou@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH 1/2] xen/x86/pvh: use preset XSDT header for XSDT generation
Date: Fri, 12 May 2023 18:17:19 -0700
Message-Id: <20230513011720.3978354-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Xen always generates a XSDT table even if the firmware provided a RSDT
table. Instead of copying the XSDT header from the firmware table (that
might be missing), generate the XSDT header from a preset.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/arch/x86/hvm/dom0_build.c | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 307edc6a8c..5fde769863 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -963,13 +963,18 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
                                       paddr_t *addr)
 {
     struct acpi_table_xsdt *xsdt;
-    struct acpi_table_header *table;
-    struct acpi_table_rsdp *rsdp;
     const struct acpi_table_desc *tables = acpi_gbl_root_table_list.tables;
     unsigned long size = sizeof(*xsdt);
     unsigned int i, j, num_tables = 0;
-    paddr_t xsdt_paddr;
     int rc;
+    struct acpi_table_header header = {
+        .signature    = "XSDT",
+        .length       = sizeof(struct acpi_table_header),
+        .revision     = 0x1,
+        .oem_id       = "Xen",
+        .oem_table_id = "HVM",
+        .oem_revision = 0,
+    };
 
     /*
      * Restore original DMAR table signature, we are going to filter it from
@@ -1001,26 +1006,7 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
         goto out;
     }
 
-    /* Copy the native XSDT table header. */
-    rsdp = acpi_os_map_memory(acpi_os_get_root_pointer(), sizeof(*rsdp));
-    if ( !rsdp )
-    {
-        printk("Unable to map RSDP\n");
-        rc = -EINVAL;
-        goto out;
-    }
-    xsdt_paddr = rsdp->xsdt_physical_address;
-    acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
-    table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
-    if ( !table )
-    {
-        printk("Unable to map XSDT\n");
-        rc = -EINVAL;
-        goto out;
-    }
-    xsdt->header = *table;
-    acpi_os_unmap_memory(table, sizeof(*table));
-
+    xsdt->header = header;
     /* Add the custom MADT. */
     xsdt->table_offset_entry[0] = madt_addr;
 
-- 
2.25.1


