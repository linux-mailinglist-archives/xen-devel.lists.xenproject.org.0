Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E010039779A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134981.251013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zU-0006Ej-0H; Tue, 01 Jun 2021 16:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134981.251013; Tue, 01 Jun 2021 16:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zT-0006AW-Se; Tue, 01 Jun 2021 16:11:39 +0000
Received: by outflank-mailman (input) for mailman id 134981;
 Tue, 01 Jun 2021 16:11:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zS-0005Ec-0h
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:11:38 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.50])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7821914-ffaa-48dd-966b-98d1e9215484;
 Tue, 01 Jun 2021 16:11:31 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBR1B9
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:27 +0200 (CEST)
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
X-Inumbo-ID: b7821914-ffaa-48dd-966b-98d1e9215484
ARC-Seal: i=1; a=rsa-sha256; t=1622563887; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YjmQDA4/eh3J54LS6IB/jTUMgrucmiljDftMd5EfbbEYqO7565Xc5Z0QceBEhFaguu
    FA6KyT2U+N//foL6O6GZjxkepQgFvqy94h9RaRNOJKE8hllGOVRcYiJ/1gZgpMJN0j1u
    VgQUUjwce13nf6EZgmqJK6KcwnfvUHAlH4H4Y3N5qz3wi4OPo51IWmYR46EzUCv9D2Zb
    J0Xno6qVUBuAcLkG9cqy2w3qDxUkP0/xo3r/9Fb2fiJtxMOXY9X/csSR6c/3dX+sLqfe
    PzU6L13ebt4VXJrWg9q+EJ23yU8zHk3mMkzf3xoUiUSZLy2VHBDKN0lxxe2MNicJqjgF
    C9ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563887;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=5m93ctia/WnTzxirdrXBAXbAAhmoz3AnrSBGz7krrzI=;
    b=hvRDmt8H5FRof7n8T1KREYMwr4EyVRPtnWlsjqHTb/OoQ16P6xmPM9ZnRLnH2d+p7o
    r9ddcdQUyFSU8Baptt58b+ojz0976r30YMAzDEnUN9I5HIrjnQs2foYO+bpTSWB/kIIT
    Vc09t2YPC5uRl7zPnBFVp4cSkFq20jDGAAvLT6SjvykWKYLB+tlpeGrzJ/VG1jfxguDe
    lbNdHU3vJYme5kU8Etm/GNgEpw0KgUNIRPpgwt7zqrXaXThz173ZxZU3JGnAtgazvD4b
    kqcb/a3P5km9vBa76oDN8tIdori3xicH63GzUqeELh52ycHVBat4pQsFj0/jpU727CDD
    D91A==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563887;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=5m93ctia/WnTzxirdrXBAXbAAhmoz3AnrSBGz7krrzI=;
    b=CVYEABEVitHSu0luEGCRyaL9r4GPwpYcPYWWs4a6AYZW1RfpRK/sGrVPWJesz/R8sF
    9QnWK/4XTsWBD/kAFUhbW3MXZeOWRzsaKD5HNTr7ieXdVu3jV75j0d4eRrS7rR5W0Af2
    1Kb2Wo0QWRv6fTPSgO+bcwnUuG2xXS3vdjokRQZhCOvBKMpKE7SfhKQwwDBaVKROrS+p
    6Sk/SI93Px8GL6YfSp+dNq/mQAuj4PdzXqrAWYDOxEYAZVUn8Q+CKdj0aBZ+tLEmqJ9/
    Gn8sNYy8+hkoHiYDpH/6RFDPriv0F9CXWOb/OvON1lgjsl+CtRpsv/WXOSLapuRij71v
    PgdA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 04/38] tools: add readv_exact to libxenctrl
Date: Tue,  1 Jun 2021 18:10:44 +0200
Message-Id: <20210601161118.18986-5-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
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
 

