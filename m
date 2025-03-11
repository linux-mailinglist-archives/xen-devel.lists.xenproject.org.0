Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416EBA5B7C5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907025.1314382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvc-0002b2-Kt; Tue, 11 Mar 2025 04:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907025.1314382; Tue, 11 Mar 2025 04:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvc-0002VQ-Fc; Tue, 11 Mar 2025 04:09:16 +0000
Received: by outflank-mailman (input) for mailman id 907025;
 Tue, 11 Mar 2025 04:09:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqva-0000fJ-7o
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:14 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 960e8f4e-fe2e-11ef-9ab8-95dc52dad729;
 Tue, 11 Mar 2025 05:09:12 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2fee4d9c2efso8346082a91.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:11 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:10 -0700 (PDT)
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
X-Inumbo-ID: 960e8f4e-fe2e-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666150; x=1742270950; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZcwoIie6BtZ5Bqo8BYW0CKBTK95znA0iA8YHmiy7v4=;
        b=yP48ViHxS8/edxr4ykFVatkvDHwQWsRuSWRstFDHkoyz+EnmEWRS5WYIfZDxHhw+eI
         /OP+vdStl4B5kcaZ2a41nwK4ZvdGuhjyNcbPDTraPaJO00RZrNaAqMoOCkEj2FamHiXt
         cINA428SchuiR4SCdrWhm4WTV555PYQhl8MunXa5mvcBlNjwv3mgx8EWM9KhjgisA6v4
         YJSjd5iU2Nm34VB4+HgMEz1MytRLwVQqzDPCtOFgE7Mj9u+WS0+2vzqEjBrs119cJpZV
         xqIh7aJ7Kzm/MGwQo/5YT7b5GoRMlJ8vKKgIRRmbNIxhrg1J/Te+hvGt4sSoORO/wb6Z
         jolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666150; x=1742270950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZcwoIie6BtZ5Bqo8BYW0CKBTK95znA0iA8YHmiy7v4=;
        b=c4v3atunsyY/2zZkZ8xkgLTFbBA6WluZ44FhN2b3oEMtNvu6oIMOOXUoAXEQS7PsFx
         XV827pXze+2/HJ7v9cJRKCKSxC/GwE98A265A9A78sxzkRufJqOKo1buLxIUswOcD4qp
         5w6VQcbjEfCIuiQK08sX/c23Q4F3e/MVqRp8hjfceurbCpSjxmtWodWwvbEVtWHlYoP7
         FdSOnSZ5f1v41djZmuPZ604ISoa7K8tV3CqIKkGm5OXWtTr99ug+KRnygqIBFEGmudg0
         QDuqlQbLKScZPIXlywfhWmf/mWLL0WOuOvQ08bEnJm62bVO2zz4nbX6t2mZiGBu/wvup
         oq9g==
X-Forwarded-Encrypted: i=1; AJvYcCVDeOYsrTCxd4sxulR3IB6JMMzIXvtcU6Z8nA+m617XLfdz5XloGKTA0+VICVsb7Ag8vh+kVw/d+js=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/KI1Ki9aLljDJNbakn2J7LNEPcIED2x3LzcgLv94VrLgJAGGB
	Pb0KQVWVXh7a9+9V0VtKqr+ehWkpZxE/DUUHNAj2x+aeh0LAMMgj0G1BmWy9gNs=
X-Gm-Gg: ASbGncsaFPcnPpNe9C/8GepwFkIBxiagQcGxp502oWZHFjH9YwmpdBVxVOu3eJP8FHc
	IkfsN5nehlCgu2feC4zXuxAHBBuEu256e5fXEutT3YL1QqOzBigi9Ky7Mz3LZl+6u3l8Hrzo4A4
	BMmjHW1GdU6E4xH2mIDqjdjST9uvGy/ejsPMAZi3r0tPlY0XThM5Nnp/+t6XKHPx89O3tKRV0Pd
	80RxbbHFKfpfP09TM63OWiGN7QMZOJU2MmF+3t33NL3GrnPwtZDxVnNWxt/irj3+IOnJge1FaJ9
	ge4AkpsIFdcUmxIWMwsJO81x4kVYL6JEaQXcKb8K5fhL
X-Google-Smtp-Source: AGHT+IHJmCe2dJrkKZuUg8Hp5UUMBrSHtlgnmpF6Gn789stb7ihIio5wxKC4BVHFee5F9pMJvA7mBw==
X-Received: by 2002:a05:6a21:3941:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-1f544c7fc7fmr33091101637.36.1741666150581;
        Mon, 10 Mar 2025 21:09:10 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 12/16] hw/xen: add stubs for various functions
Date: Mon, 10 Mar 2025 21:08:34 -0700
Message-Id: <20250311040838.3937136-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
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


