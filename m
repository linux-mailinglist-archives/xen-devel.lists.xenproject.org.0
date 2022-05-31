Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876CE538BCF
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 09:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339129.563978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvvzk-0001MW-AU; Tue, 31 May 2022 07:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339129.563978; Tue, 31 May 2022 07:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvvzj-0001FT-Uw; Tue, 31 May 2022 07:08:47 +0000
Received: by outflank-mailman (input) for mailman id 339129;
 Tue, 31 May 2022 06:58:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfOh=WH=gmail.com=xiexun162534@srs-se1.protection.inumbo.net>)
 id 1nvvph-00080v-IZ
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 06:58:25 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dfd4e5c-e0af-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 08:58:20 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so628041wms.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 23:58:24 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::944:e002])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a05600c4c1100b0039771fbffcasm1222368wmp.21.2022.05.30.23.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 23:58:24 -0700 (PDT)
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
X-Inumbo-ID: 0dfd4e5c-e0af-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xR88aQIK2zwu2ATjZh/yut3alhZFE53aCziDTvElipM=;
        b=e+fpZZdxcdgtkFmrHuonJoVhU1QO5uVLzNyppJdLUwvqOkkJ6rAkwKiEBpCxpCrstc
         xlMf9X3nj3n4Tf0VWvsinvl5lubDK+crb6a9D6jO6e/xywv87xBEiHaPY9GhJIEXQyqp
         btgY+6vCp/Y63Ya3sWM2YHHCNLPnHvnY8rqpviVljWZs95rq59oyVHf/v33NCelFwCGU
         g2CrBJ6AAn06tocKDmIcvY49B9jfaAqTbp5zmwJnViJl5bS/QwF5nKE/mo2dwOLm69tu
         PMq0/Mmv15gJFaLhfypUip9xq771NCi6H+GRwZfjoxt4NV3MIC+dV/1Sx1Fp3LeflGXy
         KAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xR88aQIK2zwu2ATjZh/yut3alhZFE53aCziDTvElipM=;
        b=tsnq2SwBKOQ1Sy+yyffY8rNHy9nM2Q1/1IQTaEbL758rs3KUHyvbxGoH1CVUe71lmF
         v7qtokzzY3KZDqU+KuZEfa3qJYwyRjB9Dc1owup3qmGjgdAxJdYKLYNicuE5ojAJAXRK
         ELuDtkHbk7/BLgcX+mfMjnp0lmpkxy1J1f370EBpcT/J/fvld1J9cp0Z2WjxNArra92v
         YZGX2D9icx8A1YWzoO7or6Ps4UtmUioAuZc5zKsVdJ8LZReVw85iMAjfsh1Va286my+m
         d3UmwMV6SYCNO8s1v37BouG63KA6ln8NsdlqLXDqSBPR+gaZ3MF3zdLdZEpI/j47p+LJ
         9J+g==
X-Gm-Message-State: AOAM530duEXJOJTJUE6YS9+q8TROKsgibt/ZY3HLn/pG/Ypnkl06pLXw
	TMU4xhPPzZyjqsAw6RiL80xRMF+2eWY=
X-Google-Smtp-Source: ABdhPJzpaCVD81IDg92fh2kKoJHqIQ6L1Nbta3AzK3lRcy2F9RO3vdQOsPzyIqWeXy0SQL3SNyD5uQ==
X-Received: by 2002:a05:600c:3583:b0:397:3d93:75b8 with SMTP id p3-20020a05600c358300b003973d9375b8mr21570409wmq.76.1653980304447;
        Mon, 30 May 2022 23:58:24 -0700 (PDT)
From: Xie Xun <xiexun162534@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xie Xun <xiexun162534@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [RFC PATCH 5/6] xen/riscv: Add early_printk
Date: Tue, 31 May 2022 14:57:11 +0800
Message-Id: <016c56548eee75c2b713ef90e4069690c0ae11cb.1653977696.git.xiexun162534@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1653977696.git.xiexun162534@gmail.com>
References: <cover.1653977696.git.xiexun162534@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Xie Xun <xiexun162534@gmail.com>
---
 xen/arch/riscv/Makefile                   |  1 +
 xen/arch/riscv/early_printk.c             | 48 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/early_printk.h | 10 +++++
 3 files changed, 59 insertions(+)
 create mode 100644 xen/arch/riscv/early_printk.c
 create mode 100644 xen/arch/riscv/include/asm/early_printk.h

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index c61349818f..f9abc8401b 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -3,6 +3,7 @@ obj-y += lib/
 obj-y   += domctl.o
 obj-y   += domain.o
 obj-y   += delay.o
+obj-y   += early_printk.o
 obj-y   += guestcopy.o
 obj-y   += irq.o
 obj-y   += p2m.o
diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
new file mode 100644
index 0000000000..81d69add01
--- /dev/null
+++ b/xen/arch/riscv/early_printk.c
@@ -0,0 +1,48 @@
+/*
+ * RISC-V early printk using SBI
+ *
+ * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
+ */
+#include <asm/sbi.h>
+#include <asm/early_printk.h>
+#include <xen/stdarg.h>
+#include <xen/lib.h>
+
+void _early_puts(const char *s, size_t nr)
+{
+    while ( nr-- > 0 )
+    {
+        if (*s == '\n')
+            sbi_console_putchar('\r');
+        sbi_console_putchar(*s);
+        s++;
+    }
+}
+
+static void vprintk_early(const char *prefix, const char *fmt, va_list args)
+{
+    char buf[128];
+    int sz;
+
+    early_puts(prefix);
+
+    sz = vscnprintf(buf, sizeof(buf), fmt, args);
+
+    if ( sz < 0 ) {
+        early_puts("(XEN) vprintk_early error\n");
+        return;
+    }
+
+    if ( sz == 0 )
+        return;
+
+    _early_puts(buf, sz);
+}
+
+void early_printk(const char *fmt, ...)
+{
+    va_list args;
+    va_start(args, fmt);
+    vprintk_early("(XEN) ", fmt, args);
+    va_end(args);
+}
diff --git a/xen/arch/riscv/include/asm/early_printk.h b/xen/arch/riscv/include/asm/early_printk.h
new file mode 100644
index 0000000000..0d9928b333
--- /dev/null
+++ b/xen/arch/riscv/include/asm/early_printk.h
@@ -0,0 +1,10 @@
+#ifndef __EARLY_PRINTK_H__
+#define __EARLY_PRINTK_H__
+
+#include <xen/string.h>
+
+#define early_puts(s) _early_puts((s), strlen((s)))
+void _early_puts(const char *s, size_t nr);
+void early_printk(const char *fmt, ...);
+
+#endif /* __EARLY_PRINTK_H__ */
-- 
2.30.2


