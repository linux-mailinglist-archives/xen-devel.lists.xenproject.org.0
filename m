Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB32C2F1CBA
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65107.115282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DL-0002li-EE; Mon, 11 Jan 2021 17:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65107.115282; Mon, 11 Jan 2021 17:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DL-0002km-8p; Mon, 11 Jan 2021 17:42:47 +0000
Received: by outflank-mailman (input) for mailman id 65107;
 Mon, 11 Jan 2021 17:42:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1DJ-0002aB-Oe
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:42:45 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.84])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 600a19f3-5a87-4ffe-a35e-cb644ab77342;
 Mon, 11 Jan 2021 17:42:36 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgVM3O
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:31 +0100 (CET)
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
X-Inumbo-ID: 600a19f3-5a87-4ffe-a35e-cb644ab77342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386955;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=5m93ctia/WnTzxirdrXBAXbAAhmoz3AnrSBGz7krrzI=;
	b=QZwVtYGwHGjQhie9XA7xJdBjSUpm1Fi5dnCmV9p4sRqonqZamNfi4o2xMqrSqR03qA
	WI2SVEE1h0hBMV1WQP7BmtIJgJqX9hz7PR1Btl3gtscH7e8JmdfHbQ5sgOGW4uC3XYat
	PsNEj9N0AAsgUOTvu0LgSe5ZKjJcGI91Vp65UFoHx3/MVRSLfOt7Q3KQbK0vG9AmHBns
	S5xea2p8OdiG3jdUg5f868WINHCAkqZd6SN6cnum7n1rxuPrDSeV2jZ0KgM7F+73/4Sk
	Qn/Qsd/p4KXtRJr1fDFdOGHWg1i4am6RsqxQGkGVPVmQQzC9LRv2YqttyApC1uNKgLSn
	quvA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210111 09/39] tools: add readv_exact to libxenctrl
Date: Mon, 11 Jan 2021 18:41:54 +0100
Message-Id: <20210111174224.24714-10-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read a batch of iovec's.

In the common case of short reads, finish individual iov's with read_exact.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/ctrl/xc_private.c | 55 +++++++++++++++++++++++++++++++++++-
 tools/libs/ctrl/xc_private.h |  1 +
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index d94f846686..ea420b9ba8 100644
--- a/tools/libs/ctrl/xc_private.c
+++ b/tools/libs/ctrl/xc_private.c
@@ -659,8 +659,23 @@ int write_exact(int fd, const void *data, size_t size)
 
 #if defined(__MINIOS__)
 /*
- * MiniOS's libc doesn't know about writev(). Implement it as multiple write()s.
+ * MiniOS's libc doesn't know about readv/writev().
+ * Implement it as multiple read/write()s.
  */
+int readv_exact(int fd, const struct iovec *iov, int iovcnt)
+{
+    int rc, i;
+
+    for ( i = 0; i < iovcnt; ++i )
+    {
+        rc = read_exact(fd, iov[i].iov_base, iov[i].iov_len);
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
+}
+
 int writev_exact(int fd, const struct iovec *iov, int iovcnt)
 {
     int rc, i;
@@ -675,6 +690,44 @@ int writev_exact(int fd, const struct iovec *iov, int iovcnt)
     return 0;
 }
 #else
+int readv_exact(int fd, const struct iovec *iov, int iovcnt)
+{
+    int rc = 0, idx = 0;
+    ssize_t len;
+
+    while ( idx < iovcnt )
+    {
+        len = readv(fd, &iov[idx], min(iovcnt - idx, IOV_MAX));
+        if ( len == -1 && errno == EINTR )
+            continue;
+        if ( len <= 0 )
+        {
+            rc = -1;
+            goto out;
+        }
+        while ( len > 0 && idx < iovcnt )
+        {
+            if ( len >= iov[idx].iov_len )
+            {
+                len -= iov[idx].iov_len;
+            }
+            else
+            {
+                void *p = iov[idx].iov_base + len;
+                size_t l = iov[idx].iov_len - len;
+
+                rc = read_exact(fd, p, l);
+                if ( rc )
+                    goto out;
+                len = 0;
+            }
+            idx++;
+        }
+    }
+out:
+    return rc;
+}
+
 int writev_exact(int fd, const struct iovec *iov, int iovcnt)
 {
     struct iovec *local_iov = NULL;
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index f0b5f83ac8..5d2c7274fb 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -441,6 +441,7 @@ int xc_flush_mmu_updates(xc_interface *xch, struct xc_mmu *mmu);
 
 /* Return 0 on success; -1 on error setting errno. */
 int read_exact(int fd, void *data, size_t size); /* EOF => -1, errno=0 */
+int readv_exact(int fd, const struct iovec *iov, int iovcnt);
 int write_exact(int fd, const void *data, size_t size);
 int writev_exact(int fd, const struct iovec *iov, int iovcnt);
 

