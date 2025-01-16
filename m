Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52065A135AE
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 09:44:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873234.1284179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLTk-0004Ep-6a; Thu, 16 Jan 2025 08:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873234.1284179; Thu, 16 Jan 2025 08:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLTk-0004Bw-2i; Thu, 16 Jan 2025 08:43:52 +0000
Received: by outflank-mailman (input) for mailman id 873234;
 Thu, 16 Jan 2025 08:43:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jK+=UI=casper.srs.infradead.org=BATV+cabf69696ff47aa9dee2+7816+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tYLTg-0004BI-S8
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 08:43:50 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff9e2857-d3e5-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 09:43:46 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tYLTc-0000000AkbC-3UJK; Thu, 16 Jan 2025 08:43:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tYLTc-00000007pHh-2K0i; Thu, 16 Jan 2025 08:43:44 +0000
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
X-Inumbo-ID: ff9e2857-d3e5-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=DR5mFAf4m4LBhzxhAqxWzplLWjQI40VGtvjtZ6+t6c4=; b=RWoIb912hQmTElYRyXcO6i7n/6
	7aQ9mKlddz4vnYA/tzUwlragwZcQDpyLdZkOYQnx8QY0PAzPrbo/hFyjICLNx3nX5LK9sdaCEnkYc
	ibJ5bH5g9pycHzKmZKbT669twWv62Tj28hLXUCyVEebvwnvm4GnObo2c7OOK+s6st3nY9Lb6MQSI6
	F3DZ2j8vrn+TZ1sBjPjnYFrB5ZG3DYRJrH8+zBq3keHAVzKms0GxU7ZR241ztLkCkdifRfCxHVOho
	erHBwyIjIDYQMok8bacin7Vczk5KiVXXyGBZczbCYCUG1+gk3lHW2T01z7ILoGDU/kIJ4kjcQmLYW
	PsynnlsQ==;
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
	Roger Pau Monne <roger.pau@citrix.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PULL 2/8] xen: do not use '%ms' scanf specifier
Date: Thu, 16 Jan 2025 08:43:26 +0000
Message-ID: <20250116084332.1864967-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250116084332.1864967-1-dwmw2@infradead.org>
References: <20250116084332.1864967-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: Roger Pau Monne <roger.pau@citrix.com>

The 'm' parameter used to request auto-allocation of the destination variable
is not supported on FreeBSD, and as such leads to failures to parse.

What's more, the current usage of '%ms' with xs_node_scanf() is pointless, as
it just leads to a double allocation of the same string.  Instead use
xs_node_read() to read the whole xenstore node.

Fixes: a783f8ad4ec9 ('xen: add a mechanism to automatically create XenDevice-s...')
Fixes: 9b7737469080 ('hw/xen: update Xen console to XenDevice model')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
 hw/block/xen-block.c     |  3 ++-
 hw/char/xen_console.c    |  6 ++++--
 hw/xen/xen-bus.c         | 14 ++++++++++++--
 include/hw/xen/xen-bus.h |  1 +
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 306d38927c..034a18b70e 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -239,7 +239,8 @@ static void xen_block_connect(XenDevice *xendev, Error **errp)
         return;
     }
 
-    if (xen_device_frontend_scanf(xendev, "protocol", "%ms", &str) != 1) {
+    str = xen_device_frontend_read(xendev, "protocol");
+    if (!str) {
         /* x86 defaults to the 32-bit protocol even for 64-bit guests. */
         if (object_dynamic_cast(OBJECT(qdev_get_machine()), "x86-machine")) {
             protocol = BLKIF_PROTOCOL_X86_32;
diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index ef0c2912ef..cb39b21504 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -550,7 +550,8 @@ static void xen_console_device_create(XenBackendInstance *backend,
         goto fail;
     }
 
-    if (xs_node_scanf(xsh, XBT_NULL, fe, "type", errp, "%ms", &type) != 1) {
+    type = xs_node_read(xsh, XBT_NULL, NULL, errp, "%s/%s", fe, "type");
+    if (!type) {
         error_prepend(errp, "failed to read console device type: ");
         goto fail;
     }
@@ -568,7 +569,8 @@ static void xen_console_device_create(XenBackendInstance *backend,
 
     snprintf(label, sizeof(label), "xencons%ld", number);
 
-    if (xs_node_scanf(xsh, XBT_NULL, fe, "output", NULL, "%ms", &output) == 1) {
+    output = xs_node_read(xsh, XBT_NULL, NULL, NULL, "%s/%s", fe, "output");
+    if (output) {
         /*
          * FIXME: sure we want to support implicit
          * muxed monitors here?
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index adfc4efad0..feeb612681 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -156,8 +156,8 @@ again:
             !strcmp(key[i], "hotplug-status"))
             continue;
 
-        if (xs_node_scanf(xenbus->xsh, tid, path, key[i], NULL, "%ms",
-                          &val) == 1) {
+        val = xs_node_read(xenbus->xsh, tid, NULL, NULL, "%s/%s", path, key[i]);
+        if (val) {
             qdict_put_str(opts, key[i], val);
             free(val);
         }
@@ -650,6 +650,16 @@ int xen_device_frontend_scanf(XenDevice *xendev, const char *key,
     return rc;
 }
 
+char *xen_device_frontend_read(XenDevice *xendev, const char *key)
+{
+    XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
+
+    g_assert(xenbus->xsh);
+
+    return xs_node_read(xenbus->xsh, XBT_NULL, NULL, NULL, "%s/%s",
+                        xendev->frontend_path, key);
+}
+
 static void xen_device_frontend_set_state(XenDevice *xendev,
                                           enum xenbus_state state,
                                           bool publish)
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 38d40afa37..2adb2af839 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -91,6 +91,7 @@ void xen_device_frontend_printf(XenDevice *xendev, const char *key,
 int xen_device_frontend_scanf(XenDevice *xendev, const char *key,
                               const char *fmt, ...)
     G_GNUC_SCANF(3, 4);
+char *xen_device_frontend_read(XenDevice *xendev, const char *key);
 
 void xen_device_set_max_grant_refs(XenDevice *xendev, unsigned int nr_refs,
                                    Error **errp);
-- 
2.47.0


