Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151FA7FA21C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642125.1001375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMq-0007gh-Vm; Mon, 27 Nov 2023 14:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642125.1001375; Mon, 27 Nov 2023 14:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMq-0007c2-RB; Mon, 27 Nov 2023 14:13:44 +0000
Received: by outflank-mailman (input) for mailman id 642125;
 Mon, 27 Nov 2023 14:13:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7cMo-0005XE-SG
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:13:42 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b39ff78-8d2f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 15:13:42 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50970c2115eso5775410e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 06:13:42 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x29-20020ac259dd000000b00507b869b068sm1494100lfn.302.2023.11.27.06.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:13:40 -0800 (PST)
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
X-Inumbo-ID: 2b39ff78-8d2f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701094422; x=1701699222; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RX3zgR/k3naH0cxTUjVNfFsJEx/hUFvxNDBlPipUY+c=;
        b=lzgv7d3v2jzlz5bDZm9QASV0BY8LTL+oqHbP5EmNJnUKCY9poi3YHrfkWAuxHGBz0w
         co3e5bWE1RpaNSVQssvWqwDfH96E0q1jwfzoSBAIWkgUvLThLQHlEjlFhwEU9s052520
         vDH7R5p0JygHeTXN4T/kymsvmM7yjFykklA6ySVJKzxA9Q6LrvGqaPVvVBabZbTL2fdC
         Xeni94Evj7PhGPDzGRqngBe1ySRd13d9cQdzwDZHUIc9tOzXyBgeXLe6di8B7C3lHa//
         LrY41UtLfd6nXNV7UuLTqd8TQGTKtd1SKUYwM1OrRZvuCsPcfO5gYJkq31mKrXGmNJcC
         PXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094422; x=1701699222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RX3zgR/k3naH0cxTUjVNfFsJEx/hUFvxNDBlPipUY+c=;
        b=o2dUqRT4UrwmjtndKz6/I1adipwqCjYOYrtFlj1tqV7JKKp7ug7+vcMw7SJdyjJX2O
         aeZludETxUyyxwrjUN7zz2IE/RJEMiJcP2vEvqhdp0j3/ij7ka7V4e6Fb6w8SW/GGoUk
         WY8J0U8eMCWhb20uJdPGAj+MrgolAEzwxsl2y14GJxXLD7RayOzj0LjWJwKiH1xVVRxd
         jDbvYhJYXh1QcJOr+iIQjx3CpT3XZUQppB5O5D8ZHasDNIALrZs149bqW9F1qa5gxqdI
         H9uGrQ66cpPrRbkXLWZMTS46h/O2iOiWVHpjtVRNAtVF3CE129OZVtO7tlSguMecneYC
         6bGA==
X-Gm-Message-State: AOJu0Yw1f4nujqcOk4w1x7k0DhHJwU6ZavPBmPiug6P8nG6i00yWcvgv
	76PI8gMeAJywdxTgWuje30lpLC8ZzD95cg==
X-Google-Smtp-Source: AGHT+IHgVb25jgNQ0m8/UNTAYkEhO51GThc7+/wtvJ6LjS77N58SkOQgkPS2ZRVjLDZYE1IfqMqnhw==
X-Received: by 2002:a05:6512:3c87:b0:50b:a64d:acf with SMTP id h7-20020a0565123c8700b0050ba64d0acfmr8699499lfv.59.1701094421004;
        Mon, 27 Nov 2023 06:13:41 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 08/14] xen/asm-generic: introduce generic div64.h header
Date: Mon, 27 Nov 2023 16:13:21 +0200
Message-ID: <adc8456bd3c5574491f78ac7f8ce7934d359d005.1701093907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701093907.git.oleksii.kurochko@gmail.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All archs have the do_div implementation for BITS_PER_LONG == 64
so do_div64.h is moved to asm-generic.

x86 and PPC were switched to asm-generic version of div64.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
 - Added Acked-by: Jan Beulich <jbeulich@suse.com>.
 - include <asm-generic/div64.h> in Arm's div64.h for 64-bit case.
---
Changes in V3:
 - Drop x86 and PPC's div64.h.
 - Update the commit message.
---
Changes in V2:
	- rename base to divisor
	- add "#if BITS_PER_LONG == 64"
	- fix code style
---
 xen/arch/arm/include/asm/div64.h  |  8 +-------
 xen/arch/ppc/include/asm/Makefile |  1 +
 xen/arch/ppc/include/asm/div64.h  | 14 --------------
 xen/arch/x86/include/asm/Makefile |  1 +
 xen/arch/x86/include/asm/div64.h  | 14 --------------
 xen/include/asm-generic/div64.h   | 27 +++++++++++++++++++++++++++
 6 files changed, 30 insertions(+), 35 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/div64.h
 delete mode 100644 xen/arch/x86/include/asm/div64.h
 create mode 100644 xen/include/asm-generic/div64.h

diff --git a/xen/arch/arm/include/asm/div64.h b/xen/arch/arm/include/asm/div64.h
index fc667a80f9..0459d5cc01 100644
--- a/xen/arch/arm/include/asm/div64.h
+++ b/xen/arch/arm/include/asm/div64.h
@@ -24,13 +24,7 @@
 
 #if BITS_PER_LONG == 64
 
-# define do_div(n,base) ({                                      \
-        uint32_t __base = (base);                               \
-        uint32_t __rem;                                         \
-        __rem = ((uint64_t)(n)) % __base;                       \
-        (n) = ((uint64_t)(n)) / __base;                         \
-        __rem;                                                  \
- })
+#include <asm-generic/div64.h>
 
 #elif BITS_PER_LONG == 32
 
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index 3241236c64..5364bb1d59 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += device.h
+generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
diff --git a/xen/arch/ppc/include/asm/div64.h b/xen/arch/ppc/include/asm/div64.h
deleted file mode 100644
index d213e50585..0000000000
--- a/xen/arch/ppc/include/asm/div64.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_DIV64_H__
-#define __ASM_PPC_DIV64_H__
-
-#include <xen/types.h>
-
-#define do_div(n, base) ({                       \
-    uint32_t base_ = (base);                     \
-    uint32_t rem_ = (uint64_t)(n) % base_;       \
-    (n) = (uint64_t)(n) / base_;                 \
-    rem_;                                        \
-})
-
-#endif /* __ASM_PPC_DIV64_H__ */
diff --git a/xen/arch/x86/include/asm/Makefile b/xen/arch/x86/include/asm/Makefile
index 874429ed30..daab34ff0a 100644
--- a/xen/arch/x86/include/asm/Makefile
+++ b/xen/arch/x86/include/asm/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+generic-y += div64.h
 generic-y += percpu.h
diff --git a/xen/arch/x86/include/asm/div64.h b/xen/arch/x86/include/asm/div64.h
deleted file mode 100644
index dd49f64a3b..0000000000
--- a/xen/arch/x86/include/asm/div64.h
+++ /dev/null
@@ -1,14 +0,0 @@
-#ifndef __X86_DIV64
-#define __X86_DIV64
-
-#include <xen/types.h>
-
-#define do_div(n,base) ({                       \
-    uint32_t __base = (base);                   \
-    uint32_t __rem;                             \
-    __rem = ((uint64_t)(n)) % __base;           \
-    (n) = ((uint64_t)(n)) / __base;             \
-    __rem;                                      \
-})
-
-#endif
diff --git a/xen/include/asm-generic/div64.h b/xen/include/asm-generic/div64.h
new file mode 100644
index 0000000000..068d8a11ad
--- /dev/null
+++ b/xen/include/asm-generic/div64.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_DIV64
+#define __ASM_GENERIC_DIV64
+
+#include <xen/types.h>
+
+#if BITS_PER_LONG == 64
+
+#define do_div(n, divisor) ({                   \
+    uint32_t divisor_ = (divisor);              \
+    uint32_t rem_ = (uint64_t)(n) % divisor_;   \
+    (n) = (uint64_t)(n) / divisor_;             \
+    rem_;                                       \
+})
+
+#endif /* BITS_PER_LONG */
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


