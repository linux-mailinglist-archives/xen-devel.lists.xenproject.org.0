Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C82DEAB880D
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:33:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985501.1371470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYiD-0000Tc-Lg; Thu, 15 May 2025 13:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985501.1371470; Thu, 15 May 2025 13:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYiD-0000RZ-IN; Thu, 15 May 2025 13:33:25 +0000
Received: by outflank-mailman (input) for mailman id 985501;
 Thu, 15 May 2025 13:33:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYWM-0006hT-Qe
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:21:10 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73edea6f-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:21:05 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315103566363.29787566925177;
 Thu, 15 May 2025 06:18:23 -0700 (PDT)
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
X-Inumbo-ID: 73edea6f-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315107; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h/8SfCi/q6inf5hS1mt/6cSpaKpPtklfhIigIpCmJdfAM0R1cu1ydlGCXunnglVpmEWHuaDrtNBcAu5kR8VVyz6bP9IV0chgaMpntomlHHHv0iKWLnsU3ecFBDg/xoRGbib0JBFtz01cKqN2+2waO0hZvvpv8zdT6OhKVtTde40=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315107; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+GzD7/fP7kG1xQPJZ8ioOdU2IvSPsjxcOM1xI/p7exg=; 
	b=ZilSYlCY6nCs9JVXVBNBiR4hSMF5/aWy9UexHr+wdd9+KeG0ruIYQwx41UwaRZJhyEuXE1NXgOw4wRaP5J60TxANsR9bzJO1gFtixurn+sM/Jf3m5fyEDfBb76qU3qAQaIyriryVPgWzIF6/hmdNvrn4Rqlbzwx5MPSx8OgQo/g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315107;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=+GzD7/fP7kG1xQPJZ8ioOdU2IvSPsjxcOM1xI/p7exg=;
	b=WNEACyy91uOFtNyo/EYzWz7UB/4xQDa/2XHTKi3O6cH6foShp7eonP0EJ35+oJM6
	5D1McVEkmv0SbfMn5/0le7L/OCKKrgGplF5RqIAkgk7sqveZMVodEtCw5iA3lmbuBmo
	lcVqlh21J1L3x94aZWyu17492Li0/mPRZ74vwHto=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 18/38] x86/hyperlaunch: add domu memory map construction
Date: Thu, 15 May 2025 09:17:24 -0400
Message-Id: <20250515131744.3843-19-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce hvm_setup_e820() that will build the e820 memory map for a general
domU. To populate the ACPI entry, ACPI table size helpers are introduced. A
conditional is added to the domain builder to select between calling
hvm_setup_e820() and dom0_pvh_setup_e820() depending on if it is building dom0
or a domU.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/hvm/dom_build.c | 149 ++++++++++++++++++++++++++++++++++-
 1 file changed, 148 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index c182847147b0..e724d578c5d4 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -17,6 +17,7 @@
 
 #include <acpi/actables.h>
 
+#include <public/hvm/e820.h>
 #include <public/hvm/hvm_vcpu.h>
 
 #include <asm/bootinfo.h>
@@ -44,12 +45,158 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
     }
 }
 
+static unsigned long __init hvm_size_acpi_madt(struct domain *d)
+{
+    unsigned long size = sizeof(struct acpi_table_madt);
+
+    size += sizeof(struct acpi_madt_local_apic) * d->max_vcpus;
+
+    return size;
+}
+
+static unsigned long __init hvm_size_acpi_xsdt(struct domain *d)
+{
+    unsigned long size = sizeof(struct acpi_table_xsdt);
+    /* Only adding the MADT table to the XSDT. */
+    unsigned int num_tables = 1;
+
+    /*
+     * No need to add or subtract anything because struct acpi_table_xsdt
+     * includes one array slot already.
+     */
+    size += num_tables * sizeof(uint64_t);
+
+    return size;
+}
+
+static unsigned long __init hvm_size_acpi_region(struct domain *d)
+{
+    unsigned long size = sizeof(struct acpi_table_rsdp);
+
+    size += hvm_size_acpi_xsdt(d);
+    size += hvm_size_acpi_madt(d);
+
+    return ROUNDUP(size, PAGE_SIZE);
+}
+
+/* From xenguest lib */
+#define END_SPECIAL_REGION   0xff000U
+#define NR_SPECIAL_PAGES     8
+#define START_SPECIAL_REGION (END_SPECIAL_REGION - NR_SPECIAL_PAGES)
+
+#define SPECIALPAGE_PAGING   0
+#define SPECIALPAGE_ACCESS   1
+#define SPECIALPAGE_SHARING  2
+#define SPECIALPAGE_BUFIOREQ 3
+#define SPECIALPAGE_XENSTORE 4
+#define SPECIALPAGE_IOREQ    5
+#define SPECIALPAGE_IDENT_PT 6
+#define SPECIALPAGE_CONSOLE  7
+#define special_pfn(x)       (START_SPECIAL_REGION + (x))
+
+/*
+ * Allocation scheme, derived from xenlight/xenguest:
+ *
+ *                                  |  <4G MMIO Hole  |
+ * [ Low Mem ][ RDM Mem ][ >1M Mem ][ ACPI ][ Special ][ High Mem ]
+ *
+ */
+static void __init hvm_setup_e820(struct domain *d, unsigned long nr_pages)
+{
+    const uint32_t lowmem_reserved_base = 0x9e000;
+    const uint32_t rdm_base = 0xa0000, rdm_size = 0x60;
+    unsigned long low_pages, ext_pages, mmio_pages, acpi_pages, high_pages = 0;
+    unsigned long max_ext_pages = (HVM_BELOW_4G_MMIO_START - MB(1)) >> PAGE_SHIFT,
+                  page_count = 0;
+    unsigned nr = 0, e820_entries = 5;
+
+    /* low pages: below 1MB */
+    low_pages = lowmem_reserved_base >> PAGE_SHIFT;
+    if ( low_pages > nr_pages )
+        panic("Insufficient memory for HVM/PVH domain (%pd)\n", d);
+
+    acpi_pages = hvm_size_acpi_region(d) >> PAGE_SHIFT;
+    mmio_pages = acpi_pages + NR_SPECIAL_PAGES;
+
+    /* ext pages: from 1MB to mmio hole */
+    ext_pages = nr_pages - (low_pages + mmio_pages);
+    if ( ext_pages > max_ext_pages )
+        ext_pages = max_ext_pages;
+
+    /* high pages: above 4GB */
+    if ( nr_pages > (low_pages + mmio_pages + ext_pages) )
+        high_pages = nr_pages - (low_pages + mmio_pages + ext_pages);
+
+    /* If we should have a highmem range, add one more e820 entry */
+    if ( high_pages )
+        e820_entries++;
+
+    ASSERT(e820_entries < E820MAX);
+
+    d->arch.e820 = xzalloc_array(struct e820entry, e820_entries);
+    if ( !d->arch.e820 )
+        panic("Unable to allocate memory for boot domain e820 map\n");
+
+    /* usable: Low memory */
+    d->arch.e820[nr].addr = 0x000000;
+    d->arch.e820[nr].size = low_pages << PAGE_SHIFT;
+    d->arch.e820[nr].type = E820_RAM;
+    page_count += d->arch.e820[nr].size >> PAGE_SHIFT;
+    nr++;
+
+    /* reserved: lowmem reserved device memory */
+    d->arch.e820[nr].addr = rdm_base;
+    d->arch.e820[nr].size = rdm_size;
+    d->arch.e820[nr].type = E820_RESERVED;
+    nr++;
+
+    /* usable: extended memory from 1MB */
+    d->arch.e820[nr].addr = 0x100000;
+    d->arch.e820[nr].size = ext_pages << PAGE_SHIFT;
+    d->arch.e820[nr].type = E820_RAM;
+    page_count += d->arch.e820[nr].size >> PAGE_SHIFT;
+    nr++;
+
+    /* reserved: ACPI entry, ACPI_INFO_PHYSICAL_ADDRESS */
+    d->arch.e820[nr].addr = 0xFC000000;
+    d->arch.e820[nr].size = acpi_pages << PAGE_SHIFT;
+    d->arch.e820[nr].type = E820_ACPI;
+    page_count += d->arch.e820[nr].size >> PAGE_SHIFT;
+    nr++;
+
+    /* reserved: HVM special pages, X86_HVM_END_SPECIAL_REGION */
+    d->arch.e820[nr].addr = START_SPECIAL_REGION << PAGE_SHIFT;
+    d->arch.e820[nr].size = NR_SPECIAL_PAGES << PAGE_SHIFT;
+    d->arch.e820[nr].type = E820_RESERVED;
+    page_count += d->arch.e820[nr].size >> PAGE_SHIFT;
+    nr++;
+
+    /* usable: highmem */
+    if ( high_pages )
+    {
+        d->arch.e820[nr].addr = 0x100000000;
+        d->arch.e820[nr].size = high_pages << PAGE_SHIFT;
+        d->arch.e820[nr].type = E820_RAM;
+        page_count += d->arch.e820[nr].size >> PAGE_SHIFT;
+        nr++;
+    }
+
+    d->arch.nr_e820 = nr;
+
+    ASSERT(nr == e820_entries);
+    ASSERT(nr_pages == page_count);
+}
+
 static void __init pvh_init_p2m(struct boot_domain *bd)
 {
     unsigned long nr_pages = dom_compute_nr_pages(bd, NULL);
     bool preempted;
 
-    dom0_pvh_setup_e820(bd->d, nr_pages);
+    if ( bd->capabilities & DOMAIN_CAPS_HARDWARE )
+        dom0_pvh_setup_e820(bd->d, nr_pages);
+    else
+        hvm_setup_e820(bd->d, nr_pages);
+
     do {
         preempted = false;
         paging_set_allocation(bd->d, dom_paging_pages(bd, nr_pages),
-- 
2.30.2


