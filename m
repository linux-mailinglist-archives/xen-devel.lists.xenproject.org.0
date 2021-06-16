Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9237C3A9B0E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142937.263613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1E-0007l4-Kk; Wed, 16 Jun 2021 12:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142937.263613; Wed, 16 Jun 2021 12:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1E-0007h6-FV; Wed, 16 Jun 2021 12:51:44 +0000
Received: by outflank-mailman (input) for mailman id 142937;
 Wed, 16 Jun 2021 12:51:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1D-00075D-3i
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:51:43 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.171])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71b8fcae-6fc2-487b-a5d1-2823a9646c44;
 Wed, 16 Jun 2021 12:51:42 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpatlu
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:36 +0200 (CEST)
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
X-Inumbo-ID: 71b8fcae-6fc2-487b-a5d1-2823a9646c44
ARC-Seal: i=1; a=rsa-sha256; t=1623847896; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gg+/47bZpm4YB6I1hv7GH0kgAMdek5epu5Z7Cwt0HbMxD0mv2NJDtrvIS/eJUdH9Qd
    ZiybM/Yt17xfoQGSa6wYbBmqLbvB/pxNUvndEP6KTGsfIsS2ZG79Dk4RxrTmHibYjcg+
    8H/ZbGhHgEgAfQpexEViICbi8NheNQKlRTo6bnXMe5tL99sE109F2PIuLdKZ9tnBeqSi
    wMxb2h9te3iLP/zkRNGQmdCKG1H/zGt/P4NOCkz+VmpUTa83mfwcJ5HTYBZGmm7MaM2F
    qgOy+5DoQ4CjvBjEszbAb5COq8CDl7PDPyEsrSTM/78MGURuE2fdHQlt6M+Gshkh1Gn5
    o0RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847896;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=2reXKEzUM07y7ty9jLpkdpjD7wjbIcJf0B0ZkXQLZnc=;
    b=noUc6A2hE/RWnNf1+XuBctR6/Mytab/IRCwImeUw18mDKqqnrgPeu+7MzVAvTB03hN
    rEG688W0NlVcQRBaYy6Lx/ih5DbKkOm7LcTXbawrnGuboA2OvUYtJiSNv8rfA3773O3Q
    FG+lDUuyEyReBBaa4Wx0tQNf6HoKwYZRl5ftbwll1RvFF45WGuXOLWNDA7sDV0eOtB/1
    Nb3Ghmo2E8Hnz9q8F66AKHYAHzqT+ZyQbr3Rkh+UI31AP5Iwez/4yF/tGli4H5B66v0d
    uR4yhi3ZQNL0J6rwVlPstvmlnkuQr7yD9d1V0DbaGaPdXlwd1gR9PhLIhC23bd+t/b0c
    7qKw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847896;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=2reXKEzUM07y7ty9jLpkdpjD7wjbIcJf0B0ZkXQLZnc=;
    b=oQ6Ua7JrtYUy0TVkX1AMIVu4rj1i2r4SR9AoWp9b1P2B8U13DXbBSJMBR1axLkAq/7
    u968g+YGpSbMeujc1bTK8kmN5rcz9zy5evUojInagHDIigYu2pFDVMZEJwCCsPexyo79
    gXg6U+cySyKwRQ8VCOD40ZcLDKp5skuPUBwzpVvMC5SJUgdR/jqlX0qfE+1Udjq1azjx
    MZZWpYrpNJ5HarkwBph81RsEAT8bNLapCjGooGmxCK6eSMdc4Uo+HoiSuw7wbrTCqayh
    48CKdAPnvWtLLIq96r6KB8UwyBMN2NeOjAPM6NbPzCdRskFRCfz8tI/c9HnhQUG9oXvA
    irHA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210616 06/36] tools: add readv_exact to libxenctrl
Date: Wed, 16 Jun 2021 14:50:59 +0200
Message-Id: <20210616125129.26563-7-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read a batch of iovec's.

Short reads are the common case, finish the trailing iov with read_exact.

Signed-off-by: Olaf Hering <olaf@aepfle.de>

v2:
- add comment to short-read handling
---
 tools/libs/ctrl/xc_private.c | 57 +++++++++++++++++++++++++++++++++++-
 tools/libs/ctrl/xc_private.h |  1 +
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index d94f846686..da58c3d9ba 100644
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
@@ -675,6 +690,46 @@ int writev_exact(int fd, const struct iovec *iov, int iovcnt)
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
+
+        /* Finish a potential short read in the last iov */
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
index 3e299b943f..66086ef19f 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -410,6 +410,7 @@ int xc_flush_mmu_updates(xc_interface *xch, struct xc_mmu *mmu);
 
 /* Return 0 on success; -1 on error setting errno. */
 int read_exact(int fd, void *data, size_t size); /* EOF => -1, errno=0 */
+int readv_exact(int fd, const struct iovec *iov, int iovcnt);
 int write_exact(int fd, const void *data, size_t size);
 int writev_exact(int fd, const struct iovec *iov, int iovcnt);
 

