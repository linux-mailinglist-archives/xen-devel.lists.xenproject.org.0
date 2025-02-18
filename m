Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E68A3A2AC
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:26:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892004.1301038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQQm-0005HS-SY; Tue, 18 Feb 2025 16:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892004.1301038; Tue, 18 Feb 2025 16:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQQm-0005Ej-Pq; Tue, 18 Feb 2025 16:26:44 +0000
Received: by outflank-mailman (input) for mailman id 892004;
 Tue, 18 Feb 2025 16:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlVU=VJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tkQQl-0004Eu-Sz
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:26:43 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2308296b-ee15-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 17:26:42 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38f2b7ce2e5so2338595f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:26:42 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43990f53847sm35276835e9.1.2025.02.18.08.26.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Feb 2025 08:26:41 -0800 (PST)
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
X-Inumbo-ID: 2308296b-ee15-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739896002; x=1740500802; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a66yVnUC0E5xDdPgIBrEynWgyX5dbe4KJOQ4kO7y1I=;
        b=dpNjiOScx02LTjn9jwtoA3nc+FfVTHweCrBbrXN//oVV+YAx5BpA+QNSY50cr8eYwe
         cEUVWzRBHlpwsD9fB9jWex1GG3OMndQo15TsHdOFdQ7JcQQhm39GCIB/xKcSo+4Yln6h
         Xbv6nRI5e/aL7yixFVFZy8sKwPYtSdq7iR3YLa8cf7LcLW9Emeyie/Wac/1K4V99ZaIb
         yXjshQA/0QF3YkKo86zk/YW1akMfUDSVA7hMINyRBiHy/pWG5cXIdeVdSeG0YoE6Dc83
         ZLDps494ldOG6JNZMMvW17/3QE2xknMSQnK0eZs46R3uOKFZaa6TDtMwAJnuKIM3ScIQ
         RwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739896002; x=1740500802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0a66yVnUC0E5xDdPgIBrEynWgyX5dbe4KJOQ4kO7y1I=;
        b=iTYIzBSKaaXryIxEsm/AV0pzkKS1G0pQAZeAt8pDfNS0jDzulvWBgHrZUL48pDjf0p
         OLeJlnsnjd4kw1DlZfLr/9AWHVDlbiTt08g4Q6uw4g9RFjllj83GgC3tgzUVeS6HuPmX
         l2JrCKgU44hslGp+Wz/B4qSegeAJ3lPbnHAAohTauWr2rZBLLItPlrBJFSvjIBrqVG/P
         LXZYwoALX0punCArJ1VSd/ScO9iee4gk1vWmZGlqGfMpNXnj+KuhdXgGwtJRzJ4wgJeC
         0VhMuX22FRRdeHMqr4va+PkUIKf7DX4tvCw3gfNqfo0zVhvD0wuZ1rHagi1qly6HpSyI
         mkQA==
X-Forwarded-Encrypted: i=1; AJvYcCX4zdbiLvRtB9v/JeCXHRa1ll98TjYkkXP76pfHHzW5Y/KMrPjyyVrHEGlwC/5s5U6Jp4HJzWqnb6E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/CVBFaa2xpSGakd0A1LsZFj06ayTBFPVmiCzRakB5p4xy0vKe
	egEscNBy+KZDO+IFKX4xArZD7OBB7D8qs3S0l0yHyJItTwGkXMwQqi2XrwEsKvs=
X-Gm-Gg: ASbGncvL25Zi7oZgXhGtmO+lmDBPYXovLtXyzGEk/dqHy7CwEfxzq7eA14l7ayKawZf
	fQtK2m530PUSMzHj2u6Erx5Dnakv6SWitTkamHoJ1VJLBX5p+jzJKBc2D1S9WKToj07fDuaotwb
	RKBUqJy/gEAcx8CIuK+KAAZh0DetZBv3lrNh9ZS8V4g2Qmk0/W+d+DlkqZEAFF2Vs7WHwHsOJhE
	bK6Dsboy2I67GB+cACEfEkvqTcAfcDOEWaFBx47+qK/161H++JkT5bsdw4hA02G+LFZAwmamdrZ
	zm+9SyhEJUgcYArGfkqkhtDAS8Y8WFkJqrByPiMffPjusMco7AlV1qmpw711frdQ4g==
X-Google-Smtp-Source: AGHT+IGVAlgtubLuls4ng2ytjxZmkvsTq+0bRKUdjbgCyy9ok8Tw4Re7Q3OdU7d9IrlO5cAU3E/jjg==
X-Received: by 2002:a05:6000:1865:b0:38f:4d91:c123 with SMTP id ffacd0b85a97d-38f4d91c4abmr6004250f8f.32.1739896001712;
        Tue, 18 Feb 2025 08:26:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Thomas Huth <thuth@redhat.com>,
	Jan Beulich <jbeulich@suse.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 4/8] hw/xen/xen-pvh: Reduce included headers
Date: Tue, 18 Feb 2025 17:26:14 +0100
Message-ID: <20250218162618.46167-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218162618.46167-1-philmd@linaro.org>
References: <20250218162618.46167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have "hw/xen/xen-pvh-common.h" include the bare minimal set
of headers. Adapt sources to avoid errors when refactoring
unrelated headers such:

    hw/i386/xen/xen-pvh.c: In function ‘xen_pvh_machine_class_init’:
    hw/i386/xen/xen-pvh.c:84:28: error: ‘TARGET_DEFAULT_CPU_TYPE’ undeclared (first use in this function)
       84 |     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
          |                            ^~~~~~~~~~~~~~~~~~~~~~~
    hw/xen/xen-pvh-common.c: In function ‘xen_pvh_init’:
    hw/xen/xen-pvh-common.c:217:43: error: ‘MiB’ undeclared (first use in this function)
      217 |         if (s->cfg.pci_ecam.size != 256 * MiB) {
          |                                           ^~~
    hw/xen/xen-hvm-common.c:18:6: error: no previous prototype for ‘xen_mr_is_memory’ [-Werror=missing-prototypes]
       18 | bool xen_mr_is_memory(MemoryRegion *mr)
          |      ^~~~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-pvh-common.h | 8 ++++----
 hw/i386/xen/xen-pvh.c           | 1 +
 hw/xen/xen-pvh-common.c         | 6 ++----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-common.h
index 5cdd23c2f4d..17c5a58a5a4 100644
--- a/include/hw/xen/xen-pvh-common.h
+++ b/include/hw/xen/xen-pvh-common.h
@@ -9,11 +9,11 @@
 #ifndef XEN_PVH_COMMON_H__
 #define XEN_PVH_COMMON_H__
 
-#include <assert.h>
-#include "hw/sysbus.h"
-#include "hw/hw.h"
-#include "hw/xen/xen-hvm-common.h"
+#include "exec/memory.h"
+#include "qom/object.h"
+#include "hw/boards.h"
 #include "hw/pci-host/gpex.h"
+#include "hw/xen/xen-hvm-common.h"
 
 #define TYPE_XEN_PVH_MACHINE MACHINE_TYPE_NAME("xen-pvh-base")
 OBJECT_DECLARE_TYPE(XenPVHMachineState, XenPVHMachineClass,
diff --git a/hw/i386/xen/xen-pvh.c b/hw/i386/xen/xen-pvh.c
index 33c10279763..f6356f2a7ed 100644
--- a/hw/i386/xen/xen-pvh.c
+++ b/hw/i386/xen/xen-pvh.c
@@ -14,6 +14,7 @@
 #include "hw/xen/arch_hvm.h"
 #include <xen/hvm/hvm_info_table.h>
 #include "hw/xen/xen-pvh-common.h"
+#include "target/i386/cpu.h"
 
 #define TYPE_XEN_PVH_X86  MACHINE_TYPE_NAME("xenpvh")
 OBJECT_DECLARE_SIMPLE_TYPE(XenPVHx86State, XEN_PVH_X86)
diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
index 9c21fa858d3..19876ad7e8d 100644
--- a/hw/xen/xen-pvh-common.c
+++ b/hw/xen/xen-pvh-common.c
@@ -7,15 +7,13 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/error-report.h"
-#include "qapi/error.h"
+#include "qemu/units.h"
 #include "qapi/visitor.h"
 #include "hw/boards.h"
 #include "hw/irq.h"
-#include "hw/sysbus.h"
-#include "system/system.h"
 #include "system/tpm.h"
 #include "system/tpm_backend.h"
+#include "system/runstate.h"
 #include "hw/xen/xen-pvh-common.h"
 #include "trace.h"
 
-- 
2.47.1


