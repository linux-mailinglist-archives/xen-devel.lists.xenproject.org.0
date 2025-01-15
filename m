Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C651A128C1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 17:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872757.1283750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6Mv-0003X2-8L; Wed, 15 Jan 2025 16:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872757.1283750; Wed, 15 Jan 2025 16:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6Mv-0003VY-3y; Wed, 15 Jan 2025 16:35:49 +0000
Received: by outflank-mailman (input) for mailman id 872757;
 Wed, 15 Jan 2025 16:35:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rWPo=UH=casper.srs.infradead.org=BATV+fb641630334796bb9467+7815+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tY6Mt-0003VS-Mx
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 16:35:47 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4ca686c-d35e-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 17:35:46 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tY6Mq-0000000GF6c-1V3F; Wed, 15 Jan 2025 16:35:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tY6Mq-00000001Hhz-0SV5; Wed, 15 Jan 2025 16:35:44 +0000
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
X-Inumbo-ID: c4ca686c-d35e-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=9YnMqT9L5zpcIdMPGD+T5rZV+9M0PECfN24dS3f5adI=; b=HBCwutm0sGscO7FRumhreu04mi
	eCz0n7Ffb2F8brtPqDvF8E7RDAbGm1ok0tZslQVFmdeTfMtnqdYSuPx2VHbzK3mlJgy7dCI7gF9l8
	J886BsSw/7sDOVHHH1+N/nDL0vISpjdui07wy6kzL62PW1sx9TyIYJ6H0pGGtIF00TRzw33B9LiUs
	JobEo03D0Wdls0BhRwE/Px7ABwcKZ0hSsSLNm/r9IimyjscHWgCMV91j0hEq4EffYt5no5ryM6sM9
	/wC2w/GcThMYonDt5+CjNzqTMAyX4LtCFAAa5eKF0ISogQB+x8haCB/B65629/kFvZ3OKWHhJSPnz
	ZCepR7/w==;
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
Subject: [PATCH v3 6/7] hw/xen: Use xs_node_read() from xenstore_read_str() instead of open-coding it
Date: Wed, 15 Jan 2025 16:27:24 +0000
Message-ID: <20250115163542.291424-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250115163542.291424-1-dwmw2@infradead.org>
References: <20250115163542.291424-1-dwmw2@infradead.org>
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


