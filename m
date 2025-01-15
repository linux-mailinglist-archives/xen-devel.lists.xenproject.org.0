Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A840A128C9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 17:36:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872759.1283765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6Mw-0003rY-Uq; Wed, 15 Jan 2025 16:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872759.1283765; Wed, 15 Jan 2025 16:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6Mw-0003mO-RM; Wed, 15 Jan 2025 16:35:50 +0000
Received: by outflank-mailman (input) for mailman id 872759;
 Wed, 15 Jan 2025 16:35:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mU8/=UH=desiato.srs.infradead.org=BATV+7322ae3fcc6f32da564c+7815+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tY6Mu-0003VS-Cf
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 16:35:50 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5f8f984-d35e-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 17:35:47 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tY6Mr-0000000Atae-15pM; Wed, 15 Jan 2025 16:35:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tY6Mp-00000001Hhg-3xaR; Wed, 15 Jan 2025 16:35:43 +0000
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
X-Inumbo-ID: c5f8f984-d35e-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=j2gaDkDHKbVHS9ffxI7464SULQ6IWC/ZhoSg1yVGsXA=; b=PeIQDQ2Os1lTg7OqknjIA7QozH
	r95h74GMusKTSGt5oYuE2CJm7MFHLsNnioMi5oraYSOUyq2eiNWLidPTDZPa06ES/C3TpOrK2P6H0
	cMJj25O2dCrELtMJGXa/49tD/ukdrqsn6ntY7FPX11zBM82g4cFYj+7k5yhHbYvjqvCBCu8cv2dTN
	QDh77Wr1fACIYff6jDWxXVqAiQ0ggtVbtTTppfk8JqUbibrB2RxwMJS7f/1cYpULjjelQyRG4mSBt
	TwBg3LhhWI1eN1HgeXj/o0hY84N+Ply2TwazP6gH5e5Uyv4X0vIOEMruvEIe8mgM2vx1La6qFTCKX
	tUPDR49A==;
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
Subject: [PATCH v3 3/7] hw/xen: Use xs_node_read() from xs_node_vscanf()
Date: Wed, 15 Jan 2025 16:27:21 +0000
Message-ID: <20250115163542.291424-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250115163542.291424-1-dwmw2@infradead.org>
References: <20250115163542.291424-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Reduce some duplication.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
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
index 22fd2f6c1a..288fad422b 100644
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


