Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E1A48B03C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:03:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255792.438524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IgF-0001Ti-Vr; Tue, 11 Jan 2022 15:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255792.438524; Tue, 11 Jan 2022 15:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IgF-0001QB-Ps; Tue, 11 Jan 2022 15:03:23 +0000
Received: by outflank-mailman (input) for mailman id 255792;
 Tue, 11 Jan 2022 15:03:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7IgE-0001Pl-J8
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 15:03:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dcbdf25-72ef-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 16:03:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 23F7A212C5;
 Tue, 11 Jan 2022 15:03:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 014C913DDD;
 Tue, 11 Jan 2022 15:03:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kKTMOjic3WFCfQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 15:03:20 +0000
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
X-Inumbo-ID: 9dcbdf25-72ef-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FkeH3cfFFVMIE3XajBHPWxcpnP57bP6Oa1K/USAaIVA=;
	b=pkP45NirCD81TT9ZA5BUr/E8TvnTSdufQhqI6Zp+1qu30xx48D2t02qp/78ie6Ota7ed+2
	WORVu1Q6c4R3spidoqY26eYut7ZAOFrrtuZzQFvmt+G592JCuEbg7ZgnbFPrhSjfUq1ZB3
	kFVP5Am669GxR+8bFpn0ik4SPHrEeHs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 2/3] tools/libs/gnttab: decouple more from mini-os
Date: Tue, 11 Jan 2022 16:03:17 +0100
Message-Id: <20220111150318.22570-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111150318.22570-1-jgross@suse.com>
References: <20220111150318.22570-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libgnttab is using implementation details of Mini-OS. Change that by
letting libgnttab use the new alloc_file_type() and get_file_from_fd()
functions and the generic dev pointer of struct file from Mini-OS.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add alloc_file_type() support
---
 tools/libs/gnttab/minios.c | 68 +++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 20 deletions(-)

diff --git a/tools/libs/gnttab/minios.c b/tools/libs/gnttab/minios.c
index f78caadd30..c19f339c8c 100644
--- a/tools/libs/gnttab/minios.c
+++ b/tools/libs/gnttab/minios.c
@@ -28,18 +28,53 @@
 #include <sys/mman.h>
 
 #include <errno.h>
+#include <malloc.h>
 #include <unistd.h>
 
 #include "private.h"
 
-void minios_gnttab_close_fd(int fd);
+int minios_gnttab_close_fd(int fd);
+
+int minios_gnttab_close_fd(int fd)
+{
+    struct file *file = get_file_from_fd(fd);
+
+    gntmap_fini(file->dev);
+    free(file->dev);
+
+    return 0;
+}
+
+static struct file_ops gnttab_ops = {
+    .name = "gnttab",
+    .close = minios_gnttab_close_fd,
+};
 
 int osdep_gnttab_open(xengnttab_handle *xgt)
 {
-    int fd = alloc_fd(FTYPE_GNTMAP);
-    if ( fd == -1 )
+    int fd;
+    struct file *file;
+    struct gntmap *gntmap;
+    static unsigned int ftype_gnttab;
+
+    if ( !ftype_gnttab )
+        ftype_gnttab = alloc_file_type(&gnttab_ops);
+
+    gntmap = malloc(sizeof(*gntmap));
+    if ( !gntmap )
+        return -1;
+
+    fd = alloc_fd(ftype_gnttab);
+    file = get_file_from_fd(fd);
+
+    if ( !file )
+    {
+        free(gntmap);
         return -1;
-    gntmap_init(&files[fd].gntmap);
+    }
+
+    file->dev = gntmap;
+    gntmap_init(gntmap);
     xgt->fd = fd;
     return 0;
 }
@@ -52,28 +87,22 @@ int osdep_gnttab_close(xengnttab_handle *xgt)
     return close(xgt->fd);
 }
 
-void minios_gnttab_close_fd(int fd)
-{
-    gntmap_fini(&files[fd].gntmap);
-    files[fd].type = FTYPE_NONE;
-}
-
 void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
                              uint32_t count, int flags, int prot,
                              uint32_t *domids, uint32_t *refs,
                              uint32_t notify_offset,
                              evtchn_port_t notify_port)
 {
-    int fd = xgt->fd;
+    struct file *file = get_file_from_fd(xgt->fd);
     int stride = 1;
+
     if (flags & XENGNTTAB_GRANT_MAP_SINGLE_DOMAIN)
         stride = 0;
     if (notify_offset != -1 || notify_port != -1) {
         errno = ENOSYS;
         return NULL;
     }
-    return gntmap_map_grant_refs(&files[fd].gntmap,
-                                 count, domids, stride,
+    return gntmap_map_grant_refs(file->dev, count, domids, stride,
                                  refs, prot & PROT_WRITE);
 }
 
@@ -81,11 +110,10 @@ int osdep_gnttab_unmap(xengnttab_handle *xgt,
                        void *start_address,
                        uint32_t count)
 {
-    int fd = xgt->fd;
+    struct file *file = get_file_from_fd(xgt->fd);
     int ret;
-    ret = gntmap_munmap(&files[fd].gntmap,
-                        (unsigned long) start_address,
-                        count);
+
+    ret = gntmap_munmap(file->dev, (unsigned long) start_address, count);
     if (ret < 0) {
         errno = -ret;
         return -1;
@@ -95,10 +123,10 @@ int osdep_gnttab_unmap(xengnttab_handle *xgt,
 
 int osdep_gnttab_set_max_grants(xengnttab_handle *xgt, uint32_t count)
 {
-    int fd = xgt->fd;
+    struct file *file = get_file_from_fd(xgt->fd);
     int ret;
-    ret = gntmap_set_max_grants(&files[fd].gntmap,
-                                count);
+
+    ret = gntmap_set_max_grants(file->dev, count);
     if (ret < 0) {
         errno = -ret;
         return -1;
-- 
2.26.2


