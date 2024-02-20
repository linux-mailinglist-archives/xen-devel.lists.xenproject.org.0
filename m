Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AFB85C2EA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 18:44:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683638.1063242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcUAN-0006hL-Tm; Tue, 20 Feb 2024 17:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683638.1063242; Tue, 20 Feb 2024 17:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcUAN-0006e7-Pr; Tue, 20 Feb 2024 17:44:27 +0000
Received: by outflank-mailman (input) for mailman id 683638;
 Tue, 20 Feb 2024 17:44:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qAG8=J5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rcUAM-0006e1-Ns
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 17:44:26 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b045ece1-d017-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 18:44:25 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d208be133bso60005891fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 09:44:25 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 cx19-20020a05620a51d300b007873df5a625sm3585374qkb.97.2024.02.20.09.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 09:44:23 -0800 (PST)
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
X-Inumbo-ID: b045ece1-d017-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708451064; x=1709055864; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fN3AioTtNiF2G1C/gJr0Z8XOqGfeC2tvwzpfkBsnwog=;
        b=l6U2u9BnqGtp9DLXSmgyk0OzVjPnjk69P5Nh4tZ9yB/u5bLjmnDT47+78UJfQjEg3V
         numByEzCrGYePO1GlYSQ1IPLeXxSJ56XYAEktnRFDjNGhvB1waINZ9ymHkr9JkbCNZOo
         xPxoLO/4SCQmLgUOfuvcmC2b4imMSe/XeQIVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708451064; x=1709055864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fN3AioTtNiF2G1C/gJr0Z8XOqGfeC2tvwzpfkBsnwog=;
        b=kFwxMQJbsrzDZFkhS8L1gQeIp3vhJEuMK1Of84udYMPybyTe6xUTK8PY/3n2IrQ9Wi
         lGUS4OxCAsnJAkp3e6lZXRrLuqN1J2IGXalSyMADcSIUAysXvJ+Ha+S3sanV8WV6/u9W
         cf/5/+IugVuGfCVeTQVKCVnDSoEeFsLNIXuxDl0R/ZK/EI4jccG9LOvBkKBKYJyd8Ia3
         ThckamYWzFzQhfNoTqF4P+0R8qwX1kUDtg3rTysdaxT/qGYzOmw3WpuIAaF/zzakRhFp
         CKgPYB9aOTcwd+b5AdefCaCZfqYUzjtsTeCzjnS8Y0IzNUVVw7pMgoit09j1qBzGl+Se
         SZ4A==
X-Gm-Message-State: AOJu0YzNJZxE61AZAI0RYXFtwNNG7JvBPkeGFoi6AkxUGE7zrF6n6+nl
	OQFnYoJFsB7eeeYOnOWRBbf8RcsdCank7cyaWHEbxLMEnVaRfCYn5M6reuEcAxy/Z/y3RiOp4i2
	p
X-Google-Smtp-Source: AGHT+IHmGvbkMFw3zkVleaXq/kyUxVdLLslfkum2vmnLrPA+IyzJUIHNEXK0WeJJv+hyOqfnaNUTaA==
X-Received: by 2002:a2e:b005:0:b0:2d2:3757:c6b with SMTP id y5-20020a2eb005000000b002d237570c6bmr4961778ljk.0.1708451064254;
        Tue, 20 Feb 2024 09:44:24 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	linux-kernel@vger.kernel.org,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH RFC] x86/xen: attempt to inflate the memory balloon on PVH
Date: Tue, 20 Feb 2024 18:43:41 +0100
Message-ID: <20240220174341.56131-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When running as PVH or HVM Linux will use holes in the memory map as scratch
space to map grants, foreign domain pages and possibly miscellaneous other
stuff.  However the usage of such memory map holes for Xen purposes can be
problematic.  The request of holesby Xen happen quite early in the kernel boot
process (grant table setup already uses scratch map space), and it's possible
that by then not all devices have reclaimed their MMIO space.  It's not
unlikely for chunks of Xen scratch map space to end up using PCI bridge MMIO
window memory, which (as expected) causes quite a lot of issues in the system.

At least for PVH dom0 we have the possibility of using regions marked as
UNUSABLE in the e820 memory map.  Either if the region is UNUSABLE in the
native memory map, or it has been converted into UNUSABLE in order to hide RAM
regions from dom0, the second stage translation page-tables can populate those
areas without issues.

PV already has this kind of logic, where the balloon driver is inflated at
boot.  Re-use the current logic in order to also inflate it when running as
PVH.  onvert UNUSABLE regions up to the ratio specified in EXTRA_MEM_RATIO to
RAM, while reserving them using xen_add_extra_mem() (which is also moved so
it's no longer tied to CONFIG_PV).

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
RFC reasons:

 * Note that it would be preferred for the hypervisor to provide an explicit
   range to be used as scratch mapping space, but that requires changes to Xen,
   and it's not fully clear whether Xen can figure out the position of all MMIO
   regions at boot in order to suggest a scratch mapping region for dom0.

 * Should the whole set of xen_{add,del,chk,inv}_extra_mem() functions be moved
   to a different file?  For the purposes of PVH only xen_add_extra_mem() is
   moved and the chk and inv ones are PV specific and might not want moving to
   a separate file just to guard them with CONFIG_PV.
---
 arch/x86/include/asm/xen/hypervisor.h |  1 +
 arch/x86/platform/pvh/enlighten.c     |  3 ++
 arch/x86/xen/enlighten.c              | 32 +++++++++++++
 arch/x86/xen/enlighten_pvh.c          | 68 +++++++++++++++++++++++++++
 arch/x86/xen/setup.c                  | 44 -----------------
 arch/x86/xen/xen-ops.h                | 14 ++++++
 drivers/xen/balloon.c                 |  2 -
 7 files changed, 118 insertions(+), 46 deletions(-)

diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
index a9088250770f..31e2bf8d5db7 100644
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -62,6 +62,7 @@ void xen_arch_unregister_cpu(int num);
 #ifdef CONFIG_PVH
 void __init xen_pvh_init(struct boot_params *boot_params);
 void __init mem_map_via_hcall(struct boot_params *boot_params_p);
+void __init xen_reserve_extra_memory(struct boot_params *bootp);
 #endif
 
 /* Lazy mode for batching updates / context switch */
diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
index 00a92cb2c814..a12117f3d4de 100644
--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -74,6 +74,9 @@ static void __init init_pvh_bootparams(bool xen_guest)
 	} else
 		xen_raw_printk("Warning: Can fit ISA range into e820\n");
 
+	if (xen_guest)
+		xen_reserve_extra_memory(&pvh_bootparams);
+
 	pvh_bootparams.hdr.cmd_line_ptr =
 		pvh_start_info.cmdline_paddr;
 
diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 3c61bb98c10e..a01ca255b0c6 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -6,6 +6,7 @@
 #include <linux/console.h>
 #include <linux/cpu.h>
 #include <linux/kexec.h>
+#include <linux/memblock.h>
 #include <linux/slab.h>
 #include <linux/panic_notifier.h>
 
@@ -350,3 +351,34 @@ void xen_arch_unregister_cpu(int num)
 }
 EXPORT_SYMBOL(xen_arch_unregister_cpu);
 #endif
+
+/* Amount of extra memory space we add to the e820 ranges */
+struct xen_memory_region xen_extra_mem[XEN_EXTRA_MEM_MAX_REGIONS] __initdata;
+
+void __init xen_add_extra_mem(unsigned long start_pfn, unsigned long n_pfns)
+{
+	unsigned int i;
+
+	/*
+	 * No need to check for zero size, should happen rarely and will only
+	 * write a new entry regarded to be unused due to zero size.
+	 */
+	for (i = 0; i < XEN_EXTRA_MEM_MAX_REGIONS; i++) {
+		/* Add new region. */
+		if (xen_extra_mem[i].n_pfns == 0) {
+			xen_extra_mem[i].start_pfn = start_pfn;
+			xen_extra_mem[i].n_pfns = n_pfns;
+			break;
+		}
+		/* Append to existing region. */
+		if (xen_extra_mem[i].start_pfn + xen_extra_mem[i].n_pfns ==
+		    start_pfn) {
+			xen_extra_mem[i].n_pfns += n_pfns;
+			break;
+		}
+	}
+	if (i == XEN_EXTRA_MEM_MAX_REGIONS)
+		printk(KERN_WARNING "Warning: not enough extra memory regions\n");
+
+	memblock_reserve(PFN_PHYS(start_pfn), PFN_PHYS(n_pfns));
+}
diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
index ada3868c02c2..c28f073c1df5 100644
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/acpi.h>
 #include <linux/export.h>
+#include <linux/mm.h>
 
 #include <xen/hvc-console.h>
 
@@ -72,3 +73,70 @@ void __init mem_map_via_hcall(struct boot_params *boot_params_p)
 	}
 	boot_params_p->e820_entries = memmap.nr_entries;
 }
+
+/*
+ * Reserve e820 UNUSABLE regions to inflate the memory balloon.
+ *
+ * On PVH dom0 the host memory map is used, RAM regions available to dom0 are
+ * located as the same place as in the native memory map, but since dom0 gets
+ * less memory than the total amount of host RAM the ranges that can't be
+ * populated are converted from RAM -> UNUSABLE.  Use such regions (up to the
+ * ratio signaled in EXTRA_MEM_RATIO) in order to inflate the balloon driver at
+ * boot.  Doing so prevents the guest (even if just temporary) from using holes
+ * in the memory map in order to map grants or foreign addresses, and
+ * hopefully limits the risk of a clash with a device MMIO region.  Ideally the
+ * hypervisor should notify us which memory ranges are suitable for creating
+ * foreign mappings, but that's not yet implemented.
+ */
+void __init xen_reserve_extra_memory(struct boot_params *bootp)
+{
+	unsigned int i, ram_pages = 0, extra_pages;
+
+	for (i = 0; i < bootp->e820_entries; i++) {
+		struct boot_e820_entry *e = &bootp->e820_table[i];
+
+		if (e->type != E820_TYPE_RAM)
+			continue;
+		ram_pages += PFN_DOWN(e->addr + e->size) - PFN_UP(e->addr);
+	}
+
+	/* Max amount of extra memory. */
+	extra_pages = EXTRA_MEM_RATIO * ram_pages;
+
+	/*
+	 * Convert UNUSABLE ranges to RAM and reserve them for foreign mapping
+	 * purposes.
+	 */
+	for (i = 0; i < bootp->e820_entries && extra_pages; i++) {
+		struct boot_e820_entry *e = &bootp->e820_table[i];
+		unsigned long pages;
+
+		if (e->type != E820_TYPE_UNUSABLE)
+			continue;
+
+		pages = min(extra_pages,
+			PFN_DOWN(e->addr + e->size) - PFN_UP(e->addr));
+
+		if (pages != (PFN_DOWN(e->addr + e->size) - PFN_UP(e->addr))) {
+			struct boot_e820_entry *next;
+
+			if (bootp->e820_entries ==
+			    ARRAY_SIZE(bootp->e820_table))
+				/* No space left to split - skip region. */
+				continue;
+
+			/* Split entry. */
+			next = e + 1;
+			memmove(next, e,
+				(bootp->e820_entries - i) * sizeof(*e));
+			bootp->e820_entries++;
+			next->addr = PAGE_ALIGN(e->addr) + PFN_PHYS(pages);
+			e->size = next->addr - e->addr;
+			next->size -= e->size;
+		}
+		e->type = E820_TYPE_RAM;
+		extra_pages -= pages;
+
+		xen_add_extra_mem(PFN_UP(e->addr), pages);
+	}
+}
diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index b3e37961065a..380591028cb8 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -38,9 +38,6 @@
 
 #define GB(x) ((uint64_t)(x) * 1024 * 1024 * 1024)
 
-/* Amount of extra memory space we add to the e820 ranges */
-struct xen_memory_region xen_extra_mem[XEN_EXTRA_MEM_MAX_REGIONS] __initdata;
-
 /* Number of pages released from the initial allocation. */
 unsigned long xen_released_pages;
 
@@ -64,18 +61,6 @@ static struct {
 } xen_remap_buf __initdata __aligned(PAGE_SIZE);
 static unsigned long xen_remap_mfn __initdata = INVALID_P2M_ENTRY;
 
-/*
- * The maximum amount of extra memory compared to the base size.  The
- * main scaling factor is the size of struct page.  At extreme ratios
- * of base:extra, all the base memory can be filled with page
- * structures for the extra memory, leaving no space for anything
- * else.
- *
- * 10x seems like a reasonable balance between scaling flexibility and
- * leaving a practically usable system.
- */
-#define EXTRA_MEM_RATIO		(10)
-
 static bool xen_512gb_limit __initdata = IS_ENABLED(CONFIG_XEN_512GB);
 
 static void __init xen_parse_512gb(void)
@@ -96,35 +81,6 @@ static void __init xen_parse_512gb(void)
 	xen_512gb_limit = val;
 }
 
-static void __init xen_add_extra_mem(unsigned long start_pfn,
-				     unsigned long n_pfns)
-{
-	int i;
-
-	/*
-	 * No need to check for zero size, should happen rarely and will only
-	 * write a new entry regarded to be unused due to zero size.
-	 */
-	for (i = 0; i < XEN_EXTRA_MEM_MAX_REGIONS; i++) {
-		/* Add new region. */
-		if (xen_extra_mem[i].n_pfns == 0) {
-			xen_extra_mem[i].start_pfn = start_pfn;
-			xen_extra_mem[i].n_pfns = n_pfns;
-			break;
-		}
-		/* Append to existing region. */
-		if (xen_extra_mem[i].start_pfn + xen_extra_mem[i].n_pfns ==
-		    start_pfn) {
-			xen_extra_mem[i].n_pfns += n_pfns;
-			break;
-		}
-	}
-	if (i == XEN_EXTRA_MEM_MAX_REGIONS)
-		printk(KERN_WARNING "Warning: not enough extra memory regions\n");
-
-	memblock_reserve(PFN_PHYS(start_pfn), PFN_PHYS(n_pfns));
-}
-
 static void __init xen_del_extra_mem(unsigned long start_pfn,
 				     unsigned long n_pfns)
 {
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index a87ab36889e7..79cf93f2c92f 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -163,4 +163,18 @@ void xen_hvm_post_suspend(int suspend_cancelled);
 static inline void xen_hvm_post_suspend(int suspend_cancelled) {}
 #endif
 
+/*
+ * The maximum amount of extra memory compared to the base size.  The
+ * main scaling factor is the size of struct page.  At extreme ratios
+ * of base:extra, all the base memory can be filled with page
+ * structures for the extra memory, leaving no space for anything
+ * else.
+ *
+ * 10x seems like a reasonable balance between scaling flexibility and
+ * leaving a practically usable system.
+ */
+#define EXTRA_MEM_RATIO		(10)
+
+void xen_add_extra_mem(unsigned long start_pfn, unsigned long n_pfns);
+
 #endif /* XEN_OPS_H */
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 976c6cdf9ee6..aaf2514fcfa4 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -672,7 +672,6 @@ EXPORT_SYMBOL(xen_free_ballooned_pages);
 
 static void __init balloon_add_regions(void)
 {
-#if defined(CONFIG_XEN_PV)
 	unsigned long start_pfn, pages;
 	unsigned long pfn, extra_pfn_end;
 	unsigned int i;
@@ -696,7 +695,6 @@ static void __init balloon_add_regions(void)
 
 		balloon_stats.total_pages += extra_pfn_end - start_pfn;
 	}
-#endif
 }
 
 static int __init balloon_init(void)
-- 
2.43.0


