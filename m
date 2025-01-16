Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96533A135AB
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 09:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873241.1284232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLTn-0005Es-4F; Thu, 16 Jan 2025 08:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873241.1284232; Thu, 16 Jan 2025 08:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLTm-00055X-Rw; Thu, 16 Jan 2025 08:43:54 +0000
Received: by outflank-mailman (input) for mailman id 873241;
 Thu, 16 Jan 2025 08:43:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jK+=UI=casper.srs.infradead.org=BATV+cabf69696ff47aa9dee2+7816+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tYLTk-0004BJ-81
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 08:43:52 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff7906a6-d3e5-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 09:43:47 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tYLTd-0000000AkbP-02Qr; Thu, 16 Jan 2025 08:43:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tYLTc-00000007pI3-2yCA; Thu, 16 Jan 2025 08:43:44 +0000
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
X-Inumbo-ID: ff7906a6-d3e5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=ZBKlQ7iGXowmo3aHS0zEEFjY8wis7AgQV7Ky19BXiPo=; b=YbwhsJicNuvRKaM7mZLvcVWK6x
	WiVFjSENH4z5Pkik/TbbBGKMRfokc5n3AnYla8b8TFya79gei5DGXoFPyNtEYDuoSbPEvASAzUe7s
	/Okku4GLLdh7ZIL8/95IXpTsU/ufviN5uegG73LLfNVBGmmo9yc08EgZA/7pCEqFQVNkHvfd1eaAT
	uMcjr7k3BZPtzBzzpGoQsPxEIArLFfbtmXn+/6XPkKmtZ8YokNBXePazZ5GcK744aKhRDmDrlbUl/
	9xSpFhIshTG4A/stggqsUQoqVTd1+in6ftZfGoH5NjzvWbDV4Q4x7VbLT7Vo0voq4syaI0/+Emwej
	65f7SNhg==;
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
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PULL 5/8] hw/xen: Use xs_node_read() from xen_netdev_get_name()
Date: Thu, 16 Jan 2025 08:43:29 +0000
Message-ID: <20250116084332.1864967-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250116084332.1864967-1-dwmw2@infradead.org>
References: <20250116084332.1864967-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Now that xs_node_read() can construct a node path, no need to open-code it.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
 hw/net/xen_nic.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 97ebd9fa30..5410039490 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -510,23 +510,22 @@ static char *xen_netdev_get_name(XenDevice *xendev, Error **errp)
 
     if (netdev->dev == -1) {
         XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
-        char fe_path[XENSTORE_ABS_PATH_MAX + 1];
         int idx = (xen_mode == XEN_EMULATE) ? 0 : 1;
+        Error *local_err = NULL;
         char *value;
 
         /* Theoretically we could go up to INT_MAX here but that's overkill */
         while (idx < 100) {
-            snprintf(fe_path, sizeof(fe_path),
-                     "/local/domain/%u/device/vif/%u",
-                     xendev->frontend_id, idx);
-            value = qemu_xen_xs_read(xenbus->xsh, XBT_NULL, fe_path, NULL);
+            value = xs_node_read(xenbus->xsh, XBT_NULL, NULL, &local_err,
+                                 "/local/domain/%u/device/vif/%u",
+                                 xendev->frontend_id, idx);
             if (!value) {
                 if (errno == ENOENT) {
                     netdev->dev = idx;
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


