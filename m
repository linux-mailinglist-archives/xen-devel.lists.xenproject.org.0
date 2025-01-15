Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DD6A128C4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 17:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872764.1283820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6N1-0005GF-Mz; Wed, 15 Jan 2025 16:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872764.1283820; Wed, 15 Jan 2025 16:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6N1-0005C3-GV; Wed, 15 Jan 2025 16:35:55 +0000
Received: by outflank-mailman (input) for mailman id 872764;
 Wed, 15 Jan 2025 16:35:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rWPo=UH=casper.srs.infradead.org=BATV+fb641630334796bb9467+7815+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tY6Mz-0003cf-Bo
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 16:35:53 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4c87df8-d35e-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 17:35:45 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tY6Mq-0000000GF6G-0R8I; Wed, 15 Jan 2025 16:35:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tY6Mp-00000001HhS-3ZNZ; Wed, 15 Jan 2025 16:35:43 +0000
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
X-Inumbo-ID: c4c87df8-d35e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=avIVcNVqQ6j0evk6/rCF7dghJGKxSFwtADzqzgfr/dc=; b=CMCvmvfDcdm9LD61HoKq/cRAPv
	i6lBUIect+qUzZMx/qDM3KhyWioS+yXn+XWAZxssNT97ml+5q5DZC/AKzXMmJbi+/BlnOfOZivDTj
	HRfOd4rOdFig6oPCfbzUXV0s3QNqA/ysEzwU/Imm3xaE6/KQlHUFGkL4S6HYGjeS60Tc9F2ms70Z/
	4onciy0CBnQLh5londT61eAMmpkN0ZJaXemMhdglNNsB8MNbqsCH8E1qykMJAfYqBNgnU3KqIzUTN
	H4RS6tbm6SAKmEPNVN6eayfhLuSoDQptjwvM7gYIhDXN7OeqJoyzPrIayk7FTLz4AI6aR0aJaTqqT
	mwOiMB6A==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org
Subject: [PATCH v3 1/7] hw/xen: Add xs_node_read() helper function
Date: Wed, 15 Jan 2025 16:27:19 +0000
Message-ID: <20250115163542.291424-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250115163542.291424-1-dwmw2@infradead.org>
References: <20250115163542.291424-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

This returns the full contents of the node, having created the node path
from the printf-style format string provided in its arguments.

This will save various callers from having to do so for themselves (and
from using xs_node_scanf() with the non-portable %ms format string.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
[remove double newline and constify trace parameters]
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 hw/xen/trace-events             |  1 +
 hw/xen/xen-bus-helper.c         | 22 ++++++++++++++++++++++
 include/hw/xen/xen-bus-helper.h |  9 +++++++++
 3 files changed, 32 insertions(+)

diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index a07fe41c6d..461dee7b23 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -39,6 +39,7 @@ xs_node_create(const char *node) "%s"
 xs_node_destroy(const char *node) "%s"
 xs_node_vprintf(char *path, char *value) "%s %s"
 xs_node_vscanf(char *path, char *value) "%s %s"
+xs_node_read(const char *path, const char *value) "%s %s"
 xs_node_watch(char *path) "%s"
 xs_node_unwatch(char *path) "%s"
 
diff --git a/hw/xen/xen-bus-helper.c b/hw/xen/xen-bus-helper.c
index b2b2cc9c5d..22fd2f6c1a 100644
--- a/hw/xen/xen-bus-helper.c
+++ b/hw/xen/xen-bus-helper.c
@@ -142,6 +142,28 @@ int xs_node_scanf(struct qemu_xs_handle *h,  xs_transaction_t tid,
     return rc;
 }
 
+char *xs_node_read(struct qemu_xs_handle *h, xs_transaction_t tid,
+                   unsigned int *len, Error **errp,
+                   const char *path_fmt, ...)
+{
+    char *path, *value;
+    va_list ap;
+
+    va_start(ap, path_fmt);
+    path = g_strdup_vprintf(path_fmt, ap);
+    va_end(ap);
+
+    value = qemu_xen_xs_read(h, tid, path, len);
+    trace_xs_node_read(path, value);
+    if (!value) {
+        error_setg_errno(errp, errno, "failed to read from '%s'", path);
+    }
+
+    g_free(path);
+
+    return value;
+}
+
 struct qemu_xs_watch *xs_node_watch(struct qemu_xs_handle *h, const char *node,
                                     const char *key, xs_watch_fn fn,
                                     void *opaque, Error **errp)
diff --git a/include/hw/xen/xen-bus-helper.h b/include/hw/xen/xen-bus-helper.h
index d8dcc2f010..e9911115b3 100644
--- a/include/hw/xen/xen-bus-helper.h
+++ b/include/hw/xen/xen-bus-helper.h
@@ -38,6 +38,15 @@ int xs_node_scanf(struct qemu_xs_handle *h,  xs_transaction_t tid,
                   const char *fmt, ...)
     G_GNUC_SCANF(6, 7);
 
+/*
+ * Unlike other functions here, the printf-formatted path_fmt is for
+ * the XenStore path, not the contents of the node.
+ */
+char *xs_node_read(struct qemu_xs_handle *h, xs_transaction_t tid,
+                   unsigned int *len, Error **errp,
+                   const char *path_fmt, ...)
+    G_GNUC_PRINTF(5, 6);
+
 /* Watch node/key unless node is empty, in which case watch key */
 struct qemu_xs_watch *xs_node_watch(struct qemu_xs_handle *h, const char *node,
                                     const char *key, xs_watch_fn fn,
-- 
2.47.0


