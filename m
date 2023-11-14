Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE467EB2DD
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:55:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632683.987038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uom-0002VR-QK; Tue, 14 Nov 2023 14:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632683.987038; Tue, 14 Nov 2023 14:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uom-0002Tl-NJ; Tue, 14 Nov 2023 14:55:08 +0000
Received: by outflank-mailman (input) for mailman id 632683;
 Tue, 14 Nov 2023 14:55:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uZq-0003vI-V1
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:39:42 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5a6b369-82fb-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 15:39:42 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5440f25dcc7so8731461a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:39:42 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 k25-20020aa7c059000000b0053dd8898f75sm5155063edo.81.2023.11.14.06.39.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:39:41 -0800 (PST)
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
X-Inumbo-ID: a5a6b369-82fb-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972782; x=1700577582; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzmBSObK1PNYaVxHm2kQdQrWhNegSVRCuy1/LpCCkxs=;
        b=dMUVEZ74P91kfdtH+WZ7AuubPPGNE1Zes1A1b1D2dDu+79B7gpXxso5sL+ouFshZqr
         cz/29RhpNYitWHFAtQoPLkZIjmvYcP4vCRSkyi6Aj8Dtda0krhDZSCxK440j3SFqioQP
         hMu5R769lBO989KzQYwDAObXkgPOtwu0DCynhYCWmOfTS4k/KgnCndaAo4WKArDuoAIC
         miciZx1N+QcpCSf4LqarXPIp8VwcrKc+394yGw1teyerS2VGEZyw8p+dzygU1aS4q+qZ
         EnuJ53kI5Bb6ompVlD0zFL5swg3DxlJC2PqQFxZNXAzptUcownmSJX7MbvC1jSq207U0
         X9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972782; x=1700577582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzmBSObK1PNYaVxHm2kQdQrWhNegSVRCuy1/LpCCkxs=;
        b=R4f+T434RcG/f7w2bak8bjdO728gPtwlDd1LcCwtYU5xnvbCKtlwjaHvFJjlFDq9yl
         a84Olbh3mH9eDhDZ3n7Tb2byn/oHMouLhzo3IcBDePpgL6Jz9BGqYAHrWKuBefpsEBny
         M372m6iHRZbRjDo1PfXwovAHw7J7EGQuVMk4APpnNo17bx12T9VCtULfK2xc1aU0W+bE
         9Z74M8eSunC00PnxOn3G7fMWwUr9jsoLMrDliHXo+6seS+QkzC3N04q1rdIEEyIcwcUX
         S6d3yAowBfEMLOqFYKd7gjiYGyuSB6Y7DaL5L4cSPrsJgLHOJR1R3c5k3JNZEKiMXAt7
         /3Xg==
X-Gm-Message-State: AOJu0YztXYF3VjOXJ0hVrhTqsAqpR/HsfkDifCftAWtLhfYdS5Yobalj
	LOJVsI0gqv/Y//5dk0MuAwphJA==
X-Google-Smtp-Source: AGHT+IExeFq34FYS8TGI99eGSAGJR2PT8yf3hsSWiq8DkOxV7jzDuNfy8kK0Izfgi0PzWhH+ZoIHKg==
X-Received: by 2002:aa7:d050:0:b0:540:3286:d2e8 with SMTP id n16-20020aa7d050000000b005403286d2e8mr7060069edo.18.1699972781909;
        Tue, 14 Nov 2023 06:39:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 v2 12/19] hw/xen: Merge 'hw/xen/arch_hvm.h' in 'hw/xen/xen-hvm-common.h'
Date: Tue, 14 Nov 2023 15:38:08 +0100
Message-ID: <20231114143816.71079-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We don't need a target-specific header for common target-specific
prototypes. Declare xen_arch_handle_ioreq() and xen_arch_set_memory()
in "hw/xen/xen-hvm-common.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index d3fa5ed29b..8934033eaa 100644
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
index bf19407879..6b0e396502 100644
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
index 5150984e46..0fbe720c8f 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -21,7 +21,6 @@
 #include "qemu/range.h"
 
 #include "hw/xen/xen-hvm-common.h"
-#include "hw/xen/arch_hvm.h"
 #include <xen/hvm/e820.h>
 
 static MemoryRegion ram_640k, ram_lo, ram_hi;
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index cf6ed11f70..bb3cfb200c 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -7,7 +7,6 @@
 #include "hw/xen/xen-hvm-common.h"
 #include "hw/xen/xen-bus.h"
 #include "hw/boards.h"
-#include "hw/xen/arch_hvm.h"
 
 MemoryRegion xen_memory;
 
-- 
2.41.0


