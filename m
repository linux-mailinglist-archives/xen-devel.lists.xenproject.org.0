Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73F2CE9D1E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 14:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194180.1512645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaa7q-000592-IG; Tue, 30 Dec 2025 13:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194180.1512645; Tue, 30 Dec 2025 13:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaa7q-00052P-Ad; Tue, 30 Dec 2025 13:51:02 +0000
Received: by outflank-mailman (input) for mailman id 1194180;
 Tue, 30 Dec 2025 13:51:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owPK=7E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vaa7o-0004Hp-QZ
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 13:51:00 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92899115-e586-11f0-b15c-2bf370ae4941;
 Tue, 30 Dec 2025 14:50:59 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso80801895e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 05:50:59 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm609436115e9.12.2025.12.30.05.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 05:50:58 -0800 (PST)
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
X-Inumbo-ID: 92899115-e586-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1767102659; x=1767707459; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksrdaSIqpwx0gSdwMJzQe6JesX3RHk4cyQkoMRTQARM=;
        b=bMMYNXN/EGK0xjrft53fh6BnE1Fx+Wcx9W4XVLGsqmU659IAc0hy5RFvxbfYgCLW2o
         uLIWI0gIqm1evIigzD6KK26cFoYQz7D8nwtoQY+62nWdX8ITxsZ9FIgB3tSJkCaY4/U/
         I68XYWwA/uRkTYmH/a5a0OF5jvxp4zOgkGEGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102659; x=1767707459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ksrdaSIqpwx0gSdwMJzQe6JesX3RHk4cyQkoMRTQARM=;
        b=qiq/EbfjaFe0Xb6LP41jKOkRPBiPeRrt6ifdny40TJkVZmcdhwgQw1R7CYIKWMblrL
         HZ9sWplHDwZAWCH7i9+pBmU3Ny5HRegJIaRrbxPWTht0KwXGHqY0pCciIUXPgfER2vWu
         BjcU2qjT1IgxhM6ywMYJ/IaLFnjXuFEUo+kXwK6di9w3u0OEmpdbD2aaMKaQHER3gc6P
         kgs13oyaKq+XdhOZbs8gSWOGr0tVawA5F+skv8A67dPPVhmWCwkHdPchb0ifD6yJ4Gux
         6b2z9l6e733PBqK01rBx//JLar1fPzQoLoAzI5kawuNBFYo1aP/HVZJ1J9246EvCyvIX
         v5ZQ==
X-Gm-Message-State: AOJu0Yx50b0jx8eJEJcFDVhloeBcc3zqjv6TYSQN37dAtW7xX4VTpQtq
	02AO9tXn/r38BUrxfdysXRuNEaATocSMB1Jc/+dpMYwBDQNsv83hGg4as9GVautaSVkeQ07kETU
	xenAF
X-Gm-Gg: AY/fxX5HQ19Y0dLv47WOmpCqghbuSHSPLHYyHiNLZPnkeCAU3OuPeeyoP9K3ct0xiHS
	hGO138xMcSLXcR6K5ScXRQmv+X1sxxJrVJfh1y+i0JYbqEP8O+RE9nahIqJWZqHgoYXUyy2b3e5
	P0y0FTVV0dsweRp02siXsGytGbM5KpMlZO0tZ73bn/Ewu6rId7cZ9NkaSN9IERrQUOMoKRGvnwW
	vVrsvrTvkPmOtowz2hw54EE5vWEv3cgbKWgbwrQ4YsfAbV5VuAQtsYrWuzbw5CcYYe590qo26bk
	WwTYKeD+GBCADcGIEMzBEdDF/hSWgFlxPhsG0XtubA2zQzPRtqnJm/ZT4n3bsjYz4cZRcNQVWmt
	IZRRiBG0uHbqu8PV2tN4apBNvIgzkKWCqBQgZk0Qly/XStKxlxeuuQpQpXiI9OaOJohluO/M46b
	/WL72OJ5qN127C9Qmj2SkJ8DDJDcAfB+LMaUDLzBiwDBcnwoiDykkcKzzyasisC8lW1GhCd9wK
X-Google-Smtp-Source: AGHT+IFAEAT50mQmYWs22sCfPa37f8gLLjVlGYupZVaAxHbVUmEJjNhoe4o1wd6cNKhK2hePrh8pkA==
X-Received: by 2002:a05:600c:6812:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-47d1955b97cmr412637705e9.6.1767102658924;
        Tue, 30 Dec 2025 05:50:58 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 5/5] xen: Move x86-ism out of muldiv64.c
Date: Tue, 30 Dec 2025 13:50:50 +0000
Message-Id: <20251230135050.188191-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230135050.188191-1-andrew.cooper3@citrix.com>
References: <20251230135050.188191-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Having an #ifdef CONFIG_X86 section in a common library is rude.

Furthermore, for x86 the main logic is 6 bytes, meaning it's ripe for
inlining.  Create an x86-specific asm/muldiv.h implementing arch_muldiv64().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

bloat-o-meter results:

  add/remove: 0/1 grow/shrink: 1/2 up/down: 10/-39 (-29)
  Function                                     old     new   delta
  get_count                                    240     250     +10
  calibrate_apic_timer                         211     203      -8
  calibrate_tsc                                190     177     -13
  muldiv64                                      18       -     -18

The increase in get_count is from different register scheduling.
---
 xen/arch/x86/include/asm/muldiv.h | 20 ++++++++++++++++++++
 xen/include/xen/muldiv.h          |  8 ++++++++
 xen/lib/muldiv64.c                |  8 --------
 3 files changed, 28 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/muldiv.h

diff --git a/xen/arch/x86/include/asm/muldiv.h b/xen/arch/x86/include/asm/muldiv.h
new file mode 100644
index 000000000000..563cab0564da
--- /dev/null
+++ b/xen/arch/x86/include/asm/muldiv.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef X86_MULDIV_H
+#define X86_MULDIV_H
+
+#include <xen/stdint.h>
+
+static inline uint64_t attr_const arch_muldiv64(uint64_t a, uint32_t b, uint32_t c)
+{
+    asm_inline (
+        "mulq %[b]\n\t"
+        "divq %[c]"
+        : "+a" (a)
+        : [b] "rm" ((uint64_t)b), [c] "rm" ((uint64_t)c)
+        : "rdx" );
+
+    return a;
+}
+#define arch_muldiv64 arch_muldiv64
+
+#endif /* X86_MULDIV_H */
diff --git a/xen/include/xen/muldiv.h b/xen/include/xen/muldiv.h
index 8ed2c68caf84..e7f8fdcf01ea 100644
--- a/xen/include/xen/muldiv.h
+++ b/xen/include/xen/muldiv.h
@@ -4,6 +4,10 @@
 
 #include <xen/stdint.h>
 
+#if __has_include(<asm/muldiv.h>)
+# include <asm/muldiv.h>
+#endif
+
 uint64_t attr_const generic_muldiv64(uint64_t a, uint32_t b, uint32_t c);
 
 /*
@@ -12,7 +16,11 @@ uint64_t attr_const generic_muldiv64(uint64_t a, uint32_t b, uint32_t c);
  */
 static inline uint64_t attr_const muldiv64(uint64_t a, uint32_t b, uint32_t c)
 {
+#ifdef arch_muldiv64
+    return arch_muldiv64(a, b, c);
+#else
     return generic_muldiv64(a, b, c);
+#endif
 }
 
 #endif /* XEN_MULDIV_H */
diff --git a/xen/lib/muldiv64.c b/xen/lib/muldiv64.c
index 5e6db1b2f4d2..6ee86d124a21 100644
--- a/xen/lib/muldiv64.c
+++ b/xen/lib/muldiv64.c
@@ -2,13 +2,6 @@
 
 uint64_t generic_muldiv64(uint64_t a, uint32_t b, uint32_t c)
 {
-#ifdef CONFIG_X86
-    asm ( "mulq %1; divq %2" : "+a" (a)
-                             : "rm" ((uint64_t)b), "rm" ((uint64_t)c)
-                             : "rdx" );
-
-    return a;
-#else
     union {
         uint64_t ll;
         struct {
@@ -31,7 +24,6 @@ uint64_t generic_muldiv64(uint64_t a, uint32_t b, uint32_t c)
     res.l.low = (((rh % c) << 32) + (uint32_t)rl) / c;
 
     return res.ll;
-#endif
 }
 
 /*
-- 
2.39.5


