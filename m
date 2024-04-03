Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C468896C06
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:20:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700402.1093546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjM-0001hc-TX; Wed, 03 Apr 2024 10:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700402.1093546; Wed, 03 Apr 2024 10:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjM-0001c6-Lg; Wed, 03 Apr 2024 10:20:32 +0000
Received: by outflank-mailman (input) for mailman id 700402;
 Wed, 03 Apr 2024 10:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrxjK-0007Ql-Qe
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:20:30 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc394784-f1a3-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 12:20:30 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-513d3746950so7685101e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:20:30 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k33-20020a0565123da100b00516a18f9080sm1161237lfv.257.2024.04.03.03.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:20:28 -0700 (PDT)
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
X-Inumbo-ID: cc394784-f1a3-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712139629; x=1712744429; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmYB0DAUci3LPNlemnoUPoXVgG+/ldfQH/ieZKbZO8s=;
        b=Y0mJ3b4qsqkfmy1Qqoo2uvSlbVwEM+/gPdIV1Uyk9Jx4yxzEzztiZxeHq/BItTbby+
         FyvW4uJG6yd7Gw6/F9PMvwvG66nMFhrF5Gfzf8BIJ1iNDaF/ZEp9lt7Vg3xtGQNryqh5
         BsoYAS1qvqIlawcHPDBWKmFkgnVCNWy7JZJ6sAW18fKxCZ05/T6UMaRRE4HFtaqNX1hb
         dPOmybayuY6Q5/RTjHTPN7bzH+yimoCcV4Hmob4uI9SOwvUKPgT+njleu693siUKqnJb
         1YThq8wX5wfg/Tuh0QPMIcIiDtssxaJEBoyoOqkjobyl3wZ2xtzBG7/N7ZNsGvQ30nob
         x+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139629; x=1712744429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmYB0DAUci3LPNlemnoUPoXVgG+/ldfQH/ieZKbZO8s=;
        b=L1R3Zt+dc4PuQvmstKj/aLEzs+BlE6neCb25LsqLjkdBScf3Jrv6QOtegxnmknHt64
         9FtT3gTNqJtFYd8z9adPUNWDbGRXkhWVqyTxc/78A/55W0sag04ns+N6Sg98SRM7L1bh
         hcu5l6GGXgorpxvd1fDvqjrFJiJh0pXrnTtEOXDCfqetHXBmxe7eJ4dgxMNWPAm/n5HU
         yDbc8ChtSsJ08PigSKc4tr+DNG7YxrrS6T7KpZ3I5qxim13Ju1xYtGPD+mdcS8F2u+Ts
         VN4TQyxRxGJu3PceRXQ7pKmU/fNWVueJsOJYW99woSmQ8NOeH7HsautrX0pjqQiJrEhh
         /I5Q==
X-Gm-Message-State: AOJu0YxExApniK44BGVoJVfK9si0UHLZFWv9BTMkYNnt8qnetPKGs5BI
	QfUwtT5GkrKslMu35GOV6hSogOwcMNP4sM9u5OxeXe2NdWuYQnsn6yM/JHov
X-Google-Smtp-Source: AGHT+IGRuDpNNNUxCjV9t0vsUjouqbQHHG5MdprMpi2zeK7fm+ekTpdZexWqrbIGiM7eRnnMB7jHQA==
X-Received: by 2002:ac2:558a:0:b0:513:9b96:a948 with SMTP id v10-20020ac2558a000000b005139b96a948mr9324598lfg.6.1712139629285;
        Wed, 03 Apr 2024 03:20:29 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 11/19] xen/riscv: introduce monitor.h
Date: Wed,  3 Apr 2024 12:20:04 +0200
Message-ID: <3b133ae88d44079570c936c9c7fffba8349b1710.1712137031.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712137031.git.oleksii.kurochko@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4-V7:
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


