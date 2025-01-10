Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAF6A08D3E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 11:03:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869405.1280878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWBrZ-0004b2-Fr; Fri, 10 Jan 2025 10:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869405.1280878; Fri, 10 Jan 2025 10:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWBrZ-0004WE-7a; Fri, 10 Jan 2025 10:03:33 +0000
Received: by outflank-mailman (input) for mailman id 869405;
 Fri, 10 Jan 2025 10:03:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ds0=UC=desiato.srs.infradead.org=BATV+4d36ee5d223a5d86d66e+7810+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tWBrX-0004A1-Pp
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 10:03:31 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24910789-cf3a-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 11:03:30 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tWBrT-00000009jwj-47G9; Fri, 10 Jan 2025 10:03:28 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tWBrS-00000002D80-3VgZ; Fri, 10 Jan 2025 10:03:26 +0000
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
X-Inumbo-ID: 24910789-cf3a-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=KN/vJ32gBbSAX8GZerq/muMhqjU/qftUYdnqn8Z6Yn0=; b=KK+jmkp9uMAfKbBP17zM/QXfAh
	bODMZmPFLFjv6iKOGFosxjVZNvA4lDeColIFClm+nfxYwYJW6jVo1f3vmK4LVD7Vor2WN9ft6yGFS
	H2acwxNQyNkIZhsc7Y1E+Hcd9aZwaBdiqhpPBpzDKA1sRCum8YuvWK2y29C9v9rhaZV+YhgASmgeI
	AsIL+GYs2g/ggXEQnvCimZXqJHfpVIl7Nisvr5J9uHQHHqVuFihdNqCAVCMjw6nQH2pEPq34V93Cj
	PWWaLex2e/v0iNzRQ13NYiMI48qra5xCsCSn29zS5BIA85x0/PVhZkrGhqpTHYN5/HCuzfG42YILW
	1j8WK14Q==;
From: David Woodhouse <dwmw2@infradead.org>
To: Roger Pau Monne <roger.pau@citrix.com>,
	qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org
Subject: [PATCH 1/4] hw/xen: Use xs_node_read() from xs_node_vscanf()
Date: Fri, 10 Jan 2025 10:03:23 +0000
Message-ID: <20250110100326.527101-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <fc9b22c55eaaa79a3ef9829c270bc4b4e93be7a0.camel@infradead.org>
References: <fc9b22c55eaaa79a3ef9829c270bc4b4e93be7a0.camel@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Reduce some duplication.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xen/trace-events     |  1 -
 hw/xen/xen-bus-helper.c | 15 ++++++---------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index 461dee7b23..b67942d07b 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -38,7 +38,6 @@ xen_device_remove_watch(const char *type, char *name, const char *node, const ch
 xs_node_create(const char *node) "%s"
 xs_node_destroy(const char *node) "%s"
 xs_node_vprintf(char *path, char *value) "%s %s"
-xs_node_vscanf(char *path, char *value) "%s %s"
 xs_node_read(const char *path, const char *value) "%s %s"
 xs_node_watch(char *path) "%s"
 xs_node_unwatch(char *path) "%s"
diff --git a/hw/xen/xen-bus-helper.c b/hw/xen/xen-bus-helper.c
index 0fba7946c5..57697799f3 100644
--- a/hw/xen/xen-bus-helper.c
+++ b/hw/xen/xen-bus-helper.c
@@ -105,25 +105,22 @@ int xs_node_vscanf(struct qemu_xs_handle *h,  xs_transaction_t tid,
                    const char *node, const char *key, Error **errp,
                    const char *fmt, va_list ap)
 {
-    char *path, *value;
+    char *value;
     int rc;
 
-    path = (strlen(node) != 0) ? g_strdup_printf("%s/%s", node, key) :
-        g_strdup(key);
-    value = qemu_xen_xs_read(h, tid, path, NULL);
-
-    trace_xs_node_vscanf(path, value);
+    if (node && strlen(node) != 0) {
+        value = xs_node_read(h, tid, NULL, errp, "%s/%s", node, key);
+    } else {
+        value = xs_node_read(h, tid, NULL, errp, "%s", key);
+    }
 
     if (value) {
         rc = vsscanf(value, fmt, ap);
     } else {
-        error_setg_errno(errp, errno, "failed to read from '%s'",
-                         path);
         rc = EOF;
     }
 
     free(value);
-    g_free(path);
 
     return rc;
 }
-- 
2.47.0


