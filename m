Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22B5AAE376
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 16:46:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978625.1365365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCg2B-000329-Uq; Wed, 07 May 2025 14:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978625.1365365; Wed, 07 May 2025 14:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCg2B-0002zQ-Rz; Wed, 07 May 2025 14:46:07 +0000
Received: by outflank-mailman (input) for mailman id 978625;
 Wed, 07 May 2025 14:46:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=36rF=XX=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uCg2A-0002zK-7P
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 14:46:06 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff096c73-2b51-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 16:46:02 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5f624291db6so10662241a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 07:46:02 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa777c8afbsm9946688a12.28.2025.05.07.07.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 07:46:00 -0700 (PDT)
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
X-Inumbo-ID: ff096c73-2b51-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746629161; x=1747233961; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fm8GvBKyefl643EIoUMiwdToE8v/dTaREVxXV3Hhr4=;
        b=guuYvli8JRYacTj0fqZkM2iUs2ID1a4MSdEDtoSUEDEmFr3Xkme0abmRUOdvdJVhJw
         pYh9vIDuLUvw1AchtazYc05DlzKQKsU/lMPcHkdJY+1fwvJDBRi50lprZi5I6ZsfnkEX
         ny2R4aU23y6OISCQaYeTWkaH3XL3fzCBlRR9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746629161; x=1747233961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fm8GvBKyefl643EIoUMiwdToE8v/dTaREVxXV3Hhr4=;
        b=nkIT1X6P6tZFHhnc3ZHzLRwG/aAWIBZnWpBotsQ3VW3h4XBjGE6A9vseABRmlq+rmt
         u9+Fi0OwbUW7F4Y9ObcQBTWdV+KF3D7oH30H8KQbq6qCEjgJgsef8PkwJvmJkMoBahwh
         cn0ii6FrIzVZGZ+deVtgUOP/O3SFMs3Gs6gMplf0/7oUtVof37ZoghVOVxZOGQCirW3l
         RmT86h+ICIIjZXj0Ge0rxJZTLBJc6XHyVONpIWbxYfVdpxy4PCmPEKFLb1tdd7FWSc/d
         ki90fTVG6PgZd6W0ItGl/lmWnKkhYztUUv+nP9XDvytjYugPIxobVWRetLjdQPDJklvv
         o+pQ==
X-Gm-Message-State: AOJu0YzVFX8NMa3QSWlWXn/BZrqiWODb5F6+E9wwHUc4zGFH8/6Vyads
	I7+5PWOWt7Iqp+NAfeZPI30pWPwTSLfBjQKaHgzKV2KxxG2Tq+rAjrZ6EmbQEueDd4x40lprkXs
	k
X-Gm-Gg: ASbGncuCJ7I2Dtwq98FLtLqsOuc7Ncny7xfuLmA6FauEYHtoI4REg1u2H9QPRmNFhPQ
	NrsOX8GjNtEcPB79LqzQUwDLbGUvBu7ffdtkKOp9fdyXzEfoI1GE2fYVzmt/aF93hiF2dtRey03
	IEumMzVEmlEr4KvjAzDa7mVyFa2GYm0pxMvN/gm0EmVz/6CdvmhF21gXdQ/sna1uZnBWCxy9rXr
	sDscqwom1ahGetv6HcqtPTl+DoqMcNI592pLZ3ztvTr4wrXIt/f4Lx52my9XyhHcyRPHe2DfMca
	X4JthnvVKsR1pSR/EkHqdshMSW6Bfse2vmWF5kvi0+9bJDJzmrXFavdogQ==
X-Google-Smtp-Source: AGHT+IFtbJluCTeQl0bQOCI1n1/entZBGGWQobFJkxMQHzTI03UxDUZQY1CRSYteVw0LBBeTM7SOow==
X-Received: by 2002:a05:6402:440b:b0:5fb:1fbd:e3ad with SMTP id 4fb4d7f45d1cf-5fbe9dfb8ddmr3446786a12.13.1746629161034;
        Wed, 07 May 2025 07:46:01 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Kevin Lampis <kevin.lampis@cloud.com>
Subject: [PATCH v2] lib: Add strcspn function
Date: Wed,  7 May 2025 15:45:00 +0100
Message-ID: <20250507144515.1704100-1-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <50a2737a-611a-4d83-aee6-de23619b0b6b@citrix.com>
References: <50a2737a-611a-4d83-aee6-de23619b0b6b@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Lagerwall <ross.lagerwall@citrix.com>

This will be used by future patches.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
---
Changes in v2:
- Add alias to __builtin_strcspn
---
 xen/include/xen/string.h |  5 +++++
 xen/lib/Makefile         |  1 +
 xen/lib/strcspn.c        | 22 ++++++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 xen/lib/strcspn.c

diff --git a/xen/include/xen/string.h b/xen/include/xen/string.h
index bd4a8f48e9..0ad65303da 100644
--- a/xen/include/xen/string.h
+++ b/xen/include/xen/string.h
@@ -26,6 +26,7 @@ size_t strnlen(const char *s, size_t count);
 char *strpbrk(const char *cs,const char *ct);
 char *strsep(char **s, const char *ct);
 size_t strspn(const char *s, const char *accept);
+size_t strcspn(const char *s, const char *reject);
 
 void *memset(void *s, int c, size_t n);
 void *memcpy(void *dest, const void *src, size_t n);
@@ -68,6 +69,10 @@ void *memchr_inv(const void *s, int c, size_t n);
 #define strlen(s1) __builtin_strlen(s1)
 #endif
 
+#ifndef __HAVE_ARCH_STRCSPN
+#define strcspn(s, r) __builtin_strcspn(s, r)
+#endif
+
 #ifndef __HAVE_ARCH_MEMSET
 #define memset(s, c, n) __builtin_memset(s, c, n)
 #endif
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 76dc86fab0..5ccb1e5241 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -22,6 +22,7 @@ lib-y += sort.o
 lib-y += strcasecmp.o
 lib-y += strchr.o
 lib-y += strcmp.o
+lib-y += strcspn.o
 lib-y += strlcat.o
 lib-y += strlcpy.o
 lib-y += strlen.o
diff --git a/xen/lib/strcspn.c b/xen/lib/strcspn.c
new file mode 100644
index 0000000000..d572931f54
--- /dev/null
+++ b/xen/lib/strcspn.c
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strcspn - Calculate the length of the initial substring of @s which does not contain letters in @reject
+ * @s: The string to be searched
+ * @reject: The string to avoid
+ */
+size_t (strcspn)(const char *s, const char *reject)
+{
+       const char *p;
+
+       for (p = s; *p != '\0'; ++p) {
+               if (strchr(reject, *p))
+                       break;
+       }
+       return p - s;
+}
-- 
2.42.0


