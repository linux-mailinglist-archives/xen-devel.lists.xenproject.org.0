Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1518E56C8E2
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jul 2022 12:11:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363779.594484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oA7QB-0001ry-RK; Sat, 09 Jul 2022 10:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363779.594484; Sat, 09 Jul 2022 10:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oA7QB-0001py-Oj; Sat, 09 Jul 2022 10:10:43 +0000
Received: by outflank-mailman (input) for mailman id 363779;
 Sat, 09 Jul 2022 10:10:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+pVM=XO=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1oA7QA-0001pr-DQ
 for xen-devel@lists.xenproject.org; Sat, 09 Jul 2022 10:10:42 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6326e96e-ff6f-11ec-bd2d-47488cf2e6aa;
 Sat, 09 Jul 2022 12:10:41 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id d16so1241363wrv.10
 for <xen-devel@lists.xenproject.org>; Sat, 09 Jul 2022 03:10:41 -0700 (PDT)
Received: from localhost.localdomain ([91.219.254.75])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a5d6941000000b00210bac248c8sm1095853wrw.11.2022.07.09.03.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jul 2022 03:10:39 -0700 (PDT)
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
X-Inumbo-ID: 6326e96e-ff6f-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2VzBKUbne564f7X98AD2TghzEOsZhMoWEw97a29fkeU=;
        b=ZXIArg7WwgzcYbM75bfLzAdWVDATXIBFk3Tw2qFFBUgIljtwi13Gcy2AHmIPVt7XIO
         ExXK8ZYZg3Ui5ZsvczTXKF8Hlr7Tl6ltaT8kJxiVostwcLdTCuw98eG0YK426BlP78hG
         HnOmSYPRV+fFhwNnBJEZbF32aPfrG+6oUnLRjZS8uwY19SniNmfSdKGGioOnJYWyaF6P
         PhZLn7ASOqIUjEzQTCDl/200XkVisybqgbrablIkwFdfxBwtMWH5yp00sSs5WTgDpsPb
         GXGBqR6T46Y1hOwZ12MMJUXik7e97pECT5wZlnxPj/r1Jw7EMIUJPhoYSn4pk+brXiBQ
         HTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2VzBKUbne564f7X98AD2TghzEOsZhMoWEw97a29fkeU=;
        b=MzYNq80/bfxLEeTJwsif8N/DascdBROmjx3lkwkNzke+spUS4DW9ViK0vSSqPm8YEj
         FQqEcRVAsOFcgQnWjUxp8PcA0lM10zU2a9+hhgnrVxNv8d0vBgl1acN4QAo5Z9mOYWkw
         kJRxWYuGG0ksQ7rAUphB5c54CaU96KBQCYOKRhaLr/yIR2Ym9P3a37KvPGnfVLg/+SLY
         +SYZgiUCzOAvZpAqIQyAvUFT08wow03ZjELeD74e5mRjd+QWNbf+SQinVva4FnH4LC6l
         zlYHP297YcDJxD2ifEZ9falMr/NhIxML+IRPugz3Sf395kwVe38OP2KRLIIPOZ5b8e3b
         TRBg==
X-Gm-Message-State: AJIora+6Jo9Fw9oKq7zwDcziRWUmO1zlZ0Ft3ohm7VtsB+YOT8n2bYGX
	pqX0t/ce4coTK8130SavrhzDGtSZFICN8jvz
X-Google-Smtp-Source: AGRyM1td5eFh9XLAbU+j4vlRvJLQTn6K72FcdKpCQEaAT7TOQXnu85qi0zZvazdZCEtNYIVL405wuw==
X-Received: by 2002:a5d:644d:0:b0:21d:645c:d3f4 with SMTP id d13-20020a5d644d000000b0021d645cd3f4mr7173872wrw.484.1657361440348;
        Sat, 09 Jul 2022 03:10:40 -0700 (PDT)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/4] tools: remove xenstore entries on vchan server closure
Date: Sat,  9 Jul 2022 13:10:32 +0300
Message-Id: <20220709101035.2989428-1-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

vchan server creates XenStore entries to advertise its event channel and
ring, but those are not removed after the server quits.
Add additional cleanup step, so those are removed, so clients do not try
to connect to a non-existing server.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 tools/include/libxenvchan.h |  5 +++++
 tools/libs/vchan/init.c     | 23 +++++++++++++++++++++++
 tools/libs/vchan/io.c       |  4 ++++
 tools/libs/vchan/vchan.h    | 31 +++++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+)
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
index c8510e6ce9..c6b8674ef5 100644
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
@@ -251,6 +253,10 @@ static int init_xs_srv(struct libxenvchan *ctrl, int domain, const char* xs_base
 	char ref[16];
 	char* domid_str = NULL;
 	xs_transaction_t xs_trans = XBT_NULL;
+
+	// store the base path so we can clean up on server closure
+	ctrl->xs_path = strdup(xs_base);
+
 	xs = xs_open(0);
 	if (!xs)
 		goto fail;
@@ -298,6 +304,23 @@ retry_transaction:
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
+	if (!xs)
+		goto fail;
+
+	xs_rm(xs, XBT_NULL, ctrl->xs_path);
+
+fail:
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


