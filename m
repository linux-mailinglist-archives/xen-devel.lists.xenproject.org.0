Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CDAAF0DB8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030462.1404205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsi8-00074a-TY; Wed, 02 Jul 2025 08:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030462.1404205; Wed, 02 Jul 2025 08:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsi8-0006zZ-JZ; Wed, 02 Jul 2025 08:20:56 +0000
Received: by outflank-mailman (input) for mailman id 1030462;
 Wed, 02 Jul 2025 08:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsbm-00082Y-7G
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:14:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ecf6b26-571c-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 10:14:21 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 507E91F445;
 Wed,  2 Jul 2025 08:14:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2425413A24;
 Wed,  2 Jul 2025 08:14:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id og1IB13qZGhxSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:14:21 +0000
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
X-Inumbo-ID: 8ecf6b26-571c-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ubR6pSt9182ihX0qStfZwbGBhcxTfFCMnfWKOJagOwc=;
	b=gXY91VIAg53p7prR25YIH3AJCIjf7Q9ImmgpAbo6e3BXm1x2tPRztRcv2BuDLdWWvaD8r3
	vRhKqtTMQCBvpGSYjadSVC1iHhovqQGBjjwd5U0QhdQpeFijJSUvyh+qY7l/fc04kT9/qW
	M5nUHGuy+FiJDG294Ydy2b9egOdbDoc=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ubR6pSt9182ihX0qStfZwbGBhcxTfFCMnfWKOJagOwc=;
	b=gXY91VIAg53p7prR25YIH3AJCIjf7Q9ImmgpAbo6e3BXm1x2tPRztRcv2BuDLdWWvaD8r3
	vRhKqtTMQCBvpGSYjadSVC1iHhovqQGBjjwd5U0QhdQpeFijJSUvyh+qY7l/fc04kT9/qW
	M5nUHGuy+FiJDG294Ydy2b9egOdbDoc=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 15/19] 9pfs: refactor init_9pfront()
Date: Wed,  2 Jul 2025 10:12:50 +0200
Message-ID: <20250702081254.14383-16-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081254.14383-1-jgross@suse.com>
References: <20250702081254.14383-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

Move the Xenstore and backend interface related handling into a
sub-function in order to prepare supporting reconnecting to an active
9pfs device after kexec.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 9pfront.c | 136 ++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 86 insertions(+), 50 deletions(-)

diff --git a/9pfront.c b/9pfront.c
index 2bfc49b1..8da2f726 100644
--- a/9pfront.c
+++ b/9pfront.c
@@ -1097,68 +1097,65 @@ static void free_9pfront(struct dev_9pfs *dev)
     free(dev);
 }
 
-void *init_9pfront(unsigned int id, const char *mnt)
+static bool issue_err(struct dev_9pfs *dev, char *msg, char *reason)
+{
+    if ( msg )
+    {
+        printk("9pfsfront add %u failed, error %s accessing Xenstore\n",
+               dev->id, msg);
+        free(msg);
+    }
+    else
+        printk("9pfsfront add %u failed, %s\n", dev->id, reason);
+
+    return false;
+}
+
+static bool read_config_xs(struct dev_9pfs *dev)
 {
-    struct dev_9pfs *dev;
     char *msg;
     char *reason = "";
-    xenbus_transaction_t xbt;
-    int retry = 1;
     XenbusState state;
-    unsigned int i;
-    void *addr;
+    xenbus_transaction_t xbt;
     char *version;
     char *v;
-
-    printk("9pfsfront add %u, for mount at %s\n", id, mnt);
-    dev = malloc(sizeof(*dev));
-    memset(dev, 0, sizeof(*dev));
-    snprintf(dev->nodename, sizeof(dev->nodename), "device/9pfs/%u", id);
-    dev->id = id;
-    init_waitqueue_head(&dev->waitq);
-    init_SEMAPHORE(&dev->ring_out_sem, 1);
-    init_SEMAPHORE(&dev->ring_in_sem, 1);
-    dev->fid_mask = ~0ULL;
-
-    for ( i = 0; i < N_REQS; i++ )
-    {
-        dev->req[i].id = i;
-        dev->req[i].next_free = i + 1;
-    }
-    dev->free_reqs = 0;
+    void *addr;
+    unsigned int i;
+    int retry = 1;
 
     msg = xenbus_read_unsigned(XBT_NIL, dev->nodename, "backend-id", &dev->dom);
     if ( msg )
-        goto err;
+        return issue_err(dev, msg, reason);
     msg = xenbus_read_string(XBT_NIL, dev->nodename, "backend", &dev->backend);
     if ( msg )
-        goto err;
+        return issue_err(dev, msg, reason);
     msg = xenbus_read_string(XBT_NIL, dev->nodename, "tag", &dev->tag);
     if ( msg )
-        goto err;
+        return issue_err(dev, msg, reason);
 
     snprintf(dev->bepath, sizeof(dev->bepath), "%s/state", dev->backend);
     free(xenbus_watch_path_token(XBT_NIL, dev->bepath, dev->bepath,
                                  &dev->events));
+
     state = xenbus_read_integer(dev->bepath);
     while ( msg == NULL && state < XenbusStateInitWait )
         msg = xenbus_wait_for_state_change(dev->bepath, &state, &dev->events);
     if ( msg || state != XenbusStateInitWait )
     {
         reason = "illegal backend state";
-        goto err;
+        return issue_err(dev, msg, reason);
     }
 
     msg = xenbus_read_unsigned(XBT_NIL, dev->backend, "max-ring-page-order",
                                &dev->ring_order);
     if ( msg )
-        goto err;
+        return issue_err(dev, msg, reason);
     if ( dev->ring_order > DEFAULT_9PFS_RING_ORDER )
         dev->ring_order = DEFAULT_9PFS_RING_ORDER;
 
     msg = xenbus_read_string(XBT_NIL, dev->backend, "versions", &version);
     if ( msg )
-        goto err;
+        return issue_err(dev, msg, reason);
     for ( v = version; *v; v++ )
     {
         if ( strtoul(v, &v, 10) == 1 && (*v == ',' || *v == 0) )
@@ -1170,25 +1167,36 @@ void *init_9pfront(unsigned int id, const char *mnt)
         {
             reason = "backend published illegal version string";
             free(version);
-            goto err;
+            return issue_err(dev, msg, reason);
         }
     }
     free(version);
     if ( v )
     {
         reason = "backend doesn't support version 1";
-        goto err;
+        return issue_err(dev, msg, reason);
     }
 
-    dev->ring_ref = gnttab_alloc_and_grant((void **)&dev->intf);
+    dev->intf = (void *)alloc_page();
+    if ( !dev->intf )
+    {
+        reason = "couldn't allocate shared interface page";
+        return issue_err(dev, msg, reason);
+    }
     memset(dev->intf, 0, PAGE_SIZE);
+    dev->ring_ref = gnttab_grant_access(dev->dom, virt_to_mfn(dev->intf), 0);
     if ( evtchn_alloc_unbound(dev->dom, intr_9pfs, dev, &dev->evtchn) )
     {
         reason = "no event channel";
-        goto err;
+        return issue_err(dev, msg, reason);
     }
     dev->intf->ring_order = dev->ring_order;
     dev->data.in = (void *)alloc_pages(dev->ring_order);
+    if ( !dev->data.in )
+    {
+        reason = "couldn't allocate ring pages";
+        return issue_err(dev, msg, reason);
+    }
     dev->data.out = dev->data.in + XEN_FLEX_RING_SIZE(dev->ring_order);
     for ( i = 0; i < (1 << dev->ring_order); i++ )
     {
@@ -1204,30 +1212,35 @@ void *init_9pfront(unsigned int id, const char *mnt)
             free(msg);
             msg = NULL;
             reason = "starting transaction";
-            goto err;
+            return issue_err(dev, msg, reason);
         }
 
         msg = xenbus_printf(xbt, dev->nodename, "version", "%u", 1);
         if ( msg )
-            goto err_tr;
+            break;
         msg = xenbus_printf(xbt, dev->nodename, "num-rings", "%u", 1);
         if ( msg )
-            goto err_tr;
+            break;
         msg = xenbus_printf(xbt, dev->nodename, "ring-ref0", "%u",
                             dev->ring_ref);
         if ( msg )
-            goto err_tr;
+            break;
         msg = xenbus_printf(xbt, dev->nodename, "event-channel-0", "%u",
                             dev->evtchn);
         if ( msg )
-            goto err_tr;
+            break;
         msg = xenbus_printf(xbt, dev->nodename, "state", "%u",
                             XenbusStateInitialised);
         if ( msg )
-            goto err_tr;
+            break;
 
         free(xenbus_transaction_end(xbt, 0, &retry));
     }
+    if ( msg )
+    {
+        free(xenbus_transaction_end(xbt, 1, &retry));
+        return issue_err(dev, msg, reason);
+    }
 
     state = xenbus_read_integer(dev->bepath);
     while ( msg == NULL && state < XenbusStateConnected )
@@ -1235,13 +1248,42 @@ void *init_9pfront(unsigned int id, const char *mnt)
     if ( msg || state != XenbusStateConnected )
     {
         reason = "illegal backend state";
-        goto err;
+        return issue_err(dev, msg, reason);
     }
 
     msg = xenbus_printf(XBT_NIL, dev->nodename, "state", "%u",
                         XenbusStateConnected);
     if ( msg )
-        goto err;
+        return issue_err(dev, msg, reason);
+
+    return true;
+}
+
+void *init_9pfront(unsigned int id, const char *mnt)
+{
+    struct dev_9pfs *dev;
+    char *reason = "";
+    unsigned int i;
+
+    printk("9pfsfront add %u, for mount at %s\n", id, mnt);
+    dev = malloc(sizeof(*dev));
+    memset(dev, 0, sizeof(*dev));
+    snprintf(dev->nodename, sizeof(dev->nodename), "device/9pfs/%u", id);
+    dev->id = id;
+    init_waitqueue_head(&dev->waitq);
+    init_SEMAPHORE(&dev->ring_out_sem, 1);
+    init_SEMAPHORE(&dev->ring_in_sem, 1);
+    dev->fid_mask = ~0ULL;
+
+    for ( i = 0; i < N_REQS; i++ )
+    {
+        dev->req[i].id = i;
+        dev->req[i].next_free = i + 1;
+    }
+    dev->free_reqs = 0;
+
+    if ( !read_config_xs(dev) )
+        goto err_out;
 
     unmask_evtchn(dev->evtchn);
 
@@ -1260,17 +1302,11 @@ void *init_9pfront(unsigned int id, const char *mnt)
 
     return dev;
 
- err_tr:
-    free(xenbus_transaction_end(xbt, 1, &retry));
-
  err:
-    if ( msg )
-        printk("9pfsfront add %u failed, error %s accessing Xenstore\n",
-               id, msg);
-    else
-        printk("9pfsfront add %u failed, %s\n", id, reason);
+    printk("9pfsfront add %u failed, %s\n", id, reason);
+
+ err_out:
     free_9pfront(dev);
-    free(msg);
     return NULL;
 }
 EXPORT_SYMBOL(init_9pfront);
-- 
2.43.0


