Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC838014CF
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 21:48:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645738.1008005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AQs-0007L3-4E; Fri, 01 Dec 2023 20:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645738.1008005; Fri, 01 Dec 2023 20:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AQr-0007Gy-V9; Fri, 01 Dec 2023 20:48:17 +0000
Received: by outflank-mailman (input) for mailman id 645738;
 Fri, 01 Dec 2023 20:48:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yVFl=HM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r9AQq-0007Cg-Tu
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 20:48:16 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3ad980a-908a-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 21:48:16 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c9b88cf626so35147531fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 12:48:16 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 i18-20020a2ea372000000b002c6ed7e546esm511142ljn.124.2023.12.01.12.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 12:48:15 -0800 (PST)
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
X-Inumbo-ID: f3ad980a-908a-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701463696; x=1702068496; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kntzdviDOrMkN3wCkTohVu+TWP0dwfqrKsJ3rPfsygc=;
        b=dNAa8xN0gEsAJrzf1rOkYz12bmYnnc3It8BzpMXsjCdaPPuYhyM7jr7anzmIGPUUUq
         HlJhlo3czhS2aOXn++vGW6VOeDzaAnyliNCQSxB0D/IjdWNs5YSumktuuW7H1lR/Pc9U
         owtvrXuNXApgiSZeBob9JDW1hLay8xAswZROwhMHszOKvBt7SxDb8D0WKVALG0PFQ2wt
         m1l6nr51lEwBWhpLFmkVeZ1w+r5iIroo0BbRSLqs9LoFeupw44VCmrrgjCxTBvet/LqF
         AcRR/HjulUV38teeiBfe/RPCPwFU/9iQoLHA3ORmJcSTVkgafnwFohY5MP5hBlwFzePM
         qy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701463696; x=1702068496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kntzdviDOrMkN3wCkTohVu+TWP0dwfqrKsJ3rPfsygc=;
        b=iiMAfpMqmnL7yMxMGmxDlsxyZroly4U4PMMGth2ZJwskKXPfCfp70QjYfaJLOogryb
         quaTR0FXKmVuT3nJQZZ+dm8qzvCTc779beuuw9hr2vczia460Ke4nrpeQFpemi3V+w5/
         LUONiwFpMO0V5zX1XAGv4ODVNQoPxIPFCWr/ivaauK6PNHgkahtFARHTe0Z1YMy3o0T6
         MB9fJJX9J/oLRX1iJEoHgEzyXmmfov2N2qFivXmnFPqErt2BbI7f7+DF2xmNyvc1Jrmr
         1o0KjjrziLNfgxlwQHk9waLUe7NxKgFLYEvjip2BXHC3EiCezDq/tpRnhi8eaRgLMM71
         ZSaw==
X-Gm-Message-State: AOJu0YzGfbqL9GeXx8+8XKW5HU6vHKaNf+UtD6R0AtNPho3RmJ5/WaUl
	tpfQQLVYS/QhrJsWySeYT0+T73YdG/ju8Q==
X-Google-Smtp-Source: AGHT+IEK4j4Ndtrh17dUAZYcYk2MnIRP2Fl/vPdXGIk3NqXEZwSdCDGHgiIEbScdkHP+dYCnvK4m+g==
X-Received: by 2002:a2e:3310:0:b0:2c9:abe5:67df with SMTP id d16-20020a2e3310000000b002c9abe567dfmr1127135ljc.48.1701463695445;
        Fri, 01 Dec 2023 12:48:15 -0800 (PST)
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
Subject: [PATCH v5 1/7] xen/asm-generic: introduce generic div64.h header
Date: Fri,  1 Dec 2023 22:48:04 +0200
Message-ID: <32c29653e071f134bc3eb0c707ee6e2f947014ad.1701453087.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701453087.git.oleksii.kurochko@gmail.com>
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
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


