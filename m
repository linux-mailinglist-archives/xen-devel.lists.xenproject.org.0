Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D67DDE7C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:34:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626241.976351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7bl-0007VO-Fb; Wed, 01 Nov 2023 09:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626241.976351; Wed, 01 Nov 2023 09:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7bl-0007Sp-CW; Wed, 01 Nov 2023 09:33:53 +0000
Received: by outflank-mailman (input) for mailman id 626241;
 Wed, 01 Nov 2023 09:33:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7bk-0005E0-0o
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:33:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4480c77-7899-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:33:51 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 318C521835;
 Wed,  1 Nov 2023 09:33:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0901713460;
 Wed,  1 Nov 2023 09:33:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XsLtAH8bQmW9CAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:33:51 +0000
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
X-Inumbo-ID: c4480c77-7899-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SG/cdYRJD2CfQyplx7RLCTyqvUsFZjaC4L9HFaUzmyI=;
	b=nm1HWMddpIPSTRB10ydlf/RkKXoJxNeTkikN2LhqLodq01RH9XEpFhbfwd7IHKrIwXP3/I
	OCcbXvctBNWeutYYOsT4P0KQVRBc/b4X/lpnulacS3+VhvGgJfOrEeWtw2Ks2XcDKqagp0
	vsrONSBNwhNZk4AT6QOhUGKSA4tJw0Y=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 04/29] tools/xenlogd: add transport layer
Date: Wed,  1 Nov 2023 10:33:00 +0100
Message-Id: <20231101093325.30302-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the transport layer of 9pfs. This is basically the infrastructure
to receive requests from the frontend and to send the related answers
via the rings.

In order to avoid unaligned accesses e.g. on Arm, add the definition of
__packed to the common-macros.h header.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/include/xen-tools/common-macros.h |   4 +
 tools/xenlogd/io.c                      | 142 +++++++++++++++++++++++-
 tools/xenlogd/xenlogd.h                 |  16 +++
 3 files changed, 160 insertions(+), 2 deletions(-)

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
diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
index ef0954d69d..590d06e906 100644
--- a/tools/xenlogd/io.c
+++ b/tools/xenlogd/io.c
@@ -6,24 +6,115 @@
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
 
 #include "xenlogd.h"
 
+/*
+ * Note that the ring names "in" and "out" are from the frontend's
+ * perspective, so the "in" ring will be used for responses to the frontend,
+ * while the "out" ring is used for requests from the frontend to the
+ * backend.
+ */
+static unsigned int ring_in_free(device *device)
+{
+    unsigned int queued;
+
+    queued = xen_9pfs_queued(device->prod_pvt_in, device->intf->in_cons,
+                             device->ring_size);
+    xen_rmb();
+
+    return device->ring_size - queued;
+}
+
+static unsigned int ring_out_data(device *device)
+{
+    unsigned int queued;
+
+    queued = xen_9pfs_queued(device->intf->out_prod, device->cons_pvt_out,
+                             device->ring_size);
+    xen_rmb();
+
+    return queued;
+}
+
+static unsigned int get_request_bytes(device *device, unsigned int off,
+                                      unsigned int len)
+{
+    unsigned int size;
+    unsigned int out_data = ring_out_data(device);
+    RING_IDX prod, cons;
+
+    size = min(len - off, out_data);
+    prod = xen_9pfs_mask(device->intf->out_prod, device->ring_size);
+    cons = xen_9pfs_mask(device->cons_pvt_out, device->ring_size);
+    xen_9pfs_read_packet(device->buffer + off, device->data.out, size,
+                         prod, &cons, device->ring_size);
+
+    xen_rmb();           /* Read data out before setting visible consumer. */
+    device->cons_pvt_out += size;
+    device->intf->out_cons = device->cons_pvt_out;
+
+    /* Signal that more space is available now. */
+    xenevtchn_notify(xe, device->evtchn);
+
+    return size;
+}
+
+static unsigned int put_request_bytes(device *device, unsigned int off,
+                                      unsigned int len)
+{
+    unsigned int size;
+    unsigned int in_data = ring_in_free(device);
+    RING_IDX prod, cons;
+
+    size = min(len - off, in_data);
+    prod = xen_9pfs_mask(device->prod_pvt_in, device->ring_size);
+    cons = xen_9pfs_mask(device->intf->in_cons, device->ring_size);
+    xen_9pfs_write_packet(device->data.in, device->buffer + off, size,
+                          &prod, cons, device->ring_size);
+
+    xen_wmb();           /* Write data out before setting visible producer. */
+    device->prod_pvt_in += size;
+    device->intf->in_prod = device->prod_pvt_in;
+
+    return size;
+}
+
 static bool io_work_pending(device *device)
 {
     if ( device->stop_thread )
         return true;
-    return false;
+    if ( device->error )
+        return false;
+    return device->handle_response ? ring_in_free(device)
+                                   : ring_out_data(device);
 }
 
 void *io_thread(void *arg)
 {
     device *device = arg;
+    unsigned int count = 0;
+    struct p9_header hdr;
+    bool in_hdr = true;
+
+    device->max_size = device->ring_size;
+    device->buffer = malloc(device->max_size);
+    if ( !device->buffer )
+    {
+        syslog(LOG_CRIT, "memory allocation failure!");
+        return NULL;
+    }
 
     while ( !device->stop_thread )
     {
@@ -36,9 +127,56 @@ void *io_thread(void *arg)
         }
         pthread_mutex_unlock(&device->mutex);
 
-        /* TODO: I/O handling. */
+        if ( device->stop_thread || device->error )
+            continue;
+
+        if ( !device->handle_response )
+        {
+            if ( in_hdr )
+            {
+                count += get_request_bytes(device, count, sizeof(hdr));
+                if ( count != sizeof(hdr) )
+                    continue;
+                hdr = *(struct p9_header *)device->buffer;
+                if ( hdr.size > device->max_size || hdr.size < sizeof(hdr) )
+                {
+                    syslog(LOG_ERR, "%u.%u specified illegal request length %u",
+                           device->domid, device->devid, hdr.size);
+                    device->error = true;
+                    continue;
+                }
+                in_hdr = false;
+            }
+
+            count += get_request_bytes(device, count, hdr.size);
+            if ( count < hdr.size )
+                continue;
+
+            /* TODO: handle request. */
+
+            device->handle_response = true;
+            hdr.size = ((struct p9_header *)device->buffer)->size;
+            count = 0;
+        }
+
+        if ( device->handle_response )
+        {
+            count += put_request_bytes(device, count, hdr.size);
+
+            if ( count == hdr.size )
+            {
+                /* Signal presence of response. */
+                xenevtchn_notify(xe, device->evtchn);
+
+                device->handle_response = false;
+                in_hdr = true;
+                count = 0;
+            }
+        }
     }
 
+    free(device->buffer);
+
     device->thread_active = false;
 
     return NULL;
diff --git a/tools/xenlogd/xenlogd.h b/tools/xenlogd/xenlogd.h
index a8e9f9ca22..40aa7cd03a 100644
--- a/tools/xenlogd/xenlogd.h
+++ b/tools/xenlogd/xenlogd.h
@@ -13,6 +13,12 @@
 
 #define MAX_OPEN_FILES_DEFAULT   5
 
+struct p9_header {
+    uint32_t size;
+    uint8_t cmd;
+    uint16_t tag;
+} __attribute__((packed));
+
 typedef struct device device;
 struct device {
     /* Admin data. */
@@ -40,7 +46,17 @@ struct device {
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
 
 extern xenevtchn_handle *xe;
-- 
2.35.3


