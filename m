Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E551EA05962
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 12:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867137.1278608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVU03-0002RB-77; Wed, 08 Jan 2025 11:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867137.1278608; Wed, 08 Jan 2025 11:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVU03-0002OZ-2r; Wed, 08 Jan 2025 11:13:23 +0000
Received: by outflank-mailman (input) for mailman id 867137;
 Wed, 08 Jan 2025 11:13:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoWX=UA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVU01-0001rx-Jg
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 11:13:21 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 903a0692-cdb1-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 12:13:18 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30036310158so151006751fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 03:13:18 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad99d11sm67292171fa.33.2025.01.08.03.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 03:13:16 -0800 (PST)
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
X-Inumbo-ID: 903a0692-cdb1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736334798; x=1736939598; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OTB8W0BPYwoUOycX2jvVwt68tOgnvevPd13hEZlyfg=;
        b=OlZmmvttJ3hJkrO4bh2zS8lrbLl8K7i42ezTnZASqKx/P14RPtikJ+L9OhdwiuY4Xj
         EHp6ZqfKTo/Uzgpkr9jrQqH7KNG61DG8rDoLxy7sbF8slaNekypn/kD82H9Ce6Wfy0O5
         v8WNBOMqxCDJfosZiHisVVihdCeeEqAmF6+Ww0PnmY2fhiI4cfho8/DhJLK32GGhRqh8
         NZfb3HKp5zF4ryijTwxrkscT+Rr6jPcKPmQGlW6h3mPwqrcaL7Xf+16NQ1+7fpFxpUW6
         smXVINo8i4fmce5/6Hl8ygkr41qYca8pt4snOnrfKNG8PStRAIo12NDcWKr8zOESKQmf
         IF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736334798; x=1736939598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OTB8W0BPYwoUOycX2jvVwt68tOgnvevPd13hEZlyfg=;
        b=GRUDxxIUPNDyeluPPK4ZwHXTTv+pun4fgKX5h7N2HLyR7DJGdj2sTiU81ftgSAiyMu
         iyvF98RF80T7okLeFLjmoCyfRzeKCO1i6u/rB6WigUxaANyzZkTjxc7W2SjHoM4lacY+
         h92yu6sY3njIy4Tg7RJcBoelUusV/nkJ3kPsEGISo1M2jM1ojslr7lSAiSJSljCK+bcC
         iBGGEx2XRHwcCHTy3KEE0Eu7y+1tt2EAz79EZSXTmuhMUg2joeEbDy/uTIdM+Ivh9hAj
         Z5cC7U3QWmto4Gr9QsIDZSSZhgMnrC96fvUJmAvDnyknOnWHTnIxybS8jMF6t/9GKo3D
         hzXg==
X-Gm-Message-State: AOJu0Yy2Ik7KvMniiVXz6YDWr4hDFJ5DSMoPiZ/X268HrIpxkZbu9X10
	rmwUm2ukaNr8LNSaxT/St63puv+dcNFqQ6oWJ11eDPCzw3yKqgT7p9h2ciOD
X-Gm-Gg: ASbGncusgk4euYE7wGqfrmmBlxHCRoQO1qGIL1iZF1D1tLfcAe2EYwGHQw59HxALxRa
	GA+BVaJV+/QvskE1TYhVM6/g9Oy7u4r6jJ+Zp3lpJ6egpW9+x1sPWxl8cJreIr2bkneHZl2U+2L
	BTRSES7QAC2dsM2FG7c846zr0ZwWiRiKzrzWfYGxs41cVGUvxL6Ng6TwHOAD7oVprf3F6LdDRpA
	zaE5/Wr++XktFFs3IkRxMa1CLE3cpdeo4mX0uSmtjH0ZW3Eq0pW5rIPig==
X-Google-Smtp-Source: AGHT+IEaTqsEGhHsauu6PyS2Wl2XkzryajFU0mmd/80nUCa93OHWPftV2OkoGbCkHJ4usuEnaXHXog==
X-Received: by 2002:a05:651c:b0f:b0:300:3a15:8f26 with SMTP id 38308e7fff4ca-305f445a592mr6342001fa.0.1736334797579;
        Wed, 08 Jan 2025 03:13:17 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 4/9] asm-generic: move Arm's static-memory.h to asm-generic
Date: Wed,  8 Jan 2025 12:13:06 +0100
Message-ID: <3f1f3786ee48b01f1a5c7c7573456da72aa1e1d2.1736334615.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736334615.git.oleksii.kurochko@gmail.com>
References: <cover.1736334615.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Except moving Arm's static-memory.h to asm-generic #ifdef header guard
is updated: s/__ASM_STATIC_MEMORY_H_/__ASM_GENERIC_STATIC_MEMORY_H__.

Update arm/include/asm/Makefile to use asm-generic version of
static-memory.h for Arm.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/include/asm/Makefile        |  1 +
 xen/arch/arm/include/asm/static-memory.h | 58 ------------------------
 xen/include/asm-generic/static-memory.h  | 58 ++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 58 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/static-memory.h
 create mode 100644 xen/include/asm-generic/static-memory.h

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 831c914cce..ac8208a81f 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -8,4 +8,5 @@ generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
 generic-y += softirq.h
+generic-y += static-memory.h
 generic-y += vm_event.h
diff --git a/xen/arch/arm/include/asm/static-memory.h b/xen/arch/arm/include/asm/static-memory.h
deleted file mode 100644
index 804166e541..0000000000
--- a/xen/arch/arm/include/asm/static-memory.h
+++ /dev/null
@@ -1,58 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#ifndef __ASM_STATIC_MEMORY_H_
-#define __ASM_STATIC_MEMORY_H_
-
-#include <xen/pfn.h>
-#include <asm/kernel.h>
-
-#ifdef CONFIG_STATIC_MEMORY
-
-static inline void init_staticmem_bank(const struct membank *bank)
-{
-    mfn_t bank_start = _mfn(PFN_UP(bank->start));
-    unsigned long bank_pages = PFN_DOWN(bank->size);
-    mfn_t bank_end = mfn_add(bank_start, bank_pages);
-
-    if ( mfn_x(bank_end) <= mfn_x(bank_start) )
-        return;
-
-    unprepare_staticmem_pages(mfn_to_page(bank_start), bank_pages, false);
-}
-
-void allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
-                            const struct dt_device_node *node);
-void assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
-                             const struct dt_device_node *node);
-void init_staticmem_pages(void);
-
-#else /* !CONFIG_STATIC_MEMORY */
-
-static inline void allocate_static_memory(struct domain *d,
-                                          struct kernel_info *kinfo,
-                                          const struct dt_device_node *node)
-{
-    ASSERT_UNREACHABLE();
-}
-
-static inline void assign_static_memory_11(struct domain *d,
-                                           struct kernel_info *kinfo,
-                                           const struct dt_device_node *node)
-{
-    ASSERT_UNREACHABLE();
-}
-
-static inline void init_staticmem_pages(void) {};
-
-#endif /* CONFIG_STATIC_MEMORY */
-
-#endif /* __ASM_STATIC_MEMORY_H_ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/include/asm-generic/static-memory.h b/xen/include/asm-generic/static-memory.h
new file mode 100644
index 0000000000..43b8740d46
--- /dev/null
+++ b/xen/include/asm-generic/static-memory.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_GENERIC_STATIC_MEMORY_H__
+#define __ASM_GENERIC_STATIC_MEMORY_H__
+
+#include <xen/pfn.h>
+#include <asm/kernel.h>
+
+#ifdef CONFIG_STATIC_MEMORY
+
+static inline void init_staticmem_bank(const struct membank *bank)
+{
+    mfn_t bank_start = _mfn(PFN_UP(bank->start));
+    unsigned long bank_pages = PFN_DOWN(bank->size);
+    mfn_t bank_end = mfn_add(bank_start, bank_pages);
+
+    if ( mfn_x(bank_end) <= mfn_x(bank_start) )
+        return;
+
+    unprepare_staticmem_pages(mfn_to_page(bank_start), bank_pages, false);
+}
+
+void allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
+                            const struct dt_device_node *node);
+void assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
+                             const struct dt_device_node *node);
+void init_staticmem_pages(void);
+
+#else /* !CONFIG_STATIC_MEMORY */
+
+static inline void allocate_static_memory(struct domain *d,
+                                          struct kernel_info *kinfo,
+                                          const struct dt_device_node *node)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline void assign_static_memory_11(struct domain *d,
+                                           struct kernel_info *kinfo,
+                                           const struct dt_device_node *node)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline void init_staticmem_pages(void) {};
+
+#endif /* CONFIG_STATIC_MEMORY */
+
+#endif /* __ASM_GENERIC_STATIC_MEMORY_H__ */
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
2.47.1


