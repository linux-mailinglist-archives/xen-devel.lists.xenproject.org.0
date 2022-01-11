Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5030748B067
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:07:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255816.438590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IkP-0004MW-38; Tue, 11 Jan 2022 15:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255816.438590; Tue, 11 Jan 2022 15:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IkO-0004KP-Vm; Tue, 11 Jan 2022 15:07:40 +0000
Received: by outflank-mailman (input) for mailman id 255816;
 Tue, 11 Jan 2022 15:07:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Ibe-0002OZ-F3
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 14:58:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec38fac3-72ee-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 15:58:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ADCAD21637;
 Tue, 11 Jan 2022 14:58:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8537013DDD;
 Tue, 11 Jan 2022 14:58:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4OZLHw6b3WH9eQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 14:58:22 +0000
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
X-Inumbo-ID: ec38fac3-72ee-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n40BkLdnJT4X941oqOUKglJdlkxVA0w5hYfz6J0OaY8=;
	b=ZjfrY70i0Pbr4czUKwgXjbY1iNrCDw3Vx6pB0YdsaGN7XkJEQRb6KDvlppTR00fiMkgicg
	b96gcYYWqzLUeAJWntujpY/xohdNP0T70OPGYx0tVAzuIvA29EQPP9efelRGjtJfBy8EA8
	R3CGUCNryEYA3V2yaKv5C6rJtjM1OBk=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 14/18] mini-os: eliminate xenbus union member in struct file
Date: Tue, 11 Jan 2022 15:58:13 +0100
Message-Id: <20220111145817.22170-15-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111145817.22170-1-jgross@suse.com>
References: <20220111145817.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the xenbus specific union member in struct file with the
common dev pointer.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 include/lib.h |  7 -------
 lib/sys.c     |  2 +-
 lib/xs.c      | 13 +++++++------
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index d6a29ba..91364ba 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -193,13 +193,6 @@ struct file {
 	    struct evtchn_port_list ports;
 	} evtchn;
 	struct gntmap gntmap;
-#ifdef CONFIG_XENBUS
-        struct {
-            /* To each xenbus FD is associated a queue of watch events for this
-             * FD.  */
-            xenbus_event_queue events;
-        } xenbus;
-#endif
     };
 };
 
diff --git a/lib/sys.c b/lib/sys.c
index 96fc769..6f2b026 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -776,7 +776,7 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
 #ifdef CONFIG_XENBUS
 	case FTYPE_XENBUS:
 	    if (FD_ISSET(i, readfds)) {
-                if (files[i].xenbus.events)
+                if (files[i].dev)
 		    n++;
 		else
 		    FD_CLR(i, readfds);
diff --git a/lib/xs.c b/lib/xs.c
index 324bd05..0459f52 100644
--- a/lib/xs.c
+++ b/lib/xs.c
@@ -21,8 +21,8 @@ static inline int _xs_fileno(struct xs_handle *h) {
 struct xs_handle *xs_daemon_open()
 {
     int fd = alloc_fd(FTYPE_XENBUS);
-    files[fd].xenbus.events = NULL;
-    printk("xs_daemon_open -> %d, %p\n", fd, &files[fd].xenbus.events);
+    files[fd].dev = NULL;
+    printk("xs_daemon_open -> %d, %p\n", fd, &files[fd].dev);
     return (void*)(intptr_t) fd;
 }
 
@@ -30,7 +30,7 @@ void xs_daemon_close(struct xs_handle *h)
 {
     int fd = _xs_fileno(h);
     struct xenbus_event *event, *next;
-    for (event = files[fd].xenbus.events; event; event = next)
+    for (event = files[fd].dev; event; event = next)
     {
         next = event->next;
         free(event);
@@ -172,15 +172,16 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
 {
     int fd = _xs_fileno(h);
     printk("xs_watch(%s, %s)\n", path, token);
-    return xs_bool(xenbus_watch_path_token(XBT_NULL, path, token, &files[fd].xenbus.events));
+    return xs_bool(xenbus_watch_path_token(XBT_NULL, path, token,
+                   (xenbus_event_queue *)&files[fd].dev));
 }
 
 char **xs_read_watch(struct xs_handle *h, unsigned int *num)
 {
     int fd = _xs_fileno(h);
     struct xenbus_event *event;
-    event = files[fd].xenbus.events;
-    files[fd].xenbus.events = event->next;
+    event = files[fd].dev;
+    files[fd].dev = event->next;
     printk("xs_read_watch() -> %s %s\n", event->path, event->token);
     *num = 2;
     return (char **) &event->path;
-- 
2.26.2


