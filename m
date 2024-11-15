Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891D29CDCFF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 11:51:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837072.1252990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtud-0000pD-T1; Fri, 15 Nov 2024 10:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837072.1252990; Fri, 15 Nov 2024 10:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtud-0000mR-Q0; Fri, 15 Nov 2024 10:50:51 +0000
Received: by outflank-mailman (input) for mailman id 837072;
 Fri, 15 Nov 2024 10:50:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ntz=SK=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tBtud-0000jy-1B
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 10:50:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 786ddaff-a33f-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 11:50:47 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7CDF176A;
 Fri, 15 Nov 2024 02:51:16 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 013113F6A8;
 Fri, 15 Nov 2024 02:50:45 -0800 (PST)
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
X-Inumbo-ID: 786ddaff-a33f-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6Ijc4NmRkYWZmLWEzM2YtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjY3ODQ3LjY1OTI1LCJzZW5kZXIiOiJsdWNhLmZhbmNlbGx1QGFybS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/5] common/vmap: Fall back to simple allocator when !HAS_VMAP
Date: Fri, 15 Nov 2024 10:50:32 +0000
Message-Id: <20241115105036.218418-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115105036.218418-1-luca.fancellu@arm.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When HAS_VMAP is disabled, the xv{malloc,zalloc,...} functions
should fall back to the simple x{malloc,zalloc,...} variant,
implement that because MPU systems won't have virtual memory.

Additionally remove VMAP_VIRT_START from vmap.h guards since
MPU systems won't have it defined and move iounmap function
to the vmap.c file, because it uses the vunmap function that
won't be compiled in when !HAS_VMAP.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
This is a rework of this one: https://patchwork.kernel.org/project/xen-devel/patch/20230626033443.2943270-16-Penny.Zheng@arm.com/
where I hope I've understood correctly what Jan Beulich was suggesting here:
https://patchwork.kernel.org/project/xen-devel/patch/20230626033443.2943270-16-Penny.Zheng@arm.com/#25409119
---
 xen/common/vmap.c          |  7 +++++++
 xen/include/xen/vmap.h     |  9 ++-------
 xen/include/xen/xvmalloc.h | 36 +++++++++++++++++++++++++++++++-----
 3 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index 47225fecc067..294280dcd08c 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -426,3 +426,10 @@ void *_xvrealloc(void *va, size_t size, unsigned int align)
 
     return ptr;
 }
+
+void iounmap(void __iomem *va)
+{
+    unsigned long addr = (unsigned long)(void __force *)va;
+
+    vunmap((void *)(addr & PAGE_MASK));
+}
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index c1dd7ac22f30..9e1d794c2548 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -5,7 +5,7 @@
  * purpose area (VMAP_DEFAULT) and a livepatch-specific area (VMAP_XEN). The
  * latter is used when loading livepatches and the former for everything else.
  */
-#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
+#if !defined(__XEN_VMAP_H__)
 #define __XEN_VMAP_H__
 
 #include <xen/mm-frame.h>
@@ -128,12 +128,7 @@ void __iomem *ioremap(paddr_t pa, size_t len);
 unsigned int vmap_size(const void *va);
 
 /* Analogous to vunmap(), but for IO memory mapped via ioremap() */
-static inline void iounmap(void __iomem *va)
-{
-    unsigned long addr = (unsigned long)(void __force *)va;
-
-    vunmap((void *)(addr & PAGE_MASK));
-}
+void iounmap(void __iomem *va);
 
 /* Pointer to 1 octet past the end of the VMAP_DEFAULT virtual area */
 void *arch_vmap_virt_end(void);
diff --git a/xen/include/xen/xvmalloc.h b/xen/include/xen/xvmalloc.h
index 440d85a284bb..802be6687085 100644
--- a/xen/include/xen/xvmalloc.h
+++ b/xen/include/xen/xvmalloc.h
@@ -40,20 +40,46 @@
     ((typeof(ptr))_xvrealloc(ptr, offsetof(typeof(*(ptr)), field[nr]), \
                              __alignof__(typeof(*(ptr)))))
 
+#if defined(CONFIG_HAS_VMAP)
+
 /* Free any of the above. */
 void xvfree(void *va);
 
+/* Underlying functions */
+void *_xvmalloc(size_t size, unsigned int align);
+void *_xvzalloc(size_t size, unsigned int align);
+void *_xvrealloc(void *va, size_t size, unsigned int align);
+
+#else
+
+static inline void xvfree(void *va)
+{
+    xfree(va);
+}
+
+void *_xvmalloc(size_t size, unsigned int align)
+{
+    return _xmalloc(size, align);
+}
+
+void *_xvzalloc(size_t size, unsigned int align)
+{
+    return _xzalloc(size, align);
+}
+
+void *_xvrealloc(void *va, size_t size, unsigned int align)
+{
+    return _xrealloc(va, size, align);
+}
+
+#endif
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


