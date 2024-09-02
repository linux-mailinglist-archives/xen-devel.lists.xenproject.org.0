Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 480A5968C21
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 18:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788267.1197773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slA4r-00037f-DS; Mon, 02 Sep 2024 16:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788267.1197773; Mon, 02 Sep 2024 16:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slA4r-00034k-9v; Mon, 02 Sep 2024 16:38:53 +0000
Received: by outflank-mailman (input) for mailman id 788267;
 Mon, 02 Sep 2024 16:38:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSuM=QA=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1slA4p-0002KR-3H
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 16:38:51 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4b99cc9-6949-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 18:38:49 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c26852af8fso685192a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 09:38:49 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c74184sm5714163a12.32.2024.09.02.09.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 09:38:48 -0700 (PDT)
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
X-Inumbo-ID: d4b99cc9-6949-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725295129; x=1725899929; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Knysur5vVx3WEMQ6p3lPxj+aKROQfM3qQ3wfpziD/zU=;
        b=Jsdsr+5rVMoQAOeD+hcQfzorqaxiCNnCbjZXUPbcbnZLjQzVkr5Aapq0ypVNKG12mM
         GTsFw2OUWJ52+Oe3VGA0oPfWdEMYo5Xkf9rt4hIqwZWGffP2cRzNpmaNKVy5aN/Agwtn
         NKAaIqKf7N3sUpxqI4Qvk/gE1NtxMadlYYsoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725295129; x=1725899929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Knysur5vVx3WEMQ6p3lPxj+aKROQfM3qQ3wfpziD/zU=;
        b=efCd9BJ2BM9JrQWEWk6fv0kcl2zimFaAH+UdDmUUCLoH08H/dQn1kErKdR+WuMJVp+
         lAXKaj3G5io2sQbC+qoxE06TvnfAVzZ917EA34tPaAaCBmDHzjJYbYBzrmCPrB8ebQ44
         Wo0MNDzeS0RLYgODEXbdP4BOCq1lCRGYOVG7B0ZE1PyCo7Yeb3rHYQ/6mDfd5uCK2BRG
         XsTEKOaHbhb1uw/fFO8wg29zeJ4aC2YE8tStfnV1tV/E6VMM9BimlNUZjLFh9hVsKSyB
         +hZBM91Mh4CV033ReFmtL8YChB053gXms86036afBcHw7kZK5Sokn4LlfWX/RbgLUaum
         7aug==
X-Gm-Message-State: AOJu0YzQK0tBpnbuGJ+EyuvEVYUiw6ESzckvZ+F7Yun4QsNNBuStXZrR
	IepPWmyd9ovrnACwtYNX8Hv3JUTTFYKIzBnJBpWZH2yrUXVjetho30u5EawwykHM6ns4lL7T5Z+
	YS4Y=
X-Google-Smtp-Source: AGHT+IETiZmo6gPUKNcnhqTnOgbXXRX4HxaDUi8vo1xGwK4Zx9Mcm9gL4l0cuC8FH7kSkOS5elzNjA==
X-Received: by 2002:a05:6402:3889:b0:5c2:2b24:732d with SMTP id 4fb4d7f45d1cf-5c22b247646mr9700969a12.23.1725295128827;
        Mon, 02 Sep 2024 09:38:48 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v3 3/3] libxl: Update the documentation of libxl_xen_console_read_line()
Date: Mon,  2 Sep 2024 17:38:39 +0100
Message-ID: <d41d73d56713685fb9ca7ab636898b54254ebdbc.1725294334.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1725294334.git.javi.merino@cloud.com>
References: <cover.1725294334.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Despite its name, libxl_xen_console_read_line() does not read a line,
it fills the buffer with as many characters as fit.  Update the
documentation to reflect the real behaviour of the function.  Rename
line_r to avoid confusion since it is a pointer to an array of
characters.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 tools/include/libxl.h            |  2 +-
 tools/libs/light/libxl_console.c | 29 ++++++++++++++++++-----------
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index f5c71677424b..8d32428ea9fe 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -2813,7 +2813,7 @@ libxl_xen_console_reader *
     libxl_xen_console_read_start(libxl_ctx *ctx, int clear);
 int libxl_xen_console_read_line(libxl_ctx *ctx,
                                 libxl_xen_console_reader *cr,
-                                char **line_r);
+                                char **buff);
 void libxl_xen_console_read_finish(libxl_ctx *ctx,
                                    libxl_xen_console_reader *cr);
 
diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
index 6c4414fcc1a2..044ca646765a 100644
--- a/tools/libs/light/libxl_console.c
+++ b/tools/libs/light/libxl_console.c
@@ -792,17 +792,24 @@ libxl_xen_console_reader *
     return cr;
 }
 
-/* return values:                                          *line_r
- *   1          success, whole line obtained from buffer    non-0
- *   0          no more lines available right now           0
- *   negative   error code ERROR_*                          0
- * On success *line_r is updated to point to a nul-terminated
- * string which is valid until the next call on the same console
- * reader.  The libxl caller may overwrite parts of the string
- * if it wishes. */
+/*
+ * Copy part of the console ring into a buffer
+ *
+ * Return values:
+ *   1: Success, *buff points to the string
+ *   0: No more lines available right now
+ *   -ERROR_* on error
+ *
+ * Despite its name, libxl_xen_console_read_line() does not
+ * necessarily read a complete line.  It attempts to fill the buffer
+ * with as many characters as it can accommodate.  The buffer pointed
+ * to by *buff is updated to contain a nul-terminated string.  This
+ * string remains valid until the next call to
+ * libxl_xen_console_read_line() on the same console reader.
+ */
 int libxl_xen_console_read_line(libxl_ctx *ctx,
                                 libxl_xen_console_reader *cr,
-                                char **line_r)
+                                char **buff)
 {
     int ret;
     /*
@@ -823,10 +830,10 @@ int libxl_xen_console_read_line(libxl_ctx *ctx,
     if (!ret) {
         if (nr_chars) {
             cr->buffer[nr_chars] = '\0';
-            *line_r = cr->buffer;
+            *buff = cr->buffer;
             ret = 1;
         } else {
-            *line_r = NULL;
+            *buff = NULL;
             ret = 0;
         }
     }
-- 
2.45.2


