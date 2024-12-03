Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65229E1837
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:48:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847710.1262776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPW6-0000eF-9Y; Tue, 03 Dec 2024 09:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847710.1262776; Tue, 03 Dec 2024 09:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPW6-0000bu-6I; Tue, 03 Dec 2024 09:48:26 +0000
Received: by outflank-mailman (input) for mailman id 847710;
 Tue, 03 Dec 2024 09:48:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaGl=S4=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tIPW5-0000ZD-A3
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:48:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id bc4a7fe0-b15b-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:48:23 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E247143D;
 Tue,  3 Dec 2024 01:48:51 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 337253F58B;
 Tue,  3 Dec 2024 01:48:22 -0800 (PST)
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
X-Inumbo-ID: bc4a7fe0-b15b-11ef-a0d3-8be0dac302b0
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 1/5] common/vmap: Fall back to simple allocator when !HAS_VMAP
Date: Tue,  3 Dec 2024 09:48:06 +0000
Message-Id: <20241203094811.427076-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203094811.427076-1-luca.fancellu@arm.com>
References: <20241203094811.427076-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When HAS_VMAP is disabled, the xv{malloc,zalloc,...} functions
should fall back to the simple x{malloc,zalloc,...} variant,
implement that because MPU systems won't have virtual memory.

Additionally remove VMAP_VIRT_START from vmap.h guards since
MPU systems won't have it defined.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v3:
 - use #define-s instead of static inline functions
Changes from v2:
 - Don't protect declarations.
Changes from v1:
 - put back static inline iounmap
 - changed commit message
 - hide not used declaration for system with !HAS_VMAP
 - correct function declared in xvmalloc.h to be static inline
 - prefer '#ifdef' instead of '#if defined' where possible
---
---
 xen/include/xen/vmap.h     |  2 +-
 xen/include/xen/xvmalloc.h | 21 ++++++++++++++++-----
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index c1dd7ac22f30..26c831757a11 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -5,7 +5,7 @@
  * purpose area (VMAP_DEFAULT) and a livepatch-specific area (VMAP_XEN). The
  * latter is used when loading livepatches and the former for everything else.
  */
-#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
+#ifndef __XEN_VMAP_H__
 #define __XEN_VMAP_H__
 
 #include <xen/mm-frame.h>
diff --git a/xen/include/xen/xvmalloc.h b/xen/include/xen/xvmalloc.h
index 440d85a284bb..7686d49f8154 100644
--- a/xen/include/xen/xvmalloc.h
+++ b/xen/include/xen/xvmalloc.h
@@ -40,20 +40,31 @@
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
+#define xvfree      xfree
+#define _xvmalloc   _xmalloc
+#define _xvzalloc   _xzalloc
+#define _xvrealloc  _xrealloc
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


