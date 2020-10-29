Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A95629F2D9
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:20:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14412.35598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBb0-0003Mm-5w; Thu, 29 Oct 2020 17:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14412.35598; Thu, 29 Oct 2020 17:20:18 +0000
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
	id 1kYBb0-0003MM-2H; Thu, 29 Oct 2020 17:20:18 +0000
Received: by outflank-mailman (input) for mailman id 14412;
 Thu, 29 Oct 2020 17:20:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYBay-0003MC-Md
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:16 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 548caff4-7b70-4619-80c3-5022562d6d8c;
 Thu, 29 Oct 2020 17:20:15 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THK83f6
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 18:20:08 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYBay-0003MC-Md
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:16 +0000
X-Inumbo-ID: 548caff4-7b70-4619-80c3-5022562d6d8c
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.25])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 548caff4-7b70-4619-80c3-5022562d6d8c;
	Thu, 29 Oct 2020 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992014;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=AJouOKw1M1RuOZDP/M7JpmShmV/UDPt9XmfG61mTqBM=;
	b=b9EoRL0cCnT0G6ceRd2tkuBc8C94KzJHGVcRjuv2TylBtex+NqiUNmZmxZeLdAmS+I
	HLxXRFQ+GIhEA3CuJh76BvDug7R4wEazub58uzPNLJ3XL6c1fAGEAhPeaIWak+KZXJPr
	1uruhvsDVj//YD1r/iOtsJIAhbV4cPcepqNLQmkS2yc6xGYohj+y4KtHYepfSyahTC8L
	9ACpw6en5GVPoWxjNvbAbcKlj/KZHo0IrF71LJomAgTD0Vt5YiqsMep/8XiWy45ys3pB
	Bx8PS9G0bWzx60q3HqhTMVwZmNbMyQJ/DzCtbhVntscZPQdHFBajXslo5LpFD1wJSMEQ
	iDfQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THK83f6
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 18:20:08 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 01/23] tools: add readv_exact to libxenctrl
Date: Thu, 29 Oct 2020 18:19:41 +0100
Message-Id: <20201029172004.17219-2-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read a batch of iovec's.

In the common case of short reads, finish individual iov's with read_exact.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/ctrl/xc_private.c | 54 +++++++++++++++++++++++++++++++++++-
 tools/libs/ctrl/xc_private.h |  1 +
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index d94f846686..a86ed213a5 100644
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
 

