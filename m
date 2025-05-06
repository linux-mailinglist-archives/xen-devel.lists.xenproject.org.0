Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA3BAACAD3
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:24:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977527.1364515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCL5k-0005tW-Ru; Tue, 06 May 2025 16:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977527.1364515; Tue, 06 May 2025 16:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCL5k-0005rs-OV; Tue, 06 May 2025 16:24:24 +0000
Received: by outflank-mailman (input) for mailman id 977527;
 Tue, 06 May 2025 16:24:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEbg=XW=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uCL5j-0005g0-1D
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:24:23 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90e5cef5-2a96-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 18:24:21 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ad1e8e2ad6bso2718666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:24:21 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189146fc0sm733748266b.19.2025.05.06.09.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:24:19 -0700 (PDT)
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
X-Inumbo-ID: 90e5cef5-2a96-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746548660; x=1747153460; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D6W4oCrqGq7LWMq3BRb8qg3DzAc8pBwP3QkcxnP1CHc=;
        b=VdusNBekmmam6jec4N7kY7DAyjczhKMQtkqXUy95GYJCypxbSUPbypcChuUum9pJb6
         dUhicscKdgo7xZZoHL4Ks6mx/8Q9sqVrPGCSjvmwblWaLvRqYLLGpyVMU59JUQpugyBk
         uflrnWix6SPZJmp01oAxhOOJvLaG3mjh0T7Uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746548660; x=1747153460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6W4oCrqGq7LWMq3BRb8qg3DzAc8pBwP3QkcxnP1CHc=;
        b=E79V4/J6hvMl0N0LMy72jEXHuhwkgySBPPPvWr8l5aKKvjX4PGQTySsJWKg8l1qmef
         P8e9lKFZGRO0hKK+Au4UE2N+FAppsT/HIyClNBAH3pZJqMpnrWgRQgP7kJEuMI2WjqUm
         NfgV3HsDAi6fGOtkawi5PlSDkKHA60vJTZNYWxDK8NdRBxYwQ5hSJHiP971eX2qFxmjB
         vzHueKvxhP3PMaeokG8q2uZf9lHBUktxO1i64L7+P+8odNW9sDR0ZJF+lcbMBKLSBIGI
         Uop3FGzOjUjttnMHjq8z6OB4g6ycZnWPa559kZup+S9YkBZuTVUeeAPv0/sNDma4fRao
         0MEw==
X-Gm-Message-State: AOJu0Yz1u9js5red6ZR5GvHlK/vnXexX2gGfZRBOkNVJkH9RZZ7plBJn
	45+/xQk+Va8Ac5Ww6GszgHBUG+6152Ez48rb1c0zL1SxYRNiLDqlNfBkV/JLlZ0oqKxVbok/eeu
	0
X-Gm-Gg: ASbGnct14ed3N2yqPq0jIt8KG3c4fNBN3U8Bjhw/i94SJlsLFl3v9l8raeHlpCfkYJd
	cjYX59sKGfP+1vV6X0CM89Kva6hHsR0TKXncNfsCu9bpsRsNSgjM3W9/nFwTS7cXph2MxP6/KYg
	ItETVXzjh7RE8fz6oNDmis5FPrfezNf4kozriie4sqSXBXQbSaRtzPgs6gubDgMAYiOZ0llGJe/
	TfF3s3N4BOvUAp+w2WyXeXwmwkOGRV3KUbiW4le83qAsmthadYiTLjpYyyVwKwhGCe5CUnh3obW
	VOSV9VbFzgaOFB1CU7+azs8hcHz6vS2b8pBDaq5mkTHD/sADfetopJTKyg==
X-Google-Smtp-Source: AGHT+IH/fEZsbFLY7rwMxLyvVvN7eP7Cd6vA9qL9ijxhFj9v24N5lpoRHXaR7tJ1UDM1nu0PySm4SA==
X-Received: by 2002:a17:907:d48f:b0:ac3:853e:4345 with SMTP id a640c23a62f3a-ad1e8dbc85amr4933566b.45.1746548660462;
        Tue, 06 May 2025 09:24:20 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Lampis <kevin.lampis@cloud.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 1/4] lib: Add strcspn function
Date: Tue,  6 May 2025 17:24:20 +0100
Message-ID: <20250506162420.1676377-1-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will be used by future patches.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
---
 xen/include/xen/string.h |  1 +
 xen/lib/Makefile         |  1 +
 xen/lib/strcspn.c        | 22 ++++++++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 xen/lib/strcspn.c

diff --git a/xen/include/xen/string.h b/xen/include/xen/string.h
index bd4a8f48e9..70c231b690 100644
--- a/xen/include/xen/string.h
+++ b/xen/include/xen/string.h
@@ -26,6 +26,7 @@ size_t strnlen(const char *s, size_t count);
 char *strpbrk(const char *cs,const char *ct);
 char *strsep(char **s, const char *ct);
 size_t strspn(const char *s, const char *accept);
+size_t strcspn(const char *s, const char *reject);
 
 void *memset(void *s, int c, size_t n);
 void *memcpy(void *dest, const void *src, size_t n);
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
index 0000000000..42e3308dac
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
+size_t strcspn(const char *s, const char *reject)
+{
+	const char *p;
+
+	for (p = s; *p != '\0'; ++p) {
+		if (strchr(reject, *p))
+			break;
+	}
+	return p - s;
+}
-- 
2.42.0


