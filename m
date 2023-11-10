Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D28B07E7DD3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630622.983748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPX-0000ec-6u; Fri, 10 Nov 2023 16:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630622.983748; Fri, 10 Nov 2023 16:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPW-0000O2-Kg; Fri, 10 Nov 2023 16:31:10 +0000
Received: by outflank-mailman (input) for mailman id 630622;
 Fri, 10 Nov 2023 16:31:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPS-0005Bj-T5
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:31:06 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b61d7de-7fe6-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:31:05 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9be02fcf268so355703866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:31:05 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:31:03 -0800 (PST)
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
X-Inumbo-ID: 8b61d7de-7fe6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633864; x=1700238664; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMOphfLBRJJYVlhWz2+duw9NQxE7jG1sJ2FM+YdBhQQ=;
        b=SmPwGPMtiPUnN+Jg15DyZWXXDnizsYyhP9psbpHQudhu2qQS5bRI4VctU3w30I6VuJ
         aKj0c+pjcXOwR9LBCndDU0WD/GSLF9XGB7SYi+WUGJUf2J67bgBWOI09w67SFVTWeS4M
         X0mXe8GlMJ2qU3CjsG414z7kQRzaI76bZTVE4bxrHEFuLbl/uFPFBTJTNAPqErOnt8Z/
         +eR2Bvb5gwky3FLm14u1pYtz7Fqu6WKEUMGKWB/wDPQeBPcsTtCB7aWjr4bAvem2XsVm
         e+6lVwL8y7Vbkc7nESJ5Cx6NI3vbJM+T2D8NDe2SQbnyfsj1YAcRudzfX23oXP6esKu5
         coFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633864; x=1700238664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMOphfLBRJJYVlhWz2+duw9NQxE7jG1sJ2FM+YdBhQQ=;
        b=BQmlpglR1aM9K38N51sDeWx9lBNjaC7Saswu6cjZP/UhpDqWR4N38OoyS4qdhl0eky
         1qD3qYkOX1W/Iv9wzKnOtaph2xcpHFasusfxC37LgpvFr2kd6CM5WN3YC4tet9jJID38
         AXBnGQBG//p6fof+M3pdwLjfHid3L+UVAv3+oZla2aVyCxiKd3MGOGl3oGE1/tqoHHdS
         V5Y30OM+xH892Ej17dxK9yunOk7QHzj3XFUGZTcn1tGbmdU2McW9RKPX5jU4PsIotZdF
         DdFoi+1H6Xvwmngfj3CuQ4UvYIAM3Ry+fn299gEbA1mzzgYvhVpe3M7aBmRAKHG6Xg2C
         AyNw==
X-Gm-Message-State: AOJu0Yy5hZTgwbH7LJq0AxpQDCpCnpuBNoqaucCIW4hzXq15S/Hr50GS
	govMoaEuRAwyVnjXqtdgDrOpVp4p5ww=
X-Google-Smtp-Source: AGHT+IGzHIaBd8hlPXjto5H4KN2Er5FNkUP45DySj2Xrxj0AsDpkGLhsa1rt6UAfIZ9R1ih8fjuwgQ==
X-Received: by 2002:a17:906:dc94:b0:9d3:afe1:b3e5 with SMTP id cs20-20020a170906dc9400b009d3afe1b3e5mr7594471ejc.75.1699633864192;
        Fri, 10 Nov 2023 08:31:04 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v2 13/15] xen/asm-generic: introduce stub header monitor.h
Date: Fri, 10 Nov 2023 18:30:39 +0200
Message-ID: <9b40493df82b99904b2e4f6cf9dc8888db4a2a49.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header is shared between archs so it is moved to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
	- remove inclusion of "+#include <public/domctl.h>"
	- add "struct xen_domctl_monitor_op;"
	- remove one of SPDX tags.
---
 xen/include/asm-generic/monitor.h | 62 +++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 xen/include/asm-generic/monitor.h

diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-generic/monitor.h
new file mode 100644
index 0000000000..4e46f2e91a
--- /dev/null
+++ b/xen/include/asm-generic/monitor.h
@@ -0,0 +1,62 @@
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
+
+struct xen_domctl_monitor_op;
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
+    return 0;
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


