Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C2D92595B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 12:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752893.1161159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOxS4-0004YJ-2g; Wed, 03 Jul 2024 10:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752893.1161159; Wed, 03 Jul 2024 10:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOxS3-0004OA-Tz; Wed, 03 Jul 2024 10:43:03 +0000
Received: by outflank-mailman (input) for mailman id 752893;
 Wed, 03 Jul 2024 10:43:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAj5=OD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOxS1-0003lU-HK
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 10:43:01 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 034d3f08-3929-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 12:42:58 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a72510ebc3fso779356966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 03:42:58 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b92985desm414590066b.78.2024.07.03.03.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 03:42:56 -0700 (PDT)
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
X-Inumbo-ID: 034d3f08-3929-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720003377; x=1720608177; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+mmgGHkom1l7cI0McTp9fFuVf4sNnNnUkwvunhTG0Y=;
        b=ZvsTNERvTIZLc3ib+aZSYJeXNty4K0fT3HQe+e57LUCZttucm8WDeel1S8JcehvmW/
         iiK5jWOZIWE08J6vOWjua8z9wgKSv5tpj/xewnuVUcP/le662RNzRb/NTRlDzll7cMSx
         8lZxKruRF3UAM9YP8oq6FTOhq2OJi2tLDJCzzSNzHlMIwTDK1+BNdAXjE5dgrNBQsap6
         UJOh2IaTqmLvjj6qux/biV8HeOucw3VLdcHOoVgWWV8+Wenn0YPG2dNJj7p9T3/oZzpM
         IOFzI+35VPRnzTQy7sZgZsVJNMwMFLsZpL1NO6925HSliBkasKODZ/S8iJucf//eJo0q
         qbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003377; x=1720608177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+mmgGHkom1l7cI0McTp9fFuVf4sNnNnUkwvunhTG0Y=;
        b=X6/mJuIxXWIdXnTbOQO2Os0mCelkNDparRzUvDKqqkKmwRV5olzwWiN5t2TbQWmhII
         zHr61UuM4ys7IcE4sfng0jPGNARnpI+b/yn9QNf6FVZo1Y/DNxvRHgaSZO64m4u4pMpa
         VI3Vwz4Ae2gw4aENRr9Uq+Ip+JFofmQBZrhMC8+tDy1hbzjz/LWfG5Dxb6hJtnUpoOHr
         1BQ7iPVYwmSTmE14CytpQGO84/wgL14VWX9VFZ+BZEFosLkd4z3fUORMN1YnepKiPljy
         SnHN+x4LT3yZLKreKZRDOka7rfD4iRhP8bMdVbzLQrXdmDrFhrDPyd8Wu+JkFIirkTmj
         6BfA==
X-Gm-Message-State: AOJu0YwKJFh045ScFjOaO6pF9LtSAW0IxIL3EybdFbRpgf5kWCDMkvZ+
	TnQ2I1cobYcNNaVFf25mK0mZLQi3clZgivNJgjkL0PIf8/ozeKYDZU17iol1
X-Google-Smtp-Source: AGHT+IHo5wfe88NVcKg1QTI0+ivZkcs5iviIbnSNAj5T6oz5egI7thHfnYgeJ3GbwNv0rlRSFNNaBw==
X-Received: by 2002:a17:907:7242:b0:a69:67e3:57f6 with SMTP id a640c23a62f3a-a751443c678mr881716566b.5.1720003377078;
        Wed, 03 Jul 2024 03:42:57 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v1 2/5] xen/common: Move Arm's bootfdt.c to common
Date: Wed,  3 Jul 2024 12:42:48 +0200
Message-ID: <c7f446b73038a4153f9e8c3e931f29630232e472.1720002425.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720002425.git.oleksii.kurochko@gmail.com>
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shawn Anastasio <sanastasio@raptorengineering.com>

Move Arm's bootfdt.c to xen/common so that it can be used by other
device tree architectures like PPC and RISCV.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Acked-by: Julien Grall <julien@xen.org>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v5:
 - add guard #ifdef CONFIG_STATIC_SHM around inclusion of <asm/static-shmem.h>
   in common/device-tree/bootfdt.c.
 - add stub for process_shm_node() in case CONFIG_STATIC_SHM isn't enabled.
 - add guard around #ifdef CONFIG_STATIC_SHM aroud early_print_info_shmem() in
   early_print_info().
---
Changes in v4:
  - move function prototypes to patch 2's xen/include/bootfdt.h
  - clean up #includes
---
 xen/arch/arm/Makefile            |   1 -
 xen/arch/arm/bootfdt.c           | 622 ------------------------------
 xen/arch/arm/include/asm/setup.h |  13 -
 xen/common/device-tree/Makefile  |   1 +
 xen/common/device-tree/bootfdt.c | 635 +++++++++++++++++++++++++++++++
 xen/include/xen/bootfdt.h        |  14 +
 6 files changed, 650 insertions(+), 636 deletions(-)
 delete mode 100644 xen/arch/arm/bootfdt.c
 create mode 100644 xen/common/device-tree/bootfdt.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 45dc29ea53..da9c979dc4 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -10,7 +10,6 @@ obj-$(CONFIG_TEE) += tee/
 obj-$(CONFIG_HAS_VPCI) += vpci.o
 
 obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
-obj-y += bootfdt.init.o
 obj-y += cpuerrata.o
 obj-y += cpufeature.o
 obj-y += decode.o
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
deleted file mode 100644
index 6e060111d9..0000000000
--- a/xen/arch/arm/bootfdt.c
+++ /dev/null
@@ -1,622 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Early Device Tree
- *
- * Copyright (C) 2012-2014 Citrix Systems, Inc.
- */
-#include <xen/types.h>
-#include <xen/lib.h>
-#include <xen/kernel.h>
-#include <xen/init.h>
-#include <xen/efi.h>
-#include <xen/device_tree.h>
-#include <xen/lib.h>
-#include <xen/libfdt/libfdt-xen.h>
-#include <xen/sort.h>
-#include <xsm/xsm.h>
-#include <asm/setup.h>
-#include <asm/static-shmem.h>
-
-static void __init __maybe_unused build_assertions(void)
-{
-    /*
-     * Check that no padding is between struct membanks "bank" flexible array
-     * member and struct meminfo "bank" member
-     */
-    BUILD_BUG_ON((offsetof(struct membanks, bank) !=
-                 offsetof(struct meminfo, bank)));
-    /* Ensure "struct membanks" is 8-byte aligned */
-    BUILD_BUG_ON(alignof(struct membanks) != 8);
-}
-
-static bool __init device_tree_node_is_available(const void *fdt, int node)
-{
-    const char *status;
-    int len;
-
-    status = fdt_getprop(fdt, node, "status", &len);
-    if ( !status )
-        return true;
-
-    if ( len > 0 )
-    {
-        if ( !strcmp(status, "ok") || !strcmp(status, "okay") )
-            return true;
-    }
-
-    return false;
-}
-
-static bool __init device_tree_node_matches(const void *fdt, int node,
-                                            const char *match)
-{
-    const char *name;
-    size_t match_len;
-
-    name = fdt_get_name(fdt, node, NULL);
-    match_len = strlen(match);
-
-    /* Match both "match" and "match@..." patterns but not
-       "match-foo". */
-    return strncmp(name, match, match_len) == 0
-        && (name[match_len] == '@' || name[match_len] == '\0');
-}
-
-static bool __init device_tree_node_compatible(const void *fdt, int node,
-                                               const char *match)
-{
-    int len, l;
-    const void *prop;
-
-    prop = fdt_getprop(fdt, node, "compatible", &len);
-    if ( prop == NULL )
-        return false;
-
-    while ( len > 0 ) {
-        if ( !dt_compat_cmp(prop, match) )
-            return true;
-        l = strlen(prop) + 1;
-        prop += l;
-        len -= l;
-    }
-
-    return false;
-}
-
-void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
-                                uint32_t size_cells, paddr_t *start,
-                                paddr_t *size)
-{
-    uint64_t dt_start, dt_size;
-
-    /*
-     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-bit.
-     * Thus, there is an implicit cast from uint64_t to paddr_t.
-     */
-    dt_start = dt_next_cell(address_cells, cell);
-    dt_size = dt_next_cell(size_cells, cell);
-
-    if ( dt_start != (paddr_t)dt_start )
-    {
-        printk("Physical address greater than max width supported\n");
-        WARN();
-    }
-
-    if ( dt_size != (paddr_t)dt_size )
-    {
-        printk("Physical size greater than max width supported\n");
-        WARN();
-    }
-
-    /*
-     * Xen will truncate the address/size if it is greater than the maximum
-     * supported width and it will give an appropriate warning.
-     */
-    *start = dt_start;
-    *size = dt_size;
-}
-
-static int __init device_tree_get_meminfo(const void *fdt, int node,
-                                          const char *prop_name,
-                                          u32 address_cells, u32 size_cells,
-                                          struct membanks *mem,
-                                          enum membank_type type)
-{
-    const struct fdt_property *prop;
-    unsigned int i, banks;
-    const __be32 *cell;
-    u32 reg_cells = address_cells + size_cells;
-    paddr_t start, size;
-
-    if ( !device_tree_node_is_available(fdt, node) )
-        return 0;
-
-    if ( address_cells < 1 || size_cells < 1 )
-    {
-        printk("fdt: property `%s': invalid #address-cells or #size-cells",
-               prop_name);
-        return -EINVAL;
-    }
-
-    prop = fdt_get_property(fdt, node, prop_name, NULL);
-    if ( !prop )
-        return -ENOENT;
-
-    cell = (const __be32 *)prop->data;
-    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
-
-    for ( i = 0; i < banks && mem->nr_banks < mem->max_banks; i++ )
-    {
-        device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
-        if ( mem == bootinfo_get_reserved_mem() &&
-             check_reserved_regions_overlap(start, size) )
-            return -EINVAL;
-        /* Some DT may describe empty bank, ignore them */
-        if ( !size )
-            continue;
-        mem->bank[mem->nr_banks].start = start;
-        mem->bank[mem->nr_banks].size = size;
-        mem->bank[mem->nr_banks].type = type;
-        mem->nr_banks++;
-    }
-
-    if ( i < banks )
-    {
-        printk("Warning: Max number of supported memory regions reached.\n");
-        return -ENOSPC;
-    }
-
-    return 0;
-}
-
-u32 __init device_tree_get_u32(const void *fdt, int node,
-                               const char *prop_name, u32 dflt)
-{
-    const struct fdt_property *prop;
-
-    prop = fdt_get_property(fdt, node, prop_name, NULL);
-    if ( !prop || prop->len < sizeof(u32) )
-        return dflt;
-
-    return fdt32_to_cpu(*(uint32_t*)prop->data);
-}
-
-/**
- * device_tree_for_each_node - iterate over all device tree sub-nodes
- * @fdt: flat device tree.
- * @node: parent node to start the search from
- * @func: function to call for each sub-node.
- * @data: data to pass to @func.
- *
- * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
- *
- * Returns 0 if all nodes were iterated over successfully.  If @func
- * returns a value different from 0, that value is returned immediately.
- */
-int __init device_tree_for_each_node(const void *fdt, int node,
-                                     device_tree_node_func func,
-                                     void *data)
-{
-    /*
-     * We only care about relative depth increments, assume depth of
-     * node is 0 for simplicity.
-     */
-    int depth = 0;
-    const int first_node = node;
-    u32 address_cells[DEVICE_TREE_MAX_DEPTH];
-    u32 size_cells[DEVICE_TREE_MAX_DEPTH];
-    int ret;
-
-    do {
-        const char *name = fdt_get_name(fdt, node, NULL);
-        u32 as, ss;
-
-        if ( depth >= DEVICE_TREE_MAX_DEPTH )
-        {
-            printk("Warning: device tree node `%s' is nested too deep\n",
-                   name);
-            continue;
-        }
-
-        as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
-        ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
-
-        address_cells[depth] = device_tree_get_u32(fdt, node,
-                                                   "#address-cells", as);
-        size_cells[depth] = device_tree_get_u32(fdt, node,
-                                                "#size-cells", ss);
-
-        /* skip the first node */
-        if ( node != first_node )
-        {
-            ret = func(fdt, node, name, depth, as, ss, data);
-            if ( ret != 0 )
-                return ret;
-        }
-
-        node = fdt_next_node(fdt, node, &depth);
-    } while ( node >= 0 && depth > 0 );
-
-    return 0;
-}
-
-static int __init process_memory_node(const void *fdt, int node,
-                                      const char *name, int depth,
-                                      u32 address_cells, u32 size_cells,
-                                      struct membanks *mem)
-{
-    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
-                                   mem, MEMBANK_DEFAULT);
-}
-
-static int __init process_reserved_memory_node(const void *fdt, int node,
-                                               const char *name, int depth,
-                                               u32 address_cells,
-                                               u32 size_cells,
-                                               void *data)
-{
-    int rc = process_memory_node(fdt, node, name, depth, address_cells,
-                                 size_cells, data);
-
-    if ( rc == -ENOSPC )
-        panic("Max number of supported reserved-memory regions reached.\n");
-    else if ( rc != -ENOENT )
-        return rc;
-    return 0;
-}
-
-static int __init process_reserved_memory(const void *fdt, int node,
-                                          const char *name, int depth,
-                                          u32 address_cells, u32 size_cells)
-{
-    return device_tree_for_each_node(fdt, node,
-                                     process_reserved_memory_node,
-                                     bootinfo_get_reserved_mem());
-}
-
-static void __init process_multiboot_node(const void *fdt, int node,
-                                          const char *name,
-                                          u32 address_cells, u32 size_cells)
-{
-    static int __initdata kind_guess = 0;
-    const struct fdt_property *prop;
-    const __be32 *cell;
-    bootmodule_kind kind;
-    paddr_t start, size;
-    int len;
-    /* sizeof("/chosen/") + DT_MAX_NAME + '/' + DT_MAX_NAME + '/0' => 92 */
-    char path[92];
-    int parent_node, ret;
-    bool domU;
-
-    parent_node = fdt_parent_offset(fdt, node);
-    ASSERT(parent_node >= 0);
-
-    /* Check that the node is under "/chosen" (first 7 chars of path) */
-    ret = fdt_get_path(fdt, node, path, sizeof (path));
-    if ( ret != 0 || strncmp(path, "/chosen", 7) )
-        return;
-
-    prop = fdt_get_property(fdt, node, "reg", &len);
-    if ( !prop )
-        panic("node %s missing `reg' property\n", name);
-
-    if ( len < dt_cells_to_size(address_cells + size_cells) )
-        panic("fdt: node `%s': `reg` property length is too short\n",
-                    name);
-
-    cell = (const __be32 *)prop->data;
-    device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
-
-    if ( fdt_node_check_compatible(fdt, node, "xen,linux-zimage") == 0 ||
-         fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
-        kind = BOOTMOD_KERNEL;
-    else if ( fdt_node_check_compatible(fdt, node, "xen,linux-initrd") == 0 ||
-              fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
-        kind = BOOTMOD_RAMDISK;
-    else if ( fdt_node_check_compatible(fdt, node, "xen,xsm-policy") == 0 )
-        kind = BOOTMOD_XSM;
-    else if ( fdt_node_check_compatible(fdt, node, "multiboot,device-tree") == 0 )
-        kind = BOOTMOD_GUEST_DTB;
-    else
-        kind = BOOTMOD_UNKNOWN;
-
-    /**
-     * Guess the kind of these first two unknowns respectively:
-     * (1) The first unknown must be kernel.
-     * (2) Detect the XSM Magic from the 2nd unknown:
-     *     a. If it's XSM, set the kind as XSM, and that also means we
-     *     won't load ramdisk;
-     *     b. if it's not XSM, set the kind as ramdisk.
-     *     So if user want to load ramdisk, it must be the 2nd unknown.
-     * We also detect the XSM Magic for the following unknowns,
-     * then set its kind according to the return value of has_xsm_magic.
-     */
-    if ( kind == BOOTMOD_UNKNOWN )
-    {
-        switch ( kind_guess++ )
-        {
-        case 0: kind = BOOTMOD_KERNEL; break;
-        case 1: kind = BOOTMOD_RAMDISK; break;
-        default: break;
-        }
-        if ( kind_guess > 1 && has_xsm_magic(start) )
-            kind = BOOTMOD_XSM;
-    }
-
-    domU = fdt_node_check_compatible(fdt, parent_node, "xen,domain") == 0;
-    add_boot_module(kind, start, size, domU);
-
-    prop = fdt_get_property(fdt, node, "bootargs", &len);
-    if ( !prop )
-        return;
-    add_boot_cmdline(fdt_get_name(fdt, parent_node, &len), prop->data,
-                     kind, start, domU);
-}
-
-static int __init process_chosen_node(const void *fdt, int node,
-                                      const char *name,
-                                      u32 address_cells, u32 size_cells)
-{
-    const struct fdt_property *prop;
-    paddr_t start, end;
-    int len;
-
-    if ( fdt_get_property(fdt, node, "xen,static-heap", NULL) )
-    {
-        int rc;
-
-        printk("Checking for static heap in /chosen\n");
-
-        rc = device_tree_get_meminfo(fdt, node, "xen,static-heap",
-                                     address_cells, size_cells,
-                                     bootinfo_get_reserved_mem(),
-                                     MEMBANK_STATIC_HEAP);
-        if ( rc )
-            return rc;
-
-        bootinfo.static_heap = true;
-    }
-
-    printk("Checking for initrd in /chosen\n");
-
-    prop = fdt_get_property(fdt, node, "linux,initrd-start", &len);
-    if ( !prop )
-        /* No initrd present. */
-        return 0;
-    if ( len != sizeof(u32) && len != sizeof(u64) )
-    {
-        printk("linux,initrd-start property has invalid length %d\n", len);
-        return -EINVAL;
-    }
-    start = dt_read_paddr((const void *)&prop->data, dt_size_to_cells(len));
-
-    prop = fdt_get_property(fdt, node, "linux,initrd-end", &len);
-    if ( !prop )
-    {
-        printk("linux,initrd-end not present but -start was\n");
-        return -EINVAL;
-    }
-    if ( len != sizeof(u32) && len != sizeof(u64) )
-    {
-        printk("linux,initrd-end property has invalid length %d\n", len);
-        return -EINVAL;
-    }
-    end = dt_read_paddr((const void *)&prop->data, dt_size_to_cells(len));
-
-    if ( start >= end )
-    {
-        printk("linux,initrd limits invalid: %"PRIpaddr" >= %"PRIpaddr"\n",
-                  start, end);
-        return -EINVAL;
-    }
-
-    printk("Initrd %"PRIpaddr"-%"PRIpaddr"\n", start, end);
-
-    add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
-
-    return 0;
-}
-
-static int __init process_domain_node(const void *fdt, int node,
-                                      const char *name,
-                                      u32 address_cells, u32 size_cells)
-{
-    const struct fdt_property *prop;
-
-    printk("Checking for \"xen,static-mem\" in domain node\n");
-
-    prop = fdt_get_property(fdt, node, "xen,static-mem", NULL);
-    if ( !prop )
-        /* No "xen,static-mem" present. */
-        return 0;
-
-    return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
-                                   size_cells, bootinfo_get_reserved_mem(),
-                                   MEMBANK_STATIC_DOMAIN);
-}
-
-static int __init early_scan_node(const void *fdt,
-                                  int node, const char *name, int depth,
-                                  u32 address_cells, u32 size_cells,
-                                  void *data)
-{
-    int rc = 0;
-
-    /*
-     * If Xen has been booted via UEFI, the memory banks are
-     * populated. So we should skip the parsing.
-     */
-    if ( !efi_enabled(EFI_BOOT) &&
-         device_tree_node_matches(fdt, node, "memory") )
-        rc = process_memory_node(fdt, node, name, depth,
-                                 address_cells, size_cells, bootinfo_get_mem());
-    else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
-        rc = process_reserved_memory(fdt, node, name, depth,
-                                     address_cells, size_cells);
-    else if ( depth <= 3 && (device_tree_node_compatible(fdt, node, "xen,multiboot-module" ) ||
-              device_tree_node_compatible(fdt, node, "multiboot,module" )))
-        process_multiboot_node(fdt, node, name, address_cells, size_cells);
-    else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
-        rc = process_chosen_node(fdt, node, name, address_cells, size_cells);
-    else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
-        rc = process_domain_node(fdt, node, name, address_cells, size_cells);
-    else if ( depth <= 3 && device_tree_node_compatible(fdt, node, "xen,domain-shared-memory-v1") )
-        rc = process_shm_node(fdt, node, address_cells, size_cells);
-
-    if ( rc < 0 )
-        printk("fdt: node `%s': parsing failed\n", name);
-    return rc;
-}
-
-static void __init early_print_info(void)
-{
-    const struct membanks *mi = bootinfo_get_mem();
-    const struct membanks *mem_resv = bootinfo_get_reserved_mem();
-    struct bootmodules *mods = &bootinfo.modules;
-    struct bootcmdlines *cmds = &bootinfo.cmdlines;
-    unsigned int i;
-
-    for ( i = 0; i < mi->nr_banks; i++ )
-        printk("RAM: %"PRIpaddr" - %"PRIpaddr"\n",
-                mi->bank[i].start,
-                mi->bank[i].start + mi->bank[i].size - 1);
-    printk("\n");
-    for ( i = 0 ; i < mods->nr_mods; i++ )
-        printk("MODULE[%d]: %"PRIpaddr" - %"PRIpaddr" %-12s\n",
-                i,
-                mods->module[i].start,
-                mods->module[i].start + mods->module[i].size,
-                boot_module_kind_as_string(mods->module[i].kind));
-
-    for ( i = 0; i < mem_resv->nr_banks; i++ )
-    {
-        printk(" RESVD[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i,
-               mem_resv->bank[i].start,
-               mem_resv->bank[i].start + mem_resv->bank[i].size - 1);
-    }
-    early_print_info_shmem();
-    printk("\n");
-    for ( i = 0 ; i < cmds->nr_mods; i++ )
-        printk("CMDLINE[%"PRIpaddr"]:%s %s\n", cmds->cmdline[i].start,
-               cmds->cmdline[i].dt_name,
-               &cmds->cmdline[i].cmdline[0]);
-    printk("\n");
-}
-
-/* This function assumes that memory regions are not overlapped */
-static int __init cmp_memory_node(const void *key, const void *elem)
-{
-    const struct membank *handler0 = key;
-    const struct membank *handler1 = elem;
-
-    if ( handler0->start < handler1->start )
-        return -1;
-
-    if ( handler0->start >= (handler1->start + handler1->size) )
-        return 1;
-
-    return 0;
-}
-
-static void __init swap_memory_node(void *_a, void *_b, size_t size)
-{
-    struct membank *a = _a, *b = _b;
-
-    SWAP(*a, *b);
-}
-
-/**
- * boot_fdt_info - initialize bootinfo from a DTB
- * @fdt: flattened device tree binary
- *
- * Returns the size of the DTB.
- */
-size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
-{
-    struct membanks *reserved_mem = bootinfo_get_reserved_mem();
-    struct membanks *mem = bootinfo_get_mem();
-    unsigned int i;
-    int nr_rsvd;
-    int ret;
-
-    ret = fdt_check_header(fdt);
-    if ( ret < 0 )
-        panic("No valid device tree\n");
-
-    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
-
-    nr_rsvd = fdt_num_mem_rsv(fdt);
-    if ( nr_rsvd < 0 )
-        panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
-
-    for ( i = 0; i < nr_rsvd; i++ )
-    {
-        struct membank *bank;
-        paddr_t s, sz;
-
-        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
-            continue;
-
-        if ( reserved_mem->nr_banks < reserved_mem->max_banks )
-        {
-            bank = &reserved_mem->bank[reserved_mem->nr_banks];
-            bank->start = s;
-            bank->size = sz;
-            bank->type = MEMBANK_FDT_RESVMEM;
-            reserved_mem->nr_banks++;
-        }
-        else
-            panic("Cannot allocate reserved memory bank\n");
-    }
-
-    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
-    if ( ret )
-        panic("Early FDT parsing failed (%d)\n", ret);
-
-    /*
-     * On Arm64 setup_directmap_mappings() expects to be called with the lowest
-     * bank in memory first. There is no requirement that the DT will provide
-     * the banks sorted in ascending order. So sort them through.
-     */
-    sort(mem->bank, mem->nr_banks, sizeof(struct membank),
-         cmp_memory_node, swap_memory_node);
-
-    early_print_info();
-
-    return fdt_totalsize(fdt);
-}
-
-const __init char *boot_fdt_cmdline(const void *fdt)
-{
-    int node;
-    const struct fdt_property *prop;
-
-    node = fdt_path_offset(fdt, "/chosen");
-    if ( node < 0 )
-        return NULL;
-
-    prop = fdt_get_property(fdt, node, "xen,xen-bootargs", NULL);
-    if ( prop == NULL )
-    {
-        struct bootcmdline *dom0_cmdline =
-            boot_cmdline_find_by_kind(BOOTMOD_KERNEL);
-
-        if (fdt_get_property(fdt, node, "xen,dom0-bootargs", NULL) ||
-            ( dom0_cmdline && dom0_cmdline->cmdline[0] ) )
-            prop = fdt_get_property(fdt, node, "bootargs", NULL);
-    }
-    if ( prop == NULL )
-        return NULL;
-
-    return prop->data;
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
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 051e796716..5ee690aeb2 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -39,19 +39,6 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
                            void (*cb)(paddr_t ps, paddr_t pe),
                            unsigned int first);
 
-bool check_reserved_regions_overlap(paddr_t region_start, paddr_t region_size);
-
-struct bootmodule *add_boot_module(bootmodule_kind kind,
-                                   paddr_t start, paddr_t size, bool domU);
-struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
-struct bootmodule * boot_module_find_by_addr_and_kind(bootmodule_kind kind,
-                                                             paddr_t start);
-void add_boot_cmdline(const char *name, const char *cmdline,
-                      bootmodule_kind kind, paddr_t start, bool domU);
-struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
-struct bootcmdline * boot_cmdline_find_by_name(const char *name);
-const char *boot_module_kind_as_string(bootmodule_kind kind);
-
 void init_pdx(void);
 void setup_mm(void);
 
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 947bad979c..ff2de71c96 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1 +1,2 @@
+obj-y += bootfdt.init.o
 obj-y += bootinfo.init.o
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
new file mode 100644
index 0000000000..748b5f7c69
--- /dev/null
+++ b/xen/common/device-tree/bootfdt.c
@@ -0,0 +1,635 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Early Device Tree
+ *
+ * Copyright (C) 2012-2014 Citrix Systems, Inc.
+ */
+
+#include <xen/bootfdt.h>
+#include <xen/device_tree.h>
+#include <xen/efi.h>
+#include <xen/init.h>
+#include <xen/kernel.h>
+#include <xen/libfdt/libfdt-xen.h>
+#include <xen/sort.h>
+#include <xsm/xsm.h>
+#include <asm/setup.h>
+#ifdef CONFIG_STATIC_SHM
+#include <asm/static-shmem.h>
+#endif
+
+static void __init __maybe_unused build_assertions(void)
+{
+    /*
+     * Check that no padding is between struct membanks "bank" flexible array
+     * member and struct meminfo "bank" member
+     */
+    BUILD_BUG_ON((offsetof(struct membanks, bank) !=
+                 offsetof(struct meminfo, bank)));
+    /* Ensure "struct membanks" is 8-byte aligned */
+    BUILD_BUG_ON(alignof(struct membanks) != 8);
+}
+
+static bool __init device_tree_node_is_available(const void *fdt, int node)
+{
+    const char *status;
+    int len;
+
+    status = fdt_getprop(fdt, node, "status", &len);
+    if ( !status )
+        return true;
+
+    if ( len > 0 )
+    {
+        if ( !strcmp(status, "ok") || !strcmp(status, "okay") )
+            return true;
+    }
+
+    return false;
+}
+
+static bool __init device_tree_node_matches(const void *fdt, int node,
+                                            const char *match)
+{
+    const char *name;
+    size_t match_len;
+
+    name = fdt_get_name(fdt, node, NULL);
+    match_len = strlen(match);
+
+    /* Match both "match" and "match@..." patterns but not
+       "match-foo". */
+    return strncmp(name, match, match_len) == 0
+        && (name[match_len] == '@' || name[match_len] == '\0');
+}
+
+static bool __init device_tree_node_compatible(const void *fdt, int node,
+                                               const char *match)
+{
+    int len, l;
+    const void *prop;
+
+    prop = fdt_getprop(fdt, node, "compatible", &len);
+    if ( prop == NULL )
+        return false;
+
+    while ( len > 0 ) {
+        if ( !dt_compat_cmp(prop, match) )
+            return true;
+        l = strlen(prop) + 1;
+        prop += l;
+        len -= l;
+    }
+
+    return false;
+}
+
+void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
+                                uint32_t size_cells, paddr_t *start,
+                                paddr_t *size)
+{
+    uint64_t dt_start, dt_size;
+
+    /*
+     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-bit.
+     * Thus, there is an implicit cast from uint64_t to paddr_t.
+     */
+    dt_start = dt_next_cell(address_cells, cell);
+    dt_size = dt_next_cell(size_cells, cell);
+
+    if ( dt_start != (paddr_t)dt_start )
+    {
+        printk("Physical address greater than max width supported\n");
+        WARN();
+    }
+
+    if ( dt_size != (paddr_t)dt_size )
+    {
+        printk("Physical size greater than max width supported\n");
+        WARN();
+    }
+
+    /*
+     * Xen will truncate the address/size if it is greater than the maximum
+     * supported width and it will give an appropriate warning.
+     */
+    *start = dt_start;
+    *size = dt_size;
+}
+
+static int __init device_tree_get_meminfo(const void *fdt, int node,
+                                          const char *prop_name,
+                                          u32 address_cells, u32 size_cells,
+                                          struct membanks *mem,
+                                          enum membank_type type)
+{
+    const struct fdt_property *prop;
+    unsigned int i, banks;
+    const __be32 *cell;
+    u32 reg_cells = address_cells + size_cells;
+    paddr_t start, size;
+
+    if ( !device_tree_node_is_available(fdt, node) )
+        return 0;
+
+    if ( address_cells < 1 || size_cells < 1 )
+    {
+        printk("fdt: property `%s': invalid #address-cells or #size-cells",
+               prop_name);
+        return -EINVAL;
+    }
+
+    prop = fdt_get_property(fdt, node, prop_name, NULL);
+    if ( !prop )
+        return -ENOENT;
+
+    cell = (const __be32 *)prop->data;
+    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
+
+    for ( i = 0; i < banks && mem->nr_banks < mem->max_banks; i++ )
+    {
+        device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
+        if ( mem == bootinfo_get_reserved_mem() &&
+             check_reserved_regions_overlap(start, size) )
+            return -EINVAL;
+        /* Some DT may describe empty bank, ignore them */
+        if ( !size )
+            continue;
+        mem->bank[mem->nr_banks].start = start;
+        mem->bank[mem->nr_banks].size = size;
+        mem->bank[mem->nr_banks].type = type;
+        mem->nr_banks++;
+    }
+
+    if ( i < banks )
+    {
+        printk("Warning: Max number of supported memory regions reached.\n");
+        return -ENOSPC;
+    }
+
+    return 0;
+}
+
+u32 __init device_tree_get_u32(const void *fdt, int node,
+                               const char *prop_name, u32 dflt)
+{
+    const struct fdt_property *prop;
+
+    prop = fdt_get_property(fdt, node, prop_name, NULL);
+    if ( !prop || prop->len < sizeof(u32) )
+        return dflt;
+
+    return fdt32_to_cpu(*(uint32_t*)prop->data);
+}
+
+/**
+ * device_tree_for_each_node - iterate over all device tree sub-nodes
+ * @fdt: flat device tree.
+ * @node: parent node to start the search from
+ * @func: function to call for each sub-node.
+ * @data: data to pass to @func.
+ *
+ * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
+ *
+ * Returns 0 if all nodes were iterated over successfully.  If @func
+ * returns a value different from 0, that value is returned immediately.
+ */
+int __init device_tree_for_each_node(const void *fdt, int node,
+                                     device_tree_node_func func,
+                                     void *data)
+{
+    /*
+     * We only care about relative depth increments, assume depth of
+     * node is 0 for simplicity.
+     */
+    int depth = 0;
+    const int first_node = node;
+    u32 address_cells[DEVICE_TREE_MAX_DEPTH];
+    u32 size_cells[DEVICE_TREE_MAX_DEPTH];
+    int ret;
+
+    do {
+        const char *name = fdt_get_name(fdt, node, NULL);
+        u32 as, ss;
+
+        if ( depth >= DEVICE_TREE_MAX_DEPTH )
+        {
+            printk("Warning: device tree node `%s' is nested too deep\n",
+                   name);
+            continue;
+        }
+
+        as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
+        ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
+
+        address_cells[depth] = device_tree_get_u32(fdt, node,
+                                                   "#address-cells", as);
+        size_cells[depth] = device_tree_get_u32(fdt, node,
+                                                "#size-cells", ss);
+
+        /* skip the first node */
+        if ( node != first_node )
+        {
+            ret = func(fdt, node, name, depth, as, ss, data);
+            if ( ret != 0 )
+                return ret;
+        }
+
+        node = fdt_next_node(fdt, node, &depth);
+    } while ( node >= 0 && depth > 0 );
+
+    return 0;
+}
+
+static int __init process_memory_node(const void *fdt, int node,
+                                      const char *name, int depth,
+                                      u32 address_cells, u32 size_cells,
+                                      struct membanks *mem)
+{
+    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
+                                   mem, MEMBANK_DEFAULT);
+}
+
+static int __init process_reserved_memory_node(const void *fdt, int node,
+                                               const char *name, int depth,
+                                               u32 address_cells,
+                                               u32 size_cells,
+                                               void *data)
+{
+    int rc = process_memory_node(fdt, node, name, depth, address_cells,
+                                 size_cells, data);
+
+    if ( rc == -ENOSPC )
+        panic("Max number of supported reserved-memory regions reached.\n");
+    else if ( rc != -ENOENT )
+        return rc;
+    return 0;
+}
+
+static int __init process_reserved_memory(const void *fdt, int node,
+                                          const char *name, int depth,
+                                          u32 address_cells, u32 size_cells)
+{
+    return device_tree_for_each_node(fdt, node,
+                                     process_reserved_memory_node,
+                                     bootinfo_get_reserved_mem());
+}
+
+static void __init process_multiboot_node(const void *fdt, int node,
+                                          const char *name,
+                                          u32 address_cells, u32 size_cells)
+{
+    static int __initdata kind_guess = 0;
+    const struct fdt_property *prop;
+    const __be32 *cell;
+    bootmodule_kind kind;
+    paddr_t start, size;
+    int len;
+    /* sizeof("/chosen/") + DT_MAX_NAME + '/' + DT_MAX_NAME + '/0' => 92 */
+    char path[92];
+    int parent_node, ret;
+    bool domU;
+
+    parent_node = fdt_parent_offset(fdt, node);
+    ASSERT(parent_node >= 0);
+
+    /* Check that the node is under "/chosen" (first 7 chars of path) */
+    ret = fdt_get_path(fdt, node, path, sizeof (path));
+    if ( ret != 0 || strncmp(path, "/chosen", 7) )
+        return;
+
+    prop = fdt_get_property(fdt, node, "reg", &len);
+    if ( !prop )
+        panic("node %s missing `reg' property\n", name);
+
+    if ( len < dt_cells_to_size(address_cells + size_cells) )
+        panic("fdt: node `%s': `reg` property length is too short\n",
+                    name);
+
+    cell = (const __be32 *)prop->data;
+    device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
+
+    if ( fdt_node_check_compatible(fdt, node, "xen,linux-zimage") == 0 ||
+         fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
+        kind = BOOTMOD_KERNEL;
+    else if ( fdt_node_check_compatible(fdt, node, "xen,linux-initrd") == 0 ||
+              fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
+        kind = BOOTMOD_RAMDISK;
+    else if ( fdt_node_check_compatible(fdt, node, "xen,xsm-policy") == 0 )
+        kind = BOOTMOD_XSM;
+    else if ( fdt_node_check_compatible(fdt, node, "multiboot,device-tree") == 0 )
+        kind = BOOTMOD_GUEST_DTB;
+    else
+        kind = BOOTMOD_UNKNOWN;
+
+    /**
+     * Guess the kind of these first two unknowns respectively:
+     * (1) The first unknown must be kernel.
+     * (2) Detect the XSM Magic from the 2nd unknown:
+     *     a. If it's XSM, set the kind as XSM, and that also means we
+     *     won't load ramdisk;
+     *     b. if it's not XSM, set the kind as ramdisk.
+     *     So if user want to load ramdisk, it must be the 2nd unknown.
+     * We also detect the XSM Magic for the following unknowns,
+     * then set its kind according to the return value of has_xsm_magic.
+     */
+    if ( kind == BOOTMOD_UNKNOWN )
+    {
+        switch ( kind_guess++ )
+        {
+        case 0: kind = BOOTMOD_KERNEL; break;
+        case 1: kind = BOOTMOD_RAMDISK; break;
+        default: break;
+        }
+        if ( kind_guess > 1 && has_xsm_magic(start) )
+            kind = BOOTMOD_XSM;
+    }
+
+    domU = fdt_node_check_compatible(fdt, parent_node, "xen,domain") == 0;
+    add_boot_module(kind, start, size, domU);
+
+    prop = fdt_get_property(fdt, node, "bootargs", &len);
+    if ( !prop )
+        return;
+    add_boot_cmdline(fdt_get_name(fdt, parent_node, &len), prop->data,
+                     kind, start, domU);
+}
+
+static int __init process_chosen_node(const void *fdt, int node,
+                                      const char *name,
+                                      u32 address_cells, u32 size_cells)
+{
+    const struct fdt_property *prop;
+    paddr_t start, end;
+    int len;
+
+    if ( fdt_get_property(fdt, node, "xen,static-heap", NULL) )
+    {
+        int rc;
+
+        printk("Checking for static heap in /chosen\n");
+
+        rc = device_tree_get_meminfo(fdt, node, "xen,static-heap",
+                                     address_cells, size_cells,
+                                     bootinfo_get_reserved_mem(),
+                                     MEMBANK_STATIC_HEAP);
+        if ( rc )
+            return rc;
+
+        bootinfo.static_heap = true;
+    }
+
+    printk("Checking for initrd in /chosen\n");
+
+    prop = fdt_get_property(fdt, node, "linux,initrd-start", &len);
+    if ( !prop )
+        /* No initrd present. */
+        return 0;
+    if ( len != sizeof(u32) && len != sizeof(u64) )
+    {
+        printk("linux,initrd-start property has invalid length %d\n", len);
+        return -EINVAL;
+    }
+    start = dt_read_paddr((const void *)&prop->data, dt_size_to_cells(len));
+
+    prop = fdt_get_property(fdt, node, "linux,initrd-end", &len);
+    if ( !prop )
+    {
+        printk("linux,initrd-end not present but -start was\n");
+        return -EINVAL;
+    }
+    if ( len != sizeof(u32) && len != sizeof(u64) )
+    {
+        printk("linux,initrd-end property has invalid length %d\n", len);
+        return -EINVAL;
+    }
+    end = dt_read_paddr((const void *)&prop->data, dt_size_to_cells(len));
+
+    if ( start >= end )
+    {
+        printk("linux,initrd limits invalid: %"PRIpaddr" >= %"PRIpaddr"\n",
+                  start, end);
+        return -EINVAL;
+    }
+
+    printk("Initrd %"PRIpaddr"-%"PRIpaddr"\n", start, end);
+
+    add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
+
+    return 0;
+}
+
+static int __init process_domain_node(const void *fdt, int node,
+                                      const char *name,
+                                      u32 address_cells, u32 size_cells)
+{
+    const struct fdt_property *prop;
+
+    printk("Checking for \"xen,static-mem\" in domain node\n");
+
+    prop = fdt_get_property(fdt, node, "xen,static-mem", NULL);
+    if ( !prop )
+        /* No "xen,static-mem" present. */
+        return 0;
+
+    return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
+                                   size_cells, bootinfo_get_reserved_mem(),
+                                   MEMBANK_STATIC_DOMAIN);
+}
+
+#ifndef CONFIG_STATIC_SHM
+static inline int process_shm_node(const void *fdt, int node,
+                                   uint32_t address_cells, uint32_t size_cells)
+{
+    printk("CONFIG_STATIC_SHM must be enabled for parsing static shared"
+            " memory nodes\n");
+    return -EINVAL;
+}
+#endif
+
+static int __init early_scan_node(const void *fdt,
+                                  int node, const char *name, int depth,
+                                  u32 address_cells, u32 size_cells,
+                                  void *data)
+{
+    int rc = 0;
+
+    /*
+     * If Xen has been booted via UEFI, the memory banks are
+     * populated. So we should skip the parsing.
+     */
+    if ( !efi_enabled(EFI_BOOT) &&
+         device_tree_node_matches(fdt, node, "memory") )
+        rc = process_memory_node(fdt, node, name, depth,
+                                 address_cells, size_cells, bootinfo_get_mem());
+    else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
+        rc = process_reserved_memory(fdt, node, name, depth,
+                                     address_cells, size_cells);
+    else if ( depth <= 3 && (device_tree_node_compatible(fdt, node, "xen,multiboot-module" ) ||
+              device_tree_node_compatible(fdt, node, "multiboot,module" )))
+        process_multiboot_node(fdt, node, name, address_cells, size_cells);
+    else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
+        rc = process_chosen_node(fdt, node, name, address_cells, size_cells);
+    else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
+        rc = process_domain_node(fdt, node, name, address_cells, size_cells);
+    else if ( depth <= 3 && device_tree_node_compatible(fdt, node, "xen,domain-shared-memory-v1") )
+        rc = process_shm_node(fdt, node, address_cells, size_cells);
+
+    if ( rc < 0 )
+        printk("fdt: node `%s': parsing failed\n", name);
+    return rc;
+}
+
+static void __init early_print_info(void)
+{
+    const struct membanks *mi = bootinfo_get_mem();
+    const struct membanks *mem_resv = bootinfo_get_reserved_mem();
+    struct bootmodules *mods = &bootinfo.modules;
+    struct bootcmdlines *cmds = &bootinfo.cmdlines;
+    unsigned int i;
+
+    for ( i = 0; i < mi->nr_banks; i++ )
+        printk("RAM: %"PRIpaddr" - %"PRIpaddr"\n",
+                mi->bank[i].start,
+                mi->bank[i].start + mi->bank[i].size - 1);
+    printk("\n");
+    for ( i = 0 ; i < mods->nr_mods; i++ )
+        printk("MODULE[%d]: %"PRIpaddr" - %"PRIpaddr" %-12s\n",
+                i,
+                mods->module[i].start,
+                mods->module[i].start + mods->module[i].size,
+                boot_module_kind_as_string(mods->module[i].kind));
+
+    for ( i = 0; i < mem_resv->nr_banks; i++ )
+    {
+        printk(" RESVD[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i,
+               mem_resv->bank[i].start,
+               mem_resv->bank[i].start + mem_resv->bank[i].size - 1);
+    }
+#ifdef CONFIG_STATIC_SHM
+    early_print_info_shmem();
+#endif
+    printk("\n");
+    for ( i = 0 ; i < cmds->nr_mods; i++ )
+        printk("CMDLINE[%"PRIpaddr"]:%s %s\n", cmds->cmdline[i].start,
+               cmds->cmdline[i].dt_name,
+               &cmds->cmdline[i].cmdline[0]);
+    printk("\n");
+}
+
+/* This function assumes that memory regions are not overlapped */
+static int __init cmp_memory_node(const void *key, const void *elem)
+{
+    const struct membank *handler0 = key;
+    const struct membank *handler1 = elem;
+
+    if ( handler0->start < handler1->start )
+        return -1;
+
+    if ( handler0->start >= (handler1->start + handler1->size) )
+        return 1;
+
+    return 0;
+}
+
+static void __init swap_memory_node(void *_a, void *_b, size_t size)
+{
+    struct membank *a = _a, *b = _b;
+
+    SWAP(*a, *b);
+}
+
+/**
+ * boot_fdt_info - initialize bootinfo from a DTB
+ * @fdt: flattened device tree binary
+ *
+ * Returns the size of the DTB.
+ */
+size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
+{
+    struct membanks *reserved_mem = bootinfo_get_reserved_mem();
+    struct membanks *mem = bootinfo_get_mem();
+    unsigned int i;
+    int nr_rsvd;
+    int ret;
+
+    ret = fdt_check_header(fdt);
+    if ( ret < 0 )
+        panic("No valid device tree\n");
+
+    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
+
+    nr_rsvd = fdt_num_mem_rsv(fdt);
+    if ( nr_rsvd < 0 )
+        panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
+
+    for ( i = 0; i < nr_rsvd; i++ )
+    {
+        struct membank *bank;
+        paddr_t s, sz;
+
+        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
+            continue;
+
+        if ( reserved_mem->nr_banks < reserved_mem->max_banks )
+        {
+            bank = &reserved_mem->bank[reserved_mem->nr_banks];
+            bank->start = s;
+            bank->size = sz;
+            bank->type = MEMBANK_FDT_RESVMEM;
+            reserved_mem->nr_banks++;
+        }
+        else
+            panic("Cannot allocate reserved memory bank\n");
+    }
+
+    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
+    if ( ret )
+        panic("Early FDT parsing failed (%d)\n", ret);
+
+    /*
+     * On Arm64 setup_directmap_mappings() expects to be called with the lowest
+     * bank in memory first. There is no requirement that the DT will provide
+     * the banks sorted in ascending order. So sort them through.
+     */
+    sort(mem->bank, mem->nr_banks, sizeof(struct membank),
+         cmp_memory_node, swap_memory_node);
+
+    early_print_info();
+
+    return fdt_totalsize(fdt);
+}
+
+const __init char *boot_fdt_cmdline(const void *fdt)
+{
+    int node;
+    const struct fdt_property *prop;
+
+    node = fdt_path_offset(fdt, "/chosen");
+    if ( node < 0 )
+        return NULL;
+
+    prop = fdt_get_property(fdt, node, "xen,xen-bootargs", NULL);
+    if ( prop == NULL )
+    {
+        struct bootcmdline *dom0_cmdline =
+            boot_cmdline_find_by_kind(BOOTMOD_KERNEL);
+
+        if (fdt_get_property(fdt, node, "xen,dom0-bootargs", NULL) ||
+            ( dom0_cmdline && dom0_cmdline->cmdline[0] ) )
+            prop = fdt_get_property(fdt, node, "bootargs", NULL);
+    }
+    if ( prop == NULL )
+        return NULL;
+
+    return prop->data;
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
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 7cd45b3d4b..5943bc5fe3 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -158,6 +158,20 @@ struct bootinfo {
 
 extern struct bootinfo bootinfo;
 
+bool check_reserved_regions_overlap(paddr_t region_start,
+                                    paddr_t region_size);
+
+struct bootmodule *add_boot_module(bootmodule_kind kind,
+                                   paddr_t start, paddr_t size, bool domU);
+struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
+struct bootmodule * boot_module_find_by_addr_and_kind(bootmodule_kind kind,
+                                                             paddr_t start);
+void add_boot_cmdline(const char *name, const char *cmdline,
+                      bootmodule_kind kind, paddr_t start, bool domU);
+struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
+struct bootcmdline * boot_cmdline_find_by_name(const char *name);
+const char *boot_module_kind_as_string(bootmodule_kind kind);
+
 void populate_boot_allocator(void);
 
 size_t boot_fdt_info(const void *fdt, paddr_t paddr);
-- 
2.45.2


