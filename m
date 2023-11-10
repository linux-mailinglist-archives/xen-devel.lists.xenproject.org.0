Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6097E7D96
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630468.983332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U3c-0005Lg-Jm; Fri, 10 Nov 2023 16:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630468.983332; Fri, 10 Nov 2023 16:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U3c-0005Jd-GZ; Fri, 10 Nov 2023 16:08:32 +0000
Received: by outflank-mailman (input) for mailman id 630468;
 Fri, 10 Nov 2023 16:08:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U3b-0004cS-Bc
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:08:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63409075-7fe3-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:08:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5C6432187C;
 Fri, 10 Nov 2023 16:08:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 36A1A13398;
 Fri, 10 Nov 2023 16:08:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GsjgC31VTmWHCAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:08:29 +0000
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
X-Inumbo-ID: 63409075-7fe3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8LEAVDIRj4dc7c1ZNOEz/ljD8n08+X/zewMO8NL1MKE=;
	b=avO07QTMvYah2jhfMuq9fGB0fxdz6dSkbFavEn+u00ueRUl4NXqHkocf/nxdqG6sucC3kH
	nYaTTbDIEKpNC0mRFLRxygPRHf1SNf8AkcUUT7GAkMZ4QtS6D6nHnv6Cj9asMKpHNO+x92
	QTksY3Ok9H1dFJTRSk0T4pRSpbTkvpc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 04/29] tools/xenlogd: add transport layer
Date: Fri, 10 Nov 2023 17:07:39 +0100
Message-Id: <20231110160804.29021-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the transport layer of 9pfs. This is basically the infrastructure
to receive requests from the frontend and to send the related answers
via the rings.

In order to avoid unaligned accesses e.g. on Arm, add the definition of
__packed to the common-macros.h header.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- rename put_request_bytes() (Jason Andryuk)
- rename get_request_bytes() and put_response_bytes() len parameter
  (Jason Andryuk)
- don't unmask event channel if error indicator is set (Jason Andryuk)
---
 tools/include/xen-tools/common-macros.h |   4 +
 tools/xen-9pfsd/io.c                    | 143 +++++++++++++++++++++++-
 tools/xen-9pfsd/xen-9pfsd.h             |  16 +++
 3 files changed, 160 insertions(+), 3 deletions(-)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index e5ed603904..c3fd7d2a30 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -79,6 +79,10 @@
 #define __must_check __attribute__((__warn_unused_result__))
 #endif
 
+#ifndef __packed
+#define __packed __attribute__((__packed__))
+#endif
+
 #define container_of(ptr, type, member) ({              \
     typeof(((type *)0)->member) *mptr__ = (ptr);        \
     (type *)((char *)mptr__ - offsetof(type, member));  \
diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
index e1e37970f4..d9aa081bea 100644
--- a/tools/xen-9pfsd/io.c
+++ b/tools/xen-9pfsd/io.c
@@ -6,39 +6,176 @@
  * Copyright (C) 2023 Juergen Gross <jgross@suse.com>
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
diff --git a/tools/xen-9pfsd/xen-9pfsd.h b/tools/xen-9pfsd/xen-9pfsd.h
index 432f321d0d..7d6921f164 100644
--- a/tools/xen-9pfsd/xen-9pfsd.h
+++ b/tools/xen-9pfsd/xen-9pfsd.h
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


