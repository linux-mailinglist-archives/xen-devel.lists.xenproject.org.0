Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C4CA5D0BD
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 21:22:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909174.1316194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts67P-0005rt-BZ; Tue, 11 Mar 2025 20:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909174.1316194; Tue, 11 Mar 2025 20:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts67P-0005pk-7N; Tue, 11 Mar 2025 20:22:27 +0000
Received: by outflank-mailman (input) for mailman id 909174;
 Tue, 11 Mar 2025 20:22:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5kF-0007Uu-KQ
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:31 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3135caa4-feb3-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 20:58:25 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2235189adaeso4054675ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:25 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:24 -0700 (PDT)
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
X-Inumbo-ID: 3135caa4-feb3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723104; x=1742327904; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZcwoIie6BtZ5Bqo8BYW0CKBTK95znA0iA8YHmiy7v4=;
        b=Ja+6odzn4Ez24VTaE4XHZXCJRxg+WvFcMgJghams3Ge5p9PoA23hWWCvagyxZ+YKeW
         JY9Ht6yoI4ygfNTV4qq/iiMwBjv4RFzectNS8jKYk2oDZnOO83DSTWOKP1yr4jWh95D2
         8jM8FCPTFsdY3IHIW7wNbGzO+0bI9Non2iSIK9LWX0iJMivuz0h1/5Qq1tn1f0/bMep1
         uLVZFWk5bjhpQakoeF49bl8+cKjv+mk45lpiePHeyiGj6QPzejbVLFZbXMybDPJPagSD
         nZSuFhJNBmderX7dPHB2ATIu5JBNzfrPtuEaa1vesqHniEhyYS6be4VrcbcMJc5plIKe
         7hNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723104; x=1742327904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZcwoIie6BtZ5Bqo8BYW0CKBTK95znA0iA8YHmiy7v4=;
        b=DHnqN10v3AsrLIkjV5CEaKWA/gml7L+kidakGFbHYz5QC2qnLYqUi9xKhGeE4LDExc
         LLsy29EmUXime9mwlUfYi5cHoIXcBl/YEunffOzuYs+hiNxjYds6i1zfJxZ62/zJd7ob
         lLu1r0N+r1pRs2vU5wtIMeypNSAEbEuqGQVW8Duio14IqLRGKtg5prjhfRWHicBfHRcw
         ajYqDglcYR4VgA2vSChVwe+hWugS1BxP3uujowFErCFq8bxuvoj4E1RLNgxe+wZxIBwj
         3ivH0nkc5t1yju+ZLDsQGN6b4UNbHkl6W+Nqg4JGhtYuogO5kTL9lZYCAGXfHeikq7Xt
         8g4g==
X-Forwarded-Encrypted: i=1; AJvYcCXaQhHtlIkMyYuqZk9VgrS9AzgpJ1TPXwCL7L/3Rs1uMMkMORWZDdcfy3ViWmwZu7EzexCti8Mm6O8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybRmVQCQK6EegKNofzPGUkC+E3L3tPxPVpDxKYZKnh/P2XzDjg
	q5QTgn3N5hH2cIrPUgyANiaL9zhWKrrb0FRIwymDHXOKXVdXk2yK/8XjqF/UEio=
X-Gm-Gg: ASbGncv0dUqRv6CA/kDYlMy7Jy0CRpyIUe82xOBHp6iGYXbGRnmcGQ2b54UogW1dEQI
	wmVQqNSzAivauX0E+zyAY/2sXPWGGgQpsV9Zz/6G25u2HCZygkUF5U0sW4USpqgYnzaMLpNqY8e
	ZGzVa52xZJTi+8GCQVHHEnbvbpXVGFuqGTyHHJM2QXbxmrdUIsz028NRNu2Ry1ABEio9qbBmTUQ
	ZY+Q9+eRhyX5KAmssIjhxqPcO0nYAvb67aVED49lkegLl42xZsc17n/j9D3nj2tRURkSYE0G5v5
	pPn9pBlxXNnZ6AauweRi3FpnUrn/SpngLuz/aZTr3NXS
X-Google-Smtp-Source: AGHT+IEToni6mHy+/TOd0EQfFDFUNLQyZb+aNmkKXcJNYvCuHB4nuxbuNFqkwEKNu7S4yPPDELKJzQ==
X-Received: by 2002:a17:902:eccd:b0:21f:5063:d3ca with SMTP id d9443c01a7336-22593dc5076mr68139055ad.16.1741723104414;
        Tue, 11 Mar 2025 12:58:24 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	manos.pitsidianakis@linaro.org,
	Peter Xu <peterx@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	alex.bennee@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 12/17] hw/xen: add stubs for various functions
Date: Tue, 11 Mar 2025 12:57:58 -0700
Message-Id: <20250311195803.4115788-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Those functions are used by system/physmem.c, and are called only if
xen is enabled (which happens only if CONFIG_XEN is not set).

So we can crash in case those are called.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/xen/xen_stubs.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/xen/meson.build |  3 +++
 2 files changed, 59 insertions(+)
 create mode 100644 hw/xen/xen_stubs.c

diff --git a/hw/xen/xen_stubs.c b/hw/xen/xen_stubs.c
new file mode 100644
index 00000000000..19cee84bbb4
--- /dev/null
+++ b/hw/xen/xen_stubs.c
@@ -0,0 +1,56 @@
+/*
+ * Various stubs for xen functions
+ *
+ * Those functions are used only if xen_enabled(). This file is linked only if
+ * CONFIG_XEN is not set, so they should never be called.
+ *
+ * Copyright (c) 2025 Linaro, Ltd.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "system/xen.h"
+#include "system/xen-mapcache.h"
+
+void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
+{
+    g_assert_not_reached();
+}
+
+void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
+                   struct MemoryRegion *mr, Error **errp)
+{
+    g_assert_not_reached();
+}
+
+bool xen_mr_is_memory(MemoryRegion *mr)
+{
+    g_assert_not_reached();
+}
+
+void xen_invalidate_map_cache_entry(uint8_t *buffer)
+{
+    g_assert_not_reached();
+}
+
+void xen_invalidate_map_cache(void)
+{
+    g_assert_not_reached();
+}
+
+ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
+{
+    g_assert_not_reached();
+}
+
+uint8_t *xen_map_cache(MemoryRegion *mr,
+                       hwaddr phys_addr,
+                       hwaddr size,
+                       ram_addr_t ram_addr_offset,
+                       uint8_t lock,
+                       bool dma,
+                       bool is_write)
+{
+    g_assert_not_reached();
+}
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 4a486e36738..a1850e76988 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -9,6 +9,9 @@ system_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
 
 system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
   'xen-operations.c',
+),
+if_false: files(
+  'xen_stubs.c',
 ))
 
 xen_specific_ss = ss.source_set()
-- 
2.39.5


