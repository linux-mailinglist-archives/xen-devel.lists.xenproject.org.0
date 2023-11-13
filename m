Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EF07E9FCA
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631693.985306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Ykt-0007Lu-1D; Mon, 13 Nov 2023 15:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631693.985306; Mon, 13 Nov 2023 15:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Yks-0007IP-Sc; Mon, 13 Nov 2023 15:21:38 +0000
Received: by outflank-mailman (input) for mailman id 631693;
 Mon, 13 Nov 2023 15:21:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DPbO=G2=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2Ykr-0005il-HQ
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:21:37 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5604f5d6-8238-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 16:21:36 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5437269a661so11297035a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 07:21:36 -0800 (PST)
Received: from m1x-phil.lan ([176.164.221.204])
 by smtp.gmail.com with ESMTPSA id
 11-20020a50874b000000b0053e2a64b5f8sm3913912edv.14.2023.11.13.07.21.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Nov 2023 07:21:36 -0800 (PST)
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
X-Inumbo-ID: 5604f5d6-8238-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888896; x=1700493696; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMhWA/NoPTBRWdKt+DCwjQph3Exp2cV0GiTpIObeWaI=;
        b=eC+tcMr8YPUPZXRcjewL9pLwKzuQKSvdAZDUX2wQEWBgy7L/fESwHtwxO1oKjWZQvH
         cADqCjTlRXvVOiAbWkfYUj5w55XFdEm8PXD6ZRLTb3prGoQczPfsuND5Tc+ZxYZl7QBQ
         7CGVrxlBsjaqMYaFPhP7PAc5XWXOGYiquA7LTCygoREpDCzs29QSyfrGBvXHGQzhhQ36
         7V2G1oKSNzSA7MZc4FZEwK7uMRyB21g3Fat+oSTSRjxqeEuqdTTL7dfDhVzkPwxs0XqD
         ivwa3hYoJce2932GnaLH7PCJ3kvPvK28q0ylok5zaZXC9dusGZZpgsVDxBN+EzqyBRt/
         BTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888896; x=1700493696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMhWA/NoPTBRWdKt+DCwjQph3Exp2cV0GiTpIObeWaI=;
        b=reC3TmliD2fjvW8Nloq7LScLYiDtq7wawlUPj6npXmkGTHuNI1R0pQgxWMlbg/Lv02
         cNrmyrLmSt/dOu9ikHN1p0mP5nCbkoiCFipX9B3HgNaspLMHz0Ifmo6wZOfU/W9/Icsm
         CdxZieaVDEbpgmuPxGF1WPVtlXSKE29GE2rQ5ehqykIAJdILF6dKsaptHSZnrXLq1eCf
         4Ihv1F6rq1suEsG43MnwijA/KyNztxxP1SW/N649qy6LCMfnP4+bZXYKFDqTEul8O7Xv
         dsBSUWAG0Ve4Kj0ax2yItzgn3k58yP1D3/Cuc0S+7UrtHv5S+lEcdcK84SksRkcIaiF+
         AdqA==
X-Gm-Message-State: AOJu0Yzd9Fhzb0YlzjQssBWpxKKR/3APVehU7MsCovqjul5BUbaQAZx+
	6JTxnTbf4QgrLrT23piSov/UnQ==
X-Google-Smtp-Source: AGHT+IGc2vVbLMMmJTrJzN8L348x5fFie1XMuffaYHScqr/mEvB+nkKPvDnad4c+cU6PUAspz7oR2w==
X-Received: by 2002:a05:6402:2553:b0:533:5d3d:7efe with SMTP id l19-20020a056402255300b005335d3d7efemr9304050edb.6.1699888896473;
        Mon, 13 Nov 2023 07:21:36 -0800 (PST)
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
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH-for-9.0 03/10] hw/xen: Merge 'hw/xen/arch_hvm.h' in 'hw/xen/xen-hvm-common.h'
Date: Mon, 13 Nov 2023 16:21:06 +0100
Message-ID: <20231113152114.47916-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We don't need a target-specific header for common target-specific
prototypes. Declare xen_arch_handle_ioreq() and xen_arch_set_memory()
in "hw/xen/xen-hvm-common.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/xen_arch_hvm.h   |  9 ---------
 include/hw/i386/xen_arch_hvm.h  | 11 -----------
 include/hw/xen/arch_hvm.h       |  5 -----
 include/hw/xen/xen-hvm-common.h |  6 ++++++
 hw/arm/xen_arm.c                |  1 -
 hw/i386/xen/xen-hvm.c           |  1 -
 hw/xen/xen-hvm-common.c         |  1 -
 7 files changed, 6 insertions(+), 28 deletions(-)
 delete mode 100644 include/hw/arm/xen_arch_hvm.h
 delete mode 100644 include/hw/i386/xen_arch_hvm.h
 delete mode 100644 include/hw/xen/arch_hvm.h

diff --git a/include/hw/arm/xen_arch_hvm.h b/include/hw/arm/xen_arch_hvm.h
deleted file mode 100644
index 6a974f2020..0000000000
--- a/include/hw/arm/xen_arch_hvm.h
+++ /dev/null
@@ -1,9 +0,0 @@
-#ifndef HW_XEN_ARCH_ARM_HVM_H
-#define HW_XEN_ARCH_ARM_HVM_H
-
-#include <xen/hvm/ioreq.h>
-void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
-void xen_arch_set_memory(XenIOState *state,
-                         MemoryRegionSection *section,
-                         bool add);
-#endif
diff --git a/include/hw/i386/xen_arch_hvm.h b/include/hw/i386/xen_arch_hvm.h
deleted file mode 100644
index 2822304955..0000000000
--- a/include/hw/i386/xen_arch_hvm.h
+++ /dev/null
@@ -1,11 +0,0 @@
-#ifndef HW_XEN_ARCH_I386_HVM_H
-#define HW_XEN_ARCH_I386_HVM_H
-
-#include <xen/hvm/ioreq.h>
-#include "hw/xen/xen-hvm-common.h"
-
-void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
-void xen_arch_set_memory(XenIOState *state,
-                         MemoryRegionSection *section,
-                         bool add);
-#endif
diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
deleted file mode 100644
index c7c515220d..0000000000
--- a/include/hw/xen/arch_hvm.h
+++ /dev/null
@@ -1,5 +0,0 @@
-#if defined(TARGET_I386) || defined(TARGET_X86_64)
-#include "hw/i386/xen_arch_hvm.h"
-#elif defined(TARGET_ARM) || defined(TARGET_ARM_64)
-#include "hw/arm/xen_arch_hvm.h"
-#endif
diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 4e9904f1a6..27e938d268 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -96,4 +96,10 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
                         const MemoryListener *xen_memory_listener);
 
 void cpu_ioreq_pio(ioreq_t *req);
+
+void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
+void xen_arch_set_memory(XenIOState *state,
+                         MemoryRegionSection *section,
+                         bool add);
+
 #endif /* HW_XEN_HVM_COMMON_H */
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 28d790f4ce..6a1d7719e9 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -33,7 +33,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/xen/xen-hvm-common.h"
 #include "sysemu/tpm.h"
-#include "hw/xen/arch_hvm.h"
 
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index ffa95e3c3d..f8a195270a 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -21,7 +21,6 @@
 #include "qemu/range.h"
 
 #include "hw/xen/xen-hvm-common.h"
-#include "hw/xen/arch_hvm.h"
 #include <xen/hvm/e820.h>
 
 static MemoryRegion ram_640k, ram_lo, ram_hi;
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 1d8bd9aea7..c028c1b541 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -7,7 +7,6 @@
 #include "hw/xen/xen-hvm-common.h"
 #include "hw/xen/xen-bus.h"
 #include "hw/boards.h"
-#include "hw/xen/arch_hvm.h"
 
 MemoryRegion ram_memory;
 
-- 
2.41.0


