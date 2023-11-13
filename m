Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4737E9FC9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:21:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631692.985294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Ykm-0006eu-MU; Mon, 13 Nov 2023 15:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631692.985294; Mon, 13 Nov 2023 15:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Ykm-0006d3-JJ; Mon, 13 Nov 2023 15:21:32 +0000
Received: by outflank-mailman (input) for mailman id 631692;
 Mon, 13 Nov 2023 15:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DPbO=G2=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2Ykl-0005il-4P
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:21:31 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52380b4c-8238-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 16:21:30 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9e8b36e36e0so176058966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 07:21:30 -0800 (PST)
Received: from m1x-phil.lan ([176.164.221.204])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a17090611d700b009829d2e892csm4243243eja.15.2023.11.13.07.21.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Nov 2023 07:21:29 -0800 (PST)
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
X-Inumbo-ID: 52380b4c-8238-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888890; x=1700493690; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3bxfGqI5yyGuHTvJ252KdxHxDRKsvIzu9uNKMF+2iI=;
        b=gXRsTDOSQEDG1gnNO7n66cyH16/iNbTSvrH3oXMTeKldkNLFpU3/pxDz+o2MorWn/y
         l2ZvGuOPTU6ThdQxurR9cVmvl0G2+q+KnxzNxK3/bSNfvXyETx9oHrjW/s5ia7wwyAba
         /n0ezaoVFwL4u872GV/dM974JBO2rJBsgPD1BIyo0s9mwOb7RlUo/7+eBo7PL05jqwTT
         A3Tyr5bPorHuRg/yvq4Y/dGx0EprtiI+pCBnSyu6Z2QBHxW4c/X4iCrJCxv46Bwa4efl
         3GKmQrzui3VeirDAkDgIJu8cRJI+e9uU1uMRizLCTSHndJF1U0+9T3r20dY9+Qm2LRQ4
         2Hbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888890; x=1700493690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3bxfGqI5yyGuHTvJ252KdxHxDRKsvIzu9uNKMF+2iI=;
        b=ofm+I98/PiYhAX4gEVfPDoCaCWKeu5zQlrf54OQo6RvNYQk1VthQi9abGkI3hhVFcb
         7ttagzWXBE8d+nim7y9ds/nlWhA6QNp5XMKOeDpAtXV+Oh3ocYZn+ZOEwqBxuinoXXB3
         e76Ufjtxz4PgjjBmS+sYxPjwdIKZkSwdXxpeIBUoWLmg7UaCaTaviah4yCNzj18AH2xr
         Xla4qPkOZ0efjxLNmqiyoAFq4kkx8HVBHB1SujTIb00BbtcECSeB9bFSp0t6JDRZAxpU
         8bDPMNQB93sUM8Or2lNcX2A2yIdggkWx01451aLzIk9uPkNWfzg/y1SXfIShhUx+UP9k
         hEEw==
X-Gm-Message-State: AOJu0Ywr+Q1XSbFrzzIZGGtDJBeHdnmg5f8Fg9CA2P+Eo8pYDBWWCTDO
	lN7SlRq2e9CNoDvkGUxc0aXpIA==
X-Google-Smtp-Source: AGHT+IF709HFmNxhzIc8XnNuz+a2oAKUrEHD5dHSaR8itUuUqXulXss7tknv1cuy4PMkZKxP4RsDmw==
X-Received: by 2002:a17:906:3049:b0:9bd:f155:eb54 with SMTP id d9-20020a170906304900b009bdf155eb54mr4125199ejd.6.1699888890200;
        Mon, 13 Nov 2023 07:21:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 02/10] hw/xen/xen_arch_hvm: Rename prototypes using 'xen_arch_' prefix
Date: Mon, 13 Nov 2023 16:21:05 +0100
Message-ID: <20231113152114.47916-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use a common 'xen_arch_' prefix for architecture-specific functions.
Rename xen_arch_set_memory() and xen_arch_handle_ioreq().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/xen_arch_hvm.h  | 4 ++--
 include/hw/i386/xen_arch_hvm.h | 4 ++--
 hw/arm/xen_arm.c               | 4 ++--
 hw/i386/xen/xen-hvm.c          | 6 +++---
 hw/xen/xen-hvm-common.c        | 4 ++--
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/xen_arch_hvm.h b/include/hw/arm/xen_arch_hvm.h
index 8fd645e723..6a974f2020 100644
--- a/include/hw/arm/xen_arch_hvm.h
+++ b/include/hw/arm/xen_arch_hvm.h
@@ -2,8 +2,8 @@
 #define HW_XEN_ARCH_ARM_HVM_H
 
 #include <xen/hvm/ioreq.h>
-void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
-void arch_xen_set_memory(XenIOState *state,
+void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
+void xen_arch_set_memory(XenIOState *state,
                          MemoryRegionSection *section,
                          bool add);
 #endif
diff --git a/include/hw/i386/xen_arch_hvm.h b/include/hw/i386/xen_arch_hvm.h
index 1000f8f543..2822304955 100644
--- a/include/hw/i386/xen_arch_hvm.h
+++ b/include/hw/i386/xen_arch_hvm.h
@@ -4,8 +4,8 @@
 #include <xen/hvm/ioreq.h>
 #include "hw/xen/xen-hvm-common.h"
 
-void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
-void arch_xen_set_memory(XenIOState *state,
+void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
+void xen_arch_set_memory(XenIOState *state,
                          MemoryRegionSection *section,
                          bool add);
 #endif
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index a5631529d0..28d790f4ce 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -129,14 +129,14 @@ static void xen_init_ram(MachineState *machine)
     }
 }
 
-void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
+void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req)
 {
     hw_error("Invalid ioreq type 0x%x\n", req->type);
 
     return;
 }
 
-void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
+void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
                          bool add)
 {
 }
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index f42621e674..ffa95e3c3d 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -659,8 +659,8 @@ void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
     }
 }
 
-void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
-                                bool add)
+void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
+                         bool add)
 {
     hwaddr start_addr = section->offset_within_address_space;
     ram_addr_t size = int128_get64(section->size);
@@ -700,7 +700,7 @@ void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
     }
 }
 
-void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
+void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req)
 {
     switch (req->type) {
     case IOREQ_TYPE_VMWARE_PORT:
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 565dc39c8f..1d8bd9aea7 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -65,7 +65,7 @@ static void xen_set_memory(struct MemoryListener *listener,
         }
     }
 
-    arch_xen_set_memory(state, section, add);
+    xen_arch_set_memory(state, section, add);
 }
 
 void xen_region_add(MemoryListener *listener,
@@ -452,7 +452,7 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
             cpu_ioreq_config(state, req);
             break;
         default:
-            arch_handle_ioreq(state, req);
+            xen_arch_handle_ioreq(state, req);
     }
     if (req->dir == IOREQ_READ) {
         trace_handle_ioreq_read(req, req->type, req->df, req->data_is_ptr,
-- 
2.41.0


