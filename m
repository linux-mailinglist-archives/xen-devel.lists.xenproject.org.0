Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042E7CE9D13
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 14:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194172.1512596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaa7N-00040D-Eo; Tue, 30 Dec 2025 13:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194172.1512596; Tue, 30 Dec 2025 13:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaa7N-0003x9-9C; Tue, 30 Dec 2025 13:50:33 +0000
Received: by outflank-mailman (input) for mailman id 1194172;
 Tue, 30 Dec 2025 13:50:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owPK=7E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vaa7L-0003x2-I3
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 13:50:31 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80849b61-e586-11f0-9ccf-f158ae23cfc8;
 Tue, 30 Dec 2025 14:50:29 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso4609451f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 05:50:29 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea2278dsm69961974f8f.18.2025.12.30.05.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 05:50:28 -0800 (PST)
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
X-Inumbo-ID: 80849b61-e586-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1767102628; x=1767707428; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ksrdaSIqpwx0gSdwMJzQe6JesX3RHk4cyQkoMRTQARM=;
        b=DG9vauJ3Q+u4E3CMWSlFW62Y+EV0S2oKGWz+M5zMLSLj/gPcWUXLcjoFpvlWn+aA3s
         J3ckXDTXuqL5ciVnt8oIwhIKsCK4RnyUiBYlOv+QnAFV2e9VMOYGVrpZv1tbx/O8vXZL
         Yuf/U5Clv4vAxdAl7JI3SDVx1rNz+ahe3JN40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102628; x=1767707428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksrdaSIqpwx0gSdwMJzQe6JesX3RHk4cyQkoMRTQARM=;
        b=H7Cg8OJuS0n8xDpQY1kurQ86NWHoWyE7WPpUBi1kMqRPU3aWSwG+uIk8uCC/SYT/3I
         hu/8cFIEy2KM9u5burQ+y7My0Jo9+gM+v2+5kV1s5q1i6E6q/lkg6/cGjElj7Cr4/8kA
         L22Bc0qA97W8mAHGJr23FLe0GGroVIV118lR1tAPf3cnNazXlT1VjSr0PHoRRGw8q8EA
         s1VXwO6ZECCI/E/pEM+Gjbyu4t08qUm7gnMJaDveJ+SnofqjTYamhHSlEBmxMLXIwF0J
         rUDW+fiI+HUcmbIXWGZ4dHmncJMKdUn/+KE3kNo95G0yFZN1YUsVi60IUGCJDrRR0CwS
         GuyQ==
X-Gm-Message-State: AOJu0YzgZWF1HCFb8lB1/F0r6/CsT+2d3ulYekmQpbOaPpFfZBqGhd6B
	WM4AalOe2SHoOuNfRLcZCF+R95O8TeLZVu6rtgXDtizwyxS25MjZtzPfs+nFa2p2lT97q0vopm+
	ZnAQp
X-Gm-Gg: AY/fxX4Cin9eeNug+DzMr7lxTvRqVYXjgxLdCA3Nw4Uh6no+QxuHnEhKWCbSj21SypI
	sWopjskHtNHMnXP9+2UB1TQ1wKBvYrTExXp1ukjvTy4uhQP5tC6cwlUBO9ejM5rYK61N880lE+D
	5/VkW7vyZQGy1tJLuQUZbEM1+nbdta4DGz0qFb1dpoOEGwbrLar/YPA1DJmoe7pO4tf+ZxFZwVK
	4tx8my2SXPGf2NVvh50fmluMSkX5Gb3oFAGV5Y09qqV9/T9MOD2QWoTUHZrGhIN7dA1RalK5fTg
	Kv7EQl40r/qgqJ+eDTEpZ/Yoy8yq/cn/jhG8FDOw9JznEQnVsRdQJg81JMS9TsFV5oi8EgNpv/t
	AUPsTuzezuL8XXU7bRQUGXeQ85XRyvlHwMi028oaxiZuo6VHSEES1leuamutoZzxCy7GQ1M5xcw
	6ibfzW6oHMMw+ePp9Sb72K/sQcz1PDOJHbDpwRmDgIDfZflGYWX9s+yWq4pmPkMA==
X-Google-Smtp-Source: AGHT+IHaqF47HJqm1YDjq1Jsb9kbryBaY7byzAQJ0uQrFuifDesZdt5QT7Jw47Hx4lpDmHAtkOf3Jg==
X-Received: by 2002:a05:6000:2508:b0:42b:3062:c647 with SMTP id ffacd0b85a97d-4324e4c9d6bmr40179989f8f.21.1767102628412;
        Tue, 30 Dec 2025 05:50:28 -0800 (PST)
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
Subject: [PATCH] xen: Move x86-ism out of muldiv64.c
Date: Tue, 30 Dec 2025 13:50:26 +0000
Message-Id: <20251230135026.188162-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
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


