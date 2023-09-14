Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 368117A08F9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:22:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602493.939165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoAn-0008OK-D5; Thu, 14 Sep 2023 15:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602493.939165; Thu, 14 Sep 2023 15:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoAn-0008MS-9G; Thu, 14 Sep 2023 15:22:29 +0000
Received: by outflank-mailman (input) for mailman id 602493;
 Thu, 14 Sep 2023 15:22:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmf-0002WX-6I
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:33 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06f4e01f-530f-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:30 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2bb9a063f26so17209521fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:30 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:29 -0700 (PDT)
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
X-Inumbo-ID: 06f4e01f-530f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703449; x=1695308249; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aI25daj2NtPhBXJcnFkuOhkb6xig5qy+VaAN6xNV3YY=;
        b=sLoueh5xm6NI2/JswBlXd2H8rSxg9mTHexilQxNd8qlPZrR6poE8xdP7iVs3J9JD+G
         U6ehwlvmhOPWeooeEla/kZwSQsnWNb8ir7ZwWwit9pK7E0llc6Wf7Xt18P3ctaVfaxvx
         s0wXbNhyPsuDauIEqUFDsavwVYLxOq/wiql4JgOP7jH+viZHmzW9Aa6BaAWGquehHdF6
         xnB5/HnstM3hzNQHERJS4B2D9pbmrGFxgiAYGdA5z2H8iQga+TKPIi6xiYND6ZVvlzkF
         nuv4xPBih2z7Q5rT4UmFEKJesezwv65nKbZZbE0RdIMLgp5MPKs66+jgDLnlyD7eqVbx
         jxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703449; x=1695308249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aI25daj2NtPhBXJcnFkuOhkb6xig5qy+VaAN6xNV3YY=;
        b=DZSfk75Mx2lY7ReMqgHZbaDxj2e+OzRnMzWfMiuDhifPgk0pNN7WF8AQxbwyx/1cQQ
         G1ZZP2WzbOZ8Vko3nFLUGs47zUTnx5iPwy9zI1k0HwILgivpZGdzYYr6ODgy8/FidNSS
         ZS/dZGjwxSAm78k4OcfNfnsZIxeNRzAOi8rLiecFjYvXfNlQ8bemsmw05NF+Ub2Gc13d
         W9/zn2pgHTVKO5mvajiSUuXL3I64eq1W25yNgQvYETv3T52v9+DAVMdqt9WOOXypI3Uv
         PAc9morluTnOywrBTEhHhuV1px+YsZyE72EJ7k9NDrW8by0y2zTAJeqYmtwOffo8s0EI
         kr/w==
X-Gm-Message-State: AOJu0Yx1Knq9KMj0TUi6qsNHRqZzsXDoQ25IWIXqmQR5YwmScOL7QW0c
	XkEMU5JHPSSCpbkcQo9SB/9/rHcwrjA=
X-Google-Smtp-Source: AGHT+IGnKszfioWrlfMrI9gyb0uSnnGj8/VweY7O6m6x/47xY0ZnbZJaTiNbDfFi+s88Q4iTIIytIw==
X-Received: by 2002:a2e:9b0a:0:b0:2bc:c326:54a2 with SMTP id u10-20020a2e9b0a000000b002bcc32654a2mr4624540lji.50.1694703449525;
        Thu, 14 Sep 2023 07:57:29 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v1 26/29] xen/asm-generic: introduce stub header monitor.h
Date: Thu, 14 Sep 2023 17:56:47 +0300
Message-ID: <a2663ba600f468bc4d6544bb64354a77c86a40b3.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/monitor.h | 64 +++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 xen/include/asm-generic/monitor.h

diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-generic/monitor.h
new file mode 100644
index 0000000000..c61fe738a8
--- /dev/null
+++ b/xen/include/asm-generic/monitor.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * include/asm-GENERIC/monitor.h
+ *
+ * Arch-specific monitor_op domctl handler.
+ *
+ * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
+ * Copyright (c) 2016, Bitdefender S.R.L.
+ *
+ */
+
+#ifndef __ASM_GENERIC_MONITOR_H__
+#define __ASM_GENERIC_MONITOR_H__
+
+#include <xen/sched.h>
+#include <public/domctl.h>
+
+static inline
+void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
+{
+}
+
+static inline
+int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
+{
+    /* No arch-specific monitor ops on GENERIC. */
+    return -EOPNOTSUPP;
+}
+
+int arch_monitor_domctl_event(struct domain *d,
+                              struct xen_domctl_monitor_op *mop);
+
+static inline
+int arch_monitor_init_domain(struct domain *d)
+{
+    /* No arch-specific domain initialization on GENERIC. */
+    return 0;
+}
+
+static inline
+void arch_monitor_cleanup_domain(struct domain *d)
+{
+    /* No arch-specific domain cleanup on GENERIC. */
+}
+
+static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
+{
+    uint32_t capabilities = 0;
+
+    return capabilities;
+}
+
+#endif /* __ASM_GENERIC_MONITOR_H__ */
+
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: BSD
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


