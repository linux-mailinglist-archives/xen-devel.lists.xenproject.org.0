Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4637C29D065
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 15:43:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13652.34393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXmeK-0001lI-86; Wed, 28 Oct 2020 14:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13652.34393; Wed, 28 Oct 2020 14:42:04 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXmeK-0001kw-4B; Wed, 28 Oct 2020 14:42:04 +0000
Received: by outflank-mailman (input) for mailman id 13652;
 Wed, 28 Oct 2020 14:42:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LDgn=ED=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kXmeI-0001kr-DZ
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 14:42:02 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.50])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5913529-7f87-422a-ba3a-c01e20b04d8c;
 Wed, 28 Oct 2020 14:42:01 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.2.3 DYNA|AUTH)
 with ESMTPSA id D03373w9SEft5Qr
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 28 Oct 2020 15:41:55 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LDgn=ED=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kXmeI-0001kr-DZ
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 14:42:02 +0000
X-Inumbo-ID: b5913529-7f87-422a-ba3a-c01e20b04d8c
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.50])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b5913529-7f87-422a-ba3a-c01e20b04d8c;
	Wed, 28 Oct 2020 14:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603896120;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
	Subject:Sender;
	bh=XGMXWyKz1a6XbgxmdFwWHpBc+hSLcSTn76PjFu99oLk=;
	b=YD6L6I30OHrZJhi1mREDCnJ3RJN/XGRs+SKb6x17Z9PRu8vWG3BXyvIDPyCh7hIypP
	KcX9m3ylr4BSqZcwVXh3jeDtBDNq9g2UBdbHXVOtfS08CG8/rEHFN2p5B/aot1xtUxfh
	wN8qdHUX1Hb8xnVvE/jYr/tyijrRbSew0sIHhurKE5Ry40eodybHSSnvOsc/mIH2EkJ2
	3PL6vIn2Yt/5MrzQdJij2S07V08ybUIkX/AS1cNeEKC+eRo9H6G2tPMlhHcDiC9x4FD7
	3HhczWeC92vQsAAeCu8h8vEeQ4YrR4A2F/rZb17oLWtTcZZ/FrXuBEusgmLXZiqQ3LV7
	BL8Q==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.2.3 DYNA|AUTH)
	with ESMTPSA id D03373w9SEft5Qr
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Wed, 28 Oct 2020 15:41:55 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] tools: add readv_exact to xenctrl
Date: Wed, 28 Oct 2020 15:41:51 +0100
Message-Id: <20201028144151.2766-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read a batch of iovec's.

In the common case of short reads, finish individual iov's with read_exact.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---

Users will follow, next month probably.

 tools/libs/ctrl/xc_private.c | 54 +++++++++++++++++++++++++++++++++++-
 tools/libs/ctrl/xc_private.h |  1 +
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index d94f846686..a86ed213a5 100644
--- a/tools/libs/ctrl/xc_private.c
+++ b/tools/libs/ctrl/xc_private.c
@@ -659,8 +659,22 @@ int write_exact(int fd, const void *data, size_t size)
 
 #if defined(__MINIOS__)
 /*
- * MiniOS's libc doesn't know about writev(). Implement it as multiple write()s.
+ * MiniOS's libc doesn't know about readv/writev(). Implement it as multiple write()s.
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
@@ -675,6 +689,44 @@ int writev_exact(int fd, const struct iovec *iov, int iovcnt)
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
 

