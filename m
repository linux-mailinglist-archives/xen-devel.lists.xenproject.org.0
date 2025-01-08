Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28159A05966
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 12:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867140.1278638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVU06-0003FX-K5; Wed, 08 Jan 2025 11:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867140.1278638; Wed, 08 Jan 2025 11:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVU06-0003BS-Dw; Wed, 08 Jan 2025 11:13:26 +0000
Received: by outflank-mailman (input) for mailman id 867140;
 Wed, 08 Jan 2025 11:13:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoWX=UA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVU04-0001BZ-EW
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 11:13:24 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 931b7a19-cdb1-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 12:13:23 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-3003c82c95cso137043991fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 03:13:23 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad99d11sm67292171fa.33.2025.01.08.03.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 03:13:21 -0800 (PST)
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
X-Inumbo-ID: 931b7a19-cdb1-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736334803; x=1736939603; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCRNwIFmqmDzUyPUbfaADvOUBg93q5fcxanayhRIhFo=;
        b=jaYkFV3h2t9AQUEcFoSPMazvvjKj5WqpI5caWp6Ly2mZ5rlM4+S20d2clNeHJ1uNt7
         17+X1Y9/ydhc0kyC0l4nyDw4BtUzxDEyaDbDjPpAznv618Y/cbhcQfcPt/PNPvtpQdXU
         C2fn0sLA7+GUbbf2Hitd3ol1EggwpQe4jx1Z4N/6f50Yry/v9te29efajK/rUXdCtpAP
         WtDBTAfHuf/t0rHyAAEDuXeh9elz5s6C9bmsJ2mSTxY/3WQB8tswCnEaGr9OgrsG7AUg
         dUA5IKhDXWHOrp7MJ2r2jUzNxTql5R4Jlg7QoFsHDK14dBN31vipF4vXWs8ycZsDjqvk
         59QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736334803; x=1736939603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCRNwIFmqmDzUyPUbfaADvOUBg93q5fcxanayhRIhFo=;
        b=AC4NrLMkzRb1nGP/OtmBDYYD9WRcwECWKMidbqIWlUE/ZdJ9FS3oE7qAZgHY0cbW37
         9P/wF5vP5wqAh5Z9Fj6TNXyFfjx19WeqOmKBuwGhijPaCwyZqe2OUCDchGhvx1eqdCrw
         byiv0UlDjyqpunWeLxNSkSVdhylGng5J3c3aJ665vRd/tpoIFCiMMKmYUWyZqh/DS7yo
         R07MLZK/wlokwWCmJVnb7k08aDzeAGiCWx5OChp35SU8bM0j1MAIRAmsaDip+YwAmJN6
         Vsu6ZV9AqftZQw+LQLpXTMBo4jyl3UfFMRuBHfRGPpBFUn/KweL2TCDVXLiOy+xzODEf
         NZoQ==
X-Gm-Message-State: AOJu0Yy2AwUPREA7j2RSZdYZVkl+ygZAEVhGkh1oI9UuFNKawOpXEJih
	H1rKDUtorPpxWz3T+Uy6v+Ka9GVR0yp8w8xCocviBs3yaw3o1okcKjyPcPVc
X-Gm-Gg: ASbGncssgZQRazy58hntG+GLAf5RIz/nKIDtSvXk6y/0P0z4TZ9hobFUrsnY48CoZbD
	vUQVXN8omNJNc0FiHHtz8kCRbu3kouHx1773jliD7h5HxbYWpaVetjS3Nk5wgOXtQZ/FFEX3Ddt
	Uz9GZPT6fd4BVQC0uYzl13nrgOVECP043hwv9CRtYrATAdUSS5iodA+r8xsZXhcMa7dYSrikwSq
	VY7ilVx2UK7aJc2a16C//wn1/5vWsy7rG2ykiBqRcv3GjD/6XOAgHbSsw==
X-Google-Smtp-Source: AGHT+IG8Cf26ShFn3iyVqP3HxATc+zjwe9ssoFtEuTEVG/VclyY9cvaI5LziOEOTbQD3wOHcNXH8fw==
X-Received: by 2002:a2e:b888:0:b0:2fb:597e:28d9 with SMTP id 38308e7fff4ca-305f45855bbmr5999531fa.14.1736334802299;
        Wed, 08 Jan 2025 03:13:22 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 8/9] xen/common: dom0less: introduce common domain-build.c
Date: Wed,  8 Jan 2025 12:13:10 +0100
Message-ID: <5d4634ff3d44955d4110ce52c14e0a524cbc4706.1736334615.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736334615.git.oleksii.kurochko@gmail.com>
References: <cover.1736334615.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some functions of Arm's domain_build.c could be reused by dom0less or other
features connected to domain construction/build.

The following functions are moved to common:
- get_allocation_size().
- allocate_domheap_memory().
- guest_map_pages().
- allocate_bank_memory().
- add_hwdom_free_regions().
- find_unallocated_memory().
- allocate_memory().
- dtb_load().
- initrd_load().

Prototype of dtb_load() and initrd_load() is updated to recieve a pointer
to copy_to_guest_phys() as some archs require
copy_to_guest_phys_fluch_dcache().

Update arm/include/asm/Makefile to generate  domain-build.h for Arm as it is
used by domain-build.c.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/domain_build.c            | 400 +-----------------------
 xen/arch/arm/include/asm/Makefile      |   1 +
 xen/common/device-tree/Makefile        |   1 +
 xen/common/device-tree/domain-build.c  | 405 +++++++++++++++++++++++++
 xen/include/asm-generic/domain-build.h |  33 +-
 5 files changed, 441 insertions(+), 399 deletions(-)
 create mode 100644 xen/common/device-tree/domain-build.c

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 976b03a5df..e72da272d8 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -119,18 +119,6 @@ struct vcpu *__init alloc_dom0_vcpu0(struct domain *dom0)
     return vcpu_create(dom0, 0);
 }
 
-unsigned int __init get_allocation_size(paddr_t size)
-{
-    /*
-     * get_order_from_bytes returns the order greater than or equal to
-     * the given size, but we need less than or equal. Adding one to
-     * the size pushes an evenly aligned size into the next order, so
-     * we can then unconditionally subtract 1 from the order which is
-     * returned.
-     */
-    return get_order_from_bytes(size + 1) - 1;
-}
-
 /*
  * Insert the given pages into a memory bank, banks are ordered by address.
  *
@@ -417,98 +405,6 @@ static void __init allocate_memory_11(struct domain *d,
     }
 }
 
-bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
-                                    alloc_domheap_mem_cb cb, void *extra)
-{
-    unsigned int max_order = UINT_MAX;
-
-    while ( tot_size > 0 )
-    {
-        unsigned int order = get_allocation_size(tot_size);
-        struct page_info *pg;
-
-        order = min(max_order, order);
-
-        pg = alloc_domheap_pages(d, order, 0);
-        if ( !pg )
-        {
-            /*
-             * If we can't allocate one page, then it is unlikely to
-             * succeed in the next iteration. So bail out.
-             */
-            if ( !order )
-                return false;
-
-            /*
-             * If we can't allocate memory with order, then it is
-             * unlikely to succeed in the next iteration.
-             * Record the order - 1 to avoid re-trying.
-             */
-            max_order = order - 1;
-            continue;
-        }
-
-        if ( !cb(d, pg, order, extra) )
-            return false;
-
-        tot_size -= (1ULL << (PAGE_SHIFT + order));
-    }
-
-    return true;
-}
-
-static bool __init guest_map_pages(struct domain *d, struct page_info *pg,
-                                   unsigned int order, void *extra)
-{
-    gfn_t *sgfn = (gfn_t *)extra;
-    int res;
-
-    BUG_ON(!sgfn);
-    res = guest_physmap_add_page(d, *sgfn, page_to_mfn(pg), order);
-    if ( res )
-    {
-        dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
-        return false;
-    }
-
-    *sgfn = gfn_add(*sgfn, 1UL << order);
-
-    return true;
-}
-
-bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
-                                 paddr_t tot_size)
-{
-    struct membanks *mem = kernel_info_get_mem(kinfo);
-    struct domain *d = kinfo->d;
-    struct membank *bank;
-
-    /*
-     * allocate_bank_memory can be called with a tot_size of zero for
-     * the second memory bank. It is not an error and we can safely
-     * avoid creating a zero-size memory bank.
-     */
-    if ( tot_size == 0 )
-        return true;
-
-    bank = &mem->bank[mem->nr_banks];
-    bank->start = gfn_to_gaddr(sgfn);
-    bank->size = tot_size;
-
-    /*
-     * Allocate pages from the heap until tot_size is zero and map them to the
-     * guest using guest_map_pages, passing the starting gfn as extra parameter
-     * for the map operation.
-     */
-    if ( !allocate_domheap_memory(d, tot_size, guest_map_pages, &sgfn) )
-        return false;
-
-    mem->nr_banks++;
-    kinfo->unassigned_mem -= bank->size;
-
-    return true;
-}
-
 /*
  * When PCI passthrough is available we want to keep the
  * "linux,pci-domain" in sync for every host bridge.
@@ -899,229 +795,6 @@ int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
     return 0;
 }
 
-static int __init add_hwdom_free_regions(unsigned long s_gfn,
-                                         unsigned long e_gfn, void *data)
-{
-    struct membanks *free_regions = data;
-    paddr_t start, size;
-    paddr_t s = pfn_to_paddr(s_gfn);
-    paddr_t e = pfn_to_paddr(e_gfn);
-    unsigned int i, j;
-
-    if ( free_regions->nr_banks >= free_regions->max_banks )
-        return 0;
-
-    /*
-     * Both start and size of the free region should be 2MB aligned to
-     * potentially allow superpage mapping.
-     */
-    start = (s + SZ_2M - 1) & ~(SZ_2M - 1);
-    if ( start > e )
-        return 0;
-
-    /*
-     * e is actually "end-1" because it is called by rangeset functions
-     * which are inclusive of the last address.
-     */
-    e += 1;
-    size = (e - start) & ~(SZ_2M - 1);
-
-    /* Find the insert position (descending order). */
-    for ( i = 0; i < free_regions->nr_banks ; i++ )
-        if ( size > free_regions->bank[i].size )
-            break;
-
-    /* Move the other banks to make space. */
-    for ( j = free_regions->nr_banks; j > i ; j-- )
-    {
-        free_regions->bank[j].start = free_regions->bank[j - 1].start;
-        free_regions->bank[j].size = free_regions->bank[j - 1].size;
-    }
-
-    free_regions->bank[i].start = start;
-    free_regions->bank[i].size = size;
-    free_regions->nr_banks++;
-
-    return 0;
-}
-
-/*
- * Find unused regions of Host address space which can be exposed to domain
- * using the host memory layout. In order to calculate regions we exclude every
- * region passed in mem_banks from the Host RAM.
- */
-static int __init find_unallocated_memory(const struct kernel_info *kinfo,
-                                          const struct membanks *mem_banks[],
-                                          unsigned int nr_mem_banks,
-                                          struct membanks *free_regions,
-                                          int (*cb)(unsigned long s_gfn,
-                                                    unsigned long e_gfn,
-                                                    void *data))
-{
-    const struct membanks *mem = bootinfo_get_mem();
-    struct rangeset *unalloc_mem;
-    paddr_t start, end;
-    unsigned int i, j;
-    int res;
-
-    ASSERT(domain_use_host_layout(kinfo->d));
-
-    unalloc_mem = rangeset_new(NULL, NULL, 0);
-    if ( !unalloc_mem )
-        return -ENOMEM;
-
-    /* Start with all available RAM */
-    for ( i = 0; i < mem->nr_banks; i++ )
-    {
-        start = mem->bank[i].start;
-        end = mem->bank[i].start + mem->bank[i].size;
-        res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
-                                 PFN_DOWN(end - 1));
-        if ( res )
-        {
-            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
-                   start, end);
-            goto out;
-        }
-    }
-
-    /* Remove all regions listed in mem_banks */
-    for ( i = 0; i < nr_mem_banks; i++ )
-        for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
-        {
-            start = mem_banks[i]->bank[j].start;
-
-            /* Shared memory banks can contain INVALID_PADDR as start */
-            if ( INVALID_PADDR == start )
-                continue;
-
-            end = mem_banks[i]->bank[j].start + mem_banks[i]->bank[j].size;
-            res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
-                                        PFN_DOWN(end - 1));
-            if ( res )
-            {
-                printk(XENLOG_ERR
-                       "Failed to add: %#"PRIpaddr"->%#"PRIpaddr", error %d\n",
-                       start, end, res);
-                goto out;
-            }
-        }
-
-    start = 0;
-    end = (1ULL << p2m_ipa_bits) - 1;
-    res = rangeset_report_ranges(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end),
-                                 cb, free_regions);
-    if ( res )
-        free_regions->nr_banks = 0;
-    else if ( !free_regions->nr_banks )
-        res = -ENOENT;
-
-out:
-    rangeset_destroy(unalloc_mem);
-
-    return res;
-}
-
-void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
-{
-    struct membanks *mem = kernel_info_get_mem(kinfo);
-    unsigned int i, nr_banks = GUEST_RAM_BANKS;
-    struct membanks *hwdom_free_mem = NULL;
-
-    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
-           /* Don't want format this as PRIpaddr (16 digit hex) */
-           (unsigned long)(kinfo->unassigned_mem >> 20), d);
-
-    mem->nr_banks = 0;
-    /*
-     * Use host memory layout for hwdom. Only case for this is when LLC coloring
-     * is enabled.
-     */
-    if ( is_hardware_domain(d) )
-    {
-        struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
-        /*
-         * Exclude the following regions:
-         * 1) Remove reserved memory
-         * 2) Grant table assigned to hwdom
-         */
-        const struct membanks *mem_banks[] = {
-            bootinfo_get_reserved_mem(),
-            gnttab,
-        };
-
-        if ( !gnttab )
-            goto fail;
-
-        gnttab->nr_banks = 1;
-        gnttab->bank[0].start = kinfo->gnttab_start;
-        gnttab->bank[0].size = kinfo->gnttab_size;
-
-        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
-                                             NR_MEM_BANKS);
-        if ( !hwdom_free_mem )
-            goto fail;
-
-        hwdom_free_mem->max_banks = NR_MEM_BANKS;
-
-        if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
-                                     hwdom_free_mem, add_hwdom_free_regions) )
-            goto fail;
-
-        nr_banks = hwdom_free_mem->nr_banks;
-        xfree(gnttab);
-    }
-
-    for ( i = 0; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_banks-- )
-    {
-        paddr_t bank_start, bank_size;
-
-        if ( is_hardware_domain(d) )
-        {
-            bank_start = hwdom_free_mem->bank[i].start;
-            bank_size = hwdom_free_mem->bank[i].size;
-        }
-        else
-        {
-            const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
-            const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
-
-            if ( i >= GUEST_RAM_BANKS )
-                goto fail;
-
-            bank_start = bankbase[i];
-            bank_size = banksize[i];
-        }
-
-        bank_size = MIN(bank_size, kinfo->unassigned_mem);
-        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), bank_size) )
-            goto fail;
-    }
-
-    if ( kinfo->unassigned_mem )
-        goto fail;
-
-    for( i = 0; i < mem->nr_banks; i++ )
-    {
-        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
-               d,
-               i,
-               mem->bank[i].start,
-               mem->bank[i].start + mem->bank[i].size,
-               /* Don't want format this as PRIpaddr (16 digit hex) */
-               (unsigned long)(mem->bank[i].size >> 20));
-    }
-
-    xfree(hwdom_free_mem);
-    return;
-
-  fail:
-    panic("Failed to allocate requested domain memory."
-          /* Don't want format this as PRIpaddr (16 digit hex) */
-          " %ldKB unallocated. Fix the VMs configurations.\n",
-          (unsigned long)kinfo->unassigned_mem >> 10);
-}
-
 static int __init handle_pci_range(const struct dt_device_node *dev,
                                    uint64_t addr, uint64_t len, void *data)
 {
@@ -2056,75 +1729,6 @@ static int __init prepare_dtb_hwdom(struct domain *d, struct kernel_info *kinfo)
     return -EINVAL;
 }
 
-static void __init dtb_load(struct kernel_info *kinfo)
-{
-    unsigned long left;
-
-    printk("Loading %pd DTB to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
-           kinfo->d, kinfo->dtb_paddr,
-           kinfo->dtb_paddr + fdt_totalsize(kinfo->fdt));
-
-    left = copy_to_guest_phys_flush_dcache(kinfo->d, kinfo->dtb_paddr,
-                                           kinfo->fdt,
-                                           fdt_totalsize(kinfo->fdt));
-
-    if ( left != 0 )
-        panic("Unable to copy the DTB to %pd memory (left = %lu bytes)\n",
-              kinfo->d, left);
-    xfree(kinfo->fdt);
-}
-
-static void __init initrd_load(struct kernel_info *kinfo)
-{
-    const struct bootmodule *mod = kinfo->initrd_bootmodule;
-    paddr_t load_addr = kinfo->initrd_paddr;
-    paddr_t paddr, len;
-    int node;
-    int res;
-    __be32 val[2];
-    __be32 *cellp;
-    void __iomem *initrd;
-
-    if ( !mod || !mod->size )
-        return;
-
-    paddr = mod->start;
-    len = mod->size;
-
-    printk("Loading %pd initrd from %"PRIpaddr" to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
-           kinfo->d, paddr, load_addr, load_addr + len);
-
-    /* Fix up linux,initrd-start and linux,initrd-end in /chosen */
-    node = fdt_path_offset(kinfo->fdt, "/chosen");
-    if ( node < 0 )
-        panic("Cannot find the /chosen node\n");
-
-    cellp = (__be32 *)val;
-    dt_set_cell(&cellp, ARRAY_SIZE(val), load_addr);
-    res = fdt_setprop_inplace(kinfo->fdt, node, "linux,initrd-start",
-                              val, sizeof(val));
-    if ( res )
-        panic("Cannot fix up \"linux,initrd-start\" property\n");
-
-    cellp = (__be32 *)val;
-    dt_set_cell(&cellp, ARRAY_SIZE(val), load_addr + len);
-    res = fdt_setprop_inplace(kinfo->fdt, node, "linux,initrd-end",
-                              val, sizeof(val));
-    if ( res )
-        panic("Cannot fix up \"linux,initrd-end\" property\n");
-
-    initrd = ioremap_wc(paddr, len);
-    if ( !initrd )
-        panic("Unable to map the hwdom initrd\n");
-
-    res = copy_to_guest_phys_flush_dcache(kinfo->d, load_addr,
-                                          initrd, len);
-    if ( res != 0 )
-        panic("Unable to copy the initrd in the hwdom memory\n");
-
-    iounmap(initrd);
-}
-
 /*
  * Allocate the event channel PPIs and setup the HVM_PARAM_CALLBACK_IRQ.
  * The allocated IRQ will be found in d->arch.evtchn_irq.
@@ -2217,8 +1821,8 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
      */
     kernel_load(kinfo);
     /* initrd_load will fix up the fdt, so call it before dtb_load */
-    initrd_load(kinfo);
-    dtb_load(kinfo);
+    initrd_load(kinfo, copy_to_guest_phys_flush_dcache);
+    dtb_load(kinfo, copy_to_guest_phys_flush_dcache);
 
     memset(regs, 0, sizeof(*regs));
 
diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 9cec55606e..cda29dca6c 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += altp2m.h
 generic-y += device.h
+generic-y += domain-build.h
 generic-y += dom0less-build.h
 generic-y += hardirq.h
 generic-y += iocap.h
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index e88a4d5799..831b91399b 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,6 +1,7 @@
 obj-y += bootfdt.init.o
 obj-y += bootinfo.init.o
 obj-y += device-tree.o
+obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
 obj-y += intc.o
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
new file mode 100644
index 0000000000..b4fb67ad9f
--- /dev/null
+++ b/xen/common/device-tree/domain-build.c
@@ -0,0 +1,405 @@
+#include <xen/bootfdt.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/mm.h>
+#include <xen/sched.h>
+#include <xen/sizes.h>
+#include <xen/types.h>
+#include <xen/vmap.h>
+
+#include <asm/domain-build.h>
+#include <asm/kernel.h>
+#include <asm/p2m.h>
+
+bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
+                                    alloc_domheap_mem_cb cb, void *extra)
+{
+    unsigned int max_order = UINT_MAX;
+
+    while ( tot_size > 0 )
+    {
+        unsigned int order = get_allocation_size(tot_size);
+        struct page_info *pg;
+
+        order = min(max_order, order);
+
+        pg = alloc_domheap_pages(d, order, 0);
+        if ( !pg )
+        {
+            /*
+             * If we can't allocate one page, then it is unlikely to
+             * succeed in the next iteration. So bail out.
+             */
+            if ( !order )
+                return false;
+
+            /*
+             * If we can't allocate memory with order, then it is
+             * unlikely to succeed in the next iteration.
+             * Record the order - 1 to avoid re-trying.
+             */
+            max_order = order - 1;
+            continue;
+        }
+
+        if ( !cb(d, pg, order, extra) )
+            return false;
+
+        tot_size -= (1ULL << (PAGE_SHIFT + order));
+    }
+
+    return true;
+}
+
+static bool __init guest_map_pages(struct domain *d, struct page_info *pg,
+                                   unsigned int order, void *extra)
+{
+    gfn_t *sgfn = (gfn_t *)extra;
+    int res;
+
+    BUG_ON(!sgfn);
+    res = guest_physmap_add_page(d, *sgfn, page_to_mfn(pg), order);
+    if ( res )
+    {
+        dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
+        return false;
+    }
+
+    *sgfn = gfn_add(*sgfn, 1UL << order);
+
+    return true;
+}
+
+bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
+                                 paddr_t tot_size)
+{
+    struct membanks *mem = kernel_info_get_mem(kinfo);
+    struct domain *d = kinfo->d;
+    struct membank *bank;
+
+    /*
+     * allocate_bank_memory can be called with a tot_size of zero for
+     * the second memory bank. It is not an error and we can safely
+     * avoid creating a zero-size memory bank.
+     */
+    if ( tot_size == 0 )
+        return true;
+
+    bank = &mem->bank[mem->nr_banks];
+    bank->start = gfn_to_gaddr(sgfn);
+    bank->size = tot_size;
+
+    /*
+     * Allocate pages from the heap until tot_size is zero and map them to the
+     * guest using guest_map_pages, passing the starting gfn as extra parameter
+     * for the map operation.
+     */
+    if ( !allocate_domheap_memory(d, tot_size, guest_map_pages, &sgfn) )
+        return false;
+
+    mem->nr_banks++;
+    kinfo->unassigned_mem -= bank->size;
+
+    return true;
+}
+
+static int __init add_hwdom_free_regions(unsigned long s_gfn,
+                                         unsigned long e_gfn, void *data)
+{
+    struct membanks *free_regions = data;
+    paddr_t start, size;
+    paddr_t s = pfn_to_paddr(s_gfn);
+    paddr_t e = pfn_to_paddr(e_gfn);
+    unsigned int i, j;
+
+    if ( free_regions->nr_banks >= free_regions->max_banks )
+        return 0;
+
+    /*
+     * Both start and size of the free region should be 2MB aligned to
+     * potentially allow superpage mapping.
+     */
+    start = (s + SZ_2M - 1) & ~(SZ_2M - 1);
+    if ( start > e )
+        return 0;
+
+    /*
+     * e is actually "end-1" because it is called by rangeset functions
+     * which are inclusive of the last address.
+     */
+    e += 1;
+    size = (e - start) & ~(SZ_2M - 1);
+
+    /* Find the insert position (descending order). */
+    for ( i = 0; i < free_regions->nr_banks ; i++ )
+        if ( size > free_regions->bank[i].size )
+            break;
+
+    /* Move the other banks to make space. */
+    for ( j = free_regions->nr_banks; j > i ; j-- )
+    {
+        free_regions->bank[j].start = free_regions->bank[j - 1].start;
+        free_regions->bank[j].size = free_regions->bank[j - 1].size;
+    }
+
+    free_regions->bank[i].start = start;
+    free_regions->bank[i].size = size;
+    free_regions->nr_banks++;
+
+    return 0;
+}
+
+/*
+ * Find unused regions of Host address space which can be exposed to domain
+ * using the host memory layout. In order to calculate regions we exclude every
+ * region passed in mem_banks from the Host RAM.
+ */
+int __init find_unallocated_memory(const struct kernel_info *kinfo,
+                                   const struct membanks *mem_banks[],
+                                   unsigned int nr_mem_banks,
+                                   struct membanks *free_regions,
+                                   int (*cb)(unsigned long s_gfn,
+                                             unsigned long e_gfn,
+                                             void *data))
+{
+    const struct membanks *mem = bootinfo_get_mem();
+    struct rangeset *unalloc_mem;
+    paddr_t start, end;
+    unsigned int i, j;
+    int res;
+
+    ASSERT(domain_use_host_layout(kinfo->d));
+
+    unalloc_mem = rangeset_new(NULL, NULL, 0);
+    if ( !unalloc_mem )
+        return -ENOMEM;
+
+    /* Start with all available RAM */
+    for ( i = 0; i < mem->nr_banks; i++ )
+    {
+        start = mem->bank[i].start;
+        end = mem->bank[i].start + mem->bank[i].size;
+        res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
+                                 PFN_DOWN(end - 1));
+        if ( res )
+        {
+            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
+                   start, end);
+            goto out;
+        }
+    }
+
+    /* Remove all regions listed in mem_banks */
+    for ( i = 0; i < nr_mem_banks; i++ )
+        for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
+        {
+            start = mem_banks[i]->bank[j].start;
+
+            /* Shared memory banks can contain INVALID_PADDR as start */
+            if ( INVALID_PADDR == start )
+                continue;
+
+            end = mem_banks[i]->bank[j].start + mem_banks[i]->bank[j].size;
+            res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
+                                        PFN_DOWN(end - 1));
+            if ( res )
+            {
+                printk(XENLOG_ERR
+                       "Failed to add: %#"PRIpaddr"->%#"PRIpaddr", error %d\n",
+                       start, end, res);
+                goto out;
+            }
+        }
+
+    start = 0;
+    end = (1ULL << p2m_ipa_bits) - 1;
+    res = rangeset_report_ranges(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end),
+                                 cb, free_regions);
+    if ( res )
+        free_regions->nr_banks = 0;
+    else if ( !free_regions->nr_banks )
+        res = -ENOENT;
+
+out:
+    rangeset_destroy(unalloc_mem);
+
+    return res;
+}
+
+void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
+{
+    struct membanks *mem = kernel_info_get_mem(kinfo);
+    unsigned int i, nr_banks = GUEST_RAM_BANKS;
+    struct membanks *hwdom_free_mem = NULL;
+
+    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
+           /* Don't want format this as PRIpaddr (16 digit hex) */
+           (unsigned long)(kinfo->unassigned_mem >> 20), d);
+
+    mem->nr_banks = 0;
+    /*
+     * Use host memory layout for hwdom. Only case for this is when LLC coloring
+     * is enabled.
+     */
+    if ( is_hardware_domain(d) )
+    {
+        struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
+        /*
+         * Exclude the following regions:
+         * 1) Remove reserved memory
+         * 2) Grant table assigned to hwdom
+         */
+        const struct membanks *mem_banks[] = {
+            bootinfo_get_reserved_mem(),
+            gnttab,
+        };
+
+        if ( !gnttab )
+            goto fail;
+
+        gnttab->nr_banks = 1;
+        gnttab->bank[0].start = kinfo->gnttab_start;
+        gnttab->bank[0].size = kinfo->gnttab_size;
+
+        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
+                                             NR_MEM_BANKS);
+        if ( !hwdom_free_mem )
+            goto fail;
+
+        hwdom_free_mem->max_banks = NR_MEM_BANKS;
+
+        if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
+                                     hwdom_free_mem, add_hwdom_free_regions) )
+            goto fail;
+
+        nr_banks = hwdom_free_mem->nr_banks;
+        xfree(gnttab);
+    }
+
+    for ( i = 0; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_banks-- )
+    {
+        paddr_t bank_start, bank_size;
+
+        if ( is_hardware_domain(d) )
+        {
+            bank_start = hwdom_free_mem->bank[i].start;
+            bank_size = hwdom_free_mem->bank[i].size;
+        }
+        else
+        {
+            const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
+            const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
+
+            if ( i >= GUEST_RAM_BANKS )
+                goto fail;
+
+            bank_start = bankbase[i];
+            bank_size = banksize[i];
+        }
+
+        bank_size = MIN(bank_size, kinfo->unassigned_mem);
+        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), bank_size) )
+            goto fail;
+    }
+
+    if ( kinfo->unassigned_mem )
+        goto fail;
+
+    for( i = 0; i < mem->nr_banks; i++ )
+    {
+        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
+               d,
+               i,
+               mem->bank[i].start,
+               mem->bank[i].start + mem->bank[i].size,
+               /* Don't want format this as PRIpaddr (16 digit hex) */
+               (unsigned long)(mem->bank[i].size >> 20));
+    }
+
+    xfree(hwdom_free_mem);
+    return;
+
+  fail:
+    panic("Failed to allocate requested domain memory."
+          /* Don't want format this as PRIpaddr (16 digit hex) */
+          " %ldKB unallocated. Fix the VMs configurations.\n",
+          (unsigned long)kinfo->unassigned_mem >> 10);
+}
+
+/* Copy data to guest physical address, then clean the region. */
+typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
+                                               paddr_t gpa,
+                                               void *buf,
+                                               unsigned int len);
+
+void __init dtb_load(struct kernel_info *kinfo,
+                     copy_to_guest_phys_cb copy_to_guest)
+{
+    unsigned long left;
+
+    printk("Loading %pd DTB to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
+           kinfo->d, kinfo->dtb_paddr,
+           kinfo->dtb_paddr + fdt_totalsize(kinfo->fdt));
+
+    left = copy_to_guest(kinfo->d, kinfo->dtb_paddr,
+                         kinfo->fdt,
+                         fdt_totalsize(kinfo->fdt));
+
+    if ( left != 0 )
+        panic("Unable to copy the DTB to %pd memory (left = %lu bytes)\n",
+              kinfo->d, left);
+    xfree(kinfo->fdt);
+}
+
+void __init initrd_load(struct kernel_info *kinfo,
+                        copy_to_guest_phys_cb copy_to_guest)
+{
+    const struct bootmodule *mod = kinfo->initrd_bootmodule;
+    paddr_t load_addr = kinfo->initrd_paddr;
+    paddr_t paddr, len;
+    int node;
+    int res;
+    __be32 val[2];
+    __be32 *cellp;
+    void __iomem *initrd;
+
+    if ( !mod || !mod->size )
+        return;
+
+    paddr = mod->start;
+    len = mod->size;
+
+    printk("Loading %pd initrd from %"PRIpaddr" to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
+           kinfo->d, paddr, load_addr, load_addr + len);
+
+    /* Fix up linux,initrd-start and linux,initrd-end in /chosen */
+    node = fdt_path_offset(kinfo->fdt, "/chosen");
+    if ( node < 0 )
+        panic("Cannot find the /chosen node\n");
+
+    cellp = (__be32 *)val;
+    dt_set_cell(&cellp, ARRAY_SIZE(val), load_addr);
+    res = fdt_setprop_inplace(kinfo->fdt, node, "linux,initrd-start",
+                              val, sizeof(val));
+    if ( res )
+        panic("Cannot fix up \"linux,initrd-start\" property\n");
+
+    cellp = (__be32 *)val;
+    dt_set_cell(&cellp, ARRAY_SIZE(val), load_addr + len);
+    res = fdt_setprop_inplace(kinfo->fdt, node, "linux,initrd-end",
+                              val, sizeof(val));
+    if ( res )
+        panic("Cannot fix up \"linux,initrd-end\" property\n");
+
+    initrd = ioremap_wc(paddr, len);
+    if ( !initrd )
+        panic("Unable to map the hwdom initrd\n");
+
+    res = copy_to_guest(kinfo->d, load_addr,
+                        initrd, len);
+    if ( res != 0 )
+        panic("Unable to copy the initrd in the hwdom memory\n");
+
+    iounmap(initrd);
+}
diff --git a/xen/include/asm-generic/domain-build.h b/xen/include/asm-generic/domain-build.h
index 237f94d0c3..4119d6e329 100644
--- a/xen/include/asm-generic/domain-build.h
+++ b/xen/include/asm-generic/domain-build.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_GENERIC_DOMAIN_BUILD_H__
 #define __ASM_GENERIC_DOMAIN_BUILD_H__
 
+#include <xen/mm.h>
 #include <xen/types.h>
 
 struct domain;
@@ -26,7 +27,37 @@ int make_memory_node(const struct kernel_info *kinfo, int addrcells,
                      int sizecells, const struct membanks *mem);
 int make_timer_node(const struct kernel_info *kinfo);
 
-unsigned int get_allocation_size(paddr_t size);
+
+static inline int get_allocation_size(paddr_t size)
+{
+    /*
+     * get_order_from_bytes returns the order greater than or equal to
+     * the given size, but we need less than or equal. Adding one to
+     * the size pushes an evenly aligned size into the next order, so
+     * we can then unconditionally subtract 1 from the order which is
+     * returned.
+     */
+    return get_order_from_bytes(size + 1) - 1;
+}
+
+typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
+                                               paddr_t gpa,
+                                               void *buf,
+                                               unsigned int len);
+
+void initrd_load(struct kernel_info *kinfo,
+                 copy_to_guest_phys_cb copy_to_guest);
+
+void dtb_load(struct kernel_info *kinfo,
+              copy_to_guest_phys_cb copy_to_guest);
+
+int find_unallocated_memory(const struct kernel_info *kinfo,
+                            const struct membanks *mem_banks[],
+                            unsigned int nr_mem_banks,
+                            struct membanks *free_regions,
+                            int (*cb)(unsigned long s_gfn,
+                                      unsigned long e_gfn,
+                                      void *data));
 
 
 #endif /* __ASM_GENERIC_DOMAIN_BUILD_H__ */
-- 
2.47.1


