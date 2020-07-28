Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580C32308DA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 13:37:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0NvL-0006C1-7B; Tue, 28 Jul 2020 11:37:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0NvJ-0006Br-G5
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 11:37:33 +0000
X-Inumbo-ID: b8e18ad4-d0c6-11ea-8b28-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8e18ad4-d0c6-11ea-8b28-bc764e2007e4;
 Tue, 28 Jul 2020 11:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595936253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hLRKErlmwe4NVS9+YaW7c8jBL06IM4hgS3F+Z8g4rWY=;
 b=HZNfHV1mwLDlauzLWmUJKA5XZhlwyFlS9owkEwXwzO8hd9Fv7NKocNck
 chbTN+2ZzJfnbbaKWcIO4iYAd/DOCTV2T36fcMppE+hHUfshJS3sZlfJF
 kD1iurYe0m35l9GhRNAHAV17V+W+dtKNN5Lb4P4E/D0uVSsL113NyVX3c s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: wkiniwnR8YeCE2n7IgGkdtyN/iNg7wK2C/34nL3lEyhS9OFHgUrvsEX3usdR+sM70PAJ/iRaiI
 EymaPtsnlwm3M8kzBbowTG9KbqS+F7OBNRlM5UQF13mso1MLzwOCytn1b35heDGL2ejhRFjISm
 8IfRqWq4XH7SHoQqBM5Ih5WSb4NO4l991xaBIpIlYY9ZQpiKkIBc1BRuZUen6ilHoMsg0PuFCn
 t/AVz+o0hGJ9TrS2VEZY4CttZo2t1Xxw01+6bYfu/5SgeAvXSnJnQPHq7p9+dV44I+kLhYWxhV
 JT0=
X-SBRS: 2.7
X-MesageID: 23330303
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23330303"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 5/5] tools/foreignmem: Support querying the size of a resource
Date: Tue, 28 Jul 2020 12:37:11 +0100
Message-ID: <20200728113712.22966-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200728113712.22966-1-andrew.cooper3@citrix.com>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

With the Xen side of this interface fixed to return real sizes, userspace
needs to be able to make the query.

Introduce xenforeignmemory_resource_size() for the purpose, bumping the
library minor version and providing compatiblity for the non-Linux builds.

Its not possible to reuse the IOCTL_PRIVCMD_MMAP_RESOURCE infrastructure,
because it depends on having already mmap()'d a suitably sized region before
it will make an XENMEM_acquire_resource hypercall to Xen.

Instead, open a xencall handle and make an XENMEM_acquire_resource hypercall
directly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
---
 tools/libs/foreignmemory/Makefile                  |  2 +-
 tools/libs/foreignmemory/core.c                    | 14 +++++++++
 .../libs/foreignmemory/include/xenforeignmemory.h  | 15 ++++++++++
 tools/libs/foreignmemory/libxenforeignmemory.map   |  4 +++
 tools/libs/foreignmemory/linux.c                   | 35 ++++++++++++++++++++++
 tools/libs/foreignmemory/private.h                 | 14 +++++++++
 6 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
index 28f1bddc96..8e07f92c59 100644
--- a/tools/libs/foreignmemory/Makefile
+++ b/tools/libs/foreignmemory/Makefile
@@ -2,7 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
-MINOR    = 3
+MINOR    = 4
 LIBNAME  := foreignmemory
 USELIBS  := toollog toolcore
 
diff --git a/tools/libs/foreignmemory/core.c b/tools/libs/foreignmemory/core.c
index 63f12e2450..5d95c59c48 100644
--- a/tools/libs/foreignmemory/core.c
+++ b/tools/libs/foreignmemory/core.c
@@ -53,6 +53,10 @@ xenforeignmemory_handle *xenforeignmemory_open(xentoollog_logger *logger,
         if (!fmem->logger) goto err;
     }
 
+    fmem->xcall = xencall_open(fmem->logger, 0);
+    if ( !fmem->xcall )
+        goto err;
+
     rc = osdep_xenforeignmemory_open(fmem);
     if ( rc  < 0 ) goto err;
 
@@ -61,6 +65,7 @@ xenforeignmemory_handle *xenforeignmemory_open(xentoollog_logger *logger,
 err:
     xentoolcore__deregister_active_handle(&fmem->tc_ah);
     osdep_xenforeignmemory_close(fmem);
+    xencall_close(fmem->xcall);
     xtl_logger_destroy(fmem->logger_tofree);
     free(fmem);
     return NULL;
@@ -75,6 +80,7 @@ int xenforeignmemory_close(xenforeignmemory_handle *fmem)
 
     xentoolcore__deregister_active_handle(&fmem->tc_ah);
     rc = osdep_xenforeignmemory_close(fmem);
+    xencall_close(fmem->xcall);
     xtl_logger_destroy(fmem->logger_tofree);
     free(fmem);
     return rc;
@@ -188,6 +194,14 @@ int xenforeignmemory_unmap_resource(
     return rc;
 }
 
+int xenforeignmemory_resource_size(
+    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
+    unsigned int id, unsigned long *nr_frames)
+{
+    return osdep_xenforeignmemory_resource_size(fmem, domid, type,
+                                                id, nr_frames);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/foreignmemory/include/xenforeignmemory.h b/tools/libs/foreignmemory/include/xenforeignmemory.h
index d594be8df0..1ba2f5316b 100644
--- a/tools/libs/foreignmemory/include/xenforeignmemory.h
+++ b/tools/libs/foreignmemory/include/xenforeignmemory.h
@@ -179,6 +179,21 @@ xenforeignmemory_resource_handle *xenforeignmemory_map_resource(
 int xenforeignmemory_unmap_resource(
     xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fres);
 
+/**
+ * Determine the maximum size of a specific resource.
+ *
+ * @parm fmem handle to the open foreignmemory interface
+ * @parm domid the domain id
+ * @parm type the resource type
+ * @parm id the type-specific resource identifier
+ *
+ * Return 0 on success and fills in *nr_frames.  Sets errno and return -1 on
+ * error.
+ */
+int xenforeignmemory_resource_size(
+    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
+    unsigned int id, unsigned long *nr_frames);
+
 #endif
 
 /*
diff --git a/tools/libs/foreignmemory/libxenforeignmemory.map b/tools/libs/foreignmemory/libxenforeignmemory.map
index d5323c87d9..8aca341b99 100644
--- a/tools/libs/foreignmemory/libxenforeignmemory.map
+++ b/tools/libs/foreignmemory/libxenforeignmemory.map
@@ -19,3 +19,7 @@ VERS_1.3 {
 		xenforeignmemory_map_resource;
 		xenforeignmemory_unmap_resource;
 } VERS_1.2;
+VERS_1.4 {
+	global:
+		xenforeignmemory_resource_size;
+} VERS_1.3;
diff --git a/tools/libs/foreignmemory/linux.c b/tools/libs/foreignmemory/linux.c
index 8daa5828e3..67e0ca1e83 100644
--- a/tools/libs/foreignmemory/linux.c
+++ b/tools/libs/foreignmemory/linux.c
@@ -28,6 +28,8 @@
 
 #include "private.h"
 
+#include <xen/memory.h>
+
 #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
 
 #ifndef O_CLOEXEC
@@ -340,6 +342,39 @@ int osdep_xenforeignmemory_map_resource(
     return 0;
 }
 
+int osdep_xenforeignmemory_resource_size(
+    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
+    unsigned int id, unsigned long *nr_frames)
+{
+    int rc;
+    struct xen_mem_acquire_resource *xmar =
+        xencall_alloc_buffer(fmem->xcall, sizeof(*xmar));
+
+    if ( !xmar )
+    {
+        PERROR("Could not bounce memory for acquire_resource hypercall");
+        return -1;
+    }
+
+    *xmar = (struct xen_mem_acquire_resource){
+        .domid = domid,
+        .type = type,
+        .id = id,
+    };
+
+    rc = xencall2(fmem->xcall, __HYPERVISOR_memory_op,
+                  XENMEM_acquire_resource, (uintptr_t)xmar);
+    if ( rc )
+        goto out;
+
+    *nr_frames = xmar->nr_frames;
+
+ out:
+    xencall_free_buffer(fmem->xcall, xmar);
+
+    return rc;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemory/private.h
index 8f1bf081ed..1a6b685f45 100644
--- a/tools/libs/foreignmemory/private.h
+++ b/tools/libs/foreignmemory/private.h
@@ -4,6 +4,7 @@
 #include <xentoollog.h>
 
 #include <xenforeignmemory.h>
+#include <xencall.h>
 
 #include <xentoolcore_internal.h>
 
@@ -20,6 +21,7 @@
 
 struct xenforeignmemory_handle {
     xentoollog_logger *logger, *logger_tofree;
+    xencall_handle *xcall;
     unsigned flags;
     int fd;
     Xentoolcore__Active_Handle tc_ah;
@@ -74,6 +76,15 @@ static inline int osdep_xenforeignmemory_unmap_resource(
 {
     return 0;
 }
+
+static inline int osdep_xenforeignmemory_resource_size(
+    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
+    unsigned int id, unsigned long *nr_frames)
+{
+    errno = EOPNOTSUPP;
+    return -1;
+}
+
 #else
 int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
                                     domid_t domid);
@@ -81,6 +92,9 @@ int osdep_xenforeignmemory_map_resource(
     xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fres);
 int osdep_xenforeignmemory_unmap_resource(
     xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fres);
+int osdep_xenforeignmemory_resource_size(
+    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
+    unsigned int id, unsigned long *nr_frames);
 #endif
 
 #define PERROR(_f...) \
-- 
2.11.0


