Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6295F2F99
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 13:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414818.659228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofJaq-0004g6-Gh; Mon, 03 Oct 2022 11:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414818.659228; Mon, 03 Oct 2022 11:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofJaq-0004dq-Db; Mon, 03 Oct 2022 11:26:40 +0000
Received: by outflank-mailman (input) for mailman id 414818;
 Mon, 03 Oct 2022 11:26:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1PaK=2E=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1ofJan-0004Xj-Ve
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 11:26:38 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3db2adcc-430e-11ed-964a-05401a9f4f97;
 Mon, 03 Oct 2022 13:26:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 884F4B8105F;
 Mon,  3 Oct 2022 11:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4010C43470;
 Mon,  3 Oct 2022 11:26:31 +0000 (UTC)
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
X-Inumbo-ID: 3db2adcc-430e-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664796394;
	bh=lpQ4+WmITmtmOnKFnxuwxQHGwlCFJ4zTtvospQM9GKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K9ID/meLYrn0iHyhvkrGaVzZES7EFVJpDW0Uw9aDg2M81HUgIx3frx0cFPJop1arF
	 vgRUsJ37RND+bWXPfbtBFAdH5j+1mk+62cnz90JM8A40hCCp4oTwAnZyGKNkF/2dwE
	 KBqstIRcIaoSImv4Mne7Gja/jq71Kp4NI/jjGDNpaNbzgz9oe372Ridjm0lBwXGcyr
	 iwSpUGMJX/8UxZ2AS32VumjW87yYtxSe1Chbd1asWLgLqGyQoyz8qmXULZxXUjsIed
	 MxkcNn1E3uEfsCTPRGFWY5eaTMnpaYyJXrS44pjrZjiba6qmhAd+2w5s9S0le4zqDP
	 vN6tusSTeesmg==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-efi@vger.kernel.org
Cc: xen-devel@lists.xenproject.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Peter Jones <pjones@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Kees Cook <keescook@chromium.org>,
	Anton Vorontsov <anton@enomsg.org>,
	Colin Cross <ccross@android.com>,
	Tony Luck <tony.luck@intel.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 1/6] efi: Move EFI fake memmap support into x86 arch tree
Date: Mon,  3 Oct 2022 13:26:20 +0200
Message-Id: <20221003112625.972646-2-ardb@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221003112625.972646-1-ardb@kernel.org>
References: <20221003112625.972646-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11648; i=ardb@kernel.org; h=from:subject; bh=lpQ4+WmITmtmOnKFnxuwxQHGwlCFJ4zTtvospQM9GKk=; b=owEB7QES/pANAwAKAcNPIjmS2Y8kAcsmYgBjOsbWzvxr8yONNNbEpLG35L+GKpYlawmf5lOH3UFh k0+XysqJAbMEAAEKAB0WIQT72WJ8QGnJQhU3VynDTyI5ktmPJAUCYzrG1gAKCRDDTyI5ktmPJBRBDA CixbtB0CwvPLakaVceoJAQw8qQp1WDRfoHfeuCKX7ncix1T1+dYnYT7rv36evcoTla9LTIKQ+9Mkci UsRk9egPOu2Iji+te1wm5kdK5zHzh632bZ7S8hxo0DxaqPGheCnlh4ZVjht6EgSGZZYB8zvFSYQ5GU /am/hsSBLOMBjJS53c8heoJFAVYCzdZa9Q4GbxZliAE5s3So7A12gFwWpera0POthgZCzk89JQkPgE 8JFKcrU8H5uRzx2tEFQHfkaWgV+5Ce3Y4j2tFkqTYvCNkYJkyh2ndPk+eod5JVdww+/NYpYNl/Xm6p hQZI1XSSHGWqoGecrPpipl954qmi6j78R/xW9xF8prTJPNnfmHHi0EDMrOp3M3gO8M1R7oE85P7FVy JuXTKcPq5BZnsS3h8FnmGocp9kjpQuDf6rMLbCvgloMNiKNYClETqusN3AA5QXnExGnGmMnSkBGC0s 0ZodJ7yi6FzBLeCp4AaqflSxHSUCwxu5iWdHdNB+cwX+o=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit

The EFI fake memmap support is specific to x86, which manipulates the
EFI memory map in various different ways after receiving it from the EFI
stub. On other architectures, we have manages to push back on this, and
the EFI memory map is kept pristine.

So let's move the fake memmap code into the x86 arch tree, where it
arguably belongs.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/Kconfig                                       | 20 +++++
 arch/x86/include/asm/efi.h                             |  5 ++
 arch/x86/kernel/setup.c                                |  1 +
 arch/x86/platform/efi/Makefile                         |  1 +
 {drivers/firmware => arch/x86/platform}/efi/fake_mem.c | 79 +++++++++++++++++++-
 drivers/firmware/efi/Kconfig                           | 22 ------
 drivers/firmware/efi/Makefile                          |  4 -
 drivers/firmware/efi/fake_mem.h                        | 10 ---
 drivers/firmware/efi/x86_fake_mem.c                    | 75 -------------------
 include/linux/efi.h                                    |  6 --
 10 files changed, 103 insertions(+), 120 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f9920f1341c8..b98941c2fec4 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1978,6 +1978,26 @@ config EFI_MIXED
 
 	  If unsure, say N.
 
+config EFI_FAKE_MEMMAP
+	bool "Enable EFI fake memory map"
+	depends on EFI
+	help
+	  Saying Y here will enable "efi_fake_mem" boot option.  By specifying
+	  this parameter, you can add arbitrary attribute to specific memory
+	  range by updating original (firmware provided) EFI memmap.  This is
+	  useful for debugging of EFI memmap related feature, e.g., Address
+	  Range Mirroring feature.
+
+config EFI_MAX_FAKE_MEM
+	int "maximum allowable number of ranges in efi_fake_mem boot option"
+	depends on EFI_FAKE_MEMMAP
+	range 1 128
+	default 8
+	help
+	  Maximum allowable number of ranges in efi_fake_mem boot option.
+	  Ranges can be set up to this value using comma-separated list.
+	  The default value is 8.
+
 source "kernel/Kconfig.hz"
 
 config KEXEC
diff --git a/arch/x86/include/asm/efi.h b/arch/x86/include/asm/efi.h
index 897ea4aec16e..68414d924332 100644
--- a/arch/x86/include/asm/efi.h
+++ b/arch/x86/include/asm/efi.h
@@ -404,10 +404,15 @@ static inline void efi_reserve_boot_services(void)
 
 #ifdef CONFIG_EFI_FAKE_MEMMAP
 extern void __init efi_fake_memmap_early(void);
+extern void __init efi_fake_memmap(void);
 #else
 static inline void efi_fake_memmap_early(void)
 {
 }
+
+static inline void efi_fake_memmap(void)
+{
+}
 #endif
 
 #define arch_ima_efi_boot_mode	\
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 216fee7144ee..41ec3a69f3c7 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -31,6 +31,7 @@
 #include <xen/xen.h>
 
 #include <asm/apic.h>
+#include <asm/efi.h>
 #include <asm/numa.h>
 #include <asm/bios_ebda.h>
 #include <asm/bugs.h>
diff --git a/arch/x86/platform/efi/Makefile b/arch/x86/platform/efi/Makefile
index a50245157685..b481719b16cc 100644
--- a/arch/x86/platform/efi/Makefile
+++ b/arch/x86/platform/efi/Makefile
@@ -4,3 +4,4 @@ GCOV_PROFILE := n
 
 obj-$(CONFIG_EFI) 		+= quirks.o efi.o efi_$(BITS).o efi_stub_$(BITS).o
 obj-$(CONFIG_EFI_MIXED)		+= efi_thunk_$(BITS).o
+obj-$(CONFIG_EFI_FAKE_MEMMAP)	+= fake_mem.o
diff --git a/drivers/firmware/efi/fake_mem.c b/arch/x86/platform/efi/fake_mem.c
similarity index 58%
rename from drivers/firmware/efi/fake_mem.c
rename to arch/x86/platform/efi/fake_mem.c
index 6e0f34a38171..41d57cad3d84 100644
--- a/drivers/firmware/efi/fake_mem.c
+++ b/arch/x86/platform/efi/fake_mem.c
@@ -17,10 +17,13 @@
 #include <linux/memblock.h>
 #include <linux/types.h>
 #include <linux/sort.h>
-#include "fake_mem.h"
+#include <asm/e820/api.h>
+#include <asm/efi.h>
 
-struct efi_mem_range efi_fake_mems[EFI_MAX_FAKEMEM];
-int nr_fake_mem;
+#define EFI_MAX_FAKEMEM CONFIG_EFI_MAX_FAKE_MEM
+
+static struct efi_mem_range efi_fake_mems[EFI_MAX_FAKEMEM];
+static int nr_fake_mem;
 
 static int __init cmp_fake_mem(const void *x1, const void *x2)
 {
@@ -122,3 +125,73 @@ static int __init setup_fake_mem(char *p)
 }
 
 early_param("efi_fake_mem", setup_fake_mem);
+
+void __init efi_fake_memmap_early(void)
+{
+	int i;
+
+	/*
+	 * The late efi_fake_mem() call can handle all requests if
+	 * EFI_MEMORY_SP support is disabled.
+	 */
+	if (!efi_soft_reserve_enabled())
+		return;
+
+	if (!efi_enabled(EFI_MEMMAP) || !nr_fake_mem)
+		return;
+
+	/*
+	 * Given that efi_fake_memmap() needs to perform memblock
+	 * allocations it needs to run after e820__memblock_setup().
+	 * However, if efi_fake_mem specifies EFI_MEMORY_SP for a given
+	 * address range that potentially needs to mark the memory as
+	 * reserved prior to e820__memblock_setup(). Update e820
+	 * directly if EFI_MEMORY_SP is specified for an
+	 * EFI_CONVENTIONAL_MEMORY descriptor.
+	 */
+	for (i = 0; i < nr_fake_mem; i++) {
+		struct efi_mem_range *mem = &efi_fake_mems[i];
+		efi_memory_desc_t *md;
+		u64 m_start, m_end;
+
+		if ((mem->attribute & EFI_MEMORY_SP) == 0)
+			continue;
+
+		m_start = mem->range.start;
+		m_end = mem->range.end;
+		for_each_efi_memory_desc(md) {
+			u64 start, end, size;
+
+			if (md->type != EFI_CONVENTIONAL_MEMORY)
+				continue;
+
+			start = md->phys_addr;
+			end = md->phys_addr + (md->num_pages << EFI_PAGE_SHIFT) - 1;
+
+			if (m_start <= end && m_end >= start)
+				/* fake range overlaps descriptor */;
+			else
+				continue;
+
+			/*
+			 * Trim the boundary of the e820 update to the
+			 * descriptor in case the fake range overlaps
+			 * !EFI_CONVENTIONAL_MEMORY
+			 */
+			start = max(start, m_start);
+			end = min(end, m_end);
+			size = end - start + 1;
+
+			if (end <= start)
+				continue;
+
+			/*
+			 * Ensure each efi_fake_mem instance results in
+			 * a unique e820 resource
+			 */
+			e820__range_remove(start, size, E820_TYPE_RAM, 1);
+			e820__range_add(start, size, E820_TYPE_SOFT_RESERVED);
+			e820__update_table(e820_table);
+		}
+	}
+}
diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
index 4f7e65293297..fceeea74522e 100644
--- a/drivers/firmware/efi/Kconfig
+++ b/drivers/firmware/efi/Kconfig
@@ -37,28 +37,6 @@ config EFI_RUNTIME_MAP
 
 	  See also Documentation/ABI/testing/sysfs-firmware-efi-runtime-map.
 
-config EFI_FAKE_MEMMAP
-	bool "Enable EFI fake memory map"
-	depends on EFI && X86
-	default n
-	help
-	  Saying Y here will enable "efi_fake_mem" boot option.
-	  By specifying this parameter, you can add arbitrary attribute
-	  to specific memory range by updating original (firmware provided)
-	  EFI memmap.
-	  This is useful for debugging of EFI memmap related feature.
-	  e.g. Address Range Mirroring feature.
-
-config EFI_MAX_FAKE_MEM
-	int "maximum allowable number of ranges in efi_fake_mem boot option"
-	depends on EFI_FAKE_MEMMAP
-	range 1 128
-	default 8
-	help
-	  Maximum allowable number of ranges in efi_fake_mem boot option.
-	  Ranges can be set up to this value using comma-separated list.
-	  The default value is 8.
-
 config EFI_SOFT_RESERVE
 	bool "Reserve EFI Specific Purpose Memory"
 	depends on EFI && EFI_STUB && ACPI_HMAT
diff --git a/drivers/firmware/efi/Makefile b/drivers/firmware/efi/Makefile
index 8d151e332584..8e4f0d5b26e5 100644
--- a/drivers/firmware/efi/Makefile
+++ b/drivers/firmware/efi/Makefile
@@ -23,7 +23,6 @@ obj-$(CONFIG_UEFI_CPER)			+= cper.o
 obj-$(CONFIG_EFI_RUNTIME_MAP)		+= runtime-map.o
 obj-$(CONFIG_EFI_RUNTIME_WRAPPERS)	+= runtime-wrappers.o
 subdir-$(CONFIG_EFI_STUB)		+= libstub
-obj-$(CONFIG_EFI_FAKE_MEMMAP)		+= fake_map.o
 obj-$(CONFIG_EFI_BOOTLOADER_CONTROL)	+= efibc.o
 obj-$(CONFIG_EFI_TEST)			+= test/
 obj-$(CONFIG_EFI_DEV_PATH_PARSER)	+= dev-path-parser.o
@@ -32,9 +31,6 @@ obj-$(CONFIG_EFI_RCI2_TABLE)		+= rci2-table.o
 obj-$(CONFIG_EFI_EMBEDDED_FIRMWARE)	+= embedded-firmware.o
 obj-$(CONFIG_LOAD_UEFI_KEYS)		+= mokvar-table.o
 
-fake_map-y				+= fake_mem.o
-fake_map-$(CONFIG_X86)			+= x86_fake_mem.o
-
 obj-$(CONFIG_SYSFB)			+= sysfb_efi.o
 
 arm-obj-$(CONFIG_EFI)			:= efi-init.o arm-runtime.o
diff --git a/drivers/firmware/efi/fake_mem.h b/drivers/firmware/efi/fake_mem.h
deleted file mode 100644
index d52791af4b18..000000000000
--- a/drivers/firmware/efi/fake_mem.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __EFI_FAKE_MEM_H__
-#define __EFI_FAKE_MEM_H__
-#include <asm/efi.h>
-
-#define EFI_MAX_FAKEMEM CONFIG_EFI_MAX_FAKE_MEM
-
-extern struct efi_mem_range efi_fake_mems[EFI_MAX_FAKEMEM];
-extern int nr_fake_mem;
-#endif /* __EFI_FAKE_MEM_H__ */
diff --git a/drivers/firmware/efi/x86_fake_mem.c b/drivers/firmware/efi/x86_fake_mem.c
deleted file mode 100644
index 0bafcc1bb0f6..000000000000
--- a/drivers/firmware/efi/x86_fake_mem.c
+++ /dev/null
@@ -1,75 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright(c) 2019 Intel Corporation. All rights reserved. */
-#include <linux/efi.h>
-#include <asm/e820/api.h>
-#include "fake_mem.h"
-
-void __init efi_fake_memmap_early(void)
-{
-	int i;
-
-	/*
-	 * The late efi_fake_mem() call can handle all requests if
-	 * EFI_MEMORY_SP support is disabled.
-	 */
-	if (!efi_soft_reserve_enabled())
-		return;
-
-	if (!efi_enabled(EFI_MEMMAP) || !nr_fake_mem)
-		return;
-
-	/*
-	 * Given that efi_fake_memmap() needs to perform memblock
-	 * allocations it needs to run after e820__memblock_setup().
-	 * However, if efi_fake_mem specifies EFI_MEMORY_SP for a given
-	 * address range that potentially needs to mark the memory as
-	 * reserved prior to e820__memblock_setup(). Update e820
-	 * directly if EFI_MEMORY_SP is specified for an
-	 * EFI_CONVENTIONAL_MEMORY descriptor.
-	 */
-	for (i = 0; i < nr_fake_mem; i++) {
-		struct efi_mem_range *mem = &efi_fake_mems[i];
-		efi_memory_desc_t *md;
-		u64 m_start, m_end;
-
-		if ((mem->attribute & EFI_MEMORY_SP) == 0)
-			continue;
-
-		m_start = mem->range.start;
-		m_end = mem->range.end;
-		for_each_efi_memory_desc(md) {
-			u64 start, end, size;
-
-			if (md->type != EFI_CONVENTIONAL_MEMORY)
-				continue;
-
-			start = md->phys_addr;
-			end = md->phys_addr + (md->num_pages << EFI_PAGE_SHIFT) - 1;
-
-			if (m_start <= end && m_end >= start)
-				/* fake range overlaps descriptor */;
-			else
-				continue;
-
-			/*
-			 * Trim the boundary of the e820 update to the
-			 * descriptor in case the fake range overlaps
-			 * !EFI_CONVENTIONAL_MEMORY
-			 */
-			start = max(start, m_start);
-			end = min(end, m_end);
-			size = end - start + 1;
-
-			if (end <= start)
-				continue;
-
-			/*
-			 * Ensure each efi_fake_mem instance results in
-			 * a unique e820 resource
-			 */
-			e820__range_remove(start, size, E820_TYPE_RAM, 1);
-			e820__range_add(start, size, E820_TYPE_SOFT_RESERVED);
-			e820__update_table(e820_table);
-		}
-	}
-}
diff --git a/include/linux/efi.h b/include/linux/efi.h
index e739196ce9b2..a6dbf354d2c3 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -749,12 +749,6 @@ extern struct kobject *efi_kobj;
 extern int efi_reboot_quirk_mode;
 extern bool efi_poweroff_required(void);
 
-#ifdef CONFIG_EFI_FAKE_MEMMAP
-extern void __init efi_fake_memmap(void);
-#else
-static inline void efi_fake_memmap(void) { }
-#endif
-
 extern unsigned long efi_mem_attr_table;
 
 /*
-- 
2.35.1


