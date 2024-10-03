Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB7298EF10
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 14:19:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809335.1221670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKnw-0006Zc-4w; Thu, 03 Oct 2024 12:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809335.1221670; Thu, 03 Oct 2024 12:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKnv-0006OG-Pc; Thu, 03 Oct 2024 12:19:35 +0000
Received: by outflank-mailman (input) for mailman id 809335;
 Thu, 03 Oct 2024 12:19:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swKns-00043u-UA
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 12:19:32 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdeb1455-8181-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 14:19:31 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c88e6926e5so877411a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 05:19:31 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a991047319asm77328366b.184.2024.10.03.05.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 05:19:29 -0700 (PDT)
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
X-Inumbo-ID: bdeb1455-8181-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727957970; x=1728562770; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihqfJnptAe3gMr73Ctv/JCvxYIXJfjbjM0EEMcUbg4M=;
        b=VQEbhrBTcV8w0YaPbt484aYqqA1MMED1zmAN/d2ZjB6rW2hAoxxArprmWtOgk0/yTY
         NWVhHgjwE5IXphYpz+oyd2jpzPpV3x9akETtZivRZMuR6o7/lESfeL5ELrr1tAohYUK5
         deXhleW8iRy9cOq7TyqlpFT1DITtEWCcqfcL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727957970; x=1728562770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihqfJnptAe3gMr73Ctv/JCvxYIXJfjbjM0EEMcUbg4M=;
        b=cJcQO6zquuJuNuHaAJFJP3n8aH0Bl33QljFYXH2Yi7qbyg7n8iI1fLzhr1kPVUz2Zj
         Yh81RN4FDgvO+9PtLgvPSWlg904WMuYBpbf9C50BGcASOJclB8aKosjs+wuLJuR5Htrh
         gVSlWQKhZLr6M2us82bV7/cr9Av8Dl889grKRvkRKr80flAW4moLWoJkpDorR7eaPL4Z
         OodTBwCit14lCK0sF530JVLq3F4Hx6wpqsnov8XWMTj5FbU7nBqI27gjHBA/Cgje8coc
         dgRj8bxPqT3UcT7wXa1Re3ihCFAqzFCfe3RgquHzZn5e8quKaTidUiVTrSDvUCkSLEyy
         dLIg==
X-Gm-Message-State: AOJu0Yx0+fuIxUKhrr89aagmEMq0G8eq/wkaNszQlm3H5FaIm9xLTFha
	TGdn5n+/dNosC9NbD1wLzuaZwcYrzNZ/6nEss9Ui8ueKRS7MiWAonuDZqRFkLDNMFuuA8Cpr0U5
	C
X-Google-Smtp-Source: AGHT+IFynxD+YoOmKiSyIqAi6RrEgODcI9FRDEPEp9qOPw/jfy5l5HI7pWz+ExIxYdW2M3eXB/qM8Q==
X-Received: by 2002:a17:907:97d1:b0:a86:b85d:9470 with SMTP id a640c23a62f3a-a98f8387cc3mr691931866b.59.1727957970193;
        Thu, 03 Oct 2024 05:19:30 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 11/20] xen: Update header guards - Kconfig
Date: Thu,  3 Oct 2024 13:18:59 +0100
Message-Id: <20241003121908.362888-12-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003121908.362888-1-frediano.ziglio@cloud.com>
References: <20241003121908.362888-1-frediano.ziglio@cloud.com>
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


