Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D422245108
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 15:04:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6vqu-0006Sr-As; Sat, 15 Aug 2020 13:04:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ceF6=BZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k6vqt-0006R1-5s
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 13:04:03 +0000
X-Inumbo-ID: 1045f604-88e3-414d-b10f-d82fccd01c9d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1045f604-88e3-414d-b10f-d82fccd01c9d;
 Sat, 15 Aug 2020 13:03:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6362CB57B;
 Sat, 15 Aug 2020 13:04:14 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH I v2 5/6] tools: define ROUNDUP() in
 tools/include/xen-tools/libs.h
Date: Sat, 15 Aug 2020 15:03:40 +0200
Message-Id: <20200815130341.27147-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200815130341.27147-1-jgross@suse.com>
References: <20200815130341.27147-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Today there are multiple copies of the ROUNDUP() macro in various
sources and headers. Define it once in tools/include/xen-tools/libs.h.

Using xen-tools/libs.h enables removing copies of MIN() and MAX(), too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/console/daemon/io.c        | 6 +-----
 tools/include/xen-tools/libs.h   | 4 ++++
 tools/libs/call/buffer.c         | 3 +--
 tools/libs/foreignmemory/linux.c | 3 +--
 tools/libs/gnttab/private.h      | 3 ---
 tools/libxc/xg_private.h         | 1 -
 tools/libxl/libxl_internal.h     | 3 ---
 tools/xenstore/xenstored_core.c  | 2 --
 8 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index a43c57edad..4af27ffc5d 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -49,9 +49,7 @@
 #include <sys/ioctl.h>
 #include <libutil.h>
 #endif
-
-#define MAX(a, b) (((a) > (b)) ? (a) : (b))
-#define MIN(a, b) (((a) < (b)) ? (a) : (b))
+#include <xen-tools/libs.h>
 
 /* Each 10 bits takes ~ 3 digits, plus one, plus one for nul terminator. */
 #define MAX_STRLEN(x) ((sizeof(x) * CHAR_BIT + CHAR_BIT-1) / 10 * 3 + 2)
@@ -80,8 +78,6 @@ static struct pollfd  *fds;
 static unsigned int current_array_size;
 static unsigned int nr_fds;
 
-#define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
-
 struct buffer {
 	char *data;
 	size_t consumed;
diff --git a/tools/include/xen-tools/libs.h b/tools/include/xen-tools/libs.h
index cc7dfc8c64..a16e0c3807 100644
--- a/tools/include/xen-tools/libs.h
+++ b/tools/include/xen-tools/libs.h
@@ -59,4 +59,8 @@
     })
 #endif
 
+#ifndef ROUNDUP
+#define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
+#endif
+
 #endif	/* __XEN_TOOLS_LIBS__ */
diff --git a/tools/libs/call/buffer.c b/tools/libs/call/buffer.c
index 0b6af2db60..085674d882 100644
--- a/tools/libs/call/buffer.c
+++ b/tools/libs/call/buffer.c
@@ -16,14 +16,13 @@
 #include <errno.h>
 #include <string.h>
 #include <pthread.h>
+#include <xen-tools/libs.h>
 
 #include "private.h"
 
 #define DBGPRINTF(_m...) \
     xtl_log(xcall->logger, XTL_DEBUG, -1, "xencall:buffer", _m)
 
-#define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
-
 pthread_mutex_t cache_mutex = PTHREAD_MUTEX_INITIALIZER;
 
 static void cache_lock(xencall_handle *xcall)
diff --git a/tools/libs/foreignmemory/linux.c b/tools/libs/foreignmemory/linux.c
index 8daa5828e3..fe73d5ab72 100644
--- a/tools/libs/foreignmemory/linux.c
+++ b/tools/libs/foreignmemory/linux.c
@@ -25,11 +25,10 @@
 
 #include <sys/mman.h>
 #include <sys/ioctl.h>
+#include <xen-tools/libs.h>
 
 #include "private.h"
 
-#define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
-
 #ifndef O_CLOEXEC
 #define O_CLOEXEC 0
 #endif
diff --git a/tools/libs/gnttab/private.h b/tools/libs/gnttab/private.h
index c5e23639b1..eb6a6abe54 100644
--- a/tools/libs/gnttab/private.h
+++ b/tools/libs/gnttab/private.h
@@ -5,9 +5,6 @@
 #include <xentoolcore_internal.h>
 #include <xengnttab.h>
 
-/* Set of macros/defines used by both Linux and FreeBSD */
-#define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
-
 #define GTERROR(_l, _f...) xtl_log(_l, XTL_ERROR, errno, "gnttab", _f)
 #define GSERROR(_l, _f...) xtl_log(_l, XTL_ERROR, errno, "gntshr", _f)
 
diff --git a/tools/libxc/xg_private.h b/tools/libxc/xg_private.h
index f0a4b2c616..40b5baecde 100644
--- a/tools/libxc/xg_private.h
+++ b/tools/libxc/xg_private.h
@@ -95,7 +95,6 @@ typedef uint64_t x86_pgentry_t;
 #define PAGE_SIZE_X86           (1UL << PAGE_SHIFT_X86)
 #define PAGE_MASK_X86           (~(PAGE_SIZE_X86-1))
 
-#define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
 #define NRPAGES(x) (ROUNDUP(x, PAGE_SHIFT) >> PAGE_SHIFT)
 
 
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index 94a23179d3..c63d0686fd 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -132,9 +132,6 @@
 #define MB(_mb)     (_AC(_mb, ULL) << 20)
 #define GB(_gb)     (_AC(_gb, ULL) << 30)
 
-#define ROUNDUP(_val, _order)                                           \
-    (((unsigned long)(_val)+(1UL<<(_order))-1) & ~((1UL<<(_order))-1))
-
 #define DIV_ROUNDUP(n, d) (((n) + (d) - 1) / (d))
 
 #define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 7bd959f28b..9700772d40 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -73,8 +73,6 @@ static unsigned int nr_fds;
 static int sock = -1;
 static int ro_sock = -1;
 
-#define ROUNDUP(_x, _w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
-
 static bool verbose = false;
 LIST_HEAD(connections);
 int tracefd = -1;
-- 
2.26.2


