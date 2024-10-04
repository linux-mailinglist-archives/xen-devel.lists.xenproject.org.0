Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FA698FEDB
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 10:18:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810093.1222793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVL-0007aT-Rh; Fri, 04 Oct 2024 08:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810093.1222793; Fri, 04 Oct 2024 08:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVL-0007SM-0X; Fri, 04 Oct 2024 08:17:39 +0000
Received: by outflank-mailman (input) for mailman id 810093;
 Fri, 04 Oct 2024 08:17:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=njpt=RA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swdVH-0005Vm-TB
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 08:17:35 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c490f4b-8229-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 10:17:35 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c88b5c375fso2062666a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 01:17:35 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102858a4sm189829366b.49.2024.10.04.01.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 01:17:34 -0700 (PDT)
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
X-Inumbo-ID: 1c490f4b-8229-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728029854; x=1728634654; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihqfJnptAe3gMr73Ctv/JCvxYIXJfjbjM0EEMcUbg4M=;
        b=AKg0Glu5vXg5Mb9jLHbO0WT5dQRMid6lj5mTIug6biZv63tUW+hlIW35w2Bh3glzlT
         a7eR0XnWvUMlh0fQRDw+jtn77nAj/azxvACHYjqwy2xH8MSvzl4CQaLphHMfkEz8V/Du
         UGyBzN8UKEOKlHZbfemI1ro2eT9/Jj2LMl5mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029854; x=1728634654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihqfJnptAe3gMr73Ctv/JCvxYIXJfjbjM0EEMcUbg4M=;
        b=t1P0ZMEYBIzlTBIkPGFt7orXqYNjFdj63oRzH5zrhgIUkULEuJmRa7hYD32Afw3WZc
         g2SAB7zSJ4u2KDk1oHpcqlKPIehm2vnIoZChKw1hIEJ0V7bAho4JpAbJ2nMsWyY2M9+l
         QUJ8t2jD5KJ4s4zirdmL7PHu8n6BI8NcA0mUjBbfF2lKf9rh0qiMMxCTO/+jRa04MlGt
         tfRaJIKd+haFHFW22ekkN+QH770vKNNiv4/RK6lU06xY6lBTzuJPU9nhm2AWj9BICQ2P
         a130bm5SJ6ffQFOlN8i9d/v8k5QehVa/yydrlSvHkwg4K9GKwSaAZmEQ8kzf5oGituRv
         yYYw==
X-Gm-Message-State: AOJu0YwekiH7gP77Xggkk28H6JiyGXfslw5hwbjajwQnxgSa3KPzXjz+
	yEwdmxECLqEImZzbTiYTKiT4xruBUL+Q6RU405iFtXH+ieZYwZffnLx/tSYeSgA7KPqubtb6RgG
	v
X-Google-Smtp-Source: AGHT+IHrsJWbh0dZK0nQkMeMOYldxh0qESnEek/YB7M5NUhS0mXgiDWGbzZLJ0VedI6/6o3QdXtmVQ==
X-Received: by 2002:a17:906:cae5:b0:a7a:b561:3575 with SMTP id a640c23a62f3a-a991bed8a5dmr168686766b.56.1728029854523;
        Fri, 04 Oct 2024 01:17:34 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v3 11/19] xen: Update header guards - Kconfig
Date: Fri,  4 Oct 2024 09:17:05 +0100
Message-Id: <20241004081713.749031-12-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004081713.749031-1-frediano.ziglio@cloud.com>
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to Kconfig.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/tools/kconfig/expr.h   | 6 +++---
 xen/tools/kconfig/images.h | 6 +++---
 xen/tools/kconfig/list.h   | 4 ++--
 xen/tools/kconfig/lkc.h    | 6 +++---
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/tools/kconfig/expr.h b/xen/tools/kconfig/expr.h
index 017843c9a4..044e88deac 100644
--- a/xen/tools/kconfig/expr.h
+++ b/xen/tools/kconfig/expr.h
@@ -3,8 +3,8 @@
  * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
  */
 
-#ifndef EXPR_H
-#define EXPR_H
+#ifndef TOOLS__KCONFIG__EXPR_H
+#define TOOLS__KCONFIG__EXPR_H
 
 #ifdef __cplusplus
 extern "C" {
@@ -329,4 +329,4 @@ static inline int expr_is_no(struct expr *e)
 }
 #endif
 
-#endif /* EXPR_H */
+#endif /* TOOLS__KCONFIG__EXPR_H */
diff --git a/xen/tools/kconfig/images.h b/xen/tools/kconfig/images.h
index d8ff614bd0..4093e881db 100644
--- a/xen/tools/kconfig/images.h
+++ b/xen/tools/kconfig/images.h
@@ -3,8 +3,8 @@
  * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
  */
 
-#ifndef IMAGES_H
-#define IMAGES_H
+#ifndef TOOLS__KCONFIG__IMAGES_H
+#define TOOLS__KCONFIG__IMAGES_H
 
 #ifdef __cplusplus
 extern "C" {
@@ -30,4 +30,4 @@ extern const char *xpm_void[];
 }
 #endif
 
-#endif /* IMAGES_H */
+#endif /* TOOLS__KCONFIG__IMAGES_H */
diff --git a/xen/tools/kconfig/list.h b/xen/tools/kconfig/list.h
index 45cb237ab7..5d30f91282 100644
--- a/xen/tools/kconfig/list.h
+++ b/xen/tools/kconfig/list.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef LIST_H
-#define LIST_H
+#ifndef TOOLS__KCONFIG__LIST_H
+#define TOOLS__KCONFIG__LIST_H
 
 /*
  * Copied from include/linux/...
diff --git a/xen/tools/kconfig/lkc.h b/xen/tools/kconfig/lkc.h
index 4fb16f3166..aee4a94696 100644
--- a/xen/tools/kconfig/lkc.h
+++ b/xen/tools/kconfig/lkc.h
@@ -3,8 +3,8 @@
  * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
  */
 
-#ifndef LKC_H
-#define LKC_H
+#ifndef TOOLS__KCONFIG__LKC_H
+#define TOOLS__KCONFIG__LKC_H
 
 #include "expr.h"
 
@@ -155,4 +155,4 @@ static inline bool sym_has_value(struct symbol *sym)
 }
 #endif
 
-#endif /* LKC_H */
+#endif /* TOOLS__KCONFIG__LKC_H */
-- 
2.34.1


