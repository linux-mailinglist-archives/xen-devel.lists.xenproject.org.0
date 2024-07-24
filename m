Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 611A593B3BC
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:32:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764292.1174736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdy5-00087k-Ic; Wed, 24 Jul 2024 15:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764292.1174736; Wed, 24 Jul 2024 15:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdy5-00082w-6g; Wed, 24 Jul 2024 15:31:53 +0000
Received: by outflank-mailman (input) for mailman id 764292;
 Wed, 24 Jul 2024 15:31:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWdy2-0005Oj-RP
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:31:51 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d79ff371-49d1-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 17:31:48 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ef283c58f4so45563841fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:31:48 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef2b568858sm13237311fa.35.2024.07.24.08.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:31:44 -0700 (PDT)
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
X-Inumbo-ID: d79ff371-49d1-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835108; x=1722439908; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhDenI8Vqhfps04l6z19lXhWwx3sADiuBr8IbwOHpQQ=;
        b=e5CD/4nsSmjuC+vTZupZL4WUhFjwUPBd+NSClhdBL+hsxT11BkMsEmaxnNG48XM7zw
         ecFuAe/XXMR4ylBU4dX6nnH3pzdIFP/kHBlu9Cruas0GAv9ewHfx1+bt+JuT8tnLy4S2
         QEC3cgPAS4SO9P0qXtcZullwnUO/d82wMlUXQ+u/x7TFbqv1eWRjOuWH4aWjPBqwYfq0
         p2Nvotd5TBByZG6CIEwRJ1hiufmEYip1I2IMvmMI+izhTlHZMiZ47X0Sjl1SDksGSilQ
         8Kv/xLYVJzGYf9llW97bRDOEYh0CmqHZMX8QHBTEUgAiD3iK4euOgCr+Hm9bTBd/30+S
         k4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835108; x=1722439908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhDenI8Vqhfps04l6z19lXhWwx3sADiuBr8IbwOHpQQ=;
        b=MUrjI+BQj56LGhv26Lr6kheRxC39wAivxaY+CRGv252BKq1ehGIuDVSli/Nel4lRy1
         XooBYY72oVJOmB/GABCa8MZRBom/++bCYC7utzZNvelR/aWY01mM1Tb/vC35x4QJSjvW
         tw87Y9NEDzgL0FIeCs61ugVO8z448C9FPOiCps6SlanRfI8ybhG72YAXRKWr/hIcEak5
         mDykyLlgBqlG79MkkFG5PmLTDNT8ajqmEiIbtAVQwLJW89syGTM414E+SWxExsuaatn2
         BEOLyLPy9Nqezsyu8kdHAGzxMgQDxfnqS6i07x4qqFQNr73PTDRS0LRleLWjKd0ddDer
         aDoQ==
X-Gm-Message-State: AOJu0YyBUJLrorMCwjv/4Ys3r1gEmcer+xe3msyJPDAD5vrcJm74vM5N
	5B9BCNVvdnmDEyviHrr5FE+p3OiR6Gj36IhYQ4zzwQW7bGRJylhC3QjWxMzE
X-Google-Smtp-Source: AGHT+IEw2Ih7TjqWFH9quAInXrvmq/LMGy5eEqDbb+l4/OtqUgs8BZpiZZqTHUX1ITGf2HvUHoJgZQ==
X-Received: by 2002:a2e:8758:0:b0:2ef:2608:2e47 with SMTP id 38308e7fff4ca-2f039e92a53mr1149591fa.13.1721835104866;
        Wed, 24 Jul 2024 08:31:44 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v7 1/9] xen/device-tree: Move Arm's setup.c bootinfo functions to common
Date: Wed, 24 Jul 2024 17:31:32 +0200
Message-ID: <102f8b60c55cdf2db5890b9fb1c2fb66e61c4a67.1721834549.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721834549.git.oleksii.kurochko@gmail.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shawn Anastasio <sanastasio@raptorengineering.com>

Arm's setup.c contains a collection of functions for parsing memory map
and other boot information from a device tree. Since these routines are
generally useful on any architecture that supports device tree booting,
move them into xen/common/device-tree.

Also, common/device_tree.c has been moved to the device-tree folder with
the corresponding updates to common/Makefile and common/device-tree/Makefile.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - move obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/ to proper place in common/Makefile.
 - rename macros __XEN_BOOTFDT_H__ to XEN_BOOTFDT_H to not violate MISRA rule 21.1.
 - drop definition of "#define MAX_FDT_SIZE SZ_2M" in xen/bootfdt.h as it is expected to
   be arch-specific. Back "#define MAX_FDT_SIZE SZ_2M" to arm/setup.h where it was before
   these changes.
 - git mv xen/common/device_tree.c xen/common/device-tree/ and update correspondingly
   Makefiles of common/ and common/device-tree
 - update the commit message
---
Changes in V6:
 - update the version of the patch to v6.   
---
Changes in V5:
 - add xen/include/xen/bootfdt.h to MAINTAINERS file.
 - drop message "Early device tree parsing and".
 - After rebase on top of the current staging the following changes were done:
   - init bootinfo variable in <common/device-tree/bootinfo.c> with BOOTINFO_INIT;
   - update the code of dt_unreserved_regions():
       CONFIG_STATIC_SHM related changes and getting of reserved_mem
       bootinfo_get_shmem() ??
   - update the code of meminfo_overlap_check():
       add check ( INVALID_PADDR == bank_start ) to if case.
   - update the code of check_reserved_regions_overlap():
       CONFIG_STATIC_SHM related changes.
   - struct bootinfo was updated ( CONFIG_STATIC_SHM changes )
   - add shared_meminfo ( because of CONFIG_STATIC_SHM )
   - struct struct membanks was update with __struct group so <xen/kernel> is
     neeeded to be included in bootfdt.h
   - move BOOTINFO_ACPI_INIT, BOOTINFO_SHMEM_INIT, BOOTINFO_INIT to generic bootfdt.h
   - bootinfo_get_reserved_mem(), bootinfo_get_mem(), bootinfo_get_acpi(),
     bootinfo_get_shmem() and bootinfo_get_shmem_extra() were moved to xen/bootfdt.h
 - s/arm32/CONFIG_SEPARATE_XENHEAP/
 - add inclusion of <xen/macros.h> because there are function in <xen/bootfdt.h> which
   are using container_of().
 ---
Changes in v4:
  - create new xen/include/bootinfo.h rather than relying on arch's
    asm/setup.h to provide required definitions for bootinfo.c
  - build bootinfo.c as .init.o
  - clean up and sort bootinfo.c's #includes
  - use CONFIG_SEPARATE_XENHEAP rather than CONFIG_ARM_32 to guard
    xenheap-specific behavior of populate_boot_allocator
  - (MAINTAINERS) include all of common/device-tree rather than just
    bootinfo.c
---
 MAINTAINERS                          |    2 +
 xen/arch/arm/include/asm/setup.h     |  185 +--
 xen/arch/arm/setup.c                 |  432 -----
 xen/common/Makefile                  |    2 +-
 xen/common/device-tree/Makefile      |    2 +
 xen/common/device-tree/bootinfo.c    |  459 ++++++
 xen/common/device-tree/device_tree.c | 2253 ++++++++++++++++++++++++++
 xen/common/device_tree.c             | 2253 --------------------------
 xen/include/xen/bootfdt.h            |  195 +++
 9 files changed, 2913 insertions(+), 2870 deletions(-)
 create mode 100644 xen/common/device-tree/Makefile
 create mode 100644 xen/common/device-tree/bootinfo.c
 create mode 100644 xen/common/device-tree/device_tree.c
 delete mode 100644 xen/common/device_tree.c
 create mode 100644 xen/include/xen/bootfdt.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b0c894527..505915b6b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -295,9 +295,11 @@ M:	Stefano Stabellini <sstabellini@kernel.org>
 M:	Julien Grall <julien@xen.org>
 S:	Supported
 F:	xen/common/libfdt/
+F:	xen/common/device-tree/
 F:	xen/common/device_tree.c
 F:	xen/common/dt-overlay.c
 F:	xen/include/xen/libfdt/
+F:	xen/include/xen/bootfdt.h
 F:	xen/include/xen/device_tree.h
 F:	xen/drivers/passthrough/device_tree.c
 
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index c34179da93..1748be29e5 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -3,159 +3,11 @@
 
 #include <public/version.h>
 #include <asm/p2m.h>
+#include <xen/bootfdt.h>
 #include <xen/device_tree.h>
 
-#define MIN_FDT_ALIGN 8
 #define MAX_FDT_SIZE SZ_2M
 
-#define NR_MEM_BANKS 256
-#define NR_SHMEM_BANKS 32
-
-#define MAX_MODULES 32 /* Current maximum useful modules */
-
-typedef enum {
-    BOOTMOD_XEN,
-    BOOTMOD_FDT,
-    BOOTMOD_KERNEL,
-    BOOTMOD_RAMDISK,
-    BOOTMOD_XSM,
-    BOOTMOD_GUEST_DTB,
-    BOOTMOD_UNKNOWN
-}  bootmodule_kind;
-
-enum membank_type {
-    /*
-     * The MEMBANK_DEFAULT type refers to either reserved memory for the
-     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
-     * the bank is in 'mem').
-     */
-    MEMBANK_DEFAULT,
-    /*
-     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the memory
-     * bank is bound to a static Xen domain. It is only valid when the bank
-     * is in reserved_mem.
-     */
-    MEMBANK_STATIC_DOMAIN,
-    /*
-     * The MEMBANK_STATIC_HEAP type is used to indicate whether the memory
-     * bank is reserved as static heap. It is only valid when the bank is
-     * in reserved_mem.
-     */
-    MEMBANK_STATIC_HEAP,
-    /*
-     * The MEMBANK_FDT_RESVMEM type is used to indicate whether the memory
-     * bank is from the FDT reserve map.
-     */
-    MEMBANK_FDT_RESVMEM,
-};
-
-/* Indicates the maximum number of characters(\0 included) for shm_id */
-#define MAX_SHM_ID_LENGTH 16
-
-struct shmem_membank_extra {
-    char shm_id[MAX_SHM_ID_LENGTH];
-    unsigned int nr_shm_borrowers;
-};
-
-struct membank {
-    paddr_t start;
-    paddr_t size;
-    union {
-        enum membank_type type;
-#ifdef CONFIG_STATIC_SHM
-        struct shmem_membank_extra *shmem_extra;
-#endif
-    };
-};
-
-struct membanks {
-    __struct_group(membanks_hdr, common, ,
-        unsigned int nr_banks;
-        unsigned int max_banks;
-    );
-    struct membank bank[];
-};
-
-struct meminfo {
-    struct membanks_hdr common;
-    struct membank bank[NR_MEM_BANKS];
-};
-
-struct shared_meminfo {
-    struct membanks_hdr common;
-    struct membank bank[NR_SHMEM_BANKS];
-    struct shmem_membank_extra extra[NR_SHMEM_BANKS];
-};
-
-/*
- * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
- * The purpose of the domU flag is to avoid getting confused in
- * kernel_probe, where we try to guess which is the dom0 kernel and
- * initrd to be compatible with all versions of the multiboot spec. 
- */
-#define BOOTMOD_MAX_CMDLINE 1024
-struct bootmodule {
-    bootmodule_kind kind;
-    bool domU;
-    paddr_t start;
-    paddr_t size;
-};
-
-/* DT_MAX_NAME is the node name max length according the DT spec */
-#define DT_MAX_NAME 41
-struct bootcmdline {
-    bootmodule_kind kind;
-    bool domU;
-    paddr_t start;
-    char dt_name[DT_MAX_NAME];
-    char cmdline[BOOTMOD_MAX_CMDLINE];
-};
-
-struct bootmodules {
-    int nr_mods;
-    struct bootmodule module[MAX_MODULES];
-};
-
-struct bootcmdlines {
-    unsigned int nr_mods;
-    struct bootcmdline cmdline[MAX_MODULES];
-};
-
-struct bootinfo {
-    struct meminfo mem;
-    /* The reserved regions are only used when booting using Device-Tree */
-    struct meminfo reserved_mem;
-    struct bootmodules modules;
-    struct bootcmdlines cmdlines;
-#ifdef CONFIG_ACPI
-    struct meminfo acpi;
-#endif
-#ifdef CONFIG_STATIC_SHM
-    struct shared_meminfo shmem;
-#endif
-    bool static_heap;
-};
-
-#ifdef CONFIG_ACPI
-#define BOOTINFO_ACPI_INIT .acpi.common.max_banks = NR_MEM_BANKS,
-#else
-#define BOOTINFO_ACPI_INIT
-#endif
-
-#ifdef CONFIG_STATIC_SHM
-#define BOOTINFO_SHMEM_INIT .shmem.common.max_banks = NR_SHMEM_BANKS,
-#else
-#define BOOTINFO_SHMEM_INIT
-#endif
-
-#define BOOTINFO_INIT                               \
-{                                                   \
-    .mem.common.max_banks = NR_MEM_BANKS,           \
-    .reserved_mem.common.max_banks = NR_MEM_BANKS,  \
-    BOOTINFO_ACPI_INIT                              \
-    BOOTINFO_SHMEM_INIT                             \
-}
-
 struct map_range_data
 {
     struct domain *d;
@@ -167,39 +19,8 @@ struct map_range_data
     struct rangeset *irq_ranges;
 };
 
-extern struct bootinfo bootinfo;
-
 extern domid_t max_init_domid;
 
-static inline struct membanks *bootinfo_get_mem(void)
-{
-    return container_of(&bootinfo.mem.common, struct membanks, common);
-}
-
-static inline struct membanks *bootinfo_get_reserved_mem(void)
-{
-    return container_of(&bootinfo.reserved_mem.common, struct membanks, common);
-}
-
-#ifdef CONFIG_ACPI
-static inline struct membanks *bootinfo_get_acpi(void)
-{
-    return container_of(&bootinfo.acpi.common, struct membanks, common);
-}
-#endif
-
-#ifdef CONFIG_STATIC_SHM
-static inline struct membanks *bootinfo_get_shmem(void)
-{
-    return container_of(&bootinfo.shmem.common, struct membanks, common);
-}
-
-static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
-{
-    return bootinfo.shmem.extra;
-}
-#endif
-
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
 size_t estimate_efi_size(unsigned int mem_nr_banks);
@@ -220,9 +41,6 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
                            void (*cb)(paddr_t ps, paddr_t pe),
                            unsigned int first);
 
-size_t boot_fdt_info(const void *fdt, paddr_t paddr);
-const char *boot_fdt_cmdline(const void *fdt);
-
 bool check_reserved_regions_overlap(paddr_t region_start, paddr_t region_size);
 
 struct bootmodule *add_boot_module(bootmodule_kind kind,
@@ -237,7 +55,6 @@ struct bootcmdline * boot_cmdline_find_by_name(const char *name);
 const char *boot_module_kind_as_string(bootmodule_kind kind);
 
 void init_pdx(void);
-void populate_boot_allocator(void);
 void setup_mm(void);
 
 extern uint32_t hyp_traps_vector[];
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 0c2fdaceaf..cb2c0a16b8 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -48,8 +48,6 @@
 #include <xsm/xsm.h>
 #include <asm/acpi.h>
 
-struct bootinfo __initdata bootinfo = BOOTINFO_INIT;
-
 /*
  * Sanitized version of cpuinfo containing only features available on all
  * cores (only on arm64 as there is no sanitization support on arm32).
@@ -203,321 +201,6 @@ static void __init processor_id(void)
     processor_setup();
 }
 
-static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
-                                         void (*cb)(paddr_t ps, paddr_t pe),
-                                         unsigned int first)
-{
-    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
-#ifdef CONFIG_STATIC_SHM
-    const struct membanks *shmem = bootinfo_get_shmem();
-    unsigned int offset;
-#endif
-    unsigned int i;
-
-    /*
-     * i is the current bootmodule we are evaluating across all possible
-     * kinds.
-     */
-    for ( i = first; i < reserved_mem->nr_banks; i++ )
-    {
-        paddr_t r_s = reserved_mem->bank[i].start;
-        paddr_t r_e = r_s + reserved_mem->bank[i].size;
-
-        if ( s < r_e && r_s < e )
-        {
-            dt_unreserved_regions(r_e, e, cb, i + 1);
-            dt_unreserved_regions(s, r_s, cb, i + 1);
-            return;
-        }
-    }
-
-#ifdef CONFIG_STATIC_SHM
-    /*
-     * When retrieving the corresponding shared memory addresses
-     * below, we need to index the shmem->bank starting from 0, hence
-     * we need to use i - reserved_mem->nr_banks.
-    */
-    offset = reserved_mem->nr_banks;
-    for ( ; i - offset < shmem->nr_banks; i++ )
-    {
-        paddr_t r_s, r_e;
-
-        r_s = shmem->bank[i - offset].start;
-
-        /* Shared memory banks can contain INVALID_PADDR as start */
-        if ( INVALID_PADDR == r_s )
-            continue;
-
-        r_e = r_s + shmem->bank[i - offset].size;
-
-        if ( s < r_e && r_s < e )
-        {
-            dt_unreserved_regions(r_e, e, cb, i + 1);
-            dt_unreserved_regions(s, r_s, cb, i + 1);
-            return;
-        }
-    }
-#endif
-
-    cb(s, e);
-}
-
-/*
- * TODO: '*_end' could be 0 if the bank/region is at the end of the physical
- * address space. This is for now not handled as it requires more rework.
- */
-static bool __init meminfo_overlap_check(const struct membanks *mem,
-                                         paddr_t region_start,
-                                         paddr_t region_size)
-{
-    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
-    paddr_t region_end = region_start + region_size;
-    unsigned int i, bank_num = mem->nr_banks;
-
-    for ( i = 0; i < bank_num; i++ )
-    {
-        bank_start = mem->bank[i].start;
-        bank_end = bank_start + mem->bank[i].size;
-
-        if ( INVALID_PADDR == bank_start || region_end <= bank_start ||
-             region_start >= bank_end )
-            continue;
-        else
-        {
-            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
-                   region_start, region_end, i, bank_start, bank_end);
-            return true;
-        }
-    }
-
-    return false;
-}
-
-/*
- * TODO: '*_end' could be 0 if the module/region is at the end of the physical
- * address space. This is for now not handled as it requires more rework.
- */
-static bool __init bootmodules_overlap_check(struct bootmodules *bootmodules,
-                                             paddr_t region_start,
-                                             paddr_t region_size)
-{
-    paddr_t mod_start = INVALID_PADDR, mod_end = 0;
-    paddr_t region_end = region_start + region_size;
-    unsigned int i, mod_num = bootmodules->nr_mods;
-
-    for ( i = 0; i < mod_num; i++ )
-    {
-        mod_start = bootmodules->module[i].start;
-        mod_end = mod_start + bootmodules->module[i].size;
-
-        if ( region_end <= mod_start || region_start >= mod_end )
-            continue;
-        else
-        {
-            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with mod[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
-                   region_start, region_end, i, mod_start, mod_end);
-            return true;
-        }
-    }
-
-    return false;
-}
-
-void __init fw_unreserved_regions(paddr_t s, paddr_t e,
-                                  void (*cb)(paddr_t ps, paddr_t pe),
-                                  unsigned int first)
-{
-    if ( acpi_disabled )
-        dt_unreserved_regions(s, e, cb, first);
-    else
-        cb(s, e);
-}
-
-/*
- * Given an input physical address range, check if this range is overlapping
- * with the existing reserved memory regions defined in bootinfo.
- * Return true if the input physical address range is overlapping with any
- * existing reserved memory regions, otherwise false.
- */
-bool __init check_reserved_regions_overlap(paddr_t region_start,
-                                           paddr_t region_size)
-{
-    const struct membanks *mem_banks[] = {
-        bootinfo_get_reserved_mem(),
-#ifdef CONFIG_ACPI
-        bootinfo_get_acpi(),
-#endif
-#ifdef CONFIG_STATIC_SHM
-        bootinfo_get_shmem(),
-#endif
-    };
-    unsigned int i;
-
-    /*
-     * Check if input region is overlapping with reserved memory banks or
-     * ACPI EfiACPIReclaimMemory (when ACPI feature is enabled) or static
-     * shared memory banks (when static shared memory feature is enabled)
-     */
-    for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
-        if ( meminfo_overlap_check(mem_banks[i], region_start, region_size) )
-            return true;
-
-    /* Check if input region is overlapping with bootmodules */
-    if ( bootmodules_overlap_check(&bootinfo.modules,
-                                   region_start, region_size) )
-        return true;
-
-    return false;
-}
-
-struct bootmodule __init *add_boot_module(bootmodule_kind kind,
-                                          paddr_t start, paddr_t size,
-                                          bool domU)
-{
-    struct bootmodules *mods = &bootinfo.modules;
-    struct bootmodule *mod;
-    unsigned int i;
-
-    if ( mods->nr_mods == MAX_MODULES )
-    {
-        printk("Ignoring %s boot module at %"PRIpaddr"-%"PRIpaddr" (too many)\n",
-               boot_module_kind_as_string(kind), start, start + size);
-        return NULL;
-    }
-
-    if ( check_reserved_regions_overlap(start, size) )
-        return NULL;
-
-    for ( i = 0 ; i < mods->nr_mods ; i++ )
-    {
-        mod = &mods->module[i];
-        if ( mod->kind == kind && mod->start == start )
-        {
-            if ( !domU )
-                mod->domU = false;
-            return mod;
-        }
-    }
-
-    mod = &mods->module[mods->nr_mods++];
-    mod->kind = kind;
-    mod->start = start;
-    mod->size = size;
-    mod->domU = domU;
-
-    return mod;
-}
-
-/*
- * boot_module_find_by_kind can only be used to return Xen modules (e.g
- * XSM, DTB) or Dom0 modules. This is not suitable for looking up guest
- * modules.
- */
-struct bootmodule * __init boot_module_find_by_kind(bootmodule_kind kind)
-{
-    struct bootmodules *mods = &bootinfo.modules;
-    struct bootmodule *mod;
-    int i;
-    for (i = 0 ; i < mods->nr_mods ; i++ )
-    {
-        mod = &mods->module[i];
-        if ( mod->kind == kind && !mod->domU )
-            return mod;
-    }
-    return NULL;
-}
-
-void __init add_boot_cmdline(const char *name, const char *cmdline,
-                             bootmodule_kind kind, paddr_t start, bool domU)
-{
-    struct bootcmdlines *cmds = &bootinfo.cmdlines;
-    struct bootcmdline *cmd;
-
-    if ( cmds->nr_mods == MAX_MODULES )
-    {
-        printk("Ignoring %s cmdline (too many)\n", name);
-        return;
-    }
-
-    cmd = &cmds->cmdline[cmds->nr_mods++];
-    cmd->kind = kind;
-    cmd->domU = domU;
-    cmd->start = start;
-
-    ASSERT(strlen(name) <= DT_MAX_NAME);
-    safe_strcpy(cmd->dt_name, name);
-
-    if ( strlen(cmdline) > BOOTMOD_MAX_CMDLINE )
-        panic("module %s command line too long\n", name);
-    safe_strcpy(cmd->cmdline, cmdline);
-}
-
-/*
- * boot_cmdline_find_by_kind can only be used to return Xen modules (e.g
- * XSM, DTB) or Dom0 modules. This is not suitable for looking up guest
- * modules.
- */
-struct bootcmdline * __init boot_cmdline_find_by_kind(bootmodule_kind kind)
-{
-    struct bootcmdlines *cmds = &bootinfo.cmdlines;
-    struct bootcmdline *cmd;
-    int i;
-
-    for ( i = 0 ; i < cmds->nr_mods ; i++ )
-    {
-        cmd = &cmds->cmdline[i];
-        if ( cmd->kind == kind && !cmd->domU )
-            return cmd;
-    }
-    return NULL;
-}
-
-struct bootcmdline * __init boot_cmdline_find_by_name(const char *name)
-{
-    struct bootcmdlines *mods = &bootinfo.cmdlines;
-    struct bootcmdline *mod;
-    unsigned int i;
-
-    for (i = 0 ; i < mods->nr_mods ; i++ )
-    {
-        mod = &mods->cmdline[i];
-        if ( strcmp(mod->dt_name, name) == 0 )
-            return mod;
-    }
-    return NULL;
-}
-
-struct bootmodule * __init boot_module_find_by_addr_and_kind(bootmodule_kind kind,
-                                                             paddr_t start)
-{
-    struct bootmodules *mods = &bootinfo.modules;
-    struct bootmodule *mod;
-    unsigned int i;
-
-    for (i = 0 ; i < mods->nr_mods ; i++ )
-    {
-        mod = &mods->module[i];
-        if ( mod->kind == kind && mod->start == start )
-            return mod;
-    }
-    return NULL;
-}
-
-const char * __init boot_module_kind_as_string(bootmodule_kind kind)
-{
-    switch ( kind )
-    {
-    case BOOTMOD_XEN:     return "Xen";
-    case BOOTMOD_FDT:     return "Device Tree";
-    case BOOTMOD_KERNEL:  return "Kernel";
-    case BOOTMOD_RAMDISK: return "Ramdisk";
-    case BOOTMOD_XSM:     return "XSM";
-    case BOOTMOD_GUEST_DTB:     return "DTB";
-    case BOOTMOD_UNKNOWN: return "Unknown";
-    default: BUG();
-    }
-}
-
 void __init discard_initial_modules(void)
 {
     struct bootmodules *mi = &bootinfo.modules;
@@ -556,40 +239,6 @@ static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
     return fdt;
 }
 
-/*
- * Return the end of the non-module region starting at s. In other
- * words return s the start of the next modules after s.
- *
- * On input *end is the end of the region which should be considered
- * and it is updated to reflect the end of the module, clipped to the
- * end of the region if it would run over.
- */
-static paddr_t __init next_module(paddr_t s, paddr_t *end)
-{
-    struct bootmodules *mi = &bootinfo.modules;
-    paddr_t lowest = ~(paddr_t)0;
-    int i;
-
-    for ( i = 0; i < mi->nr_mods; i++ )
-    {
-        paddr_t mod_s = mi->module[i].start;
-        paddr_t mod_e = mod_s + mi->module[i].size;
-
-        if ( !mi->module[i].size )
-            continue;
-
-        if ( mod_s < s )
-            continue;
-        if ( mod_s > lowest )
-            continue;
-        if ( mod_s > *end )
-            continue;
-        lowest = mod_s;
-        *end = min(*end, mod_e);
-    }
-    return lowest;
-}
-
 void __init init_pdx(void)
 {
     const struct membanks *mem = bootinfo_get_mem();
@@ -635,87 +284,6 @@ void __init init_pdx(void)
     }
 }
 
-/*
- * Populate the boot allocator.
- * If a static heap was not provided by the admin, all the RAM but the
- * following regions will be added:
- *  - Modules (e.g., Xen, Kernel)
- *  - Reserved regions
- *  - Xenheap (arm32 only)
- * If a static heap was provided by the admin, populate the boot
- * allocator with the corresponding regions only, but with Xenheap excluded
- * on arm32.
- */
-void __init populate_boot_allocator(void)
-{
-    unsigned int i;
-    const struct membanks *banks = bootinfo_get_mem();
-    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
-    paddr_t s, e;
-
-    if ( bootinfo.static_heap )
-    {
-        for ( i = 0 ; i < reserved_mem->nr_banks; i++ )
-        {
-            if ( reserved_mem->bank[i].type != MEMBANK_STATIC_HEAP )
-                continue;
-
-            s = reserved_mem->bank[i].start;
-            e = s + reserved_mem->bank[i].size;
-#ifdef CONFIG_ARM_32
-            /* Avoid the xenheap, note that the xenheap cannot across a bank */
-            if ( s <= mfn_to_maddr(directmap_mfn_start) &&
-                 e >= mfn_to_maddr(directmap_mfn_end) )
-            {
-                init_boot_pages(s, mfn_to_maddr(directmap_mfn_start));
-                init_boot_pages(mfn_to_maddr(directmap_mfn_end), e);
-            }
-            else
-#endif
-                init_boot_pages(s, e);
-        }
-
-        return;
-    }
-
-    for ( i = 0; i < banks->nr_banks; i++ )
-    {
-        const struct membank *bank = &banks->bank[i];
-        paddr_t bank_end = bank->start + bank->size;
-
-        s = bank->start;
-        while ( s < bank_end )
-        {
-            paddr_t n = bank_end;
-
-            e = next_module(s, &n);
-
-            if ( e == ~(paddr_t)0 )
-                e = n = bank_end;
-
-            /*
-             * Module in a RAM bank other than the one which we are
-             * not dealing with here.
-             */
-            if ( e > bank_end )
-                e = bank_end;
-
-#ifdef CONFIG_ARM_32
-            /* Avoid the xenheap */
-            if ( s < mfn_to_maddr(directmap_mfn_end) &&
-                 mfn_to_maddr(directmap_mfn_start) < e )
-            {
-                e = mfn_to_maddr(directmap_mfn_start);
-                n = mfn_to_maddr(directmap_mfn_end);
-            }
-#endif
-
-            fw_unreserved_regions(s, e, init_boot_pages, 0);
-            s = n;
-        }
-    }
-}
-
 size_t __read_mostly dcache_line_bytes;
 
 /* C entry point for boot CPU */
diff --git a/xen/common/Makefile b/xen/common/Makefile
index f12a474d40..7e66802a9e 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -6,7 +6,7 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
-obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
+obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
new file mode 100644
index 0000000000..da892dd55d
--- /dev/null
+++ b/xen/common/device-tree/Makefile
@@ -0,0 +1,2 @@
+obj-y += bootinfo.init.o
+obj-y += device_tree.o
diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
new file mode 100644
index 0000000000..dcac9a40a0
--- /dev/null
+++ b/xen/common/device-tree/bootinfo.c
@@ -0,0 +1,459 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Derived from $xen/arch/arm/setup.c.
+ *
+ * bookkeeping routines.
+ *
+ * Tim Deegan <tim@xen.org>
+ * Copyright (c) 2011 Citrix Systems.
+ * Copyright (c) 2024 Raptor Engineering LLC
+ */
+
+#include <xen/acpi.h>
+#include <xen/bootfdt.h>
+#include <xen/bug.h>
+#include <xen/device_tree.h>
+#include <xen/init.h>
+#include <xen/libfdt/libfdt-xen.h>
+#include <xen/mm.h>
+
+struct bootinfo __initdata bootinfo = BOOTINFO_INIT;
+
+const char * __init boot_module_kind_as_string(bootmodule_kind kind)
+{
+    switch ( kind )
+    {
+    case BOOTMOD_XEN:     return "Xen";
+    case BOOTMOD_FDT:     return "Device Tree";
+    case BOOTMOD_KERNEL:  return "Kernel";
+    case BOOTMOD_RAMDISK: return "Ramdisk";
+    case BOOTMOD_XSM:     return "XSM";
+    case BOOTMOD_GUEST_DTB:     return "DTB";
+    case BOOTMOD_UNKNOWN: return "Unknown";
+    default: BUG();
+    }
+}
+
+static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
+                                         void (*cb)(paddr_t ps, paddr_t pe),
+                                         unsigned int first)
+{
+    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
+#ifdef CONFIG_STATIC_SHM
+    const struct membanks *shmem = bootinfo_get_shmem();
+    unsigned int offset;
+#endif
+    unsigned int i;
+
+    /*
+     * i is the current bootmodule we are evaluating across all possible
+     * kinds.
+     */
+    for ( i = first; i < reserved_mem->nr_banks; i++ )
+    {
+        paddr_t r_s = reserved_mem->bank[i].start;
+        paddr_t r_e = r_s + reserved_mem->bank[i].size;
+
+        if ( s < r_e && r_s < e )
+        {
+            dt_unreserved_regions(r_e, e, cb, i + 1);
+            dt_unreserved_regions(s, r_s, cb, i + 1);
+            return;
+        }
+    }
+
+#ifdef CONFIG_STATIC_SHM
+    /*
+     * When retrieving the corresponding shared memory addresses
+     * below, we need to index the shmem->bank starting from 0, hence
+     * we need to use i - reserved_mem->nr_banks.
+    */
+    offset = reserved_mem->nr_banks;
+    for ( ; i - offset < shmem->nr_banks; i++ )
+    {
+        paddr_t r_s, r_e;
+
+        r_s = shmem->bank[i - offset].start;
+
+        /* Shared memory banks can contain INVALID_PADDR as start */
+        if ( INVALID_PADDR == r_s )
+            continue;
+
+        r_e = r_s + shmem->bank[i - offset].size;
+
+        if ( s < r_e && r_s < e )
+        {
+            dt_unreserved_regions(r_e, e, cb, i + 1);
+            dt_unreserved_regions(s, r_s, cb, i + 1);
+            return;
+        }
+    }
+#endif
+
+    cb(s, e);
+}
+
+/*
+ * TODO: '*_end' could be 0 if the bank/region is at the end of the physical
+ * address space. This is for now not handled as it requires more rework.
+ */
+static bool __init meminfo_overlap_check(const struct membanks *mem,
+                                         paddr_t region_start,
+                                         paddr_t region_size)
+{
+    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
+    paddr_t region_end = region_start + region_size;
+    unsigned int i, bank_num = mem->nr_banks;
+
+    for ( i = 0; i < bank_num; i++ )
+    {
+        bank_start = mem->bank[i].start;
+        bank_end = bank_start + mem->bank[i].size;
+
+        if ( INVALID_PADDR == bank_start || region_end <= bank_start ||
+             region_start >= bank_end )
+            continue;
+        else
+        {
+            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
+                   region_start, region_end, i, bank_start, bank_end);
+            return true;
+        }
+    }
+
+    return false;
+}
+
+/*
+ * TODO: '*_end' could be 0 if the module/region is at the end of the physical
+ * address space. This is for now not handled as it requires more rework.
+ */
+static bool __init bootmodules_overlap_check(struct bootmodules *bootmodules,
+                                             paddr_t region_start,
+                                             paddr_t region_size)
+{
+    paddr_t mod_start = INVALID_PADDR, mod_end = 0;
+    paddr_t region_end = region_start + region_size;
+    unsigned int i, mod_num = bootmodules->nr_mods;
+
+    for ( i = 0; i < mod_num; i++ )
+    {
+        mod_start = bootmodules->module[i].start;
+        mod_end = mod_start + bootmodules->module[i].size;
+
+        if ( region_end <= mod_start || region_start >= mod_end )
+            continue;
+        else
+        {
+            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with mod[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
+                   region_start, region_end, i, mod_start, mod_end);
+            return true;
+        }
+    }
+
+    return false;
+}
+
+void __init fw_unreserved_regions(paddr_t s, paddr_t e,
+                                  void (*cb)(paddr_t ps, paddr_t pe),
+                                  unsigned int first)
+{
+    if ( acpi_disabled )
+        dt_unreserved_regions(s, e, cb, first);
+    else
+        cb(s, e);
+}
+
+/*
+ * Given an input physical address range, check if this range is overlapping
+ * with the existing reserved memory regions defined in bootinfo.
+ * Return true if the input physical address range is overlapping with any
+ * existing reserved memory regions, otherwise false.
+ */
+bool __init check_reserved_regions_overlap(paddr_t region_start,
+                                           paddr_t region_size)
+{
+    const struct membanks *mem_banks[] = {
+        bootinfo_get_reserved_mem(),
+#ifdef CONFIG_ACPI
+        bootinfo_get_acpi(),
+#endif
+#ifdef CONFIG_STATIC_SHM
+        bootinfo_get_shmem(),
+#endif
+    };
+    unsigned int i;
+
+    /*
+     * Check if input region is overlapping with reserved memory banks or
+     * ACPI EfiACPIReclaimMemory (when ACPI feature is enabled) or static
+     * shared memory banks (when static shared memory feature is enabled)
+     */
+    for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
+        if ( meminfo_overlap_check(mem_banks[i], region_start, region_size) )
+            return true;
+
+    /* Check if input region is overlapping with bootmodules */
+    if ( bootmodules_overlap_check(&bootinfo.modules,
+                                   region_start, region_size) )
+        return true;
+
+    return false;
+}
+
+struct bootmodule __init *add_boot_module(bootmodule_kind kind,
+                                          paddr_t start, paddr_t size,
+                                          bool domU)
+{
+    struct bootmodules *mods = &bootinfo.modules;
+    struct bootmodule *mod;
+    unsigned int i;
+
+    if ( mods->nr_mods == MAX_MODULES )
+    {
+        printk("Ignoring %s boot module at %"PRIpaddr"-%"PRIpaddr" (too many)\n",
+               boot_module_kind_as_string(kind), start, start + size);
+        return NULL;
+    }
+
+    if ( check_reserved_regions_overlap(start, size) )
+        return NULL;
+
+    for ( i = 0 ; i < mods->nr_mods ; i++ )
+    {
+        mod = &mods->module[i];
+        if ( mod->kind == kind && mod->start == start )
+        {
+            if ( !domU )
+                mod->domU = false;
+            return mod;
+        }
+    }
+
+    mod = &mods->module[mods->nr_mods++];
+    mod->kind = kind;
+    mod->start = start;
+    mod->size = size;
+    mod->domU = domU;
+
+    return mod;
+}
+
+/*
+ * boot_module_find_by_kind can only be used to return Xen modules (e.g
+ * XSM, DTB) or Dom0 modules. This is not suitable for looking up guest
+ * modules.
+ */
+struct bootmodule * __init boot_module_find_by_kind(bootmodule_kind kind)
+{
+    struct bootmodules *mods = &bootinfo.modules;
+    struct bootmodule *mod;
+    int i;
+    for (i = 0 ; i < mods->nr_mods ; i++ )
+    {
+        mod = &mods->module[i];
+        if ( mod->kind == kind && !mod->domU )
+            return mod;
+    }
+    return NULL;
+}
+
+void __init add_boot_cmdline(const char *name, const char *cmdline,
+                             bootmodule_kind kind, paddr_t start, bool domU)
+{
+    struct bootcmdlines *cmds = &bootinfo.cmdlines;
+    struct bootcmdline *cmd;
+
+    if ( cmds->nr_mods == MAX_MODULES )
+    {
+        printk("Ignoring %s cmdline (too many)\n", name);
+        return;
+    }
+
+    cmd = &cmds->cmdline[cmds->nr_mods++];
+    cmd->kind = kind;
+    cmd->domU = domU;
+    cmd->start = start;
+
+    ASSERT(strlen(name) <= DT_MAX_NAME);
+    safe_strcpy(cmd->dt_name, name);
+
+    if ( strlen(cmdline) > BOOTMOD_MAX_CMDLINE )
+        panic("module %s command line too long\n", name);
+    safe_strcpy(cmd->cmdline, cmdline);
+}
+
+/*
+ * boot_cmdline_find_by_kind can only be used to return Xen modules (e.g
+ * XSM, DTB) or Dom0 modules. This is not suitable for looking up guest
+ * modules.
+ */
+struct bootcmdline * __init boot_cmdline_find_by_kind(bootmodule_kind kind)
+{
+    struct bootcmdlines *cmds = &bootinfo.cmdlines;
+    struct bootcmdline *cmd;
+    int i;
+
+    for ( i = 0 ; i < cmds->nr_mods ; i++ )
+    {
+        cmd = &cmds->cmdline[i];
+        if ( cmd->kind == kind && !cmd->domU )
+            return cmd;
+    }
+    return NULL;
+}
+
+struct bootcmdline * __init boot_cmdline_find_by_name(const char *name)
+{
+    struct bootcmdlines *mods = &bootinfo.cmdlines;
+    struct bootcmdline *mod;
+    unsigned int i;
+
+    for (i = 0 ; i < mods->nr_mods ; i++ )
+    {
+        mod = &mods->cmdline[i];
+        if ( strcmp(mod->dt_name, name) == 0 )
+            return mod;
+    }
+    return NULL;
+}
+
+struct bootmodule * __init boot_module_find_by_addr_and_kind(bootmodule_kind kind,
+                                                             paddr_t start)
+{
+    struct bootmodules *mods = &bootinfo.modules;
+    struct bootmodule *mod;
+    unsigned int i;
+
+    for (i = 0 ; i < mods->nr_mods ; i++ )
+    {
+        mod = &mods->module[i];
+        if ( mod->kind == kind && mod->start == start )
+            return mod;
+    }
+    return NULL;
+}
+
+/*
+ * Return the end of the non-module region starting at s. In other
+ * words return s the start of the next modules after s.
+ *
+ * On input *end is the end of the region which should be considered
+ * and it is updated to reflect the end of the module, clipped to the
+ * end of the region if it would run over.
+ */
+static paddr_t __init next_module(paddr_t s, paddr_t *end)
+{
+    struct bootmodules *mi = &bootinfo.modules;
+    paddr_t lowest = ~(paddr_t)0;
+    int i;
+
+    for ( i = 0; i < mi->nr_mods; i++ )
+    {
+        paddr_t mod_s = mi->module[i].start;
+        paddr_t mod_e = mod_s + mi->module[i].size;
+
+        if ( !mi->module[i].size )
+            continue;
+
+        if ( mod_s < s )
+            continue;
+        if ( mod_s > lowest )
+            continue;
+        if ( mod_s > *end )
+            continue;
+        lowest = mod_s;
+        *end = min(*end, mod_e);
+    }
+    return lowest;
+}
+
+/*
+ * Populate the boot allocator.
+ * If a static heap was not provided by the admin, all the RAM but the
+ * following regions will be added:
+ *  - Modules (e.g., Xen, Kernel)
+ *  - Reserved regions
+ *  - Xenheap (CONFIG_SEPARATE_XENHEAP only)
+ * If a static heap was provided by the admin, populate the boot
+ * allocator with the corresponding regions only, but with Xenheap excluded
+ * on CONFIG_SEPARATE_XENHEAP.
+ */
+void __init populate_boot_allocator(void)
+{
+    unsigned int i;
+    const struct membanks *banks = bootinfo_get_mem();
+    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
+    paddr_t s, e;
+
+    if ( bootinfo.static_heap )
+    {
+        for ( i = 0 ; i < reserved_mem->nr_banks; i++ )
+        {
+            if ( reserved_mem->bank[i].type != MEMBANK_STATIC_HEAP )
+                continue;
+
+            s = reserved_mem->bank[i].start;
+            e = s + reserved_mem->bank[i].size;
+#ifdef CONFIG_SEPARATE_XENHEAP
+            /* Avoid the xenheap, note that the xenheap cannot across a bank */
+            if ( s <= mfn_to_maddr(directmap_mfn_start) &&
+                 e >= mfn_to_maddr(directmap_mfn_end) )
+            {
+                init_boot_pages(s, mfn_to_maddr(directmap_mfn_start));
+                init_boot_pages(mfn_to_maddr(directmap_mfn_end), e);
+            }
+            else
+#endif
+                init_boot_pages(s, e);
+        }
+
+        return;
+    }
+
+    for ( i = 0; i < banks->nr_banks; i++ )
+    {
+        const struct membank *bank = &banks->bank[i];
+        paddr_t bank_end = bank->start + bank->size;
+
+        s = bank->start;
+        while ( s < bank_end )
+        {
+            paddr_t n = bank_end;
+
+            e = next_module(s, &n);
+
+            if ( e == ~(paddr_t)0 )
+                e = n = bank_end;
+
+            /*
+             * Module in a RAM bank other than the one which we are
+             * not dealing with here.
+             */
+            if ( e > bank_end )
+                e = bank_end;
+
+#ifdef CONFIG_SEPARATE_XENHEAP
+            /* Avoid the xenheap */
+            if ( s < mfn_to_maddr(directmap_mfn_end) &&
+                 mfn_to_maddr(directmap_mfn_start) < e )
+            {
+                e = mfn_to_maddr(directmap_mfn_start);
+                n = mfn_to_maddr(directmap_mfn_end);
+            }
+#endif
+
+            fw_unreserved_regions(s, e, init_boot_pages, 0);
+            s = n;
+        }
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/device-tree/device_tree.c b/xen/common/device-tree/device_tree.c
new file mode 100644
index 0000000000..8d1017a49d
--- /dev/null
+++ b/xen/common/device-tree/device_tree.c
@@ -0,0 +1,2253 @@
+/*
+ * Device Tree
+ *
+ * Copyright (C) 2012 Citrix Systems, Inc.
+ * Copyright 2009 Benjamin Herrenschmidt, IBM Corp
+ * benh@kernel.crashing.org
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <xen/types.h>
+#include <xen/init.h>
+#include <xen/guest_access.h>
+#include <xen/device_tree.h>
+#include <xen/kernel.h>
+#include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/mm.h>
+#include <xen/stdarg.h>
+#include <xen/string.h>
+#include <xen/cpumask.h>
+#include <xen/ctype.h>
+#include <asm/setup.h>
+#include <xen/err.h>
+
+const void *device_tree_flattened;
+dt_irq_xlate_func dt_irq_xlate;
+/* Host device tree */
+struct dt_device_node *dt_host;
+/* Interrupt controller node*/
+const struct dt_device_node *dt_interrupt_controller;
+DEFINE_RWLOCK(dt_host_lock);
+
+/**
+ * struct dt_alias_prop - Alias property in 'aliases' node
+ * @link: List node to link the structure in aliases_lookup list
+ * @alias: Alias property name
+ * @np: Pointer to device_node that the alias stands for
+ * @id: Index value from end of alias name
+ * @stem: Alias string without the index
+ *
+ * The structure represents one alias property of 'aliases' node as
+ * an entry in aliases_lookup list.
+ */
+struct dt_alias_prop {
+    struct list_head link;
+    const char *alias;
+    struct dt_device_node *np;
+    int id;
+    char stem[0];
+};
+
+static LIST_HEAD(aliases_lookup);
+
+#ifdef CONFIG_DEVICE_TREE_DEBUG
+static void dt_dump_addr(const char *s, const __be32 *addr, int na)
+{
+    dt_dprintk("%s", s);
+    while ( na-- )
+        dt_dprintk(" %08x", be32_to_cpu(*(addr++)));
+    dt_dprintk("\n");
+}
+#else
+static void dt_dump_addr(const char *s, const __be32 *addr, int na) { }
+#endif
+
+#define DT_BAD_ADDR ((u64)-1)
+
+/* Max address size we deal with */
+#define DT_MAX_ADDR_CELLS 4
+#define DT_CHECK_ADDR_COUNT(na) ((na) > 0 && (na) <= DT_MAX_ADDR_CELLS)
+#define DT_CHECK_COUNTS(na, ns) (DT_CHECK_ADDR_COUNT(na) && (ns) > 0)
+
+/* Callbacks for bus specific translators */
+struct dt_bus
+{
+    const char *name;
+    const char *addresses;
+    bool (*match)(const struct dt_device_node *node);
+    void (*count_cells)(const struct dt_device_node *child,
+                        int *addrc, int *sizec);
+    u64 (*map)(__be32 *addr, const __be32 *range, int na, int ns, int pna);
+    int (*translate)(__be32 *addr, u64 offset, int na);
+    unsigned int (*get_flags)(const __be32 *addr);
+};
+
+void dt_get_range(const __be32 **cellp, const struct dt_device_node *np,
+                  u64 *address, u64 *size)
+{
+    *address = dt_next_cell(dt_n_addr_cells(np), cellp);
+    *size = dt_next_cell(dt_n_size_cells(np), cellp);
+}
+
+void dt_set_cell(__be32 **cellp, int size, u64 val)
+{
+    int cells = size;
+
+    while ( size-- )
+    {
+        (*cellp)[size] = cpu_to_fdt32(val);
+        val >>= 32;
+    }
+
+    (*cellp) += cells;
+}
+
+void dt_set_range(__be32 **cellp, const struct dt_device_node *np,
+                  u64 address, u64 size)
+{
+    dt_set_cell(cellp, dt_n_addr_cells(np), address);
+    dt_set_cell(cellp, dt_n_size_cells(np), size);
+}
+
+void dt_child_set_range(__be32 **cellp, int addrcells, int sizecells,
+                        u64 address, u64 size)
+{
+    dt_set_cell(cellp, addrcells, address);
+    dt_set_cell(cellp, sizecells, size);
+}
+
+static void __init *unflatten_dt_alloc(unsigned long *mem, unsigned long size,
+                                       unsigned long align)
+{
+    void *res;
+
+    *mem = ROUNDUP(*mem, align);
+    res = (void *)*mem;
+    *mem += size;
+
+    return res;
+}
+
+/* Find a property with a given name for a given node and return it. */
+const struct dt_property *dt_find_property(const struct dt_device_node *np,
+                                           const char *name, u32 *lenp)
+{
+    const struct dt_property *pp;
+
+    if ( !np )
+        return NULL;
+
+    for ( pp = np->properties; pp; pp = pp->next )
+    {
+        if ( dt_prop_cmp(pp->name, name) == 0 )
+        {
+            if ( lenp )
+                *lenp = pp->length;
+            break;
+        }
+    }
+
+    return pp;
+}
+
+const void *dt_get_property(const struct dt_device_node *np,
+                            const char *name, u32 *lenp)
+{
+    const struct dt_property *pp = dt_find_property(np, name, lenp);
+
+    return pp ? pp->value : NULL;
+}
+
+bool dt_property_read_u32(const struct dt_device_node *np,
+                          const char *name, u32 *out_value)
+{
+    u32 len;
+    const __be32 *val;
+
+    val = dt_get_property(np, name, &len);
+    if ( !val || len < sizeof(*out_value) )
+        return 0;
+
+    *out_value = be32_to_cpup(val);
+
+    return 1;
+}
+
+
+bool dt_property_read_u64(const struct dt_device_node *np,
+                          const char *name, u64 *out_value)
+{
+    u32 len;
+    const __be32 *val;
+
+    val = dt_get_property(np, name, &len);
+    if ( !val || len < sizeof(*out_value) )
+        return 0;
+
+    *out_value = dt_read_number(val, 2);
+
+    return 1;
+}
+int dt_property_read_string(const struct dt_device_node *np,
+                            const char *propname, const char **out_string)
+{
+    const struct dt_property *pp = dt_find_property(np, propname, NULL);
+
+    if ( !pp )
+        return -EINVAL;
+    if ( !pp->length )
+        return -ENODATA;
+    if ( strnlen(pp->value, pp->length) >= pp->length )
+        return -EILSEQ;
+
+    *out_string = pp->value;
+
+    return 0;
+}
+
+/**
+ * dt_find_property_value_of_size
+ *
+ * @np:     device node from which the property value is to be read.
+ * @propname:   name of the property to be searched.
+ * @min:    minimum allowed length of property value
+ * @max:    maximum allowed length of property value (0 means unlimited)
+ * @len:    if !=NULL, actual length is written to here
+ *
+ * Search for a property in a device node and valid the requested size.
+ *
+ * Return: The property value on success, -EINVAL if the property does not
+ * exist, -ENODATA if property does not have a value, and -EOVERFLOW if the
+ * property data is too small or too large.
+ */
+static void *dt_find_property_value_of_size(const struct dt_device_node *np,
+                                            const char *propname, u32 min,
+                                            u32 max, size_t *len)
+{
+    const struct dt_property *prop = dt_find_property(np, propname, NULL);
+
+    if ( !prop )
+        return ERR_PTR(-EINVAL);
+    if ( !prop->value )
+        return ERR_PTR(-ENODATA);
+    if ( prop->length < min )
+        return ERR_PTR(-EOVERFLOW);
+    if ( max && prop->length > max )
+        return ERR_PTR(-EOVERFLOW);
+
+    if ( len )
+        *len = prop->length;
+
+    return prop->value;
+}
+
+int dt_property_read_variable_u32_array(const struct dt_device_node *np,
+                                        const char *propname, u32 *out_values,
+                                        size_t sz_min, size_t sz_max)
+{
+    size_t sz, count;
+    const __be32 *val = dt_find_property_value_of_size(np, propname,
+                        (sz_min * sizeof(*out_values)),
+                        (sz_max * sizeof(*out_values)),
+                        &sz);
+
+    if ( IS_ERR(val) )
+        return PTR_ERR(val);
+
+    if ( !sz_max )
+        sz = sz_min;
+    else
+        sz /= sizeof(*out_values);
+
+    count = sz;
+    while ( count-- )
+        *out_values++ = be32_to_cpup(val++);
+
+    return sz;
+}
+
+int dt_property_match_string(const struct dt_device_node *np,
+                             const char *propname, const char *string)
+{
+    const struct dt_property *dtprop = dt_find_property(np, propname, NULL);
+    size_t l;
+    int i;
+    const char *p, *end;
+
+    if ( !dtprop )
+        return -EINVAL;
+    if ( !dtprop->value )
+        return -ENODATA;
+
+    p = dtprop->value;
+    end = p + dtprop->length;
+
+    for ( i = 0; p < end; i++, p += l )
+    {
+        l = strnlen(p, end - p) + 1;
+        if ( p + l > end )
+            return -EILSEQ;
+        if ( strcmp(string, p) == 0 )
+            return i; /* Found it; return index */
+    }
+    return -ENODATA;
+}
+
+bool dt_device_is_compatible(const struct dt_device_node *device,
+                             const char *compat)
+{
+    const char* cp;
+    u32 cplen, l;
+
+    cp = dt_get_property(device, "compatible", &cplen);
+    if ( cp == NULL )
+        return 0;
+    while ( cplen > 0 )
+    {
+        if ( dt_compat_cmp(cp, compat) == 0 )
+            return 1;
+        l = strlen(cp) + 1;
+        cp += l;
+        cplen -= l;
+    }
+
+    return 0;
+}
+
+bool dt_machine_is_compatible(const char *compat)
+{
+    const struct dt_device_node *root;
+    bool rc = false;
+
+    root = dt_find_node_by_path("/");
+    if ( root )
+    {
+        rc = dt_device_is_compatible(root, compat);
+    }
+    return rc;
+}
+
+struct dt_device_node *dt_find_node_by_name(struct dt_device_node *from,
+                                            const char *name)
+{
+    struct dt_device_node *np;
+    struct dt_device_node *dt;
+
+    dt = from ? from->allnext : dt_host;
+    dt_for_each_device_node(dt, np)
+        if ( np->name && (dt_node_cmp(np->name, name) == 0) )
+            break;
+
+    return np;
+}
+
+struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
+                                            const char *type)
+{
+    struct dt_device_node *np;
+    struct dt_device_node *dt;
+
+    dt = from ? from->allnext : dt_host;
+    dt_for_each_device_node(dt, np)
+        if ( np->type && (dt_node_cmp(np->type, type) == 0) )
+            break;
+
+    return np;
+}
+
+struct dt_device_node *dt_find_node_by_path_from(struct dt_device_node *from,
+                                                 const char *path)
+{
+    struct dt_device_node *np;
+
+    dt_for_each_device_node(from, np)
+        if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
+            break;
+
+    return np;
+}
+
+int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
+                          struct dt_device_node **node)
+{
+    char *path;
+
+    path = safe_copy_string_from_guest(u_path, u_plen, PAGE_SIZE);
+    if ( IS_ERR(path) )
+        return PTR_ERR(path);
+
+    *node = dt_find_node_by_path(path);
+
+    xfree(path);
+
+    return (*node == NULL) ? -ESRCH : 0;
+}
+
+struct dt_device_node *dt_find_node_by_alias(const char *alias)
+{
+    const struct dt_alias_prop *app;
+
+    list_for_each_entry( app, &aliases_lookup, link )
+    {
+        if ( !strcmp(app->alias, alias) )
+            return app->np;
+    }
+
+    return NULL;
+}
+
+const struct dt_device_match *
+dt_match_node(const struct dt_device_match *matches,
+              const struct dt_device_node *node)
+{
+    if ( !matches )
+        return NULL;
+
+    while ( matches->path || matches->type ||
+            matches->compatible || matches->not_available || matches->prop )
+    {
+        bool match = true;
+
+        if ( matches->path )
+            match &= dt_node_path_is_equal(node, matches->path);
+
+        if ( matches->type )
+            match &= dt_device_type_is_equal(node, matches->type);
+
+        if ( matches->compatible )
+            match &= dt_device_is_compatible(node, matches->compatible);
+
+        if ( matches->not_available )
+            match &= !dt_device_is_available(node);
+
+        if ( matches->prop )
+            match &= dt_find_property(node, matches->prop, NULL) != NULL;
+
+        if ( match )
+            return matches;
+        matches++;
+    }
+
+    return NULL;
+}
+
+const struct dt_device_node *dt_get_parent(const struct dt_device_node *node)
+{
+    if ( !node )
+        return NULL;
+
+    return node->parent;
+}
+
+struct dt_device_node *
+dt_find_compatible_node(struct dt_device_node *from,
+                        const char *type,
+                        const char *compatible)
+{
+    struct dt_device_node *np;
+    struct dt_device_node *dt;
+
+    dt = from ? from->allnext : dt_host;
+    dt_for_each_device_node(dt, np)
+    {
+        if ( type
+             && !(np->type && (dt_node_cmp(np->type, type) == 0)) )
+            continue;
+        if ( dt_device_is_compatible(np, compatible) )
+            break;
+    }
+
+    return np;
+}
+
+struct dt_device_node *
+dt_find_matching_node(struct dt_device_node *from,
+                      const struct dt_device_match *matches)
+{
+    struct dt_device_node *np;
+    struct dt_device_node *dt;
+
+    dt = from ? from->allnext : dt_host;
+    dt_for_each_device_node(dt, np)
+    {
+        if ( dt_match_node(matches, np) )
+            return np;
+    }
+
+    return NULL;
+}
+
+static int __dt_n_addr_cells(const struct dt_device_node *np, bool parent)
+{
+    const __be32 *ip;
+
+    do {
+        if ( np->parent && !parent )
+            np = np->parent;
+        parent = false;
+
+        ip = dt_get_property(np, "#address-cells", NULL);
+        if ( ip )
+            return be32_to_cpup(ip);
+    } while ( np->parent );
+    /* No #address-cells property for the root node */
+    return DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
+}
+
+static int __dt_n_size_cells(const struct dt_device_node *np, bool parent)
+{
+    const __be32 *ip;
+
+    do {
+        if ( np->parent && !parent )
+            np = np->parent;
+        parent = false;
+
+        ip = dt_get_property(np, "#size-cells", NULL);
+        if ( ip )
+            return be32_to_cpup(ip);
+    } while ( np->parent );
+    /* No #address-cells property for the root node */
+    return DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
+}
+
+int dt_n_addr_cells(const struct dt_device_node *np)
+{
+    return __dt_n_addr_cells(np, false);
+}
+
+int dt_n_size_cells(const struct dt_device_node *np)
+{
+    return __dt_n_size_cells(np, false);
+}
+
+int dt_child_n_addr_cells(const struct dt_device_node *parent)
+{
+    return __dt_n_addr_cells(parent, true);
+}
+
+int dt_child_n_size_cells(const struct dt_device_node *parent)
+{
+    return __dt_n_size_cells(parent, true);
+}
+
+/*
+ * These are defined in Linux where much of this code comes from, but
+ * are currently unused outside this file in the context of Xen.
+ */
+#define IORESOURCE_BITS         0x000000ff      /* Bus-specific bits */
+
+#define IORESOURCE_TYPE_BITS    0x00001f00      /* Resource type */
+#define IORESOURCE_IO           0x00000100      /* PCI/ISA I/O ports */
+#define IORESOURCE_MEM          0x00000200
+#define IORESOURCE_REG          0x00000300      /* Register offsets */
+#define IORESOURCE_IRQ          0x00000400
+#define IORESOURCE_DMA          0x00000800
+#define IORESOURCE_BUS          0x00001000
+
+#define IORESOURCE_PREFETCH     0x00002000      /* No side effects */
+#define IORESOURCE_READONLY     0x00004000
+#define IORESOURCE_CACHEABLE    0x00008000
+#define IORESOURCE_RANGELENGTH  0x00010000
+#define IORESOURCE_SHADOWABLE   0x00020000
+
+/*
+ * Default translator (generic bus)
+ */
+static bool dt_bus_default_match(const struct dt_device_node *node)
+{
+    /* Root node doesn't have "ranges" property */
+    if ( node->parent == NULL )
+        return 1;
+
+    /* The default bus is only used when the "ranges" property exists.
+     * Otherwise we can't translate the address
+     */
+    return (dt_get_property(node, "ranges", NULL) != NULL);
+}
+
+static void dt_bus_default_count_cells(const struct dt_device_node *dev,
+                                int *addrc, int *sizec)
+{
+    if ( addrc )
+        *addrc = dt_n_addr_cells(dev);
+    if ( sizec )
+        *sizec = dt_n_size_cells(dev);
+}
+
+static u64 dt_bus_default_map(__be32 *addr, const __be32 *range,
+                              int na, int ns, int pna)
+{
+    u64 cp, s, da;
+
+    cp = dt_read_number(range, na);
+    s = dt_read_number(range + na + pna, ns);
+    da = dt_read_number(addr, na);
+
+    dt_dprintk("DT: default map, cp=%llx, s=%llx, da=%llx\n",
+               (unsigned long long)cp, (unsigned long long)s,
+               (unsigned long long)da);
+
+    /*
+     * If the number of address cells is larger than 2 we assume the
+     * mapping doesn't specify a physical address. Rather, the address
+     * specifies an identifier that must match exactly.
+     */
+    if ( na > 2 && memcmp(range, addr, na * 4) != 0 )
+        return DT_BAD_ADDR;
+
+    if ( da < cp || da >= (cp + s) )
+        return DT_BAD_ADDR;
+    return da - cp;
+}
+
+static int dt_bus_default_translate(__be32 *addr, u64 offset, int na)
+{
+    u64 a = dt_read_number(addr, na);
+
+    memset(addr, 0, na * 4);
+    a += offset;
+    if ( na > 1 )
+        addr[na - 2] = cpu_to_be32(a >> 32);
+    addr[na - 1] = cpu_to_be32(a & 0xffffffffu);
+
+    return 0;
+}
+static unsigned int dt_bus_default_get_flags(const __be32 *addr)
+{
+    return IORESOURCE_MEM;
+}
+
+/*
+ * PCI bus specific translator
+ */
+
+static bool dt_node_is_pci(const struct dt_device_node *np)
+{
+    bool is_pci = !strcmp(np->name, "pcie") || !strcmp(np->name, "pci");
+
+    if ( is_pci )
+        printk(XENLOG_WARNING "%s: Missing device_type\n", np->full_name);
+
+    return is_pci;
+}
+
+static bool dt_bus_pci_match(const struct dt_device_node *np)
+{
+    /*
+     * "pciex" is PCI Express "vci" is for the /chaos bridge on 1st-gen PCI
+     * powermacs "ht" is hypertransport
+     *
+     * If none of the device_type match, and that the node name is
+     * "pcie" or "pci", accept the device as PCI (with a warning).
+     */
+    return !strcmp(np->type, "pci") || !strcmp(np->type, "pciex") ||
+        !strcmp(np->type, "vci") || !strcmp(np->type, "ht") ||
+        dt_node_is_pci(np);
+}
+
+static void dt_bus_pci_count_cells(const struct dt_device_node *np,
+				   int *addrc, int *sizec)
+{
+    if (addrc)
+        *addrc = 3;
+    if (sizec)
+        *sizec = 2;
+}
+
+static unsigned int dt_bus_pci_get_flags(const __be32 *addr)
+{
+    unsigned int flags = 0;
+    u32 w = be32_to_cpup(addr);
+
+    switch((w >> 24) & 0x03) {
+    case 0x01:
+        flags |= IORESOURCE_IO;
+        break;
+    case 0x02: /* 32 bits */
+    case 0x03: /* 64 bits */
+        flags |= IORESOURCE_MEM;
+        break;
+    }
+    if (w & 0x40000000)
+        flags |= IORESOURCE_PREFETCH;
+    return flags;
+}
+
+static u64 dt_bus_pci_map(__be32 *addr, const __be32 *range, int na, int ns,
+		int pna)
+{
+    u64 cp, s, da;
+    unsigned int af, rf;
+
+    af = dt_bus_pci_get_flags(addr);
+    rf = dt_bus_pci_get_flags(range);
+
+    /* Check address type match */
+    if ((af ^ rf) & (IORESOURCE_MEM | IORESOURCE_IO))
+        return DT_BAD_ADDR;
+
+    /* Read address values, skipping high cell */
+    cp = dt_read_number(range + 1, na - 1);
+    s  = dt_read_number(range + na + pna, ns);
+    da = dt_read_number(addr + 1, na - 1);
+
+    dt_dprintk("DT: PCI map, cp=%llx, s=%llx, da=%llx\n",
+               (unsigned long long)cp, (unsigned long long)s,
+               (unsigned long long)da);
+
+    if (da < cp || da >= (cp + s))
+        return DT_BAD_ADDR;
+    return da - cp;
+}
+
+static int dt_bus_pci_translate(__be32 *addr, u64 offset, int na)
+{
+    return dt_bus_default_translate(addr + 1, offset, na - 1);
+}
+
+/*
+ * Array of bus specific translators
+ */
+static const struct dt_bus dt_busses[] =
+{
+    /* PCI */
+    {
+        .name = "pci",
+        .addresses = "assigned-addresses",
+        .match = dt_bus_pci_match,
+        .count_cells = dt_bus_pci_count_cells,
+        .map = dt_bus_pci_map,
+        .translate = dt_bus_pci_translate,
+        .get_flags = dt_bus_pci_get_flags,
+    },
+    /* Default */
+    {
+        .name = "default",
+        .addresses = "reg",
+        .match = dt_bus_default_match,
+        .count_cells = dt_bus_default_count_cells,
+        .map = dt_bus_default_map,
+        .translate = dt_bus_default_translate,
+        .get_flags = dt_bus_default_get_flags,
+    },
+};
+
+static const struct dt_bus *dt_match_bus(const struct dt_device_node *np)
+{
+    int i;
+
+    for ( i = 0; i < ARRAY_SIZE(dt_busses); i++ )
+        if ( !dt_busses[i].match || dt_busses[i].match(np) )
+            return &dt_busses[i];
+
+    return NULL;
+}
+
+static const __be32 *dt_get_address(const struct dt_device_node *dev,
+                                    unsigned int index, u64 *size,
+                                    unsigned int *flags)
+{
+    const __be32 *prop;
+    u32 psize;
+    const struct dt_device_node *parent;
+    const struct dt_bus *bus;
+    int onesize, i, na, ns;
+
+    /* Get parent & match bus type */
+    parent = dt_get_parent(dev);
+    if ( parent == NULL )
+        return NULL;
+
+    bus = dt_match_bus(parent);
+    if ( !bus )
+        return NULL;
+    bus->count_cells(dev, &na, &ns);
+
+    if ( !DT_CHECK_ADDR_COUNT(na) )
+        return NULL;
+
+    /* Get "reg" or "assigned-addresses" property */
+    prop = dt_get_property(dev, bus->addresses, &psize);
+    if ( prop == NULL )
+        return NULL;
+    psize /= 4;
+
+    onesize = na + ns;
+    for ( i = 0; psize >= onesize; psize -= onesize, prop += onesize, i++ )
+    {
+        if ( i == index )
+        {
+            if ( size )
+                *size = dt_read_number(prop + na, ns);
+            if ( flags )
+                *flags = bus->get_flags(prop);
+            return prop;
+        }
+    }
+    return NULL;
+}
+
+static int dt_translate_one(const struct dt_device_node *parent,
+                            const struct dt_bus *bus,
+                            const struct dt_bus *pbus,
+                            __be32 *addr, int na, int ns,
+                            int pna, const char *rprop)
+{
+    const __be32 *ranges;
+    unsigned int rlen;
+    int rone;
+    u64 offset = DT_BAD_ADDR;
+
+    ranges = dt_get_property(parent, rprop, &rlen);
+    if ( ranges == NULL )
+    {
+        printk(XENLOG_ERR "DT: no ranges; cannot translate\n");
+        return 1;
+    }
+    if ( rlen == 0 )
+    {
+        offset = dt_read_number(addr, na);
+        memset(addr, 0, pna * 4);
+        dt_dprintk("DT: empty ranges; 1:1 translation\n");
+        goto finish;
+    }
+
+    dt_dprintk("DT: walking ranges...\n");
+
+    /* Now walk through the ranges */
+    rlen /= 4;
+    rone = na + pna + ns;
+    for ( ; rlen >= rone; rlen -= rone, ranges += rone )
+    {
+        offset = bus->map(addr, ranges, na, ns, pna);
+        if ( offset != DT_BAD_ADDR )
+            break;
+    }
+    if ( offset == DT_BAD_ADDR )
+    {
+        dt_dprintk("DT: not found !\n");
+        return 1;
+    }
+    memcpy(addr, ranges + na, 4 * pna);
+
+finish:
+    dt_dump_addr("DT: parent translation for:", addr, pna);
+    dt_dprintk("DT: with offset: %llx\n", (unsigned long long)offset);
+
+    /* Translate it into parent bus space */
+    return pbus->translate(addr, offset, pna);
+}
+
+/*
+ * Translate an address from the device-tree into a CPU physical address,
+ * this walks up the tree and applies the various bus mappings on the
+ * way.
+ *
+ * Note: We consider that crossing any level with #size-cells == 0 to mean
+ * that translation is impossible (that is we are not dealing with a value
+ * that can be mapped to a cpu physical address). This is not really specified
+ * that way, but this is traditionally the way IBM at least do things
+ */
+static u64 __dt_translate_address(const struct dt_device_node *dev,
+                                  const __be32 *in_addr, const char *rprop)
+{
+    const struct dt_device_node *parent = NULL;
+    const struct dt_bus *bus, *pbus;
+    __be32 addr[DT_MAX_ADDR_CELLS];
+    int na, ns, pna, pns;
+    u64 result = DT_BAD_ADDR;
+
+    dt_dprintk("DT: ** translation for device %s **\n", dev->full_name);
+
+    /* Get parent & match bus type */
+    parent = dt_get_parent(dev);
+    if ( parent == NULL )
+        goto bail;
+    bus = dt_match_bus(parent);
+    if ( !bus )
+        goto bail;
+
+    /* Count address cells & copy address locally */
+    bus->count_cells(dev, &na, &ns);
+    if ( !DT_CHECK_COUNTS(na, ns) )
+    {
+        printk(XENLOG_ERR "dt_parse: Bad cell count for device %s\n",
+                  dev->full_name);
+        goto bail;
+    }
+    memcpy(addr, in_addr, na * 4);
+
+    dt_dprintk("DT: bus is %s (na=%d, ns=%d) on %s\n",
+               bus->name, na, ns, parent->full_name);
+    dt_dump_addr("DT: translating address:", addr, na);
+
+    /* Translate */
+    for ( ;; )
+    {
+        /* Switch to parent bus */
+        dev = parent;
+        parent = dt_get_parent(dev);
+
+        /* If root, we have finished */
+        if ( parent == NULL )
+        {
+            dt_dprintk("DT: reached root node\n");
+            result = dt_read_number(addr, na);
+            break;
+        }
+
+        /* Get new parent bus and counts */
+        pbus = dt_match_bus(parent);
+        if ( pbus == NULL )
+        {
+            printk("DT: %s is not a valid bus\n", parent->full_name);
+            break;
+        }
+        pbus->count_cells(dev, &pna, &pns);
+        if ( !DT_CHECK_COUNTS(pna, pns) )
+        {
+            printk(XENLOG_ERR "dt_parse: Bad cell count for parent %s\n",
+                   dev->full_name);
+            break;
+        }
+
+        dt_dprintk("DT: parent bus is %s (na=%d, ns=%d) on %s\n",
+                   pbus->name, pna, pns, parent->full_name);
+
+        /* Apply bus translation */
+        if ( dt_translate_one(dev, bus, pbus, addr, na, ns, pna, rprop) )
+            break;
+
+        /* Complete the move up one level */
+        na = pna;
+        ns = pns;
+        bus = pbus;
+
+        dt_dump_addr("DT: one level translation:", addr, na);
+    }
+
+bail:
+    return result;
+}
+
+/* dt_device_address - Translate device tree address and return it */
+int dt_device_get_address(const struct dt_device_node *dev, unsigned int index,
+                          u64 *addr, u64 *size)
+{
+    const __be32 *addrp;
+    unsigned int flags;
+
+    addrp = dt_get_address(dev, index, size, &flags);
+    if ( addrp == NULL )
+        return -EINVAL;
+
+    if ( !addr )
+        return -EINVAL;
+
+    *addr = __dt_translate_address(dev, addrp, "ranges");
+
+    if ( *addr == DT_BAD_ADDR )
+        return -EINVAL;
+
+    return 0;
+}
+
+int dt_device_get_paddr(const struct dt_device_node *dev, unsigned int index,
+                        paddr_t *addr, paddr_t *size)
+{
+    uint64_t dt_addr, dt_size;
+    int ret;
+
+    ret = dt_device_get_address(dev, index, &dt_addr, &dt_size);
+    if ( ret )
+        return ret;
+
+    if ( !addr )
+        return -EINVAL;
+
+    if ( dt_addr != (paddr_t)dt_addr )
+    {
+        printk("Error: Physical address 0x%"PRIx64" for node=%s is greater than max width (%zu bytes) supported\n",
+               dt_addr, dev->name, sizeof(paddr_t));
+        return -ERANGE;
+    }
+
+    *addr = dt_addr;
+
+    if ( size )
+    {
+        if ( dt_size != (paddr_t)dt_size )
+        {
+            printk("Error: Physical size 0x%"PRIx64" for node=%s is greater than max width (%zu bytes) supported\n",
+                   dt_size, dev->name, sizeof(paddr_t));
+            return -ERANGE;
+        }
+
+        *size = dt_size;
+    }
+
+    return ret;
+}
+
+int dt_for_each_range(const struct dt_device_node *dev,
+                      int (*cb)(const struct dt_device_node *dev,
+                                uint64_t addr, uint64_t length,
+                                void *data),
+                      void *data)
+{
+    const struct dt_device_node *parent = NULL;
+    const struct dt_bus *bus, *pbus;
+    const __be32 *ranges;
+    __be32 addr[DT_MAX_ADDR_CELLS];
+    unsigned int rlen;
+    int na, ns, pna, pns, rone;
+
+    bus = dt_match_bus(dev);
+    if ( !bus )
+        return 0; /* device is not a bus */
+
+    parent = dt_get_parent(dev);
+    if ( parent == NULL )
+        return -EINVAL;
+
+    ranges = dt_get_property(dev, "ranges", &rlen);
+    if ( ranges == NULL )
+    {
+        printk(XENLOG_ERR "DT: no ranges; cannot enumerate %s\n",
+               dev->full_name);
+        return -EINVAL;
+    }
+    if ( rlen == 0 ) /* Nothing to do */
+        return 0;
+
+    bus->count_cells(dev, &na, &ns);
+    if ( !DT_CHECK_COUNTS(na, ns) )
+    {
+        printk(XENLOG_ERR "dt_parse: Bad cell count for device %s\n",
+                  dev->full_name);
+        return -EINVAL;
+    }
+
+    pbus = dt_match_bus(parent);
+    if ( pbus == NULL )
+    {
+        printk("DT: %s is not a valid bus\n", parent->full_name);
+        return -EINVAL;
+    }
+
+    pbus->count_cells(dev, &pna, &pns);
+    if ( !DT_CHECK_COUNTS(pna, pns) )
+    {
+        printk(XENLOG_ERR "dt_parse: Bad cell count for parent %s\n",
+               dev->full_name);
+        return -EINVAL;
+    }
+
+    /* Now walk through the ranges */
+    rlen /= 4;
+    rone = na + pna + ns;
+
+    dt_dprintk("%s: dev=%s, bus=%s, parent=%s, rlen=%d, rone=%d\n",
+               __func__,
+               dt_node_name(dev), bus->name,
+               dt_node_name(parent), rlen, rone);
+
+    for ( ; rlen >= rone; rlen -= rone, ranges += rone )
+    {
+        uint64_t a, s;
+        int ret;
+
+        memcpy(addr, ranges + na, 4 * pna);
+
+        a = __dt_translate_address(dev, addr, "ranges");
+        s = dt_read_number(ranges + na + pna, ns);
+
+        ret = cb(dev, a, s, data);
+        if ( ret )
+        {
+            dt_dprintk(" -> callback failed=%d\n", ret);
+            return ret;
+        }
+
+    }
+
+    return 0;
+}
+
+/**
+ * dt_find_node_by_phandle - Find a node given a phandle
+ * @handle: phandle of the node to find
+ *
+ * Returns a node pointer.
+ */
+struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle)
+{
+    struct dt_device_node *np;
+
+    dt_for_each_device_node(dt_host, np)
+        if ( np->phandle == handle )
+            break;
+
+    return np;
+}
+
+/**
+ * dt_irq_find_parent - Given a device node, find its interrupt parent node
+ * @child: pointer to device node
+ *
+ * Returns a pointer to the interrupt parent node, or NULL if the interrupt
+ * parent could not be determined.
+ */
+static const struct dt_device_node *
+dt_irq_find_parent(const struct dt_device_node *child)
+{
+    const struct dt_device_node *p;
+    const __be32 *parp;
+
+    do
+    {
+        parp = dt_get_property(child, "interrupt-parent", NULL);
+        if ( parp == NULL )
+            p = dt_get_parent(child);
+        else
+            p = dt_find_node_by_phandle(be32_to_cpup(parp));
+        child = p;
+    } while ( p && dt_get_property(p, "#interrupt-cells", NULL) == NULL );
+
+    return p;
+}
+
+unsigned int dt_number_of_irq(const struct dt_device_node *device)
+{
+    const struct dt_device_node *p;
+    const __be32 *intspec, *tmp;
+    u32 intsize, intlen;
+    int intnum;
+
+    dt_dprintk("dt_irq_number: dev=%s\n", device->full_name);
+
+    /* Try the new-style interrupts-extended first */
+    intnum = dt_count_phandle_with_args(device, "interrupts-extended",
+                                        "#interrupt-cells");
+    if ( intnum >= 0 )
+    {
+        dt_dprintk(" using 'interrupts-extended' property\n");
+        dt_dprintk(" intnum=%d\n", intnum);
+        return intnum;
+    }
+
+    /* Get the interrupts property */
+    intspec = dt_get_property(device, "interrupts", &intlen);
+    if ( intspec == NULL )
+        return 0;
+    intlen /= sizeof(*intspec);
+
+    dt_dprintk(" using 'interrupts' property\n");
+    dt_dprintk(" intspec=%d intlen=%d\n", be32_to_cpup(intspec), intlen);
+
+    /* Look for the interrupt parent. */
+    p = dt_irq_find_parent(device);
+    if ( p == NULL )
+        return 0;
+
+    /* Get size of interrupt specifier */
+    tmp = dt_get_property(p, "#interrupt-cells", NULL);
+    if ( tmp == NULL )
+        return 0;
+    intsize = be32_to_cpu(*tmp);
+
+    dt_dprintk(" intsize=%d intlen=%d\n", intsize, intlen);
+
+    return (intlen / intsize);
+}
+
+unsigned int dt_number_of_address(const struct dt_device_node *dev)
+{
+    const __be32 *prop;
+    u32 psize;
+    const struct dt_device_node *parent;
+    const struct dt_bus *bus;
+    int onesize, na, ns;
+
+    /* Get parent & match bus type */
+    parent = dt_get_parent(dev);
+    if ( parent == NULL )
+        return 0;
+
+    bus = dt_match_bus(parent);
+    if ( !bus )
+        return 0;
+    bus->count_cells(dev, &na, &ns);
+
+    if ( !DT_CHECK_COUNTS(na, ns) )
+        return 0;
+
+    /* Get "reg" or "assigned-addresses" property */
+    prop = dt_get_property(dev, bus->addresses, &psize);
+    if ( prop == NULL )
+        return 0;
+
+    psize /= 4;
+    onesize = na + ns;
+
+    return (psize / onesize);
+}
+
+int dt_for_each_irq_map(const struct dt_device_node *dev,
+                        int (*cb)(const struct dt_device_node *dev,
+                                  const struct dt_irq *dt_irq,
+                                  void *data),
+                        void *data)
+{
+    const struct dt_device_node *ipar, *tnode, *old = NULL;
+    const __be32 *tmp, *imap;
+    u32 intsize = 1, addrsize, pintsize = 0, paddrsize = 0;
+    u32 imaplen;
+    int i, ret;
+
+    struct dt_raw_irq dt_raw_irq;
+    struct dt_irq dt_irq;
+
+    dt_dprintk("%s: par=%s cb=%p data=%p\n", __func__,
+               dev->full_name, cb, data);
+
+    ipar = dev;
+
+    /* First get the #interrupt-cells property of the current cursor
+     * that tells us how to interpret the passed-in intspec. If there
+     * is none, we are nice and just walk up the tree
+     */
+    do {
+        tmp = dt_get_property(ipar, "#interrupt-cells", NULL);
+        if ( tmp != NULL )
+        {
+            intsize = be32_to_cpu(*tmp);
+            break;
+        }
+        tnode = ipar;
+        ipar = dt_irq_find_parent(ipar);
+    } while ( ipar );
+    if ( ipar == NULL )
+    {
+        dt_dprintk(" -> no parent found !\n");
+        goto fail;
+    }
+
+    dt_dprintk("%s: ipar=%s, size=%d\n", __func__, ipar->full_name, intsize);
+
+    if ( intsize > DT_MAX_IRQ_SPEC )
+    {
+        dt_dprintk(" -> too many irq specifier cells\n");
+        goto fail;
+    }
+
+    /* Look for this #address-cells. We have to implement the old linux
+     * trick of looking for the parent here as some device-trees rely on it
+     */
+    old = ipar;
+    do {
+        tmp = dt_get_property(old, "#address-cells", NULL);
+        tnode = dt_get_parent(old);
+        old = tnode;
+    } while ( old && tmp == NULL );
+
+    old = NULL;
+    addrsize = (tmp == NULL) ? 2 : be32_to_cpu(*tmp);
+
+    dt_dprintk(" -> addrsize=%d\n", addrsize);
+
+    /* Now look for an interrupt-map */
+    imap = dt_get_property(dev, "interrupt-map", &imaplen);
+    /* No interrupt-map found. Ignore */
+    if ( imap == NULL )
+    {
+        dt_dprintk(" -> no map, ignoring\n");
+        return 0;
+    }
+    imaplen /= sizeof(u32);
+
+    /* Parse interrupt-map */
+    while ( imaplen > (addrsize + intsize + 1) )
+    {
+        /* skip child unit address and child interrupt specifier */
+        imap += addrsize + intsize;
+        imaplen -= addrsize + intsize;
+
+        /* Get the interrupt parent */
+        ipar = dt_find_node_by_phandle(be32_to_cpup(imap));
+        imap++;
+        --imaplen;
+
+        /* Check if not found */
+        if ( ipar == NULL )
+        {
+            dt_dprintk(" -> imap parent not found !\n");
+            goto fail;
+        }
+
+        dt_dprintk(" -> ipar %s\n", dt_node_name(ipar));
+
+        /* Get #interrupt-cells and #address-cells of new
+         * parent
+         */
+        tmp = dt_get_property(ipar, "#interrupt-cells", NULL);
+        if ( tmp == NULL )
+        {
+            dt_dprintk(" -> parent lacks #interrupt-cells!\n");
+            goto fail;
+        }
+        pintsize = be32_to_cpu(*tmp);
+        tmp = dt_get_property(ipar, "#address-cells", NULL);
+        paddrsize = (tmp == NULL) ? 0 : be32_to_cpu(*tmp);
+
+        dt_dprintk(" -> pintsize=%d, paddrsize=%d\n",
+                   pintsize, paddrsize);
+
+        if ( pintsize > DT_MAX_IRQ_SPEC )
+        {
+            dt_dprintk(" -> too many irq specifier cells in parent\n");
+            goto fail;
+        }
+
+        /* Check for malformed properties */
+        if ( imaplen < (paddrsize + pintsize) )
+            goto fail;
+
+        imap += paddrsize;
+        imaplen -= paddrsize;
+
+        dt_raw_irq.controller = ipar;
+        dt_raw_irq.size = pintsize;
+        for ( i = 0; i < pintsize; i++ )
+            dt_raw_irq.specifier[i] = dt_read_number(imap + i, 1);
+
+        if ( dt_raw_irq.controller != dt_interrupt_controller )
+        {
+            /*
+             * We don't map IRQs connected to secondary IRQ controllers as
+             * these IRQs have no meaning to us until they connect to the
+             * primary controller.
+             *
+             * Secondary IRQ controllers will at some point connect to
+             * the primary controller (possibly via other IRQ controllers).
+             * We map the IRQs at that last connection point.
+             */
+            imap += pintsize;
+            imaplen -= pintsize;
+            dt_dprintk(" -> Skipped IRQ for secondary IRQ controller\n");
+            continue;
+        }
+
+        ret = dt_irq_translate(&dt_raw_irq, &dt_irq);
+        if ( ret )
+        {
+            dt_dprintk(" -> failed to translate IRQ: %d\n", ret);
+            return ret;
+        }
+
+        ret = cb(dev, &dt_irq, data);
+        if ( ret )
+        {
+            dt_dprintk(" -> callback failed=%d\n", ret);
+            return ret;
+        }
+
+        imap += pintsize;
+        imaplen -= pintsize;
+
+        dt_dprintk(" -> imaplen=%d\n", imaplen);
+    }
+
+    return 0;
+
+fail:
+    return -EINVAL;
+}
+
+/**
+ * dt_irq_map_raw - Low level interrupt tree parsing
+ * @parent:     the device interrupt parent
+ * @intspec:    interrupt specifier ("interrupts" property of the device)
+ * @ointsize:   size of the passed in interrupt specifier
+ * @addr:       address specifier (start of "reg" property of the device)
+ * @oirq:       structure dt_raw_irq filled by this function
+ *
+ * Returns 0 on success and a negative number on error
+ *
+ * This function is a low-level interrupt tree walking function. It
+ * can be used to do a partial walk with synthesized reg and interrupts
+ * properties, for example when resolving PCI interrupts when no device
+ * node exist for the parent.
+ */
+static int dt_irq_map_raw(const struct dt_device_node *parent,
+                          const __be32 *intspec, u32 ointsize,
+                          const __be32 *addr,
+                          struct dt_raw_irq *oirq)
+{
+    const struct dt_device_node *ipar, *tnode, *old = NULL, *newpar = NULL;
+    const __be32 *tmp, *imap, *imask;
+    u32 intsize = 1, addrsize, newintsize = 0, newaddrsize = 0;
+    u32 imaplen;
+    int match, i;
+
+    dt_dprintk("dt_irq_map_raw: par=%s,intspec=[0x%08x 0x%08x...],ointsize=%d\n",
+               parent->full_name, be32_to_cpup(intspec),
+               be32_to_cpup(intspec + 1), ointsize);
+
+    ipar = parent;
+
+    /* First get the #interrupt-cells property of the current cursor
+     * that tells us how to interpret the passed-in intspec. If there
+     * is none, we are nice and just walk up the tree
+     */
+    do {
+        tmp = dt_get_property(ipar, "#interrupt-cells", NULL);
+        if ( tmp != NULL )
+        {
+            intsize = be32_to_cpu(*tmp);
+            break;
+        }
+        tnode = ipar;
+        ipar = dt_irq_find_parent(ipar);
+    } while ( ipar );
+    if ( ipar == NULL )
+    {
+        dt_dprintk(" -> no parent found !\n");
+        goto fail;
+    }
+
+    dt_dprintk("dt_irq_map_raw: ipar=%s, size=%d\n", ipar->full_name, intsize);
+
+    if ( ointsize != intsize )
+        return -EINVAL;
+
+    /* Look for this #address-cells. We have to implement the old linux
+     * trick of looking for the parent here as some device-trees rely on it
+     */
+    old = ipar;
+    do {
+        tmp = dt_get_property(old, "#address-cells", NULL);
+        tnode = dt_get_parent(old);
+        old = tnode;
+    } while ( old && tmp == NULL );
+
+    old = NULL;
+    addrsize = (tmp == NULL) ? 2 : be32_to_cpu(*tmp);
+
+    dt_dprintk(" -> addrsize=%d\n", addrsize);
+
+    /* Now start the actual "proper" walk of the interrupt tree */
+    while ( ipar != NULL )
+    {
+        /* Now check if cursor is an interrupt-controller and if it is
+         * then we are done
+         */
+        if ( dt_get_property(ipar, "interrupt-controller", NULL) != NULL )
+        {
+            dt_dprintk(" -> got it !\n");
+            if ( intsize > DT_MAX_IRQ_SPEC )
+            {
+                dt_dprintk(" -> intsize(%u) greater than DT_MAX_IRQ_SPEC(%u)\n",
+                           intsize, DT_MAX_IRQ_SPEC);
+                goto fail;
+            }
+            for ( i = 0; i < intsize; i++ )
+                oirq->specifier[i] = dt_read_number(intspec + i, 1);
+            oirq->size = intsize;
+            oirq->controller = ipar;
+            return 0;
+        }
+
+        /* Now look for an interrupt-map */
+        imap = dt_get_property(ipar, "interrupt-map", &imaplen);
+        /* No interrupt map, check for an interrupt parent */
+        if ( imap == NULL )
+        {
+            dt_dprintk(" -> no map, getting parent\n");
+            newpar = dt_irq_find_parent(ipar);
+            goto skiplevel;
+        }
+        imaplen /= sizeof(u32);
+
+        /* Look for a mask */
+        imask = dt_get_property(ipar, "interrupt-map-mask", NULL);
+
+        /* If we were passed no "reg" property and we attempt to parse
+         * an interrupt-map, then #address-cells must be 0.
+         * Fail if it's not.
+         */
+        if ( addr == NULL && addrsize != 0 )
+        {
+            dt_dprintk(" -> no reg passed in when needed !\n");
+            goto fail;
+        }
+
+        /* Parse interrupt-map */
+        match = 0;
+        while ( imaplen > (addrsize + intsize + 1) && !match )
+        {
+            /* Compare specifiers */
+            match = 1;
+            for ( i = 0; i < addrsize && match; ++i )
+            {
+                __be32 mask = imask ? imask[i] : cpu_to_be32(0xffffffffu);
+                match = ((addr[i] ^ imap[i]) & mask) == 0;
+            }
+            for ( ; i < (addrsize + intsize) && match; ++i )
+            {
+                __be32 mask = imask ? imask[i] : cpu_to_be32(0xffffffffu);
+                match = ((intspec[i-addrsize] ^ imap[i]) & mask) == 0;
+            }
+            imap += addrsize + intsize;
+            imaplen -= addrsize + intsize;
+
+            dt_dprintk(" -> match=%d (imaplen=%d)\n", match, imaplen);
+
+            /* Get the interrupt parent */
+            newpar = dt_find_node_by_phandle(be32_to_cpup(imap));
+            imap++;
+            --imaplen;
+
+            /* Check if not found */
+            if ( newpar == NULL )
+            {
+                dt_dprintk(" -> imap parent not found !\n");
+                goto fail;
+            }
+
+            /* Get #interrupt-cells and #address-cells of new
+             * parent
+             */
+            tmp = dt_get_property(newpar, "#interrupt-cells", NULL);
+            if ( tmp == NULL )
+            {
+                dt_dprintk(" -> parent lacks #interrupt-cells!\n");
+                goto fail;
+            }
+            newintsize = be32_to_cpu(*tmp);
+            tmp = dt_get_property(newpar, "#address-cells", NULL);
+            newaddrsize = (tmp == NULL) ? 0 : be32_to_cpu(*tmp);
+
+            dt_dprintk(" -> newintsize=%d, newaddrsize=%d\n",
+                       newintsize, newaddrsize);
+
+            /* Check for malformed properties */
+            if ( imaplen < (newaddrsize + newintsize) )
+                goto fail;
+
+            imap += newaddrsize + newintsize;
+            imaplen -= newaddrsize + newintsize;
+
+            dt_dprintk(" -> imaplen=%d\n", imaplen);
+        }
+        if ( !match )
+            goto fail;
+
+        old = newpar;
+        addrsize = newaddrsize;
+        intsize = newintsize;
+        intspec = imap - intsize;
+        addr = intspec - addrsize;
+
+    skiplevel:
+        /* Iterate again with new parent */
+        dt_dprintk(" -> new parent: %s\n", dt_node_full_name(newpar));
+        ipar = newpar;
+        newpar = NULL;
+    }
+fail:
+    return -EINVAL;
+}
+
+int dt_device_get_raw_irq(const struct dt_device_node *device,
+                          unsigned int index,
+                          struct dt_raw_irq *out_irq)
+{
+    const struct dt_device_node *p;
+    const __be32 *intspec, *tmp, *addr;
+    u32 intsize, intlen;
+    int res = -EINVAL;
+    struct dt_phandle_args args;
+    int i;
+
+    dt_dprintk("dt_device_get_raw_irq: dev=%s, index=%u\n",
+               device->full_name, index);
+
+    /* Get the reg property (if any) */
+    addr = dt_get_property(device, "reg", NULL);
+
+    /* Try the new-style interrupts-extended first */
+    res = dt_parse_phandle_with_args(device, "interrupts-extended",
+                                     "#interrupt-cells", index, &args);
+    if ( !res )
+    {
+        dt_dprintk(" using 'interrupts-extended' property\n");
+        dt_dprintk(" intspec=%d intsize=%d\n", args.args[0], args.args_count);
+
+        for ( i = 0; i < args.args_count; i++ )
+            args.args[i] = cpu_to_be32(args.args[i]);
+
+        return dt_irq_map_raw(args.np, args.args, args.args_count,
+                              addr, out_irq);
+    }
+
+    /* Get the interrupts property */
+    intspec = dt_get_property(device, "interrupts", &intlen);
+    if ( intspec == NULL )
+        return -EINVAL;
+    intlen /= sizeof(*intspec);
+
+    dt_dprintk(" using 'interrupts' property\n");
+    dt_dprintk(" intspec=%d intlen=%d\n", be32_to_cpup(intspec), intlen);
+
+    /* Look for the interrupt parent. */
+    p = dt_irq_find_parent(device);
+    if ( p == NULL )
+        return -EINVAL;
+
+    /* Get size of interrupt specifier */
+    tmp = dt_get_property(p, "#interrupt-cells", NULL);
+    if ( tmp == NULL )
+        goto out;
+    intsize = be32_to_cpu(*tmp);
+
+    dt_dprintk(" intsize=%d intlen=%d\n", intsize, intlen);
+
+    /* Check index */
+    if ( (index + 1) * intsize > intlen )
+        goto out;
+
+    /* Get new specifier and map it */
+    res = dt_irq_map_raw(p, intspec + index * intsize, intsize,
+                         addr, out_irq);
+    if ( res )
+        goto out;
+out:
+    return res;
+}
+
+int dt_irq_translate(const struct dt_raw_irq *raw,
+                     struct dt_irq *out_irq)
+{
+    ASSERT(dt_irq_xlate != NULL);
+    ASSERT(dt_interrupt_controller != NULL);
+
+    /*
+     * TODO: Retrieve the right irq_xlate. This is only works for the primary
+     * interrupt controller.
+     */
+    if ( raw->controller != dt_interrupt_controller )
+        return -EINVAL;
+
+    return dt_irq_xlate(raw->specifier, raw->size,
+                        &out_irq->irq, &out_irq->type);
+}
+
+int dt_device_get_irq(const struct dt_device_node *device, unsigned int index,
+                      struct dt_irq *out_irq)
+{
+    struct dt_raw_irq raw;
+    int res;
+
+    res = dt_device_get_raw_irq(device, index, &raw);
+
+    if ( res )
+        return res;
+
+    return dt_irq_translate(&raw, out_irq);
+}
+
+bool dt_device_is_available(const struct dt_device_node *device)
+{
+    const char *status;
+    u32 statlen;
+
+    status = dt_get_property(device, "status", &statlen);
+    if ( status == NULL )
+        return 1;
+
+    if ( statlen > 0 )
+    {
+        if ( !strcmp(status, "okay") || !strcmp(status, "ok") )
+            return 1;
+    }
+
+    return 0;
+}
+
+bool dt_device_for_passthrough(const struct dt_device_node *device)
+{
+    return (dt_find_property(device, "xen,passthrough", NULL) != NULL);
+
+}
+
+static int __dt_parse_phandle_with_args(const struct dt_device_node *np,
+                                        const char *list_name,
+                                        const char *cells_name,
+                                        int cell_count, int index,
+                                        struct dt_phandle_args *out_args)
+{
+    const __be32 *list, *list_end;
+    int rc = 0, cur_index = 0;
+    u32 size, count = 0;
+    struct dt_device_node *node = NULL;
+    dt_phandle phandle;
+
+    /* Retrieve the phandle list property */
+    list = dt_get_property(np, list_name, &size);
+    if ( !list )
+        return -ENOENT;
+    list_end = list + size / sizeof(*list);
+
+    /* Loop over the phandles until all the requested entry is found */
+    while ( list < list_end )
+    {
+        rc = -EINVAL;
+        count = 0;
+
+        /*
+         * If phandle is 0, then it is an empty entry with no
+         * arguments.  Skip forward to the next entry.
+         * */
+        phandle = be32_to_cpup(list++);
+        if ( phandle )
+        {
+            /*
+             * Find the provider node and parse the #*-cells
+             * property to determine the argument length.
+             *
+             * This is not needed if the cell count is hard-coded
+             * (i.e. cells_name not set, but cell_count is set),
+             * except when we're going to return the found node
+             * below.
+             */
+            if ( cells_name || cur_index == index )
+            {
+                node = dt_find_node_by_phandle(phandle);
+                if ( !node )
+                {
+                    printk(XENLOG_ERR "%s: could not find phandle\n",
+                           np->full_name);
+                    goto err;
+                }
+            }
+
+            if ( cells_name )
+            {
+                if ( !dt_property_read_u32(node, cells_name, &count) )
+                {
+                    printk("%s: could not get %s for %s\n",
+                           np->full_name, cells_name, node->full_name);
+                    goto err;
+                }
+            }
+            else
+                count = cell_count;
+
+            /*
+             * Make sure that the arguments actually fit in the
+             * remaining property data length
+             */
+            if ( list + count > list_end )
+            {
+                printk(XENLOG_ERR "%s: arguments longer than property\n",
+                       np->full_name);
+                goto err;
+            }
+        }
+
+        /*
+         * All of the error cases above bail out of the loop, so at
+         * this point, the parsing is successful. If the requested
+         * index matches, then fill the out_args structure and return,
+         * or return -ENOENT for an empty entry.
+         */
+        rc = -ENOENT;
+        if ( cur_index == index )
+        {
+            if (!phandle)
+                goto err;
+
+            if ( out_args )
+            {
+                int i;
+
+                WARN_ON(count > MAX_PHANDLE_ARGS);
+                if (count > MAX_PHANDLE_ARGS)
+                    count = MAX_PHANDLE_ARGS;
+                out_args->np = node;
+                out_args->args_count = count;
+                for ( i = 0; i < count; i++ )
+                    out_args->args[i] = be32_to_cpup(list++);
+            }
+
+            /* Found it! return success */
+            return 0;
+        }
+
+        node = NULL;
+        list += count;
+        cur_index++;
+    }
+
+    /*
+     * Returning result will be one of:
+     * -ENOENT : index is for empty phandle
+     * -EINVAL : parsing error on data
+     * [1..n]  : Number of phandle (count mode; when index = -1)
+     */
+    rc = index < 0 ? cur_index : -ENOENT;
+err:
+    return rc;
+}
+
+struct dt_device_node *dt_parse_phandle(const struct dt_device_node *np,
+                                        const char *phandle_name, int index)
+{
+    struct dt_phandle_args args;
+
+    if (index < 0)
+        return NULL;
+
+    if (__dt_parse_phandle_with_args(np, phandle_name, NULL, 0,
+                                     index, &args))
+        return NULL;
+
+    return args.np;
+}
+
+
+int dt_parse_phandle_with_args(const struct dt_device_node *np,
+                               const char *list_name,
+                               const char *cells_name, int index,
+                               struct dt_phandle_args *out_args)
+{
+    if ( index < 0 )
+        return -EINVAL;
+    return __dt_parse_phandle_with_args(np, list_name, cells_name, 0,
+                                        index, out_args);
+}
+
+int dt_count_phandle_with_args(const struct dt_device_node *np,
+                               const char *list_name,
+                               const char *cells_name)
+{
+    return __dt_parse_phandle_with_args(np, list_name, cells_name, 0, -1, NULL);
+}
+
+/**
+ * unflatten_dt_node - Alloc and populate a device_node from the flat tree
+ * @fdt: The parent device tree blob
+ * @mem: Memory chunk to use for allocating device nodes and properties
+ * @p: pointer to node in flat tree
+ * @dad: Parent struct device_node
+ * @allnextpp: pointer to ->allnext from last allocated device_node
+ * @fpsize: Size of the node path up at the current depth.
+ */
+static unsigned long unflatten_dt_node(const void *fdt,
+                                       unsigned long mem,
+                                       unsigned long *p,
+                                       struct dt_device_node *dad,
+                                       struct dt_device_node ***allnextpp,
+                                       unsigned long fpsize)
+{
+    struct dt_device_node *np;
+    struct dt_property *pp, **prev_pp = NULL;
+    char *pathp;
+    u32 tag;
+    unsigned int l, allocl;
+    int has_name = 0;
+    int new_format = 0;
+
+    tag = be32_to_cpup((__be32 *)(*p));
+    if ( tag != FDT_BEGIN_NODE )
+    {
+        printk(XENLOG_WARNING "Weird tag at start of node: %x\n", tag);
+        return mem;
+    }
+    *p += 4;
+    pathp = (char *)*p;
+    l = allocl = strlen(pathp) + 1;
+    *p = ROUNDUP(*p + l, 4);
+
+    /* version 0x10 has a more compact unit name here instead of the full
+     * path. we accumulate the full path size using "fpsize", we'll rebuild
+     * it later. We detect this because the first character of the name is
+     * not '/'.
+     */
+    if ( (*pathp) != '/' )
+    {
+        new_format = 1;
+        if ( fpsize == 0 )
+        {
+            /* root node: special case. fpsize accounts for path
+             * plus terminating zero. root node only has '/', so
+             * fpsize should be 2, but we want to avoid the first
+             * level nodes to have two '/' so we use fpsize 1 here
+             */
+            fpsize = 1;
+            allocl = 2;
+        }
+        else
+        {
+            /* account for '/' and path size minus terminal 0
+             * already in 'l'
+             */
+            fpsize += l;
+            allocl = fpsize;
+        }
+    }
+
+    np = unflatten_dt_alloc(&mem, sizeof(struct dt_device_node) + allocl,
+                            __alignof__(struct dt_device_node));
+    if ( allnextpp )
+    {
+        memset(np, 0, sizeof(*np));
+        np->full_name = ((char *)np) + sizeof(struct dt_device_node);
+        /* By default dom0 owns the device */
+        np->used_by = 0;
+        /* By default the device is not protected */
+        np->is_protected = false;
+        INIT_LIST_HEAD(&np->domain_list);
+
+        if ( new_format )
+        {
+            char *fn = np->full_name;
+            /* rebuild full path for new format */
+            if ( dad && dad->parent )
+            {
+                strlcpy(fn, dad->full_name, allocl);
+#ifdef DEBUG_DT
+                if ( (strlen(fn) + l + 1) != allocl )
+                {
+                    dt_dprintk("%s: p: %d, l: %d, a: %d\n",
+                               pathp, (int)strlen(fn),
+                               l, allocl);
+                }
+#endif
+                fn += strlen(fn);
+            }
+            *(fn++) = '/';
+            memcpy(fn, pathp, l);
+        }
+        else
+            memcpy(np->full_name, pathp, l);
+        prev_pp = &np->properties;
+        **allnextpp = np;
+        *allnextpp = &np->allnext;
+        if ( dad != NULL )
+        {
+            np->parent = dad;
+            /* we temporarily use the next field as `last_child'*/
+            if ( dad->next == NULL )
+                dad->child = np;
+            else
+                dad->next->sibling = np;
+            dad->next = np;
+        }
+    }
+    /* process properties */
+    while ( 1 )
+    {
+        u32 sz, noff;
+        const char *pname;
+
+        tag = be32_to_cpup((__be32 *)(*p));
+        if ( tag == FDT_NOP )
+        {
+            *p += 4;
+            continue;
+        }
+        if ( tag != FDT_PROP )
+            break;
+        *p += 4;
+        sz = be32_to_cpup((__be32 *)(*p));
+        noff = be32_to_cpup((__be32 *)((*p) + 4));
+        *p += 8;
+        if ( fdt_version(fdt) < 0x10 )
+            *p = ROUNDUP(*p, sz >= 8 ? 8 : 4);
+
+        pname = fdt_string(fdt, noff);
+        if ( pname == NULL )
+        {
+            dt_dprintk("Can't find property name in list!\n");
+            break;
+        }
+        if ( strcmp(pname, "name") == 0 )
+            has_name = 1;
+        l = strlen(pname) + 1;
+        pp = unflatten_dt_alloc(&mem, sizeof(struct dt_property),
+                                __alignof__(struct dt_property));
+        if ( allnextpp )
+        {
+            /* We accept flattened tree phandles either in
+             * ePAPR-style "phandle" properties, or the
+             * legacy "linux,phandle" properties.  If both
+             * appear and have different values, things
+             * will get weird.  Don't do that. */
+            if ( (strcmp(pname, "phandle") == 0) ||
+                 (strcmp(pname, "linux,phandle") == 0) )
+            {
+                if ( np->phandle == 0 )
+                    np->phandle = be32_to_cpup((__be32*)*p);
+            }
+            /* And we process the "ibm,phandle" property
+             * used in pSeries dynamic device tree
+             * stuff */
+            if ( strcmp(pname, "ibm,phandle") == 0 )
+                np->phandle = be32_to_cpup((__be32 *)*p);
+            pp->name = pname;
+            pp->length = sz;
+            pp->value = (void *)*p;
+            *prev_pp = pp;
+            prev_pp = &pp->next;
+        }
+        *p = ROUNDUP((*p) + sz, 4);
+    }
+    /* with version 0x10 we may not have the name property, recreate
+     * it here from the unit name if absent
+     */
+    if ( !has_name )
+    {
+        char *p1 = pathp, *ps = pathp, *pa = NULL;
+        int sz;
+
+        while ( *p1 )
+        {
+            if ( (*p1) == '@' )
+                pa = p1;
+            if ( (*p1) == '/' )
+                ps = p1 + 1;
+            p1++;
+        }
+        if ( pa < ps )
+            pa = p1;
+        sz = (pa - ps) + 1;
+        pp = unflatten_dt_alloc(&mem, sizeof(struct dt_property) + sz,
+                                __alignof__(struct dt_property));
+        if ( allnextpp )
+        {
+            pp->name = "name";
+            pp->length = sz;
+            pp->value = pp + 1;
+            /*
+             * The device tree creation code assume that the property
+             * "name" is not a fake.
+             * To avoid a big divergence with Linux code, only remove
+             * property link. In this case we will lose a bit of memory
+             */
+#if 0
+            *prev_pp = pp;
+            prev_pp = &pp->next;
+#endif
+            np->name = pp->value;
+            memcpy(pp->value, ps, sz - 1);
+            ((char *)pp->value)[sz - 1] = 0;
+            dt_dprintk("fixed up name for %s -> %s\n", pathp,
+                       (char *)pp->value);
+            /* Generic device initialization */
+            np->dev.type = DEV_DT;
+            np->dev.of_node = np;
+        }
+    }
+    if ( allnextpp )
+    {
+        *prev_pp = NULL;
+        np->name = (np->name) ? : dt_get_property(np, "name", NULL);
+        np->type = dt_get_property(np, "device_type", NULL);
+
+        if ( !np->name )
+            np->name = "<NULL>";
+        if ( !np->type )
+            np->type = "<NULL>";
+    }
+    while ( tag == FDT_BEGIN_NODE || tag == FDT_NOP )
+    {
+        if ( tag == FDT_NOP )
+            *p += 4;
+        else
+            mem = unflatten_dt_node(fdt, mem, p, np, allnextpp, fpsize);
+        tag = be32_to_cpup((__be32 *)(*p));
+    }
+    if ( tag != FDT_END_NODE )
+    {
+        printk(XENLOG_WARNING "Weird tag at end of node: %x\n", tag);
+        return mem;
+    }
+
+    *p += 4;
+    return mem;
+}
+
+int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
+{
+    unsigned long start, mem, size;
+    struct dt_device_node **allnextp = mynodes;
+
+    dt_dprintk(" -> unflatten_device_tree()\n");
+
+    dt_dprintk("Unflattening device tree:\n");
+    dt_dprintk("magic: %#08x\n", fdt_magic(fdt));
+    dt_dprintk("size: %#08x\n", fdt_totalsize(fdt));
+    dt_dprintk("version: %#08x\n", fdt_version(fdt));
+
+    /* First pass, scan for size */
+    start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
+    size = unflatten_dt_node(fdt, 0, &start, NULL, NULL, 0);
+    if ( !size )
+        return -EINVAL;
+
+    size = (size | 3) + 1;
+
+    dt_dprintk("  size is %#lx allocating...\n", size);
+
+    /* Allocate memory for the expanded device tree */
+    mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
+    if ( !mem )
+        return -ENOMEM;
+
+    ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeefU);
+
+    dt_dprintk("  unflattening %lx...\n", mem);
+
+    /* Second pass, do actual unflattening */
+    start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
+    unflatten_dt_node(fdt, mem, &start, NULL, &allnextp, 0);
+    if ( be32_to_cpup((__be32 *)start) != FDT_END )
+    {
+        printk(XENLOG_ERR "Weird tag at end of tree: %08x\n",
+                  *((u32 *)start));
+        xfree((void *)mem);
+        return -EINVAL;
+    }
+
+    if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeefU )
+    {
+        printk(XENLOG_ERR "End of tree marker overwritten: %08x\n",
+                  be32_to_cpu(((__be32 *)mem)[size / 4]));
+        xfree((void *)mem);
+        return -EINVAL;
+    }
+
+    *allnextp = NULL;
+
+    dt_dprintk(" <- unflatten_device_tree()\n");
+
+    return 0;
+}
+
+static void dt_alias_add(struct dt_alias_prop *ap,
+                         struct dt_device_node *np,
+                         int id, const char *stem, int stem_len)
+{
+    ap->np = np;
+    ap->id = id;
+    strlcpy(ap->stem, stem, stem_len + 1);
+    list_add_tail(&ap->link, &aliases_lookup);
+    dt_dprintk("adding DT alias:%s: stem=%s id=%d node=%s\n",
+               ap->alias, ap->stem, ap->id, dt_node_full_name(np));
+}
+
+/**
+ * dt_alias_scan - Scan all properties of 'aliases' node
+ *
+ * The function scans all the properties of 'aliases' node and populate
+ * the the global lookup table with the properties.  It returns the
+ * number of alias_prop found, or error code in error case.
+ */
+static void __init dt_alias_scan(void)
+{
+    const struct dt_property *pp;
+    const struct dt_device_node *aliases;
+
+    aliases = dt_find_node_by_path("/aliases");
+    if ( !aliases )
+        return;
+
+    dt_for_each_property_node( aliases, pp )
+    {
+        const char *start = pp->name;
+        const char *end = start + strlen(start);
+        struct dt_device_node *np;
+        struct dt_alias_prop *ap;
+        int id, len;
+
+        /* Skip those we do not want to proceed */
+        if ( !strcmp(pp->name, "name") ||
+             !strcmp(pp->name, "phandle") ||
+             !strcmp(pp->name, "linux,phandle") )
+            continue;
+
+        np = dt_find_node_by_path(pp->value);
+        if ( !np )
+            continue;
+
+        /* walk the alias backwards to extract the id and work out
+         * the 'stem' string */
+        while ( isdigit(*(end-1)) && end > start )
+            end--;
+        len = end - start;
+
+        id = simple_strtoll(end, NULL, 10);
+
+        /* Allocate an alias_prop with enough space for the stem */
+        ap = _xmalloc(sizeof(*ap) + len + 1, 4);
+        if ( !ap )
+            continue;
+        ap->alias = start;
+        dt_alias_add(ap, np, id, start, len);
+    }
+}
+
+struct dt_device_node * __init
+dt_find_interrupt_controller(const struct dt_device_match *matches)
+{
+    struct dt_device_node *np = NULL;
+
+    while ( (np = dt_find_matching_node(np, matches)) )
+    {
+        if ( !dt_find_property(np, "interrupt-controller", NULL) )
+            continue;
+
+        if ( dt_get_parent(np) )
+            break;
+    }
+
+    return np;
+}
+
+void __init dt_unflatten_host_device_tree(void)
+{
+    int error = unflatten_device_tree(device_tree_flattened, &dt_host);
+
+    if ( error )
+        panic("unflatten_device_tree failed with error %d\n", error);
+
+    dt_alias_scan();
+}
+
+int dt_get_pci_domain_nr(struct dt_device_node *node)
+{
+    u32 domain;
+    int error;
+
+    error = dt_property_read_u32(node, "linux,pci-domain", &domain);
+    if ( !error )
+        return -EINVAL;
+
+    return (u16)domain;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
deleted file mode 100644
index 8d1017a49d..0000000000
--- a/xen/common/device_tree.c
+++ /dev/null
@@ -1,2253 +0,0 @@
-/*
- * Device Tree
- *
- * Copyright (C) 2012 Citrix Systems, Inc.
- * Copyright 2009 Benjamin Herrenschmidt, IBM Corp
- * benh@kernel.crashing.org
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-
-#include <xen/types.h>
-#include <xen/init.h>
-#include <xen/guest_access.h>
-#include <xen/device_tree.h>
-#include <xen/kernel.h>
-#include <xen/lib.h>
-#include <xen/libfdt/libfdt.h>
-#include <xen/mm.h>
-#include <xen/stdarg.h>
-#include <xen/string.h>
-#include <xen/cpumask.h>
-#include <xen/ctype.h>
-#include <asm/setup.h>
-#include <xen/err.h>
-
-const void *device_tree_flattened;
-dt_irq_xlate_func dt_irq_xlate;
-/* Host device tree */
-struct dt_device_node *dt_host;
-/* Interrupt controller node*/
-const struct dt_device_node *dt_interrupt_controller;
-DEFINE_RWLOCK(dt_host_lock);
-
-/**
- * struct dt_alias_prop - Alias property in 'aliases' node
- * @link: List node to link the structure in aliases_lookup list
- * @alias: Alias property name
- * @np: Pointer to device_node that the alias stands for
- * @id: Index value from end of alias name
- * @stem: Alias string without the index
- *
- * The structure represents one alias property of 'aliases' node as
- * an entry in aliases_lookup list.
- */
-struct dt_alias_prop {
-    struct list_head link;
-    const char *alias;
-    struct dt_device_node *np;
-    int id;
-    char stem[0];
-};
-
-static LIST_HEAD(aliases_lookup);
-
-#ifdef CONFIG_DEVICE_TREE_DEBUG
-static void dt_dump_addr(const char *s, const __be32 *addr, int na)
-{
-    dt_dprintk("%s", s);
-    while ( na-- )
-        dt_dprintk(" %08x", be32_to_cpu(*(addr++)));
-    dt_dprintk("\n");
-}
-#else
-static void dt_dump_addr(const char *s, const __be32 *addr, int na) { }
-#endif
-
-#define DT_BAD_ADDR ((u64)-1)
-
-/* Max address size we deal with */
-#define DT_MAX_ADDR_CELLS 4
-#define DT_CHECK_ADDR_COUNT(na) ((na) > 0 && (na) <= DT_MAX_ADDR_CELLS)
-#define DT_CHECK_COUNTS(na, ns) (DT_CHECK_ADDR_COUNT(na) && (ns) > 0)
-
-/* Callbacks for bus specific translators */
-struct dt_bus
-{
-    const char *name;
-    const char *addresses;
-    bool (*match)(const struct dt_device_node *node);
-    void (*count_cells)(const struct dt_device_node *child,
-                        int *addrc, int *sizec);
-    u64 (*map)(__be32 *addr, const __be32 *range, int na, int ns, int pna);
-    int (*translate)(__be32 *addr, u64 offset, int na);
-    unsigned int (*get_flags)(const __be32 *addr);
-};
-
-void dt_get_range(const __be32 **cellp, const struct dt_device_node *np,
-                  u64 *address, u64 *size)
-{
-    *address = dt_next_cell(dt_n_addr_cells(np), cellp);
-    *size = dt_next_cell(dt_n_size_cells(np), cellp);
-}
-
-void dt_set_cell(__be32 **cellp, int size, u64 val)
-{
-    int cells = size;
-
-    while ( size-- )
-    {
-        (*cellp)[size] = cpu_to_fdt32(val);
-        val >>= 32;
-    }
-
-    (*cellp) += cells;
-}
-
-void dt_set_range(__be32 **cellp, const struct dt_device_node *np,
-                  u64 address, u64 size)
-{
-    dt_set_cell(cellp, dt_n_addr_cells(np), address);
-    dt_set_cell(cellp, dt_n_size_cells(np), size);
-}
-
-void dt_child_set_range(__be32 **cellp, int addrcells, int sizecells,
-                        u64 address, u64 size)
-{
-    dt_set_cell(cellp, addrcells, address);
-    dt_set_cell(cellp, sizecells, size);
-}
-
-static void __init *unflatten_dt_alloc(unsigned long *mem, unsigned long size,
-                                       unsigned long align)
-{
-    void *res;
-
-    *mem = ROUNDUP(*mem, align);
-    res = (void *)*mem;
-    *mem += size;
-
-    return res;
-}
-
-/* Find a property with a given name for a given node and return it. */
-const struct dt_property *dt_find_property(const struct dt_device_node *np,
-                                           const char *name, u32 *lenp)
-{
-    const struct dt_property *pp;
-
-    if ( !np )
-        return NULL;
-
-    for ( pp = np->properties; pp; pp = pp->next )
-    {
-        if ( dt_prop_cmp(pp->name, name) == 0 )
-        {
-            if ( lenp )
-                *lenp = pp->length;
-            break;
-        }
-    }
-
-    return pp;
-}
-
-const void *dt_get_property(const struct dt_device_node *np,
-                            const char *name, u32 *lenp)
-{
-    const struct dt_property *pp = dt_find_property(np, name, lenp);
-
-    return pp ? pp->value : NULL;
-}
-
-bool dt_property_read_u32(const struct dt_device_node *np,
-                          const char *name, u32 *out_value)
-{
-    u32 len;
-    const __be32 *val;
-
-    val = dt_get_property(np, name, &len);
-    if ( !val || len < sizeof(*out_value) )
-        return 0;
-
-    *out_value = be32_to_cpup(val);
-
-    return 1;
-}
-
-
-bool dt_property_read_u64(const struct dt_device_node *np,
-                          const char *name, u64 *out_value)
-{
-    u32 len;
-    const __be32 *val;
-
-    val = dt_get_property(np, name, &len);
-    if ( !val || len < sizeof(*out_value) )
-        return 0;
-
-    *out_value = dt_read_number(val, 2);
-
-    return 1;
-}
-int dt_property_read_string(const struct dt_device_node *np,
-                            const char *propname, const char **out_string)
-{
-    const struct dt_property *pp = dt_find_property(np, propname, NULL);
-
-    if ( !pp )
-        return -EINVAL;
-    if ( !pp->length )
-        return -ENODATA;
-    if ( strnlen(pp->value, pp->length) >= pp->length )
-        return -EILSEQ;
-
-    *out_string = pp->value;
-
-    return 0;
-}
-
-/**
- * dt_find_property_value_of_size
- *
- * @np:     device node from which the property value is to be read.
- * @propname:   name of the property to be searched.
- * @min:    minimum allowed length of property value
- * @max:    maximum allowed length of property value (0 means unlimited)
- * @len:    if !=NULL, actual length is written to here
- *
- * Search for a property in a device node and valid the requested size.
- *
- * Return: The property value on success, -EINVAL if the property does not
- * exist, -ENODATA if property does not have a value, and -EOVERFLOW if the
- * property data is too small or too large.
- */
-static void *dt_find_property_value_of_size(const struct dt_device_node *np,
-                                            const char *propname, u32 min,
-                                            u32 max, size_t *len)
-{
-    const struct dt_property *prop = dt_find_property(np, propname, NULL);
-
-    if ( !prop )
-        return ERR_PTR(-EINVAL);
-    if ( !prop->value )
-        return ERR_PTR(-ENODATA);
-    if ( prop->length < min )
-        return ERR_PTR(-EOVERFLOW);
-    if ( max && prop->length > max )
-        return ERR_PTR(-EOVERFLOW);
-
-    if ( len )
-        *len = prop->length;
-
-    return prop->value;
-}
-
-int dt_property_read_variable_u32_array(const struct dt_device_node *np,
-                                        const char *propname, u32 *out_values,
-                                        size_t sz_min, size_t sz_max)
-{
-    size_t sz, count;
-    const __be32 *val = dt_find_property_value_of_size(np, propname,
-                        (sz_min * sizeof(*out_values)),
-                        (sz_max * sizeof(*out_values)),
-                        &sz);
-
-    if ( IS_ERR(val) )
-        return PTR_ERR(val);
-
-    if ( !sz_max )
-        sz = sz_min;
-    else
-        sz /= sizeof(*out_values);
-
-    count = sz;
-    while ( count-- )
-        *out_values++ = be32_to_cpup(val++);
-
-    return sz;
-}
-
-int dt_property_match_string(const struct dt_device_node *np,
-                             const char *propname, const char *string)
-{
-    const struct dt_property *dtprop = dt_find_property(np, propname, NULL);
-    size_t l;
-    int i;
-    const char *p, *end;
-
-    if ( !dtprop )
-        return -EINVAL;
-    if ( !dtprop->value )
-        return -ENODATA;
-
-    p = dtprop->value;
-    end = p + dtprop->length;
-
-    for ( i = 0; p < end; i++, p += l )
-    {
-        l = strnlen(p, end - p) + 1;
-        if ( p + l > end )
-            return -EILSEQ;
-        if ( strcmp(string, p) == 0 )
-            return i; /* Found it; return index */
-    }
-    return -ENODATA;
-}
-
-bool dt_device_is_compatible(const struct dt_device_node *device,
-                             const char *compat)
-{
-    const char* cp;
-    u32 cplen, l;
-
-    cp = dt_get_property(device, "compatible", &cplen);
-    if ( cp == NULL )
-        return 0;
-    while ( cplen > 0 )
-    {
-        if ( dt_compat_cmp(cp, compat) == 0 )
-            return 1;
-        l = strlen(cp) + 1;
-        cp += l;
-        cplen -= l;
-    }
-
-    return 0;
-}
-
-bool dt_machine_is_compatible(const char *compat)
-{
-    const struct dt_device_node *root;
-    bool rc = false;
-
-    root = dt_find_node_by_path("/");
-    if ( root )
-    {
-        rc = dt_device_is_compatible(root, compat);
-    }
-    return rc;
-}
-
-struct dt_device_node *dt_find_node_by_name(struct dt_device_node *from,
-                                            const char *name)
-{
-    struct dt_device_node *np;
-    struct dt_device_node *dt;
-
-    dt = from ? from->allnext : dt_host;
-    dt_for_each_device_node(dt, np)
-        if ( np->name && (dt_node_cmp(np->name, name) == 0) )
-            break;
-
-    return np;
-}
-
-struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
-                                            const char *type)
-{
-    struct dt_device_node *np;
-    struct dt_device_node *dt;
-
-    dt = from ? from->allnext : dt_host;
-    dt_for_each_device_node(dt, np)
-        if ( np->type && (dt_node_cmp(np->type, type) == 0) )
-            break;
-
-    return np;
-}
-
-struct dt_device_node *dt_find_node_by_path_from(struct dt_device_node *from,
-                                                 const char *path)
-{
-    struct dt_device_node *np;
-
-    dt_for_each_device_node(from, np)
-        if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
-            break;
-
-    return np;
-}
-
-int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
-                          struct dt_device_node **node)
-{
-    char *path;
-
-    path = safe_copy_string_from_guest(u_path, u_plen, PAGE_SIZE);
-    if ( IS_ERR(path) )
-        return PTR_ERR(path);
-
-    *node = dt_find_node_by_path(path);
-
-    xfree(path);
-
-    return (*node == NULL) ? -ESRCH : 0;
-}
-
-struct dt_device_node *dt_find_node_by_alias(const char *alias)
-{
-    const struct dt_alias_prop *app;
-
-    list_for_each_entry( app, &aliases_lookup, link )
-    {
-        if ( !strcmp(app->alias, alias) )
-            return app->np;
-    }
-
-    return NULL;
-}
-
-const struct dt_device_match *
-dt_match_node(const struct dt_device_match *matches,
-              const struct dt_device_node *node)
-{
-    if ( !matches )
-        return NULL;
-
-    while ( matches->path || matches->type ||
-            matches->compatible || matches->not_available || matches->prop )
-    {
-        bool match = true;
-
-        if ( matches->path )
-            match &= dt_node_path_is_equal(node, matches->path);
-
-        if ( matches->type )
-            match &= dt_device_type_is_equal(node, matches->type);
-
-        if ( matches->compatible )
-            match &= dt_device_is_compatible(node, matches->compatible);
-
-        if ( matches->not_available )
-            match &= !dt_device_is_available(node);
-
-        if ( matches->prop )
-            match &= dt_find_property(node, matches->prop, NULL) != NULL;
-
-        if ( match )
-            return matches;
-        matches++;
-    }
-
-    return NULL;
-}
-
-const struct dt_device_node *dt_get_parent(const struct dt_device_node *node)
-{
-    if ( !node )
-        return NULL;
-
-    return node->parent;
-}
-
-struct dt_device_node *
-dt_find_compatible_node(struct dt_device_node *from,
-                        const char *type,
-                        const char *compatible)
-{
-    struct dt_device_node *np;
-    struct dt_device_node *dt;
-
-    dt = from ? from->allnext : dt_host;
-    dt_for_each_device_node(dt, np)
-    {
-        if ( type
-             && !(np->type && (dt_node_cmp(np->type, type) == 0)) )
-            continue;
-        if ( dt_device_is_compatible(np, compatible) )
-            break;
-    }
-
-    return np;
-}
-
-struct dt_device_node *
-dt_find_matching_node(struct dt_device_node *from,
-                      const struct dt_device_match *matches)
-{
-    struct dt_device_node *np;
-    struct dt_device_node *dt;
-
-    dt = from ? from->allnext : dt_host;
-    dt_for_each_device_node(dt, np)
-    {
-        if ( dt_match_node(matches, np) )
-            return np;
-    }
-
-    return NULL;
-}
-
-static int __dt_n_addr_cells(const struct dt_device_node *np, bool parent)
-{
-    const __be32 *ip;
-
-    do {
-        if ( np->parent && !parent )
-            np = np->parent;
-        parent = false;
-
-        ip = dt_get_property(np, "#address-cells", NULL);
-        if ( ip )
-            return be32_to_cpup(ip);
-    } while ( np->parent );
-    /* No #address-cells property for the root node */
-    return DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
-}
-
-static int __dt_n_size_cells(const struct dt_device_node *np, bool parent)
-{
-    const __be32 *ip;
-
-    do {
-        if ( np->parent && !parent )
-            np = np->parent;
-        parent = false;
-
-        ip = dt_get_property(np, "#size-cells", NULL);
-        if ( ip )
-            return be32_to_cpup(ip);
-    } while ( np->parent );
-    /* No #address-cells property for the root node */
-    return DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
-}
-
-int dt_n_addr_cells(const struct dt_device_node *np)
-{
-    return __dt_n_addr_cells(np, false);
-}
-
-int dt_n_size_cells(const struct dt_device_node *np)
-{
-    return __dt_n_size_cells(np, false);
-}
-
-int dt_child_n_addr_cells(const struct dt_device_node *parent)
-{
-    return __dt_n_addr_cells(parent, true);
-}
-
-int dt_child_n_size_cells(const struct dt_device_node *parent)
-{
-    return __dt_n_size_cells(parent, true);
-}
-
-/*
- * These are defined in Linux where much of this code comes from, but
- * are currently unused outside this file in the context of Xen.
- */
-#define IORESOURCE_BITS         0x000000ff      /* Bus-specific bits */
-
-#define IORESOURCE_TYPE_BITS    0x00001f00      /* Resource type */
-#define IORESOURCE_IO           0x00000100      /* PCI/ISA I/O ports */
-#define IORESOURCE_MEM          0x00000200
-#define IORESOURCE_REG          0x00000300      /* Register offsets */
-#define IORESOURCE_IRQ          0x00000400
-#define IORESOURCE_DMA          0x00000800
-#define IORESOURCE_BUS          0x00001000
-
-#define IORESOURCE_PREFETCH     0x00002000      /* No side effects */
-#define IORESOURCE_READONLY     0x00004000
-#define IORESOURCE_CACHEABLE    0x00008000
-#define IORESOURCE_RANGELENGTH  0x00010000
-#define IORESOURCE_SHADOWABLE   0x00020000
-
-/*
- * Default translator (generic bus)
- */
-static bool dt_bus_default_match(const struct dt_device_node *node)
-{
-    /* Root node doesn't have "ranges" property */
-    if ( node->parent == NULL )
-        return 1;
-
-    /* The default bus is only used when the "ranges" property exists.
-     * Otherwise we can't translate the address
-     */
-    return (dt_get_property(node, "ranges", NULL) != NULL);
-}
-
-static void dt_bus_default_count_cells(const struct dt_device_node *dev,
-                                int *addrc, int *sizec)
-{
-    if ( addrc )
-        *addrc = dt_n_addr_cells(dev);
-    if ( sizec )
-        *sizec = dt_n_size_cells(dev);
-}
-
-static u64 dt_bus_default_map(__be32 *addr, const __be32 *range,
-                              int na, int ns, int pna)
-{
-    u64 cp, s, da;
-
-    cp = dt_read_number(range, na);
-    s = dt_read_number(range + na + pna, ns);
-    da = dt_read_number(addr, na);
-
-    dt_dprintk("DT: default map, cp=%llx, s=%llx, da=%llx\n",
-               (unsigned long long)cp, (unsigned long long)s,
-               (unsigned long long)da);
-
-    /*
-     * If the number of address cells is larger than 2 we assume the
-     * mapping doesn't specify a physical address. Rather, the address
-     * specifies an identifier that must match exactly.
-     */
-    if ( na > 2 && memcmp(range, addr, na * 4) != 0 )
-        return DT_BAD_ADDR;
-
-    if ( da < cp || da >= (cp + s) )
-        return DT_BAD_ADDR;
-    return da - cp;
-}
-
-static int dt_bus_default_translate(__be32 *addr, u64 offset, int na)
-{
-    u64 a = dt_read_number(addr, na);
-
-    memset(addr, 0, na * 4);
-    a += offset;
-    if ( na > 1 )
-        addr[na - 2] = cpu_to_be32(a >> 32);
-    addr[na - 1] = cpu_to_be32(a & 0xffffffffu);
-
-    return 0;
-}
-static unsigned int dt_bus_default_get_flags(const __be32 *addr)
-{
-    return IORESOURCE_MEM;
-}
-
-/*
- * PCI bus specific translator
- */
-
-static bool dt_node_is_pci(const struct dt_device_node *np)
-{
-    bool is_pci = !strcmp(np->name, "pcie") || !strcmp(np->name, "pci");
-
-    if ( is_pci )
-        printk(XENLOG_WARNING "%s: Missing device_type\n", np->full_name);
-
-    return is_pci;
-}
-
-static bool dt_bus_pci_match(const struct dt_device_node *np)
-{
-    /*
-     * "pciex" is PCI Express "vci" is for the /chaos bridge on 1st-gen PCI
-     * powermacs "ht" is hypertransport
-     *
-     * If none of the device_type match, and that the node name is
-     * "pcie" or "pci", accept the device as PCI (with a warning).
-     */
-    return !strcmp(np->type, "pci") || !strcmp(np->type, "pciex") ||
-        !strcmp(np->type, "vci") || !strcmp(np->type, "ht") ||
-        dt_node_is_pci(np);
-}
-
-static void dt_bus_pci_count_cells(const struct dt_device_node *np,
-				   int *addrc, int *sizec)
-{
-    if (addrc)
-        *addrc = 3;
-    if (sizec)
-        *sizec = 2;
-}
-
-static unsigned int dt_bus_pci_get_flags(const __be32 *addr)
-{
-    unsigned int flags = 0;
-    u32 w = be32_to_cpup(addr);
-
-    switch((w >> 24) & 0x03) {
-    case 0x01:
-        flags |= IORESOURCE_IO;
-        break;
-    case 0x02: /* 32 bits */
-    case 0x03: /* 64 bits */
-        flags |= IORESOURCE_MEM;
-        break;
-    }
-    if (w & 0x40000000)
-        flags |= IORESOURCE_PREFETCH;
-    return flags;
-}
-
-static u64 dt_bus_pci_map(__be32 *addr, const __be32 *range, int na, int ns,
-		int pna)
-{
-    u64 cp, s, da;
-    unsigned int af, rf;
-
-    af = dt_bus_pci_get_flags(addr);
-    rf = dt_bus_pci_get_flags(range);
-
-    /* Check address type match */
-    if ((af ^ rf) & (IORESOURCE_MEM | IORESOURCE_IO))
-        return DT_BAD_ADDR;
-
-    /* Read address values, skipping high cell */
-    cp = dt_read_number(range + 1, na - 1);
-    s  = dt_read_number(range + na + pna, ns);
-    da = dt_read_number(addr + 1, na - 1);
-
-    dt_dprintk("DT: PCI map, cp=%llx, s=%llx, da=%llx\n",
-               (unsigned long long)cp, (unsigned long long)s,
-               (unsigned long long)da);
-
-    if (da < cp || da >= (cp + s))
-        return DT_BAD_ADDR;
-    return da - cp;
-}
-
-static int dt_bus_pci_translate(__be32 *addr, u64 offset, int na)
-{
-    return dt_bus_default_translate(addr + 1, offset, na - 1);
-}
-
-/*
- * Array of bus specific translators
- */
-static const struct dt_bus dt_busses[] =
-{
-    /* PCI */
-    {
-        .name = "pci",
-        .addresses = "assigned-addresses",
-        .match = dt_bus_pci_match,
-        .count_cells = dt_bus_pci_count_cells,
-        .map = dt_bus_pci_map,
-        .translate = dt_bus_pci_translate,
-        .get_flags = dt_bus_pci_get_flags,
-    },
-    /* Default */
-    {
-        .name = "default",
-        .addresses = "reg",
-        .match = dt_bus_default_match,
-        .count_cells = dt_bus_default_count_cells,
-        .map = dt_bus_default_map,
-        .translate = dt_bus_default_translate,
-        .get_flags = dt_bus_default_get_flags,
-    },
-};
-
-static const struct dt_bus *dt_match_bus(const struct dt_device_node *np)
-{
-    int i;
-
-    for ( i = 0; i < ARRAY_SIZE(dt_busses); i++ )
-        if ( !dt_busses[i].match || dt_busses[i].match(np) )
-            return &dt_busses[i];
-
-    return NULL;
-}
-
-static const __be32 *dt_get_address(const struct dt_device_node *dev,
-                                    unsigned int index, u64 *size,
-                                    unsigned int *flags)
-{
-    const __be32 *prop;
-    u32 psize;
-    const struct dt_device_node *parent;
-    const struct dt_bus *bus;
-    int onesize, i, na, ns;
-
-    /* Get parent & match bus type */
-    parent = dt_get_parent(dev);
-    if ( parent == NULL )
-        return NULL;
-
-    bus = dt_match_bus(parent);
-    if ( !bus )
-        return NULL;
-    bus->count_cells(dev, &na, &ns);
-
-    if ( !DT_CHECK_ADDR_COUNT(na) )
-        return NULL;
-
-    /* Get "reg" or "assigned-addresses" property */
-    prop = dt_get_property(dev, bus->addresses, &psize);
-    if ( prop == NULL )
-        return NULL;
-    psize /= 4;
-
-    onesize = na + ns;
-    for ( i = 0; psize >= onesize; psize -= onesize, prop += onesize, i++ )
-    {
-        if ( i == index )
-        {
-            if ( size )
-                *size = dt_read_number(prop + na, ns);
-            if ( flags )
-                *flags = bus->get_flags(prop);
-            return prop;
-        }
-    }
-    return NULL;
-}
-
-static int dt_translate_one(const struct dt_device_node *parent,
-                            const struct dt_bus *bus,
-                            const struct dt_bus *pbus,
-                            __be32 *addr, int na, int ns,
-                            int pna, const char *rprop)
-{
-    const __be32 *ranges;
-    unsigned int rlen;
-    int rone;
-    u64 offset = DT_BAD_ADDR;
-
-    ranges = dt_get_property(parent, rprop, &rlen);
-    if ( ranges == NULL )
-    {
-        printk(XENLOG_ERR "DT: no ranges; cannot translate\n");
-        return 1;
-    }
-    if ( rlen == 0 )
-    {
-        offset = dt_read_number(addr, na);
-        memset(addr, 0, pna * 4);
-        dt_dprintk("DT: empty ranges; 1:1 translation\n");
-        goto finish;
-    }
-
-    dt_dprintk("DT: walking ranges...\n");
-
-    /* Now walk through the ranges */
-    rlen /= 4;
-    rone = na + pna + ns;
-    for ( ; rlen >= rone; rlen -= rone, ranges += rone )
-    {
-        offset = bus->map(addr, ranges, na, ns, pna);
-        if ( offset != DT_BAD_ADDR )
-            break;
-    }
-    if ( offset == DT_BAD_ADDR )
-    {
-        dt_dprintk("DT: not found !\n");
-        return 1;
-    }
-    memcpy(addr, ranges + na, 4 * pna);
-
-finish:
-    dt_dump_addr("DT: parent translation for:", addr, pna);
-    dt_dprintk("DT: with offset: %llx\n", (unsigned long long)offset);
-
-    /* Translate it into parent bus space */
-    return pbus->translate(addr, offset, pna);
-}
-
-/*
- * Translate an address from the device-tree into a CPU physical address,
- * this walks up the tree and applies the various bus mappings on the
- * way.
- *
- * Note: We consider that crossing any level with #size-cells == 0 to mean
- * that translation is impossible (that is we are not dealing with a value
- * that can be mapped to a cpu physical address). This is not really specified
- * that way, but this is traditionally the way IBM at least do things
- */
-static u64 __dt_translate_address(const struct dt_device_node *dev,
-                                  const __be32 *in_addr, const char *rprop)
-{
-    const struct dt_device_node *parent = NULL;
-    const struct dt_bus *bus, *pbus;
-    __be32 addr[DT_MAX_ADDR_CELLS];
-    int na, ns, pna, pns;
-    u64 result = DT_BAD_ADDR;
-
-    dt_dprintk("DT: ** translation for device %s **\n", dev->full_name);
-
-    /* Get parent & match bus type */
-    parent = dt_get_parent(dev);
-    if ( parent == NULL )
-        goto bail;
-    bus = dt_match_bus(parent);
-    if ( !bus )
-        goto bail;
-
-    /* Count address cells & copy address locally */
-    bus->count_cells(dev, &na, &ns);
-    if ( !DT_CHECK_COUNTS(na, ns) )
-    {
-        printk(XENLOG_ERR "dt_parse: Bad cell count for device %s\n",
-                  dev->full_name);
-        goto bail;
-    }
-    memcpy(addr, in_addr, na * 4);
-
-    dt_dprintk("DT: bus is %s (na=%d, ns=%d) on %s\n",
-               bus->name, na, ns, parent->full_name);
-    dt_dump_addr("DT: translating address:", addr, na);
-
-    /* Translate */
-    for ( ;; )
-    {
-        /* Switch to parent bus */
-        dev = parent;
-        parent = dt_get_parent(dev);
-
-        /* If root, we have finished */
-        if ( parent == NULL )
-        {
-            dt_dprintk("DT: reached root node\n");
-            result = dt_read_number(addr, na);
-            break;
-        }
-
-        /* Get new parent bus and counts */
-        pbus = dt_match_bus(parent);
-        if ( pbus == NULL )
-        {
-            printk("DT: %s is not a valid bus\n", parent->full_name);
-            break;
-        }
-        pbus->count_cells(dev, &pna, &pns);
-        if ( !DT_CHECK_COUNTS(pna, pns) )
-        {
-            printk(XENLOG_ERR "dt_parse: Bad cell count for parent %s\n",
-                   dev->full_name);
-            break;
-        }
-
-        dt_dprintk("DT: parent bus is %s (na=%d, ns=%d) on %s\n",
-                   pbus->name, pna, pns, parent->full_name);
-
-        /* Apply bus translation */
-        if ( dt_translate_one(dev, bus, pbus, addr, na, ns, pna, rprop) )
-            break;
-
-        /* Complete the move up one level */
-        na = pna;
-        ns = pns;
-        bus = pbus;
-
-        dt_dump_addr("DT: one level translation:", addr, na);
-    }
-
-bail:
-    return result;
-}
-
-/* dt_device_address - Translate device tree address and return it */
-int dt_device_get_address(const struct dt_device_node *dev, unsigned int index,
-                          u64 *addr, u64 *size)
-{
-    const __be32 *addrp;
-    unsigned int flags;
-
-    addrp = dt_get_address(dev, index, size, &flags);
-    if ( addrp == NULL )
-        return -EINVAL;
-
-    if ( !addr )
-        return -EINVAL;
-
-    *addr = __dt_translate_address(dev, addrp, "ranges");
-
-    if ( *addr == DT_BAD_ADDR )
-        return -EINVAL;
-
-    return 0;
-}
-
-int dt_device_get_paddr(const struct dt_device_node *dev, unsigned int index,
-                        paddr_t *addr, paddr_t *size)
-{
-    uint64_t dt_addr, dt_size;
-    int ret;
-
-    ret = dt_device_get_address(dev, index, &dt_addr, &dt_size);
-    if ( ret )
-        return ret;
-
-    if ( !addr )
-        return -EINVAL;
-
-    if ( dt_addr != (paddr_t)dt_addr )
-    {
-        printk("Error: Physical address 0x%"PRIx64" for node=%s is greater than max width (%zu bytes) supported\n",
-               dt_addr, dev->name, sizeof(paddr_t));
-        return -ERANGE;
-    }
-
-    *addr = dt_addr;
-
-    if ( size )
-    {
-        if ( dt_size != (paddr_t)dt_size )
-        {
-            printk("Error: Physical size 0x%"PRIx64" for node=%s is greater than max width (%zu bytes) supported\n",
-                   dt_size, dev->name, sizeof(paddr_t));
-            return -ERANGE;
-        }
-
-        *size = dt_size;
-    }
-
-    return ret;
-}
-
-int dt_for_each_range(const struct dt_device_node *dev,
-                      int (*cb)(const struct dt_device_node *dev,
-                                uint64_t addr, uint64_t length,
-                                void *data),
-                      void *data)
-{
-    const struct dt_device_node *parent = NULL;
-    const struct dt_bus *bus, *pbus;
-    const __be32 *ranges;
-    __be32 addr[DT_MAX_ADDR_CELLS];
-    unsigned int rlen;
-    int na, ns, pna, pns, rone;
-
-    bus = dt_match_bus(dev);
-    if ( !bus )
-        return 0; /* device is not a bus */
-
-    parent = dt_get_parent(dev);
-    if ( parent == NULL )
-        return -EINVAL;
-
-    ranges = dt_get_property(dev, "ranges", &rlen);
-    if ( ranges == NULL )
-    {
-        printk(XENLOG_ERR "DT: no ranges; cannot enumerate %s\n",
-               dev->full_name);
-        return -EINVAL;
-    }
-    if ( rlen == 0 ) /* Nothing to do */
-        return 0;
-
-    bus->count_cells(dev, &na, &ns);
-    if ( !DT_CHECK_COUNTS(na, ns) )
-    {
-        printk(XENLOG_ERR "dt_parse: Bad cell count for device %s\n",
-                  dev->full_name);
-        return -EINVAL;
-    }
-
-    pbus = dt_match_bus(parent);
-    if ( pbus == NULL )
-    {
-        printk("DT: %s is not a valid bus\n", parent->full_name);
-        return -EINVAL;
-    }
-
-    pbus->count_cells(dev, &pna, &pns);
-    if ( !DT_CHECK_COUNTS(pna, pns) )
-    {
-        printk(XENLOG_ERR "dt_parse: Bad cell count for parent %s\n",
-               dev->full_name);
-        return -EINVAL;
-    }
-
-    /* Now walk through the ranges */
-    rlen /= 4;
-    rone = na + pna + ns;
-
-    dt_dprintk("%s: dev=%s, bus=%s, parent=%s, rlen=%d, rone=%d\n",
-               __func__,
-               dt_node_name(dev), bus->name,
-               dt_node_name(parent), rlen, rone);
-
-    for ( ; rlen >= rone; rlen -= rone, ranges += rone )
-    {
-        uint64_t a, s;
-        int ret;
-
-        memcpy(addr, ranges + na, 4 * pna);
-
-        a = __dt_translate_address(dev, addr, "ranges");
-        s = dt_read_number(ranges + na + pna, ns);
-
-        ret = cb(dev, a, s, data);
-        if ( ret )
-        {
-            dt_dprintk(" -> callback failed=%d\n", ret);
-            return ret;
-        }
-
-    }
-
-    return 0;
-}
-
-/**
- * dt_find_node_by_phandle - Find a node given a phandle
- * @handle: phandle of the node to find
- *
- * Returns a node pointer.
- */
-struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle)
-{
-    struct dt_device_node *np;
-
-    dt_for_each_device_node(dt_host, np)
-        if ( np->phandle == handle )
-            break;
-
-    return np;
-}
-
-/**
- * dt_irq_find_parent - Given a device node, find its interrupt parent node
- * @child: pointer to device node
- *
- * Returns a pointer to the interrupt parent node, or NULL if the interrupt
- * parent could not be determined.
- */
-static const struct dt_device_node *
-dt_irq_find_parent(const struct dt_device_node *child)
-{
-    const struct dt_device_node *p;
-    const __be32 *parp;
-
-    do
-    {
-        parp = dt_get_property(child, "interrupt-parent", NULL);
-        if ( parp == NULL )
-            p = dt_get_parent(child);
-        else
-            p = dt_find_node_by_phandle(be32_to_cpup(parp));
-        child = p;
-    } while ( p && dt_get_property(p, "#interrupt-cells", NULL) == NULL );
-
-    return p;
-}
-
-unsigned int dt_number_of_irq(const struct dt_device_node *device)
-{
-    const struct dt_device_node *p;
-    const __be32 *intspec, *tmp;
-    u32 intsize, intlen;
-    int intnum;
-
-    dt_dprintk("dt_irq_number: dev=%s\n", device->full_name);
-
-    /* Try the new-style interrupts-extended first */
-    intnum = dt_count_phandle_with_args(device, "interrupts-extended",
-                                        "#interrupt-cells");
-    if ( intnum >= 0 )
-    {
-        dt_dprintk(" using 'interrupts-extended' property\n");
-        dt_dprintk(" intnum=%d\n", intnum);
-        return intnum;
-    }
-
-    /* Get the interrupts property */
-    intspec = dt_get_property(device, "interrupts", &intlen);
-    if ( intspec == NULL )
-        return 0;
-    intlen /= sizeof(*intspec);
-
-    dt_dprintk(" using 'interrupts' property\n");
-    dt_dprintk(" intspec=%d intlen=%d\n", be32_to_cpup(intspec), intlen);
-
-    /* Look for the interrupt parent. */
-    p = dt_irq_find_parent(device);
-    if ( p == NULL )
-        return 0;
-
-    /* Get size of interrupt specifier */
-    tmp = dt_get_property(p, "#interrupt-cells", NULL);
-    if ( tmp == NULL )
-        return 0;
-    intsize = be32_to_cpu(*tmp);
-
-    dt_dprintk(" intsize=%d intlen=%d\n", intsize, intlen);
-
-    return (intlen / intsize);
-}
-
-unsigned int dt_number_of_address(const struct dt_device_node *dev)
-{
-    const __be32 *prop;
-    u32 psize;
-    const struct dt_device_node *parent;
-    const struct dt_bus *bus;
-    int onesize, na, ns;
-
-    /* Get parent & match bus type */
-    parent = dt_get_parent(dev);
-    if ( parent == NULL )
-        return 0;
-
-    bus = dt_match_bus(parent);
-    if ( !bus )
-        return 0;
-    bus->count_cells(dev, &na, &ns);
-
-    if ( !DT_CHECK_COUNTS(na, ns) )
-        return 0;
-
-    /* Get "reg" or "assigned-addresses" property */
-    prop = dt_get_property(dev, bus->addresses, &psize);
-    if ( prop == NULL )
-        return 0;
-
-    psize /= 4;
-    onesize = na + ns;
-
-    return (psize / onesize);
-}
-
-int dt_for_each_irq_map(const struct dt_device_node *dev,
-                        int (*cb)(const struct dt_device_node *dev,
-                                  const struct dt_irq *dt_irq,
-                                  void *data),
-                        void *data)
-{
-    const struct dt_device_node *ipar, *tnode, *old = NULL;
-    const __be32 *tmp, *imap;
-    u32 intsize = 1, addrsize, pintsize = 0, paddrsize = 0;
-    u32 imaplen;
-    int i, ret;
-
-    struct dt_raw_irq dt_raw_irq;
-    struct dt_irq dt_irq;
-
-    dt_dprintk("%s: par=%s cb=%p data=%p\n", __func__,
-               dev->full_name, cb, data);
-
-    ipar = dev;
-
-    /* First get the #interrupt-cells property of the current cursor
-     * that tells us how to interpret the passed-in intspec. If there
-     * is none, we are nice and just walk up the tree
-     */
-    do {
-        tmp = dt_get_property(ipar, "#interrupt-cells", NULL);
-        if ( tmp != NULL )
-        {
-            intsize = be32_to_cpu(*tmp);
-            break;
-        }
-        tnode = ipar;
-        ipar = dt_irq_find_parent(ipar);
-    } while ( ipar );
-    if ( ipar == NULL )
-    {
-        dt_dprintk(" -> no parent found !\n");
-        goto fail;
-    }
-
-    dt_dprintk("%s: ipar=%s, size=%d\n", __func__, ipar->full_name, intsize);
-
-    if ( intsize > DT_MAX_IRQ_SPEC )
-    {
-        dt_dprintk(" -> too many irq specifier cells\n");
-        goto fail;
-    }
-
-    /* Look for this #address-cells. We have to implement the old linux
-     * trick of looking for the parent here as some device-trees rely on it
-     */
-    old = ipar;
-    do {
-        tmp = dt_get_property(old, "#address-cells", NULL);
-        tnode = dt_get_parent(old);
-        old = tnode;
-    } while ( old && tmp == NULL );
-
-    old = NULL;
-    addrsize = (tmp == NULL) ? 2 : be32_to_cpu(*tmp);
-
-    dt_dprintk(" -> addrsize=%d\n", addrsize);
-
-    /* Now look for an interrupt-map */
-    imap = dt_get_property(dev, "interrupt-map", &imaplen);
-    /* No interrupt-map found. Ignore */
-    if ( imap == NULL )
-    {
-        dt_dprintk(" -> no map, ignoring\n");
-        return 0;
-    }
-    imaplen /= sizeof(u32);
-
-    /* Parse interrupt-map */
-    while ( imaplen > (addrsize + intsize + 1) )
-    {
-        /* skip child unit address and child interrupt specifier */
-        imap += addrsize + intsize;
-        imaplen -= addrsize + intsize;
-
-        /* Get the interrupt parent */
-        ipar = dt_find_node_by_phandle(be32_to_cpup(imap));
-        imap++;
-        --imaplen;
-
-        /* Check if not found */
-        if ( ipar == NULL )
-        {
-            dt_dprintk(" -> imap parent not found !\n");
-            goto fail;
-        }
-
-        dt_dprintk(" -> ipar %s\n", dt_node_name(ipar));
-
-        /* Get #interrupt-cells and #address-cells of new
-         * parent
-         */
-        tmp = dt_get_property(ipar, "#interrupt-cells", NULL);
-        if ( tmp == NULL )
-        {
-            dt_dprintk(" -> parent lacks #interrupt-cells!\n");
-            goto fail;
-        }
-        pintsize = be32_to_cpu(*tmp);
-        tmp = dt_get_property(ipar, "#address-cells", NULL);
-        paddrsize = (tmp == NULL) ? 0 : be32_to_cpu(*tmp);
-
-        dt_dprintk(" -> pintsize=%d, paddrsize=%d\n",
-                   pintsize, paddrsize);
-
-        if ( pintsize > DT_MAX_IRQ_SPEC )
-        {
-            dt_dprintk(" -> too many irq specifier cells in parent\n");
-            goto fail;
-        }
-
-        /* Check for malformed properties */
-        if ( imaplen < (paddrsize + pintsize) )
-            goto fail;
-
-        imap += paddrsize;
-        imaplen -= paddrsize;
-
-        dt_raw_irq.controller = ipar;
-        dt_raw_irq.size = pintsize;
-        for ( i = 0; i < pintsize; i++ )
-            dt_raw_irq.specifier[i] = dt_read_number(imap + i, 1);
-
-        if ( dt_raw_irq.controller != dt_interrupt_controller )
-        {
-            /*
-             * We don't map IRQs connected to secondary IRQ controllers as
-             * these IRQs have no meaning to us until they connect to the
-             * primary controller.
-             *
-             * Secondary IRQ controllers will at some point connect to
-             * the primary controller (possibly via other IRQ controllers).
-             * We map the IRQs at that last connection point.
-             */
-            imap += pintsize;
-            imaplen -= pintsize;
-            dt_dprintk(" -> Skipped IRQ for secondary IRQ controller\n");
-            continue;
-        }
-
-        ret = dt_irq_translate(&dt_raw_irq, &dt_irq);
-        if ( ret )
-        {
-            dt_dprintk(" -> failed to translate IRQ: %d\n", ret);
-            return ret;
-        }
-
-        ret = cb(dev, &dt_irq, data);
-        if ( ret )
-        {
-            dt_dprintk(" -> callback failed=%d\n", ret);
-            return ret;
-        }
-
-        imap += pintsize;
-        imaplen -= pintsize;
-
-        dt_dprintk(" -> imaplen=%d\n", imaplen);
-    }
-
-    return 0;
-
-fail:
-    return -EINVAL;
-}
-
-/**
- * dt_irq_map_raw - Low level interrupt tree parsing
- * @parent:     the device interrupt parent
- * @intspec:    interrupt specifier ("interrupts" property of the device)
- * @ointsize:   size of the passed in interrupt specifier
- * @addr:       address specifier (start of "reg" property of the device)
- * @oirq:       structure dt_raw_irq filled by this function
- *
- * Returns 0 on success and a negative number on error
- *
- * This function is a low-level interrupt tree walking function. It
- * can be used to do a partial walk with synthesized reg and interrupts
- * properties, for example when resolving PCI interrupts when no device
- * node exist for the parent.
- */
-static int dt_irq_map_raw(const struct dt_device_node *parent,
-                          const __be32 *intspec, u32 ointsize,
-                          const __be32 *addr,
-                          struct dt_raw_irq *oirq)
-{
-    const struct dt_device_node *ipar, *tnode, *old = NULL, *newpar = NULL;
-    const __be32 *tmp, *imap, *imask;
-    u32 intsize = 1, addrsize, newintsize = 0, newaddrsize = 0;
-    u32 imaplen;
-    int match, i;
-
-    dt_dprintk("dt_irq_map_raw: par=%s,intspec=[0x%08x 0x%08x...],ointsize=%d\n",
-               parent->full_name, be32_to_cpup(intspec),
-               be32_to_cpup(intspec + 1), ointsize);
-
-    ipar = parent;
-
-    /* First get the #interrupt-cells property of the current cursor
-     * that tells us how to interpret the passed-in intspec. If there
-     * is none, we are nice and just walk up the tree
-     */
-    do {
-        tmp = dt_get_property(ipar, "#interrupt-cells", NULL);
-        if ( tmp != NULL )
-        {
-            intsize = be32_to_cpu(*tmp);
-            break;
-        }
-        tnode = ipar;
-        ipar = dt_irq_find_parent(ipar);
-    } while ( ipar );
-    if ( ipar == NULL )
-    {
-        dt_dprintk(" -> no parent found !\n");
-        goto fail;
-    }
-
-    dt_dprintk("dt_irq_map_raw: ipar=%s, size=%d\n", ipar->full_name, intsize);
-
-    if ( ointsize != intsize )
-        return -EINVAL;
-
-    /* Look for this #address-cells. We have to implement the old linux
-     * trick of looking for the parent here as some device-trees rely on it
-     */
-    old = ipar;
-    do {
-        tmp = dt_get_property(old, "#address-cells", NULL);
-        tnode = dt_get_parent(old);
-        old = tnode;
-    } while ( old && tmp == NULL );
-
-    old = NULL;
-    addrsize = (tmp == NULL) ? 2 : be32_to_cpu(*tmp);
-
-    dt_dprintk(" -> addrsize=%d\n", addrsize);
-
-    /* Now start the actual "proper" walk of the interrupt tree */
-    while ( ipar != NULL )
-    {
-        /* Now check if cursor is an interrupt-controller and if it is
-         * then we are done
-         */
-        if ( dt_get_property(ipar, "interrupt-controller", NULL) != NULL )
-        {
-            dt_dprintk(" -> got it !\n");
-            if ( intsize > DT_MAX_IRQ_SPEC )
-            {
-                dt_dprintk(" -> intsize(%u) greater than DT_MAX_IRQ_SPEC(%u)\n",
-                           intsize, DT_MAX_IRQ_SPEC);
-                goto fail;
-            }
-            for ( i = 0; i < intsize; i++ )
-                oirq->specifier[i] = dt_read_number(intspec + i, 1);
-            oirq->size = intsize;
-            oirq->controller = ipar;
-            return 0;
-        }
-
-        /* Now look for an interrupt-map */
-        imap = dt_get_property(ipar, "interrupt-map", &imaplen);
-        /* No interrupt map, check for an interrupt parent */
-        if ( imap == NULL )
-        {
-            dt_dprintk(" -> no map, getting parent\n");
-            newpar = dt_irq_find_parent(ipar);
-            goto skiplevel;
-        }
-        imaplen /= sizeof(u32);
-
-        /* Look for a mask */
-        imask = dt_get_property(ipar, "interrupt-map-mask", NULL);
-
-        /* If we were passed no "reg" property and we attempt to parse
-         * an interrupt-map, then #address-cells must be 0.
-         * Fail if it's not.
-         */
-        if ( addr == NULL && addrsize != 0 )
-        {
-            dt_dprintk(" -> no reg passed in when needed !\n");
-            goto fail;
-        }
-
-        /* Parse interrupt-map */
-        match = 0;
-        while ( imaplen > (addrsize + intsize + 1) && !match )
-        {
-            /* Compare specifiers */
-            match = 1;
-            for ( i = 0; i < addrsize && match; ++i )
-            {
-                __be32 mask = imask ? imask[i] : cpu_to_be32(0xffffffffu);
-                match = ((addr[i] ^ imap[i]) & mask) == 0;
-            }
-            for ( ; i < (addrsize + intsize) && match; ++i )
-            {
-                __be32 mask = imask ? imask[i] : cpu_to_be32(0xffffffffu);
-                match = ((intspec[i-addrsize] ^ imap[i]) & mask) == 0;
-            }
-            imap += addrsize + intsize;
-            imaplen -= addrsize + intsize;
-
-            dt_dprintk(" -> match=%d (imaplen=%d)\n", match, imaplen);
-
-            /* Get the interrupt parent */
-            newpar = dt_find_node_by_phandle(be32_to_cpup(imap));
-            imap++;
-            --imaplen;
-
-            /* Check if not found */
-            if ( newpar == NULL )
-            {
-                dt_dprintk(" -> imap parent not found !\n");
-                goto fail;
-            }
-
-            /* Get #interrupt-cells and #address-cells of new
-             * parent
-             */
-            tmp = dt_get_property(newpar, "#interrupt-cells", NULL);
-            if ( tmp == NULL )
-            {
-                dt_dprintk(" -> parent lacks #interrupt-cells!\n");
-                goto fail;
-            }
-            newintsize = be32_to_cpu(*tmp);
-            tmp = dt_get_property(newpar, "#address-cells", NULL);
-            newaddrsize = (tmp == NULL) ? 0 : be32_to_cpu(*tmp);
-
-            dt_dprintk(" -> newintsize=%d, newaddrsize=%d\n",
-                       newintsize, newaddrsize);
-
-            /* Check for malformed properties */
-            if ( imaplen < (newaddrsize + newintsize) )
-                goto fail;
-
-            imap += newaddrsize + newintsize;
-            imaplen -= newaddrsize + newintsize;
-
-            dt_dprintk(" -> imaplen=%d\n", imaplen);
-        }
-        if ( !match )
-            goto fail;
-
-        old = newpar;
-        addrsize = newaddrsize;
-        intsize = newintsize;
-        intspec = imap - intsize;
-        addr = intspec - addrsize;
-
-    skiplevel:
-        /* Iterate again with new parent */
-        dt_dprintk(" -> new parent: %s\n", dt_node_full_name(newpar));
-        ipar = newpar;
-        newpar = NULL;
-    }
-fail:
-    return -EINVAL;
-}
-
-int dt_device_get_raw_irq(const struct dt_device_node *device,
-                          unsigned int index,
-                          struct dt_raw_irq *out_irq)
-{
-    const struct dt_device_node *p;
-    const __be32 *intspec, *tmp, *addr;
-    u32 intsize, intlen;
-    int res = -EINVAL;
-    struct dt_phandle_args args;
-    int i;
-
-    dt_dprintk("dt_device_get_raw_irq: dev=%s, index=%u\n",
-               device->full_name, index);
-
-    /* Get the reg property (if any) */
-    addr = dt_get_property(device, "reg", NULL);
-
-    /* Try the new-style interrupts-extended first */
-    res = dt_parse_phandle_with_args(device, "interrupts-extended",
-                                     "#interrupt-cells", index, &args);
-    if ( !res )
-    {
-        dt_dprintk(" using 'interrupts-extended' property\n");
-        dt_dprintk(" intspec=%d intsize=%d\n", args.args[0], args.args_count);
-
-        for ( i = 0; i < args.args_count; i++ )
-            args.args[i] = cpu_to_be32(args.args[i]);
-
-        return dt_irq_map_raw(args.np, args.args, args.args_count,
-                              addr, out_irq);
-    }
-
-    /* Get the interrupts property */
-    intspec = dt_get_property(device, "interrupts", &intlen);
-    if ( intspec == NULL )
-        return -EINVAL;
-    intlen /= sizeof(*intspec);
-
-    dt_dprintk(" using 'interrupts' property\n");
-    dt_dprintk(" intspec=%d intlen=%d\n", be32_to_cpup(intspec), intlen);
-
-    /* Look for the interrupt parent. */
-    p = dt_irq_find_parent(device);
-    if ( p == NULL )
-        return -EINVAL;
-
-    /* Get size of interrupt specifier */
-    tmp = dt_get_property(p, "#interrupt-cells", NULL);
-    if ( tmp == NULL )
-        goto out;
-    intsize = be32_to_cpu(*tmp);
-
-    dt_dprintk(" intsize=%d intlen=%d\n", intsize, intlen);
-
-    /* Check index */
-    if ( (index + 1) * intsize > intlen )
-        goto out;
-
-    /* Get new specifier and map it */
-    res = dt_irq_map_raw(p, intspec + index * intsize, intsize,
-                         addr, out_irq);
-    if ( res )
-        goto out;
-out:
-    return res;
-}
-
-int dt_irq_translate(const struct dt_raw_irq *raw,
-                     struct dt_irq *out_irq)
-{
-    ASSERT(dt_irq_xlate != NULL);
-    ASSERT(dt_interrupt_controller != NULL);
-
-    /*
-     * TODO: Retrieve the right irq_xlate. This is only works for the primary
-     * interrupt controller.
-     */
-    if ( raw->controller != dt_interrupt_controller )
-        return -EINVAL;
-
-    return dt_irq_xlate(raw->specifier, raw->size,
-                        &out_irq->irq, &out_irq->type);
-}
-
-int dt_device_get_irq(const struct dt_device_node *device, unsigned int index,
-                      struct dt_irq *out_irq)
-{
-    struct dt_raw_irq raw;
-    int res;
-
-    res = dt_device_get_raw_irq(device, index, &raw);
-
-    if ( res )
-        return res;
-
-    return dt_irq_translate(&raw, out_irq);
-}
-
-bool dt_device_is_available(const struct dt_device_node *device)
-{
-    const char *status;
-    u32 statlen;
-
-    status = dt_get_property(device, "status", &statlen);
-    if ( status == NULL )
-        return 1;
-
-    if ( statlen > 0 )
-    {
-        if ( !strcmp(status, "okay") || !strcmp(status, "ok") )
-            return 1;
-    }
-
-    return 0;
-}
-
-bool dt_device_for_passthrough(const struct dt_device_node *device)
-{
-    return (dt_find_property(device, "xen,passthrough", NULL) != NULL);
-
-}
-
-static int __dt_parse_phandle_with_args(const struct dt_device_node *np,
-                                        const char *list_name,
-                                        const char *cells_name,
-                                        int cell_count, int index,
-                                        struct dt_phandle_args *out_args)
-{
-    const __be32 *list, *list_end;
-    int rc = 0, cur_index = 0;
-    u32 size, count = 0;
-    struct dt_device_node *node = NULL;
-    dt_phandle phandle;
-
-    /* Retrieve the phandle list property */
-    list = dt_get_property(np, list_name, &size);
-    if ( !list )
-        return -ENOENT;
-    list_end = list + size / sizeof(*list);
-
-    /* Loop over the phandles until all the requested entry is found */
-    while ( list < list_end )
-    {
-        rc = -EINVAL;
-        count = 0;
-
-        /*
-         * If phandle is 0, then it is an empty entry with no
-         * arguments.  Skip forward to the next entry.
-         * */
-        phandle = be32_to_cpup(list++);
-        if ( phandle )
-        {
-            /*
-             * Find the provider node and parse the #*-cells
-             * property to determine the argument length.
-             *
-             * This is not needed if the cell count is hard-coded
-             * (i.e. cells_name not set, but cell_count is set),
-             * except when we're going to return the found node
-             * below.
-             */
-            if ( cells_name || cur_index == index )
-            {
-                node = dt_find_node_by_phandle(phandle);
-                if ( !node )
-                {
-                    printk(XENLOG_ERR "%s: could not find phandle\n",
-                           np->full_name);
-                    goto err;
-                }
-            }
-
-            if ( cells_name )
-            {
-                if ( !dt_property_read_u32(node, cells_name, &count) )
-                {
-                    printk("%s: could not get %s for %s\n",
-                           np->full_name, cells_name, node->full_name);
-                    goto err;
-                }
-            }
-            else
-                count = cell_count;
-
-            /*
-             * Make sure that the arguments actually fit in the
-             * remaining property data length
-             */
-            if ( list + count > list_end )
-            {
-                printk(XENLOG_ERR "%s: arguments longer than property\n",
-                       np->full_name);
-                goto err;
-            }
-        }
-
-        /*
-         * All of the error cases above bail out of the loop, so at
-         * this point, the parsing is successful. If the requested
-         * index matches, then fill the out_args structure and return,
-         * or return -ENOENT for an empty entry.
-         */
-        rc = -ENOENT;
-        if ( cur_index == index )
-        {
-            if (!phandle)
-                goto err;
-
-            if ( out_args )
-            {
-                int i;
-
-                WARN_ON(count > MAX_PHANDLE_ARGS);
-                if (count > MAX_PHANDLE_ARGS)
-                    count = MAX_PHANDLE_ARGS;
-                out_args->np = node;
-                out_args->args_count = count;
-                for ( i = 0; i < count; i++ )
-                    out_args->args[i] = be32_to_cpup(list++);
-            }
-
-            /* Found it! return success */
-            return 0;
-        }
-
-        node = NULL;
-        list += count;
-        cur_index++;
-    }
-
-    /*
-     * Returning result will be one of:
-     * -ENOENT : index is for empty phandle
-     * -EINVAL : parsing error on data
-     * [1..n]  : Number of phandle (count mode; when index = -1)
-     */
-    rc = index < 0 ? cur_index : -ENOENT;
-err:
-    return rc;
-}
-
-struct dt_device_node *dt_parse_phandle(const struct dt_device_node *np,
-                                        const char *phandle_name, int index)
-{
-    struct dt_phandle_args args;
-
-    if (index < 0)
-        return NULL;
-
-    if (__dt_parse_phandle_with_args(np, phandle_name, NULL, 0,
-                                     index, &args))
-        return NULL;
-
-    return args.np;
-}
-
-
-int dt_parse_phandle_with_args(const struct dt_device_node *np,
-                               const char *list_name,
-                               const char *cells_name, int index,
-                               struct dt_phandle_args *out_args)
-{
-    if ( index < 0 )
-        return -EINVAL;
-    return __dt_parse_phandle_with_args(np, list_name, cells_name, 0,
-                                        index, out_args);
-}
-
-int dt_count_phandle_with_args(const struct dt_device_node *np,
-                               const char *list_name,
-                               const char *cells_name)
-{
-    return __dt_parse_phandle_with_args(np, list_name, cells_name, 0, -1, NULL);
-}
-
-/**
- * unflatten_dt_node - Alloc and populate a device_node from the flat tree
- * @fdt: The parent device tree blob
- * @mem: Memory chunk to use for allocating device nodes and properties
- * @p: pointer to node in flat tree
- * @dad: Parent struct device_node
- * @allnextpp: pointer to ->allnext from last allocated device_node
- * @fpsize: Size of the node path up at the current depth.
- */
-static unsigned long unflatten_dt_node(const void *fdt,
-                                       unsigned long mem,
-                                       unsigned long *p,
-                                       struct dt_device_node *dad,
-                                       struct dt_device_node ***allnextpp,
-                                       unsigned long fpsize)
-{
-    struct dt_device_node *np;
-    struct dt_property *pp, **prev_pp = NULL;
-    char *pathp;
-    u32 tag;
-    unsigned int l, allocl;
-    int has_name = 0;
-    int new_format = 0;
-
-    tag = be32_to_cpup((__be32 *)(*p));
-    if ( tag != FDT_BEGIN_NODE )
-    {
-        printk(XENLOG_WARNING "Weird tag at start of node: %x\n", tag);
-        return mem;
-    }
-    *p += 4;
-    pathp = (char *)*p;
-    l = allocl = strlen(pathp) + 1;
-    *p = ROUNDUP(*p + l, 4);
-
-    /* version 0x10 has a more compact unit name here instead of the full
-     * path. we accumulate the full path size using "fpsize", we'll rebuild
-     * it later. We detect this because the first character of the name is
-     * not '/'.
-     */
-    if ( (*pathp) != '/' )
-    {
-        new_format = 1;
-        if ( fpsize == 0 )
-        {
-            /* root node: special case. fpsize accounts for path
-             * plus terminating zero. root node only has '/', so
-             * fpsize should be 2, but we want to avoid the first
-             * level nodes to have two '/' so we use fpsize 1 here
-             */
-            fpsize = 1;
-            allocl = 2;
-        }
-        else
-        {
-            /* account for '/' and path size minus terminal 0
-             * already in 'l'
-             */
-            fpsize += l;
-            allocl = fpsize;
-        }
-    }
-
-    np = unflatten_dt_alloc(&mem, sizeof(struct dt_device_node) + allocl,
-                            __alignof__(struct dt_device_node));
-    if ( allnextpp )
-    {
-        memset(np, 0, sizeof(*np));
-        np->full_name = ((char *)np) + sizeof(struct dt_device_node);
-        /* By default dom0 owns the device */
-        np->used_by = 0;
-        /* By default the device is not protected */
-        np->is_protected = false;
-        INIT_LIST_HEAD(&np->domain_list);
-
-        if ( new_format )
-        {
-            char *fn = np->full_name;
-            /* rebuild full path for new format */
-            if ( dad && dad->parent )
-            {
-                strlcpy(fn, dad->full_name, allocl);
-#ifdef DEBUG_DT
-                if ( (strlen(fn) + l + 1) != allocl )
-                {
-                    dt_dprintk("%s: p: %d, l: %d, a: %d\n",
-                               pathp, (int)strlen(fn),
-                               l, allocl);
-                }
-#endif
-                fn += strlen(fn);
-            }
-            *(fn++) = '/';
-            memcpy(fn, pathp, l);
-        }
-        else
-            memcpy(np->full_name, pathp, l);
-        prev_pp = &np->properties;
-        **allnextpp = np;
-        *allnextpp = &np->allnext;
-        if ( dad != NULL )
-        {
-            np->parent = dad;
-            /* we temporarily use the next field as `last_child'*/
-            if ( dad->next == NULL )
-                dad->child = np;
-            else
-                dad->next->sibling = np;
-            dad->next = np;
-        }
-    }
-    /* process properties */
-    while ( 1 )
-    {
-        u32 sz, noff;
-        const char *pname;
-
-        tag = be32_to_cpup((__be32 *)(*p));
-        if ( tag == FDT_NOP )
-        {
-            *p += 4;
-            continue;
-        }
-        if ( tag != FDT_PROP )
-            break;
-        *p += 4;
-        sz = be32_to_cpup((__be32 *)(*p));
-        noff = be32_to_cpup((__be32 *)((*p) + 4));
-        *p += 8;
-        if ( fdt_version(fdt) < 0x10 )
-            *p = ROUNDUP(*p, sz >= 8 ? 8 : 4);
-
-        pname = fdt_string(fdt, noff);
-        if ( pname == NULL )
-        {
-            dt_dprintk("Can't find property name in list!\n");
-            break;
-        }
-        if ( strcmp(pname, "name") == 0 )
-            has_name = 1;
-        l = strlen(pname) + 1;
-        pp = unflatten_dt_alloc(&mem, sizeof(struct dt_property),
-                                __alignof__(struct dt_property));
-        if ( allnextpp )
-        {
-            /* We accept flattened tree phandles either in
-             * ePAPR-style "phandle" properties, or the
-             * legacy "linux,phandle" properties.  If both
-             * appear and have different values, things
-             * will get weird.  Don't do that. */
-            if ( (strcmp(pname, "phandle") == 0) ||
-                 (strcmp(pname, "linux,phandle") == 0) )
-            {
-                if ( np->phandle == 0 )
-                    np->phandle = be32_to_cpup((__be32*)*p);
-            }
-            /* And we process the "ibm,phandle" property
-             * used in pSeries dynamic device tree
-             * stuff */
-            if ( strcmp(pname, "ibm,phandle") == 0 )
-                np->phandle = be32_to_cpup((__be32 *)*p);
-            pp->name = pname;
-            pp->length = sz;
-            pp->value = (void *)*p;
-            *prev_pp = pp;
-            prev_pp = &pp->next;
-        }
-        *p = ROUNDUP((*p) + sz, 4);
-    }
-    /* with version 0x10 we may not have the name property, recreate
-     * it here from the unit name if absent
-     */
-    if ( !has_name )
-    {
-        char *p1 = pathp, *ps = pathp, *pa = NULL;
-        int sz;
-
-        while ( *p1 )
-        {
-            if ( (*p1) == '@' )
-                pa = p1;
-            if ( (*p1) == '/' )
-                ps = p1 + 1;
-            p1++;
-        }
-        if ( pa < ps )
-            pa = p1;
-        sz = (pa - ps) + 1;
-        pp = unflatten_dt_alloc(&mem, sizeof(struct dt_property) + sz,
-                                __alignof__(struct dt_property));
-        if ( allnextpp )
-        {
-            pp->name = "name";
-            pp->length = sz;
-            pp->value = pp + 1;
-            /*
-             * The device tree creation code assume that the property
-             * "name" is not a fake.
-             * To avoid a big divergence with Linux code, only remove
-             * property link. In this case we will lose a bit of memory
-             */
-#if 0
-            *prev_pp = pp;
-            prev_pp = &pp->next;
-#endif
-            np->name = pp->value;
-            memcpy(pp->value, ps, sz - 1);
-            ((char *)pp->value)[sz - 1] = 0;
-            dt_dprintk("fixed up name for %s -> %s\n", pathp,
-                       (char *)pp->value);
-            /* Generic device initialization */
-            np->dev.type = DEV_DT;
-            np->dev.of_node = np;
-        }
-    }
-    if ( allnextpp )
-    {
-        *prev_pp = NULL;
-        np->name = (np->name) ? : dt_get_property(np, "name", NULL);
-        np->type = dt_get_property(np, "device_type", NULL);
-
-        if ( !np->name )
-            np->name = "<NULL>";
-        if ( !np->type )
-            np->type = "<NULL>";
-    }
-    while ( tag == FDT_BEGIN_NODE || tag == FDT_NOP )
-    {
-        if ( tag == FDT_NOP )
-            *p += 4;
-        else
-            mem = unflatten_dt_node(fdt, mem, p, np, allnextpp, fpsize);
-        tag = be32_to_cpup((__be32 *)(*p));
-    }
-    if ( tag != FDT_END_NODE )
-    {
-        printk(XENLOG_WARNING "Weird tag at end of node: %x\n", tag);
-        return mem;
-    }
-
-    *p += 4;
-    return mem;
-}
-
-int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
-{
-    unsigned long start, mem, size;
-    struct dt_device_node **allnextp = mynodes;
-
-    dt_dprintk(" -> unflatten_device_tree()\n");
-
-    dt_dprintk("Unflattening device tree:\n");
-    dt_dprintk("magic: %#08x\n", fdt_magic(fdt));
-    dt_dprintk("size: %#08x\n", fdt_totalsize(fdt));
-    dt_dprintk("version: %#08x\n", fdt_version(fdt));
-
-    /* First pass, scan for size */
-    start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
-    size = unflatten_dt_node(fdt, 0, &start, NULL, NULL, 0);
-    if ( !size )
-        return -EINVAL;
-
-    size = (size | 3) + 1;
-
-    dt_dprintk("  size is %#lx allocating...\n", size);
-
-    /* Allocate memory for the expanded device tree */
-    mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
-    if ( !mem )
-        return -ENOMEM;
-
-    ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeefU);
-
-    dt_dprintk("  unflattening %lx...\n", mem);
-
-    /* Second pass, do actual unflattening */
-    start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
-    unflatten_dt_node(fdt, mem, &start, NULL, &allnextp, 0);
-    if ( be32_to_cpup((__be32 *)start) != FDT_END )
-    {
-        printk(XENLOG_ERR "Weird tag at end of tree: %08x\n",
-                  *((u32 *)start));
-        xfree((void *)mem);
-        return -EINVAL;
-    }
-
-    if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeefU )
-    {
-        printk(XENLOG_ERR "End of tree marker overwritten: %08x\n",
-                  be32_to_cpu(((__be32 *)mem)[size / 4]));
-        xfree((void *)mem);
-        return -EINVAL;
-    }
-
-    *allnextp = NULL;
-
-    dt_dprintk(" <- unflatten_device_tree()\n");
-
-    return 0;
-}
-
-static void dt_alias_add(struct dt_alias_prop *ap,
-                         struct dt_device_node *np,
-                         int id, const char *stem, int stem_len)
-{
-    ap->np = np;
-    ap->id = id;
-    strlcpy(ap->stem, stem, stem_len + 1);
-    list_add_tail(&ap->link, &aliases_lookup);
-    dt_dprintk("adding DT alias:%s: stem=%s id=%d node=%s\n",
-               ap->alias, ap->stem, ap->id, dt_node_full_name(np));
-}
-
-/**
- * dt_alias_scan - Scan all properties of 'aliases' node
- *
- * The function scans all the properties of 'aliases' node and populate
- * the the global lookup table with the properties.  It returns the
- * number of alias_prop found, or error code in error case.
- */
-static void __init dt_alias_scan(void)
-{
-    const struct dt_property *pp;
-    const struct dt_device_node *aliases;
-
-    aliases = dt_find_node_by_path("/aliases");
-    if ( !aliases )
-        return;
-
-    dt_for_each_property_node( aliases, pp )
-    {
-        const char *start = pp->name;
-        const char *end = start + strlen(start);
-        struct dt_device_node *np;
-        struct dt_alias_prop *ap;
-        int id, len;
-
-        /* Skip those we do not want to proceed */
-        if ( !strcmp(pp->name, "name") ||
-             !strcmp(pp->name, "phandle") ||
-             !strcmp(pp->name, "linux,phandle") )
-            continue;
-
-        np = dt_find_node_by_path(pp->value);
-        if ( !np )
-            continue;
-
-        /* walk the alias backwards to extract the id and work out
-         * the 'stem' string */
-        while ( isdigit(*(end-1)) && end > start )
-            end--;
-        len = end - start;
-
-        id = simple_strtoll(end, NULL, 10);
-
-        /* Allocate an alias_prop with enough space for the stem */
-        ap = _xmalloc(sizeof(*ap) + len + 1, 4);
-        if ( !ap )
-            continue;
-        ap->alias = start;
-        dt_alias_add(ap, np, id, start, len);
-    }
-}
-
-struct dt_device_node * __init
-dt_find_interrupt_controller(const struct dt_device_match *matches)
-{
-    struct dt_device_node *np = NULL;
-
-    while ( (np = dt_find_matching_node(np, matches)) )
-    {
-        if ( !dt_find_property(np, "interrupt-controller", NULL) )
-            continue;
-
-        if ( dt_get_parent(np) )
-            break;
-    }
-
-    return np;
-}
-
-void __init dt_unflatten_host_device_tree(void)
-{
-    int error = unflatten_device_tree(device_tree_flattened, &dt_host);
-
-    if ( error )
-        panic("unflatten_device_tree failed with error %d\n", error);
-
-    dt_alias_scan();
-}
-
-int dt_get_pci_domain_nr(struct dt_device_node *node)
-{
-    u32 domain;
-    int error;
-
-    error = dt_property_read_u32(node, "linux,pci-domain", &domain);
-    if ( !error )
-        return -EINVAL;
-
-    return (u16)domain;
-}
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
new file mode 100644
index 0000000000..c39428d5f5
--- /dev/null
+++ b/xen/include/xen/bootfdt.h
@@ -0,0 +1,195 @@
+#ifndef XEN_BOOTFDT_H
+#define XEN_BOOTFDT_H
+
+#include <xen/types.h>
+#include <xen/kernel.h>
+#include <xen/macros.h>
+
+#define MIN_FDT_ALIGN 8
+
+#define NR_MEM_BANKS 256
+#define NR_SHMEM_BANKS 32
+
+#define MAX_MODULES 32 /* Current maximum useful modules */
+
+typedef enum {
+    BOOTMOD_XEN,
+    BOOTMOD_FDT,
+    BOOTMOD_KERNEL,
+    BOOTMOD_RAMDISK,
+    BOOTMOD_XSM,
+    BOOTMOD_GUEST_DTB,
+    BOOTMOD_UNKNOWN
+}  bootmodule_kind;
+
+enum membank_type {
+    /*
+     * The MEMBANK_DEFAULT type refers to either reserved memory for the
+     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
+     * the bank is in 'mem').
+     */
+    MEMBANK_DEFAULT,
+    /*
+     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the memory
+     * bank is bound to a static Xen domain. It is only valid when the bank
+     * is in reserved_mem.
+     */
+    MEMBANK_STATIC_DOMAIN,
+    /*
+     * The MEMBANK_STATIC_HEAP type is used to indicate whether the memory
+     * bank is reserved as static heap. It is only valid when the bank is
+     * in reserved_mem.
+     */
+    MEMBANK_STATIC_HEAP,
+    /*
+     * The MEMBANK_FDT_RESVMEM type is used to indicate whether the memory
+     * bank is from the FDT reserve map.
+     */
+    MEMBANK_FDT_RESVMEM,
+};
+
+/* Indicates the maximum number of characters(\0 included) for shm_id */
+#define MAX_SHM_ID_LENGTH 16
+
+struct shmem_membank_extra {
+    char shm_id[MAX_SHM_ID_LENGTH];
+    unsigned int nr_shm_borrowers;
+};
+
+struct membank {
+    paddr_t start;
+    paddr_t size;
+    union {
+        enum membank_type type;
+#ifdef CONFIG_STATIC_SHM
+        struct shmem_membank_extra *shmem_extra;
+#endif
+    };
+};
+
+struct membanks {
+    __struct_group(membanks_hdr, common, ,
+        unsigned int nr_banks;
+        unsigned int max_banks;
+    );
+    struct membank bank[];
+};
+
+struct meminfo {
+    struct membanks_hdr common;
+    struct membank bank[NR_MEM_BANKS];
+};
+
+struct shared_meminfo {
+    struct membanks_hdr common;
+    struct membank bank[NR_SHMEM_BANKS];
+    struct shmem_membank_extra extra[NR_SHMEM_BANKS];
+};
+
+/*
+ * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
+ * The purpose of the domU flag is to avoid getting confused in
+ * kernel_probe, where we try to guess which is the dom0 kernel and
+ * initrd to be compatible with all versions of the multiboot spec.
+ */
+#define BOOTMOD_MAX_CMDLINE 1024
+struct bootmodule {
+    bootmodule_kind kind;
+    bool domU;
+    paddr_t start;
+    paddr_t size;
+};
+
+/* DT_MAX_NAME is the node name max length according the DT spec */
+#define DT_MAX_NAME 41
+struct bootcmdline {
+    bootmodule_kind kind;
+    bool domU;
+    paddr_t start;
+    char dt_name[DT_MAX_NAME];
+    char cmdline[BOOTMOD_MAX_CMDLINE];
+};
+
+struct bootmodules {
+    int nr_mods;
+    struct bootmodule module[MAX_MODULES];
+};
+
+struct bootcmdlines {
+    unsigned int nr_mods;
+    struct bootcmdline cmdline[MAX_MODULES];
+};
+
+struct bootinfo {
+    struct meminfo mem;
+    /* The reserved regions are only used when booting using Device-Tree */
+    struct meminfo reserved_mem;
+    struct bootmodules modules;
+    struct bootcmdlines cmdlines;
+#ifdef CONFIG_ACPI
+    struct meminfo acpi;
+#endif
+#ifdef CONFIG_STATIC_SHM
+    struct shared_meminfo shmem;
+#endif
+    bool static_heap;
+};
+
+#ifdef CONFIG_ACPI
+#define BOOTINFO_ACPI_INIT .acpi.common.max_banks = NR_MEM_BANKS,
+#else
+#define BOOTINFO_ACPI_INIT
+#endif
+
+#ifdef CONFIG_STATIC_SHM
+#define BOOTINFO_SHMEM_INIT .shmem.common.max_banks = NR_SHMEM_BANKS,
+#else
+#define BOOTINFO_SHMEM_INIT
+#endif
+
+#define BOOTINFO_INIT                               \
+{                                                   \
+    .mem.common.max_banks = NR_MEM_BANKS,           \
+    .reserved_mem.common.max_banks = NR_MEM_BANKS,  \
+    BOOTINFO_ACPI_INIT                              \
+    BOOTINFO_SHMEM_INIT                             \
+}
+
+extern struct bootinfo bootinfo;
+
+void populate_boot_allocator(void);
+
+size_t boot_fdt_info(const void *fdt, paddr_t paddr);
+
+const char *boot_fdt_cmdline(const void *fdt);
+
+static inline struct membanks *bootinfo_get_reserved_mem(void)
+{
+    return container_of(&bootinfo.reserved_mem.common, struct membanks, common);
+}
+
+static inline struct membanks *bootinfo_get_mem(void)
+{
+    return container_of(&bootinfo.mem.common, struct membanks, common);
+}
+
+#ifdef CONFIG_ACPI
+static inline struct membanks *bootinfo_get_acpi(void)
+{
+    return container_of(&bootinfo.acpi.common, struct membanks, common);
+}
+#endif
+
+#ifdef CONFIG_STATIC_SHM
+static inline struct membanks *bootinfo_get_shmem(void)
+{
+    return container_of(&bootinfo.shmem.common, struct membanks, common);
+}
+
+static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
+{
+    return bootinfo.shmem.extra;
+}
+#endif
+
+#endif /* XEN_BOOTFDT_H */
-- 
2.45.2


