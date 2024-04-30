Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83DB8B7D94
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715062.1116607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgh-0007F2-D1; Tue, 30 Apr 2024 16:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715062.1116607; Tue, 30 Apr 2024 16:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgh-0007B0-4v; Tue, 30 Apr 2024 16:50:39 +0000
Received: by outflank-mailman (input) for mailman id 715062;
 Tue, 30 Apr 2024 16:50:37 +0000
Received: from [94.247.172.50] (helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/Z8=MD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s1qge-0003oL-Ti
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:50:36 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3d5505c-0711-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 18:50:35 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2e0a2870bceso29624661fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:50:35 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a2e8442000000b002d8744903ebsm3873436ljh.68.2024.04.30.09.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:50:33 -0700 (PDT)
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
X-Inumbo-ID: c3d5505c-0711-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714495835; x=1715100635; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Sw3MC4uOQJ6IvvUC7PiIJPbknZwiSjSO/ejkDz0sxs=;
        b=LybbEw0JirCXoCzReIPkFdeH6EfZywYm+TjP6g8JbBmpCJBXzJGZDGGqbEkIB5DNuZ
         vcS/rHlWlYCRwbVO2mgyxYgLkjSLMK/feIFWJIRFT3GNvgSLM2YMV6yUUuGQ8/Obby5y
         n2utJ432kJcxWSyARAhZG1I4/6YicaBH5WmYqz8WJZFaKJ/aNRfWPUzvEo1czzKkCGC3
         F3qMjnHCom4F41QiqUKHkHupgoCvzNlNBFMVCi1Ty6HSFtQvnvKBDI90XlNFWS4zUL74
         6sWtrDAf/TLw+ucnRAJF2XK2RO1R83qgDHh8liEPMMeeuhTON2XPhF3ObZX5xs9KSp2H
         FprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495835; x=1715100635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Sw3MC4uOQJ6IvvUC7PiIJPbknZwiSjSO/ejkDz0sxs=;
        b=fCNgQThFMv4nr8xAaPv47NVeO6SxM+OEfQqVSJdbYVFotQS+egerZXKyRLpF1/4Xtl
         k6Q1wjRJDC3VIWkwUR9qNDWeJcBJ6oar6eMIu6LmHC21RKIPywYTHsOJ+3k3UIDaBme/
         zVmZpCxOYyUGZigO1ndSh/GqsfhGatHWdEmu86CR3kDP068/wLaa1N+ZztfIKwfYQDwK
         nlWWZ/QNrRTdmkDfjYPdfS+mVwdGkFUmZU1aOnh6eXlaTY+bW2fywixLRt+bZKZHgTUI
         WFqaQfVj9GI42Peo2RPp1MBaTxgKQah6T8G/5vEEKTJKViu3jGhKp6TYr8P80WfyxkWK
         N/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTK0Ch2r6kYSAzppN5i/tv8A7Xa2UHuDJIWAGlTygUhXL5A/DR8rfQz/LS6Na87zz6f5qPBBlHa0FMT2U4vNlGoa3hmZ1eNM9Nf4Vv9I0=
X-Gm-Message-State: AOJu0YyCtt5d3rTx63TlbO0YMljBfnlXjHi/31/KRU7bjazDAkVzGcsc
	IbFKQUtr19S8bpyRGit0wQ+159C8q2E0fUvdqBak6mp4UyD9tWWktaN98fIa
X-Google-Smtp-Source: AGHT+IE03+GLFOiYCtv0tW5oxF/oyJb6HtkdKUGHKboh4aC+T/4yDlCy2Erx7BwyTDTkHUDhKykO+A==
X-Received: by 2002:a2e:968e:0:b0:2e0:e410:28d5 with SMTP id q14-20020a2e968e000000b002e0e41028d5mr195041lji.52.1714495834937;
        Tue, 30 Apr 2024 09:50:34 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 14/17] xen: Add xen_mr_is_memory()
Date: Tue, 30 Apr 2024 18:49:36 +0200
Message-Id: <20240430164939.925307-15-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430164939.925307-1-edgar.iglesias@gmail.com>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add xen_mr_is_memory() to abstract away tests for the
xen_memory MR.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-hvm-common.c | 8 +++++++-
 include/sysemu/xen.h    | 8 ++++++++
 system/physmem.c        | 2 +-
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 1627da7398..0267b88d26 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -12,6 +12,12 @@
 
 MemoryRegion xen_memory;
 
+/* Check for xen memory.  */
+bool xen_mr_is_memory(MemoryRegion *mr)
+{
+    return mr == &xen_memory;
+}
+
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
                    Error **errp)
 {
@@ -28,7 +34,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
         return;
     }
 
-    if (mr == &xen_memory) {
+    if (xen_mr_is_memory(mr)) {
         return;
     }
 
diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index 754ec2e6cb..dc72f83bcb 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -34,6 +34,8 @@ void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
                    struct MemoryRegion *mr, Error **errp);
 
+bool xen_mr_is_memory(MemoryRegion *mr);
+
 #else /* !CONFIG_XEN_IS_POSSIBLE */
 
 #define xen_enabled() 0
@@ -47,6 +49,12 @@ static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
     g_assert_not_reached();
 }
 
+static inline bool xen_mr_is_memory(MemoryRegion *mr)
+{
+    g_assert_not_reached();
+    return false;
+}
+
 #endif /* CONFIG_XEN_IS_POSSIBLE */
 
 #endif
diff --git a/system/physmem.c b/system/physmem.c
index ad7a8c7d95..1a5ffcba2a 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -2227,7 +2227,7 @@ static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
          * because we don't want to map the entire memory in QEMU.
          * In that case just map the requested area.
          */
-        if (block->offset == 0) {
+        if (xen_mr_is_memory(block->mr)) {
             return xen_map_cache(block->mr, addr, len, lock, lock,
                                  is_write);
         }
-- 
2.40.1


