Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A415867EDE
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685695.1066859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewj-0000b2-5l; Mon, 26 Feb 2024 17:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685695.1066859; Mon, 26 Feb 2024 17:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewj-0000SY-0U; Mon, 26 Feb 2024 17:39:21 +0000
Received: by outflank-mailman (input) for mailman id 685695;
 Mon, 26 Feb 2024 17:39:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewh-0007o5-8r
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:19 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f71e570e-d4cd-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 18:39:17 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d26227d508so37271881fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:17 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:15 -0800 (PST)
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
X-Inumbo-ID: f71e570e-d4cd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969157; x=1709573957; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZDHTEej6Jv3SYqhJWcdCnlmv5/Saryrf0OJ+2bCraY=;
        b=f/BTuAOOL9lrH1hLeKUPooDvh2qzJ8i95BO0kUpxtORTrQW+t+1xPGBXirQuum6B8G
         XJgntsVAix3Z5bMWIgJblP31oSvyiRyMQuQTkHt6BeXU6EgPIcr8SZ9I2tcAgwq3HyIx
         chQBzR01FGqxnhiXX6OP2YSUJaXxm/l5OdE0sCw1K3e/7epV7oAPNeQ//JYpOq8ETPQZ
         saK4ZsTzRyY0KG1p1P0TIz94zRt28Pri4vKEukhiSYIO+lWGi4NXfIu/wJ0MI3kJO1I5
         Mzd4RwgNtEoz2Wd8PXO9q9aD4YOt8qJYXHbyiXi8wZC+qYcfi3LRmUvzlsRCSfbhID/L
         30Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969157; x=1709573957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZDHTEej6Jv3SYqhJWcdCnlmv5/Saryrf0OJ+2bCraY=;
        b=j7p44ND+o0vi4ndD/kHTFYAOm+oEC/WVhJE7/Qmr9Jb0tj8Dr3m6a1jxYhtz+dS038
         FSedbsSIw2LZviCgB3g8/9gYqgnlw+tRyvy+tYZkSUdLNZ5+uiz+qYYl20ZxTxPfse1V
         15cxC91TL8SqGPLa8ADUTJbeuarOfw3KgdzetLZFkjNL5Xz1o4j1+sbCw+OwlOZsqiLH
         Q8EaWh0NopXdA4qx/Zb4IE79yQ5H4HKhhaB841RsWxq8TJgcKlx6OQZjZlqFbS0y1B4H
         2gaFNHpjP4VCftIyVMqqs7r1s0kHHBvFdk6a2Pl/7ME+W3gSyZ/b8LAV4G3m8hybrhcl
         aTxw==
X-Gm-Message-State: AOJu0YxzlJuf3WMo6o7rierF08/8j8jQHTnKQsujIcAz1wAjLIZ9vBKV
	GOzfZZYX+97NKWTpCADuqRryS9dvzRGpMkSdkDNbDwiL5x+BE1LuSKca3WfX
X-Google-Smtp-Source: AGHT+IHFR4+Ivxmy7gFlPOXPEnFVpLHuKhIHnvGtUwBdkWRa4mfpFeN/WIg0Q58ss7HZNSYz5/nM6Q==
X-Received: by 2002:a2e:bc12:0:b0:2d2:607e:8121 with SMTP id b18-20020a2ebc12000000b002d2607e8121mr5407859ljf.43.1708969156635;
        Mon, 26 Feb 2024 09:39:16 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 05/23] xen/asm-generic: introduce generic find first set bit functions
Date: Mon, 26 Feb 2024 18:38:47 +0100
Message-ID: <f4fce2215f629f5fe76f79557e1fe7a55876014c.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions can be useful for architectures that don't
have corresponding arch-specific instructions.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V5:
   - new patch
---
 xen/include/asm-generic/bitops/__ffs.h        | 47 +++++++++++++++++++
 xen/include/asm-generic/bitops/ffs.h          |  9 ++++
 xen/include/asm-generic/bitops/ffsl.h         | 16 +++++++
 .../asm-generic/bitops/find-first-set-bit.h   | 17 +++++++
 4 files changed, 89 insertions(+)
 create mode 100644 xen/include/asm-generic/bitops/__ffs.h
 create mode 100644 xen/include/asm-generic/bitops/ffs.h
 create mode 100644 xen/include/asm-generic/bitops/ffsl.h
 create mode 100644 xen/include/asm-generic/bitops/find-first-set-bit.h

diff --git a/xen/include/asm-generic/bitops/__ffs.h b/xen/include/asm-generic/bitops/__ffs.h
new file mode 100644
index 0000000000..fecb4484d9
--- /dev/null
+++ b/xen/include/asm-generic/bitops/__ffs.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS___FFS_H_
+#define _ASM_GENERIC_BITOPS___FFS_H_
+
+/**
+ * ffs - find first bit in word.
+ * @word: The word to search
+ *
+ * Returns 0 if no bit exists, otherwise returns 1-indexed bit location.
+ */
+static inline unsigned int __ffs(unsigned long word)
+{
+    unsigned int num = 0;
+
+#if BITS_PER_LONG == 64
+    if ( (word & 0xffffffff) == 0 )
+    {
+        num += 32;
+        word >>= 32;
+    }
+#endif
+    if ( (word & 0xffff) == 0 )
+    {
+        num += 16;
+        word >>= 16;
+    }
+    if ( (word & 0xff) == 0 )
+    {
+        num += 8;
+        word >>= 8;
+    }
+    if ( (word & 0xf) == 0 )
+    {
+        num += 4;
+        word >>= 4;
+    }
+    if ( (word & 0x3) == 0 )
+    {
+        num += 2;
+        word >>= 2;
+    }
+    if ( (word & 0x1) == 0 )
+        num += 1;
+    return num;
+}
+
+#endif /* _ASM_GENERIC_BITOPS___FFS_H_ */
diff --git a/xen/include/asm-generic/bitops/ffs.h b/xen/include/asm-generic/bitops/ffs.h
new file mode 100644
index 0000000000..3f75fded14
--- /dev/null
+++ b/xen/include/asm-generic/bitops/ffs.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_FFS_H_
+#define _ASM_GENERIC_BITOPS_FFS_H_
+
+#include <xen/macros.h>
+
+#define ffs(x) ({ unsigned int t_ = (x); fls(ISOLATE_LSB(t_)); })
+
+#endif /* _ASM_GENERIC_BITOPS_FFS_H_ */
diff --git a/xen/include/asm-generic/bitops/ffsl.h b/xen/include/asm-generic/bitops/ffsl.h
new file mode 100644
index 0000000000..d0996808f5
--- /dev/null
+++ b/xen/include/asm-generic/bitops/ffsl.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_FFSL_H_
+#define _ASM_GENERIC_BITOPS_FFSL_H_
+
+/**
+ * ffsl - find first bit in long.
+ * @word: The word to search
+ *
+ * Returns 0 if no bit exists, otherwise returns 1-indexed bit location.
+ */
+static inline unsigned int ffsl(unsigned long word)
+{
+    return generic_ffsl(word);
+}
+
+#endif /* _ASM_GENERIC_BITOPS_FFSL_H_ */
diff --git a/xen/include/asm-generic/bitops/find-first-set-bit.h b/xen/include/asm-generic/bitops/find-first-set-bit.h
new file mode 100644
index 0000000000..7d28b8a89b
--- /dev/null
+++ b/xen/include/asm-generic/bitops/find-first-set-bit.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_FIND_FIRST_SET_BIT_H_
+#define _ASM_GENERIC_BITOPS_FIND_FIRST_SET_BIT_H_
+
+/**
+ * find_first_set_bit - find the first set bit in @word
+ * @word: the word to search
+ *
+ * Returns the bit-number of the first set bit (first bit being 0).
+ * The input must *not* be zero.
+ */
+static inline unsigned int find_first_set_bit(unsigned long word)
+{
+        return ffsl(word) - 1;
+}
+
+#endif /* _ASM_GENERIC_BITOPS_FIND_FIRST_SET_BIT_H_ */
-- 
2.43.0


