Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BC72E1F7E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 17:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58498.102941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks76V-0000YN-8b; Wed, 23 Dec 2020 16:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58498.102941; Wed, 23 Dec 2020 16:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks76V-0000Xm-4T; Wed, 23 Dec 2020 16:35:11 +0000
Received: by outflank-mailman (input) for mailman id 58498;
 Wed, 23 Dec 2020 16:35:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ifz=F3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ks76T-0000XT-JQ
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 16:35:09 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a4fefce-e134-48d8-8e6e-ee2771c0087a;
 Wed, 23 Dec 2020 16:35:08 +0000 (UTC)
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
X-Inumbo-ID: 7a4fefce-e134-48d8-8e6e-ee2771c0087a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608741308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mIHqFXZKILQ2PSe2CqBuCc+ylOQGqiB+Dim1E7v3fY8=;
  b=WkE9fwTVcyLFjX/EI973IXox2c9pLJdNO57vvGgTJARIhW5hgFuzQG5V
   XkrHo7Vms8wGKB+KJIoLM0J5uav9q3HwCfKdAtRudpekuDK/AXmyJAEMj
   x6tzRvDGUVzPNROoFk2+cUrhZ7YjJ50D8wCyTriz9I4o5llrCNdDa1zRz
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: UwZgj87PZM7v3t9dGeOvfWHE/mUNZGCeT53o7uemvG8vc3yvXqwO3G70+qQ+Wu0OGDHrhLXkWF
 QvlgSamH7GIOFgWyzWn4r9ssVvDjxuJj8fm9XPeoO7FAPZvpf6eZM1Q0v/1Z3Skxj2iMJyzuHL
 YboTG/z/gC3qnsjxNrhzGk7AVLtZ25XvMxupuqpWjapIRWkholW9km0W78ANwapUMM0pA9dh6i
 /9WFsUEPiuQCukHkLigjmtCC1Qz8i0UOpOIwosrJ8LpRSl9nZX3eQjljGZHLdt7JWZScElnI5I
 35M=
X-SBRS: 5.2
X-MesageID: 34085172
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,441,1599537600"; 
   d="scan'208";a="34085172"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH 1/4] xen/dmalloc: Introduce dmalloc() APIs
Date: Wed, 23 Dec 2020 16:34:39 +0000
Message-ID: <20201223163442.8840-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201223163442.8840-1-andrew.cooper3@citrix.com>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Wrappers for xmalloc() and friends, which track allocations tied to a specific
domain.

Check for any leaked memory at domain destruction time.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>

RFC:
 * This probably wants to be less fatal in release builds
 * In an ideal world, we'd also want to count the total number of bytes
   allocated from the xmalloc heap, which would be interesting to print in the
   'q' debugkey.  However, that data is fairly invasive to obtain.
 * More complicated logic could track the origins of each allocation, and be
   able to identify which one(s) leaked.
---
 xen/common/Makefile       |  1 +
 xen/common/dmalloc.c      | 19 +++++++++++++++++++
 xen/common/domain.c       |  6 ++++++
 xen/include/xen/dmalloc.h | 29 +++++++++++++++++++++++++++++
 xen/include/xen/sched.h   |  2 ++
 5 files changed, 57 insertions(+)
 create mode 100644 xen/common/dmalloc.c
 create mode 100644 xen/include/xen/dmalloc.h

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 7a4e652b57..c5d9c23fd1 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
+obj-y += dmalloc.o
 obj-y += domain.o
 obj-y += event_2l.o
 obj-y += event_channel.o
diff --git a/xen/common/dmalloc.c b/xen/common/dmalloc.c
new file mode 100644
index 0000000000..e3a0e546c2
--- /dev/null
+++ b/xen/common/dmalloc.c
@@ -0,0 +1,19 @@
+#include <xen/dmalloc.h>
+#include <xen/sched.h>
+#include <xen/xmalloc.h>
+
+void dfree(struct domain *d, void *ptr)
+{
+    atomic_dec(&d->dalloc_heap);
+    xfree(ptr);
+}
+
+void *_dzalloc(struct domain *d, size_t size, size_t align)
+{
+    void *ptr = _xmalloc(size, align);
+
+    if ( ptr )
+        atomic_inc(&d->dalloc_heap);
+
+    return ptr;
+}
diff --git a/xen/common/domain.c b/xen/common/domain.c
index d151be3f36..1db1c0e70a 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -332,6 +332,8 @@ static int domain_teardown(struct domain *d)
  */
 static void _domain_destroy(struct domain *d)
 {
+    int outstanding;
+
     BUG_ON(!d->is_dying);
     BUG_ON(atomic_read(&d->refcnt) != DOMAIN_DESTROYED);
 
@@ -347,6 +349,10 @@ static void _domain_destroy(struct domain *d)
 
     lock_profile_deregister_struct(LOCKPROF_TYPE_PERDOM, d);
 
+    outstanding = atomic_read(&d->dalloc_heap);
+    if ( outstanding )
+        panic("%pd has %d outstanding heap allocations\n", d, outstanding);
+
     free_domain_struct(d);
 }
 
diff --git a/xen/include/xen/dmalloc.h b/xen/include/xen/dmalloc.h
new file mode 100644
index 0000000000..a90cf0259c
--- /dev/null
+++ b/xen/include/xen/dmalloc.h
@@ -0,0 +1,29 @@
+#ifndef XEN_DMALLOC_H
+#define XEN_DMALLOC_H
+
+#include <xen/types.h>
+
+struct domain;
+
+#define dzalloc_array(d, _type, _num)                                   \
+    ((_type *)_dzalloc_array(d, sizeof(_type), __alignof__(_type), _num))
+
+
+void dfree(struct domain *d, void *ptr);
+
+#define DFREE(d, p)                             \
+    do {                                        \
+        dfree(d, p);                            \
+        (p) = NULL;                             \
+    } while ( 0 )
+
+
+void *_dzalloc(struct domain *d, size_t size, size_t align);
+
+static inline void *_dzalloc_array(struct domain *d, size_t size,
+                                   size_t align, size_t num)
+{
+    return _dzalloc(d, size * num, align);
+}
+
+#endif /* XEN_DMALLOC_H */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 3e46384a3c..8ed8b55a1e 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -349,6 +349,8 @@ struct domain
     atomic_t         shr_pages;         /* shared pages */
     atomic_t         paged_pages;       /* paged-out pages */
 
+    atomic_t         dalloc_heap;       /* Number of xmalloc-like allocations. */
+
     /* Scheduling. */
     void            *sched_priv;    /* scheduler-specific data */
     struct sched_unit *sched_unit_list;
-- 
2.11.0


