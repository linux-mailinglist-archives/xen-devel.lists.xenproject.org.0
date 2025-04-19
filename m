Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB06A945C0
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960235.1352312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYp-0003MM-3A; Sat, 19 Apr 2025 22:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960235.1352312; Sat, 19 Apr 2025 22:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYo-0003Im-Lm; Sat, 19 Apr 2025 22:21:18 +0000
Received: by outflank-mailman (input) for mailman id 960235;
 Sat, 19 Apr 2025 22:21:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GP0-0004yY-0f
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:11:10 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ef04524-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:11:04 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100546983292.67406814920184;
 Sat, 19 Apr 2025 15:09:06 -0700 (PDT)
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
X-Inumbo-ID: 2ef04524-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100550; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vx7LmSizaQI8aTsjW/xcqDxUX7t05aGQcRdNG12cItMoDos1g/aYT/dOSgq9wRpLPDzmQ+D9FDOWyQVJhZQrg9IqxuVyMrMiXpDhsP/ztvwf/27PJqc9kvnEujsff4uM0Aa6wtbDzncEi+jsv7KX3psTUmhy7M2+qKIjoQGrnro=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100550; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xoJWXkXpmA/7bILpNXgjvSfpxAXFPtgVddP2jhGbb9Y=; 
	b=FM1a+nuOcoazbxGLbwEZv/wYDNIuVSPWlh0FAYGBpKftZO8mKeHaFrGan65R4Ma49VKjlicWcIpKovrTUqTwj/tVVwqx15xN8Ctuv6gUIij7SJ65JNMSCMhsH/npm/2DONYuH0B+7BBzwoffttGCZtNjM2HkD1yekeV56v18RZw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100550;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=xoJWXkXpmA/7bILpNXgjvSfpxAXFPtgVddP2jhGbb9Y=;
	b=lOLk6IS7DcWYwCkOVdF1iFNpeszEdsGVHzIftxCSUCBmGBkVu57dQmH9Nt6Z2CcP
	8quJhnNdzC8tcJTYYUI80bMdXRjVhVOFsqo8dqmll/LGyA5pTplbNVgt+zCMsihDiUW
	GXaa0EnrtOLcqe1HpMJDw7L1+ftLJdW8TGHq3cD4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 21/38] x86/hyperlaunch: move remaining pvh dom0 construction
Date: Sat, 19 Apr 2025 18:08:03 -0400
Message-Id: <20250419220820.4234-22-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Move pvh_load_kernel() and its helper functions to the domain builder. With
this move, it is now possible to move the remaining logic of
dom0_construct_pvh() to the domain builder. With all the logic moved, the
function can be dropped.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/hvm/dom0_build.c         | 365 --------------------------
 xen/arch/x86/hvm/dom_build.c          | 362 ++++++++++++++++++++++++-
 xen/arch/x86/include/asm/dom0_build.h |   1 -
 3 files changed, 361 insertions(+), 367 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 73ce33fb17f1..23b46ef86c9f 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -478,335 +478,6 @@ int __init dom0_pvh_populate_p2m(struct domain *d)
 #undef MB1_PAGES
 }
 
-static paddr_t __init find_memory(
-    const struct domain *d, const struct elf_binary *elf, size_t size)
-{
-    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
-    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
-                                 PAGE_SIZE);
-    unsigned int i;
-
-    /*
-     * The memory map is sorted and all RAM regions starts and sizes are
-     * aligned to page boundaries.
-     */
-    for ( i = 0; i < d->arch.nr_e820; i++ )
-    {
-        paddr_t start, end = d->arch.e820[i].addr + d->arch.e820[i].size;
-
-        /* Don't use memory below 1MB, as it could overwrite BDA/EBDA/IBFT. */
-        if ( end <= MB(1) || d->arch.e820[i].type != E820_RAM )
-            continue;
-
-        start = MAX(ROUNDUP(d->arch.e820[i].addr, PAGE_SIZE), MB(1));
-
-        ASSERT(IS_ALIGNED(start, PAGE_SIZE) && IS_ALIGNED(end, PAGE_SIZE));
-
-        /*
-         * NB: Even better would be to use rangesets to determine a suitable
-         * range, in particular in case a kernel requests multiple heavily
-         * discontiguous regions (which right now we fold all into one big
-         * region).
-         */
-        if ( end <= kernel_start || start >= kernel_end )
-        {
-            /* No overlap, just check whether the region is large enough. */
-            if ( end - start >= size )
-                return start;
-        }
-        /* Deal with the kernel already being loaded in the region. */
-        else if ( kernel_start > start && kernel_start - start >= size )
-            return start;
-        else if ( kernel_end < end && end - kernel_end >= size )
-            return kernel_end;
-    }
-
-    return INVALID_PADDR;
-}
-
-static bool __init check_load_address(
-    const struct domain *d, const struct elf_binary *elf)
-{
-    paddr_t kernel_start = (uintptr_t)elf->dest_base;
-    paddr_t kernel_end = kernel_start + elf->dest_size;
-    unsigned int i;
-
-    /* Relies on a sorted memory map with adjacent entries merged. */
-    for ( i = 0; i < d->arch.nr_e820; i++ )
-    {
-        paddr_t start = d->arch.e820[i].addr;
-        paddr_t end = start + d->arch.e820[i].size;
-
-        if ( start >= kernel_end )
-            return false;
-
-        if ( d->arch.e820[i].type == E820_RAM &&
-             start <= kernel_start &&
-             end >= kernel_end )
-            return true;
-    }
-
-    return false;
-}
-
-/* Find an e820 RAM region that fits the kernel at a suitable alignment. */
-static paddr_t __init find_kernel_memory(
-    const struct domain *d, struct elf_binary *elf,
-    const struct elf_dom_parms *parms)
-{
-    paddr_t kernel_size = elf->dest_size;
-    unsigned int align;
-    unsigned int i;
-
-    if ( parms->phys_align != UNSET_ADDR32 )
-        align = parms->phys_align;
-    else if ( elf->palign >= PAGE_SIZE )
-        align = elf->palign;
-    else
-        align = MB(2);
-
-    /* Search backwards to find the highest address. */
-    for ( i = d->arch.nr_e820; i--; )
-    {
-        paddr_t start = d->arch.e820[i].addr;
-        paddr_t end = start + d->arch.e820[i].size;
-        paddr_t kstart, kend;
-
-        if ( d->arch.e820[i].type != E820_RAM ||
-             d->arch.e820[i].size < kernel_size )
-            continue;
-
-        if ( start > parms->phys_max )
-            continue;
-
-        if ( end - 1 > parms->phys_max )
-            end = parms->phys_max + 1;
-
-        kstart = (end - kernel_size) & ~(align - 1);
-        kend = kstart + kernel_size;
-
-        if ( kstart < parms->phys_min )
-            return 0;
-
-        if ( kstart >= start && kend <= end )
-            return kstart;
-    }
-
-    return 0;
-}
-
-/* Check the kernel load address, and adjust if necessary and possible. */
-static bool __init check_and_adjust_load_address(
-    const struct domain *d, struct elf_binary *elf, struct elf_dom_parms *parms)
-{
-    paddr_t reloc_base;
-
-    if ( check_load_address(d, elf) )
-        return true;
-
-    if ( !parms->phys_reloc )
-    {
-        printk("%pd kernel: Address conflict and not relocatable\n", d);
-        return false;
-    }
-
-    reloc_base = find_kernel_memory(d, elf, parms);
-    if ( !reloc_base )
-    {
-        printk("%pd kernel: Failed find a load address\n", d);
-        return false;
-    }
-
-    if ( opt_dom0_verbose )
-        printk("%pd kernel: Moving [%p, %p] -> [%"PRIpaddr", %"PRIpaddr"]\n", d,
-               elf->dest_base, elf->dest_base + elf->dest_size - 1,
-               reloc_base, reloc_base + elf->dest_size - 1);
-
-    parms->phys_entry =
-        reloc_base + (parms->phys_entry - (uintptr_t)elf->dest_base);
-    elf->dest_base = (char *)reloc_base;
-
-    return true;
-}
-
-static int __init pvh_load_kernel(
-    const struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_addr)
-{
-    struct domain *d = bd->d;
-    struct boot_module *image = bd->kernel;
-    struct boot_module *initrd = bd->ramdisk;
-    void *image_base = bootstrap_map_bm(image);
-    void *image_start = image_base + image->headroom;
-    unsigned long image_len = image->size;
-    unsigned long initrd_len = initrd ? initrd->size : 0;
-    const char *initrd_cmdline = NULL;
-    struct elf_binary elf;
-    struct elf_dom_parms parms;
-    size_t extra_space;
-    paddr_t last_addr;
-    struct hvm_start_info start_info = { 0 };
-    struct hvm_modlist_entry mod = { 0 };
-    struct vcpu *v = d->vcpu[0];
-    int rc;
-
-    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
-    {
-        printk("Error trying to detect bz compressed kernel\n");
-        return rc;
-    }
-
-    if ( (rc = elf_init(&elf, image_start, image_len)) != 0 )
-    {
-        printk("Unable to init ELF\n");
-        return rc;
-    }
-    if ( opt_dom0_verbose )
-        elf_set_verbose(&elf);
-    elf_parse_binary(&elf);
-    if ( (rc = elf_xen_parse(&elf, &parms, true)) != 0 )
-    {
-        printk("Unable to parse kernel for ELFNOTES\n");
-        if ( elf_check_broken(&elf) )
-            printk("%pd kernel: broken ELF: %s\n", d, elf_check_broken(&elf));
-        return rc;
-    }
-
-    if ( parms.phys_entry == UNSET_ADDR32 )
-    {
-        printk("Unable to find XEN_ELFNOTE_PHYS32_ENTRY address\n");
-        return -EINVAL;
-    }
-
-    /* Copy the OS image and free temporary buffer. */
-    elf.dest_base = (void *)(parms.virt_kstart - parms.virt_base);
-    elf.dest_size = parms.virt_kend - parms.virt_kstart;
-
-    if ( !check_and_adjust_load_address(d, &elf, &parms) )
-        return -ENOSPC;
-
-    elf_set_vcpu(&elf, v);
-    rc = elf_load_binary(&elf);
-    if ( rc < 0 )
-    {
-        printk("Failed to load kernel: %d\n", rc);
-        if ( elf_check_broken(&elf) )
-            printk("%pd kernel: broken ELF: %s\n", d, elf_check_broken(&elf));
-        return rc;
-    }
-
-    /*
-     * Find a RAM region big enough (and that doesn't overlap with the loaded
-     * kernel) in order to load the initrd and the metadata. Note it could be
-     * split into smaller allocations, done as a single region in order to
-     * simplify it.
-     */
-    extra_space = sizeof(start_info);
-
-    if ( initrd )
-    {
-        size_t initrd_space = elf_round_up(&elf, initrd_len);
-
-        if ( initrd->cmdline_pa )
-        {
-            initrd_cmdline = __va(initrd->cmdline_pa);
-            if ( !*initrd_cmdline )
-                initrd_cmdline = NULL;
-        }
-        if ( initrd_cmdline )
-            initrd_space += strlen(initrd_cmdline) + 1;
-
-        if ( initrd_space )
-            extra_space += ROUNDUP(initrd_space, PAGE_SIZE) + sizeof(mod);
-        else
-            initrd = NULL;
-    }
-
-    if ( bd->cmdline )
-        extra_space += elf_round_up(&elf, strlen(bd->cmdline) + 1);
-
-    last_addr = find_memory(d, &elf, extra_space);
-    if ( last_addr == INVALID_PADDR )
-    {
-        printk("Unable to find a memory region to load initrd and metadata\n");
-        return -ENOMEM;
-    }
-
-    if ( initrd != NULL )
-    {
-        rc = hvm_copy_to_guest_phys(last_addr, __va(initrd->start),
-                                    initrd_len, v);
-        if ( rc )
-        {
-            printk("Unable to copy initrd to guest\n");
-            return rc;
-        }
-
-        mod.paddr = last_addr;
-        mod.size = initrd_len;
-        last_addr += elf_round_up(&elf, initrd_len);
-        if ( initrd_cmdline )
-        {
-            size_t len = strlen(initrd_cmdline) + 1;
-
-            rc = hvm_copy_to_guest_phys(last_addr, initrd_cmdline, len, v);
-            if ( rc )
-            {
-                printk("Unable to copy module command line\n");
-                return rc;
-            }
-            mod.cmdline_paddr = last_addr;
-            last_addr += len;
-        }
-        last_addr = ROUNDUP(last_addr, PAGE_SIZE);
-    }
-
-    /* Free temporary buffers. */
-    free_boot_modules();
-
-    if ( bd->cmdline )
-    {
-        rc = hvm_copy_to_guest_phys(last_addr, bd->cmdline,
-                                    strlen(bd->cmdline) + 1, v);
-        if ( rc )
-        {
-            printk("Unable to copy guest command line\n");
-            return rc;
-        }
-        start_info.cmdline_paddr = last_addr;
-        /*
-         * Round up to 32/64 bits (depending on the guest kernel bitness) so
-         * the modlist/start_info is aligned.
-         */
-        last_addr += elf_round_up(&elf, strlen(bd->cmdline) + 1);
-    }
-    if ( initrd != NULL )
-    {
-        rc = hvm_copy_to_guest_phys(last_addr, &mod, sizeof(mod), v);
-        if ( rc )
-        {
-            printk("Unable to copy guest modules\n");
-            return rc;
-        }
-        start_info.modlist_paddr = last_addr;
-        start_info.nr_modules = 1;
-        last_addr += sizeof(mod);
-    }
-
-    start_info.magic = XEN_HVM_START_MAGIC_VALUE;
-    start_info.flags = SIF_PRIVILEGED | SIF_INITDOMAIN;
-    rc = hvm_copy_to_guest_phys(last_addr, &start_info, sizeof(start_info), v);
-    if ( rc )
-    {
-        printk("Unable to copy start info to guest\n");
-        return rc;
-    }
-
-    *entry = parms.phys_entry;
-    *start_info_addr = last_addr;
-
-    return 0;
-}
-
 static int __init cf_check acpi_count_intr_ovr(
     struct acpi_subtable_header *header, const unsigned long end)
 {
@@ -1255,42 +926,6 @@ int __init dom0_pvh_setup_acpi(struct domain *d, paddr_t start_info)
     return 0;
 }
 
-int __init dom0_construct_pvh(struct boot_domain *bd)
-{
-    paddr_t entry, start_info;
-    struct domain *d = bd->d;
-    int rc;
-
-    rc = pvh_load_kernel(bd, &entry, &start_info);
-    if ( rc )
-    {
-        printk("Failed to load Dom0 kernel\n");
-        return rc;
-    }
-
-    rc = hvm_setup_cpus(bd->d, entry, start_info);
-    if ( rc )
-    {
-        printk("Failed to setup Dom0 CPUs: %d\n", rc);
-        return rc;
-    }
-
-    rc = dom0_pvh_setup_acpi(bd->d, start_info);
-    if ( rc )
-    {
-        printk("Failed to setup Dom0 ACPI tables: %d\n", rc);
-        return rc;
-    }
-
-    if ( opt_dom0_verbose )
-    {
-        printk("Dom%u memory map:\n", d->domain_id);
-        print_e820_memory_map(d->arch.e820, d->arch.nr_e820);
-    }
-
-    return 0;
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index 9421dc431ba9..2e47ca489a71 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -16,10 +16,12 @@
 
 #include <acpi/actables.h>
 
+#include <public/arch-x86/hvm/start_info.h>
 #include <public/hvm/e820.h>
 #include <public/hvm/hvm_vcpu.h>
 
 #include <asm/bootinfo.h>
+#include <asm/bzimage.h>
 #include <asm/dom0_build.h>
 #include <asm/domain-builder.h>
 #include <asm/hvm/io.h>
@@ -276,8 +278,338 @@ static int __init hvm_populate_p2m(struct domain *d)
     return 0;
 }
 
+static paddr_t __init find_memory(
+    const struct domain *d, const struct elf_binary *elf, size_t size)
+{
+    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
+    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
+                                 PAGE_SIZE);
+    unsigned int i;
+
+    /*
+     * The memory map is sorted and all RAM regions starts and sizes are
+     * aligned to page boundaries.
+     */
+    for ( i = 0; i < d->arch.nr_e820; i++ )
+    {
+        paddr_t start, end = d->arch.e820[i].addr + d->arch.e820[i].size;
+
+        /* Don't use memory below 1MB, as it could overwrite BDA/EBDA/IBFT. */
+        if ( end <= MB(1) || d->arch.e820[i].type != E820_RAM )
+            continue;
+
+        start = MAX(ROUNDUP(d->arch.e820[i].addr, PAGE_SIZE), MB(1));
+
+        ASSERT(IS_ALIGNED(start, PAGE_SIZE) && IS_ALIGNED(end, PAGE_SIZE));
+
+        /*
+         * NB: Even better would be to use rangesets to determine a suitable
+         * range, in particular in case a kernel requests multiple heavily
+         * discontiguous regions (which right now we fold all into one big
+         * region).
+         */
+        if ( end <= kernel_start || start >= kernel_end )
+        {
+            /* No overlap, just check whether the region is large enough. */
+            if ( end - start >= size )
+                return start;
+        }
+        /* Deal with the kernel already being loaded in the region. */
+        else if ( kernel_start > start && kernel_start - start >= size )
+            return start;
+        else if ( kernel_end < end && end - kernel_end >= size )
+            return kernel_end;
+    }
+
+    return INVALID_PADDR;
+}
+
+static bool __init check_load_address(
+    const struct domain *d, const struct elf_binary *elf)
+{
+    paddr_t kernel_start = (uintptr_t)elf->dest_base;
+    paddr_t kernel_end = kernel_start + elf->dest_size;
+    unsigned int i;
+
+    /* Relies on a sorted memory map with adjacent entries merged. */
+    for ( i = 0; i < d->arch.nr_e820; i++ )
+    {
+        paddr_t start = d->arch.e820[i].addr;
+        paddr_t end = start + d->arch.e820[i].size;
+
+        if ( start >= kernel_end )
+            return false;
+
+        if ( d->arch.e820[i].type == E820_RAM &&
+             start <= kernel_start &&
+             end >= kernel_end )
+            return true;
+    }
+
+    return false;
+}
+
+/* Find an e820 RAM region that fits the kernel at a suitable alignment. */
+static paddr_t __init find_kernel_memory(
+    const struct domain *d, struct elf_binary *elf,
+    const struct elf_dom_parms *parms)
+{
+    paddr_t kernel_size = elf->dest_size;
+    unsigned int align;
+    unsigned int i;
+
+    if ( parms->phys_align != UNSET_ADDR32 )
+        align = parms->phys_align;
+    else if ( elf->palign >= PAGE_SIZE )
+        align = elf->palign;
+    else
+        align = MB(2);
+
+    /* Search backwards to find the highest address. */
+    for ( i = d->arch.nr_e820; i--; )
+    {
+        paddr_t start = d->arch.e820[i].addr;
+        paddr_t end = start + d->arch.e820[i].size;
+        paddr_t kstart, kend;
+
+        if ( d->arch.e820[i].type != E820_RAM ||
+             d->arch.e820[i].size < kernel_size )
+            continue;
+
+        if ( start > parms->phys_max )
+            continue;
+
+        if ( end - 1 > parms->phys_max )
+            end = parms->phys_max + 1;
+
+        kstart = (end - kernel_size) & ~(align - 1);
+        kend = kstart + kernel_size;
+
+        if ( kstart < parms->phys_min )
+            return 0;
+
+        if ( kstart >= start && kend <= end )
+            return kstart;
+    }
+
+    return 0;
+}
+
+/* Check the kernel load address, and adjust if necessary and possible. */
+static bool __init check_and_adjust_load_address(
+    const struct domain *d, struct elf_binary *elf, struct elf_dom_parms *parms)
+{
+    paddr_t reloc_base;
+
+    if ( check_load_address(d, elf) )
+        return true;
+
+    if ( !parms->phys_reloc )
+    {
+        printk("%pd kernel: Address conflict and not relocatable\n", d);
+        return false;
+    }
+
+    reloc_base = find_kernel_memory(d, elf, parms);
+    if ( !reloc_base )
+    {
+        printk("%pd kernel: Failed find a load address\n", d);
+        return false;
+    }
+
+    if ( opt_dom0_verbose )
+        printk("%pd kernel: Moving [%p, %p] -> [%"PRIpaddr", %"PRIpaddr"]\n", d,
+               elf->dest_base, elf->dest_base + elf->dest_size - 1,
+               reloc_base, reloc_base + elf->dest_size - 1);
+
+    parms->phys_entry =
+        reloc_base + (parms->phys_entry - (uintptr_t)elf->dest_base);
+    elf->dest_base = (char *)reloc_base;
+
+    return true;
+}
+
+static int __init pvh_load_kernel(
+    const struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_addr)
+{
+    struct domain *d = bd->d;
+    struct boot_module *image = bd->kernel;
+    struct boot_module *initrd = bd->ramdisk;
+    void *image_base = bootstrap_map_bm(image);
+    void *image_start = image_base + image->headroom;
+    unsigned long image_len = image->size;
+    unsigned long initrd_len = initrd ? initrd->size : 0;
+    const char *initrd_cmdline = NULL;
+    struct elf_binary elf;
+    struct elf_dom_parms parms;
+    size_t extra_space;
+    paddr_t last_addr;
+    struct hvm_start_info start_info = { 0 };
+    struct hvm_modlist_entry mod = { 0 };
+    struct vcpu *v = d->vcpu[0];
+    int rc;
+
+    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
+    {
+        printk("Error trying to detect bz compressed kernel\n");
+        return rc;
+    }
+
+    if ( (rc = elf_init(&elf, image_start, image_len)) != 0 )
+    {
+        printk("Unable to init ELF\n");
+        return rc;
+    }
+    if ( opt_dom0_verbose )
+        elf_set_verbose(&elf);
+    elf_parse_binary(&elf);
+    if ( (rc = elf_xen_parse(&elf, &parms, true)) != 0 )
+    {
+        printk("Unable to parse kernel for ELFNOTES\n");
+        if ( elf_check_broken(&elf) )
+            printk("%pd kernel: broken ELF: %s\n", d, elf_check_broken(&elf));
+        return rc;
+    }
+
+    if ( parms.phys_entry == UNSET_ADDR32 )
+    {
+        printk("Unable to find XEN_ELFNOTE_PHYS32_ENTRY address\n");
+        return -EINVAL;
+    }
+
+    /* Copy the OS image and free temporary buffer. */
+    elf.dest_base = (void *)(parms.virt_kstart - parms.virt_base);
+    elf.dest_size = parms.virt_kend - parms.virt_kstart;
+
+    if ( !check_and_adjust_load_address(d, &elf, &parms) )
+        return -ENOSPC;
+
+    elf_set_vcpu(&elf, v);
+    rc = elf_load_binary(&elf);
+    if ( rc < 0 )
+    {
+        printk("Failed to load kernel: %d\n", rc);
+        if ( elf_check_broken(&elf) )
+            printk("%pd kernel: broken ELF: %s\n", d, elf_check_broken(&elf));
+        return rc;
+    }
+
+    /*
+     * Find a RAM region big enough (and that doesn't overlap with the loaded
+     * kernel) in order to load the initrd and the metadata. Note it could be
+     * split into smaller allocations, done as a single region in order to
+     * simplify it.
+     */
+    extra_space = sizeof(start_info);
+
+    if ( initrd )
+    {
+        size_t initrd_space = elf_round_up(&elf, initrd_len);
+
+        if ( initrd->cmdline_pa )
+        {
+            initrd_cmdline = __va(initrd->cmdline_pa);
+            if ( !*initrd_cmdline )
+                initrd_cmdline = NULL;
+        }
+        if ( initrd_cmdline )
+            initrd_space += strlen(initrd_cmdline) + 1;
+
+        if ( initrd_space )
+            extra_space += ROUNDUP(initrd_space, PAGE_SIZE) + sizeof(mod);
+        else
+            initrd = NULL;
+    }
+
+    if ( bd->cmdline )
+        extra_space += elf_round_up(&elf, strlen(bd->cmdline) + 1);
+
+    last_addr = find_memory(d, &elf, extra_space);
+    if ( last_addr == INVALID_PADDR )
+    {
+        printk("Unable to find a memory region to load initrd and metadata\n");
+        return -ENOMEM;
+    }
+
+    if ( initrd != NULL )
+    {
+        rc = hvm_copy_to_guest_phys(last_addr, __va(initrd->start),
+                                    initrd_len, v);
+        if ( rc )
+        {
+            printk("Unable to copy initrd to guest\n");
+            return rc;
+        }
+
+        mod.paddr = last_addr;
+        mod.size = initrd_len;
+        last_addr += elf_round_up(&elf, initrd_len);
+        if ( initrd_cmdline )
+        {
+            size_t len = strlen(initrd_cmdline) + 1;
+
+            rc = hvm_copy_to_guest_phys(last_addr, initrd_cmdline, len, v);
+            if ( rc )
+            {
+                printk("Unable to copy module command line\n");
+                return rc;
+            }
+            mod.cmdline_paddr = last_addr;
+            last_addr += len;
+        }
+        last_addr = ROUNDUP(last_addr, PAGE_SIZE);
+    }
+
+    /* Free temporary buffers. */
+    free_boot_modules();
+
+    if ( bd->cmdline )
+    {
+        rc = hvm_copy_to_guest_phys(last_addr, bd->cmdline,
+                                    strlen(bd->cmdline) + 1, v);
+        if ( rc )
+        {
+            printk("Unable to copy guest command line\n");
+            return rc;
+        }
+        start_info.cmdline_paddr = last_addr;
+        /*
+         * Round up to 32/64 bits (depending on the guest kernel bitness) so
+         * the modlist/start_info is aligned.
+         */
+        last_addr += elf_round_up(&elf, strlen(bd->cmdline) + 1);
+    }
+    if ( initrd != NULL )
+    {
+        rc = hvm_copy_to_guest_phys(last_addr, &mod, sizeof(mod), v);
+        if ( rc )
+        {
+            printk("Unable to copy guest modules\n");
+            return rc;
+        }
+        start_info.modlist_paddr = last_addr;
+        start_info.nr_modules = 1;
+        last_addr += sizeof(mod);
+    }
+
+    start_info.magic = XEN_HVM_START_MAGIC_VALUE;
+    start_info.flags = SIF_PRIVILEGED | SIF_INITDOMAIN;
+    rc = hvm_copy_to_guest_phys(last_addr, &start_info, sizeof(start_info), v);
+    if ( rc )
+    {
+        printk("Unable to copy start info to guest\n");
+        return rc;
+    }
+
+    *entry = parms.phys_entry;
+    *start_info_addr = last_addr;
+
+    return 0;
+}
+
 int __init dom_construct_pvh(struct boot_domain *bd)
 {
+    paddr_t entry, start_info;
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", bd->domid);
@@ -327,7 +659,35 @@ int __init dom_construct_pvh(struct boot_domain *bd)
         return rc;
     }
 
-    return dom0_construct_pvh(bd);
+    rc = pvh_load_kernel(bd, &entry, &start_info);
+    if ( rc )
+    {
+        printk("Failed to load Dom0 kernel\n");
+        return rc;
+    }
+
+    rc = hvm_setup_cpus(bd->d, entry, start_info);
+    if ( rc )
+    {
+        printk("Failed to setup Dom0 CPUs: %d\n", rc);
+        return rc;
+    }
+
+    rc = dom0_pvh_setup_acpi(bd->d, start_info);
+    if ( rc )
+    {
+        printk("Failed to setup Dom0 ACPI tables: %d\n", rc);
+        return rc;
+    }
+
+    if ( opt_dom0_verbose )
+    {
+        printk("Dom%u memory map:\n", bd->domid);
+        print_e820_memory_map(bd->d->arch.e820, bd->d->arch.nr_e820);
+    }
+
+    printk("WARNING: PVH is an experimental mode with limited functionality\n");
+    return 0;
 }
 
 /*
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 3819b3f4e7a4..6947aaa1dce3 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -24,7 +24,6 @@ int dom0_pvh_setup_acpi(struct domain *d, paddr_t start_info);
 int dom0_pvh_populate_p2m(struct domain *d);
 
 int dom0_construct_pv(struct boot_domain *bd);
-int dom0_construct_pvh(struct boot_domain *bd);
 
 void dom0_update_physmap(bool compat, unsigned long pfn,
                          unsigned long mfn, unsigned long vphysmap_s);
-- 
2.30.2


