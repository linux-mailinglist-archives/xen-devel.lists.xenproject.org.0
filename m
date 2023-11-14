Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E04A7EB51D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 17:49:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633022.987544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wab-0002Yi-4H; Tue, 14 Nov 2023 16:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633022.987544; Tue, 14 Nov 2023 16:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wab-0002WG-12; Tue, 14 Nov 2023 16:48:37 +0000
Received: by outflank-mailman (input) for mailman id 633022;
 Tue, 14 Nov 2023 16:48:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2wKt-0002Oz-HN
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 16:32:23 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6321eb24-830b-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 17:32:22 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9d2e7726d5bso876100066b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 08:32:22 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 c26-20020a17090603da00b009adce1c97ccsm5731084eja.53.2023.11.14.08.32.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 08:32:21 -0800 (PST)
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
X-Inumbo-ID: 6321eb24-830b-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979542; x=1700584342; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htjkOQmTZcMenhXqLaaInIEhXImv4mUPxpJWcjUwWD8=;
        b=Rn1wpB07WwB0c/xIyUddRTb8GwnGrna0FZXO43Pz2xSaUeGbgNmgpxGGdfESRvNmir
         Z1ZQ8WuocCIEObak5Zs6WotWQLAgvdjDsGiWin7oUALRB/Ryh23pZoHu33zxWf0FMGq2
         V9ncW4v2P0yw8sZx8kmrm+P3+mPnNxWO93yE9WMrfp3A+iLoq+oPVkvKjHhsUoG1giIn
         aT1zs4L5rsPfjrvvI/vvsajiK8z57v/gyNlxB6ZjbpmleCPiAJg9k4MARhHkTVhvC67W
         1w2NPXg9b6WXi77qEQBFzO+fuFDGjmcuBzPO/UZl8jXlvNT/H1nDx0TjaubSVAD1dCbL
         S7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979542; x=1700584342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htjkOQmTZcMenhXqLaaInIEhXImv4mUPxpJWcjUwWD8=;
        b=d/4nJihctZgjexkN21xBD0+5qNIjDb9DGJIe65RvF/XIWI34i5prqvCLDo506nQ9OC
         pfzvqG0Hbm0N+eakQVx8QiY4wmNiFYYnxDrKU0tF05T1XOE2Ki1bEUleXtibWmCcUUlq
         9rwcQHyYGhfF++EyWj+Xzel1ONSvde6kI35+4g1loPI56B6jRFcsQYipReHeHDatZYBM
         hbTJgS2BAwYbW5p3f5+rzkCO5ipMkgzEXuVVoZ0jz5t2y2gT8mnTnk6jvHJ/pFYPRNn6
         YlzajYAWdlPU7l3CUNmZ5G9b8f3NLa5heua1n3ci32a78azYjbUSKF78n6xCbgumjfSs
         8a9Q==
X-Gm-Message-State: AOJu0YxYvMJTnFlBxPIX4Y3Y2aQfwpz+eogkYr17vgJ5RkhlWhA944Ts
	k3YV1+pBr/RQHR+pNZbSGD6wHA==
X-Google-Smtp-Source: AGHT+IEJmFgqouqetrQ1cGRifpy+1FzLH8THhoRj/4LtsoCnWeS7Y04NxjXy02qkfonieH2Xog4T5Q==
X-Received: by 2002:a17:906:7943:b0:9d3:e48f:30d3 with SMTP id l3-20020a170906794300b009d3e48f30d3mr9901673ejo.31.1699979542369;
        Tue, 14 Nov 2023 08:32:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 9/9] hw/xen/hvm: Inline xen_arch_set_memory()
Date: Tue, 14 Nov 2023 17:31:23 +0100
Message-ID: <20231114163123.74888-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
References: <20231114163123.74888-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xen_arch_set_memory() is not arch-specific anymore. Being
called once, inline it in xen_set_memory().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-hvm-common.h |   3 -
 hw/xen/xen-hvm-common.c         | 104 ++++++++++++++++----------------
 2 files changed, 51 insertions(+), 56 deletions(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 536712dc83..a1b8a2783b 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -99,8 +99,5 @@ void cpu_ioreq_pio(ioreq_t *req);
 
 void xen_read_physmap(XenIOState *state);
 void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
-void xen_arch_set_memory(XenIOState *state,
-                         MemoryRegionSection *section,
-                         bool add);
 
 #endif /* HW_XEN_HVM_COMMON_H */
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 50ce45effc..789c6b4b7a 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -426,50 +426,6 @@ void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
     }
 }
 
-void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
-                         bool add)
-{
-    unsigned target_page_bits = qemu_target_page_bits();
-    int page_size = qemu_target_page_size();
-    int page_mask = -page_size;
-    hwaddr start_addr = section->offset_within_address_space;
-    ram_addr_t size = int128_get64(section->size);
-    bool log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
-    hvmmem_type_t mem_type;
-
-    if (!memory_region_is_ram(section->mr)) {
-        return;
-    }
-
-    if (log_dirty != add) {
-        return;
-    }
-
-    trace_xen_client_set_memory(start_addr, size, log_dirty);
-
-    start_addr &= page_mask;
-    size = ROUND_UP(size, page_size);
-
-    if (add) {
-        if (!memory_region_is_rom(section->mr)) {
-            xen_add_to_physmap(state, start_addr, size,
-                               section->mr, section->offset_within_region);
-        } else {
-            mem_type = HVMMEM_ram_ro;
-            if (xen_set_mem_type(xen_domid, mem_type,
-                                 start_addr >> target_page_bits,
-                                 size >> target_page_bits)) {
-                DPRINTF("xen_set_mem_type error, addr: "HWADDR_FMT_plx"\n",
-                        start_addr);
-            }
-        }
-    } else {
-        if (xen_remove_from_physmap(state, start_addr, size) < 0) {
-            DPRINTF("physmapping does not exist at "HWADDR_FMT_plx"\n", start_addr);
-        }
-    }
-}
-
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
                    Error **errp)
 {
@@ -512,20 +468,62 @@ static void xen_set_memory(struct MemoryListener *listener,
                            bool add)
 {
     XenIOState *state = container_of(listener, XenIOState, memory_listener);
+    unsigned target_page_bits = qemu_target_page_bits();
+    int page_size = qemu_target_page_size();
+    int page_mask = -page_size;
+    hwaddr start_addr;
+    ram_addr_t size;
+    bool log_dirty;
+    hvmmem_type_t mem_type;
+
 
     if (section->mr == &xen_memory) {
         return;
-    } else {
-        if (add) {
-            xen_map_memory_section(xen_domid, state->ioservid,
-                                   section);
-        } else {
-            xen_unmap_memory_section(xen_domid, state->ioservid,
-                                     section);
-        }
     }
 
-    xen_arch_set_memory(state, section, add);
+    if (add) {
+        xen_map_memory_section(xen_domid, state->ioservid,
+                               section);
+    } else {
+        xen_unmap_memory_section(xen_domid, state->ioservid,
+                                 section);
+    }
+
+    if (!memory_region_is_ram(section->mr)) {
+        return;
+    }
+
+    log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
+
+    if (log_dirty != add) {
+        return;
+    }
+
+    start_addr = section->offset_within_address_space;
+    size = int128_get64(section->size);
+    trace_xen_client_set_memory(start_addr, size, log_dirty);
+
+    start_addr &= page_mask;
+    size = ROUND_UP(size, page_size);
+
+    if (add) {
+        if (!memory_region_is_rom(section->mr)) {
+            xen_add_to_physmap(state, start_addr, size,
+                               section->mr, section->offset_within_region);
+        } else {
+            mem_type = HVMMEM_ram_ro;
+            if (xen_set_mem_type(xen_domid, mem_type,
+                                 start_addr >> target_page_bits,
+                                 size >> target_page_bits)) {
+                DPRINTF("xen_set_mem_type error, addr: "HWADDR_FMT_plx"\n",
+                        start_addr);
+            }
+        }
+    } else {
+        if (xen_remove_from_physmap(state, start_addr, size) < 0) {
+            DPRINTF("physmapping does not exist at "HWADDR_FMT_plx"\n", start_addr);
+        }
+    }
 }
 
 void xen_region_add(MemoryListener *listener,
-- 
2.41.0


