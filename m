Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13BB98F5B0
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:00:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809693.1222228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ7B-0000pN-Mi; Thu, 03 Oct 2024 17:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809693.1222228; Thu, 03 Oct 2024 17:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ7B-0000iA-0N; Thu, 03 Oct 2024 17:59:49 +0000
Received: by outflank-mailman (input) for mailman id 809693;
 Thu, 03 Oct 2024 17:59:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swQ78-0006qR-7i
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:59:46 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45031798-81b1-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 19:59:44 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d4979b843so166966266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:59:44 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731a5sm111876166b.180.2024.10.03.10.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:59:42 -0700 (PDT)
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
X-Inumbo-ID: 45031798-81b1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727978383; x=1728583183; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihqfJnptAe3gMr73Ctv/JCvxYIXJfjbjM0EEMcUbg4M=;
        b=lP4LdnwjBaZlNMBWkz03XsvWzeSmG4YcS2ZUrYV9ajH54dBcFgghhRS9QSkIs+wbdm
         KaYDA3+9TEnbq8/o7GumS0Y6BlzLShM8eR/wOlVVGKrco60JTVzYFIlwqQLVlUYdrocE
         0B3zBgkAccr5gGANx3O4mZTNLRtLAStuRspQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727978383; x=1728583183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihqfJnptAe3gMr73Ctv/JCvxYIXJfjbjM0EEMcUbg4M=;
        b=hpFWlZSpnk1YSigq0u8DfPhym5Ltdzj/z8812QWyxf1E7ff9PznH31Mw4Dtjn9C49B
         mV8VZtYxsBl5pOXD5TiXqloZzJPKCJGmgLBjZ0u+lgeOXmXn7xiuDfCLaGQUtDVpXFMQ
         ms/3tePnYCkfPDDQahbhjRXultU1O9VxhDYfSsaR6JtjMw+fYf05kYuetS7defWePpJs
         tJTCmRSQTGxRSfdFlWa+p/oS68VEKWQPsXQTcImlBBLXMEwXr9quKmjAsKh9qZoJgAGl
         DfW1nwEZNGpIwYRoQSC7svzdstIz3XMOrZ5S/clYPrrSjOcqxhu48e0B83LQmx8UCmMK
         CIAQ==
X-Gm-Message-State: AOJu0Ywlk6rSUNPx4BVHtgGKkLMq4S+iFfe7TpX1/+XdGGA+p0gNQ5/2
	6IcKwh28B3RfAvg3oiqMhCPDXzasQR/SOnDDYaiLsVZ6vdAI2T/tm9AOx6tZVbyDimOzc+hixWf
	5
X-Google-Smtp-Source: AGHT+IGsa/j+QFla8M0rMNXnvjdlmaRtM5F4pbIuE59B58KCqATfQ67JHFB/hHRps6Jjdmgv3oj8tw==
X-Received: by 2002:a17:906:bc1d:b0:a8a:926a:d02a with SMTP id a640c23a62f3a-a991bfe3771mr18674266b.49.1727978383212;
        Thu, 03 Oct 2024 10:59:43 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 11/19] xen: Update header guards - Kconfig
Date: Thu,  3 Oct 2024 18:59:11 +0100
Message-Id: <20241003175919.472774-12-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003175919.472774-1-frediano.ziglio@cloud.com>
References: <20241003175919.472774-1-frediano.ziglio@cloud.com>
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


