Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA687DDDF1
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:01:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626149.976144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy75d-0006VO-59; Wed, 01 Nov 2023 09:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626149.976144; Wed, 01 Nov 2023 09:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy75d-0006Sk-1j; Wed, 01 Nov 2023 09:00:41 +0000
Received: by outflank-mailman (input) for mailman id 626149;
 Wed, 01 Nov 2023 09:00:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy75b-0005dE-DC
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:00:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2082a0ac-7895-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:00:38 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 71AB821862;
 Wed,  1 Nov 2023 09:00:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4548C13460;
 Wed,  1 Nov 2023 09:00:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CKqxD7YTQmWeeQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:00:38 +0000
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
X-Inumbo-ID: 2082a0ac-7895-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698829238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BBCYYLq8RLRTC07yvHLcGeOw7lLnh2hUZttfKIwKhhk=;
	b=kmvqIvyZZbyed7wfK0z8dsqPN9cEhkgdaSxvM8FaTMZpp3gpQsfOkvn8lUqV+c3r7lpafG
	GW8iPSd7PGh454KuPgwiYRSYzhAkzNGbZqil6jR0hecUowX45BSF9offJrvY9fKFLsKfZ/
	n1sW3HxwvzuFnJykVodU1BWGf1CMTXY=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/3] Mini-OS: don't crash if no shutdown node is available
Date: Wed,  1 Nov 2023 10:00:23 +0100
Message-Id: <20231101090024.28934-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101090024.28934-1-jgross@suse.com>
References: <20231101090024.28934-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It might be perfectly fine not to have a control/shutdown Xenstore
node. If this is the case, don't crash, but just terminate the
shutdown thread after issuing a message that shutdown isn't available.

In fini_shutdown() clearing the watch can result in an error now, in
case the early exit above was taken. Just ignore this error now.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 shutdown.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/shutdown.c b/shutdown.c
index bb2c6f11..ded6b64d 100644
--- a/shutdown.c
+++ b/shutdown.c
@@ -75,7 +75,9 @@ static void shutdown_thread(void *p)
         xenbus_wait_for_watch(&events);
         if ((err = xenbus_read(XBT_NIL, path, &shutdown))) {
             free(err);
-            do_exit();
+            free(xenbus_unwatch_path_token(XBT_NIL, path, token));
+            printk("Shutdown Xenstore node not available.\n");
+            return;
         }
 
         if (end_shutdown_thread)
@@ -117,15 +119,9 @@ void init_shutdown(void)
 
 void fini_shutdown(void)
 {
-    char *err;
-
     end_shutdown_thread = 1;
     xenbus_release_wait_for_watch(&events);
-    err = xenbus_unwatch_path_token(XBT_NIL, path, token);
-    if (err) {
-        free(err);
-        do_exit();
-    }
+    free(xenbus_unwatch_path_token(XBT_NIL, path, token));
 }
 #endif
 
-- 
2.35.3


