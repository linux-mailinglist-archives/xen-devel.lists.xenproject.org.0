Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144B2849E49
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676213.1052326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0y5-00043c-JI; Mon, 05 Feb 2024 15:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676213.1052326; Mon, 05 Feb 2024 15:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0y3-0003kK-SV; Mon, 05 Feb 2024 15:33:07 +0000
Received: by outflank-mailman (input) for mailman id 676213;
 Mon, 05 Feb 2024 15:33:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xz-0007Hv-3M
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:33:03 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d94cedc5-c43b-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 16:33:02 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5114fa38434so1247558e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:33:02 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:33:01 -0800 (PST)
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
X-Inumbo-ID: d94cedc5-c43b-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147182; x=1707751982; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gARUjv581cUW1g1ZCe6+dI3h9g3+PYO7UcATFZv3k0=;
        b=g22vWrY8+fK2ayS8ZcnJ+I8FXx9GbFTAsuqgW7pHhNR3jjusQZSTwuuLhGbLvhqVVk
         BecYFd4JPXe634r33P02NvFLEA3q/3acujM5FHzEat+NIde1I7L2316k5AjSh121mOFG
         N5UJUSqppO1uRoZLalb9JsidOMvE6QYNuKMpph9vvAGPZxwfKB+C6MDpNYUAruDdIMoV
         LVY9TSESl8xZ6eS7Y4QqfjTz/Id3eptsXm722C+k4Usmop8eZsef1mGbzeQAhBfY8Bqe
         Fb47rl4Rr7abKexipprAGGC73FLK/2Tc8JdworLOtsJ4G7RqxDm7Oe9CEnsz0sggxo16
         +dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147182; x=1707751982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gARUjv581cUW1g1ZCe6+dI3h9g3+PYO7UcATFZv3k0=;
        b=Rg/hTMx9olmzxDx7/d03+muXi2+Av/9deLg1QgWpuIm5R2qe5mL7CRWsjDqiMqZrug
         eHSrYj5ITcv682oui52/3bw5zbL3JgArIkTveY8j+UHBeWfT1HaqVsHjGO/dpnph/37G
         yTFW9VReOcJNvJbkU5xxoV0ZWD/nNq/88WR57ors+7eWzddRUSaoGTJd4NaFZ0wFPwEP
         YRx8TumyLLftUZQTJ+8fI6lEO+xb9uUjCpJw9Bh5GMdAhb+wyRGUOr08AXlawplauKoS
         /ebdHiMqEqMFENzKjpbtgrqrv5zOICqlO6DikTl7Zbvm2SC2z2LhGKe05FLvzNdkHVRp
         3r6w==
X-Gm-Message-State: AOJu0YwG1mQHfNQBck9fWspna26LdmlKofruibGejCS2gUOTnBJPgpf3
	/yzNqCUyHdWO57JmpaVlFwbZsOT2YWTITVkQrT67kzRaRnAsIT5BIr7RQis2
X-Google-Smtp-Source: AGHT+IFKTLFETIdqzqjZRLukSGR3tjSLZkxLYn00YvDSQ8zxBRdVKq45GMT3uiVnqoV8z0pF1UOhFA==
X-Received: by 2002:a05:6512:2c0a:b0:511:4758:c99e with SMTP id dx10-20020a0565122c0a00b005114758c99emr4788620lfb.25.1707147181786;
        Mon, 05 Feb 2024 07:33:01 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXbhFD80mHCSO8eudoZxHaF6IND71BLdMe16lXGKwf8DfEF7jmIIt2zP8H0uJwmhBjRP44zwK/ByhIxkMwptkJuvGzkZW5vYiesQZYQKBL0QYa6idXKfQDYeet7YMLIE1WFYtTJ4MhPNQwmOMe4PFEFNOwS1jtXaB8SOW1Df363y/CuJtQntPczNwXwf/nLbLSP3+k77xHP3FZ9YORNTm/9oUbzTre6SwvEaTG0diBZvukPAWSAWdBMTH2e+JJZ6XeyEw==
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v4 20/30] xen/riscv: introduce monitor.h
Date: Mon,  5 Feb 2024 16:32:27 +0100
Message-ID: <846a0c47e1808b01d5650a72d3366c3c0f2764c1.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Taking into account conversion in [PATCH v6 0/9] Introduce generic headers
 (https://lore.kernel.org/xen-devel/cover.1703072575.git.oleksii.kurochko@gmail.com/)
 this patch can be changed
---
Changes in V4:
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


