Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098EDAB87F8
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985474.1371440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYgZ-0007Fo-RO; Thu, 15 May 2025 13:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985474.1371440; Thu, 15 May 2025 13:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYgZ-0007Cy-O2; Thu, 15 May 2025 13:31:43 +0000
Received: by outflank-mailman (input) for mailman id 985474;
 Thu, 15 May 2025 13:31:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYWS-0006hT-1g
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:21:16 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78f53c52-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:21:14 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 174731516815094.66533661486642;
 Thu, 15 May 2025 06:19:28 -0700 (PDT)
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
X-Inumbo-ID: 78f53c52-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315170; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ehnRpR6rvHOWR2yDbSP0FkXCojYi4YLEf1XuSItEKSHxne4YeuaOpVp6Iib24woqulTmoQKUtF5ykJcNfkmUyjLB352PntOY3Evdu7aT6GDXVCCdKnDTEM+vj4Nw0JYCE7YMqyYY2ZNJ7ZxkpwKhQOc0dUsEQmc8rr57MRyIVmo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315170; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vOIQ5k3ttEx9/mkvbELUIg9KG/lF3PK9LAheb8twtJc=; 
	b=BIMhkGTxC8t2othyEGncHHfh7SH9KVgc0tzQu7CLJVKSVTXmYtDE/gSbMRuZ/+5jQAKrcpZ18qR90emtgNUQWyCZke3HaH+EBu2rfhNvzyDZ9LSSclakiwdvlJjwaCqrfKWqpydnH1K73NQG8TkwLic7054xbv8RIUQZRWh1oJU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315170;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=vOIQ5k3ttEx9/mkvbELUIg9KG/lF3PK9LAheb8twtJc=;
	b=AaBXl1SjiEoaEhQLgZuORnwigZtXI+WwWh3AcqqKyLFqo5hcIqOjslp2SRgKpQDR
	2E2raoG+XUrLhxDhyCjqkKCpCMRclIDiNaRosPZpklHDJhJxwuXgYeAuLE+im81o4LQ
	rJX5HbmDSltcdC6d33gU0ja/1JAcdwmNEI3GXrfk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 21/38] x86/hyperlaunch: relocate pvh_steal_ram to domain builder
Date: Thu, 15 May 2025 09:19:04 -0400
Message-Id: <20250515131912.5019-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131912.5019-1-dpsmith@apertussolutions.com>
References: <20250515131912.5019-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The function pvh_steal_ram() is not pvh specific and can be used on any HVM
domain. Move to the domain builder and rename to hvm_steal_ram.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/hvm/dom0_build.c             | 106 +++-------------------
 xen/arch/x86/hvm/dom_build.c              |  84 +++++++++++++++++
 xen/arch/x86/include/asm/domain-builder.h |   7 ++
 3 files changed, 102 insertions(+), 95 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index ffe198d94d9e..d379383d3096 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -183,90 +183,6 @@ int __init pvh_populate_memory_range(
     return 0;
 }
 
-/* Steal RAM from the end of a memory region. */
-static int __init pvh_steal_ram(struct domain *d, unsigned long size,
-                                unsigned long align, paddr_t limit,
-                                paddr_t *addr)
-{
-    unsigned int i = d->arch.nr_e820;
-
-    /*
-     * Alignment 0 should be set to 1, so it doesn't wrap around in the
-     * calculations below.
-     */
-    align = align ? : 1;
-    while ( i-- )
-    {
-        struct e820entry *entry = &d->arch.e820[i];
-
-        if ( entry->type != E820_RAM || entry->addr + entry->size > limit )
-            continue;
-
-        *addr = (entry->addr + entry->size - size) & ~(align - 1);
-        if ( *addr < entry->addr ||
-             /* Don't steal from the low 1MB due to the copying done there. */
-             *addr < MB(1) )
-            continue;
-
-        entry->size = *addr - entry->addr;
-        return 0;
-    }
-
-    return -ENOMEM;
-}
-
-/* NB: memory map must be sorted at all times for this to work correctly. */
-static int __init pvh_add_mem_range(struct domain *d, uint64_t s, uint64_t e,
-                                    unsigned int type)
-{
-    struct e820entry *map;
-    unsigned int i;
-
-    for ( i = 0; i < d->arch.nr_e820; i++ )
-    {
-        uint64_t rs = d->arch.e820[i].addr;
-        uint64_t re = rs + d->arch.e820[i].size;
-
-        if ( rs == e && d->arch.e820[i].type == type )
-        {
-            d->arch.e820[i].addr = s;
-            return 0;
-        }
-
-        if ( re == s && d->arch.e820[i].type == type &&
-             (i + 1 == d->arch.nr_e820 || d->arch.e820[i + 1].addr >= e) )
-        {
-            d->arch.e820[i].size += e - s;
-            return 0;
-        }
-
-        if ( rs >= e )
-            break;
-
-        if ( re > s )
-            return -EEXIST;
-    }
-
-    map = xzalloc_array(struct e820entry, d->arch.nr_e820 + 1);
-    if ( !map )
-    {
-        printk(XENLOG_WARNING "E820: out of memory to add region\n");
-        return -ENOMEM;
-    }
-
-    memcpy(map, d->arch.e820, i * sizeof(*d->arch.e820));
-    memcpy(map + i + 1, d->arch.e820 + i,
-           (d->arch.nr_e820 - i) * sizeof(*d->arch.e820));
-    map[i].addr = s;
-    map[i].size = e - s;
-    map[i].type = type;
-    xfree(d->arch.e820);
-    d->arch.e820 = map;
-    d->arch.nr_e820++;
-
-    return 0;
-}
-
 static int __init pvh_setup_vmx_realmode_helpers(struct domain *d)
 {
     uint32_t rc, *ident_pt;
@@ -280,14 +196,14 @@ static int __init pvh_setup_vmx_realmode_helpers(struct domain *d)
      * TSS structure (which accounts for the first 104b) doesn't cross
      * a page boundary.
      */
-    if ( !pvh_steal_ram(d, HVM_VM86_TSS_SIZE, 128, GB(4), &gaddr) )
+    if ( !hvm_steal_ram(d, HVM_VM86_TSS_SIZE, 128, GB(4), &gaddr) )
     {
         if ( hvm_copy_to_guest_phys(gaddr, NULL, HVM_VM86_TSS_SIZE, v) !=
              HVMTRANS_okay )
             printk("Unable to zero VM86 TSS area\n");
         d->arch.hvm.params[HVM_PARAM_VM86_TSS_SIZED] =
             VM86_TSS_UPDATED | ((uint64_t)HVM_VM86_TSS_SIZE << 32) | gaddr;
-        if ( pvh_add_mem_range(d, gaddr, gaddr + HVM_VM86_TSS_SIZE,
+        if ( hvm_add_mem_range(d, gaddr, gaddr + HVM_VM86_TSS_SIZE,
                                E820_RESERVED) )
             printk("Unable to set VM86 TSS as reserved in the memory map\n");
     }
@@ -295,7 +211,7 @@ static int __init pvh_setup_vmx_realmode_helpers(struct domain *d)
         printk("Unable to allocate VM86 TSS area\n");
 
     /* Steal some more RAM for the identity page tables. */
-    if ( pvh_steal_ram(d, PAGE_SIZE, PAGE_SIZE, GB(4), &gaddr) )
+    if ( hvm_steal_ram(d, PAGE_SIZE, PAGE_SIZE, GB(4), &gaddr) )
     {
         printk("Unable to find memory to stash the identity page tables\n");
         return -ENOMEM;
@@ -317,7 +233,7 @@ static int __init pvh_setup_vmx_realmode_helpers(struct domain *d)
     unmap_domain_page(ident_pt);
     put_page(mfn_to_page(mfn));
     d->arch.hvm.params[HVM_PARAM_IDENT_PT] = gaddr;
-    if ( pvh_add_mem_range(d, gaddr, gaddr + PAGE_SIZE, E820_RESERVED) )
+    if ( hvm_add_mem_range(d, gaddr, gaddr + PAGE_SIZE, E820_RESERVED) )
             printk("Unable to set identity page tables as reserved in the memory map\n");
 
     return 0;
@@ -582,7 +498,7 @@ static int __init pvh_setup_acpi_madt(struct domain *d, paddr_t *addr)
     madt->header.checksum -= acpi_tb_checksum(ACPI_CAST_PTR(u8, madt), size);
 
     /* Place the new MADT in guest memory space. */
-    if ( pvh_steal_ram(d, size, 0, GB(4), addr) )
+    if ( hvm_steal_ram(d, size, 0, GB(4), addr) )
     {
         printk("Unable to steal guest RAM for MADT\n");
         rc = -ENOMEM;
@@ -590,7 +506,7 @@ static int __init pvh_setup_acpi_madt(struct domain *d, paddr_t *addr)
     }
 
     /* Mark this region as E820_ACPI. */
-    if ( pvh_add_mem_range(d, *addr, *addr + size, E820_ACPI) )
+    if ( hvm_add_mem_range(d, *addr, *addr + size, E820_ACPI) )
         printk("Unable to add MADT region to memory map\n");
 
     rc = hvm_copy_to_guest_phys(*addr, madt, size, d->vcpu[0]);
@@ -770,7 +686,7 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
     xsdt->header.checksum -= acpi_tb_checksum(ACPI_CAST_PTR(u8, xsdt), size);
 
     /* Place the new XSDT in guest memory space. */
-    if ( pvh_steal_ram(d, size, 0, GB(4), addr) )
+    if ( hvm_steal_ram(d, size, 0, GB(4), addr) )
     {
         printk("Unable to find guest RAM for XSDT\n");
         rc = -ENOMEM;
@@ -778,7 +694,7 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
     }
 
     /* Mark this region as E820_ACPI. */
-    if ( pvh_add_mem_range(d, *addr, *addr + size, E820_ACPI) )
+    if ( hvm_add_mem_range(d, *addr, *addr + size, E820_ACPI) )
         printk("Unable to add XSDT region to memory map\n");
 
     rc = hvm_copy_to_guest_phys(*addr, xsdt, size, d->vcpu[0]);
@@ -824,7 +740,7 @@ int __init dom0_pvh_setup_acpi(struct domain *d, paddr_t start_info)
         if ( strncmp(sig, ACPI_SIG_MADT, ACPI_NAME_SIZE)
              ? pvh_acpi_table_allowed(sig, addr, size)
              : !acpi_memory_banned(addr, size) )
-             pvh_add_mem_range(d, addr, addr + size, E820_ACPI);
+             hvm_add_mem_range(d, addr, addr + size, E820_ACPI);
     }
 
     /* Identity map ACPI e820 regions. */
@@ -893,14 +809,14 @@ int __init dom0_pvh_setup_acpi(struct domain *d, paddr_t start_info)
      * the native RSDT, and should not be used for the Dom0 kernel's boot
      * purposes (we keep it visible for post boot access).
      */
-    if ( pvh_steal_ram(d, sizeof(rsdp), 0, GB(4), &rsdp_paddr) )
+    if ( hvm_steal_ram(d, sizeof(rsdp), 0, GB(4), &rsdp_paddr) )
     {
         printk("Unable to allocate guest RAM for RSDP\n");
         return -ENOMEM;
     }
 
     /* Mark this region as E820_ACPI. */
-    if ( pvh_add_mem_range(d, rsdp_paddr, rsdp_paddr + sizeof(rsdp),
+    if ( hvm_add_mem_range(d, rsdp_paddr, rsdp_paddr + sizeof(rsdp),
                            E820_ACPI) )
         printk("Unable to add RSDP region to memory map\n");
 
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index bf361ba3f3f6..2157340335d2 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -279,6 +279,38 @@ static int __init hvm_populate_p2m(struct domain *d)
     return 0;
 }
 
+/* Steal RAM from the end of a memory region. */
+int __init hvm_steal_ram(
+    struct domain *d, unsigned long size, unsigned long align, paddr_t limit,
+    paddr_t *addr)
+{
+    unsigned int i = d->arch.nr_e820;
+
+    /*
+     * Alignment 0 should be set to 1, so it doesn't wrap around in the
+     * calculations below.
+     */
+    align = align ? : 1;
+    while ( i-- )
+    {
+        struct e820entry *entry = &d->arch.e820[i];
+
+        if ( entry->type != E820_RAM || entry->addr + entry->size > limit )
+            continue;
+
+        *addr = (entry->addr + entry->size - size) & ~(align - 1);
+        if ( *addr < entry->addr ||
+             /* Don't steal from the low 1MB due to the copying done there. */
+             *addr < MB(1) )
+            continue;
+
+        entry->size = *addr - entry->addr;
+        return 0;
+    }
+
+    return -ENOMEM;
+}
+
 static paddr_t __init find_memory(
     const struct domain *d, const struct elf_binary *elf, size_t size)
 {
@@ -325,6 +357,58 @@ static paddr_t __init find_memory(
     return INVALID_PADDR;
 }
 
+/* NB: memory map must be sorted at all times for this to work correctly. */
+int __init hvm_add_mem_range(
+    struct domain *d, uint64_t s, uint64_t e, unsigned int type)
+{
+    struct e820entry *map;
+    unsigned int i;
+
+    for ( i = 0; i < d->arch.nr_e820; i++ )
+    {
+        uint64_t rs = d->arch.e820[i].addr;
+        uint64_t re = rs + d->arch.e820[i].size;
+
+        if ( rs == e && d->arch.e820[i].type == type )
+        {
+            d->arch.e820[i].addr = s;
+            return 0;
+        }
+
+        if ( re == s && d->arch.e820[i].type == type &&
+             (i + 1 == d->arch.nr_e820 || d->arch.e820[i + 1].addr >= e) )
+        {
+            d->arch.e820[i].size += e - s;
+            return 0;
+        }
+
+        if ( rs >= e )
+            break;
+
+        if ( re > s )
+            return -EEXIST;
+    }
+
+    map = xzalloc_array(struct e820entry, d->arch.nr_e820 + 1);
+    if ( !map )
+    {
+        printk(XENLOG_WARNING "E820: out of memory to add region\n");
+        return -ENOMEM;
+    }
+
+    memcpy(map, d->arch.e820, i * sizeof(*d->arch.e820));
+    memcpy(map + i + 1, d->arch.e820 + i,
+           (d->arch.nr_e820 - i) * sizeof(*d->arch.e820));
+    map[i].addr = s;
+    map[i].size = e - s;
+    map[i].type = type;
+    xfree(d->arch.e820);
+    d->arch.e820 = map;
+    d->arch.nr_e820++;
+
+    return 0;
+}
+
 static bool __init check_load_address(
     const struct domain *d, const struct elf_binary *elf)
 {
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
index 2de73117cb7f..15a0e3b12c02 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -4,10 +4,17 @@
 struct boot_domain;
 struct elf_dom_parms;
 
+int hvm_add_mem_range(
+    struct domain *d, uint64_t s, uint64_t e, unsigned int type);
+
 int hvm_setup_cpus(struct domain *d, paddr_t entry, paddr_t start_info);
 int pvh_populate_memory_range(
     struct domain *d, unsigned long start, unsigned long nr_pages);
 
+int hvm_steal_ram(
+    struct domain *d, unsigned long size, unsigned long align, paddr_t limit,
+    paddr_t *addr);
+
 unsigned long dom_paging_pages(
     const struct boot_domain *d, unsigned long nr_pages);
 
-- 
2.30.2


