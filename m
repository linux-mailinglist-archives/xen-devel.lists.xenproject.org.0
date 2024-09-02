Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30C7968C20
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 18:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788265.1197753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slA4p-0002cS-JF; Mon, 02 Sep 2024 16:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788265.1197753; Mon, 02 Sep 2024 16:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slA4p-0002ZP-Fe; Mon, 02 Sep 2024 16:38:51 +0000
Received: by outflank-mailman (input) for mailman id 788265;
 Mon, 02 Sep 2024 16:38:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSuM=QA=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1slA4o-0002KR-3F
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 16:38:50 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d40e8d87-6949-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 18:38:48 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c25554ec1eso1441889a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 09:38:48 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c74184sm5714163a12.32.2024.09.02.09.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 09:38:47 -0700 (PDT)
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
X-Inumbo-ID: d40e8d87-6949-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725295128; x=1725899928; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6eT7Yk/7LIs6hDfcYQ7HO3X7+DA9vMIsVz9MMYObK8=;
        b=BnMi8YCwoctfg1FX4UparMgPtORzPut6xhd1mSVbOhAGL378JAAImRl82zZcgaiH4Z
         7H4Ncmkdvdj7E2T/zQJBkSVF5ztLQURemCuDs+APMCdaWCrBEXoSwrM1Q+9QS83LePe8
         xQQOwQFOtXTJoDZi7ZYRsUOHPnteVkNbUFIqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725295128; x=1725899928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6eT7Yk/7LIs6hDfcYQ7HO3X7+DA9vMIsVz9MMYObK8=;
        b=i2i3enuLonWR2VlssHW3COzAx7unLjESBm1PdaZZzMwjb9xB4pOVRw6QsVrXA3Zn5M
         YXS3SXYMM4UiYFZA3Rjbd8hywyStYWAOAfNp0h4T/S3jeLzwo882yiGA3qnTlgR4qr+M
         GoGiY/edXn+OyNDsEzoyC8LOB4R1cEZGykY3uYj9SFqlrqUM2WaJLnjba4K06p/u+Xe5
         c5TBMm4Eq3z8ELLyxpoE+Zljf4gR7JLLLTUdCEHdg4lj173fUwLR+pxiM1ERAc2CsNrx
         2YoiFLHhHg1aFi7yxd+GcQXFDHfRoXyk4CvjmYJ4O6EBYOkgi1m0Ppa1YvV1Gll1N8jt
         l79g==
X-Gm-Message-State: AOJu0Yyfnd9ELOSvk1WLgyBypNCxCDF6tgPeFe7/oGMe7E1SijYh4bQa
	YwpSNXumbanBT3jeU+TDtH/CPTOOBysvsg9h1WrgUmYsx/YKeyI448JQNH6EvSzTKjD5Gq/ONGP
	q9kg=
X-Google-Smtp-Source: AGHT+IFicB+fQM5XiuO8ifLtLIo0YpKL2FO35R3K8EcmdRWCq5G9bU1kGIOqb3I9vrQp+m40W6rnKw==
X-Received: by 2002:a05:6402:51d2:b0:5be:eb90:183c with SMTP id 4fb4d7f45d1cf-5c21ed314abmr11860340a12.6.1725295127549;
        Mon, 02 Sep 2024 09:38:47 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
Subject: [XEN PATCH v3 1/3] libxl: Fix nul-termination of the return value of libxl_xen_console_read_line()
Date: Mon,  2 Sep 2024 17:38:37 +0100
Message-ID: <37e935be214083f1b16b5da4d3be09e7cbafc971.1725294334.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1725294334.git.javi.merino@cloud.com>
References: <cover.1725294334.git.javi.merino@cloud.com>
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
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 tools/libs/light/libxl_console.c  | 19 +++++++++++++++----
 tools/libs/light/libxl_internal.h |  1 -
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
index a563c9d3c7f9..9f736b891335 100644
--- a/tools/libs/light/libxl_console.c
+++ b/tools/libs/light/libxl_console.c
@@ -774,12 +774,17 @@ libxl_xen_console_reader *
 {
     GC_INIT(ctx);
     libxl_xen_console_reader *cr;
-    unsigned int size = 16384;
+    /*
+     * We want xen to fill the buffer in as few hypercalls as
+     * possible, but xen will not nul-terminate it.  The default size
+     * of Xen's console buffer is 16384.  Leave one byte at the end
+     * for the null character.
+     */
+    unsigned int size = 16384 + 1;
 
     cr = libxl__zalloc(NOGC, sizeof(libxl_xen_console_reader));
     cr->buffer = libxl__zalloc(NOGC, size);
     cr->size = size;
-    cr->count = size;
     cr->clear = clear;
     cr->incremental = 1;
 
@@ -800,10 +805,16 @@ int libxl_xen_console_read_line(libxl_ctx *ctx,
                                 char **line_r)
 {
     int ret;
+    /*
+     * Number of chars to copy into the buffer.  xc_readconsolering()
+     * does not add a null character at the end, so leave a space for
+     * us to add it.
+     */
+    unsigned int nr_chars = cr->size - 1;
     GC_INIT(ctx);
 
     memset(cr->buffer, 0, cr->size);
-    ret = xc_readconsolering(ctx->xch, cr->buffer, &cr->count,
+    ret = xc_readconsolering(ctx->xch, cr->buffer, &nr_chars,
                              cr->clear, cr->incremental, &cr->index);
     if (ret < 0) {
         LOGE(ERROR, "reading console ring buffer");
@@ -811,7 +822,7 @@ int libxl_xen_console_read_line(libxl_ctx *ctx,
         return ERROR_FAIL;
     }
     if (!ret) {
-        if (cr->count) {
+        if (nr_chars) {
             *line_r = cr->buffer;
             ret = 1;
         } else {
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 089a2f949c53..cfac8e18b6d3 100644
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


