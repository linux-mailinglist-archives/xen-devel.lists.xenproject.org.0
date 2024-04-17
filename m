Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628E28A804B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 12:05:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707308.1105145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AI-0000yN-KF; Wed, 17 Apr 2024 10:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707308.1105145; Wed, 17 Apr 2024 10:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AI-0000sV-AC; Wed, 17 Apr 2024 10:05:18 +0000
Received: by outflank-mailman (input) for mailman id 707308;
 Wed, 17 Apr 2024 10:05:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6A/l=LW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rx2AG-0007lI-9l
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 10:05:16 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fceca417-fca1-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 12:05:15 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-518a56cdc03so4782967e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 03:05:15 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056512328200b00516cd83e497sm1893187lfe.210.2024.04.17.03.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 03:05:14 -0700 (PDT)
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
X-Inumbo-ID: fceca417-fca1-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713348315; x=1713953115; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTTnPcExIPXVMOJsvNhSJgOJAGir4DNBERxSySY7BqI=;
        b=bUZWAwVmBcyYACfKttn0UtiLsdweXrzg87Qc1uJzdMCcXT5Bg8MlbPaIT45pUkihvE
         r9ScKyrOMUov7DWU7/kDnEWtuchSS4zQQURi7pXZ4iQxxAGfOn31U34LKJrOh7nD4Csj
         4wBvViGMugJEXrffxEYc/NEfQ96kVYzc9eSG/9YplEzPUR7V5oiKxbYdnWTYI26ABt7/
         bwIaIr7H9AvspxYO5Y66JPUsktxTtJXCpCyHK9BFbqXKNsPDbn1AReeqTmIgBBRdonHN
         2eGFV9s1VquDVoVj1NqakYJ5ulnCPMQgD5npdB5dHm+J7H+mZRb/ye7FFM1W8H8EjD0J
         0XTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348315; x=1713953115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTTnPcExIPXVMOJsvNhSJgOJAGir4DNBERxSySY7BqI=;
        b=XVuXmT/yIfUoLLYljp6wWikuku5j/NZCEvyPghDUnv28JeHQ2pJjvLfWXEGU5+k9v9
         g/0q6wY99xTcKmqZmksUOKSUrGWnuvzlm6rzIMJIP+Lhj2U5ZMAT0GwEFp4g9CGkNRSj
         ooxcuyOZOPTrOSbsJmyHBx7kltEDSySXc/uxhULg+xVQ/ciH0aUJZqzHAmeX9/txeXo3
         TwrW4U/ytu+7lFLKomoCDtbYgswCJE/8sndjOXJv9yElwN/0quweJZ/fjAQ6FdE7267V
         S+EpxDUXGYz+pvTdRCSRcNDuvFC9EPpEY3eyz75Zsdb5BIpxnx7shgGd3fvwSnpdyVpB
         ENNA==
X-Gm-Message-State: AOJu0YwamM81irV2+OHLGgyImUEoSvhivWjXwx14F2NUj9bM8GF7B5qy
	r0xvirpb+0Rnoh5owcv4ZvpEXVpzN0WqAS0vtADxVx7Hjpvmepc/enuAgw==
X-Google-Smtp-Source: AGHT+IEowFMMPwcEJRCxBbHM3xJnMthwLNTEQgVHATjwuA3Rrvu2bHHaJ4JbZyNcNvrzSQaWntRmpA==
X-Received: by 2002:a19:e017:0:b0:517:64ec:1251 with SMTP id x23-20020a19e017000000b0051764ec1251mr9376063lfg.15.1713348315243;
        Wed, 17 Apr 2024 03:05:15 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v8 09/17] xen/riscv: introduce monitor.h
Date: Wed, 17 Apr 2024 12:04:52 +0200
Message-ID: <d645cc9db82890cf3cfed9574b9a909169037b22.1713347222.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713347222.git.oleksii.kurochko@gmail.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4-V8:
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
2.44.0


