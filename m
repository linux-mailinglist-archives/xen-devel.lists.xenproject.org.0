Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDCD867F4D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:51:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685749.1067033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ref8B-00060E-J4; Mon, 26 Feb 2024 17:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685749.1067033; Mon, 26 Feb 2024 17:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ref8B-0005wj-Fk; Mon, 26 Feb 2024 17:51:11 +0000
Received: by outflank-mailman (input) for mailman id 685749;
 Mon, 26 Feb 2024 17:51:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reews-0007o5-CD
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:30 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fddff295-d4cd-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 18:39:28 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d27184197cso40171481fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:28 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:27 -0800 (PST)
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
X-Inumbo-ID: fddff295-d4cd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969168; x=1709573968; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMMEpTcUg6wPnIKq2yrDzwzPHhvyzoLsQ8c7Qj98SWo=;
        b=c0FT6eTaXjzQ78GLtCEwOl7zWAE/f/k3yYVIb7up8c6TWFjicVHGoTHeNDc+6hbSBK
         yGceaXy9jphdSSYozIGz6xgp76J924Ll2AuR44skAHZOf3ESE5mH1Y9wOIV0xScoHX8/
         m+yMIGPmBLQBRJF2aig9+wMTGoWGn6Zz0qf56Si5Oj+EU1k9r20tbjtKIYYHN5hdssFA
         sDsl/B97wYxh8O45x5wnfGuf373xSBU54aTMJ1LzTJLW6pqNcaOLuJYNsnUw4SDF3oi/
         YISWmJzWTi7XKYj2VkDY71Dq6Wxlc6DAuVjmI8DxEMzfB99SSr1yc+rsqI+bl2e5IMe7
         KsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969168; x=1709573968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMMEpTcUg6wPnIKq2yrDzwzPHhvyzoLsQ8c7Qj98SWo=;
        b=tyAQA6G4xtdnOaWXO6GBUU40rPQYKIlveonpaHgWZzQgdfo7zRcP01hCMA4VCwtcPh
         7W5tCJ1k8/sCCyU1XA8yO1ADqgkY9FPd6WY477InItUBBs0foh8GchY+s+dwwzkpoE+E
         KtlpLZMxPXfTa5Go3rFIBkOPsWRYZfc2phtBCIU4kCubsjNJC8kI5Awn8o0RR2Gy1MIV
         RvK1ZQ73XVcsIwEzj4LUXrYjOSCk9h/wobbfzcte6TVu3xy+A2QuCBOeUn6k3yLgmRBX
         KtJXGZg3xGaLV2xTdQ28p8KJw5Z5TxMSQuz0FIs5hwPps7iYHFAVuUrOeSY7KJllaEKZ
         1YRg==
X-Gm-Message-State: AOJu0YxOPvXOxvJKMqvSQjOU9WSKjKCj4z4dZllaBjJTFgwSVnhLxn8l
	sztZjkcjQSl8kPsezqo9aE3TnaGN8WqKA3nSgmlByNIRB1j4ql1IDoLqUVLN
X-Google-Smtp-Source: AGHT+IExOW9mAsdMV/2cYLS5seStBsmA8LC26c77mh0Eaj4vnYKuGRK2m6T9kx3k/B8KDLf7AvR1sg==
X-Received: by 2002:a05:651c:1994:b0:2d2:7cb9:8d21 with SMTP id bx20-20020a05651c199400b002d27cb98d21mr4945367ljb.16.1708969168133;
        Mon, 26 Feb 2024 09:39:28 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 14/23] xen/riscv: introduce monitor.h
Date: Mon, 26 Feb 2024 18:38:56 +0100
Message-ID: <bf4b47a16997628e5a45290dd38a8e1f70fd8fc8.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Waiting for dependency to be merged: [PATCH v6 0/9] Introduce generic headers
 (https://lore.kernel.org/xen-devel/84568b0c24a5ec96244f3f34537e9a148367facf.1707499278.git.oleksii.kurochko@gmail.com/)
---
Changes in V4/V5:
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
2.43.0


