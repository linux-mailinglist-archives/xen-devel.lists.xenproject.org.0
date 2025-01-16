Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3D4A135AF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 09:44:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873240.1284225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLTm-000566-NC; Thu, 16 Jan 2025 08:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873240.1284225; Thu, 16 Jan 2025 08:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLTm-0004th-G0; Thu, 16 Jan 2025 08:43:54 +0000
Received: by outflank-mailman (input) for mailman id 873240;
 Thu, 16 Jan 2025 08:43:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jK+=UI=casper.srs.infradead.org=BATV+cabf69696ff47aa9dee2+7816+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tYLTj-0004BJ-Ee
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 08:43:51 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff7a2145-d3e5-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 09:43:47 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tYLTd-0000000AkbX-0VhX; Thu, 16 Jan 2025 08:43:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tYLTc-00000007pIG-3SiW; Thu, 16 Jan 2025 08:43:44 +0000
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
X-Inumbo-ID: ff7a2145-d3e5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=rf4XQLZvATxaJ4ZS360lOa75wV7gwRBU9Wx/NrfpNKM=; b=sFlr5bcNd4N4BJ5gR3Jk2RMuSZ
	5ueFpFbkgmzLDSSjXJ4F7E+VBxywP+JIRlQoRKp3wkAY8M1RXh+2AgFkdaR0I+RJ/HbnrYMA+Z0zU
	2lmxNsy2Qy/lJdQ9rSRQOyDus7jTuvUOxbVmPxnvd+PQKO1ZzaiVWnoNH0DVgLxdULgr2CX7e6mvu
	QrD2RyTvgL5O6bdVak0nEQCYiMG6AHb8ODInb95f1z/eiaN9PgRwMoW9LxHdxLVJTzHvEJkOKa99m
	RL0y+rCcqZpKVNodam5HJp2Ry+5gdt3tdeSL9bekAURJVRyjXefSwKZWd44xr0u1/xBMze+9o1USG
	+58fvVNg==;
From: David Woodhouse <dwmw2@infradead.org>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
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
	qemu-block@nongnu.org,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PULL 7/8] hw/xen: Fix errp handling in xen_console
Date: Thu, 16 Jan 2025 08:43:31 +0000
Message-ID: <20250116084332.1864967-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250116084332.1864967-1-dwmw2@infradead.org>
References: <20250116084332.1864967-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

When attempting to read the 'output' node, interpret any error *other*
than ENOENT as a fatal error. For ENOENT, fall back to serial_hd() to
find a character device, or create a null device.

Do not attempt to prepend to errp when serial_hd() fails; the error
isn't relevant (and prior to this change, wasn't set anyway).

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
 hw/char/xen_console.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index e61902461b..d03c188d1d 100644
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
+        error_free(*errp);
+        *errp = NULL;
+
+        if (number) {
+            cd = serial_hd(number);
+            if (!cd) {
+                error_setg(errp, "console: No serial device #%ld found",
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


