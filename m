Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BF96F5C10
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 18:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529382.823745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFOm-0004M2-3E; Wed, 03 May 2023 16:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529382.823745; Wed, 03 May 2023 16:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFOl-0004FD-Qq; Wed, 03 May 2023 16:32:11 +0000
Received: by outflank-mailman (input) for mailman id 529382;
 Wed, 03 May 2023 16:32:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1puFOk-0003pe-9z
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 16:32:10 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bc3b58e-e9d0-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 18:32:07 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f137dbaa4fso1235194e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 May 2023 09:32:08 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h20-20020a2e9ed4000000b002a634bfa224sm6074321ljk.40.2023.05.03.09.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 09:32:06 -0700 (PDT)
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
X-Inumbo-ID: 0bc3b58e-e9d0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683131527; x=1685723527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ax1p/+Ojg24s3uOBpiRJ9X07/nApnSHzGweJ6WFH648=;
        b=DCHKe6PsTaBnm7AOWO6SRyvaqhHS6WvbwA2mELkNLgWfyvqCpkZlqeWtqEASKyiyH6
         VAMP1WaeJ8ufcdRyFQsXsA2H7cE8QsKx2HgJEmsBM4QoYFqtW2AIDczM/34w5vD5T/MP
         0AlI5uqCr2Y1zxyx2uzhBAL9o/dHj92b55MEwpOV17NTUGB4RxV/d/9GfP3vsyrPkSqP
         GloF2oLTL7OHc/ZeumNo6nIU1p27+MJ9DuUiWlCbuRiMCGRag2MjuTRP4F7pyMI0i3ls
         0srcojwQjdaghB9HPFtOu4CG4MVxgur8hW2QAD2pSKwVnqRkItABCY8wHJJSXOv+psi1
         vsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683131527; x=1685723527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ax1p/+Ojg24s3uOBpiRJ9X07/nApnSHzGweJ6WFH648=;
        b=Uy7j80v4EX0i3RUXA2GSRvYor1lLMUlxcF2RwPrBbIl4eo2LvO7L6qDSBTAfobL2gi
         mzXzsvrDGFQF7Ac8FnzgikpXCeg7skdMdi4KUeOYso/nF3QJnL3MgosQziUXeK2jkTZ+
         ZHWL9qZMsFqNdEW7QmivGceE2iVl5Um9Tg+tniYbAZ/qzYhdHp2SN/zmWN7t/Vj7QEk7
         kSkYTLWR7hXu6oxm+c8o7/o4FqL478Ftwi0zjun7ExkTIzO50cxvU3JFYTQYC5KDHTD/
         0aqj1oM5uFB/lVd8Ss+CQk78jTf0HMQZfwEctln8ViOzGAOYKFSj6FQurOTVyNb50j7Y
         pEUQ==
X-Gm-Message-State: AC+VfDwS8lHypIUPLKDReK0K3jhoIoW8X+/1DWLGfCFaDPApliJnoH18
	g6FppJ9khuNmVtu3Ocx41sH5Tu0DCG0=
X-Google-Smtp-Source: ACHHUZ5gv8pRr8ymywPtNmbKQcjo67kL49ke7vlfhtiGZnZDzEeBZjtmAa6XvbL/ag9h3FJA/2scXA==
X-Received: by 2002:ac2:4a66:0:b0:4eb:e7f:945 with SMTP id q6-20020ac24a66000000b004eb0e7f0945mr1000813lfp.41.1683131526959;
        Wed, 03 May 2023 09:32:06 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 2/4] xen/riscv: introduce setup_initial_pages
Date: Wed,  3 May 2023 19:31:59 +0300
Message-Id: <d1a6fb6112b61000645eb1a4ab9ade8a208d4204.1683131359.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1683131359.git.oleksii.kurochko@gmail.com>
References: <cover.1683131359.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The idea was taken from xvisor but the following changes
were done:
* Use only a minimal part of the code enough to enable MMU
* rename {_}setup_initial_pagetables functions
* add an argument for setup_initial_mapping to have
  an opportunity to make set PTE flags.
* update setup_initial_pagetables function to map sections
  with correct PTE flags.
* Rewrite enable_mmu() to C.
* map linker addresses range to load addresses range without
  1:1 mapping. It will be 1:1 only in case when
  load_start_addr is equal to linker_start_addr.
* add safety checks such as:
  * Xen size is less than page size
  * linker addresses range doesn't overlap load addresses
    range
* Rework macros {THIRD,SECOND,FIRST,ZEROETH}_{SHIFT,MASK}
* change PTE_LEAF_DEFAULT to RW instead of RWX.
* Remove phys_offset as it is not used now
* Remove alignment  of {map, pa}_start &= XEN_PT_LEVEL_MAP_MASK(0);
  in  setup_inital_mapping() as they should be already aligned.
  Make a check that {map_pa}_start are aligned.
* Remove clear_pagetables() as initial pagetables will be
  zeroed during bss initialization
* Remove __attribute__((section(".entry")) for setup_initial_pagetables()
  as there is no such section in xen.lds.S
* Update the argument of pte_is_valid() to "const pte_t *p"
* Add check that Xen's load address is aligned at 4k boundary
* Refactor setup_initial_pagetables() so it is mapping linker
  address range to load address range. After setup needed
  permissions for specific section ( such as .text, .rodata, etc )
  otherwise RW permission will be set by default.
* Add function to check that requested SATP_MODE is supported

Origin: git@github.com:xvisor/xvisor.git 9be2fdd7
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 	- move PAGE_SHIFT, PADDR_BITS to the top of page-bits.h
 	- cast argument x of pte_to_addr() macros to paddr_t to avoid risk of overflow for RV32
 	- update type of num_levels from 'unsigned long' to 'unsigned int'
 	- define PGTBL_INITIAL_COUNT as ((CONFIG_PAGING_LEVELS - 1) + 1)
 	- update type of permission arguments. changed it from 'unsgined long' to 'unsigned int'
 	- fix code style
 	- switch while 'loop' to 'for' loop
 	- undef HANDLE_PGTBL
 	- clean root page table after MMU is disabled in check_pgtbl_mode_support() function
 	- align __bss_start properly
 	- remove unnecesssary const for paddr_to_pte, pte_to_paddr, pte_is_valid functions
 	- add switch_stack_and_jump macros and use it inside enable_mmu() before jump to
 	  cont_after_mmu_is_enabled() function
---
Changes in V5:
	* Indent fields of pte_t struct
	* Rename addr_to_pte() and ppn_to_paddr() to match their content
---
Changes in V4:
  * use GB() macros instead of defining SZ_1G
  * hardcode XEN_VIRT_START and add comment (ADDRESS_SPACE_END + 1 - GB(1))
  * remove unnecessary 'asm' word at the end of #error
  * encapsulate pte_t definition in a struct
  * rename addr_to_ppn() to ppn_to_paddr().
  * change type of paddr argument from const unsigned long to paddr_t
  * pte_to_paddr() update prototype.
  * calculate size of Xen binary based on an amount of page tables
  * use unsgined int instead of 'uint32_t' instead of uint32_t as
    their use isn't warranted.
  * remove extern of bss_{start,end} as they aren't used in mm.c anymore
  * fix code style
  * add argument for HANDLE_PGTBL macros instead of curr_lvl_num variable
  * make enable_mmu() as noinline to prevent under link-time optimization
    because of the nature of enable_mmu()
  * add function to check that SATP_MODE is supported.
  * update the commit message
  * update setup_initial_pagetables to set correct PTE flags in one pass
    instead of calling setup_pte_permissions after setup_initial_pagetables()
    as setup_initial_pagetables() isn't used to change permission flags.
---
Changes in V3:
 - update definition of pte_t structure to have a proper size of pte_t
   in case of RV32.
 - update asm/mm.h with new functions and remove unnecessary 'extern'.
 - remove LEVEL_* macros as only XEN_PT_LEVEL_* are enough.
 - update paddr_to_pte() to receive permissions as an argument.
 - add check that map_start & pa_start is properly aligned.
 - move  defines PAGETABLE_ORDER, PAGETABLE_ENTRIES, PTE_PPN_SHIFT to
   <asm/page-bits.h>
 - Rename PTE_SHIFT to PTE_PPN_SHIFT
 - refactor setup_initial_pagetables: map all LINK addresses to LOAD addresses
   and after setup PTEs permission for sections; update check that linker
   and load addresses don't overlap.
 - refactor setup_initial_mapping: allocate pagetable 'dynamically' if it is
   necessary.
 - rewrite enable_mmu in C; add the check that map_start and pa_start are
   aligned on 4k boundary.
 - update the comment for setup_initial_pagetable funcion
 - Add RV_STAGE1_MODE to support different MMU modes
 - set XEN_VIRT_START very high to not overlap with load address range
 - align bss section
---
Changes in V2:
 * update the commit message:
 * Remove {ZEROETH,FIRST,...}_{SHIFT,MASK, SIZE,...} and
   introduce instead of them XEN_PT_LEVEL_*() and LEVEL_*
 * Rework pt_linear_offset() and pt_index based on  XEN_PT_LEVEL_*()
 * Remove clear_pagetables() functions as pagetables were zeroed during
   .bss initialization
 * Rename _setup_initial_pagetables() to setup_initial_mapping()
 * Make PTE_DEFAULT equal to RX.
 * Update prototype of setup_initial_mapping(..., bool writable) -> 
   setup_initial_mapping(..., UL flags)  
 * Update calls of setup_initial_mapping according to new prototype
 * Remove unnecessary call of:
   _setup_initial_pagetables(..., load_addr_start, load_addr_end, load_addr_start, ...)
 * Define index* in the loop of setup_initial_mapping
 * Remove attribute "__attribute__((section(".entry")))" for setup_initial_pagetables()
   as we don't have such section
 * make arguments of paddr_to_pte() and pte_is_valid() as const.
 * make xen_second_pagetable static.
 * use <xen/kernel.h> instead of declaring extern unsigned long _stext, 0etext, _srodata, _erodata
 * update  'extern unsigned long __init_begin' to 'extern unsigned long __init_begin[]'
 * use aligned() instead of "__attribute__((__aligned__(PAGE_SIZE)))"
 * set __section(".bss.page_aligned") for page tables arrays
 * fix identatations
 * Change '__attribute__((section(".entry")))' to '__init'
 * Remove phys_offset as it isn't used now.
 * Remove alignment  of {map, pa}_start &= XEN_PT_LEVEL_MAP_MASK(0); in
   setup_inital_mapping() as they should be already aligned.
 * Remove clear_pagetables() as initial pagetables will be
   zeroed during bss initialization
 * Remove __attribute__((section(".entry")) for setup_initial_pagetables()
   as there is no such section in xen.lds.S
 * Update the argument of pte_is_valid() to "const pte_t *p"
---
 xen/arch/riscv/Makefile                |   1 +
 xen/arch/riscv/include/asm/config.h    |  13 +-
 xen/arch/riscv/include/asm/current.h   |  10 +
 xen/arch/riscv/include/asm/mm.h        |   9 +
 xen/arch/riscv/include/asm/page-bits.h |  10 +
 xen/arch/riscv/include/asm/page.h      |  62 +++++
 xen/arch/riscv/mm.c                    | 315 +++++++++++++++++++++++++
 xen/arch/riscv/riscv64/head.S          |   1 +
 xen/arch/riscv/setup.c                 |  11 +
 xen/arch/riscv/xen.lds.S               |   4 +
 10 files changed, 435 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/include/asm/current.h
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
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 73b86ce789..3bd206766e 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -70,12 +70,23 @@
   name:
 #endif
 
-#define XEN_VIRT_START  _AT(UL, 0x80200000)
+#ifdef CONFIG_RISCV_64
+#define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 - GB(1)) */
+#else
+#error "RV32 isn't supported"
+#endif
 
 #define SMP_CACHE_BYTES (1 << 6)
 
 #define STACK_SIZE PAGE_SIZE
 
+#ifdef CONFIG_RISCV_64
+#define CONFIG_PAGING_LEVELS 3
+#define RV_STAGE1_MODE SATP_MODE_SV39
+#else
+#define RV_STAGE1_MODE SATP_MODE_SV32
+#endif
+
 #endif /* __RISCV_CONFIG_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
new file mode 100644
index 0000000000..1cb5946fe9
--- /dev/null
+++ b/xen/arch/riscv/include/asm/current.h
@@ -0,0 +1,10 @@
+#ifndef __ASM_CURRENT_H
+#define __ASM_CURRENT_H
+
+#define switch_stack_and_jump(stack, fn)    \
+    asm volatile (                          \
+            "mv sp, %0 \n"                  \
+            "j " #fn :: "r" (stack) :       \
+    )
+
+#endif /* __ASM_CURRENT_H */
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
new file mode 100644
index 0000000000..e16ce66fae
--- /dev/null
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -0,0 +1,9 @@
+#ifndef _ASM_RISCV_MM_H
+#define _ASM_RISCV_MM_H
+
+void setup_initial_pagetables(void);
+
+void enable_mmu(void);
+void cont_after_mmu_is_enabled(void);
+
+#endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/include/asm/page-bits.h b/xen/arch/riscv/include/asm/page-bits.h
index 1801820294..4a3e33589a 100644
--- a/xen/arch/riscv/include/asm/page-bits.h
+++ b/xen/arch/riscv/include/asm/page-bits.h
@@ -4,4 +4,14 @@
 #define PAGE_SHIFT              12 /* 4 KiB Pages */
 #define PADDR_BITS              56 /* 44-bit PPN */
 
+#ifdef CONFIG_RISCV_64
+#define PAGETABLE_ORDER         (9)
+#else /* CONFIG_RISCV_32 */
+#define PAGETABLE_ORDER         (10)
+#endif
+
+#define PAGETABLE_ENTRIES       (1 << PAGETABLE_ORDER)
+
+#define PTE_PPN_SHIFT           10
+
 #endif /* __RISCV_PAGE_BITS_H__ */
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
new file mode 100644
index 0000000000..b4fc67484b
--- /dev/null
+++ b/xen/arch/riscv/include/asm/page.h
@@ -0,0 +1,62 @@
+#ifndef _ASM_RISCV_PAGE_H
+#define _ASM_RISCV_PAGE_H
+
+#include <xen/const.h>
+#include <xen/types.h>
+
+#define VPN_MASK                    ((unsigned long)(PAGETABLE_ENTRIES - 1))
+
+#define XEN_PT_LEVEL_ORDER(lvl)     ((lvl) * PAGETABLE_ORDER)
+#define XEN_PT_LEVEL_SHIFT(lvl)     (XEN_PT_LEVEL_ORDER(lvl) + PAGE_SHIFT)
+#define XEN_PT_LEVEL_SIZE(lvl)      (_AT(paddr_t, 1) << XEN_PT_LEVEL_SHIFT(lvl))
+#define XEN_PT_LEVEL_MAP_MASK(lvl)  (~(XEN_PT_LEVEL_SIZE(lvl) - 1))
+#define XEN_PT_LEVEL_MASK(lvl)      (VPN_MASK << XEN_PT_LEVEL_SHIFT(lvl))
+
+#define PTE_VALID                   BIT(0, UL)
+#define PTE_READABLE                BIT(1, UL)
+#define PTE_WRITABLE                BIT(2, UL)
+#define PTE_EXECUTABLE              BIT(3, UL)
+#define PTE_USER                    BIT(4, UL)
+#define PTE_GLOBAL                  BIT(5, UL)
+#define PTE_ACCESSED                BIT(6, UL)
+#define PTE_DIRTY                   BIT(7, UL)
+#define PTE_RSW                     (BIT(8, UL) | BIT(9, UL))
+
+#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
+#define PTE_TABLE                   (PTE_VALID)
+
+/* Calculate the offsets into the pagetables for a given VA */
+#define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
+
+#define pt_index(lvl, va) pt_linear_offset(lvl, (va) & XEN_PT_LEVEL_MASK(lvl))
+
+/* Page Table entry */
+typedef struct {
+#ifdef CONFIG_RISCV_64
+    uint64_t pte;
+#else
+    uint32_t pte;
+#endif
+} pte_t;
+
+#define pte_to_addr(x) (((paddr_t)(x) >> PTE_PPN_SHIFT) << PAGE_SHIFT)
+
+#define addr_to_pte(x) (((x) >> PAGE_SHIFT) << PTE_PPN_SHIFT)
+
+static inline pte_t paddr_to_pte(paddr_t paddr,
+                                 unsigned int permissions)
+{
+    return (pte_t) { .pte = addr_to_pte(paddr) | permissions };
+}
+
+static inline paddr_t pte_to_paddr(pte_t pte)
+{
+    return pte_to_addr(pte.pte);
+}
+
+static inline bool pte_is_valid(pte_t p)
+{
+    return p.pte & PTE_VALID;
+}
+
+#endif /* _ASM_RISCV_PAGE_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
new file mode 100644
index 0000000000..b13f15f75f
--- /dev/null
+++ b/xen/arch/riscv/mm.c
@@ -0,0 +1,315 @@
+#include <xen/compiler.h>
+#include <xen/init.h>
+#include <xen/kernel.h>
+#include <xen/pfn.h>
+
+#include <asm/early_printk.h>
+#include <asm/config.h>
+#include <asm/csr.h>
+#include <asm/current.h>
+#include <asm/mm.h>
+#include <asm/page.h>
+#include <asm/processor.h>
+
+struct mmu_desc {
+    unsigned int num_levels;
+    unsigned int pgtbl_count;
+    pte_t *next_pgtbl;
+    pte_t *pgtbl_base;
+};
+
+extern unsigned char cpu0_boot_stack[STACK_SIZE];
+
+#define PHYS_OFFSET ((unsigned long)_start - XEN_VIRT_START)
+#define LOAD_TO_LINK(addr) ((addr) - PHYS_OFFSET)
+#define LINK_TO_LOAD(addr) ((addr) + PHYS_OFFSET)
+
+
+/*
+ * It is expected that Xen won't be more then 2 MB.
+ * The check in xen.lds.S guarantees that.
+ * At least 3 page (in case of Sv39 )
+ * tables are needed to cover 2 MB. One for each page level
+ * table with PAGE_SIZE = 4 Kb
+ *
+ * One L0 page table can cover 2 MB
+ * (512 entries of one page table * PAGE_SIZE).
+ *
+ */
+#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
+
+#define PGTBL_ENTRY_AMOUNT  (PAGE_SIZE / sizeof(pte_t))
+
+pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
+stage1_pgtbl_root[PGTBL_ENTRY_AMOUNT];
+
+pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
+stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT * PGTBL_ENTRY_AMOUNT];
+
+#define HANDLE_PGTBL(curr_lvl_num)                                          \
+    index = pt_index(curr_lvl_num, page_addr);                              \
+    if ( pte_is_valid(pgtbl[index]) )                                       \
+    {                                                                       \
+        /* Find L{ 0-3 } table */                                           \
+        pgtbl = (pte_t *)pte_to_paddr(pgtbl[index]);                        \
+    }                                                                       \
+    else                                                                    \
+    {                                                                       \
+        /* Allocate new L{0-3} page table */                                \
+        if ( mmu_desc->pgtbl_count == PGTBL_INITIAL_COUNT )                 \
+        {                                                                   \
+            early_printk("(XEN) No initial table available\n");             \
+            /* panic(), BUG() or ASSERT() aren't ready now. */              \
+            die();                                                          \
+        }                                                                   \
+        mmu_desc->pgtbl_count++;                                            \
+        pgtbl[index] = paddr_to_pte((unsigned long)mmu_desc->next_pgtbl,    \
+                                    PTE_VALID);                             \
+        pgtbl = mmu_desc->next_pgtbl;                                       \
+        mmu_desc->next_pgtbl += PGTBL_ENTRY_AMOUNT;                         \
+    }
+
+static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
+                                         unsigned long map_start,
+                                         unsigned long map_end,
+                                         unsigned long pa_start,
+                                         unsigned int permissions)
+{
+    unsigned int index;
+    pte_t *pgtbl;
+    unsigned long page_addr;
+    pte_t pte_to_be_written;
+    unsigned long paddr;
+    unsigned int tmp_permissions;
+
+    if ( (unsigned long)_start % XEN_PT_LEVEL_SIZE(0) )
+    {
+        early_printk("(XEN) Xen should be loaded at 4k boundary\n");
+        die();
+    }
+
+    if ( map_start & ~XEN_PT_LEVEL_MAP_MASK(0) ||
+         pa_start & ~XEN_PT_LEVEL_MAP_MASK(0) )
+    {
+        early_printk("(XEN) map and pa start addresses should be aligned\n");
+        /* panic(), BUG() or ASSERT() aren't ready now. */
+        die();
+    }
+
+    for ( page_addr = map_start; page_addr < map_end; page_addr += XEN_PT_LEVEL_SIZE(0) )
+    {
+        pgtbl = mmu_desc->pgtbl_base;
+
+        switch ( mmu_desc->num_levels )
+        {
+        case 4: /* Level 3 */
+            HANDLE_PGTBL(3);
+        case 3: /* Level 2 */
+            HANDLE_PGTBL(2);
+        case 2: /* Level 1 */
+            HANDLE_PGTBL(1);
+        case 1: /* Level 0 */
+            index = pt_index(0, page_addr);
+            paddr = (page_addr - map_start) + pa_start;
+
+            tmp_permissions = permissions;
+
+            if ( is_kernel_text(LINK_TO_LOAD(page_addr)) ||
+                    is_kernel_inittext(LINK_TO_LOAD(page_addr)) )
+                tmp_permissions =
+                    PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;
+
+            if ( is_kernel_rodata(LINK_TO_LOAD(page_addr)) )
+                tmp_permissions = PTE_READABLE | PTE_VALID;
+
+            pte_to_be_written = paddr_to_pte(paddr, tmp_permissions);
+
+            if ( !pte_is_valid(pgtbl[index]) )
+                pgtbl[index] = pte_to_be_written;
+            else
+            {
+                /*
+                * get an adresses of current pte and that one to
+                * be written
+                */
+                unsigned long curr_pte =
+                    pgtbl[index].pte & ~(PTE_DIRTY | PTE_ACCESSED);
+
+                pte_to_be_written.pte &= ~(PTE_DIRTY | PTE_ACCESSED);
+
+                if ( curr_pte != pte_to_be_written.pte )
+                {
+                    early_printk("PTE overridden has occurred\n");
+                    /* panic(), <asm/bug.h> aren't ready now. */
+                    die();
+                }
+            }
+        }
+    }
+    #undef HANDLE_PGTBL
+}
+
+static void __init calc_pgtbl_lvls_num(struct  mmu_desc *mmu_desc)
+{
+    unsigned long satp_mode = RV_STAGE1_MODE;
+
+    /* Number of page table levels */
+    switch (satp_mode)
+    {
+    case SATP_MODE_SV32:
+        mmu_desc->num_levels = 2;
+        break;
+    case SATP_MODE_SV39:
+        mmu_desc->num_levels = 3;
+        break;
+    case SATP_MODE_SV48:
+        mmu_desc->num_levels = 4;
+        break;
+    default:
+        early_printk("(XEN) Unsupported SATP_MODE\n");
+        die();
+    }
+}
+
+static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
+                                            unsigned long load_start,
+                                            unsigned long satp_mode)
+{
+    bool is_mode_supported = false;
+    unsigned int index;
+    unsigned int page_table_level = (mmu_desc->num_levels - 1);
+    unsigned level_map_mask = XEN_PT_LEVEL_MAP_MASK(page_table_level);
+
+    unsigned long aligned_load_start = load_start & level_map_mask;
+    unsigned long aligned_page_size = XEN_PT_LEVEL_SIZE(page_table_level);
+    unsigned long xen_size = (unsigned long)(_end - start);
+
+    if ( (load_start + xen_size) > (aligned_load_start + aligned_page_size) )
+    {
+        early_printk("please place Xen to be in range of PAGE_SIZE "
+                     "where PAGE_SIZE is XEN_PT_LEVEL_SIZE( {L3 | L2 | L1} ) "
+                     "depending on expected SATP_MODE \n"
+                     "XEN_PT_LEVEL_SIZE is defined in <asm/page.h>\n");
+        die();
+    }
+
+    index = pt_index(page_table_level, aligned_load_start);
+    stage1_pgtbl_root[index] = paddr_to_pte(aligned_load_start,
+                                            PTE_LEAF_DEFAULT | PTE_EXECUTABLE);
+
+    asm volatile ( "sfence.vma" );
+    csr_write(CSR_SATP,
+              PFN_DOWN((unsigned long)stage1_pgtbl_root) |
+              satp_mode << SATP_MODE_SHIFT);
+
+    if ( (csr_read(CSR_SATP) >> SATP_MODE_SHIFT) == satp_mode )
+        is_mode_supported = true;
+
+    csr_write(CSR_SATP, 0);
+
+    /* Clean MMU root page table */
+    stage1_pgtbl_root[index] = paddr_to_pte(0x0, 0x0);
+
+    asm volatile ( "sfence.vma" );
+
+    return is_mode_supported;
+}
+
+/*
+ * setup_initial_pagetables:
+ *
+ * Build the page tables for Xen that map the following:
+ *  1. Calculate page table's level numbers.
+ *  2. Init mmu description structure.
+ *  3. Check that linker addresses range doesn't overlap
+ *     with load addresses range
+ *  4. Map all linker addresses and load addresses ( it shouldn't
+ *     be 1:1 mapped and will be 1:1 mapped only in case if
+ *     linker address is equal to load address ) with
+ *     RW permissions by default.
+ *  5. Setup proper PTE permissions for each section.
+ */
+void __init setup_initial_pagetables(void)
+{
+    struct mmu_desc mmu_desc = { 0, 0, NULL, NULL };
+
+    /*
+     * Access to _stard, _end is always PC-relative
+     * thereby when access them we will get load adresses
+     * of start and end of Xen
+     * To get linker addresses LOAD_TO_LINK() is required
+     * to use
+     */
+    unsigned long load_start    = (unsigned long)_start;
+    unsigned long load_end      = (unsigned long)_end;
+    unsigned long linker_start  = LOAD_TO_LINK(load_start);
+    unsigned long linker_end    = LOAD_TO_LINK(load_end);
+
+    if ( (linker_start != load_start) &&
+         (linker_start <= load_end) && (load_start <= linker_end) )
+    {
+        early_printk("(XEN) linker and load address ranges overlap\n");
+        die();
+    }
+
+    calc_pgtbl_lvls_num(&mmu_desc);
+
+    if ( !check_pgtbl_mode_support(&mmu_desc, load_start, RV_STAGE1_MODE) )
+    {
+        early_printk("requested MMU mode isn't supported by CPU\n"
+                     "Please choose different in <asm/config.h>\n");
+        die();
+    }
+
+    mmu_desc.pgtbl_base = stage1_pgtbl_root;
+    mmu_desc.next_pgtbl = stage1_pgtbl_nonroot;
+
+    setup_initial_mapping(&mmu_desc,
+                          linker_start,
+                          linker_end,
+                          load_start,
+                          PTE_LEAF_DEFAULT);
+}
+
+void __init noinline enable_mmu()
+{
+    /*
+     * Calculate a linker time address of the mmu_is_enabled
+     * label and update CSR_STVEC with it.
+     * MMU is configured in a way where linker addresses are mapped
+     * on load addresses so in a case when linker addresses are not equal
+     * to load addresses, after MMU is enabled, it will cause
+     * an exception and jump to linker time addresses.
+     * Otherwise if load addresses are equal to linker addresses the code
+     * after mmu_is_enabled label will be executed without exception.
+     */
+    csr_write(CSR_STVEC, LOAD_TO_LINK((unsigned long)&&mmu_is_enabled));
+
+    /* Ensure page table writes precede loading the SATP */
+    asm volatile ( "sfence.vma" );
+
+    /* Enable the MMU and load the new pagetable for Xen */
+    csr_write(CSR_SATP,
+              PFN_DOWN((unsigned long)stage1_pgtbl_root) |
+              RV_STAGE1_MODE << SATP_MODE_SHIFT);
+
+    asm volatile ( ".align 2" );
+ mmu_is_enabled:
+    /*
+     * Stack should be re-inited as:
+     * 1. Right now an address of the stack is relative to load time
+     *    addresses what will cause an issue in case of load start address
+     *    isn't equal to linker start address.
+     * 2. Addresses in stack are all load time relative which can be an
+     *    issue in case when load start address isn't equal to linker
+     *    start address.
+     *
+     * We can't return to the caller because the stack was reseted
+     * and it may have stash some variable on the stack.
+     * Jump to a brand new function as the stack was reseted
+     */
+
+    switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
+                          cont_after_mmu_is_enabled);
+}
+
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 8887f0cbd4..983757e498 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,4 +1,5 @@
 #include <asm/asm.h>
+#include <asm/asm-offsets.h>
 #include <asm/riscv_encoding.h>
 
         .section .text.header, "ax", %progbits
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 3786f337e0..315804aa87 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -2,6 +2,7 @@
 #include <xen/init.h>
 
 #include <asm/early_printk.h>
+#include <asm/mm.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
@@ -26,3 +27,13 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     unreachable();
 }
+
+void __init noreturn cont_after_mmu_is_enabled(void)
+{
+    early_printk("All set up\n");
+
+    for ( ;; )
+        asm volatile ("wfi");
+
+    unreachable();
+}
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 31e0d3576c..f9d89b69b9 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -137,6 +137,7 @@ SECTIONS
     __init_end = .;
 
     .bss : {                     /* BSS */
+        . = ALIGN(POINTER_ALIGN);
         __bss_start = .;
         *(.bss.stack_aligned)
         . = ALIGN(PAGE_SIZE);
@@ -172,3 +173,6 @@ ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
 
 ASSERT(!SIZEOF(.got),      ".got non-empty")
 ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
+
+ASSERT(_end - _start <= MB(2), "Xen too large for early-boot assumptions")
+
-- 
2.40.1


