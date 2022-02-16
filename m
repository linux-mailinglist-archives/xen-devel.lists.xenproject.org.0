Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44434B80BC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 07:33:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273704.468969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKDsZ-00042R-Fe; Wed, 16 Feb 2022 06:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273704.468969; Wed, 16 Feb 2022 06:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKDsZ-0003zw-CM; Wed, 16 Feb 2022 06:33:31 +0000
Received: by outflank-mailman (input) for mailman id 273704;
 Wed, 16 Feb 2022 06:33:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=miT7=S7=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nKDsX-0003vd-7d
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 06:33:29 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59f39e6a-8ef2-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 07:33:28 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id c15so1746326ljf.11
 for <xen-devel@lists.xenproject.org>; Tue, 15 Feb 2022 22:33:28 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id 25sm1595409lfz.65.2022.02.15.22.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 22:33:26 -0800 (PST)
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
X-Inumbo-ID: 59f39e6a-8ef2-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hCZUraCHj+42xi/6TKZPfyR+3Ggy49/iCEoKD0rNFj4=;
        b=E7fDUfXxzECKYcgaC/bFWADmnoeRe+sb+8ztKUJPEPfe4VrCbvWsLOcB1jTRKj9RWb
         B4q6Ogas+p0k41/5EA1Ea8BNbsSgrXf0g0zlivuoo3qR09AElJ4Y3nNIWuAWUkYNWTev
         9CheICceYcvcYI5PtqU7yKEqGKP4ebFFtc2YUe0tn2815DnW+3cE5etD1+aKtWVWhCU1
         9z+UqjSfArds4zDuOZnJp9Y8Z70nr8+KoXq0woGPT/vxz0AdXqIuQOkcme7IWzbreWAC
         X6xGFS+SDjbmSXj8s90z7VwBfti5C6PrLvpSgQ0ycfPpq8EjSdIkUUWHjn+3yil9svkG
         8zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hCZUraCHj+42xi/6TKZPfyR+3Ggy49/iCEoKD0rNFj4=;
        b=C17qGJyO/543SArHZEYyMmU8PPFPyEjNI0Yvx+T5z2shVZq8GrVaK36GFNB7ralxWa
         LYvL5QF3hgsPzOyxNVuOhw33IKpfTD1uEpvuCOdFjeIQTwTkufAcACzgC+kY9IXcr3TU
         Wh6sfnHk3i7TVMTphypWMCKtqDwwd5flpPiMBob1CC8kGvX/VTLHUGETH1pN4sE8bwCs
         1D4KnKauMtP1jr1Ow4EbmpIbRQ+uKYUnWFjA7rjuLeb7OpOYbqzwtR4MRqWmsZSSyVXf
         77+wf/8xuMW/Mg3mHLoeK2Sq1Pzflyq3cNydrLj8o3lj8cdATbxcSh/5VNJnSRcDeLpU
         jfOQ==
X-Gm-Message-State: AOAM531xRMU/au6hVssjNusz+04/w7wOgho0wE2/su/m2fB/F/TuJDCs
	D22SeLxBlLY3FykbZJp7Rm3wgHVnmb4=
X-Google-Smtp-Source: ABdhPJzjY+uVQ/+Uuis0oMmo1zYNn0FFg8MJ8c+lNxyCyedwTHdvmrtYhshxe0ftArZBJKKiZsd+Cg==
X-Received: by 2002:a2e:b0e2:0:b0:23d:8a3d:cd70 with SMTP id h2-20020a2eb0e2000000b0023d8a3dcd70mr947444ljl.304.1644993207536;
        Tue, 15 Feb 2022 22:33:27 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	anthony.perard@citrix.com,
	wl@xen.org,
	jandryuk@gmail.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2] tools: remove xenstore entries on vchan server closure
Date: Wed, 16 Feb 2022 08:33:25 +0200
Message-Id: <20220216063325.1552217-1-andr2000@gmail.com>
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
Since v1:
- add NULL check after strdup
---
 tools/include/libxenvchan.h |  5 +++++
 tools/libs/vchan/init.c     | 25 +++++++++++++++++++++++++
 tools/libs/vchan/io.c       |  4 ++++
 tools/libs/vchan/vchan.h    | 31 +++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)
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
index c8510e6ce98a..ae9a6b579753 100644
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
+	// store the base path so we can clean up on server closure
+	ctrl->xs_path = strdup(xs_base);
+	if (!ctrl->xs_path)
+		goto fail;
+
 	xs = xs_open(0);
 	if (!xs)
 		goto fail;
@@ -298,6 +306,23 @@ retry_transaction:
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


