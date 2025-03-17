Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DB8A65CB4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:34:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917748.1322640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIR-0000aM-8e; Mon, 17 Mar 2025 18:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917748.1322640; Mon, 17 Mar 2025 18:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIR-0000TM-1o; Mon, 17 Mar 2025 18:34:43 +0000
Received: by outflank-mailman (input) for mailman id 917748;
 Mon, 17 Mar 2025 18:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIO-0006VW-IZ
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:40 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bfe7bee-035e-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 19:34:40 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2239c066347so99592345ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:39 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:38 -0700 (PDT)
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
X-Inumbo-ID: 7bfe7bee-035e-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236478; x=1742841278; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59c6JEMS6FIy924v+CKtazEU0ebGAiMufvTS4mzCbJo=;
        b=URBQfIApXa1D9rXmhhCOiHINv56EQS1U5hUrJLxe441UVSY484eSJ+mzfmGAk9cOr1
         eqkruCf6g7Ia1dwRMp6FR6Bgy0b9F55SnVz0qv9YHGWrO+1zWVH4yUssrn7OPA9XE8oK
         h9HtiNvkexenXqWSzL0SZBDKCk6QdfIEe53KOgn0ePm+W50rNlKtJ3YRwPY3DePmspkd
         Q97szyUgx4zAI0X4VUzEC00so6QYGCx7dFqcMcy5yj6XuFPFLXuH0bQpoUWNA3DdIQ4a
         C30KRa84Qs7J/cjB7Bv0mNU5YStQ8N/5PQStBSekTvcFNPJ6wef7GIcLx1ADEKKjnwFu
         Uuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236478; x=1742841278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59c6JEMS6FIy924v+CKtazEU0ebGAiMufvTS4mzCbJo=;
        b=dWctuECHa5yTV8jzBhxmnzlYGOLsc1JTJnYaWfNjN2OH1kQVhkGIb0mpGM2j+A4HMx
         VGuANk1JRWt+8EuSAG32TuwX6+p6D1KrW+HJUHlApjW1lAR56NMdOOb0lvhYsbf0BGuC
         cOuBBKgK1CPZCDP7eRPVqou02tim3p9I7ZoNgCkBzAF5lg9+z1JbU/wJRfV10fYwPl80
         e0y+o7+RD59O+nhc3u/e3y1SWYTutN13nMpyBk2eA1HcTb50SMnvR3Q04RYbVYFh0Rpn
         ML9gk6I6WiiXcRaAiONa/5hIfmKG3OYow/6N9Lylnm1RmEaUebM9kIfFEOj47T2KJNxt
         ee4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUkh6c3xx7QeykskkLwEN9Fo2tvtrlgThTI+d+A/+3Tnt6Cukf2Lpc6b43Oa+r/lpaE6qLshAFkyc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPODRg1pECn/HR27csb7SsHOJz30tpK/jafiBy5kcW7gD8JUIo
	2UYFM0rA5gJ39Txl40w9qphqm4LjYkUjr9/w/sjr9piAJYsQuaHNY5bpg6K5ZFg=
X-Gm-Gg: ASbGnct8IfzFnW069b0D5bHYFAPd/TIVDb7mo1gVKNnljC0cxnROX+fydg2Ybip0qVs
	0YGqDZRBC3uWZYjI5l0sD80fuOVvEN38pCl5S1WnlKWjuTEj05zyleKzoWpYNkesJl03ovT/pc5
	HAvxNVyjXK2tcfp+6//87TcU3MdF1io4kD+crH8v0o7NbGv1dc5GrzwwfPqCncfMc4P0Wm1UeUE
	1XktfvhHULQpSrA4bOCY5gDNmcH8OMNdVz/OaNy+/zDOFPV33bsuEnDUn+AVIp+J1vH8PCNrXj9
	WFnSFVi0mBKGaztE6iBuH2mrol/IncsWC+cmVhxw7AQDvgifJzBpjVY=
X-Google-Smtp-Source: AGHT+IGMBPlS4723f/QfXCi2z/TEFSVr/xLDSBzcEDnDoDIjYYHTKxD7//19rhfel7oXOjNf8/+suQ==
X-Received: by 2002:a17:902:f711:b0:220:fe51:1aab with SMTP id d9443c01a7336-225e0af4f9cmr187594395ad.38.1742236478508;
        Mon, 17 Mar 2025 11:34:38 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	David Hildenbrand <david@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-riscv@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Xu <peterx@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v6 12/18] hw/xen: add stubs for various functions
Date: Mon, 17 Mar 2025 11:34:11 -0700
Message-Id: <20250317183417.285700-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Those symbols are used by system/physmem.c, and are called only if
xen_enabled() (which happens only if CONFIG_XEN is set and xen is
available).

So we can crash the stubs in case those are called, as they are linked
only when CONFIG_XEN is not set.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
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


