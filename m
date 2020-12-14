Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39292D9F2B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 19:36:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52396.91687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshM-00027F-R6; Mon, 14 Dec 2020 18:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52396.91687; Mon, 14 Dec 2020 18:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshL-00024m-QV; Mon, 14 Dec 2020 18:35:51 +0000
Received: by outflank-mailman (input) for mailman id 52396;
 Mon, 14 Dec 2020 16:39:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nuho=FS=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1koqrS-0006vN-LG
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:38:10 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3300b86f-0b1d-4ac4-8ba9-60faeafc2272;
 Mon, 14 Dec 2020 16:36:34 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BEGaXKp004605;
 Mon, 14 Dec 2020 17:36:33 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 0BEGaWlD002558;
 Mon, 14 Dec 2020 17:36:33 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 24E1CAAC65; Mon, 14 Dec 2020 17:36:33 +0100 (MET)
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
X-Inumbo-ID: 3300b86f-0b1d-4ac4-8ba9-60faeafc2272
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>
Subject: [PATCH 07/24] Remove NetBSD's system headers. We'll use the system-provided ones, which are up to date.
Date: Mon, 14 Dec 2020 17:36:06 +0100
Message-Id: <20201214163623.2127-8-bouyer@netbsd.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201214163623.2127-1-bouyer@netbsd.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 14 Dec 2020 17:36:33 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

---
 tools/include/Makefile                 |   2 +-
 tools/include/xen-sys/NetBSD/evtchn.h  |  86 --------------------
 tools/include/xen-sys/NetBSD/privcmd.h | 106 -------------------------
 3 files changed, 1 insertion(+), 193 deletions(-)
 delete mode 100644 tools/include/xen-sys/NetBSD/evtchn.h
 delete mode 100644 tools/include/xen-sys/NetBSD/privcmd.h

diff --git a/tools/include/Makefile b/tools/include/Makefile
index 4d4ec5f974..5e90179e66 100644
--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -68,7 +68,7 @@ install: all
 	$(INSTALL_DATA) xen/foreign/*.h $(DESTDIR)$(includedir)/xen/foreign
 	$(INSTALL_DATA) xen/hvm/*.h $(DESTDIR)$(includedir)/xen/hvm
 	$(INSTALL_DATA) xen/io/*.h $(DESTDIR)$(includedir)/xen/io
-	$(INSTALL_DATA) xen/sys/*.h $(DESTDIR)$(includedir)/xen/sys
+	$(INSTALL_DATA) xen/sys/*.h $(DESTDIR)$(includedir)/xen/sys || true
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
-- 
2.28.0


