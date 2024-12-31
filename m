Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0C79FF136
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2024 19:29:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863656.1275041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSgyG-0001aq-A6; Tue, 31 Dec 2024 18:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863656.1275041; Tue, 31 Dec 2024 18:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSgyG-0001ZJ-3y; Tue, 31 Dec 2024 18:28:00 +0000
Received: by outflank-mailman (input) for mailman id 863656;
 Tue, 31 Dec 2024 18:27:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sf42=TY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tSgyE-0001ZD-R0
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2024 18:27:58 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f303fbbb-c7a4-11ef-99a4-01e77a169b0f;
 Tue, 31 Dec 2024 19:27:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1E280828748D;
 Tue, 31 Dec 2024 12:27:53 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WQAJRjqvMRlD; Tue, 31 Dec 2024 12:27:52 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2259E8285AFA;
 Tue, 31 Dec 2024 12:27:52 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Nlv6BOengAJj; Tue, 31 Dec 2024 12:27:52 -0600 (CST)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 264D182874CC;
 Tue, 31 Dec 2024 12:27:51 -0600 (CST)
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
X-Inumbo-ID: f303fbbb-c7a4-11ef-99a4-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 2259E8285AFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1735669672; bh=4YNY4+q8KFRGADVhrnvM+Q0mRQeZ0Go8N6ELKaJDOQs=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=KznQE2G5Gj3byPVkCUPTQrajNjvteC2AmDZhSS0paaMRZPJeUwkHiDp1yKlnzr7yF
	 RVCKuuINONcSJ8kDMjHcgfbzSsUIMiercO6/Duq0a1/YiCKLteFPB3vy/eNzo3vG+Q
	 wxYphuygZsCII/BuFI1CHSyLwDUDE6zpIKfklP5c=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] xen/mm: Introduce per-arch pte_attr_t type for PTE flags
Date: Tue, 31 Dec 2024 12:27:44 -0600
Message-Id: <47babd3f9ec00c15738a81aa57926e8a1f08cbe6.1735669493.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Xen's memory management APIs map_pages_to_xen, modify_xen_mappings,
set_fixmap, ioremap_attr, and __vmap all use an unsigned int to
represent architecture-dependent page table entry flags. This assumption
does not work on PPC/radix where some flags go past 32-bits, so
introduce the pte_attr_t type to allow architectures to opt in to larger
types to store PTE flags.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/Kconfig             | 1 +
 xen/arch/ppc/include/asm/types.h | 2 ++
 xen/arch/ppc/mm-radix.c          | 2 +-
 xen/common/Kconfig               | 3 +++
 xen/common/efi/boot.c            | 4 ++--
 xen/common/vmap.c                | 2 +-
 xen/include/xen/mm.h             | 8 ++++++--
 xen/include/xen/vmap.h           | 3 ++-
 8 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
index 6db575a48d..3fae481117 100644
--- a/xen/arch/ppc/Kconfig
+++ b/xen/arch/ppc/Kconfig
@@ -3,6 +3,7 @@ config PPC
 	select FUNCTION_ALIGNMENT_4B
 	select HAS_DEVICE_TREE
 	select HAS_VMAP
+	select HAS_PTE_ATTR_T
 
 config PPC64
 	def_bool y
diff --git a/xen/arch/ppc/include/asm/types.h b/xen/arch/ppc/include/asm/types.h
index ffaf378a4d..a0b12f816a 100644
--- a/xen/arch/ppc/include/asm/types.h
+++ b/xen/arch/ppc/include/asm/types.h
@@ -8,4 +8,6 @@ typedef unsigned long vaddr_t;
 #define INVALID_PADDR (~0UL)
 #define PRIpaddr "016lx"
 
+typedef unsigned long pte_attr_t;
+
 #endif /* _ASM_PPC_TYPES_H */
diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index 24232f3907..e02dffa7c5 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -265,7 +265,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
 int map_pages_to_xen(unsigned long virt,
                      mfn_t mfn,
                      unsigned long nr_mfns,
-                     unsigned int flags)
+                     pte_attr_t flags)
 {
     BUG_ON("unimplemented");
 }
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6166327f4d..017075d667 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -80,6 +80,9 @@ config HAS_PIRQ
 config HAS_PMAP
 	bool
 
+config HAS_PTE_ATTR_T
+	bool
+
 config HAS_SCHED_GRANULARITY
 	bool
 
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index efbec00af9..c200a27523 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1656,7 +1656,7 @@ void __init efi_init_memory(void)
     struct rt_extra {
         struct rt_extra *next;
         unsigned long smfn, emfn;
-        unsigned int prot;
+        pte_attr_t prot;
     } *extra, *extra_head = NULL;
 
     free_ebmalloc_unused_mem();
@@ -1671,7 +1671,7 @@ void __init efi_init_memory(void)
         EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
         u64 len = desc->NumberOfPages << EFI_PAGE_SHIFT;
         unsigned long smfn, emfn;
-        unsigned int prot = PAGE_HYPERVISOR_RWX;
+        pte_attr_t prot = PAGE_HYPERVISOR_RWX;
         paddr_t mem_base;
         unsigned long mem_npages;
 
diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index 47225fecc0..d6991421f3 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -222,7 +222,7 @@ static void vm_free(const void *va)
 }
 
 void *__vmap(const mfn_t *mfn, unsigned int granularity,
-             unsigned int nr, unsigned int align, unsigned int flags,
+             unsigned int nr, unsigned int align, pte_attr_t flags,
              enum vmap_region type)
 {
     void *va = vm_alloc(nr * granularity, align, type);
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 16f733281a..5386f931e7 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -70,6 +70,10 @@
 #include <xen/perfc.h>
 #include <public/memory.h>
 
+#ifndef CONFIG_HAS_PTE_ATTR_T
+typedef unsigned int pte_attr_t;
+#endif
+
 struct page_info;
 
 extern bool using_static_heap;
@@ -113,9 +117,9 @@ int map_pages_to_xen(
     unsigned long virt,
     mfn_t mfn,
     unsigned long nr_mfns,
-    unsigned int flags);
+    pte_attr_t flags);
 /* Alter the permissions of a range of Xen virtual address space. */
-int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf);
+int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf);
 void modify_xen_mappings_lite(unsigned long s, unsigned long e,
                               unsigned int nf);
 int destroy_xen_mappings(unsigned long s, unsigned long e);
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index 26c831757a..9e2edd1252 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -8,6 +8,7 @@
 #ifndef __XEN_VMAP_H__
 #define __XEN_VMAP_H__
 
+#include <xen/mm.h>
 #include <xen/mm-frame.h>
 #include <xen/page-size.h>
 
@@ -57,7 +58,7 @@ void vm_init_type(enum vmap_region type, void *start, void *end);
  * @return Pointer to the mapped area on success; NULL otherwise.
  */
 void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
-             unsigned int align, unsigned int flags, enum vmap_region type);
+             unsigned int align, pte_attr_t flags, enum vmap_region type);
 
 /*
  * Map an array of pages contiguously into the VMAP_DEFAULT vmap region
-- 
2.30.2


