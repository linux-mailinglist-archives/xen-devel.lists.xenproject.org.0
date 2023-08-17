Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0503377FB60
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 17:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585497.916664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWfOq-0005xH-Cl; Thu, 17 Aug 2023 15:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585497.916664; Thu, 17 Aug 2023 15:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWfOq-0005sr-8g; Thu, 17 Aug 2023 15:59:04 +0000
Received: by outflank-mailman (input) for mailman id 585497;
 Thu, 17 Aug 2023 15:59:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmM2=EC=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1qWfOp-0005pM-6d
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 15:59:03 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa8c24ed-3d16-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 17:59:00 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-Aqf6y6l9Nf2qUYwRqraa6A-1; Thu, 17 Aug 2023 11:58:57 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B43F3C0E208;
 Thu, 17 Aug 2023 15:58:56 +0000 (UTC)
Received: from localhost (unknown [10.39.193.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3BEBC15BAE;
 Thu, 17 Aug 2023 15:58:55 +0000 (UTC)
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
X-Inumbo-ID: fa8c24ed-3d16-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692287939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KU9vrLzZd5lCZshDYf3pKEuY+DEkoqOiwgvm1wKjJc0=;
	b=fiRD/esuF7NSwX6d4rUkTJT6MI3SarnCfRBXsnpRkr0l6OKr31ZsIuURIC7dEclzjRcq0o
	4jLDw2i4G7nXFsOcdNgDlhnOntt08NV1pYBbKTsQJGG0pR9xh0hOPkGy4YVfSkZwSpupSP
	eHwELm61jkTIDpcAS8JXy2FMNrI4B/s=
X-MC-Unique: Aqf6y6l9Nf2qUYwRqraa6A-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH v2 2/4] util/defer-call: move defer_call() to util/
Date: Thu, 17 Aug 2023 11:58:45 -0400
Message-ID: <20230817155847.3605115-3-stefanha@redhat.com>
In-Reply-To: <20230817155847.3605115-1-stefanha@redhat.com>
References: <20230817155847.3605115-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

The networking subsystem may wish to use defer_call(), so move the code
to util/ where it can be reused.

As a reminder of what defer_call() does:

This API defers a function call within a defer_call_begin()/defer_call_end()
section, allowing multiple calls to batch up. This is a performance
optimization that is used in the block layer to submit several I/O requests
at once instead of individually:

  defer_call_begin(); <-- start of section
  ...
  defer_call(my_func, my_obj); <-- deferred my_func(my_obj) call
  defer_call(my_func, my_obj); <-- another
  defer_call(my_func, my_obj); <-- another
  ...
  defer_call_end(); <-- end of section, my_func(my_obj) is called once

Suggested-by: Ilya Maximets <i.maximets@ovn.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS                       |  3 ++-
 include/qemu/defer-call.h         | 15 +++++++++++++++
 include/sysemu/block-backend-io.h |  4 ----
 block/blkio.c                     |  1 +
 block/io_uring.c                  |  1 +
 block/linux-aio.c                 |  1 +
 block/nvme.c                      |  1 +
 hw/block/dataplane/xen-block.c    |  1 +
 hw/block/virtio-blk.c             |  1 +
 hw/scsi/virtio-scsi.c             |  1 +
 block/plug.c => util/defer-call.c |  2 +-
 block/meson.build                 |  1 -
 util/meson.build                  |  1 +
 13 files changed, 26 insertions(+), 7 deletions(-)
 create mode 100644 include/qemu/defer-call.h
 rename block/plug.c => util/defer-call.c (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6111b6b4d9..7cd7132ffc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2676,12 +2676,13 @@ S: Supported
 F: util/async.c
 F: util/aio-*.c
 F: util/aio-*.h
+F: util/defer-call.c
 F: util/fdmon-*.c
 F: block/io.c
-F: block/plug.c
 F: migration/block*
 F: include/block/aio.h
 F: include/block/aio-wait.h
+F: include/qemu/defer-call.h
 F: scripts/qemugdb/aio.py
 F: tests/unit/test-fdmon-epoll.c
 T: git https://github.com/stefanha/qemu.git block
diff --git a/include/qemu/defer-call.h b/include/qemu/defer-call.h
new file mode 100644
index 0000000000..291f86c987
--- /dev/null
+++ b/include/qemu/defer-call.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Deferred calls
+ *
+ * Copyright Red Hat.
+ */
+
+#ifndef QEMU_DEFER_CALL_H
+#define QEMU_DEFER_CALL_H
+
+void defer_call_begin(void);
+void defer_call_end(void);
+void defer_call(void (*fn)(void *), void *opaque);
+
+#endif /* QEMU_DEFER_CALL_H */
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index cfcfd85c1d..d174275a5c 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -100,10 +100,6 @@ void blk_iostatus_set_err(BlockBackend *blk, int error);
 int blk_get_max_iov(BlockBackend *blk);
 int blk_get_max_hw_iov(BlockBackend *blk);
 
-void defer_call_begin(void);
-void defer_call_end(void);
-void defer_call(void (*fn)(void *), void *opaque);
-
 AioContext *blk_get_aio_context(BlockBackend *blk);
 BlockAcctStats *blk_get_stats(BlockBackend *blk);
 void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
diff --git a/block/blkio.c b/block/blkio.c
index 7cf6d61f47..0a0a6c0f5f 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -13,6 +13,7 @@
 #include "block/block_int.h"
 #include "exec/memory.h"
 #include "exec/cpu-common.h" /* for qemu_ram_get_fd() */
+#include "qemu/defer-call.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qapi/qmp/qdict.h"
diff --git a/block/io_uring.c b/block/io_uring.c
index 8429f341be..3a1e1f45b3 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -15,6 +15,7 @@
 #include "block/block.h"
 #include "block/raw-aio.h"
 #include "qemu/coroutine.h"
+#include "qemu/defer-call.h"
 #include "qapi/error.h"
 #include "sysemu/block-backend.h"
 #include "trace.h"
diff --git a/block/linux-aio.c b/block/linux-aio.c
index 9a08219db0..62380593c8 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -14,6 +14,7 @@
 #include "block/raw-aio.h"
 #include "qemu/event_notifier.h"
 #include "qemu/coroutine.h"
+#include "qemu/defer-call.h"
 #include "qapi/error.h"
 #include "sysemu/block-backend.h"
 
diff --git a/block/nvme.c b/block/nvme.c
index dfbd1085fd..96b3f8f2fa 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -16,6 +16,7 @@
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
+#include "qemu/defer-call.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index e9dd8f8a99..c4bb28c66f 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/defer-call.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/memalign.h"
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 6a45033d15..a1f8e15522 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/defer-call.h"
 #include "qapi/error.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index c2465e3e88..83c154e74e 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -18,6 +18,7 @@
 #include "standard-headers/linux/virtio_ids.h"
 #include "hw/virtio/virtio-scsi.h"
 #include "migration/qemu-file-types.h"
+#include "qemu/defer-call.h"
 #include "qemu/error-report.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
diff --git a/block/plug.c b/util/defer-call.c
similarity index 99%
rename from block/plug.c
rename to util/defer-call.c
index f26173559c..037dc0abf0 100644
--- a/block/plug.c
+++ b/util/defer-call.c
@@ -22,7 +22,7 @@
 #include "qemu/coroutine-tls.h"
 #include "qemu/notify.h"
 #include "qemu/thread.h"
-#include "sysemu/block-backend.h"
+#include "qemu/defer-call.h"
 
 /* A function call that has been deferred until defer_call_end() */
 typedef struct {
diff --git a/block/meson.build b/block/meson.build
index 529fc172c6..ba20e17acf 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -23,7 +23,6 @@ block_ss.add(files(
   'mirror.c',
   'nbd.c',
   'null.c',
-  'plug.c',
   'qapi.c',
   'qcow2-bitmap.c',
   'qcow2-cache.c',
diff --git a/util/meson.build b/util/meson.build
index a375160286..b9880357aa 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -29,6 +29,7 @@ util_ss.add(when: 'CONFIG_WIN32', if_true: pathcch)
 if glib_has_gslice
   util_ss.add(files('qtree.c'))
 endif
+util_ss.add(files('defer-call.c'))
 util_ss.add(files('envlist.c', 'path.c', 'module.c'))
 util_ss.add(files('host-utils.c'))
 util_ss.add(files('bitmap.c', 'bitops.c'))
-- 
2.41.0


