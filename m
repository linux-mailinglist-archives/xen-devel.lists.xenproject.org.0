Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF9F9D2200
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 09:58:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839757.1255540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDK46-0005Hy-91; Tue, 19 Nov 2024 08:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839757.1255540; Tue, 19 Nov 2024 08:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDK46-0005GK-5f; Tue, 19 Nov 2024 08:58:30 +0000
Received: by outflank-mailman (input) for mailman id 839757;
 Tue, 19 Nov 2024 08:58:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Q5=SO=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tDK44-0005G2-Gm
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 08:58:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6fb9daa2-a654-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 09:58:25 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0814C1596;
 Tue, 19 Nov 2024 00:58:55 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 500313F6A8;
 Tue, 19 Nov 2024 00:58:24 -0800 (PST)
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
X-Inumbo-ID: 6fb9daa2-a654-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjZmYjlkYWEyLWE2NTQtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDA2NzA1LjkzMzgwNiwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/4] common/vmap: Fall back to simple allocator when !HAS_VMAP
Date: Tue, 19 Nov 2024 08:58:03 +0000
Message-Id: <20241119085806.805142-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119085806.805142-1-luca.fancellu@arm.com>
References: <20241119085806.805142-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When HAS_VMAP is disabled, the xv{malloc,zalloc,...} functions
should fall back to the simple x{malloc,zalloc,...} variant,
implement that because MPU systems won't have virtual memory.

Additionally remove VMAP_VIRT_START from vmap.h guards since
MPU systems won't have it defined and protect with #ifdef
CONFIG_HAS_VMAP all the declaration that won't be used in a
MPU system built without HAS_VMAP.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v1:
 - put back static inline iounmap
 - changed commit message
 - hide not used declaration for system with !HAS_VMAP
 - correct function declared in xvmalloc.h to be static inline
 - prefer '#ifdef' instead of '#if defined' where possible
---
---
 xen/include/xen/vmap.h     | 61 ++++++++++++++++++++++----------------
 xen/include/xen/xvmalloc.h | 36 ++++++++++++++++++----
 2 files changed, 66 insertions(+), 31 deletions(-)

diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index c1dd7ac22f30..a9f4a07bbb65 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -5,12 +5,19 @@
  * purpose area (VMAP_DEFAULT) and a livepatch-specific area (VMAP_XEN). The
  * latter is used when loading livepatches and the former for everything else.
  */
-#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
+#ifndef __XEN_VMAP_H__
 #define __XEN_VMAP_H__
 
 #include <xen/mm-frame.h>
 #include <xen/page-size.h>
 
+/*
+ * MPU systems won't have HAS_VMAP enabled, but will provide implementation
+ * only for some of the functions of this module. So hide the definition for
+ * some of these function to systems where !HAS_VMAP
+ */
+#ifdef CONFIG_HAS_VMAP
+
 /* Identifiers for the linear ranges tracked by vmap */
 enum vmap_region {
     /*
@@ -68,25 +75,6 @@ void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
  */
 void *vmap(const mfn_t *mfn, unsigned int nr);
 
-/*
- * Maps physically contiguous pages onto the VMAP_DEFAULT vmap region
- *
- * @param mfn Base mfn of the physical region
- * @param nr  Number of mfns in the physical region
- * @return Pointer to the mapped area on success; NULL otherwise.
- */
-void *vmap_contig(mfn_t mfn, unsigned int nr);
-
-/*
- * Unmaps a range of virtually contiguous memory from one of the vmap regions
- *
- * The system remembers internally how wide the mapping is and unmaps it all.
- * It also can determine the vmap region type from the `va`.
- *
- * @param va Virtual base address of the range to unmap
- */
-void vunmap(const void *va);
-
 /*
  * Allocate `size` octets of possibly non-contiguous physical memory and map
  * them contiguously in the VMAP_DEFAULT vmap region
@@ -112,6 +100,33 @@ void *vzalloc(size_t size);
  */
 void vfree(void *va);
 
+/* Return the number of pages in the mapping starting at address 'va' */
+unsigned int vmap_size(const void *va);
+
+/* Pointer to 1 octet past the end of the VMAP_DEFAULT virtual area */
+void *arch_vmap_virt_end(void);
+
+#endif /* CONFIG_HAS_VMAP */
+
+/*
+ * Maps physically contiguous pages onto the VMAP_DEFAULT vmap region
+ *
+ * @param mfn Base mfn of the physical region
+ * @param nr  Number of mfns in the physical region
+ * @return Pointer to the mapped area on success; NULL otherwise.
+ */
+void *vmap_contig(mfn_t mfn, unsigned int nr);
+
+/*
+ * Unmaps a range of virtually contiguous memory from one of the vmap regions
+ *
+ * The system remembers internally how wide the mapping is and unmaps it all.
+ * It also can determine the vmap region type from the `va`.
+ *
+ * @param va Virtual base address of the range to unmap
+ */
+void vunmap(const void *va);
+
 /*
  * Analogous to vmap_contig(), but for IO memory
  *
@@ -124,9 +139,6 @@ void vfree(void *va);
  */
 void __iomem *ioremap(paddr_t pa, size_t len);
 
-/* Return the number of pages in the mapping starting at address 'va' */
-unsigned int vmap_size(const void *va);
-
 /* Analogous to vunmap(), but for IO memory mapped via ioremap() */
 static inline void iounmap(void __iomem *va)
 {
@@ -135,9 +147,6 @@ static inline void iounmap(void __iomem *va)
     vunmap((void *)(addr & PAGE_MASK));
 }
 
-/* Pointer to 1 octet past the end of the VMAP_DEFAULT virtual area */
-void *arch_vmap_virt_end(void);
-
 /* Initialises the VMAP_DEFAULT virtual range */
 static inline void vm_init(void)
 {
diff --git a/xen/include/xen/xvmalloc.h b/xen/include/xen/xvmalloc.h
index 440d85a284bb..e97a30f61e96 100644
--- a/xen/include/xen/xvmalloc.h
+++ b/xen/include/xen/xvmalloc.h
@@ -40,20 +40,46 @@
     ((typeof(ptr))_xvrealloc(ptr, offsetof(typeof(*(ptr)), field[nr]), \
                              __alignof__(typeof(*(ptr)))))
 
+#ifdef CONFIG_HAS_VMAP
+
 /* Free any of the above. */
 void xvfree(void *va);
 
+/* Underlying functions */
+void *_xvmalloc(size_t size, unsigned int align);
+void *_xvzalloc(size_t size, unsigned int align);
+void *_xvrealloc(void *va, size_t size, unsigned int align);
+
+#else /* !CONFIG_HAS_VMAP */
+
+static inline void xvfree(void *va)
+{
+    xfree(va);
+}
+
+static inline void *_xvmalloc(size_t size, unsigned int align)
+{
+    return _xmalloc(size, align);
+}
+
+static inline void *_xvzalloc(size_t size, unsigned int align)
+{
+    return _xzalloc(size, align);
+}
+
+static inline void *_xvrealloc(void *va, size_t size, unsigned int align)
+{
+    return _xrealloc(va, size, align);
+}
+
+#endif /* CONFIG_HAS_VMAP */
+
 /* Free an allocation, and zero the pointer to it. */
 #define XVFREE(p) do { \
     xvfree(p);         \
     (p) = NULL;        \
 } while ( false )
 
-/* Underlying functions */
-void *_xvmalloc(size_t size, unsigned int align);
-void *_xvzalloc(size_t size, unsigned int align);
-void *_xvrealloc(void *va, size_t size, unsigned int align);
-
 static inline void *_xvmalloc_array(
     size_t size, unsigned int align, unsigned long num)
 {
-- 
2.34.1


