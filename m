Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CAA7013B8
	for <lists+xen-devel@lfdr.de>; Sat, 13 May 2023 03:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534091.831327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxdt4-0001M7-GJ; Sat, 13 May 2023 01:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534091.831327; Sat, 13 May 2023 01:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxdt4-0001H2-9y; Sat, 13 May 2023 01:17:30 +0000
Received: by outflank-mailman (input) for mailman id 534091;
 Sat, 13 May 2023 01:17:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lw2b=BC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pxdt3-0000mh-1G
 for xen-devel@lists.xenproject.org; Sat, 13 May 2023 01:17:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec1f4da1-f12b-11ed-b229-6b7b168915f2;
 Sat, 13 May 2023 03:17:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 415B764F81;
 Sat, 13 May 2023 01:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A4CC4339C;
 Sat, 13 May 2023 01:17:24 +0000 (UTC)
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
X-Inumbo-ID: ec1f4da1-f12b-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683940645;
	bh=Vqt3dc2X13y3hImbmGgang3paCHhm/n+3O0YoROZygc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rVLTB26Ei78khR18G+mDArFo+ngYBjl+oolbzCkU2dwF7MUexmfmpaPUabnzLbqsG
	 +vkE39MaENgM/uffCfXaQbrMKC9UG9+UqdGDcRW+W3cQbvroUU0w9UjZM1P9mxQltE
	 plccqG+mqnRPB9q/tVFzYSJW7cVN4Jylht74me8Ek9dTNMFglPSk77xDE3krNYbW7u
	 7ISjBh54NZ4HnItGmwFkKeyHBNb4Wia1H+KAfClw3D3kSJ39sDhce4modls5SI7mj2
	 nQNTkroWbKmPPh0qEsnpYZY4nsCo8hjTNOOeWZqQ3EhrXgNHe3/+iH+5bVMkks1UgU
	 K+1myxGuV7NMQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: roger.pau@citrix.com,
	andrew.cooper3@citrix.com,
	jbeulich@suse.com
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Xenia.Ragiadakou@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH 2/2] xen/x86/pvh: copy ACPI tables to Dom0 instead of mapping
Date: Fri, 12 May 2023 18:17:20 -0700
Message-Id: <20230513011720.3978354-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Mapping the ACPI tables to Dom0 PVH 1:1 leads to memory corruptions of
the tables in the guest. Instead, copy the tables to Dom0.

This is a workaround.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
As mentioned in the cover letter, this is a RFC workaround as I don't
know the cause of the underlying problem. I do know that this patch
solves what would be otherwise a hang at boot when Dom0 PVH attempts to
parse ACPI tables.
---
 xen/arch/x86/hvm/dom0_build.c | 107 +++++++++-------------------------
 1 file changed, 27 insertions(+), 80 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 5fde769863..a6037fc6ed 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -73,32 +73,6 @@ static void __init print_order_stats(const struct domain *d)
             printk("order %2u allocations: %u\n", i, order_stats[i]);
 }
 
-static int __init modify_identity_mmio(struct domain *d, unsigned long pfn,
-                                       unsigned long nr_pages, const bool map)
-{
-    int rc;
-
-    for ( ; ; )
-    {
-        rc = map ?   map_mmio_regions(d, _gfn(pfn), nr_pages, _mfn(pfn))
-                 : unmap_mmio_regions(d, _gfn(pfn), nr_pages, _mfn(pfn));
-        if ( rc == 0 )
-            break;
-        if ( rc < 0 )
-        {
-            printk(XENLOG_WARNING
-                   "Failed to identity %smap [%#lx,%#lx) for d%d: %d\n",
-                   map ? "" : "un", pfn, pfn + nr_pages, d->domain_id, rc);
-            break;
-        }
-        nr_pages -= rc;
-        pfn += rc;
-        process_pending_softirqs();
-    }
-
-    return rc;
-}
-
 /* Populate a HVM memory range using the biggest possible order. */
 static int __init pvh_populate_memory_range(struct domain *d,
                                             unsigned long start,
@@ -967,6 +941,8 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
     unsigned long size = sizeof(*xsdt);
     unsigned int i, j, num_tables = 0;
     int rc;
+    struct acpi_table_fadt fadt;
+    unsigned long fadt_addr = 0, dsdt_addr = 0, facs_addr = 0, fadt_size = 0;
     struct acpi_table_header header = {
         .signature    = "XSDT",
         .length       = sizeof(struct acpi_table_header),
@@ -1013,10 +989,33 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
     /* Copy the addresses of the rest of the allowed tables. */
     for( i = 0, j = 1; i < acpi_gbl_root_table_list.count; i++ )
     {
+        void *table;
+
+        pvh_steal_ram(d, tables[i].length, 0, GB(4), addr);
+        table = acpi_os_map_memory(tables[i].address, tables[i].length);
+        hvm_copy_to_guest_phys(*addr, table, tables[i].length, d->vcpu[0]);
+        pvh_add_mem_range(d, *addr, *addr + tables[i].length, E820_ACPI);
+
+        if ( !strncmp(tables[i].signature.ascii, ACPI_SIG_FADT, ACPI_NAME_SIZE) )
+        {
+            memcpy(&fadt, table, tables[i].length);
+            fadt_addr = *addr;
+            fadt_size = tables[i].length;
+        }
+        else if ( !strncmp(tables[i].signature.ascii, ACPI_SIG_DSDT, ACPI_NAME_SIZE) )
+                dsdt_addr = *addr;
+        else if ( !strncmp(tables[i].signature.ascii, ACPI_SIG_FACS, ACPI_NAME_SIZE) )
+                facs_addr = *addr;
+
         if ( pvh_acpi_xsdt_table_allowed(tables[i].signature.ascii,
-                                         tables[i].address, tables[i].length) )
-            xsdt->table_offset_entry[j++] = tables[i].address;
+                    tables[i].address, tables[i].length) )
+            xsdt->table_offset_entry[j++] = *addr;
+
+        acpi_os_unmap_memory(table, tables[i].length);
     }
+    fadt.dsdt = dsdt_addr;
+    fadt.facs = facs_addr;
+    hvm_copy_to_guest_phys(fadt_addr, &fadt, fadt_size, d->vcpu[0]);
 
     xsdt->header.revision = 1;
     xsdt->header.length = size;
@@ -1055,9 +1054,7 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
 
 static int __init pvh_setup_acpi(struct domain *d, paddr_t start_info)
 {
-    unsigned long pfn, nr_pages;
     paddr_t madt_paddr, xsdt_paddr, rsdp_paddr;
-    unsigned int i;
     int rc;
     struct acpi_table_rsdp *native_rsdp, rsdp = {
         .signature = ACPI_SIG_RSDP,
@@ -1065,56 +1062,6 @@ static int __init pvh_setup_acpi(struct domain *d, paddr_t start_info)
         .length = sizeof(rsdp),
     };
 
-
-    /* Scan top-level tables and add their regions to the guest memory map. */
-    for( i = 0; i < acpi_gbl_root_table_list.count; i++ )
-    {
-        const char *sig = acpi_gbl_root_table_list.tables[i].signature.ascii;
-        unsigned long addr = acpi_gbl_root_table_list.tables[i].address;
-        unsigned long size = acpi_gbl_root_table_list.tables[i].length;
-
-        /*
-         * Make sure the original MADT is also mapped, so that Dom0 can
-         * properly access the data returned by _MAT methods in case it's
-         * re-using MADT memory.
-         */
-        if ( strncmp(sig, ACPI_SIG_MADT, ACPI_NAME_SIZE)
-             ? pvh_acpi_table_allowed(sig, addr, size)
-             : !acpi_memory_banned(addr, size) )
-             pvh_add_mem_range(d, addr, addr + size, E820_ACPI);
-    }
-
-    /* Identity map ACPI e820 regions. */
-    for ( i = 0; i < d->arch.nr_e820; i++ )
-    {
-        if ( d->arch.e820[i].type != E820_ACPI &&
-             d->arch.e820[i].type != E820_NVS )
-            continue;
-
-        pfn = PFN_DOWN(d->arch.e820[i].addr);
-        nr_pages = PFN_UP((d->arch.e820[i].addr & ~PAGE_MASK) +
-                          d->arch.e820[i].size);
-
-        /* Memory below 1MB has been dealt with by pvh_populate_p2m(). */
-        if ( pfn < PFN_DOWN(MB(1)) )
-        {
-            if ( pfn + nr_pages <= PFN_DOWN(MB(1)) )
-                continue;
-
-            /* This shouldn't happen, but is easy to deal with. */
-            nr_pages -= PFN_DOWN(MB(1)) - pfn;
-            pfn = PFN_DOWN(MB(1));
-        }
-
-        rc = modify_identity_mmio(d, pfn, nr_pages, true);
-        if ( rc )
-        {
-            printk("Failed to map ACPI region [%#lx, %#lx) into Dom0 memory map\n",
-                   pfn, pfn + nr_pages);
-            return rc;
-        }
-    }
-
     rc = pvh_setup_acpi_madt(d, &madt_paddr);
     if ( rc )
         return rc;
-- 
2.25.1


