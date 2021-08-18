Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426E93F0800
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 17:27:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168290.307273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGNSW-0001wh-4p; Wed, 18 Aug 2021 15:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168290.307273; Wed, 18 Aug 2021 15:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGNSW-0001tO-1m; Wed, 18 Aug 2021 15:26:28 +0000
Received: by outflank-mailman (input) for mailman id 168290;
 Wed, 18 Aug 2021 15:26:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jUNG=NJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mGNSU-0001r2-Lt
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 15:26:26 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a530762d-025b-4ec1-b95e-f3ff4ecab5a7;
 Wed, 18 Aug 2021 15:26:19 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A0F4622072;
 Wed, 18 Aug 2021 15:26:17 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 68F9D1371C;
 Wed, 18 Aug 2021 15:26:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id HyKCF5kmHWGOfgAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 18 Aug 2021 15:26:17 +0000
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
X-Inumbo-ID: a530762d-025b-4ec1-b95e-f3ff4ecab5a7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629300377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Ru9tdnr7RGNWbnwLSBztvmMC/Sy6D40bdl/GXajU2l4=;
	b=VRuUJ7c60SuloVWkLtr1a0bk9fGtwVfU4YyohCppk1Wii0i3LWWf0gD+krLeOgXBEmJgcL
	lFEp96KRUGMay54R3H11Dy0EJXttmkEbTlf9f3dw7hxELhy0sQAbk9USiBAdNzpW4Gf8Lq
	pm4jBM18M8tUANLwQyzQ2zKx50Fb4p0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] mini-os: xenbus: support large messages
Date: Wed, 18 Aug 2021 17:26:10 +0200
Message-Id: <20210818152610.6114-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today the implementation of the xenbus protocol in Mini-OS will only
allow to transfer the complete message to or from the ring page buffer.
This is limiting the maximum message size to lower values as the xenbus
protocol normally would allow.

Change that by allowing to transfer the xenbus message in chunks as
soon as they are available.

Avoid crashing Mini-OS in case of illegal data read from the ring
buffer.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xenbus/xenbus.c | 212 ++++++++++++++++++++++++++++--------------------
 1 file changed, 124 insertions(+), 88 deletions(-)

diff --git a/xenbus/xenbus.c b/xenbus/xenbus.c
index 23de61e..3fbb122 100644
--- a/xenbus/xenbus.c
+++ b/xenbus/xenbus.c
@@ -29,6 +29,7 @@
 #include <xen/hvm/params.h>
 #include <mini-os/spinlock.h>
 #include <mini-os/xmalloc.h>
+#include <mini-os/semaphore.h>
 
 #define min(x,y) ({                       \
         typeof(x) tmpx = (x);                 \
@@ -46,6 +47,7 @@
 static struct xenstore_domain_interface *xenstore_buf;
 static DECLARE_WAIT_QUEUE_HEAD(xb_waitq);
 DECLARE_WAIT_QUEUE_HEAD(xenbus_watch_queue);
+static __DECLARE_SEMAPHORE_GENERIC(xb_write_sem, 1);
 
 xenbus_event_queue xenbus_events;
 static struct watch {
@@ -231,75 +233,105 @@ char *xenbus_wait_for_state_change(const char* path, XenbusState *state, xenbus_
 }
 
 
+static void xenbus_read_data(char *buf, unsigned int len)
+{
+    unsigned int off = 0;
+    unsigned int prod;
+    unsigned int size;
+    int notify;
+
+    while (off != len)
+    {
+        if (xenstore_buf->rsp_prod == xenstore_buf->rsp_cons)
+            wait_event(xb_waitq,
+                       xenstore_buf->rsp_prod != xenstore_buf->rsp_cons);
+
+        prod = xenstore_buf->rsp_prod;
+        DEBUG("Rsp_cons %d, rsp_prod %d.\n", xenstore_buf->rsp_cons, prod);
+        size = min(len - off, prod - xenstore_buf->rsp_cons);
+        memcpy_from_ring(xenstore_buf->rsp, buf + off,
+                         MASK_XENSTORE_IDX(xenstore_buf->rsp_cons), size);
+        off += size;
+        notify = (xenstore_buf->rsp_cons + XENSTORE_RING_SIZE ==
+                  xenstore_buf->rsp_prod);
+        rmb();
+        xenstore_buf->rsp_cons += size;
+        wmb();
+        if (notify)
+            notify_remote_via_evtchn(xenbus_evtchn);
+    }
+}
+
 static void xenbus_thread_func(void *ign)
 {
     struct xsd_sockmsg msg;
-    unsigned prod = xenstore_buf->rsp_prod;
+    char *data;
 
     for (;;) {
-        wait_event(xb_waitq, prod != xenstore_buf->rsp_prod);
-        while (1) {
-            prod = xenstore_buf->rsp_prod;
-            DEBUG("Rsp_cons %d, rsp_prod %d.\n", xenstore_buf->rsp_cons,
-                  xenstore_buf->rsp_prod);
-            if (xenstore_buf->rsp_prod - xenstore_buf->rsp_cons < sizeof(msg))
-                break;
-            rmb();
-            memcpy_from_ring(xenstore_buf->rsp, &msg,
-                             MASK_XENSTORE_IDX(xenstore_buf->rsp_cons),
-                             sizeof(msg));
-            DEBUG("Msg len %d, %d avail, id %d.\n", msg.len + sizeof(msg),
-                  xenstore_buf->rsp_prod - xenstore_buf->rsp_cons, msg.req_id);
-
-            if (xenstore_buf->rsp_prod - xenstore_buf->rsp_cons <
-                sizeof(msg) + msg.len)
-                break;
-
-            DEBUG("Message is good.\n");
-
-            if (msg.type == XS_WATCH_EVENT) {
-                struct xenbus_event *event = malloc(sizeof(*event) + msg.len);
-                xenbus_event_queue *events = NULL;
-                char *data = (char*)event + sizeof(*event);
-                struct watch *watch;
-
-                memcpy_from_ring(xenstore_buf->rsp, data,
-                    MASK_XENSTORE_IDX(xenstore_buf->rsp_cons + sizeof(msg)),
-                    msg.len);
-
-                event->path = data;
-                event->token = event->path + strlen(event->path) + 1;
-
-                mb();
-                xenstore_buf->rsp_cons += msg.len + sizeof(msg);
-
-                for (watch = watches; watch; watch = watch->next)
-                    if (!strcmp(watch->token, event->token)) {
-                        events = watch->events;
-                        break;
-                    }
-
-                if (events) {
-                    event->next = *events;
-                    *events = event;
-                    wake_up(&xenbus_watch_queue);
-                } else {
-                    printk("unexpected watch token %s\n", event->token);
-                    free(event);
+        xenbus_read_data((char *)&msg, sizeof(msg));
+        DEBUG("Msg len %d, %d avail, id %d.\n", msg.len + sizeof(msg),
+              xenstore_buf->rsp_prod - xenstore_buf->rsp_cons, msg.req_id);
+
+        if (msg.len > XENSTORE_PAYLOAD_MAX) {
+            printk("Xenstore violates protocol, message longer than allowed.\n");
+            return;
+        }
+
+        if (msg.type == XS_WATCH_EVENT) {
+            struct xenbus_event *event = malloc(sizeof(*event) + msg.len);
+            xenbus_event_queue *events = NULL;
+            struct watch *watch;
+            char *c;
+            int zeroes = 0;
+
+            data = (char*)event + sizeof(*event);
+            xenbus_read_data(data, msg.len);
+
+            for (c = data; c < data + msg.len; c++)
+                if (!*c)
+                    zeroes++;
+            if (zeroes != 2) {
+                printk("Xenstore: illegal watch event data\n");
+                free(event);
+                continue;
+            }
+
+            event->path = data;
+            event->token = event->path + strlen(event->path) + 1;
+
+            for (watch = watches; watch; watch = watch->next)
+                if (!strcmp(watch->token, event->token)) {
+                    events = watch->events;
+                    break;
                 }
+
+            if (events) {
+                event->next = *events;
+                *events = event;
+                wake_up(&xenbus_watch_queue);
             } else {
-                req_info[msg.req_id].reply = malloc(sizeof(msg) + msg.len);
-                memcpy_from_ring(xenstore_buf->rsp, req_info[msg.req_id].reply,
-                                 MASK_XENSTORE_IDX(xenstore_buf->rsp_cons),
-                                 msg.len + sizeof(msg));
-                mb();
-                xenstore_buf->rsp_cons += msg.len + sizeof(msg);
-                wake_up(&req_info[msg.req_id].waitq);
+                printk("Xenstore: unexpected watch token %s\n", event->token);
+                free(event);
             }
 
-            wmb();
-            notify_remote_via_evtchn(xenbus_evtchn);
+            continue;
         }
+
+        data = malloc(sizeof(msg) + msg.len);
+        memcpy(data, &msg, sizeof(msg));
+        xenbus_read_data(data + sizeof(msg), msg.len);
+
+        if (msg.req_id >= NR_REQS || !req_info[msg.req_id].in_use) {
+            printk("Xenstore: illegal request id %d\n", msg.req_id);
+            free(data);
+            continue;
+        }
+
+        DEBUG("Message is good.\n");
+
+        req_info[msg.req_id].reply = data;
+
+        wake_up(&req_info[msg.req_id].waitq);
     }
 }
 
@@ -451,36 +483,40 @@ static void xb_write(int type, int req_id, xenbus_transaction_t trans_id,
 
     cur_req = &header_req;
 
-    BUG_ON(len > XENSTORE_RING_SIZE);
-    /* Wait for the ring to drain to the point where we can send the
-       message. */
-    prod = xenstore_buf->req_prod;
-    if (prod + len - xenstore_buf->req_cons > XENSTORE_RING_SIZE) 
-    {
-        /* Wait for there to be space on the ring */
-        DEBUG("prod %d, len %d, cons %d, size %d; waiting.\n",
-                prod, len, xenstore_buf->req_cons, XENSTORE_RING_SIZE);
-        wait_event(xb_waitq,
-                xenstore_buf->req_prod + len - xenstore_buf->req_cons <=
-                XENSTORE_RING_SIZE);
-        DEBUG("Back from wait.\n");
-        prod = xenstore_buf->req_prod;
-    }
+    BUG_ON(len > XENSTORE_PAYLOAD_MAX);
 
-    /* We're now guaranteed to be able to send the message without
-       overflowing the ring.  Do so. */
+    /* Make sure we are the only thread trying to write. */
+    down(&xb_write_sem);
+
+    /* Send the message in chunks using free ring space when available. */
     total_off = 0;
     req_off = 0;
-    while (total_off < len) 
+    while (total_off < len)
     {
+        prod = xenstore_buf->req_prod;
+        if (prod - xenstore_buf->req_cons >= XENSTORE_RING_SIZE)
+        {
+            /* Send evtchn to notify remote */
+            notify_remote_via_evtchn(xenbus_evtchn);
+
+            /* Wait for there to be space on the ring */
+            DEBUG("prod %d, len %d, cons %d, size %d; waiting.\n", prod,
+                  len - total_off, xenstore_buf->req_cons, XENSTORE_RING_SIZE);
+            wait_event(xb_waitq,
+                       prod - xenstore_buf->req_cons < XENSTORE_RING_SIZE);
+            DEBUG("Back from wait.\n");
+        }
+
         this_chunk = min(cur_req->len - req_off,
-                XENSTORE_RING_SIZE - MASK_XENSTORE_IDX(prod));
+                         XENSTORE_RING_SIZE - MASK_XENSTORE_IDX(prod));
+        this_chunk = min(this_chunk,
+                         xenstore_buf->req_cons + XENSTORE_RING_SIZE - prod);
         memcpy((char *)xenstore_buf->req + MASK_XENSTORE_IDX(prod),
-                (char *)cur_req->data + req_off, this_chunk);
+               (char *)cur_req->data + req_off, this_chunk);
         prod += this_chunk;
         req_off += this_chunk;
         total_off += this_chunk;
-        if (req_off == cur_req->len) 
+        if (req_off == cur_req->len)
         {
             req_off = 0;
             if (cur_req == &header_req)
@@ -488,20 +524,20 @@ static void xb_write(int type, int req_id, xenbus_transaction_t trans_id,
             else
                 cur_req++;
         }
+
+        /* Remote must see entire message before updating indexes */
+        wmb();
+        xenstore_buf->req_prod = prod;
     }
 
+    /* Send evtchn to notify remote */
+    notify_remote_via_evtchn(xenbus_evtchn);
+
     DEBUG("Complete main loop of xb_write.\n");
     BUG_ON(req_off != 0);
     BUG_ON(total_off != len);
-    BUG_ON(prod > xenstore_buf->req_cons + XENSTORE_RING_SIZE);
-
-    /* Remote must see entire message before updating indexes */
-    wmb();
-
-    xenstore_buf->req_prod += len;
 
-    /* Send evtchn to notify remote */
-    notify_remote_via_evtchn(xenbus_evtchn);
+    up(&xb_write_sem);
 }
 
 /* Send a mesasge to xenbus, in the same fashion as xb_write, and
-- 
2.26.2


