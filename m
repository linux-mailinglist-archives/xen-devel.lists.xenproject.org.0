Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FBE1A3586
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 16:13:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMXvS-0002sl-4t; Thu, 09 Apr 2020 14:13:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jMXvR-0002sX-HH
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 14:13:01 +0000
X-Inumbo-ID: 2f29d108-7a6c-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f29d108-7a6c-11ea-b4f4-bc764e2007e4;
 Thu, 09 Apr 2020 14:12:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2EF93AF6E;
 Thu,  9 Apr 2020 14:12:44 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 3/3] mini-os: fix several memory leaks related to xenbus
Date: Thu,  9 Apr 2020 16:12:40 +0200
Message-Id: <20200409141240.28876-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200409141240.28876-1-jgross@suse.com>
References: <20200409141240.28876-1-jgross@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, samuel.thibault@ens-lyon.org, wl@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There are several instances of calls to xenbus functions which don't
test for an error and in consequence are not freeing the returned
error strings, or which are just not freeing the string after e.g.
printing it.

Fix that by either adding the needed calls of free().

Coverity-ID: 1433632
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 blkfront.c       |  4 ++--
 console/xenbus.c |  2 +-
 fbfront.c        |  4 ++--
 netfront.c       |  2 +-
 pcifront.c       | 28 +++++++++++++---------------
 shutdown.c       |  2 +-
 xenbus/xenbus.c  |  2 ++
 7 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/blkfront.c b/blkfront.c
index f747216..834a978 100644
--- a/blkfront.c
+++ b/blkfront.c
@@ -200,7 +200,7 @@ done:
 
         snprintf(path, sizeof(path), "%s/state", dev->backend);
 
-        xenbus_watch_path_token(XBT_NIL, path, path, &dev->events);
+        free(xenbus_watch_path_token(XBT_NIL, path, path, &dev->events));
 
         msg = NULL;
         state = xenbus_read_integer(path);
@@ -208,7 +208,7 @@ done:
             msg = xenbus_wait_for_state_change(path, &state, &dev->events);
         if (msg != NULL || state != XenbusStateConnected) {
             printk("backend not available, state=%d\n", state);
-            xenbus_unwatch_path_token(XBT_NIL, path, path);
+            free(xenbus_unwatch_path_token(XBT_NIL, path, path));
             goto error;
         }
 
diff --git a/console/xenbus.c b/console/xenbus.c
index 654b469..05fc31c 100644
--- a/console/xenbus.c
+++ b/console/xenbus.c
@@ -164,7 +164,7 @@ done:
         char path[strlen(dev->backend) + strlen("/state") + 1];
         snprintf(path, sizeof(path), "%s/state", dev->backend);
         
-	xenbus_watch_path_token(XBT_NIL, path, path, &dev->events);
+	free(xenbus_watch_path_token(XBT_NIL, path, path, &dev->events));
         msg = NULL;
         state = xenbus_read_integer(path);
         while (msg == NULL && state < XenbusStateConnected)
diff --git a/fbfront.c b/fbfront.c
index 9cc07b4..d3b3848 100644
--- a/fbfront.c
+++ b/fbfront.c
@@ -163,7 +163,7 @@ done:
 
         snprintf(path, sizeof(path), "%s/state", dev->backend);
 
-        xenbus_watch_path_token(XBT_NIL, path, path, &dev->events);
+        free(xenbus_watch_path_token(XBT_NIL, path, path, &dev->events));
 
         err = NULL;
         state = xenbus_read_integer(path);
@@ -530,7 +530,7 @@ done:
 
         snprintf(path, sizeof(path), "%s/state", dev->backend);
 
-        xenbus_watch_path_token(XBT_NIL, path, path, &dev->events);
+        free(xenbus_watch_path_token(XBT_NIL, path, path, &dev->events));
 
         err = NULL;
         state = xenbus_read_integer(path);
diff --git a/netfront.c b/netfront.c
index fe7bb62..66f2bbc 100644
--- a/netfront.c
+++ b/netfront.c
@@ -513,7 +513,7 @@ done:
             err = xenbus_wait_for_state_change(path, &state, &dev->events);
         if (state != XenbusStateConnected) {
             printk("backend not avalable, state=%d\n", state);
-            xenbus_unwatch_path_token(XBT_NIL, path, path);
+            free(xenbus_unwatch_path_token(XBT_NIL, path, path));
             goto error;
         }
 
diff --git a/pcifront.c b/pcifront.c
index 0fc5b30..5642356 100644
--- a/pcifront.c
+++ b/pcifront.c
@@ -70,28 +70,28 @@ void pcifront_watches(void *opaque)
 
     while (1) {
         printk("pcifront_watches: waiting for backend path to appear %s\n", path);
-        xenbus_watch_path_token(XBT_NIL, path, path, &events);
+        free(xenbus_watch_path_token(XBT_NIL, path, path, &events));
         while ((err = xenbus_read(XBT_NIL, path, &be_path)) != NULL) {
             free(err);
             xenbus_wait_for_watch(&events);
         }
-        xenbus_unwatch_path_token(XBT_NIL, path, path);
+        free(xenbus_unwatch_path_token(XBT_NIL, path, path));
         printk("pcifront_watches: waiting for backend to get into the right state %s\n", be_path);
         be_state = (char *) malloc(strlen(be_path) +  7);
         snprintf(be_state, strlen(be_path) +  7, "%s/state", be_path);
-        xenbus_watch_path_token(XBT_NIL, be_state, be_state, &events);
+        free(xenbus_watch_path_token(XBT_NIL, be_state, be_state, &events));
         while ((err = xenbus_read(XBT_NIL, be_state, &msg)) != NULL || msg[0] > '4') {
             free(msg);
             free(err);
             xenbus_wait_for_watch(&events);
         }
-        xenbus_unwatch_path_token(XBT_NIL, be_state, be_state);
+        free(xenbus_unwatch_path_token(XBT_NIL, be_state, be_state));
         if (init_pcifront(NULL) == NULL) {
             free(be_state);
             free(be_path);
             continue;
         }
-        xenbus_watch_path_token(XBT_NIL, be_state, be_state, &events);
+        free(xenbus_watch_path_token(XBT_NIL, be_state, be_state, &events));
         state = XenbusStateConnected;
         printk("pcifront_watches: waiting for backend events %s\n", be_state);
         while ((err = xenbus_wait_for_state_change(be_state, &state, &events)) == NULL &&
@@ -103,10 +103,9 @@ void pcifront_watches(void *opaque)
                 if ((err = xenbus_switch_state(XBT_NIL, fe_state, XenbusStateReconfiguring)) != NULL) {
                     printk("pcifront_watches: error changing state to %d: %s\n",
                             XenbusStateReconfiguring, err);
-                    if (!strcmp(err, "ENOENT")) {
-                        xenbus_write(XBT_NIL, fe_state, "7");
-                        free(err);
-                    }
+                    if (!strcmp(err, "ENOENT"))
+                        free(xenbus_write(XBT_NIL, fe_state, "7"));
+                    free(err);
                 }
             } else if (state == XenbusStateReconfigured) {
                 printk("pcifront_watches: writing %s %d\n", fe_state, XenbusStateConnected);
@@ -114,10 +113,9 @@ void pcifront_watches(void *opaque)
                 if ((err = xenbus_switch_state(XBT_NIL, fe_state, XenbusStateConnected)) != NULL) {
                     printk("pcifront_watches: error changing state to %d: %s\n",
                             XenbusStateConnected, err);
-                    if (!strcmp(err, "ENOENT")) {
-                        xenbus_write(XBT_NIL, fe_state, "4");
-                        free(err);
-                    }
+                    if (!strcmp(err, "ENOENT"))
+                        free(xenbus_write(XBT_NIL, fe_state, "4"));
+                    free(err);
                 }
             } else if (state == XenbusStateClosing)
                 break;
@@ -135,7 +133,7 @@ void pcifront_watches(void *opaque)
         pcidev = NULL;
     }
 
-    xenbus_unwatch_path_token(XBT_NIL, path, path);
+    free(xenbus_unwatch_path_token(XBT_NIL, path, path));
 }
 
 struct pcifront_dev *init_pcifront(char *_nodename)
@@ -243,7 +241,7 @@ done:
         XenbusState state;
         snprintf(path, sizeof(path), "%s/state", dev->backend);
 
-        xenbus_watch_path_token(XBT_NIL, path, path, &dev->events);
+        free(xenbus_watch_path_token(XBT_NIL, path, path, &dev->events));
 
         err = NULL;
         state = xenbus_read_integer(path);
diff --git a/shutdown.c b/shutdown.c
index c7c92cb..4c0b13c 100644
--- a/shutdown.c
+++ b/shutdown.c
@@ -71,7 +71,7 @@ static void shutdown_thread(void *p)
     char *shutdown, *err;
     unsigned int shutdown_reason;
 
-    xenbus_watch_path_token(XBT_NIL, path, token, &events);
+    free(xenbus_watch_path_token(XBT_NIL, path, token, &events));
 
     for ( ;; ) {
         xenbus_wait_for_watch(&events);
diff --git a/xenbus/xenbus.c b/xenbus/xenbus.c
index b12cef7..9e61930 100644
--- a/xenbus/xenbus.c
+++ b/xenbus/xenbus.c
@@ -198,6 +198,8 @@ exit:
         }
         if (msg == NULL && msg2 != NULL)
             msg = msg2;
+        else
+            free(msg2);
     } while (retry);
 
     return msg;
-- 
2.16.4


