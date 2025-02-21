Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29698A40079
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 21:11:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894598.1303333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZMY-0007Uf-Qy; Fri, 21 Feb 2025 20:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894598.1303333; Fri, 21 Feb 2025 20:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZMY-0007RE-Nr; Fri, 21 Feb 2025 20:11:06 +0000
Received: by outflank-mailman (input) for mailman id 894598;
 Fri, 21 Feb 2025 20:11:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VJx0=VM=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tlZMX-0007PL-Aa
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 20:11:05 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8ff787d-f08f-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 21:11:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C16E58287A06;
 Fri, 21 Feb 2025 14:11:01 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id yLelyzfeWX9y; Fri, 21 Feb 2025 14:11:00 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 29A328287311;
 Fri, 21 Feb 2025 14:11:00 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id eO_TZkpEai9p; Fri, 21 Feb 2025 14:11:00 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id CECEC8287A06;
 Fri, 21 Feb 2025 14:10:58 -0600 (CST)
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
X-Inumbo-ID: f8ff787d-f08f-11ef-9896-31a8f345e629
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 29A328287311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1740168660; bh=m43n8JQoxt7cBKsoDBjjQtEo/wuJipJu678wJzv9lS8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=WKTrUnZ9ntiHURoeN6gg29XkURDCHJ6ldyFZuk1EkjOw1JFVztSqRSeh8kPZABeI2
	 q+//IPTnhoMUKU/Pn+I1Fo0e6AGJ+B/Rv5GUpYo/FPwIHPFZKnUHaqL6RIVhEet9UD
	 OtdmtTx505kEYUuLX0iFQ7mJWOo1l0GUPGRyeB4w=
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
Subject: [PATCH v3 2/2] xen/mm: Introduce per-arch pte_attr_t type for PTE flags
Date: Fri, 21 Feb 2025 14:10:53 -0600
Message-Id: <ca31107923a8794f8752e65b5c3ad14bd2f326cf.1739488487.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1d0826e88e95357979d74fb3702b35fdb0b75151.1739488487.git.sanastasio@raptorengineering.com>
References: <1d0826e88e95357979d74fb3702b35fdb0b75151.1739488487.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Xen's memory management APIs map_pages_to_xen, modify_xen_mappings,
set_fixmap, ioremap_attr, and __vmap all use an unsigned int to
represent architecture-dependent page table entry flags. This assumption
is not well-suited for PPC/radix where some flags go past 32-bits, so
introduce the pte_attr_t type to allow architectures to opt in to larger
types to store PTE flags.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes in v3:
  - Use new asm/mm-types.h to pull in pte_attr_t definition when
  necessary.
  - Drop define+ifdef since pte_attr_t is now always defined.

Changes in v2:
  - Drop Kconfig option and use `#define pte_attr_t pte_attr_t` for arches to
  opt-in to defining the type.
  - Move default pte_attr_definition to xen/types.h
  - Update commit message to reflect that this change isn't strictly
  necessary for arches w/ >32bit pte flags

 xen/arch/ppc/include/asm/Makefile   | 1 -
 xen/arch/ppc/include/asm/mm-types.h | 7 +++++++
 xen/arch/ppc/mm-radix.c             | 2 +-
 xen/common/efi/boot.c               | 5 +++--
 xen/common/vmap.c                   | 2 +-
 xen/include/asm-generic/mm-types.h  | 2 ++
 xen/include/xen/mm.h                | 5 +++--
 xen/include/xen/vmap.h              | 4 +++-
 8 files changed, 20 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/mm-types.h

diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index c0dbc68ac6..c989a7f89b 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -5,7 +5,6 @@ generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
-generic-y += mm-types.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += perfc_defn.h
diff --git a/xen/arch/ppc/include/asm/mm-types.h b/xen/arch/ppc/include/asm/mm-types.h
new file mode 100644
index 0000000000..0cb850f4f6
--- /dev/null
+++ b/xen/arch/ppc/include/asm/mm-types.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_PPC_MM_TYPES_H__
+#define __ASM_PPC_MM_TYPES_H__
+
+typedef unsigned long pte_attr_t;
+
+#endif /* __ASM_PPC_MM_TYPES_H__ */
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
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index efbec00af9..999dbce4dc 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1,4 +1,5 @@
 #include "efi.h"
+#include <asm/mm-types.h>
 #include <efi/efiprot.h>
 #include <efi/efipciio.h>
 #include <public/xen.h>
@@ -1656,7 +1657,7 @@ void __init efi_init_memory(void)
     struct rt_extra {
         struct rt_extra *next;
         unsigned long smfn, emfn;
-        unsigned int prot;
+        pte_attr_t prot;
     } *extra, *extra_head = NULL;

     free_ebmalloc_unused_mem();
@@ -1671,7 +1672,7 @@ void __init efi_init_memory(void)
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
diff --git a/xen/include/asm-generic/mm-types.h b/xen/include/asm-generic/mm-types.h
index 26490e48db..9eb3cba698 100644
--- a/xen/include/asm-generic/mm-types.h
+++ b/xen/include/asm-generic/mm-types.h
@@ -2,4 +2,6 @@
 #ifndef __ASM_GENERIC_MM_TYPES_H__
 #define __ASM_GENERIC_MM_TYPES_H__

+typedef unsigned int pte_attr_t;
+
 #endif /* __ASM_GENERIC_MM_TYPES_H__ */
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 16f733281a..bdb71a99ca 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -69,6 +69,7 @@
 #include <xen/spinlock.h>
 #include <xen/perfc.h>
 #include <public/memory.h>
+#include <asm/mm-types.h>

 struct page_info;

@@ -113,9 +114,9 @@ int map_pages_to_xen(
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
index 26c831757a..e1155ed14a 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -8,8 +8,10 @@
 #ifndef __XEN_VMAP_H__
 #define __XEN_VMAP_H__

+#include <xen/mm.h>
 #include <xen/mm-frame.h>
 #include <xen/page-size.h>
+#include <asm/mm-types.h>

 /* Identifiers for the linear ranges tracked by vmap */
 enum vmap_region {
@@ -57,7 +59,7 @@ void vm_init_type(enum vmap_region type, void *start, void *end);
  * @return Pointer to the mapped area on success; NULL otherwise.
  */
 void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
-             unsigned int align, unsigned int flags, enum vmap_region type);
+             unsigned int align, pte_attr_t flags, enum vmap_region type);

 /*
  * Map an array of pages contiguously into the VMAP_DEFAULT vmap region
--
2.30.2


