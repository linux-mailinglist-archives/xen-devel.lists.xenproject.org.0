Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F17A08D44
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 11:03:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869403.1280870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWBrZ-0004Vx-0z; Fri, 10 Jan 2025 10:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869403.1280870; Fri, 10 Jan 2025 10:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWBrY-0004Q8-TG; Fri, 10 Jan 2025 10:03:32 +0000
Received: by outflank-mailman (input) for mailman id 869403;
 Fri, 10 Jan 2025 10:03:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ds0=UC=desiato.srs.infradead.org=BATV+4d36ee5d223a5d86d66e+7810+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tWBrW-0004A1-Pf
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 10:03:31 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2491f3eb-cf3a-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 11:03:30 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tWBrT-00000009jwm-47GC; Fri, 10 Jan 2025 10:03:28 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tWBrS-00000002D8J-41Ad; Fri, 10 Jan 2025 10:03:26 +0000
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
X-Inumbo-ID: 2491f3eb-cf3a-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=X9zPJARrpqAjJWmqv/5Ourv8FRQelInhZmfRvKOuCvE=; b=p5CUhAGkiy/Ab65rEyWrr+bC/e
	R4Ww/x6oWNsGbvYIgqh5v++zG7YpiB1LauJCN+l1yK41FHft1fOgE827KN8mn5K86vqq5SjIeuXCd
	bgp7f5nxwT8i+ZnrXi0Y5fEz8FVeKd//w+GOwvb8LQ8dabPvo8a3iIRfpsbIv9PfkJo+S7BvIHFrj
	qJN/KjsRxXLXyaKzrdaOjcZHSkeVLD8Hv372ooE7E/nLi1VrLMX2xwcbIXQYZqsMC/I9QsNnJgAxO
	nOSa7L3UXpZTqvNbm6BCBHR4iiTfk9fWDDIqALBv4mtUQDVA24+8hsBJxzDunP4dqviW7pntf1GuT
	3xsgmF0Q==;
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
Subject: [PATCH 4/4] hw/xen: Use xs_node_read() from xenstore_read_str() instead of open-coding it
Date: Fri, 10 Jan 2025 10:03:26 +0000
Message-ID: <20250110100326.527101-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250110100326.527101-1-dwmw2@infradead.org>
References: <fc9b22c55eaaa79a3ef9829c270bc4b4e93be7a0.camel@infradead.org>
 <20250110100326.527101-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xen/xen_pvdev.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index c5ad71e8dc..c9143ba259 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -22,6 +22,7 @@
 #include "qemu/main-loop.h"
 #include "hw/qdev-core.h"
 #include "hw/xen/xen-legacy-backend.h"
+#include "hw/xen/xen-bus-helper.h"
 #include "hw/xen/xen_pvdev.h"
 
 /* private */
@@ -81,12 +82,9 @@ int xenstore_write_str(const char *base, const char *node, const char *val)
 
 char *xenstore_read_str(const char *base, const char *node)
 {
-    char abspath[XEN_BUFSIZE];
-    unsigned int len;
     char *str, *ret = NULL;
 
-    snprintf(abspath, sizeof(abspath), "%s/%s", base, node);
-    str = qemu_xen_xs_read(xenstore, 0, abspath, &len);
+    str = xs_node_read(xenstore, 0, NULL, NULL, "%s/%s", base, node);
     if (str != NULL) {
         /* move to qemu-allocated memory to make sure
          * callers can safely g_free() stuff. */
-- 
2.47.0


