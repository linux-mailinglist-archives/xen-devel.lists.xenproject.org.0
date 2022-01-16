Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7042E48FB9A
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:24:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257808.443149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90pW-0005Xt-Tm; Sun, 16 Jan 2022 08:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257808.443149; Sun, 16 Jan 2022 08:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90pW-0005Pr-Mo; Sun, 16 Jan 2022 08:24:02 +0000
Received: by outflank-mailman (input) for mailman id 257808;
 Sun, 16 Jan 2022 08:24:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90pU-00052M-R7
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:24:00 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6dba1ac-76a5-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 09:23:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 215E2219B1;
 Sun, 16 Jan 2022 08:23:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED8151346A;
 Sun, 16 Jan 2022 08:23:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sJuoOB3W42FLEwAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 08:23:57 +0000
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
X-Inumbo-ID: a6dba1ac-76a5-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642321438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f1HwqdB0og38hxRC3NF5Sj5Z62lBBi+hprIOlOt5nJI=;
	b=cQkYDjrLP0RFyWIY77t56C04kSbYgX/Bijg+Wb2o3uyWnmam473HX2br75JOa9gtnnb+im
	BNYa1VdwpVKjYKRj1RJO5nUwATzzSf4Nmbw0PNEEkpRTo2TlaVbDGomqN6tdqJnIb4DEdm
	3f6o7X+ukWj3A+iJVXisc0dZuuQ7HDk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 2/3] tools/libs/gnttab: decouple more from mini-os
Date: Sun, 16 Jan 2022 09:23:45 +0100
Message-Id: <20220116082346.26194-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116082346.26194-1-jgross@suse.com>
References: <20220116082346.26194-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libgnttab is using implementation details of Mini-OS. Change that by
letting libgnttab use the new alloc_file_type() and get_file_from_fd()
functions and the generic dev pointer of struct file from Mini-OS.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add alloc_file_type() support
V3:
- switch callback to use struct file * as a parameter (Andrew Cooper)
- use __attribute__((constructor)) (Andrew Cooper)
---
 tools/libs/gnttab/minios.c | 67 +++++++++++++++++++++++++++++---------
 1 file changed, 52 insertions(+), 15 deletions(-)

diff --git a/tools/libs/gnttab/minios.c b/tools/libs/gnttab/minios.c
index f78caadd30..f59fad3577 100644
--- a/tools/libs/gnttab/minios.c
+++ b/tools/libs/gnttab/minios.c
@@ -28,18 +28,55 @@
 #include <sys/mman.h>
 
 #include <errno.h>
+#include <malloc.h>
 #include <unistd.h>
 
 #include "private.h"
 
 void minios_gnttab_close_fd(int fd);
 
+static int gnttab_close_fd(struct file *file)
+{
+    gntmap_fini(file->dev);
+    free(file->dev);
+
+    return 0;
+}
+
+static const struct file_ops gnttab_ops = {
+    .name = "gnttab",
+    .close = gnttab_close_fd,
+};
+
+static unsigned int ftype_gnttab;
+
+__attribute__((constructor))
+static void gnttab_initialize(void)
+{
+    ftype_gnttab = alloc_file_type(&gnttab_ops);
+}
+
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
+    fd = alloc_fd(ftype_gnttab);
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
@@ -54,8 +91,9 @@ int osdep_gnttab_close(xengnttab_handle *xgt)
 
 void minios_gnttab_close_fd(int fd)
 {
-    gntmap_fini(&files[fd].gntmap);
-    files[fd].type = FTYPE_NONE;
+    struct file *file = get_file_from_fd(fd);
+
+    gnttab_close_fd(file);
 }
 
 void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
@@ -64,16 +102,16 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
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
 
@@ -81,11 +119,10 @@ int osdep_gnttab_unmap(xengnttab_handle *xgt,
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
@@ -95,10 +132,10 @@ int osdep_gnttab_unmap(xengnttab_handle *xgt,
 
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


