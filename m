Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5448E5510DE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:03:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352419.579190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRI-0001sN-TF; Mon, 20 Jun 2022 07:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352419.579190; Mon, 20 Jun 2022 07:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRI-0001p8-QI; Mon, 20 Jun 2022 07:03:12 +0000
Received: by outflank-mailman (input) for mailman id 352419;
 Mon, 20 Jun 2022 07:03:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k7+S=W3=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3BRH-0001Yx-7M
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:03:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 0a9ec9ec-f067-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 09:03:09 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48DD6113E;
 Mon, 20 Jun 2022 00:03:09 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.35.125])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 834493F5A1;
 Mon, 20 Jun 2022 00:03:07 -0700 (PDT)
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
X-Inumbo-ID: 0a9ec9ec-f067-11ec-b725-ed86ccbb4733
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/9] xen/arm: Use explicitly specified types
Date: Mon, 20 Jun 2022 09:02:37 +0200
Message-Id: <20220620070245.77979-2-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620070245.77979-1-michal.orzel@arm.com>
References: <20220620070245.77979-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to MISRA C 2012 Rule 8.1, types shall be explicitly
specified. Fix all the findings reported by cppcheck with misra addon
by substituting implicit type 'unsigned' to explicit 'unsigned int'.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/domain_build.c             |  2 +-
 xen/arch/arm/guestcopy.c                | 13 +++++++------
 xen/arch/arm/include/asm/arm32/bitops.h |  8 ++++----
 xen/arch/arm/include/asm/fixmap.h       |  4 ++--
 xen/arch/arm/include/asm/guest_access.h |  8 ++++----
 xen/arch/arm/include/asm/mm.h           |  2 +-
 xen/arch/arm/irq.c                      |  2 +-
 xen/arch/arm/kernel.c                   |  2 +-
 xen/arch/arm/mm.c                       |  4 ++--
 9 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7ddd16c26d..3fd1186b53 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1007,7 +1007,7 @@ static void __init set_interrupt(gic_interrupt_t interrupt,
  */
 static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
                                           gic_interrupt_t *intr,
-                                          unsigned num_irq)
+                                          unsigned int num_irq)
 {
     int res;
 
diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
index 32681606d8..abb6236e27 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -56,7 +56,7 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
                                 copy_info_t info, unsigned int flags)
 {
     /* XXX needs to handle faults */
-    unsigned offset = addr & ~PAGE_MASK;
+    unsigned int offset = addr & ~PAGE_MASK;
 
     BUILD_BUG_ON((sizeof(addr)) < sizeof(vaddr_t));
     BUILD_BUG_ON((sizeof(addr)) < sizeof(paddr_t));
@@ -64,7 +64,7 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
     while ( len )
     {
         void *p;
-        unsigned size = min(len, (unsigned)PAGE_SIZE - offset);
+        unsigned int size = min(len, (unsigned int)PAGE_SIZE - offset);
         struct page_info *page;
 
         page = translate_get_page(info, addr, flags & COPY_linear,
@@ -106,26 +106,27 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
     return 0;
 }
 
-unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len)
+unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
 {
     return copy_guest((void *)from, (vaddr_t)to, len,
                       GVA_INFO(current), COPY_to_guest | COPY_linear);
 }
 
 unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
-                                             unsigned len)
+                                             unsigned int len)
 {
     return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current),
                       COPY_to_guest | COPY_flush_dcache | COPY_linear);
 }
 
-unsigned long raw_clear_guest(void *to, unsigned len)
+unsigned long raw_clear_guest(void *to, unsigned int len)
 {
     return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current),
                       COPY_to_guest | COPY_linear);
 }
 
-unsigned long raw_copy_from_guest(void *to, const void __user *from, unsigned len)
+unsigned long raw_copy_from_guest(void *to, const void __user *from,
+                                  unsigned int len)
 {
     return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current),
                       COPY_from_guest | COPY_linear);
diff --git a/xen/arch/arm/include/asm/arm32/bitops.h b/xen/arch/arm/include/asm/arm32/bitops.h
index 57938a5874..d0309d47c1 100644
--- a/xen/arch/arm/include/asm/arm32/bitops.h
+++ b/xen/arch/arm/include/asm/arm32/bitops.h
@@ -6,17 +6,17 @@
 /*
  * Little endian assembly bitops.  nr = 0 -> byte 0 bit 0.
  */
-extern int _find_first_zero_bit_le(const void * p, unsigned size);
+extern int _find_first_zero_bit_le(const void * p, unsigned int size);
 extern int _find_next_zero_bit_le(const void * p, int size, int offset);
-extern int _find_first_bit_le(const unsigned long *p, unsigned size);
+extern int _find_first_bit_le(const unsigned long *p, unsigned int size);
 extern int _find_next_bit_le(const unsigned long *p, int size, int offset);
 
 /*
  * Big endian assembly bitops.  nr = 0 -> byte 3 bit 0.
  */
-extern int _find_first_zero_bit_be(const void * p, unsigned size);
+extern int _find_first_zero_bit_be(const void * p, unsigned int size);
 extern int _find_next_zero_bit_be(const void * p, int size, int offset);
-extern int _find_first_bit_be(const unsigned long *p, unsigned size);
+extern int _find_first_bit_be(const unsigned long *p, unsigned int size);
 extern int _find_next_bit_be(const unsigned long *p, int size, int offset);
 
 #ifndef __ARMEB__
diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
index 365a2385a0..d0c9a52c8c 100644
--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -30,9 +30,9 @@
 extern lpae_t xen_fixmap[XEN_PT_LPAE_ENTRIES];
 
 /* Map a page in a fixmap entry */
-extern void set_fixmap(unsigned map, mfn_t mfn, unsigned attributes);
+extern void set_fixmap(unsigned int map, mfn_t mfn, unsigned int attributes);
 /* Remove a mapping from a fixmap entry */
-extern void clear_fixmap(unsigned map);
+extern void clear_fixmap(unsigned int map);
 
 #define fix_to_virt(slot) ((void *)FIXMAP_ADDR(slot))
 
diff --git a/xen/arch/arm/include/asm/guest_access.h b/xen/arch/arm/include/asm/guest_access.h
index 53766386d3..4421e43611 100644
--- a/xen/arch/arm/include/asm/guest_access.h
+++ b/xen/arch/arm/include/asm/guest_access.h
@@ -4,11 +4,11 @@
 #include <xen/errno.h>
 #include <xen/sched.h>
 
-unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
+unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len);
 unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
-                                             unsigned len);
-unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
-unsigned long raw_clear_guest(void *to, unsigned len);
+                                             unsigned int len);
+unsigned long raw_copy_from_guest(void *to, const void *from, unsigned int len);
+unsigned long raw_clear_guest(void *to, unsigned int len);
 
 /* Copy data to guest physical address, then clean the region. */
 unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 045a8ba4bb..c4bc3cd1e5 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -192,7 +192,7 @@ extern void setup_xenheap_mappings(unsigned long base_mfn, unsigned long nr_mfns
 /* Map a frame table to cover physical addresses ps through pe */
 extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
 /* map a physical range in virtual memory */
-void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned attributes);
+void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
 
 static inline void __iomem *ioremap_nocache(paddr_t start, size_t len)
 {
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index b761d90c40..b6449c9065 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -610,7 +610,7 @@ void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
     BUG();
 }
 
-static bool irq_validate_new_type(unsigned int curr, unsigned new)
+static bool irq_validate_new_type(unsigned int curr, unsigned int new)
 {
     return (curr == IRQ_TYPE_INVALID || curr == new );
 }
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 25ded1c056..2556a45c38 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -256,7 +256,7 @@ static __init int kernel_decompress(struct bootmodule *mod)
     char *output, *input;
     char magic[2];
     int rc;
-    unsigned kernel_order_out;
+    unsigned int kernel_order_out;
     paddr_t output_size;
     struct page_info *pages;
     mfn_t mfn;
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index be37176a47..009b8cd9ef 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -352,7 +352,7 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
 }
 
 /* Map a 4k page in a fixmap entry */
-void set_fixmap(unsigned map, mfn_t mfn, unsigned int flags)
+void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags)
 {
     int res;
 
@@ -361,7 +361,7 @@ void set_fixmap(unsigned map, mfn_t mfn, unsigned int flags)
 }
 
 /* Remove a mapping from a fixmap entry */
-void clear_fixmap(unsigned map)
+void clear_fixmap(unsigned int map)
 {
     int res;
 
-- 
2.25.1


