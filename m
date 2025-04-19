Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E001A945C4
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:21:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960254.1352354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYw-0004u0-T2; Sat, 19 Apr 2025 22:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960254.1352354; Sat, 19 Apr 2025 22:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYw-0004qZ-FD; Sat, 19 Apr 2025 22:21:26 +0000
Received: by outflank-mailman (input) for mailman id 960254;
 Sat, 19 Apr 2025 22:21:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GPw-0004yY-HI
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:12:08 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54384874-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:12:07 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100548675466.4706189515272;
 Sat, 19 Apr 2025 15:09:08 -0700 (PDT)
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
X-Inumbo-ID: 54384874-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100552; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ElxRJqYtZe7ohyN2i5hH9DKMkius3OTgqmRUQSCXRFxaKRBAJv56z/TU5ZF7LXnQt/ollB0by6LCc5/5l9M0DJqLHRSnJhGdRtnFVAxnXTi4pj49BuGZLsgtBig7s/ONX2vNYR6Pqve3SiPjqx5W1A6vCckRkGWM+lLSK9UGICw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100552; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GejcDqJh4eQpJAs/6oq6gMhMd3jidjZDIYzSmQIkSCQ=; 
	b=JpR0xaxhPe6R70jq41xcFaG52X7TLQRb5rwfVubIvvuvl1yczoqyAac9kIyqJ/SKlBHldlnIidJT5QWi+tRBTpRss25uXxZ0CcIIr0dKsZAMmIE2M9712kZtUJoPbqUVR2BaRIy3TiKcnQ573Bd/e1uJoGPN+2b16wSa7dsri14=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100552;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=GejcDqJh4eQpJAs/6oq6gMhMd3jidjZDIYzSmQIkSCQ=;
	b=iKmWKfuSxPlOaKxRc30RWqNNqG1Apa1rBEX2BdlEgkZfQS+pImHabGak0DFLIGP2
	Z/TEWxW2yeQ4E0K7vsz49ytpuKPVjRkQ9DOqkbd8v12R5JFZXt01IMq/k3vsJsOrBka
	KCBB+CCfSmrF9I79FqQ6dPtvDbaFRmv3Oks4zAmY=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 23/38] x86/hyperlaunch: add domu acpi construction
Date: Sat, 19 Apr 2025 18:08:05 -0400
Message-Id: <20250419220820.4234-24-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce hvm_setup_acpi() that will construct an APCI table for a general HVM
domU guest.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/hvm/dom_build.c | 213 ++++++++++++++++++++++++++++++++++-
 1 file changed, 212 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index f997f293f329..c482d5c2d974 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -408,6 +408,214 @@ int __init hvm_add_mem_range(
     return 0;
 }
 
+static int __init hvm_setup_acpi_madt(
+    struct domain *d, struct acpi_table_madt *madt)
+{
+    struct acpi_table_header *table;
+    struct acpi_madt_local_apic *lapic;
+    acpi_status status;
+    unsigned long size = hvm_size_acpi_madt(d);
+    int i;
+
+    /* Copy the native MADT table header. */
+    status = acpi_get_table(ACPI_SIG_MADT, 0, &table);
+    if ( !ACPI_SUCCESS(status) )
+    {
+        printk("Failed to get MADT ACPI table, aborting.\n");
+        return -EINVAL;
+    }
+    madt->header = *table;
+    madt->address = APIC_DEFAULT_PHYS_BASE;
+    /*
+     * NB: this is currently set to 4, which is the revision in the ACPI
+     * spec 6.1. Sadly ACPICA doesn't provide revision numbers for the
+     * tables described in the headers.
+     */
+    madt->header.revision = min_t(unsigned char, table->revision, 4);
+
+    lapic = (void *)(madt + 1);
+
+    for ( i = 0; i < d->max_vcpus; i++ )
+    {
+        lapic->header.type = ACPI_MADT_TYPE_LOCAL_APIC;
+        lapic->header.length = sizeof(*lapic);
+        lapic->id = i * 2;
+        lapic->processor_id = i;
+        lapic->lapic_flags = ACPI_MADT_ENABLED;
+
+        lapic++;
+    }
+
+    madt->header.length = size;
+    /*
+     * Calling acpi_tb_checksum here is a layering violation, but
+     * introducing a wrapper for such simple usage seems overkill.
+     */
+    madt->header.checksum -= acpi_tb_checksum(ACPI_CAST_PTR(u8, madt), size);
+
+    return 0;
+}
+
+static int __init hvm_setup_acpi_xsdt(
+    struct domain *d, struct acpi_table_xsdt *xsdt, paddr_t madt_addr)
+{
+    struct acpi_table_header *table;
+    struct acpi_table_rsdp *rsdp;
+    unsigned long size = hvm_size_acpi_xsdt(d);
+    paddr_t xsdt_paddr;
+
+    /*
+     * Restore original DMAR table signature, we are going to filter it from
+     * the new XSDT that is presented to the guest, so it is no longer
+     * necessary to have it's signature zapped.
+     */
+    acpi_dmar_reinstate();
+
+    /* Copy the native XSDT table header. */
+    rsdp = acpi_os_map_memory(acpi_os_get_root_pointer(), sizeof(*rsdp));
+    if ( !rsdp )
+    {
+        printk("Unable to map RSDP\n");
+        return -EINVAL;
+    }
+    xsdt_paddr = rsdp->xsdt_physical_address;
+    acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
+    table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
+    if ( !table )
+    {
+        printk("Unable to map XSDT\n");
+        return -EINVAL;
+    }
+    xsdt->header = *table;
+    acpi_os_unmap_memory(table, sizeof(*table));
+
+    /* Add the custom MADT. */
+    xsdt->table_offset_entry[0] = madt_addr;
+
+    xsdt->header.revision = 1;
+    xsdt->header.length = size;
+    /*
+     * Calling acpi_tb_checksum here is a layering violation, but
+     * introducing a wrapper for such simple usage seems overkill.
+     */
+    xsdt->header.checksum -= acpi_tb_checksum(ACPI_CAST_PTR(u8, xsdt), size);
+
+    return 0;
+}
+
+static int __init hvm_alloc_acpi_region(
+    struct domain *d, void **region, unsigned long size, paddr_t *addr)
+{
+    int i;
+
+    *addr = 0;
+
+    for ( i = 0; i < d->arch.nr_e820; i++ )
+    {
+        if ( d->arch.e820[i].type == E820_ACPI )
+        {
+            if ( d->arch.e820[i].size < size )
+                break;
+
+            *addr = d->arch.e820[i].addr;
+            break;
+        }
+    }
+
+    /* The e820 setup did not allocate ACPI region, steal one instead. */
+    if ( *addr == 0 )
+    {
+        if ( hvm_steal_ram(d, size, 0, GB(4), addr) )
+        {
+            printk("Unable to allocate guest RAM for RSDP\n");
+            return -ENOMEM;
+        }
+        if ( hvm_add_mem_range(d, *addr, *addr + size, E820_ACPI) )
+        {
+            printk("Unable to add RSDP region to memory map\n");
+            return -EFAULT;
+        }
+    }
+
+    *region = xzalloc_bytes(size);
+    if ( !region )
+        return -ENOMEM;
+
+    return 0;
+}
+
+static int __init hvm_setup_acpi(struct domain *d, paddr_t start_info)
+{
+    paddr_t rsdp_paddr, xsdt_paddr, madt_paddr;
+    struct acpi_table_rsdp *rsdp;
+    unsigned long size = hvm_size_acpi_region(d);
+    void *table;
+    int rc;
+
+    rc = hvm_alloc_acpi_region(d, &table, size, &rsdp_paddr);
+    if ( rc < 0 )
+        return rc;
+
+    /* RSDP */
+    rsdp = table;
+    xsdt_paddr = rsdp_paddr + sizeof(struct acpi_table_rsdp);
+
+    *rsdp = (struct acpi_table_rsdp){
+        .signature = ACPI_SIG_RSDP,
+        .revision = 2,
+        .length = sizeof(struct acpi_table_rsdp),
+        .oem_id = "XenHL\0", /* Xen Hyperlaunch */
+        .xsdt_physical_address = xsdt_paddr,
+    };
+
+    rsdp->checksum -= acpi_tb_checksum(ACPI_CAST_PTR(u8, rsdp),
+                                       ACPI_RSDP_REV0_SIZE);
+    rsdp->extended_checksum -= acpi_tb_checksum(ACPI_CAST_PTR(u8, rsdp),
+                                                sizeof(*rsdp));
+
+    /* XSDT */
+    table += sizeof(struct acpi_table_rsdp);
+    madt_paddr = xsdt_paddr + hvm_size_acpi_xsdt(d);
+
+    rc = hvm_setup_acpi_xsdt(d, table, madt_paddr);
+    if ( rc )
+    {
+        printk("Unable to construct XSDT\n");
+        goto out;
+    }
+
+
+    /* MADT */
+    table += hvm_size_acpi_xsdt(d);
+    rc = hvm_setup_acpi_madt(d, table);
+    if ( rc )
+    {
+        printk("Unable to construct MADT\n");
+        goto out;
+    }
+
+    /* Copy ACPI region into guest memory. */
+    rc = hvm_copy_to_guest_phys(rsdp_paddr, rsdp, size, d->vcpu[0]);
+    if ( rc )
+    {
+        printk("Unable to copy RSDP into guest memory\n");
+        goto out;
+    }
+
+    /* Copy RSDP address to start_info. */
+    rc = hvm_copy_to_guest_phys(
+        start_info + offsetof(struct hvm_start_info, rsdp_paddr), &rsdp_paddr,
+        sizeof(((struct hvm_start_info *) 0)->rsdp_paddr), d->vcpu[0]);
+    if ( rc )
+        printk("Unable to copy RSDP address to start info\n");
+
+ out:
+    if ( rsdp )
+        xfree(rsdp);
+
+    return rc;
+}
+
 static bool __init check_load_address(
     const struct domain *d, const struct elf_binary *elf)
 {
@@ -757,7 +965,10 @@ int __init dom_construct_pvh(struct boot_domain *bd)
         return rc;
     }
 
-    rc = dom0_pvh_setup_acpi(bd->d, start_info);
+    if ( is_control_domain(bd->d) || is_hardware_domain(bd->d) )
+        rc = dom0_pvh_setup_acpi(bd->d, start_info);
+    else
+        rc = hvm_setup_acpi(bd->d, start_info);
     if ( rc )
     {
         printk("Failed to setup Dom0 ACPI tables: %d\n", rc);
-- 
2.30.2


