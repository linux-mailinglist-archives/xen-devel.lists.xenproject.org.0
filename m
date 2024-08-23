Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F06F95D3FF
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 19:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782504.1192029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXjQ-0005HA-A3; Fri, 23 Aug 2024 17:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782504.1192029; Fri, 23 Aug 2024 17:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXjQ-0005CO-6k; Fri, 23 Aug 2024 17:05:48 +0000
Received: by outflank-mailman (input) for mailman id 782504;
 Fri, 23 Aug 2024 17:05:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kBLJ=PW=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1shXjO-00048i-Bs
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 17:05:46 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efd1f8cb-6171-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 19:05:45 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5becd359800so2673563a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 10:05:45 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a3eb329sm2311240a12.55.2024.08.23.10.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 10:05:44 -0700 (PDT)
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
X-Inumbo-ID: efd1f8cb-6171-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724432745; x=1725037545; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9zU8RmotkcMzPPMMUF5U/qTDP3KTxHaHOi0grkKB0I=;
        b=fL+Z3U8Is+8tPbrNmEB6OTzoHvtWXkKlYupaIw6Z2IEsbuwAOiJ7dbxVSCrW2rkxWD
         LlwSTvNPh0flO/KhhtKy37eYWXSH6y1AhZq3Ot6T4bOu8hk6aJ17V+NRGYD83D3+40mp
         G2QBnk0ArKa7aJ9z8YKbcqcQfZjTSUt+m2prY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724432745; x=1725037545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9zU8RmotkcMzPPMMUF5U/qTDP3KTxHaHOi0grkKB0I=;
        b=l1epFnY2V/YVtworvEVqJ+edIoIDtM83a4GTDcq3SrQQ/MYsxuiNMrMHJZdtXNhg4w
         v23oPe/ljIAsdepZ+5nal2AMcYOum5kh13domyhQmzQoVah8ppRvpSz359nNBoY2iPrm
         Lbv0hdWz7FcrRpdbD+KnxH0kgBPUVAHe2qf02gkUetRWCsw8OpeD8B2Fw3vseo1BEPGV
         YxwPYhe8Z74C1+s7/l+wkksT1mNvD9+jbNmqEINJ/gMxRfipyQNDeXedwoSXl+3FMvST
         KjKMnp25xbEElcqs+a0Rb9+0PcnOdm/4c2LnfcDqbLU50bf90h2HbCAv+BiuQlFo0bcX
         tEZA==
X-Gm-Message-State: AOJu0YwpfHzL2GO0UHBdrTRRXTUqxzrIHc/m7elhzNjo/i1r36/PANMA
	8HUKFoN0IqBKoKWISmmgGSXTTh53lkz2vkiFUXT2YM50lC8B74VbR84AzGu+wT9RR7OMlLcWMh3
	I
X-Google-Smtp-Source: AGHT+IH9gi47eRDyTWF0F5XtXBpBWXTDCGEMNeCDo7kB6ResJleCMbF7ptrc272MMZ0N4AvTK/Oeww==
X-Received: by 2002:a05:6402:34c5:b0:5be:9bc5:f6b3 with SMTP id 4fb4d7f45d1cf-5c089158f81mr2090157a12.2.1724432744780;
        Fri, 23 Aug 2024 10:05:44 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	Javi Merino <javi.merino@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v2 3/3] libxl: Update the documentation of libxl_xen_console_read_line()
Date: Fri, 23 Aug 2024 18:05:05 +0100
Message-ID: <d868579d9ea98d8072630f5b85f7f7250ece393d.1724430173.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1724430173.git.javi.merino@cloud.com>
References: <cover.1724430173.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Despite its name, libxl_xen_console_read_line() does not read a line,
it fills the buffer with as many characters as fit.  Update the
documentation to reflect the real behaviour of the function.  Rename
line_r to avoid confusion since it is a pointer to an array of
characters.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 tools/libs/light/libxl_console.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
index f42f6a51ee6f..652897e4ef6d 100644
--- a/tools/libs/light/libxl_console.c
+++ b/tools/libs/light/libxl_console.c
@@ -789,17 +789,19 @@ libxl_xen_console_reader *
     return cr;
 }
 
-/* return values:                                          *line_r
- *   1          success, whole line obtained from buffer    non-0
- *   0          no more lines available right now           0
- *   negative   error code ERROR_*                          0
- * On success *line_r is updated to point to a nul-terminated
+/* Copy part of the console ring into a buffer
+ *
+ * Return values:
+ *   1: Success, the buffer obtained from the console ring an
+ *   0: No more lines available right now
+ *   -ERROR_* on error
+ *
+ * On success, *line_r is updated to point to a nul-terminated
  * string which is valid until the next call on the same console
- * reader.  The libxl caller may overwrite parts of the string
- * if it wishes. */
+ * reader. */
 int libxl_xen_console_read_line(libxl_ctx *ctx,
                                 libxl_xen_console_reader *cr,
-                                char **line_r)
+                                char **buff)
 {
     int ret;
     /* number of chars to copy into the buffer.  xc_readconsolering()
@@ -818,10 +820,10 @@ int libxl_xen_console_read_line(libxl_ctx *ctx,
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


