Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62530A29B93
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 22:04:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882342.1292481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfmXs-0004jA-Na; Wed, 05 Feb 2025 21:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882342.1292481; Wed, 05 Feb 2025 21:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfmXs-0004hC-Kr; Wed, 05 Feb 2025 21:02:52 +0000
Received: by outflank-mailman (input) for mailman id 882342;
 Wed, 05 Feb 2025 21:02:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BBaJ=U4=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tfmXr-0004h6-3w
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 21:02:51 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ccc6147-e404-11ef-a0e7-8be0dac302b0;
 Wed, 05 Feb 2025 22:02:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id ED4278285BF7;
 Wed,  5 Feb 2025 15:02:44 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id M7BOlfPNl8hb; Wed,  5 Feb 2025 15:02:43 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 70E9182884A4;
 Wed,  5 Feb 2025 15:02:43 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4P29xzsbADvv; Wed,  5 Feb 2025 15:02:43 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id CF5008285BF7;
 Wed,  5 Feb 2025 15:02:42 -0600 (CST)
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
X-Inumbo-ID: 8ccc6147-e404-11ef-a0e7-8be0dac302b0
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 70E9182884A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1738789363; bh=WTETy9lRWj1viZd435wNTZo/Hv0M50mlyu35gt3a3JE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=S7iGS8d+Er8aWzYg43QuXv/arFEFUDZ6VOisel1J+0IecrzEkwct/mbUSUbvexwUi
	 CQ+GNrWkjUACQ/1xj4G6ZQ/YNk9EDiAlU8RqnguuEdUR5NP8oZRH0GGJwl0t24dSCR
	 NoZvYqMEZA0tXFOfqGJSKzVEoDg0UqfSX41b5obs=
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
Subject: [PATCH v2] xen/mm: Introduce per-arch pte_attr_t type for PTE flags
Date: Wed,  5 Feb 2025 15:02:39 -0600
Message-Id: <2b7f3e29fc1790978e2f615ee634f3a84bc340c9.1738789214.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
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
Changes in v2:
  - Drop Kconfig option and use `#define pte_attr_t pte_attr_t` for arches to
  opt-in to defining the type.
  - Move default pte_attr_definition to xen/types.h
  - Update commit message to reflect that this change isn't strictly
  necessary for arches w/ >32bit pte flags

 xen/arch/ppc/include/asm/types.h | 3 +++
 xen/arch/ppc/mm-radix.c          | 2 +-
 xen/common/efi/boot.c            | 4 ++--
 xen/common/vmap.c                | 2 +-
 xen/include/xen/mm.h             | 4 ++--
 xen/include/xen/types.h          | 4 ++++
 xen/include/xen/vmap.h           | 3 ++-
 7 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/arch/ppc/include/asm/types.h b/xen/arch/ppc/include/asm/types.h
index ffaf378a4d..9d80e92e44 100644
--- a/xen/arch/ppc/include/asm/types.h
+++ b/xen/arch/ppc/include/asm/types.h
@@ -8,4 +8,7 @@ typedef unsigned long vaddr_t;
 #define INVALID_PADDR (~0UL)
 #define PRIpaddr "016lx"

+typedef unsigned long pte_attr_t;
+#define pte_attr_t pte_attr_t
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
index 16f733281a..708705ce72 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -113,9 +113,9 @@ int map_pages_to_xen(
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
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 543bfb2159..8f593c6f74 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -18,6 +18,10 @@ typedef signed long ssize_t;

 typedef __PTRDIFF_TYPE__ ptrdiff_t;

+#ifndef pte_attr_t
+typedef unsigned int pte_attr_t;
+#endif
+
 /*
  * Users of this macro are expected to pass a positive value.
  *
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


