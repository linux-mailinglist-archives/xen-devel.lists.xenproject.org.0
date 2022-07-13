Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC4D57398E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 17:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366762.597688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBdtW-0004LW-V0; Wed, 13 Jul 2022 15:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366762.597688; Wed, 13 Jul 2022 15:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBdtW-0004Iv-SJ; Wed, 13 Jul 2022 15:03:18 +0000
Received: by outflank-mailman (input) for mailman id 366762;
 Wed, 13 Jul 2022 15:03:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y9RH=XS=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1oBdtV-0004Gf-UP
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 15:03:18 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ece575fb-02bc-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 17:03:17 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 9-20020a1c0209000000b003a2dfdebe47so1375811wmc.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jul 2022 08:03:17 -0700 (PDT)
Received: from localhost.localdomain ([91.219.254.75])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c355000b003a2f88b2559sm2288417wmq.44.2022.07.13.08.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 08:03:15 -0700 (PDT)
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ece575fb-02bc-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8vUSMEP+N59Z55GI7mKlPURS7RSp1YpBOBZ3Nkl5sGQ=;
        b=qWzbizZzaZCuU4bwNxUEaI90+O843mo9Bk+jOlJzRfoYY7JaGLjUm7Fn6VS8i4rwag
         MPfvK38R17bFiIrgZlldz3Y9OIBGc3J1S6+BsQfZKPA4+URFxzvjwxz5+eU33F4BVKox
         Egi6QF7C+SRR/mDn9R5O4kHqfVH1CTJH1pLJls7Hj0aEBLxI/hBK3EjohojiwTxAmUik
         yR7XGVMBxU1vidcYbQyjrnz7ye7fBcZch6+2gcbarkesby+Y4F03fhd2w2/UYzUVMNAY
         ky8HS9Vkd91REJg9o6IKwto9IJlFjLz8sLHHVYZUfywc2XoF0wayGGNQ9q39Fg+1DhzT
         Sk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8vUSMEP+N59Z55GI7mKlPURS7RSp1YpBOBZ3Nkl5sGQ=;
        b=k5Kq3cs3RE6VAvFnwDlynfov5mTY3M65qp98hukUXckri4q8Ave27OTadt/432wJKv
         lNeyDXVBEL7sv3eu7hbHYSh5NC7p5sLrGgezpOfazDlN57ZKItwhhPYdLKFbnZhcX24m
         vSMtiiKe48ADSe9zjQWFwQqP58zjc5ErdiQKTSpUjY1cNas47pDMNuvqYV0ZKjrpy5/Q
         FW+VsJhMQAAp9LYygz6ckmgc4DFokIeKki0SJcymfjGmdQeIouFk3APfQ0xUTMgFFGYJ
         fjG65J1YAAH8ijI5Iv6Dv9+xzqiZQ3/XDiS34Dj/DK7jxcHHfeFoRL98Wi45AY9Yc2oS
         ++gA==
X-Gm-Message-State: AJIora+cul3BNG/B9hSNjCrrCY1eNdm0282tZhiwB2lZ/ewXL4Krxnzu
	QzdDwttwp56E7vpH83uPmNwxZUwij3YEFQ==
X-Google-Smtp-Source: AGRyM1uHHcjXL2LmySNrs8AOH3vympeBWqndOIVTpv92oum6l90axYM4OeqrRloeR4TYuHpYMrDO9w==
X-Received: by 2002:a05:600c:4c05:b0:3a2:e076:76ec with SMTP id d5-20020a05600c4c0500b003a2e07676ecmr10226834wmp.41.1657724596049;
        Wed, 13 Jul 2022 08:03:16 -0700 (PDT)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Dmytro Semenets <dmytro_semenets@epam.com>
Subject: [PATCH v2 1/4] tools: remove xenstore entries on vchan server closure
Date: Wed, 13 Jul 2022 18:03:08 +0300
Message-Id: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

vchan server creates XenStore entries to advertise its event channel and
ring, but those are not removed after the server quits.
Add additional cleanup step, so those are removed, so clients do not try
to connect to a non-existing server.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
---
 tools/include/libxenvchan.h |  5 +++++
 tools/libs/vchan/init.c     | 24 ++++++++++++++++++++++++
 tools/libs/vchan/io.c       |  4 ++++
 tools/libs/vchan/vchan.h    | 31 +++++++++++++++++++++++++++++++
 4 files changed, 64 insertions(+)
 create mode 100644 tools/libs/vchan/vchan.h

diff --git a/tools/include/libxenvchan.h b/tools/include/libxenvchan.h
index d6010b145d..30cc73cf97 100644
--- a/tools/include/libxenvchan.h
+++ b/tools/include/libxenvchan.h
@@ -86,6 +86,11 @@ struct libxenvchan {
 	int blocking:1;
 	/* communication rings */
 	struct libxenvchan_ring read, write;
+	/**
+	 * Base xenstore path for storing ring/event data used by the server
+	 * during cleanup.
+	 * */
+	char *xs_path;
 };
 
 /**
diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
index c8510e6ce9..9195bd3b98 100644
--- a/tools/libs/vchan/init.c
+++ b/tools/libs/vchan/init.c
@@ -46,6 +46,8 @@
 #include <xen/sys/gntdev.h>
 #include <libxenvchan.h>
 
+#include "vchan.h"
+
 #ifndef PAGE_SHIFT
 #define PAGE_SHIFT 12
 #endif
@@ -251,6 +253,12 @@ static int init_xs_srv(struct libxenvchan *ctrl, int domain, const char* xs_base
 	char ref[16];
 	char* domid_str = NULL;
 	xs_transaction_t xs_trans = XBT_NULL;
+
+	/* store the base path so we can clean up on server closure */
+	ctrl->xs_path = strdup(xs_base);
+	if (!ctrl->xs_path)
+		return -1; 
+
 	xs = xs_open(0);
 	if (!xs)
 		goto fail;
@@ -298,6 +306,22 @@ retry_transaction:
 	return ret;
 }
 
+void close_xs_srv(struct libxenvchan *ctrl)
+{
+	struct xs_handle *xs;
+
+	if (!ctrl->xs_path)
+		return;
+
+	xs = xs_open(0);
+	if (xs) {
+		xs_rm(xs, XBT_NULL, ctrl->xs_path);
+		xs_close(xs);
+	}
+
+	free(ctrl->xs_path);
+}
+
 static int min_order(size_t siz)
 {
 	int rv = PAGE_SHIFT;
diff --git a/tools/libs/vchan/io.c b/tools/libs/vchan/io.c
index da303fbc01..1f201ad554 100644
--- a/tools/libs/vchan/io.c
+++ b/tools/libs/vchan/io.c
@@ -40,6 +40,8 @@
 #include <xenctrl.h>
 #include <libxenvchan.h>
 
+#include "vchan.h"
+
 #ifndef PAGE_SHIFT
 #define PAGE_SHIFT 12
 #endif
@@ -384,5 +386,7 @@ void libxenvchan_close(struct libxenvchan *ctrl)
 		if (ctrl->gnttab)
 			xengnttab_close(ctrl->gnttab);
 	}
+	if (ctrl->is_server)
+		close_xs_srv(ctrl);
 	free(ctrl);
 }
diff --git a/tools/libs/vchan/vchan.h b/tools/libs/vchan/vchan.h
new file mode 100644
index 0000000000..621016ef42
--- /dev/null
+++ b/tools/libs/vchan/vchan.h
@@ -0,0 +1,31 @@
+/**
+ * @file
+ * @section AUTHORS
+ *
+ * Copyright (C) 2021 EPAM Systems Inc.
+ *
+ * @section LICENSE
+ *
+ *  This library is free software; you can redistribute it and/or
+ *  modify it under the terms of the GNU Lesser General Public
+ *  License as published by the Free Software Foundation; either
+ *  version 2.1 of the License, or (at your option) any later version.
+ *
+ *  This library is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  Lesser General Public License for more details.
+ *
+ *  You should have received a copy of the GNU Lesser General Public
+ *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *
+ * @section DESCRIPTION
+ *
+ *  This file contains common libxenvchan declarations.
+ */
+#ifndef LIBVCHAN_H
+#define LIBVCHAN_H
+
+void close_xs_srv(struct libxenvchan *ctrl);
+
+#endif /* LIBVCHAN_H */
-- 
2.25.1


