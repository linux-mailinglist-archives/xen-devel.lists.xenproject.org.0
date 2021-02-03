Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF6330E029
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 17:55:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80972.148690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LQj-0003PK-IG; Wed, 03 Feb 2021 16:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80972.148690; Wed, 03 Feb 2021 16:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LQj-0003OV-EY; Wed, 03 Feb 2021 16:55:01 +0000
Received: by outflank-mailman (input) for mailman id 80972;
 Wed, 03 Feb 2021 16:55:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rCV=HF=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l7LQi-0003Jr-1I
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 16:55:00 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3172e2eb-b1c9-42c2-83ab-81a1ba84c68f;
 Wed, 03 Feb 2021 16:54:57 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 113GsuUJ001216;
 Wed, 3 Feb 2021 17:54:56 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 113GsuSS003390;
 Wed, 3 Feb 2021 17:54:56 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 1ADF8AA8BB; Wed,  3 Feb 2021 17:54:56 +0100 (MET)
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
X-Inumbo-ID: 3172e2eb-b1c9-42c2-83ab-81a1ba84c68f
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>,
        Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v3] NetBSD: use system-provided headers
Date: Wed,  3 Feb 2021 17:54:21 +0100
Message-Id: <20210203165421.1550-4-bouyer@netbsd.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203165421.1550-1-bouyer@netbsd.org>
References: <20210203165421.1550-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 03 Feb 2021 17:54:56 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On NetBSD use the system-provided headers for ioctl and related definitions,
they are up to date and have more chances to match the kernel's idea of
the ioctls and structures.
Remove now-unused NetBSD/evtchn.h and NetBSD/privcmd.h.
Don't fail install if xen/sys/*.h are not present.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/debugger/gdbsx/xg/xg_main.c      |   4 +
 tools/include/Makefile                 |   2 +
 tools/include/xen-sys/NetBSD/evtchn.h  |  86 --------------------
 tools/include/xen-sys/NetBSD/privcmd.h | 106 -------------------------
 tools/libs/call/private.h              |   4 +
 tools/libs/ctrl/xc_private.h           |   4 +
 tools/libs/foreignmemory/private.h     |   6 ++
 7 files changed, 20 insertions(+), 192 deletions(-)
 delete mode 100644 tools/include/xen-sys/NetBSD/evtchn.h
 delete mode 100644 tools/include/xen-sys/NetBSD/privcmd.h

diff --git a/tools/debugger/gdbsx/xg/xg_main.c b/tools/debugger/gdbsx/xg/xg_main.c
index 4576c762af..903d60baed 100644
--- a/tools/debugger/gdbsx/xg/xg_main.c
+++ b/tools/debugger/gdbsx/xg/xg_main.c
@@ -49,7 +49,11 @@
 #include "xg_public.h"
 #include <xen/version.h>
 #include <xen/domctl.h>
+#ifdef __NetBSD__
+#include <xen/xenio.h>
+#else
 #include <xen/sys/privcmd.h>
+#endif
 #include <xen/foreign/x86_32.h>
 #include <xen/foreign/x86_64.h>
 
diff --git a/tools/include/Makefile b/tools/include/Makefile
index 4d4ec5f974..65fb67a771 100644
--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -68,7 +68,9 @@ install: all
 	$(INSTALL_DATA) xen/foreign/*.h $(DESTDIR)$(includedir)/xen/foreign
 	$(INSTALL_DATA) xen/hvm/*.h $(DESTDIR)$(includedir)/xen/hvm
 	$(INSTALL_DATA) xen/io/*.h $(DESTDIR)$(includedir)/xen/io
+ifneq ($(wildcard xen/sys/*.h),)
 	$(INSTALL_DATA) xen/sys/*.h $(DESTDIR)$(includedir)/xen/sys
+endif
 	$(INSTALL_DATA) xen/xsm/*.h $(DESTDIR)$(includedir)/xen/xsm
 
 .PHONY: uninstall
diff --git a/tools/include/xen-sys/NetBSD/evtchn.h b/tools/include/xen-sys/NetBSD/evtchn.h
deleted file mode 100644
index 2d8a1f9164..0000000000
--- a/tools/include/xen-sys/NetBSD/evtchn.h
+++ /dev/null
@@ -1,86 +0,0 @@
-/* $NetBSD: evtchn.h,v 1.1.1.1 2007/06/14 19:39:45 bouyer Exp $ */
-/******************************************************************************
- * evtchn.h
- * 
- * Interface to /dev/xen/evtchn.
- * 
- * Copyright (c) 2003-2005, K A Fraser
- * 
- * This file may be distributed separately from the Linux kernel, or
- * incorporated into other software packages, subject to the following license:
- * 
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this source file (the "Software"), to deal in the Software without
- * restriction, including without limitation the rights to use, copy, modify,
- * merge, publish, distribute, sublicense, and/or sell copies of the Software,
- * and to permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- * 
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- * 
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- */
-
-#ifndef __NetBSD_EVTCHN_H__
-#define __NetBSD_EVTCHN_H__
-
-/*
- * Bind a fresh port to VIRQ @virq.
- */
-#define IOCTL_EVTCHN_BIND_VIRQ				\
-	_IOWR('E', 4, struct ioctl_evtchn_bind_virq)
-struct ioctl_evtchn_bind_virq {
-	unsigned int virq;
-	unsigned int port;
-};
-
-/*
- * Bind a fresh port to remote <@remote_domain, @remote_port>.
- */
-#define IOCTL_EVTCHN_BIND_INTERDOMAIN			\
-	_IOWR('E', 5, struct ioctl_evtchn_bind_interdomain)
-struct ioctl_evtchn_bind_interdomain {
-	unsigned int remote_domain, remote_port;
-	unsigned int port;
-};
-
-/*
- * Allocate a fresh port for binding to @remote_domain.
- */
-#define IOCTL_EVTCHN_BIND_UNBOUND_PORT			\
-	_IOWR('E', 6, struct ioctl_evtchn_bind_unbound_port)
-struct ioctl_evtchn_bind_unbound_port {
-	unsigned int remote_domain;
-	unsigned int port;
-};
-
-/*
- * Unbind previously allocated @port.
- */
-#define IOCTL_EVTCHN_UNBIND				\
-	_IOW('E', 7, struct ioctl_evtchn_unbind)
-struct ioctl_evtchn_unbind {
-	unsigned int port;
-};
-
-/*
- * Send event to previously allocated @port.
- */
-#define IOCTL_EVTCHN_NOTIFY				\
-	_IOW('E', 8, struct ioctl_evtchn_notify)
-struct ioctl_evtchn_notify {
-	unsigned int port;
-};
-
-/* Clear and reinitialise the event buffer. Clear error condition. */
-#define IOCTL_EVTCHN_RESET				\
-	_IO('E', 9)
-
-#endif /* __NetBSD_EVTCHN_H__ */
diff --git a/tools/include/xen-sys/NetBSD/privcmd.h b/tools/include/xen-sys/NetBSD/privcmd.h
deleted file mode 100644
index 555bad973e..0000000000
--- a/tools/include/xen-sys/NetBSD/privcmd.h
+++ /dev/null
@@ -1,106 +0,0 @@
-/*	NetBSD: xenio.h,v 1.3 2005/05/24 12:07:12 yamt Exp $	*/
-
-/******************************************************************************
- * privcmd.h
- * 
- * Copyright (c) 2003-2004, K A Fraser
- * 
- * This file may be distributed separately from the Linux kernel, or
- * incorporated into other software packages, subject to the following license:
- * 
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this source file (the "Software"), to deal in the Software without
- * restriction, including without limitation the rights to use, copy, modify,
- * merge, publish, distribute, sublicense, and/or sell copies of the Software,
- * and to permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- * 
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- * 
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- */
-
-#ifndef __NetBSD_PRIVCMD_H__
-#define __NetBSD_PRIVCMD_H__
-
-/* Interface to /dev/xen/privcmd */
-
-typedef struct privcmd_hypercall
-{
-    unsigned long op;
-    unsigned long arg[5];
-    long retval;
-} privcmd_hypercall_t;
-
-typedef struct privcmd_mmap_entry {
-    unsigned long va;
-    unsigned long mfn;
-    unsigned long npages;
-} privcmd_mmap_entry_t; 
-
-typedef struct privcmd_mmap {
-    int num;
-    domid_t dom; /* target domain */
-    privcmd_mmap_entry_t *entry;
-} privcmd_mmap_t; 
-
-typedef struct privcmd_mmapbatch {
-    int num;     /* number of pages to populate */
-    domid_t dom; /* target domain */
-    unsigned long addr;  /* virtual address */
-    unsigned long *arr; /* array of mfns - top nibble set on err */
-} privcmd_mmapbatch_t; 
-
-typedef struct privcmd_blkmsg
-{
-    unsigned long op;
-    void         *buf;
-    int           buf_size;
-} privcmd_blkmsg_t;
-
-/*
- * @cmd: IOCTL_PRIVCMD_HYPERCALL
- * @arg: &privcmd_hypercall_t
- * Return: Value returned from execution of the specified hypercall.
- */
-#define IOCTL_PRIVCMD_HYPERCALL         \
-    _IOWR('P', 0, privcmd_hypercall_t)
-
-#if defined(_KERNEL)
-/* compat */
-#define IOCTL_PRIVCMD_INITDOMAIN_EVTCHN_OLD \
-    _IO('P', 1)
-#endif /* defined(_KERNEL) */
-    
-#define IOCTL_PRIVCMD_MMAP             \
-    _IOW('P', 2, privcmd_mmap_t)
-#define IOCTL_PRIVCMD_MMAPBATCH        \
-    _IOW('P', 3, privcmd_mmapbatch_t)
-#define IOCTL_PRIVCMD_GET_MACH2PHYS_START_MFN \
-    _IOR('P', 4, unsigned long)
-
-/*
- * @cmd: IOCTL_PRIVCMD_INITDOMAIN_EVTCHN
- * @arg: n/a
- * Return: Port associated with domain-controller end of control event channel
- *         for the initial domain.
- */
-#define IOCTL_PRIVCMD_INITDOMAIN_EVTCHN \
-    _IOR('P', 5, int)
-
-/* Interface to /dev/xenevt */
-/* EVTCHN_RESET: Clear and reinit the event buffer. Clear error condition. */
-#define EVTCHN_RESET  _IO('E', 1)
-/* EVTCHN_BIND: Bind to the specified event-channel port. */
-#define EVTCHN_BIND   _IOW('E', 2, unsigned long)
-/* EVTCHN_UNBIND: Unbind from the specified event-channel port. */
-#define EVTCHN_UNBIND _IOW('E', 3, unsigned long)
-
-#endif /* __NetBSD_PRIVCMD_H__ */
diff --git a/tools/libs/call/private.h b/tools/libs/call/private.h
index 7944ac5baf..96922e03d5 100644
--- a/tools/libs/call/private.h
+++ b/tools/libs/call/private.h
@@ -7,7 +7,11 @@
 #include <xencall.h>
 
 #include <xen/xen.h>
+#ifdef __NetBSD__
+#include <xen/xenio.h>
+#else
 #include <xen/sys/privcmd.h>
+#endif
 
 #ifndef PAGE_SHIFT /* Mini-os, Yukk */
 #define PAGE_SHIFT           12
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index f0b5f83ac8..68e388f488 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -39,7 +39,11 @@
 #include <xenforeignmemory.h>
 #include <xendevicemodel.h>
 
+#ifdef __NetBSD__
+#include <xen/xenio.h>
+#else
 #include <xen/sys/privcmd.h>
+#endif
 
 #include <xen-tools/libs.h>
 
diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemory/private.h
index 1ee3626dd2..581d8b1eef 100644
--- a/tools/libs/foreignmemory/private.h
+++ b/tools/libs/foreignmemory/private.h
@@ -8,7 +8,13 @@
 #include <xentoolcore_internal.h>
 
 #include <xen/xen.h>
+
+#ifdef __NetBSD__
+#include <xen/xen.h>
+#include <xen/xenio.h>
+#else
 #include <xen/sys/privcmd.h>
+#endif
 
 #ifndef PAGE_SHIFT /* Mini-os, Yukk */
 #define PAGE_SHIFT           12
-- 
2.29.2


