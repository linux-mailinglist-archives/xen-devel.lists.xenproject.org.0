Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEBEB05C66
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044166.1414285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfk5-0004lR-Kk; Tue, 15 Jul 2025 13:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044166.1414285; Tue, 15 Jul 2025 13:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfk5-0004ff-FZ; Tue, 15 Jul 2025 13:30:45 +0000
Received: by outflank-mailman (input) for mailman id 1044166;
 Tue, 15 Jul 2025 13:30:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7giJ=Z4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ubfjv-0000p6-1I
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:30:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e247bf86-617f-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 15:30:33 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1663421232;
 Tue, 15 Jul 2025 13:30:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DAE2C13A68;
 Tue, 15 Jul 2025 13:30:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5crsM/hXdmh1NwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 15 Jul 2025 13:30:32 +0000
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
X-Inumbo-ID: e247bf86-617f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BDdRGnWTd5zwdCL0TVOinfUW7FrCL8NCA12iHuDre8E=;
	b=nYNcCmldwPuW2gGg9URjLy87kYhJtYKeUWCY8VaL/SJCLJ4ny3UkbrGbI+r9yxTSUIDX3P
	isr/+bd8i2zZyd8n0mSwr4V5+5tsPY447T52puZEHLEhrYZkBmiQnNBvRkNptxGbcOYtb/
	uNaKVmMpHnjYivtcpItwBfu2CmYW9VA=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=nYNcCmld
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BDdRGnWTd5zwdCL0TVOinfUW7FrCL8NCA12iHuDre8E=;
	b=nYNcCmldwPuW2gGg9URjLy87kYhJtYKeUWCY8VaL/SJCLJ4ny3UkbrGbI+r9yxTSUIDX3P
	isr/+bd8i2zZyd8n0mSwr4V5+5tsPY447T52puZEHLEhrYZkBmiQnNBvRkNptxGbcOYtb/
	uNaKVmMpHnjYivtcpItwBfu2CmYW9VA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 09/14] 9pfs: store bepath in struct struct dev_9pfs
Date: Tue, 15 Jul 2025 15:29:31 +0200
Message-ID: <20250715132936.2798-10-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715132936.2798-1-jgross@suse.com>
References: <20250715132936.2798-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 1663421232
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email]
X-Spam-Score: -3.01

Use struct dev_9pfs for storing the backend path of the device state
in order to avoid code duplication in init_9pfront() and
shutdown_9pfront().

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
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


