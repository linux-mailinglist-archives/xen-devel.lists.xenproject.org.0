Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BBC30755E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 13:02:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76970.139161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5606-0006ii-47; Thu, 28 Jan 2021 12:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76970.139161; Thu, 28 Jan 2021 12:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5606-0006iJ-0p; Thu, 28 Jan 2021 12:02:14 +0000
Received: by outflank-mailman (input) for mailman id 76970;
 Thu, 28 Jan 2021 12:02:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5604-0006iE-9Q
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 12:02:12 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bb4e74d-00ad-4160-b7d6-4bf30690cc29;
 Thu, 28 Jan 2021 12:02:10 +0000 (UTC)
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
X-Inumbo-ID: 8bb4e74d-00ad-4160-b7d6-4bf30690cc29
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611835330;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YNbZ86esMvcGT7tjDvXP+K2Apsd+TVJMsW1oTRfUtJU=;
  b=DzTnkb+0dUjHJjDbt1+Rx64BZ/w5Ko3OWYbdwCK7Yd2EIV4iTzZGXlGF
   xsWFNWGBLh2Ax1YS0Knq7uNWQJGQ32WriUkFg7QvbnPPOWUMmGtH1OaUE
   3JYYSUWWb023Rs240xnXfGXsLz+HGPMpQIjVaIo+9VW1KEj0+vqHnAh6P
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: DbzTGMTtxSheKBtHJvcDXpDeDvNOtA1NzEtz37Kek/jGDo30h+TtuYhWyIK4x5+qcFtxhuVQSr
 SkiyZDKfPxKwvS8wZxNaJaXe0SKogMDXkZvT4X7yBlyJqJxa2/gBXvKWiPk5aCFOmzpjfjpJfH
 xp5bBiqRaaq5ALRUFZVa7shD0vfShkozANAPMovfgvEcH8F5tAoSd88Bgf4QczxA4gS91qQjoM
 YVl9VNDH7TYypORCBzwvx3zWdb89nRDPN1q+4QD875lZfZcuKLMf950pRWzAPTKwKIHe/1c/W3
 CC4=
X-SBRS: 5.1
X-MesageID: 36255448
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,382,1602561600"; 
   d="scan'208";a="36255448"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Paul
 Durrant" <paul@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, Ian Jackson
	<iwj@xenproject.org>, =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?=
	<michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
	Tamas K Lengyel <tamas@tklengyel.com>, Manuel Bouyer <bouyer@netbsd.org>
Subject: [PATCH v4] tools/foreignmem: Support querying the size of a resource
Date: Thu, 28 Jan 2021 12:01:52 +0000
Message-ID: <20210128120152.9908-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With the Xen side of this interface (soon to be) fixed to return real sizes,
userspace needs to be able to make the query.

Introduce xenforeignmemory_resource_size() for the purpose, bumping the
library minor version.

Update both all osdep_xenforeignmemory_map_resource() implementations to
understand size requests, skip the mmap() operation, and copy back the
nr_frames field.

For NetBSD, also fix up the ioctl() error path to issue an unmap(), which was
overlooked by c/s 4a64e2bb39 "libs/foreignmemory: Implement on NetBSD".

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Manuel Bouyer <bouyer@netbsd.org>

This depends on a bugfix to the Linux IOCTL to understand size requests and
pass them on to Xen.

  https://lore.kernel.org/xen-devel/20210112115358.23346-1-roger.pau@citrix.com/T/#u

v4:
 * Rebase over NetBSD support being added.

v3:
 * Rewrite from scratch, to avoid breaking restricted domid situations.  In
   particular, we cannot open a xencall interface and issue blind hypercalls.
---
 tools/include/xenforeignmemory.h                 | 15 +++++++++++++++
 tools/libs/foreignmemory/Makefile                |  2 +-
 tools/libs/foreignmemory/core.c                  | 18 ++++++++++++++++++
 tools/libs/foreignmemory/freebsd.c               | 18 +++++++++++++++---
 tools/libs/foreignmemory/libxenforeignmemory.map |  4 ++++
 tools/libs/foreignmemory/linux.c                 | 18 +++++++++++++++---
 tools/libs/foreignmemory/netbsd.c                | 21 ++++++++++++++++++++-
 7 files changed, 88 insertions(+), 8 deletions(-)

diff --git a/tools/include/xenforeignmemory.h b/tools/include/xenforeignmemory.h
index d594be8df0..0ab1dd19d3 100644
--- a/tools/include/xenforeignmemory.h
+++ b/tools/include/xenforeignmemory.h
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
+ * Return 0 on success and fills in *size, with a value in bytes.  Sets errno
+ * and return -1 on error.
+ */
+int xenforeignmemory_resource_size(
+    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
+    unsigned int id, size_t *size);
+
 #endif
 
 /*
diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
index f191cdbed0..0eb9a3a712 100644
--- a/tools/libs/foreignmemory/Makefile
+++ b/tools/libs/foreignmemory/Makefile
@@ -2,7 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
-MINOR    = 3
+MINOR    = 4
 
 SRCS-y                 += core.c
 SRCS-$(CONFIG_Linux)   += linux.c
diff --git a/tools/libs/foreignmemory/core.c b/tools/libs/foreignmemory/core.c
index 63f12e2450..28ec311af1 100644
--- a/tools/libs/foreignmemory/core.c
+++ b/tools/libs/foreignmemory/core.c
@@ -188,6 +188,24 @@ int xenforeignmemory_unmap_resource(
     return rc;
 }
 
+int xenforeignmemory_resource_size(
+    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
+    unsigned int id, size_t *size)
+{
+    xenforeignmemory_resource_handle fres = {
+        .domid = domid,
+        .type  = type,
+        .id    = id,
+    };
+    int rc = osdep_xenforeignmemory_map_resource(fmem, &fres);
+
+    if ( rc )
+        return rc;
+
+    *size = fres.nr_frames << PAGE_SHIFT;
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/foreignmemory/freebsd.c b/tools/libs/foreignmemory/freebsd.c
index 3d403a7cd0..9a2796f0b7 100644
--- a/tools/libs/foreignmemory/freebsd.c
+++ b/tools/libs/foreignmemory/freebsd.c
@@ -119,6 +119,10 @@ int osdep_xenforeignmemory_map_resource(xenforeignmemory_handle *fmem,
     };
     int rc;
 
+    if ( !fres->addr && !fres->nr_frames )
+        /* Request for resource size.  Skip mmap(). */
+        goto skip_mmap;
+
     fres->addr = mmap(fres->addr, fres->nr_frames << PAGE_SHIFT,
                       fres->prot, fres->flags | MAP_SHARED, fmem->fd, 0);
     if ( fres->addr == MAP_FAILED )
@@ -126,6 +130,7 @@ int osdep_xenforeignmemory_map_resource(xenforeignmemory_handle *fmem,
 
     mr.addr = (uintptr_t)fres->addr;
 
+ skip_mmap:
     rc = ioctl(fmem->fd, IOCTL_PRIVCMD_MMAP_RESOURCE, &mr);
     if ( rc )
     {
@@ -136,13 +141,20 @@ int osdep_xenforeignmemory_map_resource(xenforeignmemory_handle *fmem,
         else
             errno = EOPNOTSUPP;
 
-        saved_errno = errno;
-        osdep_xenforeignmemory_unmap_resource(fmem, fres);
-        errno = saved_errno;
+        if ( fres->addr )
+        {
+            saved_errno = errno;
+            osdep_xenforeignmemory_unmap_resource(fmem, fres);
+            errno = saved_errno;
+        }
 
         return -1;
     }
 
+    /* If requesting size, copy back. */
+    if ( !fres->addr )
+        fres->nr_frames = mr.num;
+
     return 0;
 }
 
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
index fe73d5ab72..d0eead1196 100644
--- a/tools/libs/foreignmemory/linux.c
+++ b/tools/libs/foreignmemory/linux.c
@@ -312,6 +312,10 @@ int osdep_xenforeignmemory_map_resource(
     };
     int rc;
 
+    if ( !fres->addr && !fres->nr_frames )
+        /* Request for resource size.  Skip mmap(). */
+        goto skip_mmap;
+
     fres->addr = mmap(fres->addr, fres->nr_frames << PAGE_SHIFT,
                       fres->prot, fres->flags | MAP_SHARED, fmem->fd, 0);
     if ( fres->addr == MAP_FAILED )
@@ -319,6 +323,7 @@ int osdep_xenforeignmemory_map_resource(
 
     mr.addr = (uintptr_t)fres->addr;
 
+ skip_mmap:
     rc = ioctl(fmem->fd, IOCTL_PRIVCMD_MMAP_RESOURCE, &mr);
     if ( rc )
     {
@@ -329,13 +334,20 @@ int osdep_xenforeignmemory_map_resource(
         else
             errno = EOPNOTSUPP;
 
-        saved_errno = errno;
-        (void)osdep_xenforeignmemory_unmap_resource(fmem, fres);
-        errno = saved_errno;
+        if ( fres->addr )
+        {
+            saved_errno = errno;
+            osdep_xenforeignmemory_unmap_resource(fmem, fres);
+            errno = saved_errno;
+        }
 
         return -1;
     }
 
+    /* If requesting size, copy back. */
+    if ( !fres->addr )
+        fres->nr_frames = mr.num;
+
     return 0;
 }
 
diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory/netbsd.c
index d26566f601..4ae60aafdd 100644
--- a/tools/libs/foreignmemory/netbsd.c
+++ b/tools/libs/foreignmemory/netbsd.c
@@ -132,6 +132,10 @@ int osdep_xenforeignmemory_map_resource(
     };
     int rc;
 
+    if ( !fres->addr && !fres->nr_frames )
+        /* Request for resource size.  Skip mmap(). */
+        goto skip_mmap;
+
     fres->addr = mmap(fres->addr, fres->nr_frames << PAGE_SHIFT,
                       fres->prot, fres->flags | MAP_ANON | MAP_SHARED, -1, 0);
     if ( fres->addr == MAP_FAILED )
@@ -139,13 +143,28 @@ int osdep_xenforeignmemory_map_resource(
 
     mr.addr = (uintptr_t)fres->addr;
 
+ skip_mmap:
     rc = ioctl(fmem->fd, IOCTL_PRIVCMD_MMAP_RESOURCE, &mr);
     if ( rc )
     {
         PERROR("ioctl failed");
+
+        if ( fres->addr )
+        {
+            int saved_errno = errno;
+
+            osdep_xenforeignmemory_unmap_resource(fmem, fres);
+            errno = saved_errno;
+        }
+
+        return -1;
     }
 
-    return rc;
+    /* If requesting size, copy back. */
+    if ( !fres->addr )
+        fres->nr_frames = mr.num;
+
+    return 0;
 }
 
 /*
-- 
2.11.0


