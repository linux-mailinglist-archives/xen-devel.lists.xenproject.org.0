Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADF3538BD2
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 09:09:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339122.563955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvvzj-0000wg-0H; Tue, 31 May 2022 07:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339122.563955; Tue, 31 May 2022 07:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvvzi-0000qB-Lm; Tue, 31 May 2022 07:08:46 +0000
Received: by outflank-mailman (input) for mailman id 339122;
 Tue, 31 May 2022 06:57:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfOh=WH=gmail.com=xiexun162534@srs-se1.protection.inumbo.net>)
 id 1nvvpG-00080v-8j
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 06:57:58 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcff5801-e0ae-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 08:57:51 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id s24so9970727wrb.10
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 23:57:56 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::944:e002])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a05600c4f5300b003942a244f2esm1322707wmq.7.2022.05.30.23.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 23:57:55 -0700 (PDT)
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
X-Inumbo-ID: fcff5801-e0ae-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eX+ztoF4ccJF8k/eqM9yWtCts93a8EoroUDLXMjz3+c=;
        b=No8PvNxyNem0mBq0AAqZNlO/B8Sa7VmBm0BYQzDRGDwhGgIwH771G5tX8l1C199ZEF
         XgihrXOLf/x4+LJNXBNgQp0UCE7iRUHBvFA6Pn/c5iNneoNOldgvVlXbv5DzW41yDYuL
         zqugKijI3zr0lemPTJjMjgXh+yPKQTn8fZg7T+nbpfp3B2JTFgWLs/MYDuYDQvBo5QTv
         gd3SHk+UvldhL+oTLuBCTrIcUFBtpRtU86s+8IC3gsBaL9krAWU0DJNeA+5pNm8PtTnh
         +FHvN72N2C1MA3BuwKcKDdqfc/WGBpXOECn+qqIoFYO8s4E9WNqgVlOg3kvTGkH1M2rl
         FRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eX+ztoF4ccJF8k/eqM9yWtCts93a8EoroUDLXMjz3+c=;
        b=2aFI5eYNxMFS58qINv1UF1UFoFN8VGhg9eVteMpuPcixMI1pcahTkgEvkIJXZQhN6l
         OvAVBef9hOYRFaYiKfq2tVdncN2oH8Sgi/Lp7r8IrxQkRalyO9ofxaZ+nOJSRiIR5l7Z
         jQKD33vwTWft4lIAJNCUWoEowhSyeoCpZhFNwMJh2Wq9VSqYvS02vXXkmQ+/VyfNNOJd
         ra8lca3Xdlg/avGObql1AFaYr5zs1waBoaFzv2oHyODQWOJjJpZ4Vj2qDflW0o0MGTgG
         I9xEJt9ixa2IdEevlpr40eP/qpfhMjWnIa63EUsJKGr07UzRkBeetorWkuHsdEFx58ms
         39/Q==
X-Gm-Message-State: AOAM532vVjlAL04z+eDcjwEn5gsNeGgLK7qj825sEtVMW4F3tBoj5phB
	JCjkxv1/y/Ay0AH6/DNc82I6TX5V/Vc=
X-Google-Smtp-Source: ABdhPJwpu7/xA7yXAXr68E7aFhi7RWpGZld0Yat8+AE4OcjjJKMVLWopCdMwcFhHh0eKynSB3/zAiw==
X-Received: by 2002:adf:f38f:0:b0:210:30cf:6e4a with SMTP id m15-20020adff38f000000b0021030cf6e4amr8560078wro.676.1653980275934;
        Mon, 30 May 2022 23:57:55 -0700 (PDT)
From: Xie Xun <xiexun162534@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xie Xun <xiexun162534@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [RFC PATCH 2/6] xen/riscv: Add early page table setup code.
Date: Tue, 31 May 2022 14:57:08 +0800
Message-Id: <94a7c66306c31113c808f2a33664ab84b09db4ec.1653977696.git.xiexun162534@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1653977696.git.xiexun162534@gmail.com>
References: <cover.1653977696.git.xiexun162534@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This code sets up initial page table.

Signed-off-by: Xie Xun <xiexun162534@gmail.com>
---
 xen/arch/riscv/mm.c | 224 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 224 insertions(+)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index f366b1ca0c..074a2a4396 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -81,6 +81,17 @@ unsigned long xenheap_base_pdx __read_mostly;
 unsigned long frametable_virt_end __read_mostly;
 unsigned long frametable_base_pdx;
 
+/*
+ * xen_second_pagetable is indexed with the VPN[2] page table entry field
+ * xen_first_pagetable is accessed from the VPN[1] page table entry field
+ * xen_zeroeth_pagetable is accessed from the VPN[0] page table entry field
+ */
+pte_t xen_second_pagetable[PAGE_ENTRIES] __attribute__((__aligned__(4096)));
+static pte_t xen_first_pagetable[PAGE_ENTRIES]
+    __attribute__((__aligned__(4096)));
+static pte_t xen_zeroeth_pagetable[PAGE_ENTRIES]
+    __attribute__((__aligned__(4096)));
+
 static pte_t xen_fixmap[PAGE_ENTRIES] __attribute__((__aligned__(4096)));
 
 #define THIS_CPU_PGTABLE xen_second_pagetable
@@ -374,6 +385,219 @@ unsigned long get_upper_mfn_bound(void)
     return max_page - 1;
 }
 
+/* Set up leaf pages in a first-level page table. */
+void setup_megapages(pte_t *first_pagetable, unsigned long virtual_start,
+                     unsigned long physical_start, unsigned long page_cnt)
+{
+    unsigned long frame_addr = physical_start;
+    unsigned long end = physical_start + (page_cnt << PAGE_SHIFT);
+    unsigned long vaddr = virtual_start;
+    unsigned long index;
+    pte_t *p;
+
+    BUG_ON(!IS_ALIGNED(physical_start, FIRST_SIZE));
+
+    while ( frame_addr < end )
+    {
+        index = pagetable_first_index(vaddr);
+        p = &first_pagetable[index];
+        p->pte = paddr_to_megapage_ppn(frame_addr);
+        p->pte |= PTE_LEAF_DEFAULT;
+
+        frame_addr += FIRST_SIZE;
+        vaddr += FIRST_SIZE;
+    }
+}
+
+#define resolve_early_addr(x) \
+    ({                                                                          \
+         unsigned long * __##x;                                                 \
+        if ( load_addr_start <= x && x < load_addr_end )                        \
+            __##x = (unsigned long *)x;                                         \
+        else                                                                    \
+            __##x = (unsigned long *)(x + load_addr_start - linker_addr_start); \
+        __##x;                                                                  \
+     })
+
+void __init clear_pagetables(unsigned long load_addr_start,
+                             unsigned long load_addr_end,
+                             unsigned long linker_addr_start,
+                             unsigned long linker_addr_end)
+{
+    unsigned long *p;
+    unsigned long page;
+    unsigned long i;
+
+    page = (unsigned long)&xen_second_pagetable[0];
+
+    p = resolve_early_addr(page);
+    for ( i = 0; i < ARRAY_SIZE(xen_second_pagetable); i++ )
+    {
+        p[i] = 0ULL;
+    }
+
+    page = (unsigned long)&xen_first_pagetable[0];
+    p = resolve_early_addr(page);
+    for ( i = 0; i < ARRAY_SIZE(xen_first_pagetable); i++ )
+    {
+        p[i] = 0ULL;
+    }
+
+    page = (unsigned long)&xen_zeroeth_pagetable[0];
+    p = resolve_early_addr(page);
+    for ( i = 0; i < ARRAY_SIZE(xen_zeroeth_pagetable); i++ )
+    {
+        p[i] = 0ULL;
+    }
+}
+
+void __attribute__((section(".entry")))
+setup_initial_pagetables(pte_t *second, pte_t *first, pte_t *zeroeth,
+                         unsigned long map_start, unsigned long map_end,
+                         unsigned long pa_start)
+{
+    unsigned long page_addr;
+    unsigned long index2;
+    unsigned long index1;
+    unsigned long index0;
+
+    /* align start addresses */
+    map_start &= ZEROETH_MAP_MASK;
+    pa_start &= ZEROETH_MAP_MASK;
+
+    page_addr = map_start;
+    while ( page_addr < map_end )
+    {
+        index2 = pagetable_second_index(page_addr);
+        index1 = pagetable_first_index(page_addr);
+        index0 = pagetable_zeroeth_index(page_addr);
+
+        /* Setup level2 table */
+        second[index2] = paddr_to_pte((unsigned long)first);
+        second[index2].pte |= PTE_TABLE;
+
+        /* Setup level1 table */
+        first[index1] = paddr_to_pte((unsigned long)zeroeth);
+        first[index1].pte |= PTE_TABLE;
+
+        /* Setup level0 table */
+        if ( !pte_is_valid(&zeroeth[index0]) )
+        {
+            /* Update level0 table */
+            zeroeth[index0] = paddr_to_pte((page_addr - map_start) + pa_start);
+            zeroeth[index0].pte |= PTE_LEAF_DEFAULT;
+        }
+
+        /* Point to next page */
+        page_addr += ZEROETH_SIZE;
+    }
+}
+
+/*
+ * WARNING: load_addr() and linker_addr() are to be called only when the MMU is
+ * disabled and only when executed by the primary CPU.  They cannot refer to
+ * any global variable or functions.
+ */
+
+/*
+ * Convert an addressed layed out at link time to the address where it was loaded
+ * by the bootloader.
+ */
+#define load_addr(linker_address)                                              \
+    ({                                                                         \
+        unsigned long __linker_address = (unsigned long)(linker_address);      \
+        if ( linker_addr_start <= __linker_address &&                           \
+            __linker_address < linker_addr_end )                                \
+        {                                                                      \
+            __linker_address =                                                 \
+                __linker_address - linker_addr_start + load_addr_start;        \
+        }                                                                      \
+        __linker_address;                                                      \
+    })
+
+/* Convert boot-time Xen address from where it was loaded by the boot loader to the address it was layed out
+ * at link-time.
+ */
+#define linker_addr(load_address)                                              \
+    ({                                                                         \
+        unsigned long __load_address = (unsigned long)(load_address);          \
+        if ( load_addr_start <= __load_address &&                               \
+            __load_address < load_addr_end )                                    \
+        {                                                                      \
+            __load_address =                                                   \
+                __load_address - load_addr_start + linker_addr_start;          \
+        }                                                                      \
+        __load_address;                                                        \
+    })
+
+/*
+ * _setup_initial_pagetables:
+ *
+ * 1) Build the page tables for Xen that map the following:
+ *   1.1)  The physical location of Xen (where the bootloader loaded it)
+ *   1.2)  The link-time location of Xen (where the linker expected Xen's
+ *         addresses to be)
+ * 2) Load the page table into the SATP and enable the MMU
+ */
+void __attribute__((section(".entry")))
+_setup_initial_pagetables(unsigned long load_addr_start,
+                          unsigned long load_addr_end,
+                          unsigned long linker_addr_start,
+                          unsigned long linker_addr_end)
+{
+    pte_t *second;
+    pte_t *first;
+    pte_t *zeroeth;
+
+    clear_pagetables(load_addr_start, load_addr_end,
+                     linker_addr_start, linker_addr_end);
+
+    /* Get the addresses where the page tables were loaded */
+    second = (pte_t *)load_addr(&xen_second_pagetable);
+    first = (pte_t *)load_addr(&xen_first_pagetable);
+    zeroeth = (pte_t *)load_addr(&xen_zeroeth_pagetable);
+
+    /*
+     * Create a mapping of the load time address range to... the load time address range.
+     * This mapping is used at boot time only.
+     */
+    setup_initial_pagetables(second, first, zeroeth, load_addr_start,
+                             load_addr_end, load_addr_start);
+
+    /*
+     * Create a mapping from Xen's link-time addresses to where they were actually loaded.
+     *
+     * TODO: Protect regions accordingly (e.g., protect text and rodata from writes).
+     */
+    setup_initial_pagetables(second, first, zeroeth, linker_addr(&_text_start),
+                             linker_addr(&_text_end), load_addr(&_text_start));
+    setup_initial_pagetables(second, first, zeroeth, linker_addr(&_init_start),
+                             linker_addr(&_init_end), load_addr(&_init_start));
+    setup_initial_pagetables(second, first, zeroeth,
+                             linker_addr(&_cpuinit_start),
+                             linker_addr(&_cpuinit_end),
+                             load_addr(&_cpuinit_start));
+    setup_initial_pagetables(second, first, zeroeth,
+                             linker_addr(&_spinlock_start),
+                             linker_addr(&_spinlock_end),
+                             load_addr(&_spinlock_start));
+    setup_initial_pagetables(second, first, zeroeth,
+                             linker_addr(&_rodata_start),
+                             linker_addr(&_rodata_end),
+                             load_addr(&_rodata_start));
+    setup_initial_pagetables(second, first, zeroeth, linker_addr_start,
+                             linker_addr_end, load_addr_start);
+
+    /* Ensure page table writes precede loading the SATP */
+    asm volatile("sfence.vma");
+
+    /* Enable the MMU and load the new pagetable for Xen */
+    csr_write(CSR_SATP,
+              (load_addr(xen_second_pagetable) >> PAGE_SHIFT) | SATP_MODE_SV39 << SATP_MODE_SHIFT);
+
+    phys_offset = load_addr_start - linker_addr_start;
+}
+
 /*
  * Map the table that pte points to.
  */
-- 
2.30.2


