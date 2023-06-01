Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DAE71A286
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 17:26:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542625.846736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4kBt-0005t2-NV; Thu, 01 Jun 2023 15:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542625.846736; Thu, 01 Jun 2023 15:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4kBt-0005pn-Hy; Thu, 01 Jun 2023 15:26:17 +0000
Received: by outflank-mailman (input) for mailman id 542625;
 Thu, 01 Jun 2023 15:26:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z77Y=BV=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1q4kBr-0004Rb-HB
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 15:26:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4ffc933-0090-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 17:26:14 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-uDT_KEXNMA2D1W8fWckpaA-1; Thu, 01 Jun 2023 11:26:10 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B4333823A15;
 Thu,  1 Jun 2023 15:26:09 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8F5A112132C;
 Thu,  1 Jun 2023 15:26:08 +0000 (UTC)
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
X-Inumbo-ID: a4ffc933-0090-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685633173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+2jIiSec093zxYLQEOwE5JssP3b16O/dNh3vcZRftBM=;
	b=D5SvOMUkQYxtKKuoo7d8aPj1lek+3p1KfQlEkt5E3FSWFl3luku9Mtw9Q/NLYnfOBESB/D
	HsOcGe2Bp/EYNwpf1dDt4Eb28xn4OkWr0JaG2a0UXOOYSDqlPpoGlgtKwX8pR9XTNItigK
	nDU2gQurIdbJSFMCw2jBbbx2fwG4oFI=
X-MC-Unique: uDT_KEXNMA2D1W8fWckpaA-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Thomas Huth <thuth@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Eric Blake <eblake@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	kvm@vger.kernel.org
Subject: [PULL 7/8] block/blkio: use qemu_open() to support fd passing for virtio-blk
Date: Thu,  1 Jun 2023 11:25:51 -0400
Message-Id: <20230601152552.1603119-8-stefanha@redhat.com>
In-Reply-To: <20230601152552.1603119-1-stefanha@redhat.com>
References: <20230601152552.1603119-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

From: Stefano Garzarella <sgarzare@redhat.com>

Some virtio-blk drivers (e.g. virtio-blk-vhost-vdpa) supports the fd
passing. Let's expose this to the user, so the management layer
can pass the file descriptor of an already opened path.

If the libblkio virtio-blk driver supports fd passing, let's always
use qemu_open() to open the `path`, so we can handle fd passing
from the management layer through the "/dev/fdset/N" special path.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20230530071941.8954-2-sgarzare@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/blkio.c | 53 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 9 deletions(-)

diff --git a/block/blkio.c b/block/blkio.c
index 11be8787a3..527323d625 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -673,25 +673,60 @@ static int blkio_virtio_blk_common_open(BlockDriverState *bs,
 {
     const char *path = qdict_get_try_str(options, "path");
     BDRVBlkioState *s = bs->opaque;
-    int ret;
+    bool fd_supported = false;
+    int fd, ret;
 
     if (!path) {
         error_setg(errp, "missing 'path' option");
         return -EINVAL;
     }
 
-    ret = blkio_set_str(s->blkio, "path", path);
-    qdict_del(options, "path");
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "failed to set path: %s",
-                         blkio_get_error_msg());
-        return ret;
-    }
-
     if (!(flags & BDRV_O_NOCACHE)) {
         error_setg(errp, "cache.direct=off is not supported");
         return -EINVAL;
     }
+
+    if (blkio_get_int(s->blkio, "fd", &fd) == 0) {
+        fd_supported = true;
+    }
+
+    /*
+     * If the libblkio driver supports fd passing, let's always use qemu_open()
+     * to open the `path`, so we can handle fd passing from the management
+     * layer through the "/dev/fdset/N" special path.
+     */
+    if (fd_supported) {
+        int open_flags;
+
+        if (flags & BDRV_O_RDWR) {
+            open_flags = O_RDWR;
+        } else {
+            open_flags = O_RDONLY;
+        }
+
+        fd = qemu_open(path, open_flags, errp);
+        if (fd < 0) {
+            return -EINVAL;
+        }
+
+        ret = blkio_set_int(s->blkio, "fd", fd);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "failed to set fd: %s",
+                             blkio_get_error_msg());
+            qemu_close(fd);
+            return ret;
+        }
+    } else {
+        ret = blkio_set_str(s->blkio, "path", path);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "failed to set path: %s",
+                             blkio_get_error_msg());
+            return ret;
+        }
+    }
+
+    qdict_del(options, "path");
+
     return 0;
 }
 
-- 
2.40.1


