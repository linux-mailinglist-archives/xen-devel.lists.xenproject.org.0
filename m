Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7097968C23
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 18:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788266.1197760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slA4p-0002iO-WE; Mon, 02 Sep 2024 16:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788266.1197760; Mon, 02 Sep 2024 16:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slA4p-0002d0-QO; Mon, 02 Sep 2024 16:38:51 +0000
Received: by outflank-mailman (input) for mailman id 788266;
 Mon, 02 Sep 2024 16:38:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSuM=QA=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1slA4o-0001qY-Bz
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 16:38:50 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d45234ee-6949-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 18:38:48 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2f4f2868783so44981791fa.2
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
X-Inumbo-ID: d45234ee-6949-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725295128; x=1725899928; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWffGUoWm/YnanzIonTob8Et/hrh7mhg2Z2Ub3j/Ojo=;
        b=JLFhcMqoBkUgbz2Vt3AuJn5wPt5Q94YIZS+UThWSFPa4Gyl962f5DxybAbIQ+NdYjI
         5Ww31XkvsTh7HeuMnZHigDuUurek5gZSeur4FJKmUzCiAUSq31cGppeDsHvw2+eSJcRB
         JoLRZaLW1Pmhq725qh4svQeQ1YKrmIVryuIR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725295128; x=1725899928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWffGUoWm/YnanzIonTob8Et/hrh7mhg2Z2Ub3j/Ojo=;
        b=HfkiU9Bn0zi/VSfyibc6Lte995hpoxM8xy/yAqRMxrYzwoWQGCVZhEpgp9O1esw049
         RwnQuP97zJEBcucrm3r645Yyi71IeSiiLnXJcOZvROhHKSgwu5vHcjrF6AQk2VwsaTW0
         Iq9845EfNiVN8mNaglc0YhRkrfLBNHSAoN2qN1HZ9f08ajvuBOW4HQbRwLCqzq7VklZV
         JBuj1wLWPV5Bgj7VGu4YGMoJM2/v91k1IbvUFy0fa1VkuCL5uOoEvwgNh6QZcngBP0bS
         MxdGrkr02pJSYzu5HPKTmSfJq09JFAJipfp+2nomRqlBiEoCnp3prqs5aW2EIiM+el2z
         sOvQ==
X-Gm-Message-State: AOJu0YxzeD6GD9pKyVKqOqcP84fCItZWVSHnzmTuF9+Ia/zuT9j9TfAV
	Ku/256J8IpYw8eCaxvpzHL/X1uQJTqYmxQT8OoXqzm0NmtHxWHxFmGo28fdcnYurNwwYF+l7DtJ
	cXJY=
X-Google-Smtp-Source: AGHT+IHNn355QRqsxQGZcSLypF32F2FhbBsuyloC2cUeI5ll4szv2VFxdws+d9hum67VUClqmo1kSw==
X-Received: by 2002:a05:651c:1545:b0:2f1:6821:d15c with SMTP id 38308e7fff4ca-2f61e0b268bmr66067351fa.38.1725295128015;
        Mon, 02 Sep 2024 09:38:48 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v3 2/3] libxl: Remove unnecessary buffer zeroing and zalloc()
Date: Mon,  2 Sep 2024 17:38:38 +0100
Message-ID: <f92d56a113c4b0472df2badb207a699d82deadaf.1725294334.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1725294334.git.javi.merino@cloud.com>
References: <cover.1725294334.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When reading the console, xen overwrites the contents of the buffer,
so there is no need to zero the buffer before passing it to xen.
Instead, add a NULL at the end of the buffer.

While we are at it, change the zalloc() of the buffer back to
malloc() as it was before bdf4131 (libxl: don't leak buf in
libxl_xen_console_read_start error handling, 2013-12-03).  The comment
in that commit message says that the intent of the commit was to
change malloc+memset to zalloc(), but only for the
libxl_xen_console_reader struct, not for the buffer.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 tools/libs/light/libxl_console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
index 9f736b891335..6c4414fcc1a2 100644
--- a/tools/libs/light/libxl_console.c
+++ b/tools/libs/light/libxl_console.c
@@ -783,7 +783,7 @@ libxl_xen_console_reader *
     unsigned int size = 16384 + 1;
 
     cr = libxl__zalloc(NOGC, sizeof(libxl_xen_console_reader));
-    cr->buffer = libxl__zalloc(NOGC, size);
+    cr->buffer = libxl__malloc(NOGC, size);
     cr->size = size;
     cr->clear = clear;
     cr->incremental = 1;
@@ -813,7 +813,6 @@ int libxl_xen_console_read_line(libxl_ctx *ctx,
     unsigned int nr_chars = cr->size - 1;
     GC_INIT(ctx);
 
-    memset(cr->buffer, 0, cr->size);
     ret = xc_readconsolering(ctx->xch, cr->buffer, &nr_chars,
                              cr->clear, cr->incremental, &cr->index);
     if (ret < 0) {
@@ -823,6 +822,7 @@ int libxl_xen_console_read_line(libxl_ctx *ctx,
     }
     if (!ret) {
         if (nr_chars) {
+            cr->buffer[nr_chars] = '\0';
             *line_r = cr->buffer;
             ret = 1;
         } else {
-- 
2.45.2


