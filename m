Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 309A7A08D41
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 11:03:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869407.1280888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWBra-0004sJ-3Y; Fri, 10 Jan 2025 10:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869407.1280888; Fri, 10 Jan 2025 10:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWBrZ-0004gv-Ry; Fri, 10 Jan 2025 10:03:33 +0000
Received: by outflank-mailman (input) for mailman id 869407;
 Fri, 10 Jan 2025 10:03:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ds0=UC=desiato.srs.infradead.org=BATV+4d36ee5d223a5d86d66e+7810+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tWBrY-0004A1-Pu
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 10:03:32 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24919dca-cf3a-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 11:03:30 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tWBrT-00000009jwk-46jj; Fri, 10 Jan 2025 10:03:28 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tWBrS-00000002D85-3diG; Fri, 10 Jan 2025 10:03:26 +0000
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
X-Inumbo-ID: 24919dca-cf3a-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Xoo+xm3Tw2CkYCxIV3PtG0Wlpe8+ZC90junJ+uK4GHw=; b=peyUPkgzt+cH4h/xbt1pVyqhYy
	IJt7rina2x756yrTxng++yuyPDzQZ4pI0XICMTyTy/uRV2ramirDoVa+obGvj1xghHgvGykSTeckP
	+eZrwM4YSO4HeWKqgznC+j6hOf5SQ0M5XcMXuhAyanlOndclQI2AhCfKgDZR2mqxXkPXLvJA6nvLr
	5By/prH62avmOLpsdzv323RBV83Vi9DvbI9qUn7J9CcsbmRo/5fK/boU3EFEHlUKa0ORD9B6IhjCm
	hoPOFZQhLkf56B2mljrClQ8Y0eVTBK75OQqAG0If7pZPbeFcYwdgOKsyEoT6PrZkIstBluJGb+jl7
	Mx+1HBwA==;
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
Subject: [PATCH 2/4] hw/xen: Use xs_node_read() from xen_console_get_name()
Date: Fri, 10 Jan 2025 10:03:24 +0000
Message-ID: <20250110100326.527101-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250110100326.527101-1-dwmw2@infradead.org>
References: <fc9b22c55eaaa79a3ef9829c270bc4b4e93be7a0.camel@infradead.org>
 <20250110100326.527101-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Now that xs_node_read() can construct a node path, no need to open-code it.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/char/xen_console.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index 989e75fef8..9338e00473 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -367,28 +367,28 @@ static char *xen_console_get_name(XenDevice *xendev, Error **errp)
 
     if (con->dev == -1) {
         XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
-        char fe_path[XENSTORE_ABS_PATH_MAX + 1];
         int idx = (xen_mode == XEN_EMULATE) ? 0 : 1;
+        Error *local_err = NULL;
         char *value;
 
         /* Theoretically we could go up to INT_MAX here but that's overkill */
         while (idx < 100) {
             if (!idx) {
-                snprintf(fe_path, sizeof(fe_path),
-                         "/local/domain/%u/console", xendev->frontend_id);
+                value = xs_node_read(xenbus->xsh, XBT_NULL, NULL, &local_err,
+                                     "/local/domain/%u/console",
+                                     xendev->frontend_id);
             } else {
-                snprintf(fe_path, sizeof(fe_path),
-                         "/local/domain/%u/device/console/%u",
-                         xendev->frontend_id, idx);
+                value = xs_node_read(xenbus->xsh, XBT_NULL, NULL, &local_err,
+                                     "/local/domain/%u/device/console/%u",
+                                     xendev->frontend_id, idx);
             }
-            value = qemu_xen_xs_read(xenbus->xsh, XBT_NULL, fe_path, NULL);
             if (!value) {
                 if (errno == ENOENT) {
                     con->dev = idx;
+                    error_free(local_err);
                     goto found;
                 }
-                error_setg(errp, "cannot read %s: %s", fe_path,
-                           strerror(errno));
+                error_propagate(errp, local_err);
                 return NULL;
             }
             free(value);
-- 
2.47.0


