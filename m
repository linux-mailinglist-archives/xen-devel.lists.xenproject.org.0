Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2183B2F3B00
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 20:49:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65957.116948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPfB-0006Ab-JU; Tue, 12 Jan 2021 19:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65957.116948; Tue, 12 Jan 2021 19:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPfB-0006A1-Dr; Tue, 12 Jan 2021 19:49:09 +0000
Received: by outflank-mailman (input) for mailman id 65957;
 Tue, 12 Jan 2021 19:49:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh5d=GP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kzPf9-00064W-9U
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 19:49:07 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d8dfaea-1a54-4d7d-9523-95be6ca97544;
 Tue, 12 Jan 2021 19:49:01 +0000 (UTC)
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
X-Inumbo-ID: 5d8dfaea-1a54-4d7d-9523-95be6ca97544
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610480941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KQLcpYmY2xOSiILZyQRhagK2YtSeU7ziJAAKnqO8LCQ=;
  b=NAEHsU6/5Imex/gD2jJXS9jHIZEX+wKY2VEWQIr71k/Gx8yF/Gu9jrzu
   cLcRwNY/xdf31yNMOuQTwW5cCWsvgHhGX2XvzhE4Lh7Pw7iNwrLaUqK+r
   S1fas3ASuxQbigxxJfpjkaUqOaWRUbr1+1vfFmoioh0Pi3n30Wx1ISbhG
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: z98sIzlr43XjwcMThKKI9UgCvy6P7JunM1ECjX0Ra8/9jp24ctsHSiCt70Z2CLrsN8iy39yPiM
 5j7nHp1qzX3/FmDcep/aifvmuuMn9vByOHcSsckzMDZKB+gdb+8jJXXDz6gvSPrRlfvmeZiM/d
 W4ZVoDtig2YUAmq7DM0Pi4tkjH7NOjYCq50TgjHnA0lbmfNulozqI3OvRDzot37lNEjMf0WPoA
 7F1TqMKHlv/lgVgygoX3qRKFZBzhYXtXRpJLN0F2NjxnK3PZkkQzdKzkMyJ0gR/a1+iWjnwlA4
 ZEQ=
X-SBRS: 5.2
X-MesageID: 36235805
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,342,1602561600"; 
   d="scan'208";a="36235805"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Paul
 Durrant" <paul@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, Ian Jackson
	<iwj@xenproject.org>, =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?=
	<michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v3 3/7] tools/foreignmem: Support querying the size of a resource
Date: Tue, 12 Jan 2021 19:48:37 +0000
Message-ID: <20210112194841.1537-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210112194841.1537-1-andrew.cooper3@citrix.com>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With the Xen side of this interface fixed to return real sizes, userspace
needs to be able to make the query.

Introduce xenforeignmemory_resource_size() for the purpose, bumping the
library minor version.

Update both Linux and FreeBSD's osdep_xenforeignmemory_map_resource() to
understand size requests, skip the mmap() operation, and copy back the
nr_frames field.

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

This depends on a bugfix to the Linux IOCTL to understand size requests and
pass them on to Xen.

  https://lore.kernel.org/xen-devel/20210112115358.23346-1-roger.pau@citrix.com/T/#u

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
 6 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/tools/include/xenforeignmemory.h b/tools/include/xenforeignmemory.h
index d594be8df0..1ba2f5316b 100644
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
+ * Return 0 on success and fills in *nr_frames.  Sets errno and return -1 on
+ * error.
+ */
+int xenforeignmemory_resource_size(
+    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
+    unsigned int id, unsigned long *nr_frames);
+
 #endif
 
 /*
diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
index 13850f7988..90d80a49ae 100644
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
index 63f12e2450..1e92c567e1 100644
--- a/tools/libs/foreignmemory/core.c
+++ b/tools/libs/foreignmemory/core.c
@@ -188,6 +188,24 @@ int xenforeignmemory_unmap_resource(
     return rc;
 }
 
+int xenforeignmemory_resource_size(
+    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
+    unsigned int id, unsigned long *nr_frames)
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
+    *nr_frames = fres.nr_frames;
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
 
-- 
2.11.0


