Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0213A08D3F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 11:03:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869402.1280865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWBrY-0004Px-O7; Fri, 10 Jan 2025 10:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869402.1280865; Fri, 10 Jan 2025 10:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWBrY-0004Oq-KW; Fri, 10 Jan 2025 10:03:32 +0000
Received: by outflank-mailman (input) for mailman id 869402;
 Fri, 10 Jan 2025 10:03:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b62p=UC=casper.srs.infradead.org=BATV+4f8727a5892a49e75626+7810+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tWBrX-0003pZ-1i
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 10:03:31 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22f6a86e-cf3a-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 11:03:27 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tWBrT-0000000ClKG-0bv4; Fri, 10 Jan 2025 10:03:27 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tWBrS-00000002D8B-3mfx; Fri, 10 Jan 2025 10:03:26 +0000
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
X-Inumbo-ID: 22f6a86e-cf3a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=/Z+SKExdFg0yRN3g9ep614CHpa/f9VObKzKbkTp0cz4=; b=JixCnxZX+BaMP2NnJM4sbWF8Bo
	ko/UtMZH9wEpewOEOAw7KfknY98ai903BwaCCcOqoR8SiiUmnsygfCGudsLwaoIuOkvDEP6EP/uo9
	09UM6cCA8SpZK9lT8UsvrNPznYNvzqxz+5mRNpZBMhZzDlqamHM4RICQw5ph9GMalXXMMiulOKAi3
	TNIn2h+K2IUejRuuPLFpngzlF5ANtKAn+vJFknwv7UGsyuxTlT+l/OCTjIBH8/eQUPStFCRC7sc1N
	6M0qsPg6HGol0YG65WxcP+e8Gf5Ys1URR3xVczhle/Yhfar+gOYUa2zmeIni61g4XH2y1FAysu/U7
	PCVY3vdg==;
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
Subject: [PATCH 3/4] hw/xen: Use xs_node_read() from xen_netdev_get_name()
Date: Fri, 10 Jan 2025 10:03:25 +0000
Message-ID: <20250110100326.527101-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250110100326.527101-1-dwmw2@infradead.org>
References: <fc9b22c55eaaa79a3ef9829c270bc4b4e93be7a0.camel@infradead.org>
 <20250110100326.527101-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Now that xs_node_read() can construct a node path, no need to open-code it.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
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


