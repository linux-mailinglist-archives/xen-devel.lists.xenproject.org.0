Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A276477DEAE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584404.915126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnY-00011i-KX; Wed, 16 Aug 2023 10:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584404.915126; Wed, 16 Aug 2023 10:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnY-0000yU-GF; Wed, 16 Aug 2023 10:30:44 +0000
Received: by outflank-mailman (input) for mailman id 584404;
 Wed, 16 Aug 2023 10:30:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDe2-0003RA-1X
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:54 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90685f6a-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:46 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3197b461bb5so2203266f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:46 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:45 -0700 (PDT)
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
X-Inumbo-ID: 90685f6a-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181246; x=1692786046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qL6e9Nue5+8bVmdl1ZbVKhvNGAVoK2lYXurUjhw7ZU=;
        b=jNbbN56BkQ0NVqxjcTqRa84O5/3JpNr27CLL/fbQEtWfyACoIJ13t+zAOxp2nXKxSJ
         yAa4WceoqEhQSa6PlXNteyxDq7VJfDRsm0gB9ENJDKeyUi1LxxAOGOd8oe1gkl/UeRNo
         RZ1nbhOTZ3Kc3tE2FqlILMy7BBl3fywn65d3zl+jnO77lAP2o67jd8dfrIiKUBQB7l+R
         5J+KpElW3X6HzHH2Ij5HbcsxRkN8KBiKtWEVDPV1bfCiiv9Qh4Ig2NMlJLY+zv5EMahB
         aWrkmQCHkC62K03FUgRUYqDb65u88JG6DLKd6n+anryw7o3ZcaBziyVCr921/WkY+iJa
         Cxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181246; x=1692786046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qL6e9Nue5+8bVmdl1ZbVKhvNGAVoK2lYXurUjhw7ZU=;
        b=AiI+3cebv+bu2sjFtfSDzioknKp9W027iAQ8jxw0XDG5aOsZKXMKBfof1m1CU6XcxW
         7QCh0snLdrNpWl9hsC2pC/C2WygHZVjuQknvWQpM5r1lnDpkVIEoTiUrIZoh2VnB14qA
         Ew880jkju4RXwD2AnpK0bfgRT2WTMnQm5SDXXbnm1sEQ5nQLlCGh7qif9fGz3fkEgKHI
         XUihoLeSa1t59A7jxB33p0WtgGc/qw2EezUnWuHEzUz269xsL3H74wccmI8tSWB0fPZ+
         8QfFSUgvi1+bQ1pAUQ3lJiauQfZdr1jmJiG0K8npSjlojlt7NR0RbgZ1JDnPq2tGmchx
         ZfmA==
X-Gm-Message-State: AOJu0Yxl+qOGGy5oO22M7rK5QEAxiUj7WLBi3Z+dN4cWLEMcgNmO1fF9
	3ppAr7z1wsF6xpe0nUE/AaX7iDTWrHf47XXv
X-Google-Smtp-Source: AGHT+IGZv7zb/zrUa443F/Pb4N0UO9HzLN4zMEpxmMRaKSQTekS/rp5UM/1dn9Li/u/3bqqiGieOWg==
X-Received: by 2002:a5d:6348:0:b0:319:f9d6:a769 with SMTP id b8-20020a5d6348000000b00319f9d6a769mr1078231wrw.45.1692181245890;
        Wed, 16 Aug 2023 03:20:45 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 38/57] xen/riscv: introduce asm/monitor.h
Date: Wed, 16 Aug 2023 13:19:50 +0300
Message-ID: <6a67fcfdbe56515b74b37b469322e265eef50535.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/monitor.h | 53 ++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/monitor.h

diff --git a/xen/arch/riscv/include/asm/monitor.h b/xen/arch/riscv/include/asm/monitor.h
new file mode 100644
index 0000000000..fb7ef6639d
--- /dev/null
+++ b/xen/arch/riscv/include/asm/monitor.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * include/asm-RISCV/monitor.h
+ *
+ * Arch-specific monitor_op domctl handler.
+ *
+ * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
+ * Copyright (c) 2016, Bitdefender S.R.L.
+ *
+ */
+
+#ifndef __ASM_RISCV_MONITOR_H__
+#define __ASM_RISCV_MONITOR_H__
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
+    /* No arch-specific monitor ops on RISCV. */
+    return -EOPNOTSUPP;
+}
+
+int arch_monitor_domctl_event(struct domain *d,
+                              struct xen_domctl_monitor_op *mop);
+
+static inline
+int arch_monitor_init_domain(struct domain *d)
+{
+    /* No arch-specific domain initialization on RISCV. */
+    return 0;
+}
+
+static inline
+void arch_monitor_cleanup_domain(struct domain *d)
+{
+    /* No arch-specific domain cleanup on RISCV. */
+}
+
+static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
+{
+    uint32_t capabilities = 0;
+
+    return capabilities;
+}
+
+#endif /* __ASM_RISCV_MONITOR_H__ */
-- 
2.41.0


