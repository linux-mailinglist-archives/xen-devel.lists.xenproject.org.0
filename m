Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC51295D3FD
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 19:05:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782501.1192009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXjD-0004XK-OU; Fri, 23 Aug 2024 17:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782501.1192009; Fri, 23 Aug 2024 17:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXjD-0004Uv-LA; Fri, 23 Aug 2024 17:05:35 +0000
Received: by outflank-mailman (input) for mailman id 782501;
 Fri, 23 Aug 2024 17:05:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kBLJ=PW=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1shXjC-00048i-IT
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 17:05:34 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8f107b9-6171-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 19:05:34 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5bed83489c3so2851608a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 10:05:34 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a3eb329sm2311240a12.55.2024.08.23.10.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 10:05:32 -0700 (PDT)
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
X-Inumbo-ID: e8f107b9-6171-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724432733; x=1725037533; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VIye94cR8IJfpIZ8L9EApwOAmNPuWDMwQhUPHfNmgs=;
        b=MSJWAcbFddUMHEy6LfiUEbx7Di0J8MDNgNIDqxZE/MWH4ArPw3Pm8uj0ZQ0CfrJSLv
         XVdR5pG08UBTVq1NzreOJY/6MimeAyPrClfhisHOVTdMZ5224biUvfJyGYF6fqqZSr1x
         jSM5wfkte8dAYnVeQr1hhXh398n6rCDNDmu5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724432733; x=1725037533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VIye94cR8IJfpIZ8L9EApwOAmNPuWDMwQhUPHfNmgs=;
        b=FdTsfJpVuh2gZIQO1TCZ/0QkUiVH5SO7pjp5zyvh2mlBSU9vbAZHZN1F3W8Uu6NiMO
         nn1gPqLr/XwY1K3IKVMXuxvXdPLYEHbPr4xnr6uV9rGDhjYQtbE082kDiDLPf09j/v6R
         PQSPj0LjIFBbLUew0pHoWG/2RNQ4USAyR5D27S8j8pfO3lqLZsUQlXBVJwGPOayg5vfT
         4aSa3VxSZUAshCNjJ1k7zd8b7u8obAARglmRLpGaffImTa2B/OLL6muG1wOZ6CRHfaNf
         pLj/E7S8gluOiqNIwz1bfzM6lHTpNi7HNs+t1IIFtl6R8F2ENABGp0d+NbWmLg+FlnZe
         xK+A==
X-Gm-Message-State: AOJu0Yzopp+Vggh6S2Q2LQ2ndzkDVth1pW3T0c0rJC5i+RN3JxHvmb5W
	8hSAFi9WgPy7HRjpWSi4uzqp1jyqoQpX6uUK1jLK2b1Y2jlvacWmo5wR2FFbf4M68ZZI9hni7vG
	c
X-Google-Smtp-Source: AGHT+IHcVUId93VWEXlfsjTxnksH0mjTfTAjn1kakV6hRAVCHTAcJ6ZkNu8RxbgHVtSlFErE5o2Rxg==
X-Received: by 2002:a05:6402:1d4f:b0:5bf:b29:6ec6 with SMTP id 4fb4d7f45d1cf-5c0891a9e7emr1746069a12.37.1724432732619;
        Fri, 23 Aug 2024 10:05:32 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	Javi Merino <javi.merino@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
Subject: [XEN PATCH v2 1/3] libxl: Fix nul-termination of the return value of libxl_xen_console_read_line()
Date: Fri, 23 Aug 2024 18:05:03 +0100
Message-ID: <b1c7eb226ce62f50d6a50baa3977830a31fa5c9b.1724430173.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1724430173.git.javi.merino@cloud.com>
References: <cover.1724430173.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When built with ASAN, "xl dmesg" crashes in the "printf("%s", line)"
call in main_dmesg().  ASAN reports a heap buffer overflow: an
off-by-one access to cr->buffer.

The readconsole sysctl copies up to count characters into the buffer,
but it does not add a null character at the end.  Despite the
documentation of libxl_xen_console_read_line(), line_r is not
nul-terminated if 16384 characters were copied to the buffer.

Fix this by asking xc_readconsolering() to fill the buffer up to size
- 1.  As the number of characters in the buffer is only needed in
libxl_xen_console_read_line(), make it a local variable there instead
of part of the libxl__xen_console_reader struct.

Fixes: 4024bae739cc ("xl: Add subcommand 'xl dmesg'")
Reported-by: Edwin Török <edwin.torok@cloud.com>
Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 tools/libs/light/libxl_console.c  | 14 ++++++++++----
 tools/libs/light/libxl_internal.h |  1 -
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
index a563c9d3c7f9..012fd996fba9 100644
--- a/tools/libs/light/libxl_console.c
+++ b/tools/libs/light/libxl_console.c
@@ -774,12 +774,14 @@ libxl_xen_console_reader *
 {
     GC_INIT(ctx);
     libxl_xen_console_reader *cr;
-    unsigned int size = 16384;
+    /* We want xen to fill the buffer in as few hypercalls as
+     * possible, but xen will not nul-terminate it.  Leave one byte at
+     * the end for the null */
+    unsigned int size = 16384 + 1;
 
     cr = libxl__zalloc(NOGC, sizeof(libxl_xen_console_reader));
     cr->buffer = libxl__zalloc(NOGC, size);
     cr->size = size;
-    cr->count = size;
     cr->clear = clear;
     cr->incremental = 1;
 
@@ -800,10 +802,14 @@ int libxl_xen_console_read_line(libxl_ctx *ctx,
                                 char **line_r)
 {
     int ret;
+    /* number of chars to copy into the buffer.  xc_readconsolering()
+     * does not add a null character at the end, so leave a space for
+     * us to add it. */
+    unsigned int nr_chars = cr->size - 1;
     GC_INIT(ctx);
 
     memset(cr->buffer, 0, cr->size);
-    ret = xc_readconsolering(ctx->xch, cr->buffer, &cr->count,
+    ret = xc_readconsolering(ctx->xch, cr->buffer, &nr_chars,
                              cr->clear, cr->incremental, &cr->index);
     if (ret < 0) {
         LOGE(ERROR, "reading console ring buffer");
@@ -811,7 +817,7 @@ int libxl_xen_console_read_line(libxl_ctx *ctx,
         return ERROR_FAIL;
     }
     if (!ret) {
-        if (cr->count) {
+        if (nr_chars) {
             *line_r = cr->buffer;
             ret = 1;
         } else {
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 3b58bb2d7f43..96d14f5746e1 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2077,7 +2077,6 @@ _hidden char *libxl__uuid2string(libxl__gc *gc, const libxl_uuid uuid);
 struct libxl__xen_console_reader {
     char *buffer;
     unsigned int size;
-    unsigned int count;
     unsigned int clear;
     unsigned int incremental;
     unsigned int index;
-- 
2.45.2


