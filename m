Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FD09F98BA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 18:54:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861917.1273945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOhBq-0000LX-O0; Fri, 20 Dec 2024 17:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861917.1273945; Fri, 20 Dec 2024 17:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOhBq-0000J3-LK; Fri, 20 Dec 2024 17:53:30 +0000
Received: by outflank-mailman (input) for mailman id 861917;
 Fri, 20 Dec 2024 17:53:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xObb=TN=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tOhBp-0000Ix-QG
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 17:53:29 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ef1943d-befb-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 18:53:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7B8A18287D0A;
 Fri, 20 Dec 2024 11:53:23 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id tdhroVnxOWiB; Fri, 20 Dec 2024 11:53:21 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A3CC382882BA;
 Fri, 20 Dec 2024 11:53:21 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id vF4WhFnpxmz2; Fri, 20 Dec 2024 11:53:21 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id AC8258287D0A;
 Fri, 20 Dec 2024 11:53:20 -0600 (CST)
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
X-Inumbo-ID: 4ef1943d-befb-11ef-99a3-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A3CC382882BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1734717201; bh=1M30qCu70QxS1iS2rTkvPc0MtDhcU1c98G6UK6Sk2C4=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=X4gDPENodgEGwi7okwG/XK+eYr9nF2dlQwuNnnrWmR4V8wi0RFChT/xSFwyurrVXc
	 G1VQATPfngCZ0kf/0evUoP7Oz7D2v1UEXlRKKa01l382yOKViGVuo4MYQb7zfxZ7aa
	 Fh9f4kKa4BOloQco5QS/Zk4BErO0nOqrnAP+lzFE=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] xen/mm: Update page APIs to use unsigned long flags
Date: Fri, 20 Dec 2024 11:53:09 -0600
Message-Id: <7e3cd1dc48e30f19f2ac97794e21d1b78bc0c082.1734717055.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Xen's memory management APIs map_pages_to_xen, modify_xen_mappings,
set_fixmap, ioremap_attr, and __vmap all use an unsigned int to
represent architecture-dependent page table entry flags. This assumption
does not work on PPC/radix where some flags go past 32-bits, so update
these APIs to use unsigned long for flags instead.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/arm/include/asm/fixmap.h   | 2 +-
 xen/arch/arm/include/asm/mm.h       | 2 +-
 xen/arch/arm/mmu/pt.c               | 8 ++++----
 xen/arch/ppc/mm-radix.c             | 2 +-
 xen/arch/riscv/include/asm/fixmap.h | 2 +-
 xen/arch/riscv/pt.c                 | 4 ++--
 xen/arch/x86/mm.c                   | 4 ++--
 xen/common/efi/boot.c               | 4 ++--
 xen/common/vmap.c                   | 2 +-
 xen/include/xen/mm.h                | 4 ++--
 xen/include/xen/vmap.h              | 2 +-
 11 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
index 0cb5d54d1c..96361e670f 100644
--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -30,7 +30,7 @@
 extern lpae_t xen_fixmap[XEN_PT_LPAE_ENTRIES];
 
 /* Map a page in a fixmap entry */
-extern void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags);
+extern void set_fixmap(unsigned int map, mfn_t mfn, unsigned long flags);
 /* Remove a mapping from a fixmap entry */
 extern void clear_fixmap(unsigned int map);
 
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 59b774b7b8..4cfd71538b 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -209,7 +209,7 @@ extern int prepare_secondary_mm(int cpu);
 /* Map a frame table to cover physical addresses ps through pe */
 extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
 /* map a physical range in virtual memory */
-void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
+void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned long attributes);
 
 static inline void __iomem *ioremap_nocache(paddr_t start, size_t len)
 {
diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index da28d669e7..f8967fca01 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -189,7 +189,7 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
 }
 
 /* Map a 4k page in a fixmap entry */
-void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags)
+void set_fixmap(unsigned int map, mfn_t mfn, unsigned long flags)
 {
     int res;
 
@@ -210,7 +210,7 @@ void clear_fixmap(unsigned int map)
  * This function should only be used to remap device address ranges
  * TODO: add a check to verify this assumption
  */
-void *ioremap_attr(paddr_t start, size_t len, unsigned int attributes)
+void *ioremap_attr(paddr_t start, size_t len, unsigned long attributes)
 {
     mfn_t mfn = _mfn(PFN_DOWN(start));
     unsigned int offs = start & (PAGE_SIZE - 1);
@@ -701,7 +701,7 @@ static int xen_pt_update(unsigned long virt,
 int map_pages_to_xen(unsigned long virt,
                      mfn_t mfn,
                      unsigned long nr_mfns,
-                     unsigned int flags)
+                     unsigned long flags)
 {
     return xen_pt_update(virt, mfn, nr_mfns, flags);
 }
@@ -719,7 +719,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
     return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
 }
 
-int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
+int modify_xen_mappings(unsigned long s, unsigned long e, unsigned long nf)
 {
     ASSERT(IS_ALIGNED(s, PAGE_SIZE));
     ASSERT(IS_ALIGNED(e, PAGE_SIZE));
diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index 1ca3bcba7f..fa326a159b 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -285,7 +285,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
 int map_pages_to_xen(unsigned long virt,
                      mfn_t mfn,
                      unsigned long nr_mfns,
-                     unsigned int flags)
+                     unsigned long flags)
 {
     BUG_ON("unimplemented");
 }
diff --git a/xen/arch/riscv/include/asm/fixmap.h b/xen/arch/riscv/include/asm/fixmap.h
index e399a15f53..7302a5c052 100644
--- a/xen/arch/riscv/include/asm/fixmap.h
+++ b/xen/arch/riscv/include/asm/fixmap.h
@@ -33,7 +33,7 @@
 extern pte_t xen_fixmap[];
 
 /* Map a page in a fixmap entry */
-void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags);
+void set_fixmap(unsigned int map, mfn_t mfn, unsigned long flags);
 /* Remove a mapping from a fixmap entry */
 void clear_fixmap(unsigned int map);
 
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index a703e0f1bd..4334db8cce 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -405,7 +405,7 @@ static int pt_update(vaddr_t virt, mfn_t mfn,
 int map_pages_to_xen(unsigned long virt,
                      mfn_t mfn,
                      unsigned long nr_mfns,
-                     unsigned int flags)
+                     unsigned long flags)
 {
     /*
      * Ensure that flags has PTE_VALID bit as map_pages_to_xen() is supposed
@@ -436,7 +436,7 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 }
 
 /* Map a 4k page in a fixmap entry */
-void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags)
+void set_fixmap(unsigned int map, mfn_t mfn, unsigned long flags)
 {
     if ( map_pages_to_xen(FIXMAP_ADDR(map), mfn, 1, flags | PTE_SMALL) != 0 )
         BUG();
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index fa21903eb2..a5b74dad38 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5469,7 +5469,7 @@ int map_pages_to_xen(
     unsigned long virt,
     mfn_t mfn,
     unsigned long nr_mfns,
-    unsigned int flags)
+    unsigned long flags)
 {
     bool locking = system_state > SYS_STATE_boot;
     l3_pgentry_t *pl3e = NULL, ol3e;
@@ -5887,7 +5887,7 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
  *
  * It is an error to call with present flags over an unpopulated range.
  */
-int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
+int modify_xen_mappings(unsigned long s, unsigned long e, unsigned long nf)
 {
     bool locking = system_state > SYS_STATE_boot;
     l3_pgentry_t *pl3e = NULL;
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index efbec00af9..76215cb6b9 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1656,7 +1656,7 @@ void __init efi_init_memory(void)
     struct rt_extra {
         struct rt_extra *next;
         unsigned long smfn, emfn;
-        unsigned int prot;
+        unsigned long prot;
     } *extra, *extra_head = NULL;
 
     free_ebmalloc_unused_mem();
@@ -1671,7 +1671,7 @@ void __init efi_init_memory(void)
         EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
         u64 len = desc->NumberOfPages << EFI_PAGE_SHIFT;
         unsigned long smfn, emfn;
-        unsigned int prot = PAGE_HYPERVISOR_RWX;
+        unsigned long prot = PAGE_HYPERVISOR_RWX;
         paddr_t mem_base;
         unsigned long mem_npages;
 
diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index 47225fecc0..c2d86fff74 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -222,7 +222,7 @@ static void vm_free(const void *va)
 }
 
 void *__vmap(const mfn_t *mfn, unsigned int granularity,
-             unsigned int nr, unsigned int align, unsigned int flags,
+             unsigned int nr, unsigned int align, unsigned long flags,
              enum vmap_region type)
 {
     void *va = vm_alloc(nr * granularity, align, type);
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 16f733281a..9efddc51bc 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -113,9 +113,9 @@ int map_pages_to_xen(
     unsigned long virt,
     mfn_t mfn,
     unsigned long nr_mfns,
-    unsigned int flags);
+    unsigned long flags);
 /* Alter the permissions of a range of Xen virtual address space. */
-int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf);
+int modify_xen_mappings(unsigned long s, unsigned long e, unsigned long nf);
 void modify_xen_mappings_lite(unsigned long s, unsigned long e,
                               unsigned int nf);
 int destroy_xen_mappings(unsigned long s, unsigned long e);
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index 26c831757a..65403c77e9 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -57,7 +57,7 @@ void vm_init_type(enum vmap_region type, void *start, void *end);
  * @return Pointer to the mapped area on success; NULL otherwise.
  */
 void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
-             unsigned int align, unsigned int flags, enum vmap_region type);
+             unsigned int align, unsigned long flags, enum vmap_region type);
 
 /*
  * Map an array of pages contiguously into the VMAP_DEFAULT vmap region
-- 
2.30.2


