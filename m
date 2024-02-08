Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B21E84E599
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 17:56:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678354.1055563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7h9-00071e-PY; Thu, 08 Feb 2024 16:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678354.1055563; Thu, 08 Feb 2024 16:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7h9-0006yV-LE; Thu, 08 Feb 2024 16:56:15 +0000
Received: by outflank-mailman (input) for mailman id 678354;
 Thu, 08 Feb 2024 16:56:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m/2e=JR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rY7h7-0005q0-UV
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:56:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f68c5f73-c6a2-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 17:56:12 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BBBBB21F60;
 Thu,  8 Feb 2024 16:56:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D4591326D;
 Thu,  8 Feb 2024 16:56:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id I4kWIasHxWXHEwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 08 Feb 2024 16:56:11 +0000
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
X-Inumbo-ID: f68c5f73-c6a2-11ee-98f5-efadbce2ee36
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v5 04/22] tools/9pfsd: add transport layer
Date: Thu,  8 Feb 2024 17:55:28 +0100
Message-Id: <20240208165546.5715-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240208165546.5715-1-jgross@suse.com>
References: <20240208165546.5715-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: BBBBB21F60
X-Spam-Flag: NO

Add the transport layer of 9pfs. This is basically the infrastructure
to receive requests from the frontend and to send the related answers
via the rings.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
V2:
- rename put_request_bytes() (Jason Andryuk)
- rename get_request_bytes() and put_response_bytes() len parameter
  (Jason Andryuk)
- don't unmask event channel if error indicator is set (Jason Andryuk)
---
 tools/9pfsd/io.c        | 143 +++++++++++++++++++++++++++++++++++++++-
 tools/9pfsd/xen-9pfsd.h |  16 +++++
 2 files changed, 156 insertions(+), 3 deletions(-)

diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
index eb7c136e09..4312a62dfe 100644
--- a/tools/9pfsd/io.c
+++ b/tools/9pfsd/io.c
@@ -6,39 +6,176 @@
  * Copyright (C) 2024 Juergen Gross <jgross@suse.com>
  *
  * I/O thread handling.
+ *
+ * Only handle one request at a time, pushing out the complete response
+ * before looking for the next request.
  */
 
 #include <stdbool.h>
+#include <stdlib.h>
 #include <string.h>
 #include <syslog.h>
+#include <xenctrl.h>           /* For cpu barriers. */
+#include <xen-tools/common-macros.h>
 
 #include "xen-9pfsd.h"
 
+/*
+ * Note that the ring names "in" and "out" are from the frontend's
+ * perspective, so the "in" ring will be used for responses to the frontend,
+ * while the "out" ring is used for requests from the frontend to the
+ * backend.
+ */
+static unsigned int ring_in_free(struct ring *ring)
+{
+    unsigned int queued;
+
+    queued = xen_9pfs_queued(ring->prod_pvt_in, ring->intf->in_cons,
+                             ring->ring_size);
+    xen_rmb();
+
+    return ring->ring_size - queued;
+}
+
+static unsigned int ring_out_data(struct ring *ring)
+{
+    unsigned int queued;
+
+    queued = xen_9pfs_queued(ring->intf->out_prod, ring->cons_pvt_out,
+                             ring->ring_size);
+    xen_rmb();
+
+    return queued;
+}
+
+static unsigned int get_request_bytes(struct ring *ring, unsigned int off,
+                                      unsigned int total_len)
+{
+    unsigned int size;
+    unsigned int out_data = ring_out_data(ring);
+    RING_IDX prod, cons;
+
+    size = min(total_len - off, out_data);
+    prod = xen_9pfs_mask(ring->intf->out_prod, ring->ring_size);
+    cons = xen_9pfs_mask(ring->cons_pvt_out, ring->ring_size);
+    xen_9pfs_read_packet(ring->buffer + off, ring->data.out, size,
+                         prod, &cons, ring->ring_size);
+
+    xen_rmb();           /* Read data out before setting visible consumer. */
+    ring->cons_pvt_out += size;
+    ring->intf->out_cons = ring->cons_pvt_out;
+
+    /* Signal that more space is available now. */
+    xenevtchn_notify(xe, ring->evtchn);
+
+    return size;
+}
+
+static unsigned int put_response_bytes(struct ring *ring, unsigned int off,
+                                       unsigned int total_len)
+{
+    unsigned int size;
+    unsigned int in_data = ring_in_free(ring);
+    RING_IDX prod, cons;
+
+    size = min(total_len - off, in_data);
+    prod = xen_9pfs_mask(ring->prod_pvt_in, ring->ring_size);
+    cons = xen_9pfs_mask(ring->intf->in_cons, ring->ring_size);
+    xen_9pfs_write_packet(ring->data.in, ring->buffer + off, size,
+                          &prod, cons, ring->ring_size);
+
+    xen_wmb();           /* Write data out before setting visible producer. */
+    ring->prod_pvt_in += size;
+    ring->intf->in_prod = ring->prod_pvt_in;
+
+    return size;
+}
+
 static bool io_work_pending(struct ring *ring)
 {
     if ( ring->stop_thread )
         return true;
-    return false;
+    if ( ring->error )
+        return false;
+    return ring->handle_response ? ring_in_free(ring) : ring_out_data(ring);
 }
 
 void *io_thread(void *arg)
 {
     struct ring *ring = arg;
+    unsigned int count = 0;
+    struct p9_header hdr;
+    bool in_hdr = true;
+
+    ring->max_size = ring->ring_size;
+    ring->buffer = malloc(ring->max_size);
+    if ( !ring->buffer )
+    {
+        syslog(LOG_CRIT, "memory allocation failure!");
+        return NULL;
+    }
 
     while ( !ring->stop_thread )
     {
         pthread_mutex_lock(&ring->mutex);
         if ( !io_work_pending(ring) )
         {
-            if ( xenevtchn_unmask(xe, ring->evtchn) < 0 )
+            if ( !ring->error && xenevtchn_unmask(xe, ring->evtchn) < 0 )
                 syslog(LOG_WARNING, "xenevtchn_unmask() failed");
             pthread_cond_wait(&ring->cond, &ring->mutex);
         }
         pthread_mutex_unlock(&ring->mutex);
 
-        /* TODO: I/O handling. */
+        if ( ring->stop_thread || ring->error )
+            continue;
+
+        if ( !ring->handle_response )
+        {
+            if ( in_hdr )
+            {
+                count += get_request_bytes(ring, count, sizeof(hdr));
+                if ( count != sizeof(hdr) )
+                    continue;
+                hdr = *(struct p9_header *)ring->buffer;
+                if ( hdr.size > ring->max_size || hdr.size < sizeof(hdr) )
+                {
+                    syslog(LOG_ERR, "%u.%u specified illegal request length %u",
+                           ring->device->domid, ring->device->devid, hdr.size);
+                    ring->error = true;
+                    continue;
+                }
+                in_hdr = false;
+            }
+
+            count += get_request_bytes(ring, count, hdr.size);
+            if ( count < hdr.size )
+                continue;
+
+            /* TODO: handle request (will rewrite hdr.size). */
+
+            ring->handle_response = true;
+            hdr.size = ((struct p9_header *)ring->buffer)->size;
+            count = 0;
+        }
+
+        if ( ring->handle_response )
+        {
+            count += put_response_bytes(ring, count, hdr.size);
+
+            if ( count == hdr.size )
+            {
+                /* Signal presence of response. */
+                xenevtchn_notify(xe, ring->evtchn);
+
+                ring->handle_response = false;
+                in_hdr = true;
+                count = 0;
+            }
+        }
     }
 
+    free(ring->buffer);
+
     ring->thread_active = false;
 
     return NULL;
diff --git a/tools/9pfsd/xen-9pfsd.h b/tools/9pfsd/xen-9pfsd.h
index ff3562164a..d587f59a32 100644
--- a/tools/9pfsd/xen-9pfsd.h
+++ b/tools/9pfsd/xen-9pfsd.h
@@ -15,6 +15,12 @@
 #define MAX_RING_ORDER           9
 #define MAX_OPEN_FILES_DEFAULT   5
 
+struct p9_header {
+    uint32_t size;
+    uint8_t cmd;
+    uint16_t tag;
+} __attribute__((packed));
+
 typedef struct device device;
 
 struct ring {
@@ -29,7 +35,17 @@ struct ring {
     struct xen_9pfs_data_intf *intf;
     unsigned int ring_order;
     RING_IDX ring_size;
+
+    /* Transport layer data. */
     struct xen_9pfs_data data;
+    RING_IDX prod_pvt_in;
+    RING_IDX cons_pvt_out;
+
+    /* Request and response handling. */
+    uint32_t max_size;
+    bool error;             /* Protocol error - stop processing. */
+    bool handle_response;   /* Main loop now handling response. */
+    void *buffer;           /* Request/response buffer. */
 };
 
 struct device {
-- 
2.35.3


