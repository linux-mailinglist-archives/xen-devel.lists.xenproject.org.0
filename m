Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34451A74EB5
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 17:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930972.1333480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyD2X-0001HT-Kl; Fri, 28 Mar 2025 16:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930972.1333480; Fri, 28 Mar 2025 16:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyD2X-00019h-Gf; Fri, 28 Mar 2025 16:58:41 +0000
Received: by outflank-mailman (input) for mailman id 930972;
 Fri, 28 Mar 2025 16:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QVst=WP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tyD2W-00011d-Ch
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 16:58:40 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5b09478-0bf5-11f0-9ea4-5ba50f476ded;
 Fri, 28 Mar 2025 17:58:39 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5edc07c777eso1645393a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 09:58:39 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc16aae90sm1665004a12.15.2025.03.28.09.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 09:58:38 -0700 (PDT)
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
X-Inumbo-ID: e5b09478-0bf5-11f0-9ea4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743181119; x=1743785919; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwt0wWw15cU3iDvsfvt/iGuQoX23/9gbWMOVikjxBvU=;
        b=WrQjouQYwcYbrHpECBGu3drBnC2dObjnDyXqSctIefQd0f+84DcM3SR5ajGzCwmshT
         Umo23V+eU7Blilax6FCjTteKR+4x12FofijKePJYBQS9e04TTP1kZ1KEjlWFzyrFeixa
         j/+Z1uLnzwMVqqRd2GzkegKE5wbsmDvk2pJMerp+vsUvrdUI4hgaILsErPHSVdRSipjG
         dFLC9k/lIO2d7BmHunyY9PQK1x/rw8E9uz6hKSrBkHsYiNFEE1kDTgTUKRmwrVrDH+7Z
         up/owMq4NWaI8PTqwuQFt697KtqU1esCmmtbdTy30SPRNbDHfj+rK2RnLq/bfmUk63Jj
         UoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743181119; x=1743785919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwt0wWw15cU3iDvsfvt/iGuQoX23/9gbWMOVikjxBvU=;
        b=szYIeGVQgBroUiqz7jzx6gjAptHNUKlVN1ZyZT1SQvWVquBLP2y1MA9q9aaKBnqXUy
         M+Kot9t8alOZan2kZBuTMFx1yl1Fivav+oy/k0N1WhOpI0u7pJYItdDLxTVmiIHfvLDv
         +3g8amEQi3mISfadtJCdhBVw8itcHXNXMjTrllLvqx9w4+uNmff9EX7bmb4ndbxhD2ZO
         hkPGSp848B5h3isVCxWr6PzFoLfRFJQHpdasFxzIEx6Yj0s5lQt2e/+To3bnHIqTTSHX
         xedbLSi01h8RwuRhdrqumHWqp6vJR/Y7pCKmOMblCTizgaFLQrzFodRGPSDS1UMOXXlt
         uiLA==
X-Gm-Message-State: AOJu0YyANlHRDA8mGnjJdlTSYepIboHV0g/fMfCuxcFavNfoe5k9k7dz
	5dCu5wvyAffuOssK6aKHCtgYdHTNLkqozHXhMIGcFHPt+ngFijiY50JGog==
X-Gm-Gg: ASbGnctW6oILTKseDun53eJJYwBU9Jsc42g0WvAEZcVwofRQ/jQ9BVWFeoL0UFHRW6G
	MA99mBeL/kdQ16JlL6Si8jTPqt11yBd1+zA0hQ6pV1fD2IF+tcrgTAvD1TG5BUVJJdcpB2RbC1P
	d6rCo9Pl6z643ZB2MlWWcEufMWgmH/9DEv+K5Xd5pZkWxcIuQjKOgtz2p3wCPXKQ5m5g/fZT21k
	i0o8iuGN857y8ol2IlyRh18UFv4LwtVQZ7SluFA/sIvNNXiL0xDGjnZrYxVucUCut9rphcsnhku
	99N6D7GrwehiyuSFZAkbnnujdw5Urftl2UIf+TODY7VyG6P919aYtAOjfyN5/oHKTI9StVpjsHx
	sB9m+IBAN/2Gv3A==
X-Google-Smtp-Source: AGHT+IGLQDEXl8otPA1C+1ihHKigubZQOmvfh1UvRwGLeIibdT5hUK5Sm2E9o2r5SBQf9AcdeS8EtQ==
X-Received: by 2002:a05:6402:13d6:b0:5e0:8c55:504 with SMTP id 4fb4d7f45d1cf-5ed8df6b4cbmr6081002a12.7.1743181118590;
        Fri, 28 Mar 2025 09:58:38 -0700 (PDT)
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
Subject: [PATCH v3 3/4] xen/riscv: implement basic aplic_preinit()
Date: Fri, 28 Mar 2025 17:58:31 +0100
Message-ID: <e8f6bfafd2997dae0d07e3f89d4a49b7231828a9.1743165791.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <4ddde60347edf6740fbc69b5739d099616f5b5ff.1743165791.git.oleksii.kurochko@gmail.com>
References: <4ddde60347edf6740fbc69b5739d099616f5b5ff.1743165791.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce preinitialization stuff for the RISC-V Advanced Platform-Level
Interrupt Controller (APLIC) in Xen:
 - Implementing the APLIC pre-initialization function (`aplic_preinit()`),
   ensuring that only one APLIC instance is supported in S mode.
 - Initialize APLIC's correspoinding DT node.
 - Declaring the DT device match table for APLIC.
 - Setting `aplic_info.hw_version` during its declaration.
 - Declaring an APLIC device.

Since Microchip originally developed aplic.c [1], an internal discussion
with them led to the decision to use the MIT license instead of the default
GPL-2.0-only.

[1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/7cfb4bd4748ca268142497ac5c327d2766fb342d

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - Add _ro_after_init for aplic_info variable.
 - Add inclusion of xen/sections.h.
 - Change S-off-by to Co-developed-by after the discusstion wirh
   Romain C.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - drop initialization of .node member to NULL of aplic_info.
 - s/initcont/initconstrel for aplic_dt_match and put initconstrel between
   type and identifier.
 - Update identation for DT_DEVICE_START(aplic, ...).
 - Update the commit message.
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
index 0000000000..caba8f8993
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
+ * Copyright (c) 2024-2025 Vates
+ */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sections.h>
+#include <xen/types.h>
+
+#include <asm/device.h>
+#include <asm/intc.h>
+
+static struct intc_info __ro_after_init aplic_info = {
+    .hw_version = INTC_APLIC,
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
+static const struct dt_device_match __initconstrel aplic_dt_match[] =
+{
+    DT_MATCH_COMPATIBLE("riscv,aplic"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(aplic, "APLIC", DEVICE_INTERRUPT_CONTROLLER)
+    .dt_match = aplic_dt_match,
+    .init = aplic_preinit,
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
2.49.0


