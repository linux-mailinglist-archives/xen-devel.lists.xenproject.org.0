Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B7FA6187F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:48:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915204.1320782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt98s-0000Hz-GB; Fri, 14 Mar 2025 17:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915204.1320782; Fri, 14 Mar 2025 17:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt98s-0000FK-DM; Fri, 14 Mar 2025 17:48:18 +0000
Received: by outflank-mailman (input) for mailman id 915204;
 Fri, 14 Mar 2025 17:48:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8t8-0000xy-31
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:32:02 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bde3c3a-00fa-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 18:32:00 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2232aead377so53470325ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:32:00 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:58 -0700 (PDT)
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
X-Inumbo-ID: 3bde3c3a-00fa-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973519; x=1742578319; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZK4IDfbpcoj/UHXYNBc9hj61CH/qnmJNHrSERoWz24=;
        b=DtvnofA2cwOvKQdqOYyIlZHF9OU+ooy98NIk34RWvL72bnlq6SScyRvYNa5xUcCYg1
         3xmdFi6aeSAs/E30H9bNxVREj9QN1flnnEmqTQKduPcEGh/oXtJldFVNbn2U3xV9aob/
         EtUpN48K7uIHVwAaMz1EkOSb8IagOTKrRhK9Dp6uKrP0VBdNg+HQaeGdQhFo6IjgrRk8
         +K+bFjHgY+eUHR62SYcj4HE0yPNTiGa9xJWrVwb4Ck7Y1eY/0+LSv0VuuNzFTvTDkT76
         i5z65eClMSGZBLIsvJ6dpcB1KZiyIgIEoRE6Eobuc2HrVBY+rjS2RfReBxJ2fZoj2TB/
         30Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973519; x=1742578319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZK4IDfbpcoj/UHXYNBc9hj61CH/qnmJNHrSERoWz24=;
        b=w2XHGqBQUCBkZ4O0WBuonsmoIhr1cIIrvHfAKgrxFcD6M4aq7gQ09XdOT8mKhdPzQm
         IHKrdlA0Tahz83m1r5g2yoY7zrKRM4iWFdeL9AkTq9hjcrrxk4j9ZNqFpSu/05GOaCHj
         73DCkl6u3bVFaM2bUHcaVZSFRG8/O/v0mb3H78the8Q2gHRQ/JNVG7hDUxSKrj9cTZ0R
         sXaQtYWgcGmuxlydvnOj+oihrCfaTuq2tLxte/Uwlj2nb3ENK5QpNED2uJAfN8o2pRGB
         J/toQuCSAT/SU38mC/cJXU3xW+IIcMSkSDIK66Zr+DfFtRLGNS/jffleMLoib43tnTGi
         XT3g==
X-Forwarded-Encrypted: i=1; AJvYcCXKEiEBZRgkpEQMXOpdCcJ8Eo36TwhmpNT+DVnIJw7WOa8rJFi7XFUBR+2UDm+txgYgHPljLXPlwVg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwARH0aOQTqBG13J/2MYcotMv1Yodava9Q823WnsF5OOKPFK/nN
	9e8DSHj6TZMRwbtAJnOtE+iQVCzS/mgoVqn0Ym5kfxdpnCBdedfm7fgm7Xj4NYo=
X-Gm-Gg: ASbGncsrEFWodoEwL8jtrM2cUVMtMatI2Ege+Sv3icW3WeF/TEPwNQdjCM5FFbehg71
	qww84B+pRXxgp8XHa+WZMKYryKG7prBksg12jvoxRp8kSF3BBpjKVgFGg59WUyb9Fsp5WPyMpo7
	VIJM6Q9RuOxeiiTflj1OgeOkgNdKJOZvcYJ0RFQKY+lLajYhYHYfsULhCczpuNtnsVRt78Rn/mg
	fO58xoCc4je5yUxyc0W4LbTUJFVz3AJgaOmbS3hDN+iMam56cE7W5Utuwtyq2waSK/e1YImjehg
	A1gGbbDxFXWYCJ2AMQaMHge0hmTU5gPCrUoGY3hvpC3P
X-Google-Smtp-Source: AGHT+IFO+PDwMeyLa4EGhItdNdod3PivHdGg2tuOsQqj5N7me/+24tmsBkj8Jw+BltKmizpirWlssg==
X-Received: by 2002:a05:6a00:b4e:b0:736:533b:f6fa with SMTP id d2e1a72fcca58-737223bf5e7mr3790179b3a.13.1741973518933;
        Fri, 14 Mar 2025 10:31:58 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Paul Durrant <paul@xen.org>,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anthony PERARD <anthony@xenproject.org>,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v5 12/17] hw/xen: add stubs for various functions
Date: Fri, 14 Mar 2025 10:31:34 -0700
Message-Id: <20250314173139.2122904-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Those symbols are used by system/physmem.c, and are called only if
xen_enabled() (which happens only if CONFIG_XEN is set and xen is
available).

So we can crash the stubs in case those are called, as they are linked
only when CONFIG_XEN is not set.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/xen/xen_stubs.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/xen/meson.build |  3 +++
 2 files changed, 54 insertions(+)
 create mode 100644 hw/xen/xen_stubs.c

diff --git a/hw/xen/xen_stubs.c b/hw/xen/xen_stubs.c
new file mode 100644
index 00000000000..5e565df3929
--- /dev/null
+++ b/hw/xen/xen_stubs.c
@@ -0,0 +1,51 @@
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


