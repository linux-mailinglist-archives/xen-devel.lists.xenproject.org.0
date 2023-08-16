Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EF077DECC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584503.915386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpB-0006TA-1o; Wed, 16 Aug 2023 10:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584503.915386; Wed, 16 Aug 2023 10:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpA-0006OF-RN; Wed, 16 Aug 2023 10:32:24 +0000
Received: by outflank-mailman (input) for mailman id 584503;
 Wed, 16 Aug 2023 10:32:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDe7-0003RA-2L
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:59 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9233a5c8-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:49 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-313e742a787so3761072f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:49 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:48 -0700 (PDT)
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
X-Inumbo-ID: 9233a5c8-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181249; x=1692786049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhVaJsx3fNfOUNl1yWvqQESfQK08auimEtxKys9/b3Y=;
        b=JC4TPk81aLOd+hkh3iNe5mPl+BfBozxIY4YaIwhCRZO1hPY8+2e8AxgEWiWjsD3uU0
         N3WqZJb1TkdpcHVQVKUS8z4qhcvi4kIzUymxYb5teeXJjIz4ILxUw2Ros1Glb4/pGOYY
         hK59Gmi506ZlLxwZYUMYY/2BqVsV9ZvJhvobJ3fdw5yTfexoezNyHNRm7kTIS8/jlQlI
         NEDknAgYbvvEbSQ/RmUpl8mPJsPgoJRGjmuGFmB6ZxJot73SN9/Gx6BEhiGDBDUAadmq
         WKCZ3gC8nHVNNc3J0jvHqGgwXCCUEUvXPb1IypikqDzi/5pqIofKJJt6cjVMpkQJ0NEl
         yJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181249; x=1692786049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhVaJsx3fNfOUNl1yWvqQESfQK08auimEtxKys9/b3Y=;
        b=U7RFBsVWrGNyW9V78TATBEJcM41SWpDiWE73qBztkQ7WkauWuHHObCIQxsZoTelQRQ
         sTrXvCXlGOUqdjViQ4MEIkRJIJUY9r0aOOnGD9UNMkrOB6YbDKptyB2RycJsEnnrKd0c
         xq4xNXc7WTRQDADhMHiOpI5hipolshfAKeehcmUX3TxwCiYRlZZ6Q6j11FRqczEb5FG/
         NN1wzLpPIUFSgA6msycLUS8a0EU+nn3sJAw/m2m3fhKKXxuJpwpFguh8mOCDJW0EcnYl
         IN6BGzohyktHqtPlKUInu7tTYsovj5Chy9ePKVMKAp9bErpx+aGIl1K9UKVoZG0yFGCL
         WUfQ==
X-Gm-Message-State: AOJu0YwNOzCibTQ7OPq8YITdd1itb5ojXgTjYNkQ+IeAAVNydlabUZyN
	p4tZbNlZAs3ArspAvlIt76ELXwiCUQg8lsk9
X-Google-Smtp-Source: AGHT+IFfJtCy1Fkamcn0KSu66ACznZ978fDnS9ESdr67RY942n0wh7lTwCYMq0YFVJb/d/l3zXuN1Q==
X-Received: by 2002:adf:d0ce:0:b0:317:e68f:e1af with SMTP id z14-20020adfd0ce000000b00317e68fe1afmr3367939wrh.20.1692181248898;
        Wed, 16 Aug 2023 03:20:48 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 41/56] xxen/riscv: introduce asm/regs.h
Date: Wed, 16 Aug 2023 13:19:54 +0300
Message-ID: <55f14a7517b8b7492e3c91304a04c1811914bd12.1692166745.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692166745.git.oleksii.kurochko@gmail.com>
References: <cover.1692166745.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/regs.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/regs.h

diff --git a/xen/arch/riscv/include/asm/regs.h b/xen/arch/riscv/include/asm/regs.h
new file mode 100644
index 0000000000..33ae759a3e
--- /dev/null
+++ b/xen/arch/riscv/include/asm/regs.h
@@ -0,0 +1,27 @@
+#ifndef __ARM_RISCV_REGS_H__
+#define __ARM_RISCV_REGS_H__
+
+#ifndef __ASSEMBLY__
+
+#include <xen/lib.h>
+#include <asm/current.h>
+
+#define hyp_mode(r)     (0)
+
+static inline bool guest_mode(const struct cpu_user_regs *r)
+{
+    BUG();
+}
+
+#endif
+
+
+#endif /* __ARM_RISCV_REGS_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


