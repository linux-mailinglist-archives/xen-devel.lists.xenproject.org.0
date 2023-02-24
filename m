Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E36A1E01
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501138.772758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZel-0006hU-QR; Fri, 24 Feb 2023 15:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501138.772758; Fri, 24 Feb 2023 15:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZel-0006eQ-MD; Fri, 24 Feb 2023 15:06:43 +0000
Received: by outflank-mailman (input) for mailman id 501138;
 Fri, 24 Feb 2023 15:06:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVZek-0006Ou-Lj
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:06:42 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d85a0d9d-b454-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 16:06:41 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id k14so17292450lfj.7
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 07:06:41 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 d23-20020ac25457000000b004d863fa8681sm1492443lfn.173.2023.02.24.07.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 07:06:40 -0800 (PST)
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
X-Inumbo-ID: d85a0d9d-b454-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXawhnE5jkqhZOoZruY5CrZc+i29kTMYxJVObGHfjMI=;
        b=Cu5oxsw7VJsw/LxVADe9BvwNUZR4vaXCU4C2+tIt4O2iPhdW76P3bb0wtbdl2QXB7/
         wlFhr7JuYwZExbKAfDBco+cFcNpGaAaZZbgnSd77ibALk0nZ/SYB496Gsh46uEMBgfGa
         hAbY2Mn6cTVUoW2sgOMtvQ0m8D7A2PSDODsfv0U5TjBCWjVpQCbqPDVrm2QfkLa2xdd3
         CI8mvdLCODbKNwyFfstHs4PA6DG+rmgXPH0iGBXDeZxzRmAn6wC+5OrKKavDl085Lm2V
         FaFnACEiqndlnyvg6YQRFVSc7SuQN9+Ep7WQpORuR3AlI/9IuL0ZeMfpRar5qmXtyt2h
         91pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXawhnE5jkqhZOoZruY5CrZc+i29kTMYxJVObGHfjMI=;
        b=Dqp/tX72vmeOwxm2jVoi13yBCMPQEaclcUYwxp8CAhsi+XrW/RmRuLi6qCLhrOKYRj
         vur4VwyDUvQUo7DJzodHeZKUp9rx74GERuz3DTIzOI81xIlTmDu05yPp4oE/ZdKDtosO
         G8oDczrJigRPQPJO+21X+SRdmQar/7bWICQa+JNBgG8qXXFYWFLoHuxd9HKginID2C0U
         ZNM0gCjzawUbyt+PDi8jbUIM4IWj6XVH7waQC0gvxIjMw/8PwOJVTR4iGyLXzVaKMXMR
         g1mlIGsABOoR0zZR4giCMUvjgWkt7fDND2iGrd8ndD6SGOpy6ihRm3n57fBQ6qHQqIQZ
         p/EQ==
X-Gm-Message-State: AO0yUKVjsziUwrNvE8qs3/IU2W/alCjS8qvSLP9LzfyDzAxQXStKvQiT
	TZOw4eRD3Co0a8u2GQg2HK9IYUxlvC4=
X-Google-Smtp-Source: AK7set86tEFDgJknJHgH2TlaUlv4gl/KdDVxTIX/gEUSUMZtLJNIBzmst4hjSM6Kwvax+5AsBN5fGA==
X-Received: by 2002:ac2:59d9:0:b0:4dc:260e:6b59 with SMTP id x25-20020ac259d9000000b004dc260e6b59mr5945954lfn.40.1677251201252;
        Fri, 24 Feb 2023 07:06:41 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 1/3] xen/riscv: introduce setup_initial_pages
Date: Fri, 24 Feb 2023 17:06:33 +0200
Message-Id: <a145fbbfb166d9f6bd4859b669d23a1f52004b2b.1677250203.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677250203.git.oleksii.kurochko@gmail.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mostly the code for setup_initial_pages was taken from Bobby's
repo except for the following changes:
* Use only a minimal part of the code enough to enable MMU
* rename {_}setup_initial_pagetables functions
* add writable argument for _setup_initial_pagetables to have
  an opportunity to make some sections read-only
* update setup_initial_pagetables function to make some sections
  read-only
* change the order of _setup_inital_pagetables()
  in setup_initial_pagetable():
  * first it is called for text, init, rodata sections
  * after call it for ranges [link_addr_start : link_addr_end] and
    [load_addr_start : load_addr_end]
  Before it was done first for the ranges and after for sections but
  in that case read-only status will be equal to 'true' and
  as sections' addresses  can/are inside the ranges the read-only status
  won't be updated for them as it was set up before.

Origin: https://gitlab.com/xen-on-risc-v/xen/-/tree/riscv-rebase 4af165b468af
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile           |   1 +
 xen/arch/riscv/include/asm/mm.h   |   9 ++
 xen/arch/riscv/include/asm/page.h |  90 ++++++++++++
 xen/arch/riscv/mm.c               | 223 ++++++++++++++++++++++++++++++
 4 files changed, 323 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/mm.h
 create mode 100644 xen/arch/riscv/include/asm/page.h
 create mode 100644 xen/arch/riscv/mm.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 443f6bf15f..956ceb02df 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
+obj-y += mm.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
new file mode 100644
index 0000000000..fc1866b1d8
--- /dev/null
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -0,0 +1,9 @@
+#ifndef _ASM_RISCV_MM_H
+#define _ASM_RISCV_MM_H
+
+void setup_initial_pagetables(unsigned long load_addr_start,
+                              unsigned long load_addr_end,
+                              unsigned long linker_addr_start,
+                              unsigned long linker_addr_end);
+
+#endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
new file mode 100644
index 0000000000..fabbe1305f
--- /dev/null
+++ b/xen/arch/riscv/include/asm/page.h
@@ -0,0 +1,90 @@
+#ifndef _ASM_RISCV_PAGE_H
+#define _ASM_RISCV_PAGE_H
+
+#include <xen/const.h>
+#include <xen/types.h>
+
+#define PAGE_ENTRIES            512
+#define VPN_BITS                (9)
+#define VPN_MASK                ((unsigned long)((1 << VPN_BITS) - 1))
+
+#ifdef CONFIG_RISCV_64
+/* L3 index Bit[47:39] */
+#define THIRD_SHIFT             (39)
+#define THIRD_MASK              (VPN_MASK << THIRD_SHIFT)
+/* L2 index Bit[38:30] */
+#define SECOND_SHIFT            (30)
+#define SECOND_MASK             (VPN_MASK << SECOND_SHIFT)
+/* L1 index Bit[29:21] */
+#define FIRST_SHIFT             (21)
+#define FIRST_MASK              (VPN_MASK << FIRST_SHIFT)
+/* L0 index Bit[20:12] */
+#define ZEROETH_SHIFT           (12)
+#define ZEROETH_MASK            (VPN_MASK << ZEROETH_SHIFT)
+
+#else // CONFIG_RISCV_32
+
+/* L1 index Bit[31:22] */
+#define FIRST_SHIFT             (22)
+#define FIRST_MASK              (VPN_MASK << FIRST_SHIFT)
+
+/* L0 index Bit[21:12] */
+#define ZEROETH_SHIFT           (12)
+#define ZEROETH_MASK            (VPN_MASK << ZEROETH_SHIFT)
+#endif
+
+#define THIRD_SIZE              (1 << THIRD_SHIFT)
+#define THIRD_MAP_MASK          (~(THIRD_SIZE - 1))
+#define SECOND_SIZE             (1 << SECOND_SHIFT)
+#define SECOND_MAP_MASK         (~(SECOND_SIZE - 1))
+#define FIRST_SIZE              (1 << FIRST_SHIFT)
+#define FIRST_MAP_MASK          (~(FIRST_SIZE - 1))
+#define ZEROETH_SIZE            (1 << ZEROETH_SHIFT)
+#define ZEROETH_MAP_MASK        (~(ZEROETH_SIZE - 1))
+
+#define PTE_SHIFT               10
+
+#define PTE_VALID               BIT(0, UL)
+#define PTE_READABLE            BIT(1, UL)
+#define PTE_WRITABLE            BIT(2, UL)
+#define PTE_EXECUTABLE          BIT(3, UL)
+#define PTE_USER                BIT(4, UL)
+#define PTE_GLOBAL              BIT(5, UL)
+#define PTE_ACCESSED            BIT(6, UL)
+#define PTE_DIRTY               BIT(7, UL)
+#define PTE_RSW                 (BIT(8, UL) | BIT(9, UL))
+
+#define PTE_LEAF_DEFAULT        (PTE_VALID | PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
+#define PTE_TABLE               (PTE_VALID)
+
+/* Calculate the offsets into the pagetables for a given VA */
+#define zeroeth_linear_offset(va)   ((va) >> ZEROETH_SHIFT)
+#define first_linear_offset(va)     ((va) >> FIRST_SHIFT)
+#define second_linear_offset(va)    ((va) >> SECOND_SHIFT)
+#define third_linear_offset(va)     ((va) >> THIRD_SHIFT)
+
+#define pagetable_zeroeth_index(va) zeroeth_linear_offset((va) & ZEROETH_MASK)
+#define pagetable_first_index(va)   first_linear_offset((va) & FIRST_MASK)
+#define pagetable_second_index(va)  second_linear_offset((va) & SECOND_MASK)
+#define pagetable_third_index(va)   third_linear_offset((va) & THIRD_MASK)
+
+/* Page Table entry */
+typedef struct {
+    uint64_t pte;
+} pte_t;
+
+/* Shift the VPN[x] or PPN[x] fields of a virtual or physical address
+ * to become the shifted PPN[x] fields of a page table entry */
+#define addr_to_ppn(x) (((x) >> PAGE_SHIFT) << PTE_SHIFT)
+
+static inline pte_t paddr_to_pte(unsigned long paddr)
+{
+    return (pte_t) { .pte = addr_to_ppn(paddr) };
+}
+
+static inline bool pte_is_valid(pte_t *p)
+{
+    return p->pte & PTE_VALID;
+}
+
+#endif /* _ASM_RISCV_PAGE_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
new file mode 100644
index 0000000000..6e172376eb
--- /dev/null
+++ b/xen/arch/riscv/mm.c
@@ -0,0 +1,223 @@
+#include <xen/init.h>
+#include <xen/lib.h>
+
+#include <asm/csr.h>
+#include <asm/mm.h>
+#include <asm/page.h>
+
+/*
+ * xen_second_pagetable is indexed with the VPN[2] page table entry field
+ * xen_first_pagetable is accessed from the VPN[1] page table entry field
+ * xen_zeroeth_pagetable is accessed from the VPN[0] page table entry field
+ */
+pte_t xen_second_pagetable[PAGE_ENTRIES] __attribute__((__aligned__(PAGE_SIZE)));
+static pte_t xen_first_pagetable[PAGE_ENTRIES]
+    __attribute__((__aligned__(PAGE_SIZE)));
+static pte_t xen_zeroeth_pagetable[PAGE_ENTRIES]
+    __attribute__((__aligned__(PAGE_SIZE)));
+
+extern unsigned long _stext;
+extern unsigned long _etext;
+extern unsigned long __init_begin;
+extern unsigned long __init_end;
+extern unsigned long _srodata;
+extern unsigned long _erodata;
+
+paddr_t phys_offset;
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
+static void __init clear_pagetables(unsigned long load_addr_start,
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
+        if ( linker_addr_start <= __linker_address &&                          \
+            __linker_address < linker_addr_end )                               \
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
+        if ( load_addr_start <= __load_address &&                              \
+            __load_address < load_addr_end )                                   \
+        {                                                                      \
+            __load_address =                                                   \
+                __load_address - load_addr_start + linker_addr_start;          \
+        }                                                                      \
+        __load_address;                                                        \
+    })
+
+static void __attribute__((section(".entry")))
+_setup_initial_pagetables(pte_t *second, pte_t *first, pte_t *zeroeth,
+                         unsigned long map_start,
+                         unsigned long map_end,
+                         unsigned long pa_start,
+                         bool writable)
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
+            zeroeth[index0].pte &= ~((!writable) ? PTE_WRITABLE : 0);
+        }
+
+        /* Point to next page */
+        page_addr += ZEROETH_SIZE;
+    }
+}
+
+/*
+ * setup_initial_pagetables:
+ *
+ * 1) Build the page tables for Xen that map the following:
+ *   1.1)  The physical location of Xen (where the bootloader loaded it)
+ *   1.2)  The link-time location of Xen (where the linker expected Xen's
+ *         addresses to be)
+ * 2) Load the page table into the SATP and enable the MMU
+ */
+void __attribute__((section(".entry")))
+setup_initial_pagetables(unsigned long load_addr_start,
+                         unsigned long load_addr_end,
+                         unsigned long linker_addr_start,
+                         unsigned long linker_addr_end)
+{
+    pte_t *second;
+    pte_t *first;
+    pte_t *zeroeth;
+
+    clear_pagetables(load_addr_start, load_addr_end,
+                     linker_addr_start, linker_addr_end);
+
+    /* Get the addresses where the page tables were loaded */
+    second  = (pte_t *)load_addr(&xen_second_pagetable);
+    first   = (pte_t *)load_addr(&xen_first_pagetable);
+    zeroeth = (pte_t *)load_addr(&xen_zeroeth_pagetable);
+
+    /*
+     * Create a mapping from Xen's link-time addresses to where they were actually loaded.
+     */
+    _setup_initial_pagetables(second, first, zeroeth,
+                              linker_addr(&_stext),
+                              linker_addr(&_etext),
+                              load_addr(&_stext),
+                              false);
+    _setup_initial_pagetables(second, first, zeroeth,
+                              linker_addr(&__init_begin),
+                              linker_addr(&__init_end),
+                              load_addr(&__init_begin),
+                              true);
+    _setup_initial_pagetables(second, first, zeroeth,
+                              linker_addr(&_srodata),
+                              linker_addr(&_erodata),
+                              load_addr(&_srodata),
+                              false);
+    _setup_initial_pagetables(second, first, zeroeth,
+                              linker_addr_start,
+                              linker_addr_end,
+                              load_addr_start,
+                              true);
+
+    /*
+     * Create a mapping of the load time address range to... the load time address range.
+     * This mapping is used at boot time only.
+     */
+    _setup_initial_pagetables(second, first, zeroeth,
+                              load_addr_start,
+                              load_addr_end,
+                              load_addr_start,
+                              true);
+
+    /* Ensure page table writes precede loading the SATP */
+    asm volatile("sfence.vma");
+
+    /* Enable the MMU and load the new pagetable for Xen */
+    csr_write(CSR_SATP,
+              (load_addr(xen_second_pagetable) >> PAGE_SHIFT) | SATP_MODE_SV39 << SATP_MODE_SHIFT);
+
+    phys_offset = load_addr_start - linker_addr_start;
+
+    return;
+}
-- 
2.39.0


