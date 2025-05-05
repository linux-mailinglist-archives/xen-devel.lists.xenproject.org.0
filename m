Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C41AA9B3C
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 20:11:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976212.1363473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC0HE-0007XR-GE; Mon, 05 May 2025 18:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976212.1363473; Mon, 05 May 2025 18:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC0HE-0007UA-9f; Mon, 05 May 2025 18:10:52 +0000
Received: by outflank-mailman (input) for mailman id 976212;
 Mon, 05 May 2025 18:10:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdRb=XV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uC0HB-000675-FF
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 18:10:49 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44ef776e-29dc-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 20:10:47 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac2902f7c2aso755614966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 11:10:47 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189146fcbsm530372366b.34.2025.05.05.11.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 11:10:45 -0700 (PDT)
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
X-Inumbo-ID: 44ef776e-29dc-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746468647; x=1747073447; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpVFgkcPQ6fPs9H/PlKDyxVc95bTNIcIchbqC+uj+ME=;
        b=KvPr6GdmCdHQV5/iQXHYFee5+Fp3kRRpC4TBMrGjvWWbGmar2xlTAj/dcNfdGrVmRj
         6cMQJkfoM1ogvIVMjo+ypnxnDDvsecCWfQRaeOfINzkmUTgcZHwwa2tfhDU3xUOWo5rx
         iqdjJFzxtBiQp9tFhNGVFiGopKVnsmZP5nvDtnchV73w2FkCuysAfAEf0DaqD0478R8P
         gw8HAMHCplWY4rz14VuLUbyHjgCzwac42JbLZq4bLmM5Bq0r4LwQhfiuI5q3jafeR04D
         G46XKHwE64xfPkvqe2iUyYqfAD4IRzW5dGKzEImCMcowrwn0XXRAHS+BEQhRf3bOTuiz
         PbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746468647; x=1747073447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpVFgkcPQ6fPs9H/PlKDyxVc95bTNIcIchbqC+uj+ME=;
        b=LnY/cb2IYhi4kK3I7hoJdp2yoLpPMFAEteOtMnrCS9ZpkjHIqh996jj3ug+Kljj92B
         rjTaIbf9eIKOkegj/h5hHGKGg9Lylu2H7hpdYqoF9uwsnvMXxu2lcamYNFsXOrvrBphd
         zTFNKbUxGNsnrMmj9X2Rw8bWM2vVqbt2FtimcB+D5qWt6UnTtxX2pI3Ar2sp5aZp2589
         K6DqHZw8lmUgoZUGJSaYYqUKcQInVOPU4yGmFOSycDkYd6M5oLdAqKCf9r654rEMqwvt
         vKAs8GSwZgXSoNLPImk+B3hxSKE0DkXh8Dp0sb6tABl2HttixAYWW/tBJ+zgaK8WrkQ4
         RUqw==
X-Gm-Message-State: AOJu0YyztQRKYWtSbCqpuHRngLELjPY+00ObRAlXDq6QroaJILrusmVk
	pa9nByWXV3HVigzynq+69HX64R83NU4m4oTQg/l8RSpwLNzHNFwMo6pkSw==
X-Gm-Gg: ASbGnctm6CKv5rD5DI+lJSdYWJPrX+AOo6u5hJY4LpTffRnxn2poerr6uWEe9Kk6NAK
	dbcip/IQi8axTqjYiTZOjM9f5ZIWXHzJTse1uFL5ALD9StUx9/MjSZckHt/bz9T10RYynnLgccY
	iPVHOJVDCt9/pmShkH8SaBZ3luMWDHuYo+E7xYf8Q/qMrQC8z4ILDHrQOwSp7v+QzX19ZjVylxt
	bTEYZu2yC2ycMMx3bae96usBU77eQNCzWtvQ4kU8ijaC4BXH42Oq5Ok3OpkB78dFNQBdkjiGP2i
	Vj4CqIsWeSJlFVmRQRyXCV1zNS7J0q1Z6xATyoJr+s/A/659fWv2gp16msp2R50zYL/xEMQkbEl
	dgFBoraoO0g==
X-Google-Smtp-Source: AGHT+IGRhBzizUlE8RqkE341hku/cyOcX635xFjrJDUInJP70tQYN4dzmbu3NGRJdn/q9DY674auoQ==
X-Received: by 2002:a17:907:7f8b:b0:acb:63a4:e8e5 with SMTP id a640c23a62f3a-ad1a48bc622mr780802066b.6.1746468646378;
        Mon, 05 May 2025 11:10:46 -0700 (PDT)
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
Subject: [PATCH v4 7/8] xen/common: dom0less: introduce common domain-build.c
Date: Mon,  5 May 2025 20:10:37 +0200
Message-ID: <0bfc572f0d82e9d81bbc07bab5b6b7fb0d7634f8.1746468003.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746468003.git.oleksii.kurochko@gmail.com>
References: <cover.1746468003.git.oleksii.kurochko@gmail.com>
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
Change in v4:
 - Move declaration of alloc_*() and get_allocation_size() to xen/fdt-domain-build.h.
 - Allocate gnttab using membanks_xzalloc(1, MEMORY) to have gnttab->max_banks
   and gnttab->type properly set.
 - Allocate hwdom_free_mem using membanks_xzalloc(NR_MEM_BANKS, MEMORY) to
   have hwdom_free_mem->type proprely set.
 - Drop introduction of function callbacktype: copy_to_guest_phys_cb() as it
   is already introduced in xen/fdt-domain-build.h.
 - Return original panic messages at the end of initrd_load() as I missed to
   align them with the newest staging. There were changed in the patch:
   "xen/arm: Don't blindly print hwdom in generic panic messages".
---
Change in v3:
 - Nothing changed. Only rebase.
---
Change in v2:
 - Use xen/fdt-domain-build.h instead of asm/domain_build.h.
---
 xen/arch/arm/domain_build.c             | 397 +-----------------------
 xen/arch/arm/include/asm/domain_build.h |  10 -
 xen/common/device-tree/Makefile         |   1 +
 xen/common/device-tree/domain-build.c   | 395 +++++++++++++++++++++++
 xen/include/xen/fdt-domain-build.h      |  40 +++
 5 files changed, 438 insertions(+), 405 deletions(-)
 create mode 100644 xen/common/device-tree/domain-build.c

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9d649b06b3..df29619c40 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -120,18 +120,6 @@ struct vcpu *__init alloc_dom0_vcpu0(struct domain *dom0)
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
@@ -418,98 +406,6 @@ static void __init allocate_memory_11(struct domain *d,
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
@@ -900,226 +796,6 @@ int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
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
-        struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
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
-        hwdom_free_mem = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
-        if ( !hwdom_free_mem )
-            goto fail;
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
@@ -2059,75 +1735,6 @@ static int __init prepare_dtb_hwdom(struct domain *d, struct kernel_info *kinfo)
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
-        panic("Unable to map the %pd initrd\n", kinfo->d);
-
-    res = copy_to_guest_phys_flush_dcache(kinfo->d, load_addr,
-                                          initrd, len);
-    if ( res != 0 )
-        panic("Unable to copy the initrd in the %pd memory\n", kinfo->d);
-
-    iounmap(initrd);
-}
-
 /*
  * Allocate the event channel PPIs and setup the HVM_PARAM_CALLBACK_IRQ.
  * The allocated IRQ will be found in d->arch.evtchn_irq.
@@ -2220,8 +1827,8 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
      */
     kernel_load(kinfo);
     /* initrd_load will fix up the fdt, so call it before dtb_load */
-    initrd_load(kinfo);
-    dtb_load(kinfo);
+    initrd_load(kinfo, copy_to_guest_phys_flush_dcache);
+    dtb_load(kinfo, copy_to_guest_phys_flush_dcache);
 
     memset(regs, 0, sizeof(*regs));
 
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 9d72108f35..9655e9d453 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -5,20 +5,10 @@
 #include <xen/sched.h>
 
 typedef __be32 gic_interrupt_t[3];
-typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
-                                     unsigned int order, void *extra);
-bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
-                             alloc_domheap_mem_cb cb, void *extra);
-
-bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
-                          paddr_t tot_size);
-void allocate_memory(struct domain *d, struct kernel_info *kinfo);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
 int make_psci_node(void *fdt);
 void evtchn_allocate(struct domain *d);
 
-unsigned int get_allocation_size(paddr_t size);
-
 /*
  * Helper to write an interrupts with the GIC format
  * This code is assuming the irq is an PPI.
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
index 0000000000..762b63e2b0
--- /dev/null
+++ b/xen/common/device-tree/domain-build.c
@@ -0,0 +1,395 @@
+#include <xen/bootfdt.h>
+#include <xen/fdt-domain-build.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/mm.h>
+#include <xen/sched.h>
+#include <xen/sizes.h>
+#include <xen/types.h>
+#include <xen/vmap.h>
+
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
+        struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
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
+        hwdom_free_mem = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
+        if ( !hwdom_free_mem )
+            goto fail;
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
+        panic("Unable to map the %pd initrd\n", kinfo->d);
+
+    res = copy_to_guest(kinfo->d, load_addr,
+                        initrd, len);
+    if ( res != 0 )
+        panic("Unable to copy the initrd in the %pd memory\n", kinfo->d);
+
+    iounmap(initrd);
+}
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index 30d5358a0f..45981dbec0 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -6,12 +6,21 @@
 #include <xen/bootfdt.h>
 #include <xen/device_tree.h>
 #include <xen/fdt-kernel.h>
+#include <xen/mm.h>
 #include <xen/types.h>
 
 struct domain;
 struct page_info;
 struct membanks;
 
+typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
+                                     unsigned int order, void *extra);
+bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
+                             alloc_domheap_mem_cb cb, void *extra);
+
+bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
+                          paddr_t tot_size);
+void allocate_memory(struct domain *d, struct kernel_info *kinfo);
 int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int construct_hwdom(struct kernel_info *kinfo,
                     const struct dt_device_node *node);
@@ -23,6 +32,37 @@ int make_memory_node(const struct kernel_info *kinfo, int addrcells,
                      int sizecells, const struct membanks *mem);
 int make_timer_node(const struct kernel_info *kinfo);
 
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
+
 #endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
 
 /*
-- 
2.49.0


