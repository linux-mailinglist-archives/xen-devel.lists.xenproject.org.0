Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134D781A0BB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 15:08:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657916.1027035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFc-0005X4-NI; Wed, 20 Dec 2023 14:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657916.1027035; Wed, 20 Dec 2023 14:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFc-0005U1-HH; Wed, 20 Dec 2023 14:08:44 +0000
Received: by outflank-mailman (input) for mailman id 657916;
 Wed, 20 Dec 2023 14:08:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RD2L=H7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFxFb-0004kf-Eu
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 14:08:43 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4788be86-9f41-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 15:08:41 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cc6ea4452cso44929741fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 06:08:41 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05651c089300b002cc83c337absm593892ljq.70.2023.12.20.06.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 06:08:40 -0800 (PST)
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
X-Inumbo-ID: 4788be86-9f41-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703081320; x=1703686120; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ADPjgD2TlWeEknrZqZvtdHgKPvs94RdmhtWG2yb/sA=;
        b=OfWUeCQpXu43745ZVOiX6xF75/7Qd1lUlfJws+3LlblpRx12wsfW6P0G7AXwlRw+X1
         U3/0HKRxlWxjhSW58IOE356PO1b4OPP6VKnk5Vs4tJuIbn+F+4T5xeUDU34kD/kVP5Gq
         UsAst4VOs3a0hcsaGlkD1Kl0nAvt4uUDdQp9WbUMJkDP9Y8ECY3AEQ7bJ4Gn1OWUEHSi
         EdHmybjHh7gDL2l4a6ydPRWWyzkIeWJgr9nb/QjXHx1/VRuwI7AEe7VEJ7P6IzemGqEg
         fu07MDeX9IZDWL5kNYjnaMtacvli4svv/aOmvOGDSCxJPniZ8zsaElLIPCVniEdmS19p
         sU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703081320; x=1703686120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ADPjgD2TlWeEknrZqZvtdHgKPvs94RdmhtWG2yb/sA=;
        b=pvjLtDJG2g3fTGBckDmVz9CyWQ+gXR7iUkTr+Ofwg4rZEZepJMxowb6ZloQMHH03qc
         PjR48MScRFmhFaH60VYAMXez79NwlEafbGKcBB/fl/IaAeC2LWm+Y/KqUcjBRt8NZMk+
         8UOSaDu8Ui9K2C4eNpo1f5sTVTiq5+M/6CENNui/n/zl5vAoBO97qhPT+YrES9sG9uPv
         Z00Fyb95FCjX/EYqfjlvHteiBEZbN+ZKVTTK70igyX5SSHLbbYD2ZNBtcLrbxDZsMZ+V
         VdtTBwyB9FwHk1q+uXQ4rBYIJAuqngoGuNh/7orIIyvQh4MaJjm202u4CSqjL+MJ+ktV
         1sZQ==
X-Gm-Message-State: AOJu0YyiQYo1e3CqptT9D60itCg+CtDWP2dLgLcKDvRzVgayQwJoVjvI
	hBzAhEv7naC/GTOr3l3wi/jWIuU8ImPw7w==
X-Google-Smtp-Source: AGHT+IFHbIW1oV/lSWxToAyOF0zV30j4IS4eZ/hNGe47yAAqjqHtqdVwXWWAiG5dDAPAhItea9Wgqw==
X-Received: by 2002:a2e:a4b3:0:b0:2cc:1d8b:5466 with SMTP id g19-20020a2ea4b3000000b002cc1d8b5466mr7391370ljm.10.1703081320445;
        Wed, 20 Dec 2023 06:08:40 -0800 (PST)
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
Subject: [PATCH v6 3/9] xen/asm-generic: introduce generic div64.h header
Date: Wed, 20 Dec 2023 16:08:25 +0200
Message-ID: <d39a9a56ff37b7e67bcedd163449e0a8f5c5df9a.1703072575.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703072575.git.oleksii.kurochko@gmail.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All archs have the do_div implementation for BITS_PER_LONG == 64
so do_div64.h is moved to asm-generic.

x86 and PPC were switched to asm-generic version of div64.h.
Arm was switched partly because Arm has different implementation
for 32-bits.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes in V6:
 - Rebase only.
---
Changes in V5:
  - add Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
  - Update the commit message
  - Partly switch Arm's div64.h to asm-generic version. Arm has different
    implementation for 32-bits so only 64-bit version was switched.
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
index 2da995bb2f..a8e848d4d0 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += altp2m.h
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


