Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CB02F3861
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:19:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65864.116753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOG2-0004iC-LS; Tue, 12 Jan 2021 18:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65864.116753; Tue, 12 Jan 2021 18:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOG2-0004hF-EA; Tue, 12 Jan 2021 18:19:06 +0000
Received: by outflank-mailman (input) for mailman id 65864;
 Tue, 12 Jan 2021 18:19:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOCA-0003Yo-0h
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:15:06 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 243d1dc2-abf6-4014-aa4c-2e95776522e6;
 Tue, 12 Jan 2021 18:13:46 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIDiPl027677;
 Tue, 12 Jan 2021 19:13:44 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDZUf000344;
 Tue, 12 Jan 2021 19:13:35 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 818487218; Tue, 12 Jan 2021 19:13:35 +0100 (MET)
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
X-Inumbo-ID: 243d1dc2-abf6-4014-aa4c-2e95776522e6
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH] libs/gnttab: implement on NetBSD
Date: Tue, 12 Jan 2021 19:12:32 +0100
Message-Id: <20210112181242.1570-12-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:13:44 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

Implement gnttab interface on NetBSD.
The kernel interface is different from FreeBSD so we can't use the FreeBSD
version

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/libs/gnttab/Makefile |   2 +-
 tools/libs/gnttab/netbsd.c | 267 +++++++++++++++++++++++++++++++++++++
 2 files changed, 268 insertions(+), 1 deletion(-)
 create mode 100644 tools/libs/gnttab/netbsd.c

diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
index d86c49d243..ae390ce60f 100644
--- a/tools/libs/gnttab/Makefile
+++ b/tools/libs/gnttab/Makefile
@@ -10,7 +10,7 @@ SRCS-GNTSHR            += gntshr_core.c
 SRCS-$(CONFIG_Linux)   += $(SRCS-GNTTAB) $(SRCS-GNTSHR) linux.c
 SRCS-$(CONFIG_MiniOS)  += $(SRCS-GNTTAB) gntshr_unimp.c minios.c
 SRCS-$(CONFIG_FreeBSD) += $(SRCS-GNTTAB) $(SRCS-GNTSHR) freebsd.c
+SRCS-$(CONFIG_NetBSD)  += $(SRCS-GNTTAB) $(SRCS-GNTSHR) netbsd.c
 SRCS-$(CONFIG_SunOS)   += gnttab_unimp.c gntshr_unimp.c
-SRCS-$(CONFIG_NetBSD)  += gnttab_unimp.c gntshr_unimp.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/gnttab/netbsd.c b/tools/libs/gnttab/netbsd.c
new file mode 100644
index 0000000000..2df7058cd7
--- /dev/null
+++ b/tools/libs/gnttab/netbsd.c
@@ -0,0 +1,267 @@
+/*
+ * Copyright (c) 2007-2008, D G Murray <Derek.Murray@cl.cam.ac.uk>
+ * Copyright (c) 2016-2017, Akshay Jaggi <jaggi@FreeBSD.org>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2.1 of the License.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *
+ * Split out from linux.c
+ */
+
+#include <fcntl.h>
+#include <errno.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <string.h>
+
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+
+#include <xen/xen.h>
+#include <xen/xenio.h>
+
+#include "private.h"
+
+#define PAGE_SHIFT           12
+#define PAGE_SIZE            (1UL << PAGE_SHIFT)
+#define PAGE_MASK            (~(PAGE_SIZE-1))
+
+#define DEVXEN "/kern/xen/privcmd"
+
+int osdep_gnttab_open(xengnttab_handle *xgt)
+{
+    int fd = open(DEVXEN, O_RDWR|O_CLOEXEC);
+
+    if ( fd == -1 )
+        return -1;
+    xgt->fd = fd;
+
+    return 0;
+}
+
+int osdep_gnttab_close(xengnttab_handle *xgt)
+{
+    if ( xgt->fd == -1 )
+        return 0;
+
+    return close(xgt->fd);
+}
+
+int osdep_gnttab_set_max_grants(xengnttab_handle *xgt, uint32_t count)
+{
+    return 0;
+}
+
+void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
+                             uint32_t count, int flags, int prot,
+                             uint32_t *domids, uint32_t *refs,
+                             uint32_t notify_offset,
+                             evtchn_port_t notify_port)
+{
+    uint32_t i;
+    int fd = xgt->fd;
+    struct ioctl_gntdev_mmap_grant_ref map;
+    void *addr = NULL;
+    int domids_stride;
+    unsigned int refs_size = count * sizeof(struct ioctl_gntdev_grant_ref);
+    int rv;
+
+    domids_stride = (flags & XENGNTTAB_GRANT_MAP_SINGLE_DOMAIN) ? 0 : 1;
+    map.refs = malloc(refs_size);
+
+    for ( i = 0; i < count; i++ )
+    {
+        map.refs[i].domid = domids[i * domids_stride];
+        map.refs[i].ref = refs[i];
+    }
+
+    map.count = count;
+    addr = mmap(NULL, count * PAGE_SIZE,
+	prot, flags | MAP_ANON | MAP_SHARED, -1, 0);
+
+    if (map.va == MAP_FAILED) {
+        GTERROR(xgt->logger, "osdep_gnttab_grant_map: mmap failed");
+	munmap((void *)map.va, count * PAGE_SIZE);
+        addr = MAP_FAILED;
+    }
+    map.va = addr;
+
+    map.notify.offset = 0;
+    map.notify.action = 0;
+    if ( notify_offset < PAGE_SIZE * count )
+    {
+	map.notify.offset = notify_offset;
+	map.notify.action |= UNMAP_NOTIFY_CLEAR_BYTE;
+    }
+    if ( notify_port != -1 )
+    {
+       map.notify.event_channel_port = notify_port;
+       map.notify.action |= UNMAP_NOTIFY_SEND_EVENT;
+    }
+
+    rv = ioctl(fd, IOCTL_GNTDEV_MMAP_GRANT_REF, &map);
+    if ( rv )
+    {
+        GTERROR(xgt->logger,
+	    "ioctl IOCTL_GNTDEV_MMAP_GRANT_REF failed: %d", rv);
+        munmap(addr, count * PAGE_SIZE);
+        addr = MAP_FAILED;
+    }
+    free(map.refs);
+    return addr;
+}
+
+int osdep_gnttab_unmap(xengnttab_handle *xgt,
+                       void *start_address,
+                       uint32_t count)
+{
+    int rc;
+    if ( start_address == NULL )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+
+    /* Next, unmap the memory. */
+    rc = munmap(start_address, count * PAGE_SIZE);
+
+    return rc;
+}
+
+int osdep_gnttab_grant_copy(xengnttab_handle *xgt,
+                            uint32_t count,
+                            xengnttab_grant_copy_segment_t *segs)
+{
+    errno = ENOSYS;
+    return -1;
+}
+
+int osdep_gntshr_open(xengntshr_handle *xgs)
+{
+
+    int fd = open(DEVXEN, O_RDWR);
+
+    if ( fd == -1 )
+        return -1;
+    xgs->fd = fd;
+
+    return 0;
+}
+
+int osdep_gntshr_close(xengntshr_handle *xgs)
+{
+    if ( xgs->fd == -1 )
+        return 0;
+
+    return close(xgs->fd);
+}
+
+void *osdep_gntshr_share_pages(xengntshr_handle *xgs,
+                               uint32_t domid, int count,
+                               uint32_t *refs, int writable,
+                               uint32_t notify_offset,
+                               evtchn_port_t notify_port)
+{
+    int err;
+    int fd = xgs->fd;
+    void *area = NULL;
+    struct ioctl_gntdev_alloc_grant_ref alloc;
+
+    alloc.gref_ids = malloc(count * sizeof(uint32_t));
+    if ( alloc.gref_ids == NULL )
+        return NULL;
+    alloc.domid = domid;
+    alloc.flags = writable ? GNTDEV_ALLOC_FLAG_WRITABLE : 0;
+    alloc.count = count;
+    area = mmap(NULL, count * PAGE_SIZE,
+	PROT_READ | PROT_WRITE, MAP_ANON | MAP_SHARED, -1, 0);
+
+    if (area == MAP_FAILED) {
+        GTERROR(xgs->logger, "osdep_gnttab_grant_map: mmap failed");
+        area = MAP_FAILED;
+	goto out;
+    }
+    alloc.va = area;
+
+    alloc.notify.offset = 0;
+    alloc.notify.action = 0;
+    if ( notify_offset < PAGE_SIZE * count )
+    {
+	alloc.notify.offset = notify_offset;
+	alloc.notify.action |= UNMAP_NOTIFY_CLEAR_BYTE;
+    }
+    if ( notify_port != -1 )
+    {
+       alloc.notify.event_channel_port = notify_port;
+       alloc.notify.action |= UNMAP_NOTIFY_SEND_EVENT;
+    }
+    err = ioctl(fd, IOCTL_GNTDEV_ALLOC_GRANT_REF, &alloc);
+    if ( err )
+    {
+        GSERROR(xgs->logger, "IOCTL_GNTDEV_ALLOC_GRANT_REF failed");
+	munmap(area, count * PAGE_SIZE);
+	area = MAP_FAILED;
+        goto out;
+    }
+    memcpy(refs, alloc.gref_ids, count * sizeof(uint32_t));
+
+ out:
+    free(alloc.gref_ids);
+    return area;
+}
+
+int osdep_gntshr_unshare(xengntshr_handle *xgs,
+                         void *start_address, uint32_t count)
+{
+    return munmap(start_address, count * PAGE_SIZE);
+}
+
+/*
+ * The functions below are Linux-isms that will likely never be implemented
+ * on FreeBSD unless FreeBSD also implements something akin to Linux dmabuf.
+ */
+int osdep_gnttab_dmabuf_exp_from_refs(xengnttab_handle *xgt, uint32_t domid,
+                                      uint32_t flags, uint32_t count,
+                                      const uint32_t *refs,
+                                      uint32_t *dmabuf_fd)
+{
+    abort();
+}
+
+int osdep_gnttab_dmabuf_exp_wait_released(xengnttab_handle *xgt,
+                                          uint32_t fd, uint32_t wait_to_ms)
+{
+    abort();
+}
+
+int osdep_gnttab_dmabuf_imp_to_refs(xengnttab_handle *xgt, uint32_t domid,
+                                    uint32_t fd, uint32_t count, uint32_t *refs)
+{
+    abort();
+}
+
+int osdep_gnttab_dmabuf_imp_release(xengnttab_handle *xgt, uint32_t fd)
+{
+    abort();
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.29.2


