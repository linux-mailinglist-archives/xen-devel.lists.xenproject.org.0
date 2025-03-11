Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749B2A5CAAC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 17:20:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908730.1315848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2Ko-0002cs-1G; Tue, 11 Mar 2025 16:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908730.1315848; Tue, 11 Mar 2025 16:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2Kn-0002aq-Rw; Tue, 11 Mar 2025 16:20:01 +0000
Received: by outflank-mailman (input) for mailman id 908730;
 Tue, 11 Mar 2025 16:19:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JHpu=V6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ts2Kl-0002GP-Q1
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 16:19:59 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac9efe9d-fe94-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 17:19:57 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5e6c18e2c7dso5043217a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 09:19:57 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c74a9303sm8706016a12.42.2025.03.11.09.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 09:19:56 -0700 (PDT)
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
X-Inumbo-ID: ac9efe9d-fe94-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741709997; x=1742314797; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=511IffhcAy5W/pLJ+OKUC4AMLtLOkIZxutbaQdf0Fko=;
        b=Z4kHQC/4bTJpQiYNsBNTEIMQXinF6fRbPpKggDyn2n44VOHEPjTMxTjt1SYklwiNCz
         jaud1CpuDJ1N11jiCW2J39FvoWoirwWzNYVQ35IqZrPxP08Zb5queP5KoWK19LL0dyDo
         4eFweT6Wpnnh/AjQmFFBo7jro/IfkPpFJMYYmRdff+mP2xyHeRPS+z1wXhVyHMK3Mu2m
         86Rw0NN8rO/3OjQ0iFapZ3HaRLjDoYFzcwUqCTDFXhTQ6CpJ5tZZDfWlDj3lt2TA7Pec
         AqgMr4UesMlT+FA4/GbBbDdXDYdo7n1wnu8bznckuYWbukpY+yik2oEPPt9hU9n3F6Xg
         cViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741709997; x=1742314797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=511IffhcAy5W/pLJ+OKUC4AMLtLOkIZxutbaQdf0Fko=;
        b=HU0C36au9VAvbRrE7KXSiC6VN5x4ZyDsFITbwTebkc/jwbh8qiXM2GENrRhCb6vx1G
         1DhHX3y59vR8QgwLpPx7P7LqYOcBmx6Delj+AArD0JWFuFM9FxJAOQFI15jgKYUYT5L/
         JE45un6spr69eY6BCBjuBKOq1eSHhx265TP+Drb0Nf/UcO8+nSJ+eI/w+UoREetGzWfN
         KeL8HNmm9EDOZfHX30H8dF3REdev5kNS/BGH6u314j7RnCpAv7VCBsuOoDI6OslM7y6y
         VA9vt1mFhH9rLe6QhCWUiYvtfpIOVbNlp/ZWOOXOk2enppg9vUlY3aU2Ys4ya/PLkM9P
         KOQg==
X-Gm-Message-State: AOJu0YwrlFKhoaFIXi2F4ZQ1Gi+9eYOmpP0BndidZgn/JfsMHIUV+Szk
	9BpwMZhHtufiNf5l79V7zdLStJ4MZMBS0T3yBgoPqARBEJhsTn1EYAhGDg==
X-Gm-Gg: ASbGncvE/CBGRoOAdaRnpKt/4eKlZPwIEupwUtCY7dvjQmcgAa7QggRaGi4yu6lxExy
	7TjpjSAN5hbB2Aw0NeJtLw51Sw8SzCHmls/fHI6qOXWfdbKxvQGbm7QSWBs988h7NwWnHP+DkgP
	NEVYIRUggzs1XYWNSlYuclwnY12InxZQQVz3FMmc0oECPma/v/veW36InTtqoGm7mfvRPF7/vU3
	ZLSYZMQRjUa6ODur7HhieJBI7u1zygEwIdrw/RGs+ynP5SKtFPgVq4lauUkMI/VvOwVqj1/lGUu
	KijIuFItg+2ak1IFrVnhR5p0NurWE09mZztGUTeqdLfkIMH7j70VikIzDgLaWCAKxtSA3pzivv7
	4TfORez87PRQcCTunodB2nSpP
X-Google-Smtp-Source: AGHT+IHrrN6Dj7yiJvpqPpgOn8sOdY2anWx617ZKvhtgWYVMQdaOX5cudWqwTab1EyfSYu1qPQEIdA==
X-Received: by 2002:a05:6402:13d4:b0:5de:dd44:929e with SMTP id 4fb4d7f45d1cf-5e5e24a9a94mr18526816a12.21.1741709996701;
        Tue, 11 Mar 2025 09:19:56 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v1 3/4] xen/riscv: implement basic aplic_preinit()
Date: Tue, 11 Mar 2025 17:19:50 +0100
Message-ID: <6e2212313a47772d6929ae76f5e4be0f365766e9.1741709885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on the code from [1] provided by Romain Caritey from Microchip
with some minor changes():
 - Xen code style fixes
 - Drop static variable inside aplic_preinit() and check
   aplic_info.node directly.
 - Drop direct initialization of aplic_info.hw_version in aplic_preinit()
   as this field is explicitly initialized during declaration/definition
   of aplic_info.
 - Rename gic* to intc* to not confuse with Arm's GIC.
 - Keep only minimal of things needed at the moment:
    - Declare DT device.
    - Initialize APLIC node.
    - Set hw_version for aplic_info.

Since Microchip originally developed aplic.c, an internal discussion with
them led to the decision to use the MIT license instead of the default
GPL-2.0-only.

[1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/7cfb4bd4748ca268142497ac5c327d2766fb342d

Signed-off-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile           |  1 +
 xen/arch/riscv/aplic.c            | 50 +++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/intc.h | 20 +++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 xen/arch/riscv/aplic.c
 create mode 100644 xen/arch/riscv/include/asm/intc.h

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 82016a957a..dd5fd25c7d 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,3 +1,4 @@
+obj-y += aplic.o
 obj-y += cpufeature.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
new file mode 100644
index 0000000000..42fac32958
--- /dev/null
+++ b/xen/arch/riscv/aplic.c
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/aplic.c
+ *
+ * RISC-V Advanced Platform-Level Interrupt Controller support
+ *
+ * Copyright (c) 2023-2024 Microchip.
+ * Copyright (c) 2024 Vates
+ */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/types.h>
+
+#include <asm/device.h>
+#include <asm/intc.h>
+
+static struct intc_info aplic_info = {
+    .hw_version = INTC_APLIC,
+    .node = NULL
+};
+
+static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
+{
+    if ( aplic_info.node )
+    {
+        printk("XEN doesn't support more than one S mode APLIC\n");
+        return -ENODEV;
+    }
+
+    /* don't process if APLIC node is not for S mode */
+    if ( dt_get_property(node, "riscv,children", NULL) )
+        return -ENODEV;
+
+    aplic_info.node = node;
+
+    return 0;
+}
+
+static const struct dt_device_match aplic_dt_match[] __initconst =
+{
+    DT_MATCH_COMPATIBLE("riscv,aplic"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(aplic, "APLIC", DEVICE_INTERRUPT_CONTROLLER)
+        .dt_match = aplic_dt_match,
+        .init = aplic_preinit,
+DT_DEVICE_END
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
new file mode 100644
index 0000000000..ff9bb33896
--- /dev/null
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * (c) 2023-2024 Microchip Technology Inc.
+ * (c) 2024 Vates
+ */
+
+#ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
+#define ASM__RISCV__INTERRUPT_CONTOLLER_H
+
+enum intc_version {
+    INTC_APLIC,
+};
+
+struct intc_info {
+    enum intc_version hw_version;
+    const struct dt_device_node *node;
+};
+
+#endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
-- 
2.48.1


