Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A46F4626
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 16:38:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528688.822158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptr8c-0003ni-OZ; Tue, 02 May 2023 14:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528688.822158; Tue, 02 May 2023 14:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptr8c-0003kc-LB; Tue, 02 May 2023 14:37:54 +0000
Received: by outflank-mailman (input) for mailman id 528688;
 Tue, 02 May 2023 14:37:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NQdG=AX=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptr8a-0003kW-Nh
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 14:37:52 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9cd0dce-e8f6-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 16:37:50 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-74adf6adac6so359821485a.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 May 2023 07:37:50 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l17-20020a0ce511000000b005dd8b9345dbsm2123688qvm.115.2023.05.02.07.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 07:37:48 -0700 (PDT)
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
X-Inumbo-ID: e9cd0dce-e8f6-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683038269; x=1685630269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mvVfVNvdUQ+dsVuQLzLVZgrOBwJbAlAHyxtlDPxYDPI=;
        b=lMWbI9liklknEyp0AdJfA4fBntRe1FaP0pj28bEYVRNdksesc9BHCIRW52HokmkTNa
         207rKs0CEVeHnl/UoakvcCupxqMXBb1fboaptwS7g6SIB5qtTCM3As3PLwDbG2T8bPpx
         YAry278fCOasg5uNV66jrPXKjxqSFpVqzUdIUVL3N4uTkKyk7l/pQxYi8Y2ih4HBERpp
         5lj6j+LX4Ke4vyr1hfbGEuqdLVIvv30gHWy8DztM1aBIMy8zB8HT0quLvLxbyatd5nd9
         ZarV8fvQ5oyAIu97M2gY+ZZo7tZsUdL5BcuptsiHKrLZq5vCk7MowTw1mCYIvQxvGCjA
         dKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683038269; x=1685630269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvVfVNvdUQ+dsVuQLzLVZgrOBwJbAlAHyxtlDPxYDPI=;
        b=AcpNz2yHkwjE9Lzc4snGv0k38AJSLCxAKKvwb9o3GGrNMCBurcITr3clHmf7yb02lP
         0fepwoN118J13znmQVVBXYIdySwJ/J+p5s5YvMrkUntVEG3OzG9466yP6xDUoPlZRTWn
         kqI3qpOHaJ5Nd3lDpTmLOcOVLVZ9ZHjJYZ/6mORb351O8ajdgpXYVwyNl9u57oiB7ObN
         NbaQ4aby3dWhtvz3bUGuanSBpj8QFVL2IGZ3NfaF+RrgduMZsZCJUDjtZ5Anqp+JDSSw
         dciU/HroCGzuEXzUiCnjIbxMdMKfpNj3MKkleEuy3KzeoUROojKGojxtopnSJNBliDJ0
         dgKg==
X-Gm-Message-State: AC+VfDyEJMlQLGsMn+u/cQgku1tQJOYuPQNIH5P5tzSVPjf3RLLgWEWT
	YKP1uf0/pCAI/HQcPSlO6q4=
X-Google-Smtp-Source: ACHHUZ7zYKwzvzyqRlxFZI4PuMYtfmBEJ9Pyx91MTJn4ENx0QM8Y5we0PQ1VIzxQMHmYfE+nlnND0Q==
X-Received: by 2002:a05:6214:1d23:b0:5f7:8b31:4548 with SMTP id f3-20020a0562141d2300b005f78b314548mr6214915qvd.4.1683038269491;
        Tue, 02 May 2023 07:37:49 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH] 9pfs/xen: Fix segfault on shutdown
Date: Tue,  2 May 2023 10:37:22 -0400
Message-Id: <20230502143722.15613-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_9pfs_free can't use gnttabdev since it is already closed and NULL-ed
out when free is called.  Do the teardown in _disconnect().  This
matches the setup done in _connect().

trace-events are also added for the XenDevOps functions.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 hw/9pfs/trace-events     |  5 +++++
 hw/9pfs/xen-9p-backend.c | 36 +++++++++++++++++++++++-------------
 2 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/hw/9pfs/trace-events b/hw/9pfs/trace-events
index 6c77966c0b..7b5b0b5a48 100644
--- a/hw/9pfs/trace-events
+++ b/hw/9pfs/trace-events
@@ -48,3 +48,8 @@ v9fs_readlink(uint16_t tag, uint8_t id, int32_t fid) "tag %d id %d fid %d"
 v9fs_readlink_return(uint16_t tag, uint8_t id, char* target) "tag %d id %d name %s"
 v9fs_setattr(uint16_t tag, uint8_t id, int32_t fid, int32_t valid, int32_t mode, int32_t uid, int32_t gid, int64_t size, int64_t atime_sec, int64_t mtime_sec) "tag %u id %u fid %d iattr={valid %d mode %d uid %d gid %d size %"PRId64" atime=%"PRId64" mtime=%"PRId64" }"
 v9fs_setattr_return(uint16_t tag, uint8_t id) "tag %u id %u"
+
+xen_9pfs_alloc(char *name) "name %s"
+xen_9pfs_connect(char *name) "name %s"
+xen_9pfs_disconnect(char *name) "name %s"
+xen_9pfs_free(char *name) "name %s"
diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index 0e266c552b..c646a0b3d1 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -25,6 +25,8 @@
 #include "qemu/iov.h"
 #include "fsdev/qemu-fsdev.h"
 
+#include "trace.h"
+
 #define VERSIONS "1"
 #define MAX_RINGS 8
 #define MAX_RING_ORDER 9
@@ -337,6 +339,8 @@ static void xen_9pfs_disconnect(struct XenLegacyDevice *xendev)
     Xen9pfsDev *xen_9pdev = container_of(xendev, Xen9pfsDev, xendev);
     int i;
 
+    trace_xen_9pfs_disconnect(xendev->name);
+
     for (i = 0; i < xen_9pdev->num_rings; i++) {
         if (xen_9pdev->rings[i].evtchndev != NULL) {
             qemu_set_fd_handler(qemu_xen_evtchn_fd(xen_9pdev->rings[i].evtchndev),
@@ -345,40 +349,42 @@ static void xen_9pfs_disconnect(struct XenLegacyDevice *xendev)
                                    xen_9pdev->rings[i].local_port);
             xen_9pdev->rings[i].evtchndev = NULL;
         }
-    }
-}
-
-static int xen_9pfs_free(struct XenLegacyDevice *xendev)
-{
-    Xen9pfsDev *xen_9pdev = container_of(xendev, Xen9pfsDev, xendev);
-    int i;
-
-    if (xen_9pdev->rings[0].evtchndev != NULL) {
-        xen_9pfs_disconnect(xendev);
-    }
-
-    for (i = 0; i < xen_9pdev->num_rings; i++) {
         if (xen_9pdev->rings[i].data != NULL) {
             xen_be_unmap_grant_refs(&xen_9pdev->xendev,
                                     xen_9pdev->rings[i].data,
                                     xen_9pdev->rings[i].intf->ref,
                                     (1 << xen_9pdev->rings[i].ring_order));
+            xen_9pdev->rings[i].data = NULL;
         }
         if (xen_9pdev->rings[i].intf != NULL) {
             xen_be_unmap_grant_ref(&xen_9pdev->xendev,
                                    xen_9pdev->rings[i].intf,
                                    xen_9pdev->rings[i].ref);
+            xen_9pdev->rings[i].intf = NULL;
         }
         if (xen_9pdev->rings[i].bh != NULL) {
             qemu_bh_delete(xen_9pdev->rings[i].bh);
+            xen_9pdev->rings[i].bh = NULL;
         }
     }
 
     g_free(xen_9pdev->id);
+    xen_9pdev->id = NULL;
     g_free(xen_9pdev->tag);
+    xen_9pdev->tag = NULL;
     g_free(xen_9pdev->path);
+    xen_9pdev->path = NULL;
     g_free(xen_9pdev->security_model);
+    xen_9pdev->security_model = NULL;
     g_free(xen_9pdev->rings);
+    xen_9pdev->rings = NULL;
+    return;
+}
+
+static int xen_9pfs_free(struct XenLegacyDevice *xendev)
+{
+    trace_xen_9pfs_free(xendev->name);
+
     return 0;
 }
 
@@ -390,6 +396,8 @@ static int xen_9pfs_connect(struct XenLegacyDevice *xendev)
     V9fsState *s = &xen_9pdev->state;
     QemuOpts *fsdev;
 
+    trace_xen_9pfs_connect(xendev->name);
+
     if (xenstore_read_fe_int(&xen_9pdev->xendev, "num-rings",
                              &xen_9pdev->num_rings) == -1 ||
         xen_9pdev->num_rings > MAX_RINGS || xen_9pdev->num_rings < 1) {
@@ -499,6 +507,8 @@ out:
 
 static void xen_9pfs_alloc(struct XenLegacyDevice *xendev)
 {
+    trace_xen_9pfs_alloc(xendev->name);
+
     xenstore_write_be_str(xendev, "versions", VERSIONS);
     xenstore_write_be_int(xendev, "max-rings", MAX_RINGS);
     xenstore_write_be_int(xendev, "max-ring-page-order", MAX_RING_ORDER);
-- 
2.40.1


