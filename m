Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E8A7EF29A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:25:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635117.990928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xu5-0002XX-KD; Fri, 17 Nov 2023 12:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635117.990928; Fri, 17 Nov 2023 12:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xu5-0002Tb-CQ; Fri, 17 Nov 2023 12:24:57 +0000
Received: by outflank-mailman (input) for mailman id 635117;
 Fri, 17 Nov 2023 12:24:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3xu3-0000ZQ-2R
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:24:55 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 503bfeab-8544-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 13:24:54 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5079f9ec8d9so2033198e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:24:54 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac25e72000000b005094d95e8bcsm209811lfr.218.2023.11.17.04.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:24:53 -0800 (PST)
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
X-Inumbo-ID: 503bfeab-8544-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700223894; x=1700828694; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5EFcRe5i11VHN5dkWPb4m8i84DRWOYD+kJLJMwIYHU=;
        b=khgVVekBBYMZDZxrIgX5r+NSmEj69sJ2rihdRHAKkCzBOTZWzdVtqYxuL3HtSvT7Ry
         XV0z6+tVo4XcXML7hguelv1hVrePWk7f7S/NtmO9y5NlUB205QhGX7eAKWwyjDITa/sL
         /X/2sVFTzkYtvP9M4b2t1hpbbzEYa7mu+MPG/TusJOZaDJDmiABanvxjDetvRI73TGGD
         B0x4Tp+ZoLnRGRmHRq/iMEff3tIa0dNY4s7pnN5hRfKSVLDCUOJARLgSj352cz2TQ3TW
         n/YtatociKBMXBtEt2PQfFfqLHLg6nXsYh/FvhRTwF38np26RzrMNfYChngc1xlPWqy4
         nrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700223894; x=1700828694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5EFcRe5i11VHN5dkWPb4m8i84DRWOYD+kJLJMwIYHU=;
        b=PQeXnSLVuQi3d5x2ytP5hy86jza/Hotw8hqAG4Aq9vsgdPlTtdgIlc5jwdKejeLjz0
         YI8sWxhpHwPo+jgIBNiE+1MOS60YvxXdXAJqkl2PnxGVmJXrEnFdedUwWNN3s7MoE/vz
         I7YvC6xZUvcVrbO8Twp592wQb+9Cp06mqSVSFgODOoCY2dJznpTWF1SKKG0EI0MvsVO+
         FZAisV9S43sCFpImfls5ksBU6UuLDpZKKcBD/vFeJPHizDaner1iFUPQbHea/GQFzuSs
         2u5o52SAHB5HY/3Bgbu777ZHHmsqT5B5vv5mnlgGyu8VW89VGC8+FsadcULrn32bESoh
         rPyw==
X-Gm-Message-State: AOJu0YzZZMgjqZ2qm+XyW/dPPZGNpvoMzG9aNaYCmTtXu9VEJ/rJmYjr
	mSOR5UJJunH2LReCsmofvIWg7yHj/98=
X-Google-Smtp-Source: AGHT+IHr9y044KYZlXDIF525+vEqaghyq5t8xYgVXfKhB5uq9h3N8pjlewWLM7B+IfX97VOA0g5LSw==
X-Received: by 2002:ac2:4e10:0:b0:501:ba04:f352 with SMTP id e16-20020ac24e10000000b00501ba04f352mr2567197lfr.1.1700223893938;
        Fri, 17 Nov 2023 04:24:53 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 08/14] xen/asm-generic: introduce generic div64.h header
Date: Fri, 17 Nov 2023 14:24:32 +0200
Message-ID: <13bf409f3191d066af9caef417011b6ea039dbd9.1700221559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1700221559.git.oleksii.kurochko@gmail.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All archs have the do_div implementation for BITS_PER_LONG == 64
so do_div64.h is moved to asm-generic.

x86 and PPC were switched to asm-generic version of div64.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/ppc/include/asm/Makefile |  1 +
 xen/arch/ppc/include/asm/div64.h  | 14 --------------
 xen/arch/x86/include/asm/Makefile |  1 +
 xen/arch/x86/include/asm/div64.h  | 14 --------------
 xen/include/asm-generic/div64.h   | 27 +++++++++++++++++++++++++++
 5 files changed, 29 insertions(+), 28 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/div64.h
 delete mode 100644 xen/arch/x86/include/asm/div64.h
 create mode 100644 xen/include/asm-generic/div64.h

diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index 9b38d2d381..b4fbcc897b 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
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
2.41.0


