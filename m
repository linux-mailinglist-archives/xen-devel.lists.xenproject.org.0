Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9224A4700C2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 13:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243806.421866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvf7U-0004hn-Tr; Fri, 10 Dec 2021 12:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243806.421866; Fri, 10 Dec 2021 12:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvf7U-0004eK-Po; Fri, 10 Dec 2021 12:35:24 +0000
Received: by outflank-mailman (input) for mailman id 243806;
 Fri, 10 Dec 2021 12:35:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=At30=Q3=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mvf7T-0004e6-Nr
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 12:35:23 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3fea0a5-59b5-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 13:35:21 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id e3so29911726edu.4
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 04:35:21 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id gs15sm1468183ejc.42.2021.12.10.04.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 04:35:20 -0800 (PST)
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
X-Inumbo-ID: a3fea0a5-59b5-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xohsmkVTc31Uu+TldrPYsMXqYJVGzbIphIyuFhkNC7Y=;
        b=emX9q5Ezq08xPpwJreiA4hQvBUyFBPO88+n+508QrzeGm8Cxsfq3N7qITakeUj2STs
         JlrO/DrlRtk99Fo2tK6hCG9qbMG+Z+Re7Kp4u8RlLDvo1S2W05sbqu6QRE+Je8yQ/gK5
         0uc9Ep/QO5nZMGVIPdgJgKRFo1J4uUTjtd91MRHkbanrkXPqa6Ce2NzqFnBQ0g4X/A8i
         zLhsw5WTdzDQCXkp1JCi5vnWEx6GlupNc8f3NHw4MfZwDFMcf3DdaU7BA8AaAROXUwjD
         VNOw5Fls0dige+JMhxm1lvZu3YIpdKzfYx+LjZVqwgx0tfQ+7bwUxbjLJVo4styybmT8
         2+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xohsmkVTc31Uu+TldrPYsMXqYJVGzbIphIyuFhkNC7Y=;
        b=doX03+HoTAehoZEytGSV0bteD4GxtSIuC1cbn1Q3P0nd0noj0w45aH2GSbejPhJ6p5
         w7xq4EQe3PAnOZ1oXWLfVNRyK5QRGTZ/n0ryVV27VD+YHLJq3xDm+gStqypEe2/l+s7f
         /4p6Ebn8/qoZ4c9oufG9iSeuEMgEB3ZbLt4jpetaEVnBrRCnts7O51WIua/S/w+KP+vU
         DLXtnqsxAamoCt3OY/rSl0gjBV/jdpJd0u8/o96S9Y+1jeDZ7jF/N+8IdkdSlUOwwTDL
         g7eODSNpBHZHzwcw6rQQZ0CS7E5H7PdpMWde7KY9Zyalj+TGj8FC6UpKmVU0vEHavbxs
         mjRg==
X-Gm-Message-State: AOAM533mQp4AebH+OCObnUd8P8JRkdunjoUoSiv4i7Uzu/3s92BxdEhA
	wCl0oi+0cQI/kXdiwiivcKabezCAVBLr3g==
X-Google-Smtp-Source: ABdhPJxEYwesJmFAV5i76T+vHOyzbrmUYWrV+g1DtHvjzqxAfxIyiMXCTSQHZ+fr34QS332mA73uDw==
X-Received: by 2002:a17:906:9756:: with SMTP id o22mr24715522ejy.324.1639139721103;
        Fri, 10 Dec 2021 04:35:21 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: wl@xen.org,
	jgross@suse.com,
	anthony.perard@citrix.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH] tools: remove xenstore entries on vchan server closure
Date: Fri, 10 Dec 2021 14:35:19 +0200
Message-Id: <20211210123519.595163-1-andr2000@gmail.com>
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
index d6010b145df2..30cc73cf97e3 100644
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
index c8510e6ce98a..c6b8674ef541 100644
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
index da303fbc01ca..1f201ad554f2 100644
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
index 000000000000..621016ef42e5
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


