Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1DBAF0DBA
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:21:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030445.1404168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsi3-0005iR-7W; Wed, 02 Jul 2025 08:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030445.1404168; Wed, 02 Jul 2025 08:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsi2-0005ez-Kq; Wed, 02 Jul 2025 08:20:50 +0000
Received: by outflank-mailman (input) for mailman id 1030445;
 Wed, 02 Jul 2025 08:20:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsbg-00082Y-Gy
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:14:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b71dc39-571c-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 10:14:16 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B39E61F454;
 Wed,  2 Jul 2025 08:14:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A7AD13A24;
 Wed,  2 Jul 2025 08:14:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pKZMIFfqZGhsSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:14:15 +0000
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
X-Inumbo-ID: 8b71dc39-571c-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AClNjBUa8IKDahSUwbZj7GWAX64ZZsn1WmMAweYfVPU=;
	b=WbXtKzGHGA0ajhZ8IOQHOWZWrliegkzhZIi4aU0iHuZkDLvsdla5zr9l5DwwWxZ82clPJ1
	pSIRaKP+KAYUVZLXx9k57w7vDRGqxJLNPCnr23Rj3pDXI/xiJgTCyWYVWryLrvi5Orz17r
	GcN150F9qeLiwB0oyUyoa5RzK3nr6xo=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AClNjBUa8IKDahSUwbZj7GWAX64ZZsn1WmMAweYfVPU=;
	b=WbXtKzGHGA0ajhZ8IOQHOWZWrliegkzhZIi4aU0iHuZkDLvsdla5zr9l5DwwWxZ82clPJ1
	pSIRaKP+KAYUVZLXx9k57w7vDRGqxJLNPCnr23Rj3pDXI/xiJgTCyWYVWryLrvi5Orz17r
	GcN150F9qeLiwB0oyUyoa5RzK3nr6xo=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 14/19] 9pfs: store bepath in struct struct dev_9pfs
Date: Wed,  2 Jul 2025 10:12:49 +0200
Message-ID: <20250702081254.14383-15-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081254.14383-1-jgross@suse.com>
References: <20250702081254.14383-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

Use struct dev_9pfs for storing the backend path of the device state
in order to avoid code duplication in init_9pfront() and
shutdown_9pfront().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 9pfront.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/9pfront.c b/9pfront.c
index 895426d1..2bfc49b1 100644
--- a/9pfront.c
+++ b/9pfront.c
@@ -25,6 +25,7 @@ struct dev_9pfs {
     char nodename[20];
     unsigned int dom;
     char *backend;
+    char bepath[64];
 
     char *tag;
     const char *mnt;
@@ -1103,7 +1104,6 @@ void *init_9pfront(unsigned int id, const char *mnt)
     char *reason = "";
     xenbus_transaction_t xbt;
     int retry = 1;
-    char bepath[64] = { 0 };
     XenbusState state;
     unsigned int i;
     void *addr;
@@ -1137,11 +1137,12 @@ void *init_9pfront(unsigned int id, const char *mnt)
     if ( msg )
         goto err;
 
-    snprintf(bepath, sizeof(bepath), "%s/state", dev->backend);
-    free(xenbus_watch_path_token(XBT_NIL, bepath, bepath, &dev->events));
-    state = xenbus_read_integer(bepath);
+    snprintf(dev->bepath, sizeof(dev->bepath), "%s/state", dev->backend);
+    free(xenbus_watch_path_token(XBT_NIL, dev->bepath, dev->bepath,
+                                 &dev->events));
+    state = xenbus_read_integer(dev->bepath);
     while ( msg == NULL && state < XenbusStateInitWait )
-        msg = xenbus_wait_for_state_change(bepath, &state, &dev->events);
+        msg = xenbus_wait_for_state_change(dev->bepath, &state, &dev->events);
     if ( msg || state != XenbusStateInitWait )
     {
         reason = "illegal backend state";
@@ -1228,9 +1229,9 @@ void *init_9pfront(unsigned int id, const char *mnt)
         free(xenbus_transaction_end(xbt, 0, &retry));
     }
 
-    state = xenbus_read_integer(bepath);
+    state = xenbus_read_integer(dev->bepath);
     while ( msg == NULL && state < XenbusStateConnected )
-        msg = xenbus_wait_for_state_change(bepath, &state, &dev->events);
+        msg = xenbus_wait_for_state_change(dev->bepath, &state, &dev->events);
     if ( msg || state != XenbusStateConnected )
     {
         reason = "illegal backend state";
@@ -1263,8 +1264,6 @@ void *init_9pfront(unsigned int id, const char *mnt)
     free(xenbus_transaction_end(xbt, 1, &retry));
 
  err:
-    if ( bepath[0] )
-        free(xenbus_unwatch_path_token(XBT_NIL, bepath, bepath));
     if ( msg )
         printk("9pfsfront add %u failed, error %s accessing Xenstore\n",
                id, msg);
@@ -1279,22 +1278,20 @@ EXPORT_SYMBOL(init_9pfront);
 void shutdown_9pfront(void *dev)
 {
     struct dev_9pfs *dev9p = dev;
-    char bepath[64];
     XenbusState state;
     char *msg;
     char *reason = "";
 
     umount(dev9p->mnt);
-    snprintf(bepath, sizeof(bepath), "%s/state", dev9p->backend);
 
     msg = xenbus_printf(XBT_NIL, dev9p->nodename, "state", "%u",
                         XenbusStateClosing);
     if ( msg )
         goto err;
 
-    state = xenbus_read_integer(bepath);
+    state = xenbus_read_integer(dev9p->bepath);
     while ( msg == NULL && state < XenbusStateClosing)
-        msg = xenbus_wait_for_state_change(bepath, &state, &dev9p->events);
+        msg = xenbus_wait_for_state_change(dev9p->bepath, &state, &dev9p->events);
     if ( msg || state != XenbusStateClosing )
     {
         reason = "illegal backend state";
-- 
2.43.0


