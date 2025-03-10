Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9F8A58C34
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905983.1313545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqz-00042i-Pn; Mon, 10 Mar 2025 06:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905983.1313545; Mon, 10 Mar 2025 06:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqy-0003fX-Ir; Mon, 10 Mar 2025 06:43:08 +0000
Received: by outflank-mailman (input) for mailman id 905983;
 Mon, 10 Mar 2025 05:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVEL-00070S-MB
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:59:09 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64d1eb34-fd6c-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 05:59:07 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-225477548e1so20296375ad.0
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:59:07 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:59:05 -0700 (PDT)
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
X-Inumbo-ID: 64d1eb34-fd6c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582745; x=1742187545; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mz3bAPQKR6fBbshrwXBmzVU3oJFomZ1j01ZC38m+4VY=;
        b=Hfi1g9ZZ1P0TQ2wYMpVKU0npiziFjyAV4mkW8XnSf2gZEG+jNqS1zX8PIBuY4LeAyC
         fW+WRqRtALk/KxmIH+sqQu5usjuhPGeNRh1y6Bl4SdyZ3qZ3O2jcb6M6Jn+vEZUP2COM
         rk4G9kZQ/C93UdMvbXmX8TfQlkNmlXfLvO01xgyQmfLT9cAJjS4r8OVHOiAYICNZkwS/
         GTvK3pQqt0lfZN6tBGCtYLjt7FXb9drCJRNq8ifLRQ0cPErGPT/jQmBUYNhLXQSqhO0X
         yOR0t4UMLtn7X5Y4bIVnGRYoz82M/J1oyWMcQaHB3IjIZReJGOm8OtNHm4gxXpN3+xl7
         k6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582745; x=1742187545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mz3bAPQKR6fBbshrwXBmzVU3oJFomZ1j01ZC38m+4VY=;
        b=EBvMdawMkEAtSfKQWRgMlZTHDOyCYZV3awvR5HGiOoLORgmcXLBsOkWO/Hf2gUPqh0
         A+kFmPGWBE6a+mBx5eJM4CiGDXWwTzEreXVDIH/MwNMmv9fwme5sm6hsZERyYovJTMqD
         aE0ZpNHjL6bdh9nAMfishiUnDbL1uJpz48NU+lNMRZs3hJEjwCO2uLcbJB45gb8bPIHq
         zZMq64h/CqTxPyD+wEICmixO3g3R19ejonDV2CzfQAFb7VT1Fk6sraylNn6W+A37bYrR
         PeALNNi1+t3fRm54wNUzwB1xHge7n/QRxkyxiPlWApMh5uSSbfgJUKlX/1e/SlBHWa7C
         YuWg==
X-Forwarded-Encrypted: i=1; AJvYcCXxvuF918QNLhqWXzq2/AVb4enSt5b8RiihOE9eSjgBwqZA+BndrbGFUK6ezQW3tcswuchpbPi9Pew=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxS/zDGSUDCyK64ET/2mFyn8rB/vdkEn28O2jShnJN7ESVpP+9q
	kEnE2ExLB6dkGxxIzmPWWAKBeFAqLcpJ0hxWxnaGivc6wboi4xZOgn3EIL0fdI0=
X-Gm-Gg: ASbGncuJgse1vBP//9tnvMc81HrNmDTSWoF4k2erON0gwekLQ0ViItVRUYk0jSpkOhG
	RCjUQmoWk/1Pf8WdfysbuFny16kmK/vcUo5O3JHGyqTnFtiq33xVWAIdzRg0QaEjdE+Qrzxu/0c
	5zlTqXsCY6PRsxZbtiEBLDNQuYF59CkpB6G1KSmnOaT3c9xgKYtWE65oUgRUViz33kPsS08x3DX
	DZ+8KImzrCu/QccVPrHcbA6+evkGfgclZ7GySoDCnnH5vhUpxZDH/dM3ofnjR9KBL1j7116scBc
	RqvpADuDtlHOsEPYD6Wm4qkkLNT+dgu/HqZH3V04Y34eV5QFVeueGyY=
X-Google-Smtp-Source: AGHT+IF05iTMc8yin7+8YVYQSgdEUPUj/50hW5+Z0DK0JGoSuS9iEibUeyOyOMAIIkH5mDIAK7kv9A==
X-Received: by 2002:a05:6a00:2e17:b0:736:3954:d78c with SMTP id d2e1a72fcca58-736aaa1ce42mr17690072b3a.6.1741582745578;
        Sun, 09 Mar 2025 21:59:05 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	manos.pitsidianakis@linaro.org,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 13/16] hw/xen: add stubs for various functions
Date: Sun,  9 Mar 2025 21:58:39 -0700
Message-Id: <20250310045842.2650784-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Those functions are used by system/physmem.c, and are called only if
xen is enabled (which happens only if CONFIG_XEN is not set).

So we can crash in case those are called.

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


