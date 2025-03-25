Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC92BA7084E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 18:37:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926818.1329679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8D8-0001AN-9M; Tue, 25 Mar 2025 17:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926818.1329679; Tue, 25 Mar 2025 17:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8D8-00016Z-5h; Tue, 25 Mar 2025 17:37:10 +0000
Received: by outflank-mailman (input) for mailman id 926818;
 Tue, 25 Mar 2025 17:37:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ogJ6=WM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tx8D6-0000Qy-4n
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 17:37:08 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c543f8cf-099f-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 18:37:06 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac345bd8e13so1042391766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 10:37:06 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efb65871sm897012066b.96.2025.03.25.10.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 10:37:04 -0700 (PDT)
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
X-Inumbo-ID: c543f8cf-099f-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742924225; x=1743529025; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krQovhxk411eqTxcXA3IPuwT9zjyGSDPwZ17OUSlKYo=;
        b=TVOpIaJeQgbbWL6MxNh1norLaVU3+ThQ9ZTsOXCstfGqOC0e6y9tJ6jZCB+adro5HU
         nHLj71OHXPLcGxUYiLh+UuW2Wtg+eekE2LQd19a/6dh4vEkg+fOYRE4Mz+ibmpAKKGCB
         fuhXAbOkwSQzRbWqjSC2HGfGuCq+Fgb3UlPnXvquk7z8y2piiEvRGT0BlsbJMuBlfsQP
         kbE78T8hT3gRjXyiOPFuIeov6TBjmpxtdkDUTISZ0UV/IhRIk4B9LkVDY3LjQcFDr30d
         XQ1up2576vrMTgxk4M4y/Iv83fJAVOmPpFJCHk3/1PlrAXiA9BOp3p8AaR0qDZS/vl/p
         oUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742924225; x=1743529025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krQovhxk411eqTxcXA3IPuwT9zjyGSDPwZ17OUSlKYo=;
        b=ofXG1ADJLjUg/bLvMHiSZNKg8gZvpCKAUliCf5IeykYB7fgG9ssJmH/m08sSfqHVrz
         qoABji8XPk1bTGLV7gZ5fWkk7AbleCjy3Ps5RwHSOPFGbNTRiQExGs4yBKiDuP5++9p2
         +yNQM/c5CgIMF84VTxs1XPHpRv8p9vndk9krGKFrFjM9jvbmXeHUxC22MaFykJjvPcr7
         DRldESR9fP51XYnANzUjJSNFVN4o8zd1dBI+0MLbrmhoGvMru0jjZbgJw6VjLMPN2jKf
         l/q8EMkTkbFYuFaCAjOt0eYvJppxyZiY7B0JPbNrNvkDGeYv7RTBtWP21RWoAqWJK1if
         MR1Q==
X-Gm-Message-State: AOJu0YwJfcJ6lTK64JrrHIHwrCDKOqMmOyDxb/8R8Qb5Hee1XMCUp2Qs
	zrnOYSm/hMJysFvF8GsINPFcRN6WyCxhD4bK7dp4k+G0fOr9u2CV+OKjZQ==
X-Gm-Gg: ASbGncsJ6WcplYXs+7sowgW6iVp85KrJUlJ+TXk09A99f3hO3fJytfLMEzy1nCbYicc
	dLdFz9oLPjg9CrzqruuEDBbDc0pFjW/WPX9F8K7j6LKyjxc7SkBxAuP8S0QsKI7ZyqMp+EV4ETP
	CM/d+wj1eWbxMELpWQx3W7C3Sznr3CDzX0s2Xr5s/Bazgs9YTB97o1qOPLT6IWRpoXKki7n8frK
	MIbUqiUa8ZkbDiKeTBsYU953JQlXqLpE0YdcUMVMZkqEWDbQ5asQq5znShbAuZQvRyDJ4desyKx
	uUVY6Xgu2j5qXB5GkzgOF8Ky+nWnOBCoX8ROj8EpDBySeji39cMZx0VSBwX+2htBjaa55QhX4+z
	IX6CeYxqeZXZj5Q==
X-Google-Smtp-Source: AGHT+IFvY8ECpKVlMbxJC1uQh7F4bkUnqiFXj1VbwutSi04A4e2o9fxEnR68dPJMhyESxK8tLIWJtw==
X-Received: by 2002:a17:907:e84c:b0:ac4:751:5f16 with SMTP id a640c23a62f3a-ac407515fefmr1489853266b.30.1742924225373;
        Tue, 25 Mar 2025 10:37:05 -0700 (PDT)
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
Subject: [PATCH v2 3/4] xen/riscv: implement basic aplic_preinit()
Date: Tue, 25 Mar 2025 18:36:59 +0100
Message-ID: <f0945e3a41e911b5dfd005a8d15aa0d668d8e3cf.1742918184.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
References: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
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

Signed-off-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - drop initialization of .node member to NULL of aplic_info.
 - s/initcont/initconstrel for aplic_dt_match and put initconstrel between
   type and identifier.
 - Update identation for DT_DEVICE_START(aplic, ...).
 - Update the commit message.
---
 xen/arch/riscv/Makefile           |  1 +
 xen/arch/riscv/aplic.c            | 49 +++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/intc.h | 20 +++++++++++++
 3 files changed, 70 insertions(+)
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
index 0000000000..856b3bf84f
--- /dev/null
+++ b/xen/arch/riscv/aplic.c
@@ -0,0 +1,49 @@
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
+#include <xen/types.h>
+
+#include <asm/device.h>
+#include <asm/intc.h>
+
+static struct intc_info aplic_info = {
+    .hw_version = INTC_APLIC
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
2.48.1


