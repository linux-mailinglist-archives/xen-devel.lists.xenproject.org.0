Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D29A128C3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 17:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872760.1283780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6My-0004Fr-7H; Wed, 15 Jan 2025 16:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872760.1283780; Wed, 15 Jan 2025 16:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6My-0004DL-2B; Wed, 15 Jan 2025 16:35:52 +0000
Received: by outflank-mailman (input) for mailman id 872760;
 Wed, 15 Jan 2025 16:35:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mU8/=UH=desiato.srs.infradead.org=BATV+7322ae3fcc6f32da564c+7815+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tY6Mw-0003VS-81
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 16:35:50 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5f91422-d35e-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 17:35:47 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tY6Mr-0000000Ataf-15Qx; Wed, 15 Jan 2025 16:35:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tY6Mq-00000001Hi4-0h5i; Wed, 15 Jan 2025 16:35:44 +0000
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
X-Inumbo-ID: c5f91422-d35e-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1aNikVIiBjTeQOc5N3unG1HCtdVZT5mT/c2k8TAmHbo=; b=g7RIvTdwfF6e4rW5vzi8S7NKNH
	XHUKR9LWw4GRosTHdZgCh+g/KQs3mO9W1vMr5526JtvQXPCRQJ24U09J3573Z6Yb509OZNq9rV/DW
	SQr2ejpnTxb4jWrBPDBwZlqtN2nSyAGH3syIaN0jptlD7ROWmrYOv3hKC5weTQIMWbhB9i0eaivqK
	wQ1uEpf9xHO5kNd04T2ZiUw1eZdqCbH5L/AiN8UOhPSKj8qt9UFd9hYSHNLvTM2MuoFGAtnD1Nr+n
	lJAdLxQdNiGd6MDj64GxGPGlAoGOypw1w1xyS/EUl1zKii6goQ1qG06Ljnur8MWHk8ZbJ/EfBapOl
	iT7Y85ZA==;
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
Subject: [PATCH v3 7/7] hw/xen: Fix errp handling in xen_console
Date: Wed, 15 Jan 2025 16:27:25 +0000
Message-ID: <20250115163542.291424-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250115163542.291424-1-dwmw2@infradead.org>
References: <20250115163542.291424-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

When attempting to read the 'output' node, interpret any error *other*
than ENOENT as a fatal error. For ENOENT, fall back to serial_hd() to
find a character device, or create a null device.

Do not attempt to prepend to errp when serial_hd() fails; the error
isn't relevant (and prior to this change, wasn't set anyway).

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/char/xen_console.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index e61902461b..9e7f6da343 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -569,7 +569,7 @@ static void xen_console_device_create(XenBackendInstance *backend,
 
     snprintf(label, sizeof(label), "xencons%ld", number);
 
-    output = xs_node_read(xsh, XBT_NULL, NULL, NULL, "%s/%s", fe, "output");
+    output = xs_node_read(xsh, XBT_NULL, NULL, errp, "%s/%s", fe, "output");
     if (output) {
         /*
          * FIXME: sure we want to support implicit
@@ -581,19 +581,27 @@ static void xen_console_device_create(XenBackendInstance *backend,
                        output);
             goto fail;
         }
-    } else if (number) {
-        cd = serial_hd(number);
-        if (!cd) {
-            error_prepend(errp, "console: No serial device #%ld found: ",
-                          number);
-            goto fail;
-        }
+    } else if (errno != ENOENT) {
+        error_prepend(errp, "console: No valid chardev found: ");
+        goto fail;
     } else {
-        /* No 'output' node on primary console: use null. */
-        cd = qemu_chr_new(label, "null", NULL);
-        if (!cd) {
-            error_setg(errp, "console: failed to create null device");
-            goto fail;
+        if (errp) {
+            error_free(*errp);
+        }
+        if (number) {
+            cd = serial_hd(number);
+            if (!cd) {
+                error_setg(errp, "console: No serial device #%ld found: ",
+                           number);
+                goto fail;
+            }
+        } else {
+            /* No 'output' node on primary console: use null. */
+            cd = qemu_chr_new(label, "null", NULL);
+            if (!cd) {
+                error_setg(errp, "console: failed to create null device");
+                goto fail;
+            }
         }
     }
 
-- 
2.47.0


