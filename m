Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A8BA135B1
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 09:44:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873237.1284199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLTl-0004ZB-5P; Thu, 16 Jan 2025 08:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873237.1284199; Thu, 16 Jan 2025 08:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLTl-0004QW-16; Thu, 16 Jan 2025 08:43:53 +0000
Received: by outflank-mailman (input) for mailman id 873237;
 Thu, 16 Jan 2025 08:43:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jK+=UI=casper.srs.infradead.org=BATV+cabf69696ff47aa9dee2+7816+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tYLTi-0004BI-Ex
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 08:43:50 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff9d8e86-d3e5-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 09:43:46 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tYLTd-0000000AkbV-0JOu; Thu, 16 Jan 2025 08:43:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tYLTc-00000007pI8-3Dc0; Thu, 16 Jan 2025 08:43:44 +0000
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
X-Inumbo-ID: ff9d8e86-d3e5-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=9YnMqT9L5zpcIdMPGD+T5rZV+9M0PECfN24dS3f5adI=; b=QAhTn+9luHDcx4ZBpcWeH90OPD
	kUrxeCoetP1gumKPKrYKI0tOm+chuyObKhh8XsUWhf15Snreba/gTrp9g4OmorKfNLsrOLHPEUpWP
	PQ+WEsNZikrHtjPm+i/8KmuA1lmh2mEXDeBieo3/4G2hhT/FN+eykSgP6+rjuBL2ftHX8UAtx8ih5
	Bfcijh2bcxhKSL53SrxjdJIdyfwH/zccZnOt15oaxu+YZqIvHSP3CQoRNquwqLGot4MaBi9TKU+2A
	Uuz7NHdmOX8hnCLRLt6l7tmi54R1Ra25u9P6DxwUasWLonC7win3ViRVG9hZPpALXtbzuGHC9Y1cH
	T3091e/A==;
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
Subject: [PULL 6/8] hw/xen: Use xs_node_read() from xenstore_read_str() instead of open-coding it
Date: Thu, 16 Jan 2025 08:43:30 +0000
Message-ID: <20250116084332.1864967-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250116084332.1864967-1-dwmw2@infradead.org>
References: <20250116084332.1864967-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
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


