Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0085548640C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 12:58:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253924.435339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RPI-00088Y-0L; Thu, 06 Jan 2022 11:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253924.435339; Thu, 06 Jan 2022 11:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RPH-000814-J0; Thu, 06 Jan 2022 11:58:11 +0000
Received: by outflank-mailman (input) for mailman id 253924;
 Thu, 06 Jan 2022 11:58:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5RPD-0005Uf-IO
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 11:58:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3c8adc9-6ee7-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 12:57:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E0A1B1F39A;
 Thu,  6 Jan 2022 11:57:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B94E213C0D;
 Thu,  6 Jan 2022 11:57:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uKQXLEXZ1mHnJgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Jan 2022 11:57:57 +0000
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
X-Inumbo-ID: e3c8adc9-6ee7-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641470277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M5iLDQMfkH8htZ3wRFumo5FkHynp/HKlFIcfl/LfGDo=;
	b=gh+DQlcESakDUkPTEJ1soZommb+igB4NL6JjGl9BJvgGVNIBS+t0hGxmsZzXWl5ejXlCDa
	r/HKGE594MTOyVJUoJU6atziAFjureSrxGbYvQ70Dyx4n6W5/nCfPX321J0E3+pHaBU9Hc
	ptRTDos2qr4ZF4LHh4aXkS2m1+1I2Sc=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 14/15] mini-os: eliminate xenbus union member in struct file
Date: Thu,  6 Jan 2022 12:57:40 +0100
Message-Id: <20220106115741.3219-15-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220106115741.3219-1-jgross@suse.com>
References: <20220106115741.3219-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the xenbus specific union member in struct file with the
common dev pointer.

Signed-off-by: Juergen Gross <jgross@suse.com>
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


