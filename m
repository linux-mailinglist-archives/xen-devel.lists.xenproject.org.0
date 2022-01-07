Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DF54875A9
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 11:36:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254339.436098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5mbB-0001mb-3b; Fri, 07 Jan 2022 10:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254339.436098; Fri, 07 Jan 2022 10:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5mbA-0001gw-VB; Fri, 07 Jan 2022 10:35:52 +0000
Received: by outflank-mailman (input) for mailman id 254339;
 Fri, 07 Jan 2022 10:35:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqIQ=RX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5mb8-0001Nl-LL
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 10:35:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 930e4eac-6fa5-11ec-9ce5-af14b9085ebd;
 Fri, 07 Jan 2022 11:35:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C7BFF212BF;
 Fri,  7 Jan 2022 10:35:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A30D713CCC;
 Fri,  7 Jan 2022 10:35:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oJN9JoIX2GHvCwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 07 Jan 2022 10:35:46 +0000
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
X-Inumbo-ID: 930e4eac-6fa5-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641551746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lHlV4wb/lgozNAQh5gy+WKHFMhvi6Np0GE6SfuW92Mo=;
	b=ajHF2Ze6X00ejXJSWelo5qwfDu63E8ECKVY4fGFe8RlhMnlkXxAIm5TJ3ShMUDQ6qamXaE
	vsHNlD2QWvbEoAKj2+MBjpQA5Qz0QMPbDMw8/SyTggyqDwmflpTYI33QAsJ0WRaW41DBb6
	V8EmhZBt/i5JkXAw1x9G+PKadvAi8EE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/2] tools/libs/gnttab: decouple more from mini-os
Date: Fri,  7 Jan 2022 11:35:44 +0100
Message-Id: <20220107103544.9271-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220107103544.9271-1-jgross@suse.com>
References: <20220107103544.9271-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libgnttab is using implementation details of Mini-OS. Change that by
letting libgnttab use the new get_file_from_fd() function and the
generic dev pointer of struct file from Mini-OS.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/gnttab/minios.c | 48 ++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/tools/libs/gnttab/minios.c b/tools/libs/gnttab/minios.c
index f78caadd30..64601db085 100644
--- a/tools/libs/gnttab/minios.c
+++ b/tools/libs/gnttab/minios.c
@@ -28,6 +28,7 @@
 #include <sys/mman.h>
 
 #include <errno.h>
+#include <malloc.h>
 #include <unistd.h>
 
 #include "private.h"
@@ -36,10 +37,25 @@ void minios_gnttab_close_fd(int fd);
 
 int osdep_gnttab_open(xengnttab_handle *xgt)
 {
-    int fd = alloc_fd(FTYPE_GNTMAP);
-    if ( fd == -1 )
+    int fd;
+    struct file *file;
+    struct gntmap *gntmap;
+
+    gntmap = malloc(sizeof(*gntmap));
+    if ( !gntmap )
         return -1;
-    gntmap_init(&files[fd].gntmap);
+
+    fd = alloc_fd(FTYPE_GNTMAP);
+    file = get_file_from_fd(fd);
+
+    if ( !file )
+    {
+        free(gntmap);
+        return -1;
+    }
+
+    file->dev = gntmap;
+    gntmap_init(gntmap);
     xgt->fd = fd;
     return 0;
 }
@@ -54,8 +70,11 @@ int osdep_gnttab_close(xengnttab_handle *xgt)
 
 void minios_gnttab_close_fd(int fd)
 {
-    gntmap_fini(&files[fd].gntmap);
-    files[fd].type = FTYPE_NONE;
+    struct file *file = get_file_from_fd(fd);
+
+    gntmap_fini(file->dev);
+    free(file->dev);
+    file->type = FTYPE_NONE;
 }
 
 void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
@@ -64,16 +83,16 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
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
 
@@ -81,11 +100,10 @@ int osdep_gnttab_unmap(xengnttab_handle *xgt,
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
@@ -95,10 +113,10 @@ int osdep_gnttab_unmap(xengnttab_handle *xgt,
 
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


