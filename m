Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0AD8C8791
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:55:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724184.1129416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3K-0003K1-Gb; Fri, 17 May 2024 13:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724184.1129416; Fri, 17 May 2024 13:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3K-0003HD-A9; Fri, 17 May 2024 13:55:18 +0000
Received: by outflank-mailman (input) for mailman id 724184;
 Fri, 17 May 2024 13:55:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Ubw=MU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7y3H-0001sq-PW
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:55:15 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15c412a7-1455-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 15:55:14 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a59b097b202so368001466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 06:55:14 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c81b4sm1117456466b.113.2024.05.17.06.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 06:55:13 -0700 (PDT)
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
X-Inumbo-ID: 15c412a7-1455-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715954113; x=1716558913; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaYdqVd0N5jds1aXT3FGFFYweAq5RLcPelehJE7+BNc=;
        b=PjT6iFQ0b9MePFbncqWjscHjBuDgXAWOgW9F0QzRzI8eQkhyti+29Io7o9wS+xvjfk
         Ns690r0Su2dvxNlJjqxxNt5bK8iS3B4oDyTpFk9+bJ5iGyMW8IOtaf9KsT09wulhza47
         77ez+alQGdmHP4NmKz0yb/LbdlaMIVEUItn8eT07pUmbA8LMUtGmURxcU8NrJbUsl6sV
         K0Q0DrFG5UJHeavj/ZuRaDSzkaAX7bDqJcSyN0mtRFQFngmf+k35qP3XvS7ChY3eJYHy
         G6PUYqreyQMr5fqpI7kedqsLGAIXE8LPeTE5Fyzvi3ld8SzFwSNgxzB2oggP5115re/0
         HfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715954113; x=1716558913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaYdqVd0N5jds1aXT3FGFFYweAq5RLcPelehJE7+BNc=;
        b=HxzpZXwSMGWyUEKV3AFUf7IkQHQ+bHUrcKWbnsphPpxwclp/cXxHNVsvLDstMMNGL6
         ozqv5+g1BJH8AoWYOwYGTazC3ODfNfx6sqKF05iMOFAZjDC9+Y1N7UPQm9y1a3EpVaBg
         jD6vbyh/VlSbVr2LN3ikzURR9a+zFSMzFeffJiSV1ga6aw3SHbKLv1YKmWcJMCsKCiYw
         BLF/IfMi02mHbPpAngw2Ifb7Fv0C4a6zFHVz3nscLGKHGLbIzjmB/Tp7dsLkcWGGH6Hv
         2dYNtxKtKF5jcdrH1zk5EkmjNtOK952z7obSsMAm6yezjcYXOpkoKANw6FXk9D4SY4xx
         vOMg==
X-Gm-Message-State: AOJu0Yz3lfbmuVI/j0FR9Gp3VjXwN1OeXfq+hF6povOmeCHHuq9blg1Y
	538xl/FVOzQPrmHaI/eFiW4vilNRN4c43+TgZ1u9jzoPsBtFynpSlJn17nqr
X-Google-Smtp-Source: AGHT+IGy29899FZzaOg6+XBBOUVhaI5Uf1BV0Etf4zSaNRlkTevfqHswC0eilVvkraM/HFGmuZ4Euw==
X-Received: by 2002:a17:907:7b8a:b0:a59:9b8e:aa61 with SMTP id a640c23a62f3a-a5a2d5c9303mr1980189966b.35.1715954113608;
        Fri, 17 May 2024 06:55:13 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v10 07/14] xen/riscv: introduce monitor.h
Date: Fri, 17 May 2024 15:54:56 +0200
Message-ID: <bb75ebc8bd75318759b450d398294eee8ed3ca55.1715952103.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715952103.git.oleksii.kurochko@gmail.com>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4-V10:
 - Nothing changed. Only rebase.
---
Changes in V3:
 - new patch.
---
 xen/arch/riscv/include/asm/monitor.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/monitor.h

diff --git a/xen/arch/riscv/include/asm/monitor.h b/xen/arch/riscv/include/asm/monitor.h
new file mode 100644
index 0000000000..f4fe2c0690
--- /dev/null
+++ b/xen/arch/riscv/include/asm/monitor.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_MONITOR_H__
+#define __ASM_RISCV_MONITOR_H__
+
+#include <xen/bug.h>
+
+#include <asm-generic/monitor.h>
+
+struct domain;
+
+static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
+{
+    BUG_ON("unimplemented");
+    return 0;
+}
+
+#endif /* __ASM_RISCV_MONITOR_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.45.0


