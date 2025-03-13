Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57A1A5FC52
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:43:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913034.1319226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsleU-0003yX-Ok; Thu, 13 Mar 2025 16:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913034.1319226; Thu, 13 Mar 2025 16:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsleU-0003vW-LK; Thu, 13 Mar 2025 16:43:22 +0000
Received: by outflank-mailman (input) for mailman id 913034;
 Thu, 13 Mar 2025 16:43:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslak-0000Wy-OI
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:30 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9cfe0cb-0029-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:39:26 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-22334203781so44356635ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:26 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:24 -0700 (PDT)
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
X-Inumbo-ID: b9cfe0cb-0029-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883965; x=1742488765; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZcwoIie6BtZ5Bqo8BYW0CKBTK95znA0iA8YHmiy7v4=;
        b=XY0pAryMmuVMSRw/P/gqFLlcBZmW1H9roUoeM55D2hdK9PBD1y7Zc6V5DqKdbf0czu
         beWGFzQIAtmZ6ggoYv6hqdoC6MweXykxhExv9vBMGTNgx348Wug+YVj1am6myLyRb3/i
         veQMi0EFM5CYQa22KvrX0ecW15EdfGdSwXd+c5spV9z7diq4e5ytkDUt/pijgEeg83Aa
         wDeqZzMXH5qcitrzuyQmbFtxuc/e3oLZaB7rrFKHaYjO3dDCZlImY8i2+Dfc3srFJM22
         M/thlHsdnsVQP/p+wFgsPxvlcSjCEQ39EZPdWYF46QlG21ee6vqFxPnaKZmwRonbS8D9
         6MzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883965; x=1742488765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZcwoIie6BtZ5Bqo8BYW0CKBTK95znA0iA8YHmiy7v4=;
        b=e0wPqGMFc8xmBxy8BWAS4zrswnGmgupOg/45MQGGm1uRrSoZToAbsb20XkBzDiNkQS
         dR2AxFhtFIVrtTMeuUP12CWlrhAXGeseb0mVGgZ1UamJbKth/wnztdvwIfztTlKP//u5
         xbIggHre1NpDaMtfIFHq88nGwOL8BLC22LHTtlboEv0I64sqZ8WhhsCM030pLXtUspPI
         Yk7opoJumzrUohJzq9SsqqkljSAS8atVCCVGqeXUebSTDa3hVLMohDRP5E8n+T83UvVY
         YTPje2hg0tvCr592pZ9ZkEbvn6gyDzcVAZZBJtE3C1lS6nbzf+Ydr/jns1hpO6t6AUs4
         Tm+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWu0tToXJjyE75+TQWaP2GWq45YpGxWUnBFoS0XF9wdBaUqszvQh05XcrGRkHvOhZ8eO5xJ9VwKhvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfCGgEh4s4IPdUyW3SFrAClr/pIXeUBF1Y75dB1J1ZhTQIjCoY
	qMqXlYRK84BEGeMemsaHPycn+TXCPEheJbu+y2zDBVusm65TOIetPnMAmINzSDs=
X-Gm-Gg: ASbGncvh0AQJMzIHIqYpvCFOJOrERUWRToVgFyF+sCK8GmKo88tq1qMwVzK2tFfQZQH
	4Vpv+kaJTKPwiscdbbtndW2TAjvaO/y2YvC1QjJC9rbizmaKfbnT0S4Wzwn4erOE9T7oor2+2J4
	LKCS4wyc4B+GeqlkrcgHIzvgKwRt3HQaB6F8sdY9abF8pM+iZNCaG1Kf8iLWloW4aCwWY8QoVZX
	p8h/anEZFNjYX7+cMNkF8e5I5V455K5YPnHBSyW4lBDYOm/NhoMJxDtdg3e20CQ7GYJZH9Jv6RS
	joVCDdmZczeB0oPybaqLFPNmgHxfGCzt5XLPUyZGtvBC
X-Google-Smtp-Source: AGHT+IFiKP7Cv0cYdqEMV+MhGWK6VMcS4hFI6ysthSkCfjorg7zJkJOo9IS+PhkZP2SVMZhjn6kprA==
X-Received: by 2002:a17:90b:3502:b0:2fa:21d3:4332 with SMTP id 98e67ed59e1d1-30135f4d091mr4406058a91.12.1741883965232;
        Thu, 13 Mar 2025 09:39:25 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 12/17] hw/xen: add stubs for various functions
Date: Thu, 13 Mar 2025 09:38:58 -0700
Message-Id: <20250313163903.1738581-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
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


